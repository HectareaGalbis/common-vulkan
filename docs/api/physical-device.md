
# Physical device

## Structs

### VKPhysicalDeviceProperties

**Members**
* *apiVersion*: `uint32`
* *driverVersion*: `uint32`
* *vendorID*: `uint32`
* *deviceID*: `uint32`
* *deviceType*: `VkPhysicalDeviceType`
* *deviceName*: `string`
* *pipelineCacheUUID*: `(list uint8)`
* *limits*: `VkPhysicalDeviceLimits`
* *sparseProperties*: `VkPhysicalDeviceSparseProperties`

**Accessors**
```lisp
(physical-device-properties-apiVersion device-properties)
(physical-device-properties-driverVersion device-properties)
(physical-device-properties-vendorID device-properties)
(physical-device-properties-deviceID device-properties)
(physical-device-properties-deviceType device-properties)
(physical-device-properties-deviceName device-properties)
(physical-device-properties-pipelineCacheUUID device-properties &optional index)
(physical-device-properties-limits device-properties)
(physical-device-properties-sparseProperties device-properties)
```
* *device-properties*: `VKPhysicalDeviceProperties`

* **Note**: If `index` is supplied to the function `physical-device-properties-pipelineCacheUUID`, only the element at `index` position is returned.

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
(physical-device-limits-maxImageDimension1D device-limits)
(physical-device-limits-maxImageDimension2D device-limits)
(physical-device-limits-maxImageDimension3D device-limits)
(physical-device-limits-maxImageDimensionCube device-limits)
(physical-device-limits-maxImageArrayLayers device-limits)
(physical-device-limits-maxTexelBufferElements device-limits)
(physical-device-limits-maxUniformBufferRange device-limits)
(physical-device-limits-maxStorageBufferRange device-limits)
(physical-device-limits-maxPushConstantsSize device-limits)
(physical-device-limits-maxMemoryAllocationCount device-limits)
(physical-device-limits-maxSamplerAllocationCount device-limits)
(physical-device-limits-bufferImageGranularity device-limits)
(physical-device-limits-sparseAddressSpaceSize device-limits)
(physical-device-limits-maxBoundDescriptorSets device-limits)
(physical-device-limits-maxPerStageDescriptorSamplers device-limits)
(physical-device-limits-maxPerStageDescriptorUniformBuffers device-limits)
(physical-device-limits-maxPerStageDescriptorStorageBuffers device-limits)
(physical-device-limits-maxPerStageDescriptorSampledImages device-limits)
(physical-device-limits-maxPerStageDescriptorStorageImages device-limits)
(physical-device-limits-maxPerStageDescriptorInputAttachments device-limits)
(physical-device-limits-maxPerStageResources device-limits)
(physical-device-limits-maxDescriptorSetSamplers device-limits)
(physical-device-limits-maxDescriptorSetUniformBuffers device-limits)
(physical-device-limits-maxDescriptorSetUniformBuffersDynamic device-limits)
(physical-device-limits-maxDescriptorSetStorageBuffers device-limits)
(physical-device-limits-maxDescriptorSetStorageBuffersDynamic device-limits)
(physical-device-limits-maxDescriptorSetSampledImages device-limits)
(physical-device-limits-maxDescriptorSetStorageImages device-limits)
(physical-device-limits-maxDescriptorSetInputAttachments device-limits)
(physical-device-limits-maxVertexInputAttributes device-limits)
(physical-device-limits-maxVertexInputBindings device-limits)
(physical-device-limits-maxVertexInputAttributeOffset device-limits)
(physical-device-limits-maxVertexInputBindingStride device-limits)
(physical-device-limits-maxVertexOutputComponents device-limits)
(physical-device-limits-maxTessellationGenerationLevel device-limits)
(physical-device-limits-maxTessellationPatchSize device-limits)
(physical-device-limits-maxTessellationControlPerVertexInputComponents device-limits)
(physical-device-limits-maxTessellationControlPerVertexOutputComponents device-limits)
(physical-device-limits-maxTessellationControlPerPatchOutputComponents device-limits)
(physical-device-limits-maxTessellationControlTotalOutputComponents device-limits)
(physical-device-limits-maxTessellationEvaluationInputComponents device-limits)
(physical-device-limits-maxTessellationEvaluationOutputComponents device-limits)
(physical-device-limits-maxGeometryShaderInvocations device-limits)
(physical-device-limits-maxGeometryInputComponents device-limits)
(physical-device-limits-maxGeometryOutputComponents device-limits)
(physical-device-limits-maxGeometryOutputVertices device-limits)
(physical-device-limits-maxGeometryTotalOutputComponents device-limits)
(physical-device-limits-maxFragmentInputComponents device-limits)
(physical-device-limits-maxFragmentOutputAttachments device-limits)
(physical-device-limits-maxFragmentDualSrcAttachments device-limits)
(physical-device-limits-maxFragmentCombinedOutputResources device-limits)
(physical-device-limits-maxComputeSharedMemorySize device-limits)
(physical-device-limits-maxComputeWorkGroupCount device-limits &optional index)
(physical-device-limits-maxComputeWorkGroupInvocations device-limits)
(physical-device-limits-maxComputeWorkGroupSize device-limits &optional index)
(physical-device-limits-subPixelPrecisionBits device-limits)
(physical-device-limits-subTexelPrecisionBits device-limits)
(physical-device-limits-mipmapPrecisionBits device-limits)
(physical-device-limits-maxDrawIndexedIndexValue device-limits)
(physical-device-limits-maxDrawIndirectCount device-limits)
(physical-device-limits-maxSamplerLodBias device-limits)
(physical-device-limits-maxSamplerAnisotropy device-limits)
(physical-device-limits-maxViewports device-limits)
(physical-device-limits-maxViewportDimensions device-limits &optional index)
(physical-device-limits-viewportBoundsRange device-limits &optional index)
(physical-device-limits-viewportSubPixelBits device-limits)
(physical-device-limits-minMemoryMapAlignment device-limits)
(physical-device-limits-minTexelBufferOffsetAlignment device-limits)
(physical-device-limits-minUniformBufferOffsetAlignment device-limits)
(physical-device-limits-minStorageBufferOffsetAlignment device-limits)
(physical-device-limits-minTexelOffset device-limits)
(physical-device-limits-maxTexelOffset device-limits)
(physical-device-limits-minTexelGatherOffset device-limits)
(physical-device-limits-maxTexelGatherOffset device-limits)
(physical-device-limits-minInterpolationOffset device-limits)
(physical-device-limits-maxInterpolationOffset device-limits)
(physical-device-limits-subPixelInterpolationOffsetBits device-limits)
(physical-device-limits-maxFramebufferWidth device-limits)
(physical-device-limits-maxFramebufferHeight device-limits)
(physical-device-limits-maxFramebufferLayers device-limits)
(physical-device-limits-framebufferColorSampleCounts device-limits)
(physical-device-limits-framebufferDepthSampleCounts device-limits)
(physical-device-limits-framebufferStencilSampleCounts device-limits)
(physical-device-limits-framebufferNoAttachmentsSampleCounts device-limits)
(physical-device-limits-maxColorAttachments device-limits)
(physical-device-limits-sampledImageColorSampleCounts device-limits)
(physical-device-limits-sampledImageIntegerSampleCounts device-limits)
(physical-device-limits-sampledImageDepthSampleCounts device-limits)
(physical-device-limits-sampledImageStencilSampleCounts device-limits)
(physical-device-limits-storageImageSampleCounts device-limits)
(physical-device-limits-maxSampleMaskWords device-limits)
(physical-device-limits-timestampComputeAndGraphics device-limits)
(physical-device-limits-timestampPeriod device-limits)
(physical-device-limits-maxClipDistances device-limits)
(physical-device-limits-maxCullDistances device-limits)
(physical-device-limits-maxCombinedClipAndCullDistances device-limits)
(physical-device-limits-discreteQueuePriorities device-limits)
(physical-device-limits-pointSizeRange device-limits &optional index)
(physical-device-limits-lineWidthRange device-limits &optional index)
(physical-device-limits-pointSizeGranularity device-limits)
(physical-device-limits-lineWidthGranularity device-limits)
(physical-device-limits-strictLines device-limits)
(physical-device-limits-standardSampleLocations device-limits)
(physical-device-limits-optimalBufferCopyOffsetAlignment device-limits)
(physical-device-limits-optimalBufferCopyRowPitchAlignment device-limits)
(physical-device-limits-nonCoherentAtomSize device-limits)
```
* *device-limits*: `VkPhysicalDeviceLimits`

* **Note**: If `index` is supplied to the functions `physical-device-limits-maxComputeWorkGroupCount`, `physical-device-limits-maxComputeWorkGroupSize`, `physical-device-limits-maxViewportDimensions`, `physical-device-limits-viewportBoundsRange`, `physical-device-limits-pointSizeRange` and `physical-device-limits-lineWidthRange`, they will return the element at `index` position.

### VkPhysicalDeviceSparseProperties

**Members**
* *residencyStandard2DBlockShape*: `VkBool32`
* *residencyStandard2DMultisampleBlockShape*: `VkBool32`
* *residencyStandard3DBlockShape*: `VkBool32`
* *residencyAlignedMipSize*: `VkBool32`
* *residencyNonResidentStrict*: `VkBool32`

**Accessors**
```lisp
(physical-device-sparse-properties-residencyStandard2DBlockShape sparse-properties)
(physical-device-sparse-properties-residencyStandard2DMultisampleBlockShape sparse-properties)
(physical-device-sparse-properties-residencyStandard3DBlockShape sparse-properties)
(physical-device-sparse-properties-residencyAlignedMipSize sparse-properties)
(physical-device-sparse-properties-residencyNonResidentStrict sparse-properties)
```
* *sparse-properties*: `VkPhysicalDeviceSparseProperties`

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

**Accessors**
```lisp
(physical-device-features-robustBufferAccess features)
(physical-device-features-fullDrawIndexUint32 features)
(physical-device-features-imageCubeArray features)
(physical-device-features-independentBlend features)
(physical-device-features-geometryShader features)
(physical-device-features-tessellationShader features)
(physical-device-features-sampleRateShading features)
(physical-device-features-dualSrcBlend features)
(physical-device-features-logicOp features)
(physical-device-features-multiDrawIndirect features)
(physical-device-features-drawIndirectFirstInstance features)
(physical-device-features-depthClamp features)
(physical-device-features-depthBiasClamp features)
(physical-device-features-fillModeNonSolid features)
(physical-device-features-depthBounds features)
(physical-device-features-wideLines features)
(physical-device-features-largePoints features)
(physical-device-features-alphaToOne features)
(physical-device-features-multiViewport features)
(physical-device-features-samplerAnisotropy features)
(physical-device-features-textureCompressionETC2 features)
(physical-device-features-textureCompressionASTC_LDR features)
(physical-device-features-textureCompressionBC features)
(physical-device-features-occlusionQueryPrecise features)
(physical-device-features-pipelineStatisticsQuery features)
(physical-device-features-vertexPipelineStoresAndAtomics features)
(physical-device-features-fragmentStoresAndAtomics features)
(physical-device-features-shaderTessellationAndGeometryPointSize features)
(physical-device-features-shaderImageGatherExtended features)
(physical-device-features-shaderStorageImageExtendedFormats features)
(physical-device-features-shaderStorageImageMultisample features)
(physical-device-features-shaderStorageImageReadWithoutFormat features)
(physical-device-features-shaderStorageImageWriteWithoutFormat features)
(physical-device-features-shaderUniformBufferArrayDynamicIndexing features)
(physical-device-features-shaderSampledImageArrayDynamicIndexing features)
(physical-device-features-shaderStorageBufferArrayDynamicIndexing features)
(physical-device-features-shaderStorageImageArrayDynamicIndexing features)
(physical-device-features-shaderClipDistance features)
(physical-device-features-shaderCullDistance features)
(physical-device-features-shaderFloat64 features)
(physical-device-features-shaderInt64 features)
(physical-device-features-shaderInt16 features)
(physical-device-features-shaderResourceResidency features)
(physical-device-features-shaderResourceMinLod features)
(physical-device-features-sparseBinding features)
(physical-device-features-sparseResidencyBuffer features)
(physical-device-features-sparseResidencyImage2D features)
(physical-device-features-sparseResidencyImage3D features)
(physical-device-features-sparseResidency2Samples features)
(physical-device-features-sparseResidency4Samples features)
(physical-device-features-sparseResidency8Samples features)
(physical-device-features-sparseResidency16Samples features)
(physical-device-features-sparseResidencyAliased features)
(physical-device-features-variableMultisampleRate features)
(physical-device-features-inheritedQueries features)
```
* *features*: `VkPhysicalDeviceFeatures`

### VkQueueFamilyProperties

**Members**
* *queueFlags*: `VkQueueFlags`
* *queueCount*: `uint32`
* *timestampValidBits*: `uint32`
* *minImageTransferGranularity*: `VkExtent3D`

**Accessors**
```lisp
(queue-family-properties-queueFlags properties)
(queue-family-properties-queueCount properties)
(queue-family-properties-timestampValidBits properties)
(queue-family-properties-minImageTransferGranularity properties)
```
* *properties*: `VkQueueFamilyProperties`

## Functions

### vkEnumeratePhysicalDevices

**enumerate-physical-devices**
```lisp
(enumerate-physical-devices instance) => physical-devices
```
* *Parameters*:
  * *instance*: `VkInstance`

* *Returns*:
  * *physical-devices*: `(list VkPhysicalDevice)`

### vkGetPhysicalDeviceProperties

* **Note**: This function requires an allocation, so it is required to split it up in two creation and destruction functions.

**create-get-physical-device-properties**
```lisp
(create-get-physical-device-properties physical-device) => device-properties
```
* *Parameters*:
  * *physical-device*: `VkPhysicalDevice`

* *Returns*:
  * *device-properties*: `VkPhysicalDeviceProperties`

**destroy-physical-device-properties**
```lisp
(destroy-physical-device-properties device-properties)
```
* *Parameters*:
  * *device-properties*: `VkPhysicalDeviceProperties`

**with-physical-device-properties**
```lisp
(with-physical-device-properties var (physical-device)
  &body body)
