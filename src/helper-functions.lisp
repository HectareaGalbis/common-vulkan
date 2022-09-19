
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/helper-functions.md"))


  (mcffi:def-lisp-function doc-file create-spv-code (file)
    "Read a spv file and return the code from it and the size of the code."
    (declare-types ("pathname designator" file) :return ("spv code" code) ("uint" size))
    (with-open-file (stream file :direction :input :element-type '(unsigned-byte 8))
      (let ((buffer (make-array 1024 :element-type '(unsigned-byte 8) :fill-pointer 0 :adjustable t)))
	(loop for byte = (read-byte stream nil)
	      while byte
	      do (vector-push-extend byte buffer))
	(let ((code (cffi:foreign-alloc :uint8 :initial-contents buffer)))
	  (values code (fill-pointer buffer))))))

  (mcffi:doc-note doc-file "The code must be freed by `destroy-spv-code`.")


  (mcffi:def-lisp-function doc-file destroy-spv-code (code)
    "Destroy the spv code created by `create-spv-code`."
    (declare-types ("spv code" code))
    (cffi:foreign-free code))


  (mcffi:defwith doc-file with-spv-code
    create-spv-code
    destroy-spv-code)


  (defparameter primitive-types '(:char :unsigned-char :short :unsigned-short :int :unsigned-int
				  :long :unsigned-long :long-long :unsigned-long-long
				  :uchar :ushort :uint :ulong :llong :ullong
				  :int8 :uint8 :int16 :uint16 :int32 :uint32 :int64 :uint64
				  :size :ssize :intptr :uintptr :ptrdiff :offset :float :double))
  
  
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
      (unless (member (cadr slot) primitive-types)
	(error "The type ~s is not accepted." (cadr slot)))
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
    (let* ((keyword-args (iter (for name in names) (collect (intern (symbol-name name) "KEYWORD"))))
	   (names-args (iter (for name in names) (collect (gensym (symbol-name name)))))
	   (suppliedp-args (iter (for suppliedp-arg in names) (collect (gensym (symbol-name suppliedp-arg)))))
	   (args (iter
		  (for keyword-arg in keyword-args)
		  (for name-arg in names-args)
		  (for suppliedp-arg in suppliedp-args)
		  (collect `((,keyword-arg ,name-arg) 0 ,suppliedp-arg))))
	   (i-sym (gensym "I"))
	   (name-arg-elem (gensym "name-arg-elem"))
	   (setf-exprs (iter
			(for name in names)
			(for type in types)
			(for count in counts)
			(for name-arg in names-args)
			(for suppliedp-arg in suppliedp-args)
			(collect `(when ,suppliedp-arg
				    ,(if (> count 1)
					 `(iter (for ,i-sym from 0 below ,count)
					        (for ,name-arg-elem in ,name-arg)
						(setf (cffi:mem-aref ,name ,type ,i-sym) ,name-arg-elem))
					 `(setf ,name ,name-arg))))))
	   (object-sym (gensym)))
      `(defun ,(intern (concatenate 'string "CREATE-" (symbol-name struct-name))) (&key ,@args)
	 (let ((,object-sym (cffi:foreign-alloc '(:struct ,struct-name))))
	   (mcffi:memset ,object-sym 0 (cffi:foreign-type-size '(:struct ,struct-name)))
	   (cffi:with-foreign-slots (,names ,object-sym (:struct ,struct-name))
	     ,@setf-exprs)
	   (values ,object-sym)))))

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
				 (collect (cffi:mem-aref ,name ,type ,i-sym)))))))))))

  (defun create-set-code (struct-name names types counts)
    (let ((object-sym (gensym))
	  (index-sym (gensym))
	  (new-val-sym (gensym))
	  (i-sym (gensym))
	  (new-val-elem (gensym)))
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
				 (for ,new-val-elem in ,new-val-sym)
				 (setf (cffi:mem-aref ,name '(:struct ,struct-name) ,i-sym) ,new-val-elem))))))))))
  
  (mcffi:def-lisp-macro doc-file def-vulkan-struct (name &body slots)
    "Define a struct named `name`. Each member slot follows the syntax `(member-name member-type [:count count])`.
When `:count` is used the member will be an array of `count` elements. The possible types are: `:bool`, `:int`, `:uint`, `:float` and `:double`.
The struct will have its own constructor and destructor with names `create-name` and `destroy-name` respectively. Accessors are also defined
with the names `name-member-name`. For example: If the struct is named `vertex` and it has a member named `x` the accessor `vertex-x` will be
defined. If the member is an array because `:count` was used the accessor will accept an optional argument indicating the index of the element you
want to retrieve from. The accessors are `setf`-able. Also, a `with-name` macro is defined from the constructor and the destructor."
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
  

  (mcffi:def-lisp-function doc-file sizeof (type)
    "Return the size in bytes of a type. `type` is the symbol that denotes type."
    (declare-types (symbol type) :return (integer size))
    (if (member type primitive-types)
	(cffi:foreign-type-size type)
	(cffi:foreign-type-size (list :struct type))))
  (export 'sizeof)


  (mcffi:def-lisp-function doc-file offsetof (type slot)
    "Return the offset in bytes of a member of the struct `type`. `slot` must be a symbol denoting the member."
    (declare-types (symbol type slot) :return (integer offset))
    (cffi:foreign-slot-offset (list :struct type) slot))
  (export 'vulkan-struct-offset)


  (mcffi:def-lisp-function doc-file memcpy (dst dst-type src src-type &optional (size nil))
    "Copy the contents from src to dst. `dst` can be a value of type `dst-type` or a list of `dst-type` elements.
In the same way, `src` can be a value of type `src-type` or a list of `src-type` elements. When `:pointer` is used
as a type the respectively value must be a pointer to C data. If `dst-type` and `src-type` are not `:pointer` the size
of copied data is the minimum of the size of `dst` and `src` data. If some of them is `:pointer` then the size is
determined by the other value and its type. If both are `:pointer` the size must be specified with `size`.
The possible types are: `:pointer`, `:bool`, `:int`, `:uint`, `:float` and `:double`."
    (declare-types ((or pointer int boolean integer float double "Vulkan struct" list) dst src) ((or primitive-type :pointer) dst-type src-type) (integer size))
    (unless (if (and (eq dst-type :pointer)
		     (eq src-type :pointer)
		     (not (listp dst))
		     (not (listp src)))
		size
		t)
      (error "If dst and src are of type :pointer, size must be specified."))
    (let* ((accepted-types (cons :pointer primitive-types)))
      (flet ((memory-alloc (lisp-obj type)
	       (if (listp lisp-obj)
		   (let ((list-length (length lisp-obj)))
		     (if (member type accepted-types)
			 (let ((c-obj (cffi:foreign-alloc type :initial-contents lisp-obj))
			       (c-size (* list-length (cffi:foreign-type-size type))))
			   (values c-obj c-size t))
			 (let ((c-obj (cffi:foreign-alloc (list :struct type) :count list-length))
			       (c-size (* list-length (cffi:foreign-type-size `(:struct ,type)))))
			   (iter
			    (for i from 0 below list-length)
			    (for elem in lisp-obj)
			    (mcffi:memcpy (cffi:mem-aptr c-obj `(:struct ,type) i) elem (cffi:foreign-type-size `(:struct ,type))))
			   (values c-obj c-size t))))
		   (if (member type primitive-types)
		       (let ((c-obj (cffi:foreign-alloc type :initial-element lisp-obj))
			     (size (cffi:foreign-type-size type)))
			 (values c-obj size t))
		       (values lisp-obj nil nil)))))
	(multiple-value-bind (dst-c dst-size dst-allocated) (memory-alloc dst dst-type)
	  (multiple-value-bind (src-c src-size src-allocated) (memory-alloc src src-type)
	    (let ((size-c (or size
			      (and dst-size src-size (min dst-size src-size))
			      dst-size
			      src-size)))
	      (mcffi:memcpy dst-c src-c size-c)
	      (when dst-allocated
		(cffi:foreign-free dst-c))
	      (when src-allocated
		(cffi:foreign-free src-c))))))))
  (export 'memcpy))
