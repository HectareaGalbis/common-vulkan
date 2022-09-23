
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


  (defparameter complex-types '(:ivec2 :ivec3 :ivec4
				:uvec2 :uvec3 :uvec4
				:vec2 :vec3 :vec4
				:dvec2 :dvec3 :dvec4
				:mat2x2 :mat2x3 :mat2x4 :mat2
				:mat3x2 :mat3x3 :mat3x4 :mat3
				:mat4x2 :mat4x3 :mat4x4 :mat4
				:dmat2x2 :dmat2x3 :dmat2x4 :dmat2
				:dmat3x2 :dmat3x3 :dmat3x4 :dmat3
				:dmat4x2 :dmat4x3 :dmat4x4 :dmat4))


  (defparameter complex-to-primitive '(:ivec2 (:int 2) :ivec3 (:int 3) :ivec4 (:int 4)
				       :uvec2 (:uint 2) :uvec3 (:uint 3) :uvec4 (:uint 4)
				       :vec2 (:float 2) :vec3 (:float 3) :vec4 (:float 4)
				       :dvec2 (:double 2) :dvec3 (:double 3) :dvec4 (:double 4)
				       :mat2x2 (:float 2 2) :mat2x3 (:float 2 3) :mat2x4 (:float 2 4) :mat2 (:float 2 2)
				       :mat3x2 (:float 3 2) :mat3x3 (:float 3 3) :mat3x4 (:float 3 4) :mat3 (:float 3 3)
				       :mat4x2 (:float 4 2) :mat4x3 (:float 4 3) :mat4x4 (:float 4 4) :mat4 (:float 4 4)
				       :dmat2x2 (:double 2 2) :dmat2x3 (:double 2 3) :dmat2x4 (:double 2 4) :dmat2 (:double 2 2)
				       :dmat3x2 (:double 3 2) :dmat3x3 (:double 3 3) :dmat3x4 (:double 3 4) :dmat3 (:double 3 3)
				       :dmat4x2 (:double 4 2) :dmat4x3 (:double 4 3) :dmat4x4 (:double 4 4) :dmat4 (:double 4 4)))
  
  
  (defun check-vulkan-struct-name (name)
    (if (listp name)
	(progn
	  (unless (let ((name-length (length name)))
		    (or (= name-length 1)
			(= name-length 3)))
	    (error "Expected a list with a name and optionally a :size argument. Found: ~s" name))
	  (unless (symbolp (car name))
	    (error "Expected a symbol. Found: ~s" (car name)))
	  (when (= (length name) 3)
	    (unless (eq (cadr name) :size)
	      (error "Expected the keyword :size. Found: ~s" (cadr name)))
	    (unless (and (integerp (caddr name))
			 (> (caddr name) 0))
	      (error "Expected a positive integer after :size. Found: ~s" (caddr name)))))
	(unless (symbolp name)
	  (error "Expected a symbol. Found: ~s" name))))

  (defun check-vulkan-struct-slot (slot)
    (let ((slot-length (length slot)))
      (unless (and (listp slot)
		   (>= slot-length 2))
	(error "Expected a list of at least two elements. Found: ~s" slot))
      (unless (symbolp (car slot))
	(error "Expected a symbol at the start of ~s" slot))
      (unless (and (symbolp (cadr slot))
		   (when (keywordp (cadr slot))
		     (or (member (cadr slot) primitive-types)
			 (member (cadr slot) complex-types))))
	(error "Expected a type. Found: ~s." (cadr slot)))
      (iter (for rest-slot on (cddr slot) by #'cddr)
	(unless (member (car rest-slot) '(:count :offset))
	  (error "Expected :count or :offset keywords. Found: ~s" (car rest-slot)))
	(cond
	  ((eq (car rest-slot) :offset)
	   (unless (and (integerp (cadr rest-slot))
			(> (cadr rest-slot) 0))
	     (error "Expected a positive integer after keyword. Found: ~s" (cadr rest-slot))))
	  ((eq (car rest-slot) :count)
	   (unless (or (and (integerp (cadr rest-slot))
			    (> (cadr rest-slot) 0))
		       (and (listp (cadr rest-slot))
			    (iter (for elem in (cadr rest-slot))
			      (always (> elem 0)))))))))))
  
  (defun check-vulkan-struct-slots (slots)
    (iter (for slot in slots)
      (check-vulkan-struct-slot slot)))

  (defun convert-to-c-slot (slot)
    (let ((name (car slot))
	  (type (cadr slot)))
      (if (member type complex-types)
	  (let ((old-count (getf slot :count)) ; old-count can be nil (and it is ok)
		(offset (getf slot :offset)))
	    (destructuring-bind (new-type &rest new-count) (getf complex-to-primitive type)
	      `(,name ,new-type
		      ,@(when offset
			  `(:offset ,offset))
		      :count ,(apply #'* (if (listp old-count)
					     (append old-count new-count)
					     (cons old-count new-count))))))
	  (let ((count (getf slot :count)))
	    (when (and count
		       (listp count))
	      (setf (getf slot :count) (apply #'* count)))
	    slot))))
  
  (defun convert-to-primitive-slot (slot)
    (let ((name (car slot))
	  (type (cadr slot)))
      (if (member type complex-types)
	  (let ((old-count (getf slot :count)) ; old-count can be nil (and it is ok)
		(offset (getf slot :offset)))
	    (destructuring-bind (new-type &rest new-count) (getf complex-to-primitive type)
	      `(,name ,new-type
		      ,@(when offset
			  `(:offset ,offset))
		      :count ,(if (listp old-count)
				  (append old-count new-count)
				  (cons old-count new-count)))))
	  slot)))

  (defun vulkan-struct-get-values (type structp counts indices arr accum-index)
    (let ((multiplier (apply #'* (cdr counts))))
      (if indices
	  (vulkan-struct-get-values type structp (cdr counts) (cdr indices) arr (+ accum-index (* multiplier (car indices))))
	  (if counts
	      (iter (for i from 0 below (car counts))
		(collect (vulkan-struct-get-values type structp (cdr counts) nil arr (+ accum-index (* multiplier i)))))
	      (if structp
		  (cffi:mem-aptr arr type accum-index)
		  (cffi:mem-aref arr type accum-index))))))

  (defun (setf vulkan-struct-get-values) (new-value type structp counts indices arr accum-index)
    (let ((multiplier (apply #'* (cdr counts))))
      (if indices
	  (setf (vulkan-struct-get-values type structp (cdr counts) (cdr indices) arr (+ accum-index (* multiplier (car indices)))) new-value)
	  (if counts
	      (iter (for i from 0 below (car counts))
		(for new-subvalue in new-value)
		(setf (vulkan-struct-get-values type structp (cdr counts) nil arr (+ accum-index (* multiplier i))) new-subvalue))
	      (if structp
		  (mcffi:memcpy (cffi:mem-aptr arr type accum-index) new-value (cffi:foreign-type-size type))
		  (setf (cffi:mem-aref arr type accum-index) new-value))))))
  
  (defun create-constructor-code (struct-name names types counts)
    (let* ((keyword-args (iter (for name in names) (collect (intern (symbol-name name) "KEYWORD"))))
	   (names-args (iter (for name in names) (collect (gensym (symbol-name name)))))
	   (suppliedp-args (iter (for suppliedp-arg in names) (collect (gensym (symbol-name suppliedp-arg)))))
	   (object-sym (gensym))
	   (args (iter
		   (for keyword-arg in keyword-args)
		   (for name-arg in names-args)
		   (for suppliedp-arg in suppliedp-args)
		   (collect `((,keyword-arg ,name-arg) 0 ,suppliedp-arg))))
	   (setf-exprs (iter
			 (for name in names)
			 (for type in types)
			 (for count in counts)
			 (for name-arg in names-args)
			 (for suppliedp-arg in suppliedp-args)
			 (collect (let ((singlep (not (or (cdr count) (> (car count) 1))))
					(structp (not (or (member type primitive-types)
							  (member type complex-types)))))
				    `(when ,suppliedp-arg
				       ,(if singlep
					    (if structp
						`(mcffi:memcpy (cffi:foreign-slot-pointer ,object-sym '(:struct ,struct-name) ',name) ,name-arg ,(cffi:foreign-type-size type))
						`(setf (cffi:foreign-slot-value ,object-sym '(:struct ,struct-name) ',name) ,name-arg))
					    `(setf (vulkan-struct-get-values ,(if structp
										  `(:struct ,type)
										  type)
									     ,structp ',count nil
									     (cffi:foreign-slot-value ,object-sym '(:struct ,struct-name) ',name)
									     0)
						   ,name-arg))))))))
      `(defun ,(intern (concatenate 'string "CREATE-" (symbol-name struct-name))) (&key ,@args)
	 (let ((,object-sym (cffi:foreign-alloc '(:struct ,struct-name))))
	   (mcffi:memset ,object-sym 0 (cffi:foreign-type-size '(:struct ,struct-name)))
	   ,@setf-exprs
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
    (let ((object-sym (gensym)))
      (iter
	(for name in names)
	(for type in types)
	(for count in counts)
	(let* ((singlep (not (or (cdr count) (> (car count) 1))))
	       (structp (not (or (member type primitive-types)
				 (member type complex-types))))
	       (index-syms (loop repeat (length count) collect (gensym)))
	       (arg `(,object-sym ,@(when (not singlep)
				     `(&optional ,@index-syms)))))
	  (collect `(defun ,(intern (concatenate 'string (symbol-name struct-name) "-" (symbol-name name))) ,arg
		      ,(if singlep
			   (if structp
			       `(cffi:foreign-slot-pointer ,object-sym '(:struct ,struct-name) ',name)
			       `(cffi:foreign-slot-value ,object-sym '(:struct ,struct-name) ',name))
			   `(vulkan-struct-get-values ,(if structp
							   `(:struct ,type)
							   type)
						      ,structp ',count (iter (for index in (list ,@index-syms))
									 (while index)
									 (collect index))
						      (cffi:foreign-slot-value ,object-sym '(:struct ,struct-name) ',name)
						      0))))))))

  (defun create-set-code (struct-name names types counts)
    (let ((object-sym (gensym))
	  (new-val-sym (gensym)))
      (iter
       (for name in names)
       (for type in types)
       (for count in counts)
	(let* ((singlep (not (or (cdr count) (> (car count) 1))))
	       (structp (not (or (member type primitive-types)
				 (member type complex-types))))
	       (index-syms (loop repeat (length count) collect (gensym)))
	       (arg `(,new-val-sym ,object-sym ,@(when (not singlep)
						  `(&optional ,@index-syms)))))
	 (collect `(defun (setf ,(intern (concatenate 'string (symbol-name struct-name) "-" (symbol-name name)))) ,arg
		     ,(if singlep
			  (if structp
			      `(mcffi:memcpy (cffi:foreign-slot-pointer ,object-sym '(:struct ,struct-name) ',name) ,new-val-sym ,(cffi:foreign-type-size `(:struct ,type)))
			      `(setf (cffi:foreign-slot-value ,object-sym '(:struct ,struct-name) ',name) ,new-val-sym))
			  `(setf (vulkan-struct-get-values ,(if structp
								`(:struct ,type)
								type)
							   ,structp ',count (iter (for index in (list ,@index-syms))
									      (while index)
									      (collect index))
							   (cffi:foreign-slot-value ,object-sym '(:struct ,struct-name) ',name)
							   0)
				 ,new-val-sym))))))))
  
  (mcffi:def-lisp-macro doc-file def-vulkan-struct (name &body slots)
    "Define a struct named `name`. Each member slot follows the syntax `(member-name member-type [:count count])`.
When `:count` is used the member will be an array of `count` elements. The possible types are: `:bool`, `:int`, `:uint`, `:float` and `:double`.
The struct will have its own constructor and destructor with names `create-name` and `destroy-name` respectively. Accessors are also defined
with the names `name-member-name`. For example: If the struct is named `vertex` and it has a member named `x` the accessor `vertex-x` will be
defined. If the member is an array because `:count` was used the accessor will accept an optional argument indicating the index of the element you
want to retrieve from. The accessors are `setf`-able. Also, a `with-name` macro is defined from the constructor and the destructor."
    (check-vulkan-struct-name name)
    (check-vulkan-struct-slots slots)
    (let* ((c-slots (mapcar #'convert-to-c-slot slots))
	   (prim-slots (mapcar #'convert-to-primitive-slot slots))
	   (slot-names (mapcar #'car prim-slots))
	   (slot-types (mapcar #'cadr prim-slots))
	   (slot-counts (mapcar (lambda (x) (let ((count (getf x :count)))
					      (if count (if (listp count) count (list count)) '(1))))
				prim-slots)))
      `(progn
	 (cffi:defcstruct ,name
	   ,@c-slots)
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
