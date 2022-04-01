
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



;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------
