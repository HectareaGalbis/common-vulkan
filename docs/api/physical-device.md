# Physical device

## Structs

---

### VkPhysicalDeviceProperties

**Members**
* *apiVersion*: `uint32`
* *driverVersion*: `uint32`
* *vendorID*: `uint32`
* *deviceId*: `uint32`
* *deviceType*: `VkPhysicalDeviceType`
* *deviceName*: `string`
* *pipelineCacheUUID*: `uint8`
* *limits*: `VkPhysicalDeviceLimits`
* *sparseProperties*: `VkPhysicalDeviceSparseProperties`

**Accessors**
```lisp
(physical-device-properties-apiVersion obj)
(physical-device-properties-driverVersion obj)
(physical-device-properties-vendorID obj)
(physical-device-properties-deviceId obj)
(physical-device-properties-deviceType obj)
(physical-device-properties-deviceName obj)
(physical-device-properties-pipelineCacheUUID obj &optional index)
(physical-device-properties-limits obj)
(physical-device-properties-sparseProperties obj)
```

---

### VkPhysicalDeviceLimits

**Members**
* *maxImageDimension1D*: `uint32`
* *maxImageDimension2D*: `uint32`
* *maxImageDimension3D*: `uint32`
* *maxImageDimensionCube*: `uint32`
* *maxImageArrayLayers*: `uint32`
* *maxTexelBufferElements*: `uint32`
* *maxUniformBufferRange*: `uint32`
* *maxStorageBufferRange*: `uint32`
* *maxPushConstantsSize*: `uint32`
* *maxMemoryAllocationCount*: `uint32`
* *maxSamplerAllocationCount*: `uint32`
* *bufferImageGranularity*: `VkDeviceSize`
* *sparseAddressSpaceSize*: `VkDeviceSize`
* *maxBoundDescriptorSets*: `uint32`
* *maxPerStageDescriptorSamplers*: `uint32`
* *maxPerStageDescriptorUniformBuffers*: `uint32`
* *maxPerStageDescriptorStorageBuffers*: `uint32`
* *maxPerStageDescriptorSampledImages*: `uint32`
* *maxPerStageDescriptorStorageImages*: `uint32`
* *maxPerStageDescriptorInputAttachments*: `uint32`
* *maxPerStageResources*: `uint32`
* *maxDescriptorSetSamplers*: `uint32`
* *maxDescriptorSetUniformBuffers*: `uint32`
* *maxDescriptorSetUniformBuffersDynamic*: `uint32`
* *maxDescriptorSetStorageBuffers*: `uint32`
* *maxDescriptorSetStorageBuffersDynamic*: `uint32`
* *maxDescriptorSetSampledImages*: `uint32`
* *maxDescriptorSetStorageImages*: `uint32`
* *maxDescriptorSetInputAttachments*: `uint32`
* *maxVertexInputAttributes*: `uint32`
* *maxVertexInputBindings*: `uint32`
* *maxVertexInputAttributeOffset*: `uint32`
* *maxVertexInputBindingStride*: `uint32`
* *maxVertexOutputComponents*: `uint32`
* *maxTessellationGenerationLevel*: `uint32`
* *maxTessellationPatchSize*: `uint32`
* *maxTessellationControlPerVertexInputComponents*: `uint32`
* *maxTessellationControlPerVertexOutputComponents*: `uint32`
* *maxTessellationControlPerPatchOutputComponents*: `uint32`
* *maxTessellationControlTotalOutputComponents*: `uint32`
* *maxTessellationEvaluationInputComponents*: `uint32`
* *maxTessellationEvaluationOutputComponents*: `uint32`
* *maxGeometryShaderInvocations*: `uint32`
* *maxGeometryInputComponents*: `uint32`
* *maxGeometryOutputComponents*: `uint32`
* *maxGeometryOutputVertices*: `uint32`
* *maxGeometryTotalOutputComponents*: `uint32`
* *maxFragmentInputComponents*: `uint32`
* *maxFragmentOutputAttachments*: `uint32`
* *maxFragmentDualSrcAttachments*: `uint32`
* *maxFragmentCombinedOutputResources*: `uint32`
* *maxComputeSharedMemorySize*: `uint32`
* *maxComputeWorkGroupCount*: `(list uint32)`
* *maxComputeWorkGroupInvocations*: `uint32`
* *maxComputeWorkGroupSize*: `(list uint32)`
* *subPixelPrecisionBits*: `uint32`
* *subTexelPrecisionBits*: `uint32`
* *mipmapPrecisionBits*: `uint32`
* *maxDrawIndexedIndexValue*: `uint32`
* *maxDrawIndirectCount*: `uint32`
* *maxSamplerLodBias*: `float`
* *maxSamplerAnisotropy*: `float`
* *maxViewports*: `uint32`
* *maxViewportDimensions*: `(list uint32)`
* *viewportBoundsRange*: `(list float)`
* *viewportSubPixelBits*: `uint32`
* *minMemoryMapAlignment*: `size`
* *minTexelBufferOffsetAlignment*: `VkDeviceSize`
* *minUniformBufferOffsetAlignment*: `VkDeviceSize`
* *minStorageBufferOffsetAlignment*: `VkDeviceSize`
* *minTexelOffset*: `int32`
* *maxTexelOffset*: `uint32`
* *minTexelGatherOffset*: `int32`
* *maxTexelGatherOffset*: `uint32`
* *minInterpolationOffset*: `float`
* *maxInterpolationOffset*: `float`
* *subPixelInterpolationOffsetBits*: `uint32`
* *maxFramebufferWidth*: `uint32`
* *maxFramebufferHeight*: `uint32`
* *maxFramebufferLayers*: `uint32`
* *framebufferColorSampleCounts*: `VkSampleCountFlags`
* *framebufferDepthSampleCounts*: `VkSampleCountFlags`
* *framebufferStencilSampleCounts*: `VkSampleCountFlags`
* *framebufferNoAttachmentsSampleCounts*: `VkSampleCountFlags`
* *maxColorAttachments*: `uint32`
* *sampledImageColorSampleCounts*: `VkSampleCountFlags`
* *sampledImageIntegerSampleCounts*: `VkSampleCountFlags`
* *sampledImageDepthSampleCounts*: `VkSampleCountFlags`
* *sampledImageStencilSampleCounts*: `VkSampleCountFlags`
* *storageImageSampleCounts*: `VkSampleCountFlags`
* *maxSampleMaskWords*: `uint32`
* *timestampComputeAndGraphics*: `VkBool32`
* *timestampPeriod*: `float`
* *maxClipDistances*: `uint32`
* *maxCullDistances*: `uint32`
* *maxCombinedClipAndCullDistances*: `uint32`
* *discreteQueuePriorities*: `uint32`
* *pointSizeRange*: `(list float)`
* *lineWidthRange*: `(list float)`
* *pointSizeGranularity*: `float`
* *lineWidthGranularity*: `float`
* *strictLines*: `VkBool32`
* *standardSampleLocations*: `VkBool32`
* *optimalBufferCopyOffsetAlignment*: `VkDeviceSize`
* *optimalBufferCopyRowPitchAlignment*: `VkDeviceSize`
* *nonCoherentAtomSize*: `VkDeviceSize`

