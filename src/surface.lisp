
(in-package :cvk)


;; Struct surface
(defstruct vk-surface
  instance-ptr
  surface-ptr)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Creates a vulkan surface from a window
(defun create-window-surface (instance-ptr window-ptr)
  (cffi:with-foreign-object (surface-ptr 'VkSurfaceKHR)
    (let ((result (glfw:create-window-surface instance-ptr window-ptr nil surface-ptr)))
      (check-result result)
      (cffi:mem-ref surface-ptr 'VkSurfaceKHR))))


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a surface
(defun create-vk-surface (instance window)
  (let ((instance-ptr (vk-instance-instance-ptr instance))
        (window-ptr (glfw-window-window-ptr window)))
    (let ((surface-ptr (create-window-surface instance-ptr window-ptr)))
      (make-vk-surface :instance-ptr instance-ptr :surface-ptr surface-ptr))))


;; Destroys a surface
(defun destroy-vk-surface (surface)
  (let ((instance-ptr (vk-surface-instance-ptr surface))
        (surface-ptr  (vk-surface-surface-ptr surface)))
    (vkDestroySurfaceKHR instance-ptr surface-ptr (cffi:null-pointer))))


;; With surface macro
(defwith with-vk-surface create-vk-surface destroy-vk-surface)
