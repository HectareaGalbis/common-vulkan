
(defpackage :generation
  (:use :cl :iterate))

(in-package :generation)


;; ----------------------------
;; ----- Helper functions -----
;; ----------------------------

;; Check if a type is a struct or a union.
(defun struct-or-union-p (type-str structs-or-unions)
  (iter (for (type-sym typedefs) in-hashtable structs-or-unions)
    (thereis (member type-str typedefs :test #'string=))))

;; Add a type into a table of structs or unions.
(defun add-struct-or-union (type-str structs-or-unions &optional (existing-type-str nil))
  (if existing-type-str
      (let ((existing-type-sym (intern existing-type-str)))
	(setf (gethash existing-type-sym structs-or-unions) (cons type-str (gethash existing-type-sym structs-or-unions))))
      (let ((type-sym (intern type-str)))
	(setf (gethash type-sym structs-or-unions) (list type-str)))))

;; Return a list with all the equivalent types to type-str.
(defun get-struct-or-union-equivalents (type-str structs-or-unions)
  (let ((type-sym (intern type-str)))
    (gethash type-sym structs-or-unions)))

;; Given a read type, return its CFFI equivalent.
(defun fix-type (type-str &key (structs nil) (unions nil))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "(\\w+)_t" type-str)
    (if match
	(let ((primitive-type (aref regs 0)))
	  (intern (string-upcase primitive-type) "KEYWORD"))
	(let ((type-vk-p (ppcre:scan "(Vk|PFN_)(\\w+)" type-str)))
	  (if type-vk-p
	      (or (and structs (struct-or-union-p type-str structs)
		       `(:struct ,(intern (string-upcase type-str))))
		  (and unions (struct-or-union-p type-str unions)
		       `(:union ,(intern (string-upcase type-str))))
		  (intern (string-upcase type-str)))
	      (intern (string-upcase type-str) "KEYWORD"))))))

;; Turns a string into a symbol.
(defun fix-name (name)
  (intern (string-upcase name)))

;; Given a read value, return its common lisp equivalent.
;; Also return the base and if it is needed to print the radix.
(defun fix-value (value-str)
  (multiple-value-bind (numberp num-regs) (ppcre:scan-to-strings "^(?:(\\(\\~)*)(?:(0x)*)([\\-\\d\\.]+)([ULF]*)" value-str)
    (if numberp
	(let* ((notopp  (aref num-regs 0))
	       (hexp    (aref num-regs 1))
	       (num-str (aref num-regs 2))
	       (suffix  (aref num-regs 3))
	       (num     (read-from-string num-str)))
	  (cond
	    (notopp (values `(- ,(if (string= suffix "U") 'UINT32_MAX 'UINT64_MAX)
				,num)
			    nil nil))
	    (hexp (values num 16 t))
	    (t (values num nil nil))))
	value-str)))

;; Given a string designating a type or a name, return its MCFFI equivalent.
(defun fix-more-name (name)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "(\\w+)_t" name)
    (cond
      (match (let ((primitive-type (aref regs 0)))
	       (intern (string-upcase primitive-type))))
      ((iter (for char in-string name)
	 (always (or (not (both-case-p char))
		     (lower-case-p char))))
       (intern (string-upcase name)))
      (t name))))

;; Return a non-nil value if recognise a line that must be ignored.
(defun ignore-specific-line (line)
  (or (string= line "")
      (ppcre:scan "^#ifndef" line)
      (ppcre:scan "^#endif" line)
      (ppcre:scan "^#ifdef" line)
      (ppcre:scan "^//" line)))

;; Pretty print struct code.
(defun pretty-print-struct (struct ofile)
  (format ofile "  (~s ~s ~s ~s~%      ~s~{~%    ~s~})"
	  (car struct) (cadr struct) (caddr struct) (cadddr struct) (cadddr (cdr struct))
	  (cddddr (cdr struct))))

;; Pretty print function code.
(defun pretty-print-function (function ofile)
  (format ofile "  (~s ~s ~s~%      ~s ~s~{~%    ~s~})"
	  (car function) (cadr function) (caddr function) (cadddr function) (cadddr (cdr function))
	  (cddddr (cdr function))))

;; --------------------------
;; ----- Read functions -----
;; --------------------------

;; Return if a line is a non dispatchable handle definition.
;; If that is the case, write the cffi binding.
(defun read-non-dispatchable-handle (line)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "VK_DEFINE_NON_DISPATCHABLE_HANDLE\\((\\w+)\\)" line)
    (if match
	(let ((type-str (aref regs 0)))
	  (values type-str `(cffi:defctype ,(fix-name type-str) non-dispatchable-handle)))
	nil)))

;; Return if a line is a handle definition.
;; If that is the case, write the cffi binding.
(defun read-handle (line)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "VK_DEFINE_HANDLE\\((\\w+)\\)" line)
    (if match
	(let ((type-str (aref regs 0)))
	  (values type-str `(cffi:defctype ,(fix-name type-str) handle)))
	nil)))

;; Check if a line is a type definition.
;; If that is the case, return if the new type is a struct or a union. Also return the new type
;; Also, write the CFFI definition.
(defun read-typedef (line structs unions pointer-types)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "typedef\\s+(?:const|\\s*)*(\\w+)((?:\\*|const|\\s*)*)\\s+(Vk\\w+);" line)
    (if match
	(let* ((old-type (aref regs 0))
	       (post-qualifiers (aref regs 1))
	       (new-type (aref regs 2))
	       (pointerp (or (ppcre:scan "\\*" post-qualifiers) (member old-type pointer-types :test #'string=))))
	  (values (or (and (struct-or-union-p old-type structs) "struct")
		      (and (struct-or-union-p old-type unions) "union")
		      t)
		  new-type
		  old-type
		  pointerp
		  `(cffi:defctype ,(fix-name new-type) ,(if pointerp
							    :pointer
							    (fix-type old-type :structs structs :unions unions)))))
	nil)))

;; Check if a line is a function pointer definition.
;; If that is the case, write the CFFI definition.
(defun read-pfn (line ifile)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "VKAPI_PTR\\s*\\*\\s*(PFN_\\w+)" line)
    (if match
	(progn
	  (iter (for subline initially line then (read-line ifile nil))
	    (until (ppcre:scan "\\);" subline)))
	  (let ((func-name (aref regs 0)))
	    `(cffi:defctype ,(fix-name func-name) :pointer)))
	nil)))

;; Check if a line is a struct or union definition.
;; If that is the case, write the CFFI and MCFFI definitions.
;; Also, return if the type is a struct or union, and the new-type.
(defun read-struct-union (line structs unions pointer-types ifile)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "typedef\\s+(struct|union)\\s(Vk\\w+)\\s*\\{" line)
    (if match
	(let ((struct-or-union (aref regs 0))
	      (type-str        (aref regs 1)))
	  (iter
	    (for previous-slot-name initially nil then (ppcre:register-groups-bind (name) ("(\\w+)(?:(?:\\[\\w+\\])*)(?::\\d+)*;" member-line) name))
	    (for member-line = (read-line ifile nil))
	    (for memberp = (not (ppcre:scan "^\\}" member-line)))
	    (while memberp)
	    (multiple-value-bind (match-mem reg-mem) (ppcre:scan-to-strings "\\s+(?:const|\\s*)*(\\w+)((?:\\*|const|\\s*)*)(\\w+)((?:\\[\\w+\\])*)((?::\\d+)*);" member-line)
	      (declare (ignore match-mem))
	      (let* ((type            (aref reg-mem 0))
		     (post-qualifiers (aref reg-mem 1))
		     (name            (aref reg-mem 2))
		     (brackets        (aref reg-mem 3))
		     (bitfields       (aref reg-mem 4))
		     (pointerp (ppcre:scan "\\*" post-qualifiers))
		     (double-pointerp (>= (ppcre:count-matches "\\*" post-qualifiers)))
		     (bracketsp (ppcre:all-matches-as-strings "\\d+" brackets))
		     (bitfieldsp (not (zerop (length bitfields))))
		     (previous-countp (and previous-slot-name (ppcre:scan "Count" previous-slot-name)))
		     (stringp (and pointerp (string= type "char"))))
		(collect `(,(fix-name name)
			   ,(if pointerp :pointer (fix-type type :structs structs :unions unions))
			   ,@(if bracketsp
				 `(:count ,(apply #'* (mapcar #'parse-integer bracketsp)))
				 nil))
		  into members)
		(collect `(,(fix-name name)
			   ,@(if (and (not pointerp) (or (struct-or-union-p type structs)
							 (struct-or-union-p type unions)))
			         `(:pointer t)
				 nil)
			   :name ,(fix-more-name name)
			   :type ,(fix-more-name type)
			   ,@(if pointerp `(:init-form nil) nil)
			   ,@(cond
			       ((and stringp (or (and double-pointerp previous-countp) bracketsp))
				(let* ((name-name (fix-name name))
				       (name-arg (fix-name (concatenate 'string name "-arg")))
				       (previous-name (fix-name previous-slot-name))
				       (index-name (fix-name (concatenate 'string name "-index")))
				       (count (if bracketsp
						  (apply #'* (mapcar #'parse-integer bracketsp))
						  (fix-name previous-slot-name))))
				  `(:create ((,name-arg) (create-array-strings ,name-name ,name-arg :dynamic ,(not bracketsp)))
				    :destroy (destroy-array-strings ,name-name ,previous-name :dynamic ,(not bracketsp))
				    :get ((&optional ,index-name) (get-array-strings ,name-name ,index-name ,count))
				    :set ((,name-arg &optional ,index-name) (set-array-strings ,name-name ,name-arg ,index-name ,count :dynamic ,(not bracketsp))))))
			       ((and (not (string= type "void"))
				     (or (and pointerp previous-countp) bracketsp))
				(let* ((type-name (fix-type type :structs structs :unions unions))
				       (name-name (fix-name name))
				       (name-arg (fix-name (concatenate 'string name "-arg")))
				       (previous-name (fix-name previous-slot-name))
				       (index-name (fix-name (concatenate 'string name "-index")))
				       (arg-pointersp (and (string= (subseq type 0 2) "Vk") (or (struct-or-union-p type structs) (struct-or-union-p type unions))))
				       (count (if bracketsp
						  (apply #'* (mapcar #'parse-integer bracketsp))
						  previous-name)))
				  `(:create ((,name-arg)
					     (create-array ,type-name ,name-name ,name-arg :dynamic ,(not bracketsp) :pointers ,arg-pointersp))
					    ,@(when (not bracketsp)
						`(:destroy (destroy-array ,name-name)))
				    :get ((&optional ,index-name)
					  (get-array ,type-name ,name-name ,index-name ,count :pointers ,arg-pointersp))
				    :set ((,name-arg &optional ,index-name)
					  (set-array ,type-name ,name-name ,name-arg ,index-name :dynamic ,(not bracketsp) :pointers ,arg-pointersp)))))
			       (stringp
				(let* ((name-name (fix-name name))
				       (name-arg (fix-name (concatenate 'string name "-arg"))))
				  `(:create ((,name-arg) (create-string ,name-name ,name-arg))
				    :destroy (destroy-string ,name-name)
				    :get (() (get-string  ,name-name))
				    :set ((,name-arg) (set-string ,name-name ,name-arg)))))
			       ((or pointerp
				    (member type pointer-types :test #'string=))
				(let* ((name-name (fix-name name))
				       (name-arg (fix-name (concatenate 'string name "-arg"))))
				  `(:create ((,name-arg) (create-pointer ,name-name ,name-arg))
				    :get (() (get-pointer  ,name-name))
				    :set ((,name-arg) (set-pointer ,name-name ,name-arg)))))
			       ((and (not pointerp) (or (struct-or-union-p type structs)
							(struct-or-union-p type unions)))
				(let ((name-name (fix-name name))
				      (name-arg (fix-name (concatenate 'string name "-arg")))
				      (type-name (list (if (struct-or-union-p type unions)
							   :union :struct)
						       (fix-name type))))
				  `(:create ((,name-arg) (mcffi:copy ,name-name ,name-arg ',type-name))
				    :set ((,name-arg) (mcffi:copy ,name-name ,name-arg ',type-name)))))))
		  into more-members)
		(when bitfieldsp
		  (read-line ifile nil))))
	    (finally (return (values struct-or-union
				     type-str
				     `(,(intern (string-upcase (concatenate 'string "defc" struct-or-union)) "CFFI")
				       ,(fix-name type-str) ,@members)
				     `(,(if (string= struct-or-union "struct")
					    'mcffi:def-foreign-struct
					    'mcffi:def-foreign-union)
				       doc-file ,type-str
				       ,(fix-name (subseq (string-downcase (string (cffi:translate-camelcase-name (aref regs 1)
														  :special-words
														  '("2D" "3D" "KHR" "EXT" "VALVE" "GOOGLE" "AMD" "INTEL" "NVX" "NV" "HUAWEI"))))
							  3))
				       (:default-create :default-get :default-set)
				       ,@more-members))))))
	nil)))

;; Check if a line is a define macro.
;; In that case, write the MCFFI definition
(defun read-define (line)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "#define (\\w+)\\s+\"?([\\-\\~\\w\\s\\d\\.,\\(\\)ULF]+)\"?" line)
    (if match
	(let ((name (aref regs 0))
	      (value (aref regs 1)))
	  `(mcffi:def-foreign-constant doc-file ,name ,(fix-name name) ,(fix-value value)))
	nil)))

;; Check if a line is a static const value.
;; In that case, write the MCFFI definition.
(defun read-static-const (line)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "static const \\w+ (\\w+) = \"?([\\-\\~\\w\\s\\d\\.,\\(\\)ULF]+)\"?" line)
    (if match
	(let ((name (aref regs 0))
	      (value (aref regs 1)))
	  `(mcffi:def-foreign-constant doc-file ,name ,(fix-name name) ,(fix-value value)))
	nil)))

;; Check if a line is an enum.
;; In that case, write the MCFFI definition.
(defun read-enum (line ifile)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "typedef\\s+enum\\s+(Vk\\w+)\\s+\\{" line)
    (if match
	(let ((type (aref regs 0)))
	  (iter
	    (let* ((member-line (read-line ifile nil))
		   (endp (ppcre:scan "^\\}" member-line)))
	      (until endp)
	      (multiple-value-bind (match-mem regs-mem) (ppcre:scan-to-strings "\\s*(\\w+)\\s*=\\s*\"?([\\-\\~\\w\\s\\d\\.\\(\\)ULF]+)\"?" member-line)
		(when match-mem
		  (let ((name (aref regs-mem 0))
			(value (aref regs-mem 1)))
		    (collect `(,name ,(fix-value value))
		      into enum-slots)))))
	    (finally (return `(mcffi:def-foreign-enum doc-file ,type
				,@enum-slots)))))
	nil)))

;; Check if a line is a function definition.
;; In that case, write the CFFI and MCFFI definitions.
(defun read-function (line structs unions ifile)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "VKAPI_ATTR\\s+(?:const|\\s*)*(\\w+)(?:(?:\\*|const|\\s*)*)VKAPI_CALL\\s*(\\w+)" line)
    (if match
	(let ((return-type         (aref regs 0))
	      (func-name           (aref regs 1)))
	  (iter
	    (let* ((arg-line (read-line ifile nil))
		   (endp (ppcre:scan "\\)\\s*;" arg-line)))
	      (multiple-value-bind (match-arg regs-arg) (ppcre:scan-to-strings "(?:const|\\s*)*(\\w+)((?:\\*|const|\\s*)*)(\\w+)" arg-line)
		(declare (ignore match-arg))
		(let* ((arg-type            (aref regs-arg 0))
		       (post-arg-qualifiers (aref regs-arg 1))
		       (arg-name            (aref regs-arg 2))
		       (pointerp (ppcre:scan "\\*" post-arg-qualifiers)))
		  (collect `(,(fix-name arg-name) ,(if pointerp :pointer (fix-type arg-type :structs structs :unions unions)))
		    into arg-slots)
		  (collect (fix-name arg-name)
		    into more-arg-names)
		  (collect (list (fix-more-name arg-type)
				 (fix-more-name arg-name))
		    into more-type-declarations)
		  (until endp))))
	    (finally (return (values `(cffi:defcfun (,func-name ,(fix-name func-name)) ,(fix-type return-type)
					,@arg-slots)
				     `(mcffi:def-foreign-function doc-file ,func-name
					  ,(fix-name (subseq (string-downcase (string (cffi:translate-camelcase-name func-name
														     :special-words
														     '("2D" "3D" "KHR" "EXT" "VALVE" "GOOGLE" "AMD" "INTEL" "NVX" "NV" "HUAWEI"))))
							     3))
					  ,more-arg-names
					(declare-types ,@more-type-declarations :return (,return-type return-value))
					(,(fix-name func-name) ,@more-arg-names)))))))
	nil)))


;; ---------------------------
;; ----- Write functions -----
;; ---------------------------

;; Write the C type bindings.
(defun write-type (type-code type-file)
  (format type-file "~%")
  (prin1 '(in-package :cvk) type-file)
  (format type-file "~%~%")
  (prin1 `(cffi:defctype handle :pointer)
	 type-file)
  (format type-file "~%~%")
  (prin1 `(eval-when (:compile-toplevel :load-toplevel :execute)
	    (if (= 8 (cffi:foreign-type-size :pointer))
		(cffi:defctype non-dispatchable-handle :pointer)
		(cffi:defctype non-dispatchable-handle :uint64)))
	 type-file)
  (iter (for code in type-code)
    (format type-file "~%~%")
    (prin1 code type-file)))

;; Write the C function bindings.
(defun write-function (function-code function-file)
  (format function-file "~%")
  (prin1 '(in-package :cvk) function-file)
  (format function-file "~%")
  (iter (for code in function-code)
    (format function-file "~%~%")
    (prin1 code function-file)))

;; Write the constant definitions.
(defun write-more-constant (more-constant-code more-constant-file)
  (prin1 '(in-package :cvk) more-constant-file)
  (format more-constant-file "~%~%")
  (format more-constant-file "(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname \"common-vulkan\" \"docs/api/constants.md\"))~%~%")
  (prin1 '(mcffi:def-foreign-constant-function doc-file "VK_MAKE_API_VERSION" make-api-version (variant major minor patch)
	   `(logior (ash ,variant 29) (ash ,major 22) (ash ,minor 12) ,patch))
	 more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant-function doc-file "VK_API_VERSION_VARIANT" api-version-variant (version)
	   `(ash ,version 29))
	 more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant-function doc-file "VK_API_VERSION_MAJOR" api-version-major (version)
	   `(logand (ash ,version 22) #x7F))
	 more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant-function doc-file "VK_API_VERSION_MINOR" api-version-minor (version)
	   `(logand (ash ,version 12) #x3FF))
	 more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant-function doc-file "VK_API_VERSION_PATCH" api-version-patch (version)
	   `(logand (ash ,version) #xFFF))
	 more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "UINT64_MAX" UINT64_MAX (1- (expt 2 64))) more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "UINT32_MAX" UINT32_MAX (1- (expt 2 32))) more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "VK_NULL_HANDLE" vk_null_handle (cffi:null-pointer)) more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "VK_API_VERSION_1_0" vk_api_version_1_0 (make-api-version 0 1 0 0)) more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "VK_HEADER_VERSION" vk_header_version 216) more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "VK_HEADER_VERSION_COMPLETE" vk_header_version_complete (make-api-version 0 1 3 vk_header_version)) more-constant-file)
  (iter (for code in more-constant-code)
    (format more-constant-file "~%~%")
    (prin1 code more-constant-file))
  (format more-constant-file ")"))

;; Write the enum definitions.
(defun write-more-enum (more-enum-code more-enum-file)
  (format more-enum-file "~%")
  (prin1 '(in-package :cvk) more-enum-file)
  (format more-enum-file "~%~%")
  (format more-enum-file "~%(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname \"common-vulkan\" \"docs/api/enums.md\"))~%")
  (iter (for code in more-enum-code)
    (format more-enum-file "~%~%")
    (prin1 code more-enum-file))
  (format more-enum-file ")"))

;; Write the struct definitions.
(defun write-more-struct (more-struct-code structs unions more-struct-file)
  (format more-struct-file "~%")
  (prin1 '(in-package :cvk)
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro create-pointer (slot slot-arg)
	   `(setf ,slot (or ,slot-arg (cffi:null-pointer))))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro get-pointer (slot)
	   `(if (cffi:null-pointer-p ,slot) nil ,slot))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro set-pointer (slot new-value)
	   `(setf ,slot (or ,new-value (cffi:null-pointer))))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro create-string (slot slot-arg)
	   `(setf ,slot (if ,slot-arg (cffi:foreign-string-alloc ,slot-arg) (cffi:null-pointer))))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro destroy-string (slot)
	   `(when (not (cffi:null-pointer-p ,slot)) (cffi:foreign-string-free ,slot)))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro get-string (slot)
	   `(cffi:foreign-string-to-lisp ,slot))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro set-string (slot new-value)
	   `(progn (destroy-string ,slot)
		   (create-string ,slot ,new-value)))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro create-array (type slot slot-arg &key (dynamic nil) (pointers nil))
	   `(progn
	      ,@(when dynamic
		  `((setf ,slot (if ,slot-arg
				    (cffi:foreign-alloc ',type :count (length ,slot-arg))
				    (cffi:null-pointer)))))
	      ,(let ((i (gensym)))
		 `(iter (for ,i from 0 below (length ,slot-arg))
		    ,(if pointers
			 `(mcffi:copy (cffi:mem-aptr ,slot ,i) (aref ,slot-arg ,i) ',type)
			 `(setf (cffi:mem-aref ,slot ',type ,i) (aref ,slot-arg ,i)))))))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro destroy-array (slot)
	   `(when (not (cffi:null-pointer-p ,slot)) (cffi:foreign-free ,slot)))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro get-array (type slot index count &key (pointers nil))
	   `(if (cffi:null-pointer-p ,slot)
		nil
		(if ,index
		    ,(if pointers
			 `(cffi:mem-aptr ,slot ',type ,index)
			 `(cffi:mem-aref ,slot ',type ,index))
		    ,(let ((i (gensym)))
		       `(iter (for ,i from 0 below ,count)
			  (collect ,(if pointers
					`(cffi:mem-aptr ,slot ',type ,i)
					`(cffi:mem-aref ,slot ',type ,i))))))))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro set-array (type slot new-value index &key (dynamic nil) (pointers nil))
	   `(if ,index
		,(if pointers
		     `(mcffi:copy (cffi:mem-aptr ,slot ',type ,index) ,new-value ',type)
		     `(setf (cffi:mem-aref ,slot ',type ,index) ,new-value))
		(progn
		  (destroy-array ,slot)
		  (create-array ,type ,slot ,new-value :dynamic ,dynamic :pointers ,pointers))))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro create-array-strings (slot slot-arg &key (dynamic nil))
	   `(progn
	      ,@(when dynamic
		  `((setf ,slot (if ,slot-arg
				    (cffi:foreign-alloc :pointer :count (length ,slot-arg))
				    (cffi:null-pointer)))))
	      ,(let ((i (gensym)))
		 `(iter (for ,i from 0 below (length ,slot-arg))
		    (setf (cffi:mem-aref ,slot :pointer ,i) (cffi:foreign-string-alloc (aref ,slot-arg ,i)))))))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro destroy-array-strings (slot count &key dynamic)
	   `(when (not (cffi:null-pointer-p ,slot))
	      ,(let ((i (gensym)))
		 `(iter (for ,i from 0 below ,count)
		    (cffi:foreign-string-free (cffi:mem-aref ,slot :pointer ,i))))
	      ,(when dynamic
		 `(cffi:foreign-free ,slot))))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro get-array-strings (slot index count)
	   `(if (cffi:null-pointer-p ,slot)
		nil
		(if ,index
		    (cffi:foreign-string-to-lisp (cffi:mem-aref ,slot :pointer ,index))
		    ,(let ((i (gensym)))
		       `(iter (for ,i from 0 below ,count)
			  (collect (cffi:foreign-string-to-lisp (cffi:mem-aref ,slot :pointer ,i))))))))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (prin1 '(defmacro set-array-strings (slot new-value index count &key (dynamic nil))
	   `(if ,index
		(progn
		  (cffi:foreign-string-free (cffi:mem-aref ,slot :pointer ,index))
		  (setf (cffi:mem-aref ,slot :pointer ,index) ,new-value))
		(progn
		  (destroy-array-strings ,slot ,count :dynamic ,dynamic)
		  (create-array-strings ,slot ,new-value :dynamic ,dynamic))))
	 more-struct-file)
  (format more-struct-file "~%~%")
  (format more-struct-file "~%(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname \"common-vulkan\" \"docs/api/structs.md\"))~%")
  (iter (for code in more-struct-code)
    (format more-struct-file "~%~%")
    (let* ((equivalent-types (get-struct-or-union-equivalents (caddr code)
							      (if (struct-or-union-p (caddr code) unions)
								  unions
								  structs)))
	   (infix-names (iter (for equivalent-type in equivalent-types)
			  (collect (fix-name (subseq (string-downcase (string (cffi:translate-camelcase-name equivalent-type
													     :special-words
													     '("2D" "3D" "KHR" "EXT" "VALVE" "GOOGLE" "AMD" "INTEL" "NVX" "NV" "HUAWEI"))))
						     3))))))
      (prin1 `(,(car code) ,(cadr code) ,(caddr code) ,infix-names ,@(cddddr code))
	     more-struct-file)))
  (format more-struct-file ")"))

;; Write the function definitions.
(defun write-more-function (more-function-code more-function-file)
  (format more-function-file "~%")
  (prin1 '(in-package :cvk) more-function-file)
  (format more-function-file "~%~%")
  (format more-function-file "~%(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname \"common-vulkan\" \"docs/api/functions.md\"))~%")
  (iter (for code in more-function-code)
    (format more-function-file "~%~%")
    (prin1 code more-function-file))
  (format more-function-file ")"))

;; Write the final struct definitions.
(defun write-final-more-struct (old-struct-code old-more-struct-code new-struct-code new-more-struct-code
				final-more-struct-file)
  (format final-more-struct-file "~%")
  (prin1 '(in-package :cvk)
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro create-pointer (slot slot-arg)
	   `(setf ,slot (or ,slot-arg (cffi:null-pointer))))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro get-pointer (slot)
	   `(if (cffi:null-pointer-p ,slot) nil ,slot))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro set-pointer (slot new-value)
	   `(setf ,slot (or ,new-value (cffi:null-pointer))))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro create-string (slot slot-arg)
	   `(setf ,slot (if ,slot-arg (cffi:foreign-string-alloc ,slot-arg) (cffi:null-pointer))))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro destroy-string (slot)
	   `(when (not (cffi:null-pointer-p ,slot)) (cffi:foreign-string-free ,slot)))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro get-string (slot)
	   `(cffi:foreign-string-to-lisp ,slot))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro set-string (slot new-value)
	   `(progn (destroy-string ,slot)
		   (create-string ,slot ,new-value)))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro create-array (type slot slot-arg &key (dynamic nil) (pointers nil))
	   `(progn
	      ,@(when dynamic
		  `((setf ,slot (if ,slot-arg
				    (cffi:foreign-alloc ',type :count (length ,slot-arg))
				    (cffi:null-pointer)))))
	      ,(let ((i (gensym)))
		 `(iter (for ,i from 0 below (length ,slot-arg))
		    ,(if pointers
			 `(mcffi:copy (cffi:mem-aptr ,slot ,i) (aref ,slot-arg ,i) ',type)
			 `(setf (cffi:mem-aref ,slot ',type ,i) (aref ,slot-arg ,i)))))))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro destroy-array (slot)
	   `(when (not (cffi:null-pointer-p ,slot)) (cffi:foreign-free ,slot)))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro get-array (type slot index count &key (pointers nil))
	   `(if (cffi:null-pointer-p ,slot)
		nil
		(if ,index
		    ,(if pointers
			 `(cffi:mem-aptr ,slot ',type ,index)
			 `(cffi:mem-aref ,slot ',type ,index))
		    ,(let ((i (gensym)))
		       `(iter (for ,i from 0 below ,count)
			  (collect ,(if pointers
					`(cffi:mem-aptr ,slot ',type ,i)
					`(cffi:mem-aref ,slot ',type ,i))))))))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro set-array (type slot new-value index &key (dynamic nil) (pointers nil))
	   `(if ,index
		,(if pointers
		     `(mcffi:copy (cffi:mem-aptr ,slot ',type ,index) ,new-value ',type)
		     `(setf (cffi:mem-aref ,slot ',type ,index) ,new-value))
		(progn
		  (destroy-array ,slot)
		  (create-array ,type ,slot ,new-value :dynamic ,dynamic :pointers ,pointers))))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro create-array-strings (slot slot-arg &key (dynamic nil))
	   `(progn
	      ,@(when dynamic
		  `((setf ,slot (if ,slot-arg
				    (cffi:foreign-alloc :pointer :count (length ,slot-arg))
				    (cffi:null-pointer)))))
	      ,(let ((i (gensym)))
		 `(iter (for ,i from 0 below (length ,slot-arg))
		    (setf (cffi:mem-aref ,slot :pointer ,i) (cffi:foreign-string-alloc (aref ,slot-arg ,i)))))))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro destroy-array-strings (slot count &key dynamic)
	   `(when (not (cffi:null-pointer-p ,slot))
	      ,(let ((i (gensym)))
		 `(iter (for ,i from 0 below ,count)
		    (cffi:foreign-string-free (cffi:mem-aref ,slot :pointer ,i))))
	      ,(when dynamic
		 `(cffi:foreign-free ,slot))))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro get-array-strings (slot index count)
	   `(if (cffi:null-pointer-p ,slot)
		nil
		(if ,index
		    (cffi:foreign-string-to-lisp (cffi:mem-aref ,slot :pointer ,index))
		    ,(let ((i (gensym)))
		       `(iter (for ,i from 0 below ,count)
			  (collect (cffi:foreign-string-to-lisp (cffi:mem-aref ,slot :pointer ,i))))))))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (prin1 '(defmacro set-array-strings (slot new-value index count &key (dynamic nil))
	   `(if ,index
		(progn
		  (cffi:foreign-string-free (cffi:mem-aref ,slot :pointer ,index))
		  (setf (cffi:mem-aref ,slot :pointer ,index) ,new-value))
		(progn
		  (destroy-array-strings ,slot ,count :dynamic ,dynamic)
		  (create-array-strings ,slot ,new-value :dynamic ,dynamic))))
	 final-more-struct-file)
  (format final-more-struct-file "~%~%")
  (format final-more-struct-file "~%(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname \"common-vulkan\" \"docs/api/structs.md\"))~%")
  (iter (for new-more-struct in new-more-struct-code)
    (let* ((struct-name (caddr new-more-struct))
	   (old-more-struct-list (and old-more-struct-code
				      (iter (for substruct in (member struct-name old-more-struct-code :key (lambda (x) (caddr x))
												       :test #'string=))
					(count (eq (car substruct) 'mcffi:def-foreign-struct) into def-struct-count)
					(while (<= def-struct-count 1))
					(collect substruct)))))
      (if old-more-struct-list
	  (progn
	    (iter (for old-more-struct in old-more-struct-list)
	      (format final-more-struct-file "~%~%")
	      (if (eq (car old-more-struct) 'mcffi:def-foreign-struct)
		  (pretty-print-struct old-more-struct final-more-struct-file)
		  (prin1 old-more-struct final-more-struct-file)))
	    (let* ((old-struct (and old-struct-code
				    (car (member (fix-name struct-name) old-struct-code :key (lambda (x) (cadr x))))))
		   (new-struct (car (member (fix-name struct-name) new-struct-code :key (lambda (x) (cadr x)))))
		   (old-infixes (cadddr (car old-more-struct-list)))
		   (new-infixes (cadddr new-more-struct)))
	      (when (or (not (equal old-struct new-struct))
			(not (equal old-infixes new-infixes)))
		(format final-more-struct-file "~%~%")
		(prin1 `(mcffi:doc-note doc-file "The C code has been changed since last update. Please, post an issue to make the maintainer revise this struct.")
		       final-more-struct-file))))
	  (progn
	    (format final-more-struct-file "~%~%")
	    (pretty-print-struct new-more-struct final-more-struct-file)
	    (format final-more-struct-file "~%~%")
	    (prin1 `(mcffi:doc-note doc-file "This struct needs to be revised. Please, post an issue to request it.")
		   final-more-struct-file)))))
  (format final-more-struct-file ")"))

;; Write the final function definitions.
(defun write-final-more-function (old-function-code old-more-function-code new-function-code new-more-function-code
			    final-more-function-file)
  (format final-more-function-file "~%")
  (prin1 '(in-package :cvk) final-more-function-file)
  (format final-more-function-file "~%~%")
  (format final-more-function-file "~%(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname \"common-vulkan\" \"docs/api/functions.md\"))~%")
  (iter (for new-more-function in new-more-function-code)
    (let* ((func-name (caddr new-more-function))
	   (old-more-function-list (and old-more-function-code
					(iter (for subfunc in (member func-name old-more-function-code :key (lambda (x) (caddr x))
												       :test #'string=))
					  (count (and (eq (car subfunc) 'mcffi:def-foreign-function)
						      (not (null (caddr subfunc))))
						 into def-function-count)
					  (while (<= def-function-count 1))
					  (collect subfunc)))))
      (if old-more-function-list
	  (progn
	    (iter (for old-more-function in old-more-function-list)
	      (format final-more-function-file "~%~%")
	      (if (eq (car old-more-function) 'mcffi:def-foreign-function)
		  (pretty-print-function old-more-function final-more-function-file)
		  (prin1 old-more-function final-more-function-file)))
	    (let ((old-function (and old-function-code
				     (car (member (fix-name func-name) old-function-code :key (lambda (x) (caadr x))))))
		  (new-function (car (member (fix-name func-name) new-function-code :key (lambda (x) (caadr x))))))
	      (when (not (equal old-function new-function))
		(format final-more-function-file "~%~%")
		(prin1 `(mcffi:doc-note doc-file "The C code has been changed since last update. Please, post an issue to make the maintainer revise this function.")
		       final-more-function-file))))
	  (progn
	    (format final-more-function-file "~%~%")
	    (pretty-print-function new-more-function final-more-function-file)
	    (format final-more-function-file "~%~%")
	    (prin1 `(mcffi:doc-note doc-file "This function needs to be revised. Please, post an issue to request it.")
		   final-more-function-file)))))
  (format final-more-function-file ")"))


;; -----------------------------
;; ----- Generate bindings -----
;; -----------------------------

;; Generate the files with vulkan bindings.
(defun generate-bindings (vulkan-file type-file function-file
			  more-constant-file more-enum-file more-struct-file more-function-file)
  (let ((structs (make-hash-table))
	(unions (make-hash-table)))
    (iter
      (let ((line (read-line vulkan-file nil)))
	(while line)
	(or (multiple-value-bind (type non-dispatchable-handle-code) (read-non-dispatchable-handle line)
	      (when type
		(collect non-dispatchable-handle-code into type-code)
		(collect type into pointer-types))
	      type)
	    (multiple-value-bind (type handle-code) (read-handle line)
	      (when type
		(collect handle-code into type-code)
		(collect type into pointer-types))
	      type)
	    (let ((pfn-code (read-pfn line vulkan-file)))
	      (when pfn-code
		(collect pfn-code into type-code))
	      pfn-code)
	    (multiple-value-bind (struct-or-union new-type old-type pointerp typedef-code) (read-typedef line structs unions pointer-types)
	      (when struct-or-union
		  (or (not (stringp struct-or-union))
		      (and (string= struct-or-union "struct")
			   (add-struct-or-union new-type structs old-type))
		      (and (string= struct-or-union "union")
			   (add-struct-or-union new-type unions old-type)))
		  (collect typedef-code into type-code)
		  (when pointerp
		    (collect new-type into pointer-types)))
	      struct-or-union)
	    (multiple-value-bind (struct-or-union type struct-union-code more-struct-union-code) (read-struct-union line structs unions pointer-types vulkan-file)
	      (when struct-or-union
		  (or (and (string= struct-or-union "struct")
			   (add-struct-or-union type structs))
		      (and (string= struct-or-union "union")
			   (add-struct-or-union type unions)))
		  (collect struct-union-code into type-code)
		  (collect more-struct-union-code into more-struct-code))
	      struct-or-union)
	    (let ((def-code (read-define line)))
	      (when def-code
		(collect def-code into more-constant-code))
	      def-code)
	    (let ((static-const-code (read-static-const line)))
	      (when static-const-code
		(collect static-const-code into more-constant-code))
	      static-const-code)
	    (let ((enum-code (read-enum line vulkan-file)))
	      (when enum-code
		(collect enum-code into more-enum-code))
	      enum-code)
	    (multiple-value-bind (func-code more-func-code) (read-function line structs unions vulkan-file)
	      (when func-code
		(collect func-code into function-code)
		(collect more-func-code into more-function-code))
	      func-code)
	    (ignore-specific-line line)
	    (warn "Line not supported:~%   ~s" line)))
      (finally (write-type type-code type-file)
	       (write-function function-code function-file)
	       (write-more-constant more-constant-code more-constant-file)
	       (write-more-enum more-enum-code more-enum-file)
	       (write-more-struct more-struct-code structs unions more-struct-file)
	       (write-more-function more-function-code more-function-file)))))


;; ---------------------------------
;; ----- Remember old bindings -----
;; ---------------------------------

;; Uses the code from previous versions of files to keep the changes made by hand.
;; If some unexpected change occurs in the C code, a message is put in the final files.
(defun remember-old-bindings (old-struct-code old-function-code old-more-struct-code old-more-function-code
			      new-struct-code new-function-code new-more-struct-code new-more-function-code
			      final-more-struct-file final-more-function-file)
  (write-final-more-struct old-struct-code old-more-struct-code new-struct-code new-more-struct-code
			   final-more-struct-file)
  (write-final-more-function old-function-code old-more-function-code new-function-code new-more-function-code
			     final-more-function-file))


;; ---------------------------
;; ----- The script code -----
;; ---------------------------

;; 1. Collect data from old files.
;; 2. Generate the bindings.
;; 3. Uses the old data to generate the final definitions.
(let ((*print-case* :downcase)
      old-struct-code old-function-code old-more-struct-code old-more-function-code)
  (with-open-file  (old-type-file (asdf:system-relative-pathname "common-vulkan" "generation/ctypes.lisp")
				  :direction :input :if-does-not-exist nil)
    (with-open-file  (old-function-file (asdf:system-relative-pathname "common-vulkan" "generation/cfunctions.lisp")
					:direction :input :if-does-not-exist nil)
      (with-open-file  (old-more-struct-file (asdf:system-relative-pathname "common-vulkan" "src/structs.lisp")
					     :direction :input :if-does-not-exist nil)
	(with-open-file  (old-more-function-file (asdf:system-relative-pathname "common-vulkan" "src/functions.lisp")
						 :direction :input :if-does-not-exist nil)
	  (setf old-struct-code (and old-type-file
				     (iter (for code = (read old-type-file nil))
				       (while code)
				       (when (or (eq (car code) 'cffi:defcstruct)
						 (eq (car code) 'cffi:defcunion))
					 (collect code))))
		old-function-code (and old-function-file
				       (iter (for code = (read old-function-file nil))
					 (while code)
					 (when (eq (car code) 'cffi:defcfun)
					   (collect code))))
		old-more-struct-code (and old-more-struct-file
					  (iter (for code = (read old-more-struct-file nil))
					    (until (eq (car code) 'mcffi:with-doc-file))
					    (finally (return (cddr code)))))
		old-more-function-code (and old-more-function-file
					    (iter (for code = (read old-more-function-file nil))
					      (until (eq (car code) 'mcffi:with-doc-file))
					      (finally (return (cddr code))))))))))
  (with-open-file  (vulkan-file (asdf:system-relative-pathname "common-vulkan" "generation/vulkan_core_tail.h")
				:direction :input :if-does-not-exist :error)
    (with-open-file  (type-file (asdf:system-relative-pathname "common-vulkan" "generation/ctypes.lisp")
				:direction :output :if-exists :supersede :if-does-not-exist :create)
      (with-open-file  (function-file (asdf:system-relative-pathname "common-vulkan" "generation/cfunctions.lisp")
				      :direction :output :if-exists :supersede :if-does-not-exist :create)
	(with-open-file  (more-constant-file (asdf:system-relative-pathname "common-vulkan" "generation/constants.lisp")
					     :direction :output :if-exists :supersede :if-does-not-exist :create)
	  (with-open-file  (more-enum-file (asdf:system-relative-pathname "common-vulkan" "generation/enums.lisp")
					   :direction :output :if-exists :supersede :if-does-not-exist :create)
	    (with-open-file  (more-struct-file (asdf:system-relative-pathname "common-vulkan" "generation/pre-structs.lisp")
					       :direction :output :if-exists :supersede :if-does-not-exist :create)
	      (with-open-file  (more-function-file (asdf:system-relative-pathname "common-vulkan" "generation/pre-functions.lisp")
						   :direction :output :if-exists :supersede :if-does-not-exist :create)
		(generate-bindings vulkan-file type-file function-file
				   more-constant-file more-enum-file more-struct-file more-function-file))))))))
  (let (new-struct-code new-function-code new-more-struct-code new-more-function-code)
    (with-open-file  (new-type-file (asdf:system-relative-pathname "common-vulkan" "generation/ctypes.lisp")
				    :direction :input :if-does-not-exist nil)
      (with-open-file  (new-function-file (asdf:system-relative-pathname "common-vulkan" "generation/cfunctions.lisp")
					  :direction :input :if-does-not-exist nil)
	(with-open-file  (new-more-struct-file (asdf:system-relative-pathname "common-vulkan" "generation/pre-structs.lisp")
					       :direction :input :if-does-not-exist nil)
	  (with-open-file  (new-more-function-file (asdf:system-relative-pathname "common-vulkan" "generation/pre-functions.lisp")
						   :direction :input :if-does-not-exist nil)
	    (setf new-struct-code (iter (for code = (read new-type-file nil))
				    (while code)
				    (when (or (eq (car code) 'cffi:defcstruct)
					      (eq (car code) 'cffi:defcunion))
				      (collect code)))
		  new-function-code (iter (for code = (read new-function-file nil))
				      (while code)
				      (when (eq (car code) 'cffi:defcfun)
					(collect code)))
		  new-more-struct-code (iter (for code = (read new-more-struct-file nil))
					 (until (eq (car code) 'mcffi:with-doc-file))
					 (finally (return (cddr code))))
		  new-more-function-code (iter (for code = (read new-more-function-file nil))
					   (until (eq (car code) 'mcffi:with-doc-file))
					   (finally (return (cddr code)))))))))
    (with-open-file  (final-more-struct-file (asdf:system-relative-pathname "common-vulkan" "generation/structs.lisp")
					     :direction :output :if-exists :supersede :if-does-not-exist :create)
      (with-open-file  (final-more-function-file (asdf:system-relative-pathname "common-vulkan" "generation/functions.lisp")
						 :direction :output :if-exists :supersede :if-does-not-exist :create)
	(remember-old-bindings old-struct-code old-function-code old-more-struct-code old-more-function-code
			       new-struct-code new-function-code new-more-struct-code new-more-function-code
			       final-more-struct-file final-more-function-file)))))
