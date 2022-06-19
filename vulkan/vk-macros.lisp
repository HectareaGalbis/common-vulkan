
(in-package :cvk)


;; memset from C standard library (parece ser que puede dar problemas, mejor usar zero-struct)
(cffi:defcfun "memset" :pointer
  (str :pointer) (c :int) (n :size))


;; Creates an integer representing an vulkan version
(defmacro make-version (major minor patch)
  `(logior (ash ,major 22) (ash ,minor 12) ,patch))


;; Defines a with macro named name, using a constructor and a destructor
;; The constructor can receive zero or more arguments and can return one or more values
;; The destructor must receive 'destructor-arity' arguments. These arguments are the first values the
;; constructor returns
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
