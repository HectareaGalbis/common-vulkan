
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
  (let ((family-queues-properties (get-family-queues-properties vk-physical-device)))
    (loop for family-property in family-queues-properties
          and i from 0 below (length family-queues-properties)
          for saved-flags = 0 then (logand (cffi:foreign-slot-value family-queues-properties
                                                                    '(:struct VkQueueFamilyProperties) 'queueFlags)
                                           required-flags)
          and saved-present-queue = nil then (cffi:with-foreign-object (present-queue-ptr 'VkBool32)
                                               (vkGetPhysicalDeviceSurfaceSupportKHR vk-physical-device i
                                                                                     vk-surface present-queue-ptr)
                                               (or saved-present-queue (equal (cffi:mem-ref present-queue-ptr 'VkBool32) VK_TRUE)))
          when (and (equal saved-flags required-flags) saved-present-queue)
            return it)))


;; Checks the features availability of a device
(defun check-available-features (vk-physical-device vk-wanted-features)
  (cffi:with-foreign-object (vk-supported-features '(:struct VkPhysicalDeviceFeatures))
    (flet ((vk-implies (feature)
            (if (equal? (cffi:foreign-slot-value vk-wanted-features '(:struct VkPhysicalDeviceFeatures) feature)
                        VK_TRUE)
                (equal? (cffi:foreign-slot-value vk-supported-features '(:struct VkPhysicalDeviceFeatures) feature)
                        VK_TRUE)
                t)))
      (apply #'and
             (mapcar #'vk-implies '(robustBufferAccess fullDrawIndexUint32 imageCubeArray independentBlend)
                                   geometryShader tessellationShader sampleRateShading dualSrcBlend
                                   logicOp multiDrawIndirect drawIndirectFirstInstance depthClamp
                                   depthBiasClamp fillModeNonSolid depthBounds wideLines
                                   largePoints alphaToOne multiViewport samplerAnisotropy
                                   textureCompressionETC2 textureCompressionASTC_LDR textureCompressionBC occlusionQueryPrecise
                                   pipelineStatisticsQuery vertexPipelineStoresAndAtomics fragmentStoresAndAtomics
                                   shaderTessellationAndGeometryPointSize shaderImageGatherExtended shaderStorageImageExtendedFormats
                                   shaderStorageImageMultisample shaderStorageImageReadWithoutFormat shaderStorageImageWriteWithoutFormat
                                   shaderUniformBufferArrayDynamicIndexing shaderSampledImageArrayDynamicIndexing
                                   shaderStorageBufferArrayDynamicIndexing shaderStorageImageArrayDynamicIndexing shaderClipDistance
                                   shaderCullDistance shaderFloat64 shaderInt64 shaderInt16 shaderResourceResidency
                                   shaderResourceMinLod sparseBinding sparseResidencyBuffer sparseResidencyImage2D
                                   sparseResidencyImage3D sparseResidency2Samples sparseResidency4Samples sparseResidency8Samples
                                   sparseResidency16Samples sparseResidencyAliased variableMultisampleRate inheritedQueries)))))


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
           (formats-ptr (cffi:foreign-alloc '(:struct VkSurfaceFormatKHR) format-count)))
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
           (present-modes-ptr (cffi:foreign-alloc '(:struct VkPresentModeKHR) mode-count)))
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
                                                                          '(:struct VkMemoryType) 'propertyFlags)))
                                    i
                                    nil))))
        (when (not mem-type)
          (error "get-memory-type error: The memory type requested does not exist"))
        the-type))))


