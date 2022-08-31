
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/helper-functions.md"))


  (mcffi:def-foreign-function doc-file (create-spv-code create-spv-code) (file)
    (declare-types ("pathname designator" file) :return ("spv code" code) ("uint" size))
    (with-open-file (stream file :direction :input :element-type '(unsigned-byte 8))
      (let ((buffer (make-array 1024 :element-type '(unsigned-byte 8) :fill-pointer 0 :adjustable t)))
	(loop for byte = (read-byte stream nil)
	      while byte
	      do (vector-push-extend byte buffer))
	(let ((code (cffi:foreign-alloc :uint8 :initial-contents buffer)))
	  (values code (fill-pointer buffer))))))


  (mcffi:def-foreign-function doc-file (nil destroy-spv-code) (code)
    (declare-types ("spv code" code))
    (cffi:foreign-free code))


  (mcffi:defwith doc-file with-spv-code
    create-spv-code
    destroy-spv-code)

  
  (defun check-vulkan-struct-name (name)
    (unless (symbolp name)
      (error "Expected a symbol. Found: ~s" name)))

  (defun check-vulkan-struct-slot (slot)
    (let ((slot-length (length slot)))
      (unless (and (listp slot)
		   (>= slot-length 2))
	(error "Expected a list of at least two elements. Found: ~s" slot))
      (unless (symbolp (car slot))
	(error "Expected a symbol at the start of ~s" slot))
      (let ((accepted-types '(:bool :int :uint :float :double)))
	(unless (member (cadr slot) accepted-types)
	  (error "The type ~s is not accepted." (cadr slot))))
      (when (>= slot-length 3)
	(unless (eq (caddr slot) :count)
	  (error "Expected the keyword :count as third element. Found: ~s" (caddr slot)))
	(unless (= slot-length 4)
	  (error "Expected a number after :count. Found nothing."))
	(unless (typep (cadddr slot) 'integer)
	  (error "Expected an integer after :count. Found ~s" (cadddr slot))))))
  
  (defun check-vulkan-struct-slots (slots)
    (iter (for slot in slots)
      (check-vulkan-struct-slot slot)))

  (defun create-constructor-code (struct-name names types counts)
    (let* ((names-args (iter (for name in names) (collect (gensym (symbol-name name)))))
	   (suppliedp-args (iter (for suppliedp-arg in names) (collect (gensym (symbol-name suppliedp-arg)))))
	   (args (iter
		   (for name-arg in names-args)
		   (for suppliedp-arg in suppliedp-args)
		   (collect `(,name-arg 0 ,suppliedp-arg))))
	   (i-sym (gensym "I"))
	   (setf-exprs (iter
			 (for name in names)
			 (for type in types)
			 (for count in counts)
			 (for name-arg in names-args)
			 (for suppliedp-arg in suppliedp-args)
			 (collect `(when ,suppliedp-arg
				     ,(if (> count 1)
					  `(iter (for ,i-sym from 0 below ,count)
					     (setf (cffi:mem-aref ,name ,type ,i-sym) (aref ,name-arg ,i-sym)))
					  `(setf ,name ,name-arg))))))
	   (object-sym (gensym)))
      `(defun ,(intern (concatenate 'string "CREATE-" (symbol-name struct-name))) (&key ,@args)
	 (let ((,object-sym (cffi:foreign-alloc '(:struct ,struct-name))))
	   (mcffi:memset ,object-sym 0 (cffi:foreign-type-size '(:struct ,struct-name)))
	   (cffi:with-foreign-slots (,names ,object-sym (:struct ,struct-name))
	     ,@setf-exprs)))))

  (defun create-destructor-code (struct-name)
    (let ((object-sym (gensym)))
      `(defun ,(intern (concatenate 'string "DESTROY-" (symbol-name struct-name))) (,object-sym)
	 (cffi:foreign-free ,object-sym))))

  (defun create-with-code (struct-name)
    `(mcffi:defwith nil ,(intern (concatenate 'string "WITH-" (symbol-name struct-name)))
       ,(intern (concatenate 'string "CREATE-" (symbol-name struct-name)))
       ,(intern (concatenate 'string "DESTROY-" (symbol-name struct-name)))))

  (defun create-get-code (struct-name names types counts)
    (let ((object-sym (gensym))
	  (index-sym (gensym))
	  (i-sym (gensym)))
      (iter
	(for name in names)
	(for type in types)
	(for count in counts)
	(let* ((arg `(,object-sym ,@(when (> count 1)
				      `(&optional (,index-sym nil))))))
	  (collect `(defun ,(intern (concatenate 'string (symbol-name struct-name) "-" (symbol-name name))) ,arg
		      (cffi:with-foreign-slots ((,name) ,object-sym (:struct ,struct-name))
			(if ,index-sym
			    (cffi:mem-aref ,name ,type ,index-sym)
			    (iter (for ,i-sym from 0 below ,count)
			      (collect (cffi:mem-aref ,name '(:struct ,struct-name) ,i-sym)))))))))))

  (defun create-set-code (struct-name names types counts)
    (let ((object-sym (gensym))
	  (index-sym (gensym))
	  (new-val-sym (gensym))
	  (i-sym (gensym)))
      (iter
	(for name in names)
	(for type in types)
	(for count in counts)
	(let* ((arg `(,new-val-sym ,object-sym ,@(when (> count 1)
				      `(&optional (,index-sym nil))))))
	  (collect `(defun (setf ,(intern (concatenate 'string (symbol-name struct-name) "-" (symbol-name name)))) ,arg
		      (cffi:with-foreign-slots ((,name) ,object-sym (:struct ,struct-name))
			(if ,index-sym
			    (setf (cffi:mem-aref ,name ,type ,index-sym) ,new-val-sym)
			    (iter (for ,i-sym from 0 below ,count)
			      (setf (cffi:mem-aref ,name '(:struct ,struct-name) ,i-sym) (aref ,new-val-sym ,i-sym)))))))))))
  
  (defmacro def-vulkan-struct (name &body slots)
    (check-vulkan-struct-name name)
    (check-vulkan-struct-slots slots)
    (let ((slot-names (mapcar #'car slots))
	  (slot-types (mapcar #'cadr slots))
	  (slot-counts (mapcar (lambda (x) (if (member :count x)
					       (cadddr x)
					       1))
			       slots)))
      `(progn
	 (cffi:defcstruct ,name
	   ,@slots)
	 ,(create-constructor-code name slot-names slot-types slot-counts)
	 ,(create-destructor-code name)
	 ,(create-with-code name)
	 ,@(create-get-code name slot-names slot-types slot-counts)
	 ,@(create-set-code name slot-names slot-types slot-counts))))
  (export 'def-vulkan-struct)


  (defun vulkan-struct-size (type)
    (cffi:foreign-type-size (list :struct type)))
  (export 'vulkan-struct-size)


  (defun vulkan-struct-offset (type slot)
    (cffi:foreign-slot-offset (list :struct type) slot))
  (export 'vulkan-struct-offset))
