
(in-package :cvk)


;; ----------------------------
;; ----- Helper functions -----
;; ----------------------------

(defstruct context
  "Store the data read from the C Vulkan file."
  (structs   (make-array 100 :adjustable t :fill-pointer 0 :element-type 'string))
  (unions    (make-array 100 :adjustable t :fill-pointer 0 :element-type 'string))
  (pointers  (make-array 100 :adjustable t :fill-pointer 0 :element-type 'string))
  (constants (make-hash-table :test 'equal))
  
  (type-definitions     (make-array 100 :adjustable t :fill-pointer 0))
  (function-definitions (make-array 100 :adjustable t :fill-pointer 0))
  (constant-definitions (make-array 100 :adjustable t :fill-pointer 0)))


(defun structp (context possible-struct)
  "Check whether a type is a struct."
  (declare (type context context) (type string possible-struct))
  (let ((structs (context-structs context)))
    (loop for struct across structs
	    thereis (string= possible-struct struct))))

(defun add-struct (context struct)
  "Add a struct into the table of structs."
  (declare (type context context) (type string struct))
  (when (not (structp context struct))
    (let ((structs (context-structs context)))
      (vector-push-extend struct structs))))


(defun unionp (context possible-union)
  "Check whether a type is an union."
  (declare (type context context) (type string possible-union))
  (let ((unions (context-unions context)))
    (loop for union across unions
	    thereis (string= possible-union union))))

(defun add-union (context union)
  "Add a union into the table of unions."
  (declare (type context context) (type string union))
  (when (not (unionp context union))
    (let ((unions (context-unions context)))
      (vector-push-extend union unions))))


(defun pointerp (context possible-pointer)
  "Check whether POSSIBLE-POINTER is a pointer type."
  (declare (type context context) (type string possible-pointer))
  (let ((pointers (context-pointers context)))
    (loop pointer across pointers
	  thereis (string= pointer possible-pointer))))

(defun add-pointer (context pointer)
  "Add pointer type into the list of pointers."
  (declare (type context context) (type string pointer))
  (when (not (pointerp context pointer))
    (let ((pointers (context-pointers context)))
      (vector-push-extend pointer pointers))))


(defun constantp (context possible-constant)
  "Check whether POSSIBLE-CONSTANT is a constant."
  (declare (type context context) (type string constant))
  (let ((constants (context-constants context)))
    (nth-value 1 (gethash possible-constant constants))))

(defun add-constant (context constant value)
  "Add a constant and its value to the constant table."
  (declare (type context context) (type string constant) (type t value))
  (when (not (constantp context constant))
    (let ((constants (context-constants context)))
      (setf (gethash constant constants) value))))

(defun constant-value (context constant)
  "Return the associated value of a constant."
  (declare (type context context) (type string constant))
  (let* ((constants (context-constants context))
	 (constant-present-p (nth-value 1 (gethash constant constants))))
    (assert constant-present-p () "The constant ~a is not present in the table." constant)
    (gethash constant constants)))


(defun add-type-definition (context definition)
  "Add a type definition."
  (declare (type context context))
  (let ((definitions (context-type-definitions context)))
    (vector-push-extend definition definitions)))

(defun add-constant-definition (context definition)
  "Add a constant definition."
  (declare (type context context))
  (let ((definitions (context-constant-definitions context)))
    (vector-push-extend definition definitions)))

(defun add-function-definition (context definition)
  "Add a function definition."
  (declare (type context context))
  (let ((definitions (context-function-definitions context)))
    (vector-push-extend definition definitions)))


(defun c-type-to-cffi (context type)
  "Given a string of a C type, return its CFFI symbol equivalent."
  (declare (type context context) (type string type))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "(\\w+)_t" type-str)
    (if match
	(let ((primitive-type (aref regs 0)))
	  (intern (string-upcase primitive-type) "KEYWORD"))
	(let ((type-vk-p (ppcre:scan "(Vk|PFN_)(\\w+)" type-str)))
	  (if type-vk-p
	      (or (and (structp context type-str)
		       `(:struct ,(intern (string-upcase type-str))))
		  (and (unionp context type-str)
		       `(:union ,(intern (string-upcase type-str))))
		  (intern (string-upcase type-str)))
	      (intern (string-upcase type-str) "KEYWORD"))))))

(defun string-to-symbol (str)
  "Turns a string into a symbol."
  (declare (type string str))
  (intern (string-upcase str)))

(defun c-value-to-lisp (value)
  "Given a string of a C value, return its Common Lisp equivalent expression."
  (declare (type string value))
  (multiple-value-bind (numberp num-regs) (ppcre:scan-to-strings "^\\(?(\\~)?(?:(?:(?:0x)([0-9A-F]+)[UL]*)|(?:(\\-?[\\d\\.]+)([ULF]*)))\\)?$" value-str)
    (multiple-value-bind (macro-func-p func-regs) (ppcre:scan-to-strings "^(\\w+)(\\((?:\\s*\\d+\\s*,)*\\s*\\d+\\s*\\))" value-str)
      (cond
	(numberp
	 (let* ((notopp  (aref num-regs 0))
		(hexp    (aref num-regs 1))
		(num-str (aref num-regs 2))
		(suffix  (aref num-regs 3)))
	   (cond
	     (notopp `(- ,(if (string= suffix "U") 'UINT32_MAX 'UINT64_MAX)
			 ,(read-from-string num-str)))
	     (hexp (parse-integer hexp :radix 16))
	     (t (read-from-string num-str)))))
	(macro-func-p
	 (let ((args (ppcre:regex-replace-all "," (aref func-regs 1) " ")))
	   (cons (intern (string-upcase (aref func-regs 0))) (read-from-string args))))
	((equal (aref value-str 0) #\")
	 (subseq value-str 1 (1- (length value-str))))
	((ppcre:scan "^VK_API" value-str))
	(t (intern (string-upcase value-str)))))))

(defun c-func-name-to-lisp (func-name)
  "Turns a C function name into a lisp function name."
  (string-downcase (string (cffi:translate-camelcase-name func-name
							  :special-words
							  '("2D" "3D" "KHR" "EXT" "VALVE" "GOOGLE" "AMD" "INTEL" "NVX" "NV" "HUAWEI")))))

(defun ignore-line-p (line)
  "Check whether a line can be ignored."
  (declare (type string line))
  (or (string= line "")
      (ppcre:scan "^#ifndef" line)
      (ppcre:scan "^#endif" line)
      (ppcre:scan "^#ifdef" line)
      (ppcre:scan "^//" line)))


;; -----------------------------
;; ----- Reading functions -----
;; -----------------------------

(defun parse-non-dispatchable-handle (line)
  "If the line is a non dispatchable definition, return the type string which is being defined. Otherwise,
return NIL."
  (declare (type string line))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "VK_DEFINE_NON_DISPATCHABLE_HANDLE\\((\\w+)\\)" line)
    (if match
	(let ((type-str (aref regs 0)))
	  type-str)
	nil)))

(defun process-non-dispatchable-handle-data (context type-str)
  "Process the data from a non dispatchable handle definition."
  (declare (type context context) (type string type-str))
  (add-pointer context type-str))

(defun store-non-dispatchable-handle-code (context type-str)
  "Create the Common Lisp code to define a non dispatchable type."
  (declare (type context context) (type string type-str) (ignore context))
  (add-type-definition `(cffi:defctype ,(string-to-symbol type-str) non-dispatchable-handle)))


(defun parse-handle (line)
  "If the line is a handle definition, return the type string which is being defined. Otherwise, return NIL."
  (declare (type string line))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "VK_DEFINE_HANDLE\\((\\w+)\\)" line)
    (if match
	(let ((type-str (aref regs 0)))
	  type-str)
	nil)))

(defun process-handle-data (context type-str)
  "Process the data from a handle definition."
  (declare (type context context) (type string type-str))
  (add-pointer context type-str)
  (add-type-definition-info type-str (concatenate 'string type-str "_T *")))

(defun store-handle-code (context type-str)
  "Create the Common Lisp code to define a handle type."
  (declare (type context context) (type string line) (ignore context))
  (add-type-definition `(cffi:defctype ,(string-to-symbol type-str) handle)))


(defun parse-typedef (line)
  "If the line is a typedef definition, return the type being defined and the type used to define the new type.
Otherwise, return NIL."
  (declare (type string line))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "typedef\\s+((?:const|\\s*)*\\w+(?:\\*|const|\\s*)*)\\s+(Vk\\w+);" line)
    (if match
	(let* ((old-type (aref regs 0))
	       (new-type (aref regs 1)))
	  (values old-type new-type))
	nil)))

(defun process-typedef-data (context old-type new-type)
  "Process the data from a typedef definition."
  (declare (type context context) (type string old-type new-type))
  (multiple-value-bind (old-match old-regs) (ppcre:scan-to-strings "(?:const|\\s*)*(\\w+)((?:\\*|const|\\s*)*)" old-type)
    (let* ((old-core-type       (aref old-regs 0))
	   (old-type-qualifiers (aref old-regs 1))
	   (new-core-type       new-type)
	   (pointerp            (or (ppcre:scan "\\*" old-type-qualifiers) (pointerp context old-core-type)))
	   (structp             (structp context old-core-type))
	   (unionp              (unionp context old-core-type)))
      (when pointerp
	(add-pointer context new-core-type))
      (when structp
	(add-struct context new-core-type old-core-type))
      (when unionp
	(add-union context new-core-type old-core-type)))))

(defun store-typedef-code (context old-type new-type)
  "Create the Common Lisp code to do a type definition."
  (declare (type context context) (type string old-type new-type))
  (multiple-value-bind (old-match old-regs) (ppcre:scan-to-strings "(?:const|\\s*)*(\\w+)((?:\\*|const|\\s*)*)" old-type)
    (let* ((old-core-type       (aref old-regs 0))
	   (old-type-qualifiers (aref old-regs 1))
	   (new-core-type       new-type)
	   (pointerp            (or (ppcre:scan "\\*" old-type-qualifiers) (pointerp context old-core-type))))
      (add-type-definition `(cffi:defctype ,(string-to-symbol new-core-type) ,(if pointerp :pointer (c-type-to-cffi context old-core-type)))))))


(defun parse-pfn (line istream)
  "If LINE is a function pointer definition, return the name of said pointer function. Otherwise, return NIL."
  (declare (type string line) (type stream istream))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "VKAPI_PTR\\s*\\*\\s*(PFN_\\w+)" line)
    (if match
	(progn
	  (loop for subline = line then (read-line istream nil)
		until (ppcre:scan "\\);" subline))
	  (let ((func-name (aref regs 0)))
	    func-name))
	nil)))

(defun process-pfn-data (context func-name)
  "Process the data from a function pointer definition."
  (declare (type context context) (type string func-name) (ignore context func-name)))

(defun store-pfn-code (context func-name)
  "Create the Common Lisp code to define a function pointer type."
  (declare (type context context) (type string func-name) (ignore context))
  (add-type-definition `(cffi:defctype ,(string-to-symbol func-name) :pointer)))


(defun parse-define (line)
  "If LINE is a define macro, return the name of the macro and its value. Otherwise, return NIL."
  (declare (type string line))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "#define (\\w+)\\s+(\"?[\\-\\~\\w\\s\\d\\.,\\(\\)ULF]+\"?)" line)
    (if match
	(let ((name (aref regs 0))
	      (value (aref regs 1)))
	  (values name value))
	nil)))

(defun process-define-data (context name value)
  "Process the data from a define expression."
  (declare (type context context) (type string name value))
  (add-constant context name (c-value-to-lisp value)))

(defun store-define-code (context name value)
  "Create the Common Lisp to define a macro constant."
  (declare (type context context) (type string name value) (ignore context))
  (add-constant-definition `(adp:defparameter ,(string-to-symbol name) ,(c-value-to-lisp value))))


(defun parse-static-const (line)
  "If LINE is a static const definition, return the name and value of the defined constant. Otherwise, return NIL."
  (declare (type string line))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "static const \\w+ (\\w+) = (\"?[\\-\\~\\w\\s\\d\\.,\\(\\)ULF]+\"?)" line)
    (if match
	(let ((name (aref regs 0))
	      (value (aref regs 1)))
	  (values name value))
	nil)))

(defun process-static-const-data (context name value)
  "Process the data from a static const definition."
  (declare (type context context) (type string name value))
  (add-constant context name value))

(defun store-static-const-code (context name value)
  "Create the Common Lisp code to define a static const variable."
  (declare (type context context) (type string name value) (ignore context))
  (add-constant-definition `(adp:defparameter ,(string-to-symbol name) ,(c-value-to-lisp value))))


(defun parse-enum (line istream)
  "If LINE is an enumeration, return the name of the enum and a list of pairs (name . value) of each enum
member. Otherwise, return NIL."
  (declare (type string line) (type stream istream))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "typedef\\s+enum\\s+(Vk\\w+)\\s+\\{" line)
    (if match
	(let ((enum-name (aref regs 0)))
	  (loop for member-line = (read-line istream nil)
		for endp = (ppcre:scan "^\\}" member-line)
		until endp
		collect (multiple-value-bind (match-mem regs-mem) (ppcre:scan-to-strings "\\s*(\\w+)\\s*=\\s*(\"?[\\-\\~\\w\\s\\d\\.\\(\\)ULF]+\"?)" member-line)
			  (when match-mem
			    (let ((name (aref regs-mem 0))
				  (value (aref regs-mem 1)))
			      (cons name value))))
		  into enum-members
		finally (return (values enum-name enum-members))))
	nil)))

(defun process-enum-data (context enum-name enum-members)
  "Process the data from an enumeration definition."
  (declare (type context context) (type string enum-name) (type list enum-members) (ignore context enum-name enum-members)))

(defun store-enum-code (context enum-name enum-members)
  "Return a list of Common Lisp expressions to define an enumeration."
  (declare (type context context) (type string enum-name) (type list enum-members) (ignore context))
  (add-type-definition `(cffi:defctype ,(string-to-symbol enum-name) :int))
  (loop for enum-member in enum-members
	do (let ((name  (car enum-member))
		 (value (cdr enum-member)))
	     (add-constant-definition `(adp:defparameter ,(string-to-symbol name) ,(c-value-to-lisp value))))))


(defun parse-function (line istream)
  "If LINE is a function declaration, return the function name, its return type and a list of pairs
(type . arg) of each function argument. Otherwise, return NIL."
  (declare (type string line) (type stream istream))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "VKAPI_ATTR\\s+((?:const|\\s*)*\\w+(?:\\*|const|\\s*)*)VKAPI_CALL\\s*(\\w+)" line)
    (if match
	(let ((return-type         (aref regs 0))
	      (func-name           (aref regs 1)))
	  (loop for arg-line = (read-line istream nil)
		for endp = (ppcre:scan "\\)\\s*;" arg-line)
		collect (multiple-value-bind (match-arg regs-arg) (ppcre:scan-to-strings "((?:const|\\s*)*\\w+(?:\\*|const|\\s*)*)(\\w+)" arg-line)
			  (declare (ignore match-arg))
			  (let* ((arg-type            (aref regs-arg 0))
				 (arg-name (aref regs-arg 1)))			    
			    (cons arg-type arg-name)))
		  into function-args
		until endp
		finally (return (values func-name return-type function-args))))
	nil)))

(defun process-function-data (context func-name return-type function-args)
  "Process the data from a function declaration."
  (declare (type context context) (type string func-name return-type) (type list function-args) (ignore func-name return-type))
  (loop for function-arg in function-args
	for arg-type = (car function-arg) 
	do (multiple-value-bind (match-arg regs-arg) (ppcre:scan-to-strings "(?:const|\\s*)*(\\w+)(?:(?:\\*|const|\\s*)*)" arg-type)
	     (declare (ignore match-arg))
	     (let* ((arg-core-type          (aref regs-arg 0))
		    (function-pointer-arg-p (ppcre:scan "^PFN_" arg-core-type)))
	       (when function-pointer-arg-p
		 (add-callback context arg-core-type))))))

(defun store-function-code (context func-name return-type function-args)
  "Create the Common Lisp code of a function declaration. Return two values: The C binding and the Common Lisp
wrap."
  (declare (type context context) (type string func-name return-type) (type list function-args))
  (loop for function-arg in function-args
	for arg-type = (car function-arg)
	for arg-name = (cdr function-arg)
	collect (multiple-value-bind (match-arg regs-arg) (ppcre:scan-to-strings "(?:const|\\s*)*(\\w+)((?:\\*|const|\\s*)*)" arg-type)
		  (declare (ignore match-arg))
		  (let* ((arg-core-type       (aref regs-arg 0))
			 (post-arg-qualifiers (aref regs-arg 1))
			 (pointerp            (ppcre:scan "\\*" post-arg-qualifiers)))
		    `(,(string-to-symbol arg-name) ,(if pointerp :pointer (c-type-to-cffi context arg-core-type)))))
	  into arg-slots
	finally (add-function-definition `(multiple-defcfun (,func-name ,(string-to-symbol func-name) ,(string-to-symbol (concatenate 'string "FUNCALL-" func-name)))
							    ,(c-type-to-cffi context return-type) ,@arg-slots))))


(defun parse-struct-union (line istream)
  "If LINE is a structure or union definition, return the string indicating if it is a struct or union,
its name and a list of lists (type name post-name) of each of its members. Otherwise, return nil."
  (declare (type string line) (type stream istream))
  (multiple-value-bind (match regs) (ppcre:scan-to-strings "typedef\\s+(struct|union)\\s(Vk\\w+)\\s*\\{" line)
    (if match
	(let ((struct-or-union (aref regs 0))
	      (struct-name     (aref regs 1)))
	  (loop for previous-slot-name = nil then (ppcre:register-groups-bind (name) ("(\\w+)(?:(?:\\[\\w+\\])*)(?::\\d+)*;" member-line) name)
		for member-line = (read-line ifile nil)
		for memberp = (not (ppcre:scan "^\\}" member-line))
		while memberp
		collect (multiple-value-bind (match-mem reg-mem) (ppcre:scan-to-strings "\\s+((?:const|\\s*)*\\w+(?:\\*|const|\\s*)*)(\\w+)((?:\\[\\w+\\])*(?::\\d+)*);" member-line)
			  (declare (ignore match-mem))
			  (let* ((type            (aref reg-mem 0))
				 (name            (aref reg-mem 1))
				 (post-name       (aref reg-mem 2)))
			    (list type name post-name)))
		  into members
		finally (return (values struct-or-union
					struct-name
					members))))
	nil)))

(defun process-struct-union-data (context struct-or-union struct-name members)
  "Process the data from a struct or union definition."
  (declare (type context context) (type string struct-or-union struct-name) (type list members))
  (cond
    ((string= struct-or-union "struct")
     (add-struct context struct-name))
    ((string= struct-or-union "union")
     (add-union context struct-name))
    (t (error "~s is not \"struct\" or \"union\"." struct-or-union)))
  (let* ((core-types (mapcar (lambda (member)
			       (multiple-value-bind (match reg) (ppcre:scan-to-strings "(?:const|\\s*)*(\\w+)(?:(?:\\*|const|\\s*)*)" (car member))
				 (declare (ignore match))
				 (aref reg 0)))
			     members))
	 (function-pointer-members (remove-if-not (lambda (type)
						    (ppcre:scan "^PFN_" type))
						  core-types)))
    (loop for function-pointer-member in function-pointer-members
	  do (add-callback context function-pointer-member))))

(defun store-struct-union-code (context struct-or-union struct-name members)
  "Create the Common Lisp code of a struct or union definition. Return two values: The C binding
and the Common Lisp wrap."
  (declare (type context context) (type string struct-or-union struct-name) (type list members))
  (loop for (type name post-name) in members
	for previous-bitfieldsp = nil then bitfieldsp
	for (core-type type-qualifiers) = (coerce (nth-value 1 (ppcre:scan-to-strings "(?:const|\\s*)*(\\w+)((?:\\*|const|\\s*)*)" type)) 'list)
	for pointerp = (ppcre:scan "\\*" post-qualifiers)
	for (brackets bitfields) = (coerce (nth-value 1 (ppcre:scan-to-strings "((?:\\[\\w+\\])*)((?::\\d+)*)" post-name)) 'list)
	for bracketsp = (loop for str in (ppcre:all-matches-as-strings "\\w+" brackets)
			      collect (if (ppcre:scan "^\\d+" str)
					  (parse-integer str)
					  (constant-value context str constant-table)))
	for bitfieldsp = (not (zerop (length bitfields)))
	for function-pointerp = (ppcre:scan "^PFN_" core-type)
	when (not previous-bitfieldsp)
	  collect (list* (string-to-symbol name)
		       (if pointerp :pointer (c-type-to-cffi context core-type))
		       (if bracketsp `(:count ,(apply #'* bracketsp)) nil))
	    into members
	finally (add-type-definition `(,(intern (string-upcase (concatenate 'string "defc" struct-or-union)) "CFFI")
				       ,(string-to-symbol struct-name)
				       ,@members))))


(defmacro define-read-header-function (name)
  "Define a function that reads a Vulkan expression. If it is a NAME expression, it stores the information
in CONTEXT. Return a boolean indicating if the expression was read."
  (let ((read-name (intern (concatenate 'string "READ-" (symbol-name name))))
	(parse-name (intern (concatenate 'string "PARSE-" (symbol-name name))))
	(process-name (intern (concatenate 'string "PROCESS-" (symbol-name name) "-DATA")))
	(store-name (intern (concatenate 'string "STORE-" (symbol-name name) "-CODE"))))
    (with-gensyms (context line stream parsed-data)
      `(defun ,read-name (,context ,line ,stream)
	 (declare (type context ,context) (type string ,line) (type stream ,stream))
	 (let ((,parsed-data (multiple-value-list (,parse-name ,line ,stream))))
	   (if ,parsed-data
	       (progn
		 (apply #',process-name ,context ,parsed-data)
		 (apply #',store-name ,context ,parsed-data)
		 t)
	       nil))))))

(define-read-header-function non-dispatchable-handle)
(define-read-header-function handle)
(define-read-header-function typedef)
(define-read-header-function pfn)
(define-read-header-function define)
(define-read-header-function static-const)
(define-read-header-function enum)
(define-read-header-function function)
(define-read-header-function struct-union)


(defun read-header-file (file-path)
  "Read, parse and store the information from the header file where the Vulkan declarations are in.
Return a context structure with the information."
  (declare (type pathname file-path))
  (let ((context (make-context)))
    (with-open-file (istream file-path)
      (loop for line = (read-line istream nil)
	    while line
	    do (or (read-non-dispatchable-handle context line istream)
		   (read-handle context line istream)
		   (read-typedef context line istream)
		   (read-pfn context line istream)
		   (read-define context line istream)
		   (read-static-consts context line istream)
		   (read-enum context line istream)
		   (read-function context line istream)
		   (read-struct-union context line istream)
		   (ignore-line-p line))))
    (values context)))

 
;; -----------------------------
;; ----- Writing functions -----
;; -----------------------------

(defun write-type-code (context stream)
  "Write the type definitions in the specified stream."
  (declare (type context context) (type stream stream))
  (format stream "~%~s~%~%" '(in-package :cvk))
  (format stream "~s~%~%" `(cffi:defctype handle :pointer))
  (format stream "~s"
	  `(eval-when (:compile-toplevel :load-toplevel :execute)
	     (if (= 8 (cffi:foreign-type-size :pointer))
		 (cffi:defctype non-dispatchable-handle :pointer)
		 (cffi:defctype non-dispatchable-handle :uint64))))
  (loop for type-def in (context-type-code context)
	do (format stream "~%~%~s" type-def)))


(defun write-function-code (context stream)
  "Write the function definitions in the specified stream."
  (declare (type context context) (type stream stream))
  (format stream "~%~s~%~%" '(in-package :cvk))
  (format stream "~s"
	  '(defmacro multiple-defcfun ((foreign-name name funcall-name) ret-type &body args)
	    (let ((name-args (mapcar #'car args))
		  (ordered-args (mapcan (lambda (arg)
					  (list (cadr arg) (car arg)))
					args)))
	      (with-gensyms (func-ptr)
		`(progn
		   (defun ,name ,name-args
		     (cffi:foreign-funcall ,foreign-name ,@ordered-args ,ret-type))
		   (defun ,funcall-name ,(cons ,func-ptr ,name-args)
		     (cffi:foreign-funcall-pointer ,func-ptr () ,@ordered-args ,ret-type)))))))
  (loop for function-def in (context-function-code context)
	do (format stream "~%~%~s" function-def)))


(defun write-constant-code (context stream)
  "Write the constant definitions in the specified stream."
  (declare (type context context) (type stream stream))
  (format stream "~%~s~%~%" '(in-package :cvk))  
  (format stream "~s~%~%"
	  `(adp:defparameter uint64-max ,(1- (expt 2 64))))
  (format stream "~s~%~%"
	  `(adp:defparameter uint32-max ,(1- (expt 2 32))))
  (format stream "~s~%~%"
	  '(adp:defparameter VK_NULL_HANDLE (cffi:null-pointer)))
  (format stream "~s~%~%"
	  '(adp:defparameter VK_API_VERSION_1_0 (make-api-version 0 1 0 0)))
  (format stream "~s~%~%"
	  '(adp:defparameter VK_HEADER_VERSION 216))
  (format stream "~s"
	  '(adp:defparameter VK_HEADER_VERSION_COMPLETE (make-api-version 0 1 3 VK_HEADER_VERSION)))
  (loop for constant-def in (context-wrapped-constant-code context)
	do (format stream "~%~%~s"
		   constant-def)))


;; ------------------------------
;; ----- Bindings generator -----
;; ------------------------------

(defun generate-bindings ()
  "Generate the Common Vulkan bindings using the information from 'generation/vulkan_core_tail.h'.
Generate the files 'vulkan/ctypes.lisp', 'vulkan/cfunctions.lisp' and 'src/constants.lisp'"
  (let ((header-file (asdf:system-relative-pathname "common-vulkan" "generation/vulkan_core_tail.h"))
	(type-file (asdf:system-relative-pathname "common-vulkan" "vulkan/ctypes.lisp"))
	(function-file (asdf:system-relative-pathname "common-vulkan" "vulkan/cfunctions.lisp"))
	(constant-file (asdf:system-relative-pathname "common-vulkan" "src/constants.lisp")))
    (let ((context (read-header-file header-file))
	  (*package* (find-package :cvk)))
      (with-open-file (type-stream type-file :direction :output :if-exists :supersede :if-does-not-exist :create)
	(write-type-code context type-stream))
      (with-open-file (function-stream function-file :direction :output :if-exists :supersede :if-does-not-exist :create)
	(write-function-code context function-stream))
      (with-open-file (constant-stream constant-file :direction :output :if-exists :supersede :if-does-not-exist :create)
	(write-constant-code context constant-stream)))))
