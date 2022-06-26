
(in-package :cvk)


;;; -------------------
;;; ----- Structs -----
;;; -------------------

;; VkPhysicalDeviceProperties getters
(mcffi:def-foreign-accessors physical-device-properties (:struct VkPhysicalDeviceProperties)
  (apiVersion :setter nil)
  (driverVersion :setter nil)
  (vendorID :setter nil)
  (deviceID :setter nil)
  (deviceType :setter nil)
  (deviceName :getter (() (cffi:foreign-string-to-lisp deviceName))
	      :setter nil)
  (pipelineCacheUUID :getter ((&optional index)
			      (if index
				  (cffi:mem-aref pipelineCacheUUID :uint8 index)
				  (loop for i from 0 below VK_UUID_SIZE
					collect (cffi:mem-aref pipelineCacheUUID :uint8 i))))
		     :setter nil)
  (limits :setter nil)
  (sparseProperties :setter nil))


;; VkPhysicalDeviceLimits getters
(mcffi:def-foreign-accessors physical-device-limits (:struct VkPhysicalDeviceLimits)
  (maxImageDimension1D :setter nil)
  (maxImageDimension2D :setter nil)
  (maxImageDimension3D :setter nil)
  (maxImageDimensionCube :setter nil)
  (maxImageArrayLayers :setter nil)
  (maxTexelBufferElements :setter nil)
  (maxUniformBufferRange :setter nil)
  (maxStorageBufferRange :setter nil)
  (maxPushConstantsSize :setter nil)
  (maxMemoryAllocationCount :setter nil)
  (maxSamplerAllocationCount :setter nil)
  (bufferImageGranularity :setter nil)
  (sparseAddressSpaceSize :setter nil)
  (maxBoundDescriptorSets :setter nil)
  (maxPerStageDescriptorSamplers :setter nil)
  (maxPerStageDescriptorUniformBuffers :setter nil)
  (maxPerStageDescriptorStorageBuffers :setter nil)
  (maxPerStageDescriptorSampledImages :setter nil)
  (maxPerStageDescriptorStorageImages :setter nil)
  (maxPerStageDescriptorInputAttachments :setter nil)
  (maxPerStageResources :setter nil)
  (maxDescriptorSetSamplers :setter nil)
  (maxDescriptorSetUniformBuffers :setter nil)
  (maxDescriptorSetUniformBuffersDynamic :setter nil)
  (maxDescriptorSetStorageBuffers :setter nil)
  (maxDescriptorSetStorageBuffersDynamic :setter nil)
  (maxDescriptorSetSampledImages :setter nil)
  (maxDescriptorSetStorageImages :setter nil)
  (maxDescriptorSetInputAttachments :setter nil)
  (maxVertexInputAttributes :setter nil)
  (maxVertexInputBindings :setter nil)
  (maxVertexInputAttributeOffset :setter nil)
  (maxVertexInputBindingStride :setter nil)
  (maxVertexOutputComponents :setter nil)
  (maxTessellationGenerationLevel :setter nil)
  (maxTessellationPatchSize :setter nil)
  (maxTessellationControlPerVertexInputComponents :setter nil)
  (maxTessellationControlPerVertexOutputComponents :setter nil)
  (maxTessellationControlPerPatchOutputComponents :setter nil)
  (maxTessellationControlTotalOutputComponents :setter nil)
  (maxTessellationEvaluationInputComponents :setter nil)
  (maxTessellationEvaluationOutputComponents :setter nil)
  (maxGeometryShaderInvocations :setter nil)
  (maxGeometryInputComponents :setter nil)
  (maxGeometryOutputComponents :setter nil)
  (maxGeometryOutputVertices :setter nil)
  (maxGeometryTotalOutputComponents :setter nil)
  (maxFragmentInputComponents :setter nil)
  (maxFragmentOutputAttachments :setter nil)
  (maxFragmentDualSrcAttachments :setter nil)
  (maxFragmentCombinedOutputResources :setter nil)
  (maxComputeSharedMemorySize :setter nil)
  (maxComputeWorkGroupCount :getter ((&optional index)
				     (if index
					 (cffi:mem-aref maxComputeWorkGroupCount :uint32 index)
					 (loop for i from 0 below 3
					       collect (cffi:mem-aref maxComputeWorkGroupCount :uint32 i))))
			    :setter nil)
  (maxComputeWorkGroupInvocations :setter nil)
  (maxComputeWorkGroupSize :getter ((&optional index)
				    (if index
					(cffi:mem-aref maxComputeWorkGroupSize :uint32 index)
					(loop for i from 0 below 3
					      collect (cffi:mem-aref maxComputeWorkGroupSize :uint32 i))))
			   :setter nil)
  (subPixelPrecisionBits :setter nil)
  (subTexelPrecisionBits :setter nil)
  (mipmapPrecisionBits :setter nil)
  (maxDrawIndexedIndexValue :setter nil)
  (maxDrawIndirectCount :setter nil)
  (maxSamplerLodBias :setter nil)
  (maxSamplerAnisotropy :setter nil)
  (maxViewports :setter nil)
  (maxViewportDimensions :getter ((&optional index)
				  (if index
				      (cffi:mem-aref maxViewportDimensions :uint32 index)
				      (loop for i from 0 below 2
					    collect (cffi:mem-aref maxViewportDimensions :uint32 i))))
			 :setter nil)
  (viewportBoundsRange :getter ((&optional index)
				(if index
				    (cffi:mem-aref viewportBoundsRange :float index)
				    (loop for i from 0 below 2
					  collect (cffi:mem-aref viewportBoundsRange :float i))))
		       :setter nil)
  (viewportSubPixelBits :setter nil)
  (minMemoryMapAlignment :setter nil)
  (minTexelBufferOffsetAlignment :setter nil)
  (minUniformBufferOffsetAlignment :setter nil)
  (minStorageBufferOffsetAlignment :setter nil)
  (minTexelOffset :setter nil)
  (maxTexelOffset :setter nil)
  (minTexelGatherOffset :setter nil)
  (maxTexelGatherOffset :setter nil)
  (minInterpolationOffset :setter nil)
  (maxInterpolationOffset :setter nil)
  (subPixelInterpolationOffsetBits :setter nil)
  (maxFramebufferWidth :setter nil)
  (maxFramebufferHeight :setter nil)
  (maxFramebufferLayers :setter nil)
  (framebufferColorSampleCounts :setter nil)
  (framebufferDepthSampleCounts :setter nil)
  (framebufferStencilSampleCounts :setter nil)
  (framebufferNoAttachmentsSampleCounts :setter nil)
  (maxColorAttachments :setter nil)
  (sampledImageColorSampleCounts :setter nil)
  (sampledImageIntegerSampleCounts :setter nil)
  (sampledImageDepthSampleCounts :setter nil)
  (sampledImageStencilSampleCounts :setter nil)
  (storageImageSampleCounts :setter nil)
  (maxSampleMaskWords :setter nil)
  (timestampComputeAndGraphics :setter nil)
  (timestampPeriod :setter nil)
  (maxClipDistances :setter nil)
  (maxCullDistances :setter nil)
  (maxCombinedClipAndCullDistances :setter nil)
  (discreteQueuePriorities :setter nil)
  (pointSizeRange :getter ((&optional index)
			   (if index
			       (cffi:mem-aref pointSizeRange :float index)
			       (loop for i from 0 below 2
				     collect (cffi:mem-aref pointSizeRange :float i))))
		  :setter nil)
  (lineWidthRange :getter ((&optional index)
			   (if index
			       (cffi:mem-aref lineWidthRange :float index)
			       (loop for i from 0 below 2
				     collect (cffi:mem-aref lineWidthRange :float i)))) :setter nil)
  (pointSizeGranularity :setter nil)
  (lineWidthGranularity :setter nil)
  (strictLines :setter nil)
  (standardSampleLocations :setter nil)
  (optimalBufferCopyOffsetAlignment :setter nil)
  (optimalBufferCopyRowPitchAlignment :setter nil)
  (nonCoherentAtomSize :setter nil))


