
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

;; Add a constant and its value to the constant table.
(defun add-constant (constant-str value constant-table)
  (setf (gethash constant-str constant-table) value))

;; Return the associated value of a constant.
(defun get-constant-value (constant-str constant-table)
  (gethash constant-str constant-table))

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
    (multiple-value-bind (macro-func-p func-regs) (ppcre:scan-to-strings "^(\\w+)(\\((?:\\s*\\d+\\s*,)*\\s*\\d+\\s*\\))" value-str)
      (cond
	(numberp
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
	     (t (values num nil nil)))))
	(macro-func-p
	 (let ((args (ppcre:regex-replace-all "," (aref func-regs 1) " ")))
	   (cons (intern (string-upcase (aref func-regs 0))) (read-from-string args)))) ; TODO: VK_MAKE.. -> make-api...
	((equal (aref value-str 0) #\")
	 (subseq value-str 1 (1- (length value-str))))
	((ppcre:scan "^VK_API" value-str))
	(t (intern (string-upcase value-str)))))))

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
(defun read-struct-union (line structs unions pointer-types constant-table ifile)
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
		     (bracketsp (iter (for str in (ppcre:all-matches-as-strings "\\w+" brackets))
				  (collect (if (ppcre:scan "^\\d+" str)
					       (parse-integer str)
					       (get-constant-value str constant-table)))))
		     (bitfieldsp (not (zerop (length bitfields))))
		     (previous-countp (and previous-slot-name (ppcre:scan "Count" previous-slot-name)))
		     (stringp (and (string= type "char") (or pointerp bracketsp)))
		     (func-pointerp (ppcre:scan "^PFN_" type)))
		(when func-pointerp
		  (collect type into function-pointers))
		(collect `(,(fix-name name)
			   ,(if pointerp :pointer (fix-type type :structs structs :unions unions))
			   ,@(if bracketsp
				 `(:count ,(apply #'* bracketsp))
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
			       ((and stringp (or (and double-pointerp previous-countp) (and pointerp bracketsp)))
				(let* ((name-name (fix-name name))
				       (name-arg (fix-name (concatenate 'string name "-arg")))
				       (previous-name (fix-name previous-slot-name))
				       (index-name (fix-name (concatenate 'string name "-index")))
				       (count (if bracketsp
						  (apply #'* bracketsp)
						  (fix-name previous-slot-name))))
				  `(:create ((,name-arg) (create-array-strings ,name-name ,name-arg :dynamic ,(not bracketsp)))
				    :destroy (destroy-array-strings ,name-name ,previous-name :dynamic ,(not bracketsp))
				    :get ((&optional ,index-name) (get-array-strings ,name-name ,index-name ,count))
				    :set ((,name-arg &optional ,index-name) (set-array-strings ,name-name ,name-arg ,index-name ,count :dynamic ,(not bracketsp))))))
			       (stringp
				(let* ((name-name (fix-name name))
				       (name-arg (fix-name (concatenate 'string name "-arg"))))
				  `(:create ((,name-arg) (create-string ,name-name ,name-arg :dynamic ,(not bracketsp)))
					    ,@(when (not bracketsp)
						`(:destroy (destroy-string ,name-name)))
					    :get (() (get-string  ,name-name))
					    :set ((,name-arg) (set-string ,name-name ,name-arg :dynamic ,(not bracketsp))))))
			       ((and (not (string= type "void"))
				     (or (and pointerp previous-countp) bracketsp))
				(let* ((type-name (fix-type type :structs structs :unions unions))
				       (name-name (fix-name name))
				       (name-arg (fix-name (concatenate 'string name "-arg")))
				       (previous-name (fix-name previous-slot-name))
				       (index-name (fix-name (concatenate 'string name "-index")))
				       (arg-pointersp (and (string= (subseq type 0 2) "Vk") (or (struct-or-union-p type structs) (struct-or-union-p type unions))))
				       (count (if bracketsp
						  (apply #'* bracketsp)
						  previous-name)))
				  `(:create ((,name-arg)
					     (create-array ,type-name ,name-name ,name-arg :dynamic ,(not bracketsp) :pointers ,arg-pointersp))
					    ,@(when (not bracketsp)
						`(:destroy (destroy-array ,name-name)))
				    :get ((&optional ,index-name)
					  (get-array ,type-name ,name-name ,index-name ,count :pointers ,arg-pointersp))
				    :set ((,name-arg &optional ,index-name)
					  (set-array ,type-name ,name-name ,name-arg ,index-name :dynamic ,(not bracketsp) :pointers ,arg-pointersp)))))
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
				     function-pointers
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
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "#define (\\w+)\\s+(\"?[\\-\\~\\w\\s\\d\\.,\\(\\)ULF]+\"?)" line)
    (if match
	(let ((name (aref regs 0))
	      (value (aref regs 1)))
	  (values name
		  (fix-value value)
		  `(mcffi:def-foreign-constant doc-file ,name ,(fix-name name) ,(fix-value value))))
	nil)))

;; Check if a line is a static const value.
;; In that case, write the MCFFI definition.
(defun read-static-const (line)
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "static const \\w+ (\\w+) = (\"?[\\-\\~\\w\\s\\d\\.,\\(\\)ULF]+\"?)" line)
    (if match
	(let ((name (aref regs 0))
	      (value (aref regs 1)))
	  
	  (values name
		  (fix-value value)
		  `(mcffi:def-foreign-constant doc-file ,name ,(fix-name name) ,(fix-value value))))
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
	      (multiple-value-bind (match-mem regs-mem) (ppcre:scan-to-strings "\\s*(\\w+)\\s*=\\s*(\"?[\\-\\~\\w\\s\\d\\.\\(\\)ULF]+\"?)" member-line)
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
		       (pointerp (ppcre:scan "\\*" post-arg-qualifiers))
		       (function-pointerp (ppcre:scan "^PFN_" arg-type)))
		  (when function-pointerp
		    (collect arg-type into function-pointers))
		  (collect `(,(fix-name arg-name) ,(if pointerp :pointer (fix-type arg-type :structs structs :unions unions)))
		    into arg-slots)
		  (collect (fix-name arg-name)
		    into more-arg-names)
		  (collect (list (fix-more-name arg-type)
				 (fix-more-name arg-name))
		    into more-type-declarations)
		  (until endp))))
	    (finally (return (values function-pointers
				     `(cffi:defcfun (,func-name ,(fix-name func-name)) ,(fix-type return-type)
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
  (prin1 '(mcffi:def-foreign-constant-function doc-file "VK_MAKE_API_VERSION" VK_MAKE_API_VERSION (variant major minor patch)
	   (logior (ash variant 29) (ash major 22) (ash minor 12) patch))
	 more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant-function doc-file "VK_API_VERSION_VARIANT" VK_API_VERSION_VARIANT (version)
	   (ash version 29))
	 more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant-function doc-file "VK_API_VERSION_MAJOR" VK_API_VERSION_MAJOR (version)
	   (logand (ash version 22) #x7F))
	 more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant-function doc-file "VK_API_VERSION_MINOR" VK_API_VERSION_MINOR (version)
	   (logand (ash version 12) #x3FF))
	 more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant-function doc-file "VK_API_VERSION_PATCH" VK_API_VERSION_PATCH (version)
	   (logand version #xFFF))
	 more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "UINT64_MAX" UINT64_MAX (1- (expt 2 64))) more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "UINT32_MAX" UINT32_MAX (1- (expt 2 32))) more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "VK_NULL_HANDLE" vk_null_handle (cffi:null-pointer)) more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "VK_API_VERSION_1_0" vk_api_version_1_0 (vk_make_api_version 0 1 0 0)) more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "VK_HEADER_VERSION" vk_header_version 216) more-constant-file)
  (format more-constant-file "~%~%")
  (prin1 '(mcffi:def-foreign-constant doc-file "VK_HEADER_VERSION_COMPLETE" vk_header_version_complete (vk_make_api_version 0 1 3 vk_header_version)) more-constant-file)
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

;; Write the callback definitions.
(defun write-more-callback (function-pointers more-callback-file)
  (format more-callback-file "~%")
  (prin1 '(in-package :cvk) more-callback-file)
  (format more-callback-file "~%~%")
  (format more-callback-file "~%(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname \"common-vulkan\" \"docs/api/callbacks.md\"))~%")
  (iter (for function-pointer in function-pointers)
    (format more-callback-file "~%~%")
    (prin1 `(mcffi:def-foreign-callback-definer doc-file ,function-pointer
		,(fix-name (string-downcase (concatenate 'string
							 "def-"
							 (string (cffi:translate-camelcase-name (subseq function-pointer 6)
												:special-words
												'("2D" "3D" "KHR" "EXT" "VALVE" "GOOGLE" "AMD" "INTEL" "NVX" "NV" "HUAWEI")))
							 "-callback"))))
	   more-callback-file))
  (format more-callback-file ")"))

;; Write the final struct definitions.
(defun write-final-more-struct (old-struct-code new-struct-code revised-structs-code new-more-struct-code
				structs-to-revise-list structs-to-revise-file final-more-struct-file)
  (iter (for revised-code in revised-structs-code)
    (until (eq (car revised-code) 'mcffi:with-doc-file))
    (format final-more-struct-file "~%~%")
    (prin1 revised-code final-more-struct-file)
    (finally (format final-more-struct-file "~%~%")
	     (format final-more-struct-file "(~s ~s"
		     'mcffi:with-doc-file (cadr revised-code))
	     (iter (for new-more-struct in new-more-struct-code)
	       (let* ((revised-structs (cddr revised-code))
		      (struct-name (caddr new-more-struct))
		      (revised-struct-list (and revised-structs
						(iter (for substruct in (member struct-name revised-structs :key (lambda (x) (caddr x))
													    :test (lambda (x y)
														    (and (stringp y) (string= x y)))))
						  (count (eq (car substruct) 'mcffi:def-foreign-struct) into def-struct-count)
						  (while (<= def-struct-count 1))
						  (collect substruct)))))
		 (if revised-struct-list
		     (progn
		       (iter (for revised-struct in revised-struct-list)
			 (format final-more-struct-file "~%~%  ")
			 (prin1 revised-struct final-more-struct-file))
		       (let* ((old-struct (and old-struct-code
					       (car (member (fix-name struct-name) old-struct-code :key (lambda (x) (cadr x))))))
			      (new-struct (car (member (fix-name struct-name) new-struct-code :key (lambda (x) (cadr x)))))
			      (revised-infixes (let ((infixes (cadddr (car revised-struct-list))))
						 (if (listp infixes)
						     infixes
						     (list infixes))))
			      (new-infixes (cadddr new-more-struct)))
			 (when (or (not (equal old-struct new-struct))
				   (not (equal revised-infixes new-infixes))
				   (member struct-name structs-to-revise :test #'string=))
			   (format final-more-struct-file "~%~%  ")
			   (prin1 `(mcffi:doc-note doc-file "The C code has been changed since last update. Please, post an issue to make the maintainer revise this struct.")
				  final-more-struct-file)
			   (accumulate struct-name by (lambda (x y) (adjoin x y :test #'string=))
				       initial-value structs-to-revise-list into structs-to-revise))))
		     (progn
		       (format final-more-struct-file "~%~%  ")
		       (prin1 new-more-struct final-more-struct-file)
		       (format final-more-struct-file "~%~%  ")
		       (prin1 `(mcffi:doc-note doc-file "This struct needs to be revised. Please, post an issue to request it.")
			      final-more-struct-file))))
	       (finally (prin1 structs-to-revise structs-to-revise-file)))
	     (format final-more-struct-file ")"))))

;; Write the final function definitions.
(defun write-final-more-function (old-function-code new-function-code revised-function-code new-more-function-code
				  functions-to-revise-list functions-to-revise-file final-more-function-file)
  (iter (for revised-code in revised-function-code)
    (until (eq (car revised-code) 'mcffi:with-doc-file))
    (prin1 revised-code final-more-function-file)
    (finally (format final-more-function-file "~%~%")
	     (format final-more-function-file "(~s ~s"
		     'mcffi:with-doc-file (cadr revised-code))
	     (iter (for new-more-function in new-more-function-code)
	       (let* ((revised-functions (cddr revised-code))
		      (func-name (caddr new-more-function))
		      (revised-function-list (and revised-functions
						  (iter (for subfunc in (member func-name revised-functions :key (lambda (x) (caddr x))
													    :test (lambda (x y)
														    (and (stringp y) (string= x y)))))
						    (count (and (eq (car subfunc) 'mcffi:def-foreign-function)
								(not (null (caddr subfunc))))
							   into def-function-count)
						    (while (<= def-function-count 1))
						    (collect subfunc)))))
		 (if revised-function-list
		     (let* ((old-function (and old-function-code
					       (car (member func-name old-function-code :key (lambda (x) (caadr x))
											:test #'string=))))
			    (new-function (car (member func-name new-function-code :key (lambda (x) (caadr x))
										   :test #'string=)))
			    (code-changed (or (not (equal old-function new-function))
					      (member func-name functions-to-revise :test #'string=))))
		       (iter (for revised-function in revised-function-list)
			 (format final-more-function-file "~%~%  ")
			 (prin1 revised-function final-more-function-file)
			 (when (and code-changed
				    (or (eq (car revised-function) 'mcffi:def-foreign-function)
					(eq (car revised-function) 'mcffi:defwith)))
			   (format final-more-function-file "~%~%  ")
			   (prin1 `(mcffi:doc-note doc-file "The C code has been changed since last update. Please, post an issue to make the maintainer revise this function.")
				  final-more-function-file)))
		       (when code-changed
			 (accumulate func-name by (lambda (x y) (adjoin x y :test #'string=))
				     initial-value functions-to-revise-list into functions-to-revise)))
		     (progn
		       (format final-more-function-file "~%~%  ")
		       (prin1 new-more-function final-more-function-file)
		       (format final-more-function-file "~%~%  ")
		       (prin1 `(mcffi:doc-note doc-file "This function needs to be revised. Please, post an issue to request it.")
			      final-more-function-file))))
	       (finally (prin1 functions-to-revise functions-to-revise-file)))
	     (format final-more-function-file ")"))))

;; Write the final callback definitions.
(defun write-final-more-callback (revised-callback-code new-more-callback-code final-more-callback-file)
  (iter (for revised-code in revised-callback-code)
    (until (eq (car revised-code) 'mcffi:with-doc-file))
    (prin1 revised-code final-more-callback-file)
    (finally (format final-more-callback-file "~%~%")
	     (format final-more-callback-file "(~s ~s"
		     'mcffi:with-doc-file (cadr revised-code))
	     (iter (for new-more-callback in new-more-callback-code)
	       (let* ((revised-callbacks (cddr revised-code))
		      (foreign-type (caddr new-more-callback))
		      (revised-callback-list (and revised-callbacks
						  (iter (for subcallback in (member foreign-type revised-callbacks :key (lambda (x) (caddr x))
													    :test #'string=))
						    (count (eq (car subcallback) 'mcffi:def-foreign-callback-definer)
							   into def-callback-count)
						    (while (<= def-callback-count 1))
						    (collect subcallback)))))
		 (if revised-callback-list
		     (iter (for revised-callback in revised-callback-list)
		       (format final-more-callback-file "~%~%  ")
		       (prin1 revised-callback final-more-callback-file))
		     (progn
		       (format final-more-callback-file "~%~%  ")
		       (prin1 new-more-callback final-more-callback-file)
		       (format final-more-callback-file "~%~%  ")
		       (prin1 `(mcffi:doc-note doc-file "This callback definer needs to be revised. Please, post an issue to request it.")
			      final-more-callback-file)))))
	     (format final-more-callback-file ")"))))


;; -----------------------------
;; ----- Generate bindings -----
;; -----------------------------

;; Generate the files with vulkan bindings.
(defun generate-bindings (vulkan-file type-file function-file
			  more-constant-file more-enum-file more-struct-file more-function-file more-callback-file)
  (let ((structs (make-hash-table))
	(unions (make-hash-table))
	(constant-table (make-hash-table :test #'equal)))
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
	    (multiple-value-bind (struct-or-union type function-pointers-list struct-union-code more-struct-union-code) (read-struct-union line structs unions pointer-types constant-table vulkan-file)
	      (when struct-or-union
		  (or (and (string= struct-or-union "struct")
			   (add-struct-or-union type structs))
		      (and (string= struct-or-union "union")
			   (add-struct-or-union type unions)))
		  (unioning function-pointers-list into function-pointers)
		  (collect struct-union-code into type-code)
		  (collect more-struct-union-code into more-struct-code))
	      struct-or-union)
	    (multiple-value-bind (const-name const-value def-code) (read-define line)
	      (when def-code
		(add-constant const-name const-value constant-table)
		(collect def-code into more-constant-code))
	      def-code)
	    (multiple-value-bind (const-name const-value static-const-code) (read-static-const line)
	      (when static-const-code
		(add-constant const-name const-value constant-table)
		(collect static-const-code into more-constant-code))
	      static-const-code)
	    (let ((enum-code (read-enum line vulkan-file)))
	      (when enum-code
		(collect enum-code into more-enum-code))
	      enum-code)
	    (multiple-value-bind (function-pointers-list func-code more-func-code) (read-function line structs unions vulkan-file)
	      (when func-code
		(unioning function-pointers-list into function-pointers)
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
	       (write-more-function more-function-code more-function-file)
	       (write-more-callback function-pointers more-callback-file)))))


;; ---------------------------
;; ----- Revise bindings -----
;; ---------------------------

;; Uses the code from revised versions of structs and functions to keep the changes made by hand.
;; If some unexpected change occurs in the C code, a message is put in the final files.
(defun revise-bindings (old-struct-code new-struct-code new-more-struct-code revised-structs-code structs-to-revise-list
			old-function-code new-function-code new-more-function-code revised-functions-code functions-to-revise-list
			structs-to-revise-file functions-to-revise-file final-more-struct-file final-more-function-file
			revised-callback-code new-more-callback-code final-more-callback-file)
  (write-final-more-struct old-struct-code new-struct-code revised-structs-code new-more-struct-code
			   structs-to-revise-list structs-to-revise-file final-more-struct-file)
  (write-final-more-function old-function-code new-function-code revised-functions-code new-more-function-code
			     functions-to-revise-list functions-to-revise-file final-more-function-file)
  (write-final-more-callback revised-callback-code new-more-callback-code final-more-callback-file))


;; ---------------------------
;; ----- The script code -----
;; ---------------------------

;; 1. Copy the initial-parameters file.
;; 2. Collect data from old files.
;; 3. Generate the bindings.
;; 4. Uses the revised data to generate the final definitions.
(let ((*print-case* :downcase)
      old-struct-code old-function-code)
  (uiop:copy-file (asdf:system-relative-pathname "common-vulkan" "generation/helper-functions.lisp")
		  (asdf:system-relative-pathname "common-vulkan" "src/helper-functions.lisp"))
  (uiop:copy-file (asdf:system-relative-pathname "common-vulkan" "generation/initial-parameters.lisp")
		  (asdf:system-relative-pathname "common-vulkan" "src/initial-parameters.lisp"))
  (with-open-file  (old-type-file (asdf:system-relative-pathname "common-vulkan" "vulkan/ctypes.lisp")
				  :direction :input :if-does-not-exist nil)
    (with-open-file  (old-function-file (asdf:system-relative-pathname "common-vulkan" "vulkan/cfunctions.lisp")
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
				       (collect code)))))))
  (with-open-file (vulkan-file (asdf:system-relative-pathname "common-vulkan" "generation/vulkan_core_tail.h")
				:direction :input :if-does-not-exist :error)
    (with-open-file (type-file (asdf:system-relative-pathname "common-vulkan" "vulkan/ctypes.lisp")
				:direction :output :if-exists :supersede :if-does-not-exist :create)
      (with-open-file (function-file (asdf:system-relative-pathname "common-vulkan" "vulkan/cfunctions.lisp")
				      :direction :output :if-exists :supersede :if-does-not-exist :create)
	(with-open-file (more-constant-file (asdf:system-relative-pathname "common-vulkan" "src/constants.lisp")
					     :direction :output :if-exists :supersede :if-does-not-exist :create)
	  (with-open-file (more-enum-file (asdf:system-relative-pathname "common-vulkan" "src/enums.lisp")
					   :direction :output :if-exists :supersede :if-does-not-exist :create)
	    (with-open-file (more-struct-file (asdf:system-relative-pathname "common-vulkan" "generation/pre-structs.lisp")
					       :direction :output :if-exists :supersede :if-does-not-exist :create)
	      (with-open-file (more-function-file (asdf:system-relative-pathname "common-vulkan" "generation/pre-functions.lisp")
						   :direction :output :if-exists :supersede :if-does-not-exist :create)
		(with-open-file (more-callback-file (asdf:system-relative-pathname "common-vulkan" "generation/pre-callbacks.lisp")
						    :direction :output :if-exists :supersede :if-does-not-exist :create)
		  (generate-bindings vulkan-file type-file function-file
				     more-constant-file more-enum-file more-struct-file more-function-file more-callback-file)))))))))
  (let (new-struct-code new-function-code new-more-struct-code new-more-function-code new-more-callback-code
	revised-structs-code revised-functions-code revised-callback-code
	structs-to-revise-list functions-to-revise-list)
    (with-open-file (new-type-file (asdf:system-relative-pathname "common-vulkan" "vulkan/ctypes.lisp")
				    :direction :input :if-does-not-exist nil)
      (with-open-file (new-function-file (asdf:system-relative-pathname "common-vulkan" "vulkan/cfunctions.lisp")
					  :direction :input :if-does-not-exist nil)
	(with-open-file (new-more-struct-file (asdf:system-relative-pathname "common-vulkan" "generation/pre-structs.lisp")
					       :direction :input :if-does-not-exist nil)
	  (with-open-file (new-more-function-file (asdf:system-relative-pathname "common-vulkan" "generation/pre-functions.lisp")
						   :direction :input :if-does-not-exist nil)
	    (with-open-file (new-more-callback-file (asdf:system-relative-pathname "common-vulkan" "generation/pre-callbacks.lisp")
						    :direction :input :if-does-not-exist nil)
	      (with-open-file (revised-struct-file (asdf:system-relative-pathname "common-vulkan" "generation/revised-structs.lisp")
						    :direction :input :if-does-not-exist nil)
		(with-open-file (revised-function-file (asdf:system-relative-pathname "common-vulkan" "generation/revised-functions.lisp")
							:direction :input :if-does-not-exist nil)
		  (with-open-file (revised-callback-file (asdf:system-relative-pathname "common-vulkan" "generation/revised-callbacks.lisp")
							 :direction :input :if-does-not-exist nil)
		    (with-open-file (structs-to-revise-file (asdf:system-relative-pathname "common-vulkan" "generation/structs-to-revise.lisp")
							    :direction :input :if-does-not-exist nil)
		      (with-open-file (functions-to-revise-file (asdf:system-relative-pathname "common-vulkan" "generation/functions-to-revise.lisp")
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
						       (finally (return (cddr code))))
			      new-more-callback-code (iter (for code = (read new-more-callback-file nil))
						       (until (eq (car code) 'mcffi:with-doc-file))
						       (finally (return (cddr code))))
			      revised-structs-code (and revised-struct-file
							(iter (for code = (read revised-struct-file nil))
							  (while code)
							  (collect code)))
			      revised-functions-code (and revised-function-file
							  (iter (for code = (read revised-function-file nil))
							    (while code)
							    (collect code)))
			      revised-callback-code (and revised-callback-file
							 (iter (for code = (read revised-callback-file nil))
							   (while code)
							   (collect code)))
			      structs-to-revise-list (and structs-to-revise-file
							  (read structs-to-revise-file nil))
			      functions-to-revise-list (and functions-to-revise-file
							    (read functions-to-revise-file nil)))))))))))))
    (with-open-file (final-more-struct-file (asdf:system-relative-pathname "common-vulkan" "src/structs.lisp")
					    :direction :output :if-exists :supersede :if-does-not-exist :create)
      (with-open-file (final-more-function-file (asdf:system-relative-pathname "common-vulkan" "src/functions.lisp")
						:direction :output :if-exists :supersede :if-does-not-exist :create)
	(with-open-file (final-more-callback-file (asdf:system-relative-pathname "common-vulkan" "src/callbacks.lisp")
						  :direction :output :if-exists :supersede :if-does-not-exist :create)
	  (with-open-file (structs-to-revise-file (asdf:system-relative-pathname "common-vulkan" "generation/structs-to-revise.lisp")
						  :direction :output :if-exists :supersede :if-does-not-exist :create)
	    (with-open-file (functions-to-revise-file (asdf:system-relative-pathname "common-vulkan" "generation/functions-to-revise.lisp")
						      :direction :output :if-exists :supersede :if-does-not-exist :create)
	      (revise-bindings old-struct-code new-struct-code new-more-struct-code revised-structs-code structs-to-revise-list
			       old-function-code new-function-code new-more-function-code revised-functions-code functions-to-revise-list
			       structs-to-revise-file functions-to-revise-file final-more-struct-file final-more-function-file
			       revised-callback-code new-more-callback-code final-more-callback-file))))))))