```
Wraps the `body` expressions with the creation and destruction of a `VkPhysicalDeviceProperties` structure. The new list is bound to `var`. The argument is passed to the constructor `create-get-physical-device-properties`.

### vkGetPhysicalDeviceFeatures

* **Note**: This function requires an allocation, so it is required to split it up in two creation and destruction functions.

**create-get-physical-device-features**
```lisp
(create-get-physical-device-features physical-device) => features
```
* *Parameters*:
  * *physical-device*: `VkPhysicalDevice`

* *Returns*:
  * *features*: `VkPhysicalDeviceFeatures`

**destroy-get-physical-device-features**
```lisp
(destroy-get-physical-device-features features)
```
* *Parameters*:
  * *features*: `VkPhysicalDeviceFeatures`

**with-get-physical-device-features**
```lisp
(with-get-physical-device-features var (physical-device)
  &body body)
```
Wraps the `body` expressions with the creation and destruction of a `VkPhysicalDeviceFeatures` structure. The new structure is bound to `var`. The argument is passed to the constructor `create-get-physical-device-features`.

### vkGetPhysicalDeviceQueueFamilyProperties

* **Note**: This function requires an array allocation, so it is required to split it up in two creation and destruction functions.

**create-get-physical-device-queue-family-properties**
```lisp
(create-get-physical-device-queue-family-properties physical-device) => queue-family-properties
```
* *Parameters*:
  * *physical-device*: `VkPhysicalDevice`

* *Returns*:
  * *queue-family-properties*: `(list VkQueueFamilyProperties)`

**destroy-get-physical-queue-family-properties**
```lisp
(destroy-get-family-queue-family-properties queue-family-properties)
```
* *Parameters*:
  * *queue-family-properties*: `(list VkQueueFamilyProperties)`

**with-get-physical-device-queue-family-properties**
```lisp
(with-get-physical-device-queue-family-properties var (physical-device)
  &body body)
```
Wraps the `body` expression with the creation and destruction of a list of `VkQueueFamilyProperties` structures. The new list is bound to `var`. The argument is passed to the constructor `create-get-physical-device-queue-family-properties`.