**Accessors**
```lisp
(physical-device-limits-maxImageDimension1D obj)
(physical-device-limits-maxImageDimension2D obj)
(physical-device-limits-maxImageDimension3D obj)
(physical-device-limits-maxImageDimensionCube obj)
(physical-device-limits-maxImageArrayLayers obj)
(physical-device-limits-maxTexelBufferElements obj)
(physical-device-limits-maxUniformBufferRange obj)
(physical-device-limits-maxStorageBufferRange obj)
(physical-device-limits-maxPushConstantsSize obj)
(physical-device-limits-maxMemoryAllocationCount obj)
(physical-device-limits-maxSamplerAllocationCount obj)
(physical-device-limits-bufferImageGranularity obj)
(physical-device-limits-sparseAddressSpaceSize obj)
(physical-device-limits-maxBoundDescriptorSets obj)
(physical-device-limits-maxPerStageDescriptorSamplers obj)
(physical-device-limits-maxPerStageDescriptorUniformBuffers obj)
(physical-device-limits-maxPerStageDescriptorStorageBuffers obj)
(physical-device-limits-maxPerStageDescriptorSampledImages obj)
(physical-device-limits-maxPerStageDescriptorStorageImages obj)
(physical-device-limits-maxPerStageDescriptorInputAttachments obj)
(physical-device-limits-maxPerStageResources obj)
(physical-device-limits-maxDescriptorSetSamplers obj)
(physical-device-limits-maxDescriptorSetUniformBuffers obj)
(physical-device-limits-maxDescriptorSetUniformBuffersDynamic obj)
(physical-device-limits-maxDescriptorSetStorageBuffers obj)
(physical-device-limits-maxDescriptorSetStorageBuffersDynamic obj)
(physical-device-limits-maxDescriptorSetSampledImages obj)
(physical-device-limits-maxDescriptorSetStorageImages obj)
(physical-device-limits-maxDescriptorSetInputAttachments obj)
(physical-device-limits-maxVertexInputAttributes obj)
(physical-device-limits-maxVertexInputBindings obj)
(physical-device-limits-maxVertexInputAttributeOffset obj)
(physical-device-limits-maxVertexInputBindingStride obj)
(physical-device-limits-maxVertexOutputComponents obj)
(physical-device-limits-maxTessellationGenerationLevel obj)
(physical-device-limits-maxTessellationPatchSize obj)
(physical-device-limits-maxTessellationControlPerVertexInputComponents obj)
(physical-device-limits-maxTessellationControlPerVertexOutputComponents obj)
(physical-device-limits-maxTessellationControlPerPatchOutputComponents obj)
(physical-device-limits-maxTessellationControlTotalOutputComponents obj)
(physical-device-limits-maxTessellationEvaluationInputComponents obj)
(physical-device-limits-maxTessellationEvaluationOutputComponents obj)
(physical-device-limits-maxGeometryShaderInvocations obj)
(physical-device-limits-maxGeometryInputComponents obj)
(physical-device-limits-maxGeometryOutputComponents obj)
(physical-device-limits-maxGeometryOutputVertices obj)
(physical-device-limits-maxGeometryTotalOutputComponents obj)
(physical-device-limits-maxFragmentInputComponents obj)
(physical-device-limits-maxFragmentOutputAttachments obj)
(physical-device-limits-maxFragmentDualSrcAttachments obj)
(physical-device-limits-maxFragmentCombinedOutputResources obj)
(physical-device-limits-maxComputeSharedMemorySize obj)
(physical-device-limits-maxComputeWorkGroupCount obj &optional index)
(physical-device-limits-maxComputeWorkGroupInvocations obj)
(physical-device-limits-maxComputeWorkGroupSize obj &optional index)
(physical-device-limits-subPixelPrecisionBits obj)
(physical-device-limits-subTexelPrecisionBits obj)
(physical-device-limits-mipmapPrecisionBits obj)
(physical-device-limits-maxDrawIndexedIndexValue obj)
(physical-device-limits-maxDrawIndirectCount obj)
(physical-device-limits-maxSamplerLodBias obj)
(physical-device-limits-maxSamplerAnisotropy obj)
(physical-device-limits-maxViewports obj)
(physical-device-limits-maxViewportDimensions obj &optional index)
(physical-device-limits-viewportBoundsRange obj &optional index)
(physical-device-limits-viewportSubPixelBits obj)
(physical-device-limits-minMemoryMapAlignment obj)
(physical-device-limits-minTexelBufferOffsetAlignment obj)
(physical-device-limits-minUniformBufferOffsetAlignment obj)
(physical-device-limits-minStorageBufferOffsetAlignment obj)
(physical-device-limits-minTexelOffset obj)
(physical-device-limits-maxTexelOffset obj)
(physical-device-limits-minTexelGatherOffset obj)
(physical-device-limits-maxTexelGatherOffset obj)
(physical-device-limits-minInterpolationOffset obj)
(physical-device-limits-maxInterpolationOffset obj)
(physical-device-limits-subPixelInterpolationOffsetBits obj)
(physical-device-limits-maxFramebufferWidth obj)
(physical-device-limits-maxFramebufferHeight obj)
(physical-device-limits-maxFramebufferLayers obj)
(physical-device-limits-framebufferColorSampleCounts obj)
(physical-device-limits-framebufferDepthSampleCounts obj)
(physical-device-limits-framebufferStencilSampleCounts obj)
(physical-device-limits-framebufferNoAttachmentsSampleCounts obj)
(physical-device-limits-maxColorAttachments obj)
(physical-device-limits-sampledImageColorSampleCounts obj)
(physical-device-limits-sampledImageIntegerSampleCounts obj)
(physical-device-limits-sampledImageDepthSampleCounts obj)
(physical-device-limits-sampledImageStencilSampleCounts obj)
(physical-device-limits-storageImageSampleCounts obj)
(physical-device-limits-maxSampleMaskWords obj)
(physical-device-limits-timestampComputeAndGraphics obj)
(physical-device-limits-timestampPeriod obj)
(physical-device-limits-maxClipDistances obj)
(physical-device-limits-maxCullDistances obj)
(physical-device-limits-maxCombinedClipAndCullDistances obj)
(physical-device-limits-discreteQueuePriorities obj)
(physical-device-limits-pointSizeRange obj &optional index)
(physical-device-limits-lineWidthRange obj &optional index)
(physical-device-limits-pointSizeGranularity obj)
(physical-device-limits-lineWidthGranularity obj)
(physical-device-limits-strictLines obj)
(physical-device-limits-standardSampleLocations obj)
(physical-device-limits-optimalBufferCopyOffsetAlignment obj)
(physical-device-limits-optimalBufferCopyRowPitchAlignment obj)
(physical-device-limits-nonCoherentAtomSize obj)
```

