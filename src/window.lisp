
(in-package :cvk)


;; Window struct
(defstruct window
  glfw-window)


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a window
(defun create-window (name width height)
  (glfw:window-hint glfw:+client-api+ glfw:+no-api+)
  (glfw:window-hint glfw:+resizable+ glfw:+false+)
  (let ((window-ptr (glfw:create-window width height name nil nil)))
    (make-window :glfw-window window-ptr)))


;; Destroys a window
(defun destroy-window (window)
  (glfw:destroy-window (window-glfw-window window)))


;; With window macro
(defwith with-window create-window destroy-window)
