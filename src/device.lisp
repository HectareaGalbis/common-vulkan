
(in-package :cvk)

;;; -------------------------
;;; -------- Structs --------
;;; -------------------------

(defstruct vk-device
  device-ptr)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Creates a list of pointers to queues create infos
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
                     pQueuePriorities priority-ptr))
          collect queue-create-info-ptr)))

;; Destroys a list of pointers to queue create infos
(defun destroy-queue-create-infos (queue-create-infos-ptr)
  (loop for queue-create-info-ptr in queue-create-infos-ptr
    do (cffi:with-foreign-slots ((pQueuePriorities) queue-create-info-ptr '(:struct VkDeviceQueueCreateInfo))
         (cffi:foreign-free pQueuePriorities)))
  (cffi:foreign-free (first queue-create-infos-ptr)))

;; With queue create infos macro
(defwith with-queue-create-infos
         create-queue-create-infos
         destroy-queue-create-infos)


;; Create a device create info
(defun create-device-create-info (queue-create-infos extensions features)
  (let ((device-create-info-ptr (cffi:foreign-alloc '(:struct VkDeviceCreateInfo)))
        (extensions-ptr (cffi:foreign-alloc :string :initial-contents extensions)))
    (memset device-create-info-ptr 0 (cffi:foreign-type-size '(:struct VkDeviceCreateInfo)))
    (cffi:with-foreign-slots ((sType queueCreateInfoCount pQueueCreateInfos enabledExtensionCount
                               ppEnabledExtensionNames pEnabledFeatures))
      (setf sType VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
            queueCreateInfoCount (length queue-create-infos)
            pQueueCreateInfos (first queue-create-infos)
            enabledExtensionCount (length extensions)
            ppEnabledExtensionNames extensions-ptr)))) ; Faltan las features

;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

(defun create-device (physical-device queue-families &key (extensions (list "VK_KHR_swapchain")) (features nil))
  (let ((physical-device-ptr (vk-physical-device-physical-device-ptr physical-device))
        (queue-family-count (length queue-families)))
    (with-queue-create-infos (queue-create-infos queue-families)
      (cffi:with-vulkan-object (device-create-info VkDeviceCreateInfo)
        (cffi:with-foreign-slots ((sType queueCreateInfoCount pQueueCreateInfos enabledExtensionCount
                                   ppEnabledExtensionNames pEnabledFeatures))
          (setf sType VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
                queueCreateInfoCount (length queue-create-infos)))))))