;; VkPhysicalDeviceSparseProperties getters
(mcffi:def-foreign-accessors physical-device-sparse-properties (:struct VkPhysicalDeviceSparseProperties)
  (residencyStandard2DBlockShape :setter nil)
  (residencyStandard2DMultisampleBlockShape :setter nil)
  (residencyStandard3DBlockShape :setter nil)
  (residencyAlignedMipSize :setter nil)
  (residencyNonResidentStrict :setter nil))


;; VkPhysicalDeviceFeatures getters
(mcffi:def-foreign-accessors physical-device-features (:struct VkPhysicalDeviceFeatures)
  (robustBufferAccess :setter nil)
  (fullDrawIndexUint32 :setter nil)
  (imageCubeArray :setter nil)
  (independentBlend :setter nil)
  (geometryShader :setter nil)
  (tessellationShader :setter nil)
  (sampleRateShading :setter nil)
  (dualSrcBlend :setter nil)
  (logicOp :setter nil)
  (multiDrawIndirect :setter nil)
  (drawIndirectFirstInstance :setter nil)
  (depthClamp :setter nil)
  (depthBiasClamp :setter nil)
  (fillModeNonSolid :setter nil)
  (depthBounds :setter nil)
  (wideLines :setter nil)
  (largePoints :setter nil)
  (alphaToOne :setter nil)
  (multiViewport :setter nil)
  (samplerAnisotropy :setter nil)
  (textureCompressionETC2 :setter nil)
  (textureCompressionASTC_LDR :setter nil)
  (textureCompressionBC :setter nil)
  (occlusionQueryPrecise :setter nil)
  (pipelineStatisticsQuery :setter nil)
  (vertexPipelineStoresAndAtomics :setter nil)
  (fragmentStoresAndAtomics :setter nil)
  (shaderTessellationAndGeometryPointSize :setter nil)
  (shaderImageGatherExtended :setter nil)
  (shaderStorageImageExtendedFormats :setter nil)
  (shaderStorageImageMultisample :setter nil)
  (shaderStorageImageReadWithoutFormat :setter nil)
  (shaderStorageImageWriteWithoutFormat :setter nil)
  (shaderUniformBufferArrayDynamicIndexing :setter nil)
  (shaderSampledImageArrayDynamicIndexing :setter nil)
  (shaderStorageBufferArrayDynamicIndexing :setter nil)
  (shaderStorageImageArrayDynamicIndexing :setter nil)
  (shaderClipDistance :setter nil)
  (shaderCullDistance :setter nil)
  (shaderFloat64 :setter nil)
  (shaderInt64 :setter nil)
  (shaderInt16 :setter nil)
  (shaderResourceResidency :setter nil)
  (shaderResourceMinLod :setter nil)
  (sparseBinding :setter nil)
  (sparseResidencyBuffer :setter nil)
  (sparseResidencyImage2D :setter nil)
  (sparseResidencyImage3D :setter nil)
  (sparseResidency2Samples :setter nil)
  (sparseResidency4Samples :setter nil)
  (sparseResidency8Samples :setter nil)
  (sparseResidency16Samples :setter nil)
  (sparseResidencyAliased :setter nil)
  (variableMultisampleRate :setter nil)
  (inheritedQueries :setter nil))


