
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/physical-device.md"))


  (mcffi:doc-header "Physical device" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)

  
  (mcffi:def-foreign-struct "VkPhysicalDeviceProperties" physical-device-properties doc-file
      (:no-constructor :no-destructor :enable-default-get)
    (apiVersion :name "apiVersion" :type uint32)
    (driverVersion :name "driverVersion" :type uint32)
    (vendorID :name "vendorID" :type uint32)
    (deviceID :name "deviceId" :type uint32)
    (deviceType :name "deviceType" :type "VkPhysicalDeviceType")
    (deviceName :name "deviceName" :type string
		:get (() (cffi:foreign-string-to-lisp deviceName)))
    (pipelineCacheUUID :name "pipelineCacheUUID" :type uint8
		       :get ((&optional index)
			     (if index
				 (cffi:mem-aref pipelineCacheUUID :uint8 index)
				 (loop for i from 0 below VK_UUID_SIZE
				       collect (cffi:mem-aref pipelineCacheUUID :uint8 i)))))
    (limits :pointer t :type "VkPhysicalDeviceLimits")
    (sparseProperties :pointer t :name "sparseProperties" :type "VkPhysicalDeviceSparseProperties"))


  
  (mcffi:def-foreign-struct "VkPhysicalDeviceLimits" physical-device-limits doc-file
      (:no-constructor :no-destructor :enable-default-get)
    (maxImageDimension1D :name "maxImageDimension1D" :type uint32)
    (maxImageDimension2D :name "maxImageDimension2D" :type uint32)
    (maxImageDimension3D :name "maxImageDimension3D" :type uint32)
    (maxImageDimensionCube :name "maxImageDimensionCube" :type uint32)
    (maxImageArrayLayers :name "maxImageArrayLayers" :type uint32)
    (maxTexelBufferElements :name "maxTexelBufferElements" :type uint32)
    (maxUniformBufferRange :name "maxUniformBufferRange" :type uint32)
    (maxStorageBufferRange :name "maxStorageBufferRange" :type uint32)
    (maxPushConstantsSize :name "maxPushConstantsSize" :type uint32)
    (maxMemoryAllocationCount :name "maxMemoryAllocationCount" :type uint32)
    (maxSamplerAllocationCount :name "maxSamplerAllocationCount" :type uint32)
    (bufferImageGranularity :name "bufferImageGranularity" :type "VkDeviceSize")
    (sparseAddressSpaceSize :name "sparseAddressSpaceSize" :type "VkDeviceSize")
    (maxBoundDescriptorSets :name "maxBoundDescriptorSets" :type "uint32")
    (maxPerStageDescriptorSamplers :name "maxPerStageDescriptorSamplers" :type "uint32")
    (maxPerStageDescriptorUniformBuffers :name "maxPerStageDescriptorUniformBuffers" :type "uint32")
    (maxPerStageDescriptorStorageBuffers :name "maxPerStageDescriptorStorageBuffers" :type "uint32")
    (maxPerStageDescriptorSampledImages :name "maxPerStageDescriptorSampledImages" :type "uint32")
    (maxPerStageDescriptorStorageImages :name "maxPerStageDescriptorStorageImages" :type "uint32")
    (maxPerStageDescriptorInputAttachments :name "maxPerStageDescriptorInputAttachments" :type "uint32")
    (maxPerStageResources :name "maxPerStageResources" :type "uint32")
    (maxDescriptorSetSamplers :name "maxDescriptorSetSamplers" :type "uint32")
    (maxDescriptorSetUniformBuffers :name "maxDescriptorSetUniformBuffers" :type "uint32")
    (maxDescriptorSetUniformBuffersDynamic :name "maxDescriptorSetUniformBuffersDynamic" :type "uint32")
    (maxDescriptorSetStorageBuffers :name "maxDescriptorSetStorageBuffers" :type "uint32")
    (maxDescriptorSetStorageBuffersDynamic :name "maxDescriptorSetStorageBuffersDynamic" :type "uint32")
    (maxDescriptorSetSampledImages :name "maxDescriptorSetSampledImages" :type "uint32")
    (maxDescriptorSetStorageImages :name "maxDescriptorSetStorageImages" :type "uint32")
    (maxDescriptorSetInputAttachments :name "maxDescriptorSetInputAttachments" :type "uint32")
    (maxVertexInputAttributes :name "maxVertexInputAttributes" :type "uint32")
    (maxVertexInputBindings :name "maxVertexInputBindings" :type "uint32")
    (maxVertexInputAttributeOffset :name "maxVertexInputAttributeOffset" :type "uint32")
    (maxVertexInputBindingStride :name "maxVertexInputBindingStride" :type "uint32")
    (maxVertexOutputComponents :name "maxVertexOutputComponents" :type "uint32")
    (maxTessellationGenerationLevel :name "maxTessellationGenerationLevel" :type "uint32")
    (maxTessellationPatchSize :name "maxTessellationPatchSize" :type "uint32")
    (maxTessellationControlPerVertexInputComponents :name "maxTessellationControlPerVertexInputComponents" :type "uint32")
    (maxTessellationControlPerVertexOutputComponents :name "maxTessellationControlPerVertexOutputComponents" :type "uint32")
    (maxTessellationControlPerPatchOutputComponents :name "maxTessellationControlPerPatchOutputComponents" :type "uint32")
    (maxTessellationControlTotalOutputComponents :name "maxTessellationControlTotalOutputComponents" :type "uint32")
    (maxTessellationEvaluationInputComponents :name "maxTessellationEvaluationInputComponents" :type "uint32")
    (maxTessellationEvaluationOutputComponents :name "maxTessellationEvaluationOutputComponents" :type "uint32")
    (maxGeometryShaderInvocations :name "maxGeometryShaderInvocations" :type "uint32")
    (maxGeometryInputComponents :name "maxGeometryInputComponents" :type "uint32")
    (maxGeometryOutputComponents :name "maxGeometryOutputComponents" :type "uint32")
    (maxGeometryOutputVertices :name "maxGeometryOutputVertices" :type "uint32")
    (maxGeometryTotalOutputComponents :name "maxGeometryTotalOutputComponents" :type "uint32")
    (maxFragmentInputComponents :name "maxFragmentInputComponents" :type "uint32")
    (maxFragmentOutputAttachments :name "maxFragmentOutputAttachments" :type "uint32")
    (maxFragmentDualSrcAttachments :name "maxFragmentDualSrcAttachments" :type "uint32")
    (maxFragmentCombinedOutputResources :name "maxFragmentCombinedOutputResources" :type "uint32")
    (maxComputeSharedMemorySize :name "maxComputeSharedMemorySize" :type "uint32")
    (maxComputeWorkGroupCount :name "maxComputeWorkGroupCount" :type (list uint32)
			      :get ((&optional index)
				    (if index
					(cffi:mem-aref maxComputeWorkGroupCount :uint32 index)
					(loop for i from 0 below 3
					      collect (cffi:mem-aref maxComputeWorkGroupCount :uint32 i)))))
    (maxComputeWorkGroupInvocations :name "maxComputeWorkGroupInvocations" :type uint32)
    (maxComputeWorkGroupSize :name "maxComputeWorkGroupSize" :type (list uint32)
			     :get ((&optional index)
				   (if index
				       (cffi:mem-aref maxComputeWorkGroupSize :uint32 index)
				       (loop for i from 0 below 3
					     collect (cffi:mem-aref maxComputeWorkGroupSize :uint32 i)))))
    (subPixelPrecisionBits :name "subPixelPrecisionBits" :type "uint32")
    (subTexelPrecisionBits :name "subTexelPrecisionBits" :type "uint32")
    (mipmapPrecisionBits :name "mipmapPrecisionBits" :type "uint32")
    (maxDrawIndexedIndexValue :name "maxDrawIndexedIndexValue" :type "uint32")
    (maxDrawIndirectCount :name "maxDrawIndirectCount" :type "uint32")
    (maxSamplerLodBias :name "maxSamplerLodBias" :type "float")
    (maxSamplerAnisotropy :name "maxSamplerAnisotropy" :type "float")
    (maxViewports :name "maxViewports" :type "uint32")
    (maxViewportDimensions :name "maxViewportDimensions" :type (list uint32)
			   :get ((&optional index)
				 (if index
				     (cffi:mem-aref maxViewportDimensions :uint32 index)
				     (loop for i from 0 below 2
					   collect (cffi:mem-aref maxViewportDimensions :uint32 i)))))
    (viewportBoundsRange :name "viewportBoundsRange" :type (list float)
			 :get ((&optional index)
			       (if index
				   (cffi:mem-aref viewportBoundsRange :float index)
				   (loop for i from 0 below 2
					 collect (cffi:mem-aref viewportBoundsRange :float i)))))
    (viewportSubPixelBits :name "viewportSubPixelBits" :type "uint32")
    (minMemoryMapAlignment :name "minMemoryMapAlignment" :type "size")
    (minTexelBufferOffsetAlignment :name "minTexelBufferOffsetAlignment" :type "VkDeviceSize")
    (minUniformBufferOffsetAlignment :name "minUniformBufferOffsetAlignment" :type "VkDeviceSize")
    (minStorageBufferOffsetAlignment :name "minStorageBufferOffsetAlignment" :type "VkDeviceSize")
    (minTexelOffset :name "minTexelOffset" :type "int32")
    (maxTexelOffset :name "maxTexelOffset" :type "uint32")
    (minTexelGatherOffset :name "minTexelGatherOffset" :type "int32")
    (maxTexelGatherOffset :name "maxTexelGatherOffset" :type "uint32")
    (minInterpolationOffset :name "minInterpolationOffset" :type "float")
    (maxInterpolationOffset :name "maxInterpolationOffset" :type "float")
    (subPixelInterpolationOffsetBits :name "subPixelInterpolationOffsetBits" :type "uint32")
    (maxFramebufferWidth :name "maxFramebufferWidth" :type "uint32")
    (maxFramebufferHeight :name "maxFramebufferHeight" :type "uint32")
    (maxFramebufferLayers :name "maxFramebufferLayers" :type "uint32")
    (framebufferColorSampleCounts :name "framebufferColorSampleCounts" :type "VkSampleCountFlags")
    (framebufferDepthSampleCounts :name "framebufferDepthSampleCounts" :type "VkSampleCountFlags")
    (framebufferStencilSampleCounts :name "framebufferStencilSampleCounts" :type "VkSampleCountFlags")
    (framebufferNoAttachmentsSampleCounts :name "framebufferNoAttachmentsSampleCounts" :type "VkSampleCountFlags")
    (maxColorAttachments :name "maxColorAttachments" :type "uint32")
    (sampledImageColorSampleCounts :name "sampledImageColorSampleCounts" :type "VkSampleCountFlags")
    (sampledImageIntegerSampleCounts :name "sampledImageIntegerSampleCounts" :type "VkSampleCountFlags")
    (sampledImageDepthSampleCounts :name "sampledImageDepthSampleCounts" :type "VkSampleCountFlags")
    (sampledImageStencilSampleCounts :name "sampledImageStencilSampleCounts" :type "VkSampleCountFlags")
    (storageImageSampleCounts :name "storageImageSampleCounts" :type "VkSampleCountFlags")
    (maxSampleMaskWords :name "maxSampleMaskWords" :type "uint32")
    (timestampComputeAndGraphics :name "timestampComputeAndGraphics" :type "VkBool32")
    (timestampPeriod :name "timestampPeriod" :type "float")
    (maxClipDistances :name "maxClipDistances" :type "uint32")
    (maxCullDistances :name "maxCullDistances" :type "uint32")
    (maxCombinedClipAndCullDistances :name "maxCombinedClipAndCullDistances" :type "uint32")
    (discreteQueuePriorities :name "discreteQueuePriorities" :type "uint32")
    (pointSizeRange :name "pointSizeRange" :type (list float)
		    :get ((&optional index)
			  (if index
			      (cffi:mem-aref pointSizeRange :float index)
			      (loop for i from 0 below 2
				    collect (cffi:mem-aref pointSizeRange :float i)))))
    (lineWidthRange :name "lineWidthRange" :type (list float) :get ((&optional index)
			  (if index
			      (cffi:mem-aref lineWidthRange :float index)
			      (loop for i from 0 below 2
				    collect (cffi:mem-aref lineWidthRange :float i)))))
    (pointSizeGranularity :name "pointSizeGranularity" :type "float")
    (lineWidthGranularity :name "lineWidthGranularity" :type "float")
    (strictLines :name "strictLines" :type "VkBool32")
    (standardSampleLocations :name "standardSampleLocations" :type "VkBool32")
    (optimalBufferCopyOffsetAlignment :name "optimalBufferCopyOffsetAlignment" :type "VkDeviceSize")
    (optimalBufferCopyRowPitchAlignment :name "optimalBufferCopyRowPitchAlignment" :type "VkDeviceSize")
    (nonCoherentAtomSize :name "nonCoherentAtomSize" :type "VkDeviceSize"))



  (mcffi:def-foreign-struct "VkPhysicalDeviceSparseProperties" physical-device-sparse-properties doc-file
      (:no-constructor :no-destructor :enable-default-get)
    (residencyStandard2DBlockShape :name "residencyStandard2DBlockShape" :type "VkBool32")
    (residencyStandard2DMultisampleBlockShape :name "residencyStandard2DMultisampleBlockShape" :type "VkBool32")
    (residencyStandard3DBlockShape :name "residencyStandard3DBlockShape" :type "VkBool32")
    (residencyAlignedMipSize :name "residencyAlignedMipSize" :type "VkBool32")
    (residencyNonResidentStrict :name "residencyNonResidentStrict" :type "VkBool32"))



  (mcffi:def-foreign-struct "VkPhysicalDeviceFeatures" physical-device-features doc-file 
      (:enable-default-create :enable-default-get)
    (robustBufferAccess :name "robustBufferAccess" :type "VkBool32")
    (fullDrawIndexUint32 :name "fullDrawIndexUint32" :type "VkBool32")
    (imageCubeArray :name "imageCubeArray" :type "VkBool32")
    (independentBlend :name "independentBlend" :type "VkBool32")
    (geometryShader :name "geometryShader" :type "VkBool32")
    (tessellationShader :name "tessellationShader" :type "VkBool32")
    (sampleRateShading :name "sampleRateShading" :type "VkBool32")
    (dualSrcBlend :name "dualSrcBlend" :type "VkBool32")
    (logicOp :name "logicOp" :type "VkBool32")
    (multiDrawIndirect :name "multiDrawIndirect" :type "VkBool32")
    (drawIndirectFirstInstance :name "drawIndirectFirstInstance" :type "VkBool32")
    (depthClamp :name "depthClamp" :type "VkBool32")
    (depthBiasClamp :name "depthBiasClamp" :type "VkBool32")
    (fillModeNonSolid :name "fillModeNonSolid" :type "VkBool32")
    (depthBounds :name "depthBounds" :type "VkBool32")
    (wideLines :name "wideLines" :type "VkBool32")
    (largePoints :name "largePoints" :type "VkBool32")
    (alphaToOne :name "alphaToOne" :type "VkBool32")
    (multiViewport :name "multiViewport" :type "VkBool32")
    (samplerAnisotropy :name "samplerAnisotropy" :type "VkBool32")
    (textureCompressionETC2 :name "textureCompressionETC2" :type "VkBool32")
    (textureCompressionASTC_LDR :name "textureCompressionASTC_LDR" :type "VkBool32")
    (textureCompressionBC :name "textureCompressionBC" :type "VkBool32")
    (occlusionQueryPrecise :name "occlusionQueryPrecise" :type "VkBool32")
    (pipelineStatisticsQuery :name "pipelineStatisticsQuery" :type "VkBool32")
    (vertexPipelineStoresAndAtomics :name "vertexPipelineStoresAndAtomics" :type "VkBool32")
    (fragmentStoresAndAtomics :name "fragmentStoresAndAtomics" :type "VkBool32")
    (shaderTessellationAndGeometryPointSize :name "shaderTessellationAndGeometryPointSize" :type "VkBool32")
    (shaderImageGatherExtended :name "shaderImageGatherExtended" :type "VkBool32")
    (shaderStorageImageExtendedFormats :name "shaderStorageImageExtendedFormats" :type "VkBool32")
    (shaderStorageImageMultisample :name "shaderStorageImageMultisample" :type "VkBool32")
    (shaderStorageImageReadWithoutFormat :name "shaderStorageImageReadWithoutFormat" :type "VkBool32")
    (shaderStorageImageWriteWithoutFormat :name "shaderStorageImageWriteWithoutFormat" :type "VkBool32")
    (shaderUniformBufferArrayDynamicIndexing :name "shaderUniformBufferArrayDynamicIndexing" :type "VkBool32")
    (shaderSampledImageArrayDynamicIndexing :name "shaderSampledImageArrayDynamicIndexing" :type "VkBool32")
    (shaderStorageBufferArrayDynamicIndexing :name "shaderStorageBufferArrayDynamicIndexing" :type "VkBool32")
    (shaderStorageImageArrayDynamicIndexing :name "shaderStorageImageArrayDynamicIndexing" :type "VkBool32")
    (shaderClipDistance :name "shaderClipDistance" :type "VkBool32")
    (shaderCullDistance :name "shaderCullDistance" :type "VkBool32")
    (shaderFloat64 :name "shaderFloat64" :type "VkBool32")
    (shaderInt64 :name "shaderInt64" :type "VkBool32")
    (shaderInt16 :name "shaderInt16" :type "VkBool32")
    (shaderResourceResidency :name "shaderResourceResidency" :type "VkBool32")
    (shaderResourceMinLod :name "shaderResourceMinLod" :type "VkBool32")
    (sparseBinding :name "sparseBinding" :type "VkBool32")
    (sparseResidencyBuffer :name "sparseResidencyBuffer" :type "VkBool32")
    (sparseResidencyImage2D :name "sparseResidencyImage2D" :type "VkBool32")
    (sparseResidencyImage3D :name "sparseResidencyImage3D" :type "VkBool32")
    (sparseResidency2Samples :name "sparseResidency2Samples" :type "VkBool32")
    (sparseResidency4Samples :name "sparseResidency4Samples" :type "VkBool32")
    (sparseResidency8Samples :name "sparseResidency8Samples" :type "VkBool32")
    (sparseResidency16Samples :name "sparseResidency16Samples" :type "VkBool32")
    (sparseResidencyAliased :name "sparseResidencyAliased" :type "VkBool32")
    (variableMultisampleRate :name "variableMultisampleRate" :type "VkBool32")
    (inheritedQueries :name "inheritedQueries" :type "VkBool32"))



  (mcffi:def-foreign-struct "VkQueueFamilyProperties" queue-family-properties doc-file 
      (:no-constructor :no-destructor :enable-default-get)
    (queueFlags :name "queueFlags" :type "VkQueueFlags")
    (queueCount :name "queueCount" :type uint32)
    (timestampValidBits :name "timestampValidBits" :type uint32)
    (minImageTransferGranularity :pointer t :name "minImageTransferGranularity" :type "VkExtent3D"))



  (mcffi:doc-subheader "Functions" doc-file)


  (mcffi:doc-subsubheader "vkEnumeratePhysicalDevices" doc-file)
  
  (mcffi:def-foreign-function enumerate-physical-devices doc-file (instance)
    (declare-types ("VkInstance" instance)
		   :return ((list "VkPhysicalDevice") physical-devices) ("VkResult" result))
    (cffi:with-foreign-object (pPhysicalDeviceCount :uint32)
      (vkEnumeratePhysicalDevices instance pPhysicalDeviceCount (cffi:null-pointer))
      (let ((physical-device-count (cffi:mem-ref pPhysicalDeviceCount :uint32)))
	(cffi:with-foreign-object (pPhysicalDevices 'VKPhysicalDevice physical-device-count) 
	  (vkEnumeratePhysicalDevices instance pPhysicalDeviceCount pPhysicalDevices)
	  (loop for i from 0 below physical-device-count
		collect (cffi:mem-aref pPhysicalDevices 'VKPhysicalDevice i))))))



  (mcffi:doc-subsubheader "vkGetPhysicalDeviceProperties" doc-file)

  (mcffi:doc-note "This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions." doc-file)

  (mcffi:def-foreign-function create-get-physical-device-properties doc-file (physicalDevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return ("VkPhysicalDeviceProperties" props))
    (let ((pProperties (cffi:foreign-alloc '(:struct VkPhysicalDeviceProperties))))
      (vkGetPhysicalDeviceProperties physicalDevice pProperties)
      (values pProperties)))

  (mcffi:def-foreign-function destroy-get-physical-device-properties doc-file (props)
    (declare-types ("VkPhysicalDeviceProperties" props))
    (cffi:foreign-free props))

  (mcffi:defwith with-get-physical-device-properties doc-file
    create-get-physical-device-properties
    destroy-get-physical-device-properties)



  (mcffi:doc-subsubheader "vkGetPhysicalDeviceFeatures" doc-file)

  (mcffi:doc-note "This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions." doc-file)
  
  (mcffi:def-foreign-function create-get-physical-device-features doc-file (physicalDevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return ("VkPhysicalDeviceFeatures" features))
    (let ((pFeatures (cffi:foreign-alloc '(:struct VkPhysicalDeviceFeatures))))
      (vkGetPhysicalDeviceFeatures physicalDevice pFeatures)
      (values pFeatures)))

  (mcffi:def-foreign-function destroy-get-physical-device-features doc-file (features)
    (declare-types ("VkPhysicalDeviceFeatures" features))
    (cffi:foreign-free features))

  (mcffi:defwith with-get-physical-device-features doc-file
    create-get-physical-device-features
    destroy-get-physical-device-features)



  (mcffi:doc-subsubheader "vkGetPhysicalDeviceQueueFamilyProperties" doc-file)

  (mcffi:doc-note "This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions." doc-file)
  
  (mcffi:def-foreign-function create-get-physical-device-queue-family-properties doc-file (physicalDevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return ((list "VkQueueFamilyProperties") family-props))
    (cffi:with-foreign-object (pQueueFamilyPropertyCount :uint32)
      (vkGetPhysicalDeviceQueueFamilyProperties physicalDevice pQueueFamilyPropertyCount (cffi:null-pointer))
      (let* ((queue-family-property-count (cffi:mem-ref pQueueFamilyPropertyCount :uint32))
	     (pQueueFamilyProperties (cffi:foreign-alloc '(:struct VKQueueFamilyProperties)
							   :count queue-family-property-count))) 
	(vkGetPhysicalDeviceQueueFamilyProperties physicalDevice pQueueFamilyPropertyCount pQueueFamilyProperties)
	(loop for i from 0 below queue-family-property-count
              collect (cffi:mem-aptr pQueueFamilyProperties '(:struct VKQueueFamilyProperties) i)))))

  (mcffi:def-foreign-function destroy-get-physical-device-queue-family-properties doc-file (family-props)
    (declare-types ((list "VkQueueFamilyProperties") family-props))
    (cffi:foreign-free (car family-props)))

  (mcffi:defwith with-get-physical-device-queue-family-properties doc-file
    create-get-physical-device-queue-family-properties
    destroy-get-physical-device-queue-family-properties)



  (mcffi:doc-subsubheader "vkGetPhysicalDeviceSurfaceSupportKHR" doc-file)

  (mcffi:def-foreign-function get-physical-device-surface-support doc-file (physicalDevice queueFamilyIndex surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (uint32 "queueFamilyIndex") ("VkSurfaceKHR" surface)
		   :return (boolean "pSupported"))
    (cffi:with-foreign-object (pSupported 'VkBool32)
      (vkGetPhysicalDeviceSurfaceSupportKHR physicalDevice queueFamilyIndex surface pSupported)
      (let ((supportedp (cffi:mem-ref pSupported 'VkBool32)))
        (equal supportedp VK_TRUE))))



  (mcffi:doc-subsubheader "vkEnumerateDeviceExtensionProperties" doc-file)

  (mcffi:doc-note "This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions." doc-file)

  (mcffi:def-foreign-function create-enumerate-device-extension-properties doc-file (physicalDevice pLayerName)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (string "pLayerName")
		   :return ((list "VkExtensionProperties") "pProperties") ("VkResult" result))
    (let ((pLayerName-c (or pLayerName (cffi:null-pointer))))
      (cffi:with-foreign-object (pPropertyCount :uint32)
	(vkEnumerateDeviceExtensionProperties physicalDevice pLayerName-c pPropertyCount (cffi:null-pointer))
	(let* ((property-count (cffi:mem-ref pPropertyCount :uint32))
	       (pProperties (cffi:foreign-alloc '(:struct VkExtensionProperties) :count property-count)))
	  (let ((result (vkEnumerateDeviceExtensionProperties physicalDevice pLayerName-c pPropertyCount pProperties))
		(properties (iter (for i from 0 below property-count)
			      (collect (cffi:mem-aptr pProperties '(:struct VkExtensionProperties) i)))))
	    (values properties result))))))

  (mcffi:def-foreign-function destroy-enumerate-device-extension-properties doc-file (pProperties)
    (declare-types ((list "VkExtensionProperties") "pProperties"))
    (cffi:foreign-free (car pProperties)))

  (mcffi:defwith with-enumerate-device-extension-properties doc-file
    create-enumerate-device-extension-properties
    destroy-enumerate-device-extension-properties)



  (mcffi:doc-subsubheader "vkGetPhysicalDeviceSurfaceCapabilitiesKHR" doc-file)

  (mcffi:doc-note "This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions." doc-file)
  
  (mcffi:def-foreign-function create-get-physical-device-surface-capabilities doc-file (physicalDevice surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkSurfaceKHR" surface)
		   :return ("VkSurfaceCapabilitiesKHR" "pSurfaceCapabilities") ("VkResult" result))
    (let* ((pSurfaceCapabilities (cffi:foreign-alloc '(:struct VkSurfaceCapabilitiesKHR)))
	   (result (vkGetPhysicalDeviceSurfaceCapabilitiesKHR physicalDevice surface pSurfaceCapabilities)))
      (values pSurfaceCapabilities result)))

  (mcffi:def-foreign-function destroy-get-physical-device-surface-capabilities doc-file (pSurfaceCapabilities)
    (declare-types ("VkSurfaceCapabilitiesKHR" "pSurfaceCapabilities"))
    (cffi:foreign-free pSurfaceCapabilities))

  (mcffi:defwith with-get-physical-device-surface-capabilities doc-file
    create-get-physical-device-surface-capabilities
    destroy-get-physical-device-surface-capabilities)



  (mcffi:doc-subsubheader "vkGetPhysicalDeviceSurfaceFormatsKHR" doc-file)

  (mcffi:doc-note "This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions." doc-file)
  
  (mcffi:def-foreign-function create-get-physical-device-surface-formats doc-file (physicalDevice surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkSurfaceKHR" surface)
		   :return ((list "VkSurfaceFormatKHR") "pSurfaceFormats") ("VkResult" result))
    (cffi:with-foreign-object (pSurfaceFormatCount :uint32)
      (vkGetPhysicalDeviceSurfaceFormatsKHR physicalDevice surface pSurfaceFormatCount (cffi:null-pointer))
      (let* ((surface-format-count (cffi:mem-ref pSurfaceFormatCount :uint32))
	     (pSurfaceFormats (cffi:foreign-alloc '(:struct VkSurfaceFormatKHR) :count surface-format-count))
	     (result (vkGetPhysicalDeviceSurfaceFormatsKHR physicalDevice surface pSurfaceFormatCount (cffi:null-pointer)))
	     (surface-formats (iter (for i from 0 below surface-format-count)
				(collect (cffi:mem-aptr pSurfaceFormats '(:struct VkSurfaceFormatKHR) i)))))
	(values surface-formats result))))

  (mcffi:def-foreign-function destroy-get-physical-device-surface-formats doc-file (pSurfaceFormats)
    (declare-types ((list "VkSurfaceFormatKHR") "pSurfaceFormats"))
    (cffi:foreign-free (car pSurfaceFormats)))

  (mcffi:defwith with-get-physical-device-surface-formats doc-file
    create-get-physical-device-surface-formats
    destroy-get-physical-device-surface-formats)



  (mcffi:doc-subsubheader "vkGetPhysicalDeviceSurfacePresentModesKHR" doc-file)

  (mcffi:def-foreign-function get-physical-device-surface-present-modes doc-file (physicalDevice surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkSurfaceKHR" surface)
		   :return ((list "VkPresentModeKHR") "pPresentModes") ("VkResult" result))
    (cffi:with-foreign-object (pPresentModeCount :uint32)
      (vkGetPhysicalDeviceSurfacePresentModesKHR physicalDevice surface pPresentModeCount (cffi:null-pointer))
      (let* ((present-mode-count (cffi:mem-ref pPresentModeCount :uint32)))
	(cffi:with-foreign-object (pPresentModes 'VkPresentModeKHR present-mode-count)
	  (let ((result (vkGetPhysicalDeviceSurfacePresentModesKHR physicalDevice surface pPresentModeCount pPresentModes))
		(present-modes (iter (for i from 0 below present-mode-count)
				 (collect (cffi:mem-aref pPresentModes 'VkPresentModeKHR i)))))
	    (values present-modes result)))))))
