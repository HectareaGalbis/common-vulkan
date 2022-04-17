
(in-package :cvk)

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

(defun create-semaphore (device)
  (with-semaphore-info semaphore-info-ptr ()
    (cffi:with-foreign-object (semaphore-ptr 'VkSemaphore)
      (check-vk-result (vkCreateSemaphore device-ptr semaphore-info-ptr (cffi:null-pointer) semaphore-ptr))
      (values (cffi:mem-ref semaphore-ptr) device))))

(defun destroy-semaphore (semaphore device)
  (vkDestroySemaphore device semaphore (cffi:null-pointer)))

(defwith with-semaphore
         create-semaphore
         destroy-semaphore)