;; VkQueueFamilyProperties getters
(mcffi:def-foreign-accessors queue-family-properties (:struct VkQueueFamilyProperties)
  (queueFlags :setter nil)
  (queueCount :setter nil)
  (timestampValidBits :setter nil)
  (minImageTransferGranularity :pointer t
			       :setter nil))


;;; ---------------------
;;; ----- Functions -----
;;; ---------------------

;; Returns a list of available devices
(defun create-enumerate-physical-devices (instance-c)
  (cffi:with-foreign-object (pPhysicalDeviceCount-c :uint32)
    (vkEnumeratePhysicalDevices instance-c pPhysicalDeviceCount-c (cffi:null-pointer))
    (let* ((physical-device-count (cffi:mem-ref pPhysicalDeviceCount-c :uint32))
	   (pPhysicalDevices-c (cffi:foreign-alloc 'VKPhysicalDevice :count physical-device-count))) 
      (vkEnumeratePhysicalDevices instance-c pPhysicalDeviceCount-c pPhysicalDevices-c)
      (loop for i from 0 below physical-device-count
            collect (cffi:mem-aptr pPhysicalDevices-c 'VKPhysicalDevice i)))))

;; Destroy the allocated array from create-enumerate-physical-devices
(defun destroy-enumerate-physical-devices (physical-devices)
  (cffi:foreign-free (car physical-devices)))

;; With enumerate physical devices macro
(mcffi:defwith with-enumerate-physical-devices
  create-enumerate-physical-devices
  destroy-enumerate-physical-devices)


;; Return properties of a physical device
(defun create-get-physical-device-properties (physicalDevice-c)
  (let ((pProperties-c (cffi:foreign-alloc '(:struct VkPhysicalDeviceProperties))))
    (vkGetPhysicalDeviceProperties physicalDevice-c pProperties-c)
    (values pProperties-c)))

;; Destroy the allocated array from create-get-physical-device-properties
(defun destroy-get-physical-device-properties (pProperties-c)
  (cffi:foreign-free pProperties-c))

;; With get physical device properties
(mcffi:defwith with-get-physical-device-properties
  create-get-physical-device-properties
  destroy-get-physical-device-properties)


;; Return features of a physical device
(defun create-get-physical-device-features (physicalDevice-c)
  (let ((pFeatures-c (cffi:foreign-alloc '(:struct VkPhysicalDeviceFeatures))))
    (vkGetPhysicalDeviceFeatures physicalDevice-c pFeatures-c)
    (values pFeatures-c)))

;; Destroy the allocated array from create-get-physical-device-features
(defun destroy-get-physical-device-features (pFeatures-c)
  (cffi:foreign-free pFeatures-c))

;; With get physical device features
(mcffi:defwith with-get-physical-device-features
  create-get-physical-device-features
  destroy-get-physical-device-features)


;; Returns a list of available devices
(defun create-get-physical-device-queue-family-properties (physicalDevice-c)
  (cffi:with-foreign-object (pQueueFamilyPropertyCount-c :uint32)
    (vkGetPhysicalDeviceQueueFamilyProperties physicalDevice-c pQueueFamilyPropertyCount-c (cffi:null-pointer))
    (let* ((queue-family-property-count (cffi:mem-ref pQueueFamilyPropertyCount-c :uint32))
	   (pQueueFamilyProperties-c (cffi:foreign-alloc '(:struct VKQueueFamilyProperties)
							 :count queue-family-property-count))) 
      (vkGetPhysicalDeviceQueueFamilyProperties physicalDevice-c pQueueFamilyPropertyCount-c pQueueFamilyProperties-c)
      (loop for i from 0 below queue-family-property-count
            collect (cffi:mem-aptr pQueueFamilyProperties-c '(:struct VKQueueFamilyProperties) i)))))

;; Destroy the allocated array from create-enumerate-physical-devices
(defun destroy-get-physical-device-queue-family-properties (queue-family-properties)
  (cffi:foreign-free (car queue-family-properties)))

;; With enumerate physical devices macro
(mcffi:defwith with-get-physical-device-queue-family-properties
  create-get-physical-device-queue-family-properties
  destroy-get-physical-device-queue-family-properties)
