
(in-package :cvk)


;; physical device struct
(defstruct physical-device
  vk-physical-device)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Returns a list of available devices
(defun enumerate-physical-devices (vk-instance)
  (cffi:with-foreign-object (physical-device-count-ptr :uint32)
    (let ((result (vkEnumeratePhysicalDevices vk-instance physical-device-count-ptr (cffi:null-pointer))))
      (check-result result)
      (let ((physical-device-count (cffi:mem-ref physical-device-count-ptr :uint32)))
        (when (not (> physical-device-count 0))
          (error "enumerate-physical-devices error: No physical devices found"))
        (cffi:with-foreign-object (physical-devices-ptr 'VKPhysicalDevice physical-device-count)
          (vkEnumeratePhysicalDevices vk-instance physical-device-count-ptr physical-devices-ptr)
          (loop for i from 0 below physical-device-count
            collect (cffi:mem-aref physical-devices-ptr 'VKPhysicalDevice i)))))))


;; Checks the type of a device
(defun check-device-type (vk-physical-device type)
  (cffi:with-foreign-object (properties-ptr '(:struct VkPhysicalDeviceProperties))
    (vkGetPhysicalDeviceProperties vk-physical-device properties-ptr)
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
  (let ((family-queues-properties (get-family-queues-properties vk-physical-device)))
    (loop for family-property in family-queues-properties
          and i from 0 below (length family-queues-properties)
          for saved-flags = 0 then (logand (cffi:foreign-slot-value family-property
                                                                    '(:struct VkQueueFamilyProperties) 'queueFlags)
                                           required-flags)
          and saved-present-queue = nil then (cffi:with-foreign-object (present-queue-ptr 'VkBool32)
                                               (vkGetPhysicalDeviceSurfaceSupportKHR vk-physical-device i
                                                                                     vk-surface present-queue-ptr)
                                               (or saved-present-queue (equal (cffi:mem-ref present-queue-ptr 'VkBool32) VK_TRUE)))
          when (and (equal saved-flags required-flags) saved-present-queue)
            return it)))


;; Checks the features availability of a device
(defun check-available-features (vk-physical-device features)
  (cffi:with-foreign-object (vk-supported-features '(:struct VkPhysicalDeviceFeatures))
    (vkGetPhysicalDeviceFeatures vk-physical-device vk-supported-features)
    (flet ((vk-check-feature (feature)
             (equal (cffi:foreign-slot-value vk-supported-features '(:struct VkPhysicalDeviceFeatures) feature)
                    VK_TRUE)))
      (loop for supported in (mapcar #'vk-check-feature features)
        always supported))))


;; Returns the capabilities of a surface
(defun create-surface-capabilities (vk-physical-device vk-surface)
  (let ((capabilities-ptr (cffi:foreign-alloc '(:struct VkSurfaceCapabilitiesKHR))))
    (vkGetPhysicalDeviceSurfaceCapabilitiesKHR vk-physical-device vk-surface capabilities-ptr)
    capabilities-ptr))

;; Destroys the capabilities surface struct
(defun destroy-surface-capabilities (capabilities-ptr)
  (cffi:foreign-free capabilities-ptr))

;; With surface capabilities macro
(defwith with-surface-capabilities
         create-surface-capabilities
         destroy-surface-capabilities)


;; Returns the available surface formats of a device and the count of surface formats
(defun create-surface-formats (vk-physical-device vk-surface)
  (cffi:with-foreign-object (format-count-ptr :uint32)
    (vkGetPhysicalDeviceSurfaceFormatsKHR vk-physical-device vk-surface format-count-ptr (cffi:null-pointer))
    (let* ((format-count (cffi:mem-ref format-count-ptr :uint32))
           (formats-ptr (cffi:foreign-alloc '(:struct VkSurfaceFormatKHR) :count format-count)))
      (vkGetPhysicalDeviceSurfaceFormatsKHR vk-physical-device vk-surface format-count-ptr formats-ptr)
      (values formats-ptr format-count))))

;; Frees a surface formats pointer.
(defun destroy-surface-formats (formats-ptr)
  (cffi:foreign-free formats-ptr))

;; With surface formats macro
(defwith with-surface-formats
         create-surface-formats
         destroy-surface-formats)


;; Returns the present modes of a surface and the count of present modes
(defun create-surface-present-modes (vk-physical-device vk-surface)
  (cffi:with-foreign-object (mode-count-ptr :uint32)
    (vkGetPhysicalDeviceSurfacePresentModesKHR vk-physical-device vk-surface mode-count-ptr (cffi:null-pointer))
    (let* ((mode-count (cffi:mem-ref mode-count-ptr :uint32))
           (present-modes-ptr (cffi:foreign-alloc 'VkPresentModeKHR :count mode-count)))
      (vkGetPhysicalDeviceSurfacePresentModesKHR vk-physical-device vk-surface mode-count-ptr present-modes-ptr)
      present-modes-ptr)))

;; Frees a surface present modes pointer
(defun destroy-surface-present-modes (present-modes-ptr)
  (cffi:foreign-free present-modes-ptr))

;; With surface present modes macro
(defwith with-surface-present-modes
         create-surface-present-modes
         destroy-surface-present-modes)


;; Check a surface validity
(defun check-surface-presentation-support (vk-physical-device vk-surface)
  (with-surface-formats ((formats-ptr format-count) vk-physical-device vk-surface)
    (with-surface-present-modes ((modes-ptr mode-count) vk-physical-device vk-surface)
      (and (> format-count 0) (> mode-count 0)))))


;; Returns a memory type verifying specific requirements
;; Returns nil if not memory type found
(defun get-memory-type (vk-physical-device type-filter property-flags)
  (cffi:with-foreign-object (mem-properties-ptr '(:struct VkPhysicalDeviceMemoryProperties))
    (vkGetPhysicalDeviceMemoryProperties vk-physical-device mem-properties-ptr)
    (cffi:with-foreign-slots ((memoryTypeCount memoryTypes) mem-properties-ptr (:struct VkPhysicalDeviceMemoryProperties))
      (let ((the-type (loop for i from 0 below memoryTypeCount
                        thereis (if (and (not (zerop (logand type-filter (ash 1 i))))
                                         (logand (cffi:foreign-slot-value (cffi:mem-aptr memoryTypes '(:struct VkMemoryType) i)
                                                                          '(:struct VkMemoryType) 'propertyFlags)
                                                 property-flags))
                                    i
                                    nil))))
        (when (not the-type)
          (error "get-memory-type error: The memory type requested does not exist"))
        the-type))))


;; Returns a format verifying some requirements
(defun get-format (vk-physical-device possible-formats tiling features)
  (let ((the-format (loop for format in possible-formats
                      thereis (cffi:with-foreign-object (format-properties-ptr '(:struct VkFormatProperties))
                                (vkGetPhysicalDeviceFormatProperties vk-physical-device format format-properties-ptr)
                                (cffi:with-foreign-slots ((linearTilingFeatures optimalTilingFeatures)
                                                          format-properties-ptr (:struct VkFormatProperties))
                                  (cond
                                    ((and (equal tiling VK_IMAGE_TILING_LINEAR)
                                          (equal (logand linearTilingFeatures features)
                                                 features)
                                      format))
                                    ((and (equal tiling VK_IMAGE_TILING_OPTIMAL)
                                          (equal (logand optimalTilingFeatures features)
                                                 features))
                                     format)
                                    (t nil)))))))
    (when (not the-format)
      (error "get-format error: The format requested does not exist"))
    the-format))


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Returns a device verifying some requirements
(defun get-physical-device (instance &key (surface nil) (device-type VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU)
                            (extensions (list "VK_KHR_swapchain"))
                            (queue-flags (logior VK_QUEUE_GRAPHICS_BIT VK_QUEUE_TRANSFER_BIT VK_QUEUE_COMPUTE_BIT))
                            (features nil))
  (let ((vk-instance (vulkan-instance-vk-instance instance))
        (vk-surface  (and surface (surface-vk-surface surface))))
    (let ((physical-devices (enumerate-physical-devices vk-instance)))
      (flet ((implies (x y) (if x y t)))
        (let ((the-physical-device (loop for vk-physical-device in physical-devices
                                     thereis (and (implies device-type (print (check-device-type vk-physical-device device-type)))
                                                  (implies extensions  (print (check-device-extensions vk-physical-device extensions)))
                                                  (implies vk-surface
                                                           (print (check-queue-family-validity vk-physical-device queue-flags vk-surface)))
                                                  (implies features    (print (check-available-features vk-physical-device features)))
                                                  (implies vk-surface  (print (check-surface-presentation-support vk-physical-device vk-surface)))
                                                  vk-physical-device))))
          (when (not the-physical-device)
            (error "get-physical-device error: No valid physical device found"))
          (make-physical-device :vk-physical-device the-physical-device))))))


;; With physical-device macro
(defwith with-physical-device get-physical-device values)


;; Returns the family queues properties from a device
(defun get-device-queues-properties (physical-device)
  (let ((vk-physical-device (physical-device-vk-physical-device physical-device)))
    (get-family-queues-properties vk-physical-device)))
