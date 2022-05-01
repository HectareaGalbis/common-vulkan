
(in-package :cvk)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------




;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

(defun device-queue (device queue-family queue-index)
  (cffi:with-foreign-object (queue-ptr 'VkQueue)
    (vkGetDeviceQueue device (vk-queue-family-index queue-family) queue-index) queue-ptr
    (cffi:mem-ref queue-ptr)))

(defun device-queues (device queue-family)
  (loop for i from 0 below (vk-queue-family-queue-count queue-family)
        collect (device-queue device queue-family i)))
