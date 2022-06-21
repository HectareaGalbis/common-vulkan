
# Base code

## General structure

We are going to start with the following code in our `main.lisp` file.

```lisp
;;; main.lisp

(in-package :cvg)


(defclass hello-triangle-application ()
  ((window :accessor window :initform nil)))

(defgeneric init-vulkan (obj))
(defgeneric main-loop (obj))
(defgeneric cleanup (obj))
(defgeneric run (obj))


(defmethod init-vulkan ((obj hello-triangle-application)))

(defmethod main-loop ((obj hello-triangle-application)))

(defmethod cleanup ((obj hello-triangle-application)))

(defmethod run ((obj hello-triangle-application))
  (init-vulkan obj)
  (main-loop obj)
  (cleanup obj))


(defun main ()
  (let ((app (make-instance 'hello-triangle-application)))
    (run app)))
```
