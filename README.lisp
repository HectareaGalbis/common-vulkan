
(in-package :cvk)

(adp:write-in-file #P"README")

(adp:header "Common Vulkan")

(adp:text "Welcome to Common Vulkan! This library defines the Common Lisp bindings for the Vulkan library.")


(adp:subheader "Documentation")

;(adp:text "You can visit the " @h(api-reference-header) " or the " @h(common-vulkan-guide-header) ".")


(adp:subheader "Installation")

(adp:text "Common Vulkan is available on Ultralisp. If you don't have it, add it with " @c("(ql-dist:install-dist \"http://dist.ultralisp.org/\" :prompt nil)") ".")

(adp:text "Finally, install Common Vulkan with " @c("(ql:quickload :common-vulkan)") ".")


(adp:subheader "Progression")

(adp:text "The next values are an estimation of the completeness of this library:")


(defun defined-callbacks-count ()
  (let ((callbacks-file (asdf:system-relative-pathname "common-vulkan" "src/callbacks.lisp")))
    (with-open-file (istream callbacks-file)
      (loop for expr = (read istream nil)
	    while expr
	    count (eq (car expr) 'mcffi:define-callback-definer)))))

(defun defined-functions-count ()
  (let* ((cfunctions-file (asdf:system-relative-pathname "common-vulkan" "vulkan/cfunctions.lisp"))
	 (functions-file (asdf:system-relative-pathname "common-vulkan" "src/functions.lisp"))
	 (cfunctions-count (with-open-file (istream cfunctions-file)
			     (loop for expr = (read istream nil)
				   while expr
				   count (eq (car expr) 'multiple-defcfun))))
	 (functions-count (with-open-file (istream functions-file)
			    (loop for expr = (read istream nil)
				  while expr
				  count (eq (car expr) 'multiple-defun)))))
    (values cfunctions-count functions-count)))

(defun defined-structs-count ()
  (let* ((cstructs-file (asdf:system-relative-pathname "common-vulkan" "vulkan/ctypes.lisp"))
	 (structs-file (asdf:system-relative-pathname "common-vulkan" "src/structs.lisp"))
	 (cstructs-count (with-open-file (istream cstructs-file)
			   (loop for expr = (read istream nil)
				 while expr
				 count (member (car expr) '(cffi:defcstruct cffi:defcunion)))))
	 (structs-count (with-open-file (istream structs-file)
			  (loop for expr = (read istream nil)
				while expr
				count (eq (car expr) 'mcffi:define-foreign-struct)))))
    (values cstructs-count structs-count)))


(let ((callbacks-count (defined-callbacks-count)))
  (multiple-value-bind (cfunctions-count functions-count) (defined-functions-count)
    (multiple-value-bind (cstructs-count structs-count) (defined-structs-count)
      (let ((ctotal-count (+ 8 cfunctions-count cstructs-count))
	    (total-count (+ callbacks-count functions-count structs-count)))
	(adp:itemize (:item "Callbacks: " callbacks-count "/8" " (" (floor callbacks-count 8) "%)")
		     (:item "Functions: " functions-count "/" cfunctions-count " (" (floor functions-count cfunctions-count) "%)")
		     (:item "Structs: " structs-count "/" cstructs-count " (" (floor structs-count cstructs-count) "%)")
		     (:item "Total: " total-count "/" ctotal-count " (" (floor total-count ctotal-count) "%)"))))))
