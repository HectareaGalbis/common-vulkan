
(in-package :cvk)


;; physical device struct
(defstruct physical-device
  vk-physical-device)


;; physical device features struct
(defstruct physical-device-features
  vk-physical-device-features)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Returns a list of available devices
(defun enumerate-physical-devices (vk-instance)
  (cffi:with-foreign-object (physical-device-count-ptr :uint32)
    (let ((result (vkEnumeratePhysicalDevices vk-instance physical-device-count-ptr (cffi:null-pointer)))
          (physical-device-count (mem-ref physical-device-count-ptr :uint32)))
      (check-result result)
      (when (not (> physical-device-count 0))
        (error "enumerate-physical-devices error: No physical devices found"))
      (cffi:with-foreign-object (physical-devices-ptr 'VKPhysicalDevice physical-device-count)
        (vkEnumeratePhysicalDevices vk-instance physical-device-count-ptr physical-devices-ptr)
        (loop for i from 0 below physical-device-count
          collect (mem-aref physical-devices-ptr 'VKPhysicalDevice i))))))


;; Checks the type of a device
(define check-type (vk-physical-device type)
  (cffi:with-foreign-object (properties-ptr '(:struct VkPhysicalDeviceProperties))
    (vkGetPhysicalDeviceProperties vk-physica-device properties-ptr)
    (equal (cffi:foreign-slot-value properties-ptr '(:struct VkPhysicalDeviceProperties) 'deviceType) type)))


;; Returns the available device extensions
(defun get-available-extensions (vk-physical-device)
  (cffi:with-foreign-object (extension-count-ptr :uint32)
    (vkEnumerateDeviceExtensionProperties vk-physical-device (cffi:null-pointer)
                                          extension-count-ptr (cffi:null-pointer))
    (let ((extension-count (cffi:mem-ref extension-count-ptr :uint32)))
      (cffi:with-foreign-object (available-extensions-ptr '(:struct VkExtensionProperties) extension-count)
        (vkEnumerateDeviceExtensionProperties vk-physical-device (cffi:null-pointer)
                                              extension-count-ptr available-extensions-ptr)
        (loop for i from 0 below extension-count
          collect (cffi:foreign-string-to-lisp (cffi:foreign-slot-value (cffi:mem-aptr available-extensions-ptr
                                                                                       '(:struct VkExtensionProperties) i)
                                                                       '(:struct VkExtensionProperties) 'extensionName)))))))


;; Checks the availability of device extensions
(defun check-device-extensions (vk-physical-device required-extensions)
  (let ((available-extensions (get-available-extensions vk-physical-device)))
    (loop for required-extension in required-extensions
      always (loop for available-extension in available-extensions
               thereis (equal required-extension available-extension)))))


;; Returns the family queue properties from a device
(defun get-family-queues-properties (vk-physical-device)
  (cffi:with-foreign-object (family-queue-count-ptr :uint32)
    (vkGetPhysicalDeviceQueueFamilyProperties vk-physical-device family-queue-count-ptr (cffi:null-pointer))
    (let ((family-queue-count (cffi:mem-ref family-queue-count-ptr :uint32)))
      (cffi:with-foreign-object (family-queues-properties-ptr '(:struct VkQueueFamilyProperties) family-queue-count)
        (vkGetPhysicalDeviceQueueFamilyProperties vk-physical-device family-queue-count-ptr family-queues-properties-ptr)
        (loop for i from 0 below family-queue-count
          collect (cffi:mem-aptr family-queues-properties-ptr '(:struct VkQueueFamilyProperties) i))))))


;; Checks the validity of family queues from a device
(defun check-queue-family-validity (vk-physical-device required-flags vk-surface)
  (let ((family-queues-properties (get-family-queues-properties vk-physical-device)))))
    


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------
