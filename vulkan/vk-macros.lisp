;; Copyright 2019 Andrew Kenneth Wolven <awolven@gmail.com>
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(in-package :cvk)

(defmacro defvkinstextfun ((cname lname) result-type &body args)
  (let ((instance-arg (gensym "INSTANCE")))
    `(defun ,lname (,instance-arg ,@(mapcar 'car args))
       (cffi:foreign-funcall-pointer
        (cffi:with-foreign-string (p-native ,cname)
           (VkGetInstanceProcAddr ,instance-arg p-native))
        nil
        ,@(loop for arg in args
           collect (second arg) collect (first arg))
        ,result-type))))

(defmacro defvkdevextfun ((cname lname) result-type &body args)
  (let ((device-arg (gensym "DEVICE")))
    `(defun ,lname (,device-arg ,@(mapcar 'car args))
       (cffi:foreign-funcall-pointer
        (cffi:with-foreign-string (p-native ,cname)
           (VkGetDeviceProcAddr ,device-arg p-native))
        nil
        ,@(loop for arg in args
           collect (second arg) collect (first arg))
        ,result-type))))


;; Assigns the value 0 to all slots of p
;; (defun zero-struct (p type &optional (count 1))
;;   (loop for i from 0 below (* count (cffi:foreign-type-size type))
;;      do (setf (cffi:mem-aref p :unsigned-char i) 0))
;;   (values))

;; memset from C standard library (parece ser que puede dar problemas, mejor usar zero-struct)
(cffi:defcfun "memset" :pointer
  (str :pointer) (c :int) (n :size))


;; Creates an integer representing an vulkan version
(defmacro make-version (major minor patch)
  `(logior (ash ,major 22) (ash ,minor 12) ,patch))


;; Defines a with macro named name, using a constructor and a destructor
;; The constructor can receive zero or more arguments and can return one or more values
;; The destructor must receive 'destructor-arity' arguments. These arguments are the first values the constructor returns
;; The resulting macro binds some vars to the results from the constructor. These vars can be fewer than the returned values
(defmacro defwith (name create destroy &key (destructor-arity 1))
  (with-gensyms ((var "var") (var-list "var-list") (args "args") (ret-list "ret-list") (body "body"))
    `(defmacro ,name (,var ,args &body ,body)
       (with-gensyms ((,ret-list "ret-list"))
         (let ((,var-list (if (listp ,var)
                              ,var
                              (list ,var))))
           `(let ((,,ret-list (multiple-value-list (,',create ,@,args))))
              (unwind-protect
                (multiple-value-bind ,,var-list (values-list ,,ret-list)
                  ,@,body)
                (apply #',',destroy (subseq ,,ret-list 0 ,',destructor-arity)))))))))


;; Allocates an object and initialize all its members to zero.
(defun alloc-vulkan-object (struct-type &optional (count 1))
  (let ((object-ptr (cffi:foreign-alloc struct-type :count count)))
    (memset object-ptr 0 (* (cffi:foreign-type-size struct-type) count))
    (values object-ptr)))

;; Deallocates an object
(defun free-vulkan-object (object-ptr)
  (cffi:foreign-free object-ptr))

;; with-vulkan-object macro
(defwith with-vulkan-object
         alloc-vulkan-object
         free-vulkan-object)


;; Works like a let, but accepts macros whose last expression must be a body or forms* expression.
;; This allows to avoid deep indentation.
(defmacro nest (clauses &body body)
  (first (reduce (lambda (c d) (list (append c d))) clauses :from-end t :initial-value body)))


;; Defines a foreign struct slot accessor
;; If no body expressions provided, the returned value is the slot value itself
;; Otherwise, the last evaluated body expression is returned
(defmacro def-foreign-slot-accesor (accesor-name slot-name type &body body)
  (let ((arg (gensym)))
    `(defun ,accessor-name (,arg)
       (cffi:with-foreign-slots ((,slot-name) ,arg type)
	 ,@(if (null body)
	       (list slot-name)
	       body)))))


;; Defines a bunch of foreign accessors
;; Each expression in slot-accessor have tho form (slot-name {expr}*)
;; If no expressions are provided after slot-name, the accessor just return the slot-value
;; Otherwise, the last evaluated expression is returned by the accessor
(defmacro def-foreign-accessors (prefix type &rest slot-accessors)
  `(progn ,@(loop for slot-accessor in slot-accessors
		  collect (if (symbol slot-accessor)
			      `(def-foreign-slot-accessor
				   ,(intern (concatenate 'string (string prefix) "-" slot-accessor))
				   ,slot-accessor
				   ,type)
			      `(def-foreign-slot-accessor
				   ,(intern (concatenate 'string (string prefix) "-" (first slot-accessor)))
				   ,(first slot-accessor)
				   ,type
				   ,@(cdr slot-accessor))))))


;; Substitute every ocurrence of the symbol old with the symbol neweach symbol in assoc-symbol by the
;; its associated symbol
(defun rec-substitute (l assoc-symbols)
  (cond
    ((and (symbolp l) (member l assoc-symbols)) (getf assoc-symbols l))
    ((consp l) (cons (rec-substitute (car l) old new) (rec-substitute (cdr l) old new)))
    (t l)))

;; Returns the list of symbols from slot-names that appear in expr
(defun find-slot-names (slot-names expr)
  (flet ((find-slot-names-aux (names l names-found)
	   (cond
             ((and (symbolp l) (member l names)) (adjoin l names-found))
             ((consp l) (find-slot-names-aux names (cdr l) (find-slot-names-aux names (car l) names-found)))
             (t names-found))))
    (find-slot-names-aux slot-names expr nil)))

;; Defines a constructor, a destructor and a with macro for some struct type.
;; suffix is the suffix of the constructor, destructor and with macro. The added prefixes are
;; "create-", "destroy-", and "with-" respectively.
;; Each slot-descriptor must one of the following options:
;;  - slot-name: The constructor receives an argument with the keyword ":slot-name".
;;  - (slot-name): Same as the previous option.
;;  - ((slot-name init-value)): Same as the previous, but with an initial value init-value.
;;  - (slot-name constructor-expr): The constructor-expr is a lisp to foreign traslation for the slot
;;                                  slot-name. You can use all the slot-names used in the macro, but
;;                                  only that slot-names (The structure may have more slots than the
;;                                  used in the macro).
;;  - (slot-name constructor-expr destructor-expr): The destructor-expr should perform some operations
;;                                                  on the slot to assure that the destructor dealloc correctly
;;                                                  the structure. This expression can use all the slots from
;;                                                  the structure.
(defmacro def-foreign-constructor-destructor (suffix type &rest slot-descriptors)
  (let* ((slot-names (cffi:foreign-slot-names type))
	 (slot-keys  (loop for name in slot-names collect (intern (concatenate ":" (string name)))))
	 (slot-args  (mapcar (lambda (x) (gensym (string x))) slot-names))
	 (slot-assoc-names (append (mapcar #'list slot-names slot-args))))
    (iter (for descriptor in slot-descriptors)
	  (if (symbolp descriptor)
	      (progn
		(collect descriptor into used-slots)
		(collect (getf descriptor slot-assoc-names) into c-slots))
	      (progn
		(if (symbolp (car descriptor))
		    (progn
		      (collect (car descriptor) into used-slots)
		      (collect (list (list (getf (car descriptor) slot-keys)
					   (getf (car descriptor) slot-args))) into constructor-args))
		    (progn
		      (collect (caar descriptor) into used-slots)
		      (collect (list (list (getf (caar descriptor) slot-keys)
					   (getf (caar descriptor) slot-args)) (cadar descriptor))
			into constructor-args)))
		(if (not (null (cdr descriptor)))
		  (progn
		    (let ((c-symbol (gensym (car descriptor))))
		      (collect (list c-symbol
				     (rec-substitute (cadr descriptor) slot-assoc-names)) into let-bindings)
		      (collect c-symbol into c-slots))
		    (if (not (null (cddr descriptor)))
			(progn
			  (collect (caddr descriptor) into destructor-expressions)
			  (unioning (find-slot-names slot-names (caddr descriptor))
				    into destructor-used-slots))))
		  (collect (getf (car descriptor) slot-assoc-names) into c-slots))))
	  (finally (let ((struct-object (gensym)))
		     `(progn
		        (defun ,(intern (concatenate "create-" (string suffix))) (&key ,@constructor-args)
			  (let (,@let-bindings
			        (,struct-object (cffi:alloc-vulkan-object ',type)))
			    (cffi:with-foreign-slots (,used-slots ,struct-object ,type)
			      (setf ,@(concatenate (mapcar #'list used-slots c-slots))))
			    (values ,struct-object)))
			(defun ,(intern (concatenate "destroy-" (string suffix))) (,struct-object)
			  (cffi:with-foreign-slots (,destructor-used-slots ,struct-object ,type)
			    ,@destructor-expressions)
			  (cffi:free-vulkan-object ,struct-object))
			(defwith ,(intern (concatenate "with-" (string suffix)))
			    ,(intern (concatenate "create-" (string suffix)))
			    ,(intern (concatenate "destroy-" (string suffix))))))))))
