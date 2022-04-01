
(in-package :cvk)


;; Struct surface
(defstruct surface
  vk-instance
  vk-surface)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Creates a vulkan surface from a window
(defun create-window-surface (vk-instance glfw-window)
  (cffi:with-foreign-object (vk-surface-ptr 'VkSurfaceKHR)
    (let ((result (glfw:create-window-surface vk-instance glfw-window nil vk-surface-ptr)))
      (check-result result)
      (cffi:mem-ref vk-surface-ptr 'VkSurfaceKHR))))


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a surface
(defun create-surface (instance window)
  (let ((vk-instance (vulkan-instance-vk-instance instance))
        (glfw-window (window-glfw-window window)))
    (let ((vk-surface (create-window-surface vk-instance glfw-window)))
      (make-surface :vk-instance vk-instance :vk-surface vk-surface))))


;; Destroys a surface
(defun destroy-surface (surface)
  (let ((vk-instance (surface-vk-instance surface))
        (vk-surface  (surface-vk-surface surface)))
    (vkDestroySurfaceKHR vk-instance vk-surface (cffi:null-pointer))))


;; With surface macro
(defwith with-surface create-surface destroy-surface)