---

### VkPhysicalDeviceSparseProperties

**Members**
* *residencyStandard2DBlockShape*: `VkBool32`
* *residencyStandard2DMultisampleBlockShape*: `VkBool32`
* *residencyStandard3DBlockShape*: `VkBool32`
* *residencyAlignedMipSize*: `VkBool32`
* *residencyNonResidentStrict*: `VkBool32`

**Accessors**
```lisp
(physical-device-sparse-properties-residencyStandard2DBlockShape obj)
(physical-device-sparse-properties-residencyStandard2DMultisampleBlockShape obj)
(physical-device-sparse-properties-residencyStandard3DBlockShape obj)
(physical-device-sparse-properties-residencyAlignedMipSize obj)
(physical-device-sparse-properties-residencyNonResidentStrict obj)
```

---

### VkPhysicalDeviceFeatures

**Members**
* *robustBufferAccess*: `VkBool32`
* *fullDrawIndexUint32*: `VkBool32`
* *imageCubeArray*: `VkBool32`
* *independentBlend*: `VkBool32`
* *geometryShader*: `VkBool32`
* *tessellationShader*: `VkBool32`
* *sampleRateShading*: `VkBool32`
* *dualSrcBlend*: `VkBool32`
* *logicOp*: `VkBool32`
* *multiDrawIndirect*: `VkBool32`
* *drawIndirectFirstInstance*: `VkBool32`
* *depthClamp*: `VkBool32`
* *depthBiasClamp*: `VkBool32`
* *fillModeNonSolid*: `VkBool32`
* *depthBounds*: `VkBool32`
* *wideLines*: `VkBool32`
* *largePoints*: `VkBool32`
* *alphaToOne*: `VkBool32`
* *multiViewport*: `VkBool32`
* *samplerAnisotropy*: `VkBool32`
* *textureCompressionETC2*: `VkBool32`
* *textureCompressionASTC_LDR*: `VkBool32`
* *textureCompressionBC*: `VkBool32`
* *occlusionQueryPrecise*: `VkBool32`
* *pipelineStatisticsQuery*: `VkBool32`
* *vertexPipelineStoresAndAtomics*: `VkBool32`
* *fragmentStoresAndAtomics*: `VkBool32`
* *shaderTessellationAndGeometryPointSize*: `VkBool32`
* *shaderImageGatherExtended*: `VkBool32`
* *shaderStorageImageExtendedFormats*: `VkBool32`
* *shaderStorageImageMultisample*: `VkBool32`
* *shaderStorageImageReadWithoutFormat*: `VkBool32`
* *shaderStorageImageWriteWithoutFormat*: `VkBool32`
* *shaderUniformBufferArrayDynamicIndexing*: `VkBool32`
* *shaderSampledImageArrayDynamicIndexing*: `VkBool32`
* *shaderStorageBufferArrayDynamicIndexing*: `VkBool32`
* *shaderStorageImageArrayDynamicIndexing*: `VkBool32`
* *shaderClipDistance*: `VkBool32`
* *shaderCullDistance*: `VkBool32`
* *shaderFloat64*: `VkBool32`
* *shaderInt64*: `VkBool32`
* *shaderInt16*: `VkBool32`
* *shaderResourceResidency*: `VkBool32`
* *shaderResourceMinLod*: `VkBool32`
* *sparseBinding*: `VkBool32`
* *sparseResidencyBuffer*: `VkBool32`
* *sparseResidencyImage2D*: `VkBool32`
* *sparseResidencyImage3D*: `VkBool32`
* *sparseResidency2Samples*: `VkBool32`
* *sparseResidency4Samples*: `VkBool32`
* *sparseResidency8Samples*: `VkBool32`
* *sparseResidency16Samples*: `VkBool32`
* *sparseResidencyAliased*: `VkBool32`
* *variableMultisampleRate*: `VkBool32`
* *inheritedQueries*: `VkBool32`

