
(in-package :cvk)

;;; -------------------------
;;; -------- Structs --------
;;; -------------------------

(defstruct vk-semaphore
  device-ptr
  semaphore-ptr)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Creates a semaphore info struct
(defun create-semaphore-info ()
  (let ((semaphore-info-ptr (cffi:foreign-alloc '(:struct VkSemaphoreCreateInfo))))
    (memset semaphore-info-ptr 0 (cffi:foreign-type-size '(:struct VkSemaphoreCreateInfo)))
    (cffi:with-foreign-slots ((sType) semaphore-info-ptr (:struct VkSemaphoreCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO))
    (values semaphore-info-ptr)))

;; Destroys a semaphore info struct
(defun destroy-semaphore-info (semaphore-info-ptr)
  (cffi:foreign-free semaphore-info-ptr))

;; With semaphore info macro
(defwith with-semaphore-info
         create-semaphore-info
         destroy-semaphore-info)


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

(defun create-vk-semaphore (device)
  (let ((device-ptr (vk-device-device-ptr device)))
    (with-semaphore-info (semaphore-info-ptr)
      (cffi:with-foreign-object (semaphore-ptr 'VkSemaphore)
        (check-vk-result (vkCreateSemaphore device-ptr semaphore-info-ptr (cffi:null-pointer) semaphore-ptr))
        (make-vk-device :device-ptr (cffi:mem-ref semaphore-ptr))))))

(defun destroy-vk-semaphore (semaphore)
  (let ((device-ptr (vk-semaphore-device-ptr semaphore))
        (semaphore-ptr (vk-semaphore-semaphore-ptr semaphore)))))

(defwith with-vk-semaphore
         create-vk-semaphore
         destroy-vk-semaphore)
