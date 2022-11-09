
(in-package :cvk)


;; Used by: VkDebugUtilsMessengerCreateInfoEXT, PFN_vkDebugUtilsMessengerCallbackEXT
(defparameter *debug-utils-messenger-callback-user-data* (make-hash-table))
(defparameter *debug-utils-messenger-callback-next-address* 1)


;; -------------------
;; ----- defcfun -----
;; -------------------

(adp:defmacro defcfun ((foreign-name name &optional (funcall-name nil)) return-type &body arguments)
  "Define a function or functions that call the foreign function with name FOREIGN-NAME. If NAME is specified, a 
function that call the foreign function is defined. If FUNCALL-NAME is specified, another function is defined 
which receive an extra parameter at the beginning. That extra parameter must be a foreign pointer to the foreign 
function. "
  (check-type foreign-name string)
  (check-type name symbol)
  (check-type funcall-name symbol)
  (loop for argument in arguments
	unless (and (listp argument)
		    (equal (length argument) 2)
		    (symbolp (car argument)))
	  do (error "Expected a list with a symbol and a foreign type. Found: ~s" argument))
  (assert (or name funcall-name) () "MORE-CFFI:defcfun : name and funcall-name are both nil")
  (multiple-value-bind (docstring real-arguments) (if (stringp (car arguments))
						      (values (car arguments) (cdr arguments))
						      (values nil arguments))
    (let ((name-args (mapcar #'car real-arguments))
	  (ordered-args (mapcan (lambda (arg) (list (cadr arg) (car arg))) real-arguments)))
      (with-gensyms (func-ptr)
	`(progn
	   ,@(when name
	       `((defun ,name ,name-args
		   ,@(when docstring `(,docstring))
		   (cffi:foreign-funcall ,foreign-name ,@ordered-args ,return-type))))
	   ,@(when funcall-name
	       `((defun ,funcall-name ,(cons func-ptr name-args)
		   ,@(when docstring `(,docstring))
		   (cffi:foreign-funcall-pointer ,func-ptr () ,@ordered-args ,return-type)))))))))


;; -----------------------------------
;; ----- define-foreign-function -----
;; -----------------------------------

(defun check-function-body (foreign-name body)
  (when foreign-name
    (unless (exists-rec (list foreign-name) body)
      (error "The foreign function ~s must be used in the body"
	     foreign-name))))

(adp:defmacro define-foreign-function ((foreign-name name &optional foreign-funcall-name funcall-name) args &body body)
  "Define at most two functions named NAME and FUNCALL-NAME. The symbol FOREIGN-NAME must be used in the BODY forms.
If NAME is non-NIL a function named NAME is defined as normally. If FOREIGN-FUNCALL-NAME and FUNCALL-NAME are non-NIL
a function named FUNCALL-NAME is defined. It is like NAME but receives an extra parameter that must be a pointer to the
foreign function represented by FOREIGN-NAME and FOREIGN-FUNCALL-NAME. Also, each call to FOREIGN-NAME is substituted by
FOREIGN-FUNCALL-NAME."
  (check-type foreign-name symbol)
  (check-type name (or symbol null))
  (check-type foreign-funcall-name (or symbol null))
  (check-type funcall-name (or symbol null))
  (assert (equal (not foreign-funcall-name) (not funcall-name)) () "Both foreign-funcall-name and funcall-name must be NIL or non-NIL values.")
  (check-function-body foreign-name body)
  (with-gensyms (func-pointer macrolet-args)
    `(progn
       ,@(when name
	   `((adp:defun ,name ,args ,@body)))
       ,@(when funcall-name
	   `((defun ,funcall-name ,(cons func-pointer args)
	       (labels ((,foreign-name (&rest ,macrolet-args)
			  (apply #',foreign-funcall-name ,func-pointer ,macrolet-args)))
		 ,@body)))))))
