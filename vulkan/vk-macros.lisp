
(in-package :cvk)


;; memset from C standard library (parece ser que puede dar problemas, mejor usar zero-struct)
(cffi:defcfun "memset" :pointer
  (str :pointer) (c :int) (n :size))


;; Creates an integer representing an vulkan version
(defmacro make-version (major minor patch)
  `(logior (ash ,major 22) (ash ,minor 12) ,patch))


;; Allocates an object and initialize all its members to zero.
(defun alloc-vulkan-object (struct-type &optional (count 1))
  (let ((object-ptr (cffi:foreign-alloc struct-type :count count)))
    (memset object-ptr 0 (* (cffi:foreign-type-size struct-type) count))
    (values object-ptr)))

;; Deallocates an object
(defun free-vulkan-object (object-ptr)
  (cffi:foreign-free object-ptr))

;; with-vulkan-object macro
(mcffi:defwith with-vulkan-object nil
  alloc-vulkan-object
  free-vulkan-object)


;; Works like a let, but accepts macros whose last expression must be a body or forms* expression.
;; This allows to avoid deep indentation.
(defmacro nest (clauses &body body)
  (first (reduce (lambda (c d) (list (append c d))) clauses :from-end t :initial-value body)))