**create-physical-device-features**
```lisp
(create-physical-device-features &key
                                   (robustBufferAccess 0)
                                   (fullDrawIndexUint32 0)
                                   (imageCubeArray 0)
                                   (independentBlend 0)
                                   (geometryShader 0)
                                   (tessellationShader 0)
                                   (sampleRateShading 0)
                                   (dualSrcBlend 0)
                                   (logicOp 0)
                                   (multiDrawIndirect 0)
                                   (drawIndirectFirstInstance 0)
                                   (depthClamp 0)
                                   (depthBiasClamp 0)
                                   (fillModeNonSolid 0)
                                   (depthBounds 0)
                                   (wideLines 0)
                                   (largePoints 0)
                                   (alphaToOne 0)
                                   (multiViewport 0)
                                   (samplerAnisotropy 0)
                                   (textureCompressionETC2 0)
                                   (textureCompressionASTC_LDR 0)
                                   (textureCompressionBC 0)
                                   (occlusionQueryPrecise 0)
                                   (pipelineStatisticsQuery 0)
                                   (vertexPipelineStoresAndAtomics 0)
                                   (fragmentStoresAndAtomics 0)
                                   (shaderTessellationAndGeometryPointSize 0)
                                   (shaderImageGatherExtended 0)
                                   (shaderStorageImageExtendedFormats 0)
                                   (shaderStorageImageMultisample 0)
                                   (shaderStorageImageReadWithoutFormat 0)
                                   (shaderStorageImageWriteWithoutFormat 0)
                                   (shaderUniformBufferArrayDynamicIndexing 0)
                                   (shaderSampledImageArrayDynamicIndexing 0)
                                   (shaderStorageBufferArrayDynamicIndexing 0)
                                   (shaderStorageImageArrayDynamicIndexing 0)
                                   (shaderClipDistance 0)
                                   (shaderCullDistance 0)
                                   (shaderFloat64 0)
                                   (shaderInt64 0)
                                   (shaderInt16 0)
                                   (shaderResourceResidency 0)
                                   (shaderResourceMinLod 0)
                                   (sparseBinding 0)
                                   (sparseResidencyBuffer 0)
                                   (sparseResidencyImage2D 0)
                                   (sparseResidencyImage3D 0)
                                   (sparseResidency2Samples 0)
                                   (sparseResidency4Samples 0)
                                   (sparseResidency8Samples 0)
                                   (sparseResidency16Samples 0)
                                   (sparseResidencyAliased 0)
                                   (variableMultisampleRate 0)
                                   (inheritedQueries 0))
```

