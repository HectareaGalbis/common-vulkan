
(in-package :cvk)


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a window
(defun create-window (name width height)
  (glfw:window-hint glfw:+client-api+ glfw:+no-api+)
  (glfw:window-hint glfw:+resizable+ glfw:+false+)
  (glfw:create-window width height name nil nil))


;; Destroys a window
(defun destroy-window (window)
  (glfw:destroy-window window))


;; With window macro
(defwith with-window create-window destroy-window)
