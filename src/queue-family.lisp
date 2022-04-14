
(in-package :cvk)


;;; -------------------------
;;; -------- Structs --------
;;; -------------------------

(defstruct vk-queue-family
  index
  queue-flags
  queue-count)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Returns a list of family queues that verifies some conditions
(defun get-queue-families (physical-device-ptr queue-flags min-queue-count surface-ptr exclusive-flags family-exceptions)
  (with-queue-family-properties ((queue-family-properties-ptr family-queue-count) physical-device-ptr)
    (loop for i from 0 below family-queue-count
          for family-property-ptr  = (cffi:mem-aptr queue-family-properties-ptr  '(:struct VkQueueFamilyProperties) i)
          for property-flags       = (cffi:foreign-slot-value family-property-ptr '(:struct VkQueueFamilyProperties) 'queueFlags)
          and property-queue-count = (cffi:foreign-slot-value family-property-ptr '(:struct VkQueueFamilyProperties) 'queueCount)
          if (and (implies (> queue-flags 0) (equal (logand property-flags queue-flags) queue-flags))
                  (implies exclusive-flags   (equal (logior property-flags queue-flags) queue-flags))
                  (implies surface-ptr (cffi:with-foreign-object (present-queue-ptr 'VkBool32)
                                        (vkGetPhysicalDeviceSurfaceSupportKHR physical-device-ptr i surface-ptr present-queue-ptr)
                                        (equal (cffi:mem-ref present-queue-ptr 'VKBool32) VK_TRUE)))
                  (>= property-queue-count min-queue-count)
                  (not (loop for family-exception in family-exceptions
                             thereis (equal (vk-queue-family-index family-exception) i))))
            collect (make-vk-queue-family :index i :queue-flags property-flags :queue-count property-queue-count))))


;; Returns a family queue that verifies some conditions
(defun get-queue-family (physical-device-ptr queue-flags min-queue-count surface-ptr exclusive-flags family-exceptions)
  (with-queue-family-properties ((queue-family-properties-ptr family-queue-count) physical-device-ptr)
    (loop for i from 0 below family-queue-count
          for family-property-ptr  = (cffi:mem-aptr queue-family-properties-ptr  '(:struct VkQueueFamilyProperties) i)
          for property-flags       = (cffi:foreign-slot-value family-property-ptr '(:struct VkQueueFamilyProperties) 'queueFlags)
          and property-queue-count = (cffi:foreign-slot-value family-property-ptr '(:struct VkQueueFamilyProperties) 'queueCount)
          if (and (implies (> queue-flags 0) (equal (logand property-flags queue-flags) queue-flags))
                  (implies exclusive-flags   (equal (logior property-flags queue-flags) queue-flags))
                  (implies surface-ptr (cffi:with-foreign-object (present-queue-ptr 'VkBool32)
                                         (vkGetPhysicalDeviceSurfaceSupportKHR physical-device-ptr i surface-ptr present-queue-ptr)
                                         (equal (cffi:mem-ref present-queue-ptr 'VKBool32) VK_TRUE)))
                  (>= property-queue-count min-queue-count)
                  (not (loop for family-exception in family-exceptions
                             thereis (equal (vk-queue-family-index family-exception) i))))
            return (make-vk-queue-family :index i :queue-flags property-flags :queue-count property-queue-count))))


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Returns a list of family queues that verifies some conditions
(defun vk-physical-device-queue-families (physical-device &key (queue-flags (logior VK_QUEUE_GRAPHICS_BIT VK_QUEUE_TRANSFER_BIT))
                                                               (min-queue-count 0) (surface nil) (exclusive-flags nil)
                                                               (family-exceptions nil))
  (let ((physical-device-ptr (vk-physical-device-physical-device-ptr physical-device))
        (surface-ptr (vk-surface-surface-ptr surface)))
    (get-queue-families physical-device-ptr queue-flags min-queue-count surface-ptr exclusive-flags family-exceptions)))


;; Returns a family queue that verifies some conditions
(defun vk-physical-device-queue-family (physical-device &key (queue-flags (logior VK_QUEUE_GRAPHICS_BIT VK_QUEUE_TRANSFER_BIT))
                                                             (min-queue-count 0) (surface nil) (exclusive-flags nil)
                                                             (family-exceptions nil))
  (let ((physical-device-ptr (vk-physical-device-physical-device-ptr physical-device))
        (surface-ptr (vk-surface-surface-ptr surface)))
    (get-queue-family physical-device-ptr queue-flags min-queue-count surface-ptr exclusive-flags family-exceptions)))