**destroy-physical-device-features**
```lisp
(destroy-physical-device-features obj)
```

**with-physical-device-features**
```lisp
(with-physical-device-features var (&rest args)
  &body body)
```
Wrap the body expressions with `create-physical-device-features` and `destroy-physical-device-features`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(physical-device-features-robustBufferAccess obj)
(physical-device-features-fullDrawIndexUint32 obj)
(physical-device-features-imageCubeArray obj)
(physical-device-features-independentBlend obj)
(physical-device-features-geometryShader obj)
(physical-device-features-tessellationShader obj)
(physical-device-features-sampleRateShading obj)
(physical-device-features-dualSrcBlend obj)
(physical-device-features-logicOp obj)
(physical-device-features-multiDrawIndirect obj)
(physical-device-features-drawIndirectFirstInstance obj)
(physical-device-features-depthClamp obj)
(physical-device-features-depthBiasClamp obj)
(physical-device-features-fillModeNonSolid obj)
(physical-device-features-depthBounds obj)
(physical-device-features-wideLines obj)
(physical-device-features-largePoints obj)
(physical-device-features-alphaToOne obj)
(physical-device-features-multiViewport obj)
(physical-device-features-samplerAnisotropy obj)
(physical-device-features-textureCompressionETC2 obj)
(physical-device-features-textureCompressionASTC_LDR obj)
(physical-device-features-textureCompressionBC obj)
(physical-device-features-occlusionQueryPrecise obj)
(physical-device-features-pipelineStatisticsQuery obj)
(physical-device-features-vertexPipelineStoresAndAtomics obj)
(physical-device-features-fragmentStoresAndAtomics obj)
(physical-device-features-shaderTessellationAndGeometryPointSize obj)
(physical-device-features-shaderImageGatherExtended obj)
(physical-device-features-shaderStorageImageExtendedFormats obj)
(physical-device-features-shaderStorageImageMultisample obj)
(physical-device-features-shaderStorageImageReadWithoutFormat obj)
(physical-device-features-shaderStorageImageWriteWithoutFormat obj)
(physical-device-features-shaderUniformBufferArrayDynamicIndexing obj)
(physical-device-features-shaderSampledImageArrayDynamicIndexing obj)
(physical-device-features-shaderStorageBufferArrayDynamicIndexing obj)
(physical-device-features-shaderStorageImageArrayDynamicIndexing obj)
(physical-device-features-shaderClipDistance obj)
(physical-device-features-shaderCullDistance obj)
(physical-device-features-shaderFloat64 obj)
(physical-device-features-shaderInt64 obj)
(physical-device-features-shaderInt16 obj)
(physical-device-features-shaderResourceResidency obj)
(physical-device-features-shaderResourceMinLod obj)
(physical-device-features-sparseBinding obj)
(physical-device-features-sparseResidencyBuffer obj)
(physical-device-features-sparseResidencyImage2D obj)
(physical-device-features-sparseResidencyImage3D obj)
(physical-device-features-sparseResidency2Samples obj)
(physical-device-features-sparseResidency4Samples obj)
(physical-device-features-sparseResidency8Samples obj)
(physical-device-features-sparseResidency16Samples obj)
(physical-device-features-sparseResidencyAliased obj)
(physical-device-features-variableMultisampleRate obj)
(physical-device-features-inheritedQueries obj)
```

---

### VkQueueFamilyProperties

**Members**
* *queueFlags*: `VkQueueFlags`
* *queueCount*: `uint32`
* *timestampValidBits*: `uint32`
* *minImageTransferGranularity*: `VkExtent3D`

**Accessors**
```lisp
(queue-family-properties-queueFlags obj)
(queue-family-properties-queueCount obj)
(queue-family-properties-timestampValidBits obj)
(queue-family-properties-minImageTransferGranularity obj)
```

## Functions

---

### vkEnumeratePhysicalDevices

**enumerate-physical-devices**
```lisp
(enumerate-physical-devices instance) => (values physical-devices result)
```

* *Parameters*:
  * *instance*: `VkInstance`

* *Return:*
  * *physical-devices*: `(list VkPhysicalDevice)`
  * *result*: `VkResult`

---

### vkGetPhysicalDeviceProperties

* **Note**: This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions.

**create-get-physical-device-properties**
```lisp
(create-get-physical-device-properties physicalDevice) => props
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`

* *Return:*
  * *props*: `VkPhysicalDeviceProperties`

**destroy-get-physical-device-properties**
```lisp
(destroy-get-physical-device-properties props)
```

* *Parameters*:
  * *props*: `VkPhysicalDeviceProperties`

**with-get-physical-device-properties**
```lisp
(with-get-physical-device-properties var (&rest args)
  &body body)
