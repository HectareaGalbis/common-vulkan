
(in-package :cvk)

;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a surface
(defun create-surface (instance window)
  (cffi:with-foreign-object (surface-ptr 'VkSurfaceKHR)
    (check-vk-result (glfw:create-window-surface instance window nil surface-ptr))
    (values (cffi:mem-ref surface-ptr 'VkSurfaceKHR) instance)))


;; Destroys a surface
(defun destroy-surface (surface instance)
  (vkDestroySurfaceKHR instance surface (cffi:null-pointer)))


;; With surface macro
(defwith with-surface create-surface destroy-surface :destructor-arity 2)
