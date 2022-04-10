
(in-package :cvk)


;; Window struct
(defstruct glfw-window
  window-ptr)


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a window
(defun create-glfw-window (name width height)
  (glfw:window-hint glfw:+client-api+ glfw:+no-api+)
  (glfw:window-hint glfw:+resizable+ glfw:+false+)
  (let ((window-ptr (glfw:create-window width height name nil nil)))
    (make-glfw-window :window-ptr window-ptr)))


;; Destroys a window
(defun destroy-glfw-window (window)
  (glfw:destroy-window (glfw-window-window-ptr window)))


;; With window macro
(defwith with-glfw-window create-glfw-window destroy-glfw-window)
