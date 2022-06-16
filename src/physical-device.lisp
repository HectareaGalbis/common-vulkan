
(in-package :cvk)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Helper logic function
(defun implies (x y)
  (if x y t))

;; Returns a list of available devices
(defun enumerate-physical-devices (instance)
  (cffi:with-foreign-object (physical-device-count-ptr :uint32)
    (let ((result (vkEnumeratePhysicalDevices instance physical-device-count-ptr (cffi:null-pointer))))
      (check-vk-result result)
      (let ((physical-device-count (cffi:mem-ref physical-device-count-ptr :uint32)))
        (when (not (> physical-device-count 0))
          (error "enumerate-physical-devices error: No physical devices found"))
        (cffi:with-foreign-object (physical-devices-ptr 'VKPhysicalDevice physical-device-count)
          (vkEnumeratePhysicalDevices instance physical-device-count-ptr physical-devices-ptr)
          (loop for i from 0 below physical-device-count
            collect (cffi:mem-aref physical-devices-ptr 'VKPhysicalDevice i)))))))


;; Checks the type of a device
(defun check-device-type (physical-device-ptr type)
  (cffi:with-foreign-object (properties-ptr '(:struct VkPhysicalDeviceProperties))
    (vkGetPhysicalDeviceProperties physical-device-ptr properties-ptr)
    (equal (cffi:foreign-slot-value properties-ptr '(:struct VkPhysicalDeviceProperties) 'deviceType) type)))


;; Returns the available device extensions
(defun get-available-extensions (physical-device-ptr)
  (cffi:with-foreign-object (extension-count-ptr :uint32)
    (vkEnumerateDeviceExtensionProperties physical-device-ptr (cffi:null-pointer)
                                          extension-count-ptr (cffi:null-pointer))
    (let ((extension-count (cffi:mem-ref extension-count-ptr :uint32)))
      (cffi:with-foreign-object (available-extensions-ptr '(:struct VkExtensionProperties) extension-count)
        (vkEnumerateDeviceExtensionProperties physical-device-ptr (cffi:null-pointer)
                                              extension-count-ptr available-extensions-ptr)
        (loop for i from 0 below extension-count
          collect (cffi:foreign-string-to-lisp (cffi:foreign-slot-value (cffi:mem-aptr available-extensions-ptr
                                                                                       '(:struct VkExtensionProperties) i)
                                                                       '(:struct VkExtensionProperties) 'extensionName)))))))


;; Checks the availability of device extensions
(defun check-device-extensions (physical-device-ptr required-extensions)
  (let ((available-extensions (get-available-extensions physical-device-ptr)))
    (loop for required-extension in required-extensions
      always (loop for available-extension in available-extensions
               thereis (equal required-extension available-extension)))))


;; Returns the family queue properties from a device
(defun get-queue-family-properties (physical-device-ptr)
  (cffi:with-foreign-object (family-queue-count-ptr :uint32)
    (vkGetPhysicalDeviceQueueFamilyProperties physical-device-ptr family-queue-count-ptr (cffi:null-pointer))
    (let* ((family-queue-count (cffi:mem-ref family-queue-count-ptr :uint32))
           (queue-family-properties-ptr (cffi:foreign-alloc '(:struct VkQueueFamilyProperties) :count family-queue-count)))
      (vkGetPhysicalDeviceQueueFamilyProperties physical-device-ptr family-queue-count-ptr queue-family-properties-ptr)
      (values queue-family-properties-ptr family-queue-count))))

;; Frees the array creted in get-family-queues-properties
(defun free-queue-family-properties (queue-family-properties-ptr)
  (cffi:foreign-free queue-family-properties-ptr))

;; With family properties macro
(defwith with-queue-family-properties
         get-queue-family-properties
         free-queue-family-properties)


;; Checks if a family queue supports surface presentation
(defun get-physical-device-surface-support (physical-device surface family-index)
  (cffi:with-foreign-object (present-queue-ptr 'VkBool32)
    (vkGetPhysicalDeviceSurfaceSupportKHR physical-device family-index surface present-queue-ptr)
    (equal (cffi:mem-ref present-queue-ptr 'VkBool32) VK_TRUE)))


;; Checks the validity of family queues from a device
(defun check-queue-family-validity (physical-device-ptr required-flags surface)
  (with-queue-family-properties (queue-family-properties-ptr family-queue-count) (physical-device-ptr)
    (loop for i from 0 below family-queue-count
          for family-property = (cffi:mem-aptr queue-family-properties-ptr '(:struct VkQueueFamilyProperties) i)
          for saved-flags = (logand (cffi:foreign-slot-value family-property '(:struct VkQueueFamilyProperties) 'queueFlags)
                                    required-flags)
            then (logior saved-flags (logand (cffi:foreign-slot-value family-property '(:struct VkQueueFamilyProperties) 'queueFlags)
                                             required-flags))
          for saved-present-queue = (implies surface (get-physical-device-surface-support physical-device-ptr surface i))
            then (implies surface (or saved-present-queue (get-physical-device-surface-support physical-device-ptr surface i)))
          thereis (and (equal saved-flags required-flags) saved-present-queue))))


;; Checks the features availability of a device
(defun check-available-features (physical-device-ptr features)
  (cffi:with-foreign-object (vk-supported-features '(:struct VkPhysicalDeviceFeatures))
    (vkGetPhysicalDeviceFeatures physical-device-ptr vk-supported-features)
    (flet ((vk-check-feature (feature)
             (equal (cffi:foreign-slot-value vk-supported-features '(:struct VkPhysicalDeviceFeatures) feature)
                    VK_TRUE)))
      (loop for supported in (mapcar #'vk-check-feature features)
        always supported))))


;; Returns the capabilities of a surface
(defun create-surface-capabilities (physical-device-ptr surface-ptr)
  (let ((capabilities-ptr (cffi:foreign-alloc '(:struct VkSurfaceCapabilitiesKHR))))
    (vkGetPhysicalDeviceSurfaceCapabilitiesKHR physical-device-ptr surface-ptr capabilities-ptr)
    capabilities-ptr))

;; Destroys the capabilities surface struct
(defun destroy-surface-capabilities (capabilities-ptr)
  (cffi:foreign-free capabilities-ptr))

;; With surface capabilities macro
(defwith with-surface-capabilities
         create-surface-capabilities
         destroy-surface-capabilities)


;; Returns the available surface formats of a device and the count of surface formats
(defun create-surface-formats (physical-device-ptr surface-ptr)
  (cffi:with-foreign-object (format-count-ptr :uint32)
    (vkGetPhysicalDeviceSurfaceFormatsKHR physical-device-ptr surface-ptr format-count-ptr (cffi:null-pointer))
    (let* ((format-count (cffi:mem-ref format-count-ptr :uint32))
           (formats-ptr (cffi:foreign-alloc '(:struct VkSurfaceFormatKHR) :count format-count)))
      (vkGetPhysicalDeviceSurfaceFormatsKHR physical-device-ptr surface-ptr format-count-ptr formats-ptr)
      (values formats-ptr format-count))))

;; Frees a surface formats pointer.
(defun destroy-surface-formats (formats-ptr)
  (cffi:foreign-free formats-ptr))

;; With surface formats macro
(defwith with-surface-formats
         create-surface-formats
         destroy-surface-formats)


;; Returns the present modes of a surface and the count of present modes
(defun create-surface-present-modes (physical-device-ptr surface-ptr)
  (cffi:with-foreign-object (mode-count-ptr :uint32)
    (vkGetPhysicalDeviceSurfacePresentModesKHR physical-device-ptr surface-ptr mode-count-ptr (cffi:null-pointer))
    (let* ((mode-count (cffi:mem-ref mode-count-ptr :uint32))
           (present-modes-ptr (cffi:foreign-alloc 'VkPresentModeKHR :count mode-count)))
      (vkGetPhysicalDeviceSurfacePresentModesKHR physical-device-ptr surface-ptr mode-count-ptr present-modes-ptr)
      (values present-modes-ptr mode-count))))

;; Frees a surface present modes pointer
(defun destroy-surface-present-modes (present-modes-ptr)
  (cffi:foreign-free present-modes-ptr))

;; With surface present modes macro
(defwith with-surface-present-modes
         create-surface-present-modes
         destroy-surface-present-modes)


;; Check a surface validity
(defun check-surface-presentation-support (physical-device-ptr surface-ptr)
  (with-surface-formats (formats-ptr format-count) (physical-device-ptr surface-ptr)
    (declare (ignore formats-ptr))
    (with-surface-present-modes (modes-ptr mode-count) (physical-device-ptr surface-ptr)
      (declare (ignore modes-ptr))
      (and (> format-count 0) (> mode-count 0)))))


;; Returns a memory type verifying specific requirements
;; Returns nil if not memory type found
(defun get-memory-type (physical-device-ptr type-filter property-flags)
  (cffi:with-foreign-object (mem-properties-ptr '(:struct VkPhysicalDeviceMemoryProperties))
    (vkGetPhysicalDeviceMemoryProperties physical-device-ptr mem-properties-ptr)
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
(defun get-format (physical-device-ptr possible-formats tiling features)
  (let ((the-format (loop for format in possible-formats
                      thereis (cffi:with-foreign-object (format-properties-ptr '(:struct VkFormatProperties))
                                (vkGetPhysicalDeviceFormatProperties physical-device-ptr format format-properties-ptr)
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
(defun create-physical-device (instance &key (surface nil) (device-type VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU)
                                             (extensions (list "VK_KHR_swapchain"))
                                             (queue-flags (logior VK_QUEUE_GRAPHICS_BIT VK_QUEUE_TRANSFER_BIT))
                                             (features nil))
  (let* ((physical-devices (enumerate-physical-devices instance))
         (the-physical-device (loop for physical-device in physical-devices
                                    thereis (and (implies device-type (check-device-type physical-device device-type))
                                                 (implies extensions  (check-device-extensions physical-device extensions))
                                                 (implies features    (check-available-features physical-device features))
                                                 (implies surface     (check-surface-presentation-support physical-device surface))
                                                 (check-queue-family-validity physical-device queue-flags surface)
                                                 physical-device))))
    (when (not the-physical-device)
      (error "get-physical-device error: No valid physical device found"))
    the-physical-device))


;; With physical-device macro
(defwith with-physical-device create-physical-device values)