;; Returns a format verifying some requirements
(defun get-format (vk-physical-device possible-formats tiling features)
  (let ((the-format (loop for format in possible-formats
                      thereis (cffi:with-foreign-object format-properties-ptr '(:struct VkFormatProperties)
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

;; Creates a physical device features struct
(defun create-physical-device-features (&key (robustBufferAccess nil)
                                             (fullDrawIndexUint32 nil)
                                             (imageCubeArray nil)
                                             (independentBlend nil)
                                             (geometryShader nil)
                                             (tessellationShader nil)
                                             (sampleRateShading nil)
                                             (dualSrcBlend nil)
                                             (logicOp nil)
                                             (multiDrawIndirect nil)
                                             (drawIndirectFirstInstance nil)
                                             (depthClamp nil)
                                             (depthBiasClamp nil)
                                             (fillModeNonSolid nil)
                                             (depthBounds nil)
                                             (wideLines nil)
                                             (largePoints nil)
                                             (alphaToOne nil)
                                             (multiViewport nil)
                                             (samplerAnisotropy nil)
                                             (textureCompressionETC2 nil)
                                             (textureCompressionASTC_LDR nil)
                                             (textureCompressionBC nil)
                                             (occlusionQueryPrecise nil)
                                             (pipelineStatisticsQuery nil)
                                             (vertexPipelineStoresAndAtomics nil)
                                             (fragmentStoresAndAtomics nil)
                                             (shaderTessellationAndGeometryPointSize nil)
                                             (shaderImageGatherExtended nil)
                                             (shaderStorageImageExtendedFormats nil)
                                             (shaderStorageImageMultisample nil)
                                             (shaderStorageImageReadWithoutFormat nil)
                                             (shaderStorageImageWriteWithoutFormat nil)
                                             (shaderUniformBufferArrayDynamicIndexing nil)
                                             (shaderSampledImageArrayDynamicIndexing nil)
                                             (shaderStorageBufferArrayDynamicIndexing nil)
                                             (shaderStorageImageArrayDynamicIndexing nil)
                                             (shaderClipDistance nil)
                                             (shaderCullDistance nil)
                                             (shaderFloat64 nil)
                                             (shaderInt64 nil)
                                             (shaderInt16 nil)
                                             (shaderResourceResidency nil)
                                             (shaderResourceMinLod nil)
                                             (sparseBinding nil)
                                             (sparseResidencyBuffer nil)
                                             (sparseResidencyImage2D nil)
                                             (sparseResidencyImage3D nil)
                                             (sparseResidency2Samples nil)
                                             (sparseResidency4Samples nil)
                                             (sparseResidency8Samples nil)
                                             (sparseResidency16Samples nil)
                                             (sparseResidencyAliased nil)
                                             (variableMultisampleRate nil)
                                             (inheritedQueries nil))
  (cffi:with-foreign-object (physical-features-ptr '(:struct VkPhysicalDeviceFeatures))
    (setf (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'robustBufferAccess)
          (cffi:convert-to-foreign robustBufferAccess :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'fullDrawIndexUint32)
          (cffi:convert-to-foreign fullDrawIndexUint32 :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'imageCubeArray)
          (cffi:convert-to-foreign imageCubeArray :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'independentBlend)
          (cffi:convert-to-foreign independentBlend :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'geometryShader)
          (cffi:convert-to-foreign geometryShader :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'tessellationShader)
          (cffi:convert-to-foreign tessellationShader :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'sampleRateShading)
          (cffi:convert-to-foreign sampleRateShading :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'dualSrcBlend)
          (cffi:convert-to-foreign dualSrcBlend :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'logicOp)
          (cffi:convert-to-foreign logicOp :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'multiDrawIndirect)
          (cffi:convert-to-foreign multiDrawIndirect :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'drawIndirectFirstInstance)
          (cffi:convert-to-foreign drawIndirectFirstInstance :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'depthClamp)
          (cffi:convert-to-foreign depthClamp :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'depthBiasClamp)
          (cffi:convert-to-foreign depthBiasClamp :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'fillModeNonSolid)
          (cffi:convert-to-foreign fillModeNonSolid :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'depthBounds)
          (cffi:convert-to-foreign depthBounds :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'wideLines)
          (cffi:convert-to-foreign wideLines :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'largePoints)
          (cffi:convert-to-foreign largePoints :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'alphaToOne)
          (cffi:convert-to-foreign alphaToOne :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'multiViewport)
          (cffi:convert-to-foreign multiViewport :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'samplerAnisotropy)
          (cffi:convert-to-foreign samplerAnisotropy :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'textureCompressionETC2)
          (cffi:convert-to-foreign textureCompressionETC2 :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'textureCompressionASTC_LDR)
          (cffi:convert-to-foreign textureCompressionASTC_LDR :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'textureCompressionBC)
          (cffi:convert-to-foreign textureCompressionBC :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'occlusionQueryPrecise)
          (cffi:convert-to-foreign occlusionQueryPrecise :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'pipelineStatisticsQuery)
          (cffi:convert-to-foreign pipelineStatisticsQuery :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'vertexPipelineStoresAndAtomics)
          (cffi:convert-to-foreign vertexPipelineStoresAndAtomics :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'fragmentStoresAndAtomics)
          (cffi:convert-to-foreign fragmentStoresAndAtomics :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeature'shaderTessellationAndGeometryPointSize))
          (cffi:convert-to-foreign shaderTessellationAndGeometryPointSize :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderImageGatherExtended)
          (cffi:convert-to-foreign shaderImageGatherExtended :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderStorageImageExtendedFormats)
          (cffi:convert-to-foreign shaderStorageImageExtendedFormats :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderStorageImageMultisample)
          (cffi:convert-to-foreign shaderStorageImageMultisample :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderStorageImageReadWithoutFormat)
          (cffi:convert-to-foreign shaderStorageImageReadWithoutFormat :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderStorageImageWriteWithoutFormat)
          (cffi:convert-to-foreign shaderStorageImageWriteWithoutFormat :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeature'shaderUniformBufferArrayDynamicIndexing))
          (cffi:convert-to-foreign shaderUniformBufferArrayDynamicIndexing :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeature'shaderSampledImageArrayDynamicIndexing))
          (cffi:convert-to-foreign shaderSampledImageArrayDynamicIndexing :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeature'shaderStorageBufferArrayDynamicIndexing))
          (cffi:convert-to-foreign shaderStorageBufferArrayDynamicIndexing :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeature'shaderStorageImageArrayDynamicIndexing))
          (cffi:convert-to-foreign shaderStorageImageArrayDynamicIndexing :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderClipDistance)
          (cffi:convert-to-foreign shaderClipDistance :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderCullDistance)
          (cffi:convert-to-foreign shaderCullDistance :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderFloat64)
          (cffi:convert-to-foreign shaderFloat64 :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderInt64)
          (cffi:convert-to-foreign shaderInt64 :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderInt16)
          (cffi:convert-to-foreign shaderInt16 :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderResourceResidency)
          (cffi:convert-to-foreign shaderResourceResidency :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'shaderResourceMinLod)
          (cffi:convert-to-foreign shaderResourceMinLod :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'sparseBinding)
          (cffi:convert-to-foreign sparseBinding :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'sparseResidencyBuffer)
          (cffi:convert-to-foreign sparseResidencyBuffer :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'sparseResidencyImage2D)
          (cffi:convert-to-foreign sparseResidencyImage2D :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'sparseResidencyImage3D)
          (cffi:convert-to-foreign sparseResidencyImage3D :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'sparseResidency2Samples)
          (cffi:convert-to-foreign sparseResidency2Samples :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'sparseResidency4Samples)
          (cffi:convert-to-foreign sparseResidency4Samples :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'sparseResidency8Samples)
          (cffi:convert-to-foreign sparseResidency8Samples :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'sparseResidency16Samples)
          (cffi:convert-to-foreign sparseResidency16Samples :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'sparseResidencyAliased)
          (cffi:convert-to-foreign sparseResidencyAliased :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'variableMultisampleRate)
          (cffi:convert-to-foreign variableMultisampleRate :boolean)
          (cffi:foreign-slot-value physical-features-ptr '(:struct VkPhysicalDeviceFeatures) 'inheritedQueries)
          (cffi:convert-to-foreign inheritedQueries :boolean))))


;; Returns a device verifying some requirements
(defun get-physical-device (instance &key (surface nil) (type VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU) (extensions (list VK_KHR_SWAPCHAIN_EXTENSION_NAME)) (queue-flags (logior VK_QUEUE_GRAPHICS_BIT VK_QUEUE_TRANSFER_BIT VK_QUEUE_COMPUTE_BIT)) (features nil)))
  