```
Wrap the body expressions with `create-get-physical-device-properties` and `destroy-get-physical-device-properties`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

---

### vkGetPhysicalDeviceFeatures

* **Note**: This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions.

**create-get-physical-device-features**
```lisp
(create-get-physical-device-features physicalDevice) => features
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`

* *Return:*
  * *features*: `VkPhysicalDeviceFeatures`

**destroy-get-physical-device-features**
```lisp
(destroy-get-physical-device-features features)
```

* *Parameters*:
  * *features*: `VkPhysicalDeviceFeatures`

**with-get-physical-device-features**
```lisp
(with-get-physical-device-features var (&rest args)
  &body body)
```
Wrap the body expressions with `create-get-physical-device-features` and `destroy-get-physical-device-features`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

---

### vkGetPhysicalDeviceQueueFamilyProperties

* **Note**: This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions.

**create-get-physical-device-queue-family-properties**
```lisp
(create-get-physical-device-queue-family-properties physicalDevice) => family-props
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`

* *Return:*
  * *family-props*: `(list VkQueueFamilyProperties)`

**destroy-get-physical-device-queue-family-properties**
```lisp
(destroy-get-physical-device-queue-family-properties family-props)
```

* *Parameters*:
  * *family-props*: `(list VkQueueFamilyProperties)`

**with-get-physical-device-queue-family-properties**
```lisp
(with-get-physical-device-queue-family-properties var (&rest args)
  &body body)
```
Wrap the body expressions with `create-get-physical-device-queue-family-properties` and `destroy-get-physical-device-queue-family-properties`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

