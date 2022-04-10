
(in-package :cvk)

;;; -------------------------
;;; -------- Structs --------
;;; -------------------------

(defstruct vk-device
  device-ptr)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

(defun create-queue-create-infos (queue-families)
  (let ((queue-family-count (length queue-families))
        (queue-create-infos-ptr (cffi:foreign-alloc '(:struct VkDeviceQueueCreateInfo) :count queue-family-count)))
    (loop for queue-family in queue-families
          and i from 0 below queue-family-count
          for queue-count           = (vk-queue-family-queue-count queue-family)
          and family-index          = (vk-queue-family-index       queue-family)
          and queue-create-info-ptr = (cffi:mem-aptr queue-create-infos-ptr '(:struct VkDeviceQueueCreateInfo) i)
          for priority-ptr          = (cffi:foreign-alloc :float :count queue-count)
          do (loop for i from 0 below queue-count (setf (cffi:mem-aref priority-ptr :float i) 1.0))
             (cffi:with-foreign-slots ((sType queueFamilyIndex queueCount pQueuePriorities)
                                       queue-create-info-ptr '(:struct VkDeviceQueueCreateInfo))
               (setf sType            VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
                     queueFamilyIndex family-index
                     queueCount       queue-count
                     pQueuePriorities priority-ptr)))
    (values queue-create-infos-ptr)))


(defun destroy-queue-create-infos (queue-create-infos-ptr)
  (loop))  ;; Mirar lo del tamaño para liberar los priority-ptr

;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

(defun create-device (physical-device queue-families &key (extensions (list "VK_KHR_swapchain")) (features nil))
  (let ((physical-device-ptr (vk-physical-device-physical-device-ptr physical-device))
        (queue-family-count (length queue-families)))))
