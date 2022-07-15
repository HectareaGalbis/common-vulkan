
(in-package :cvk)

(cffi:defctype handle :pointer)
(if (= 8 (cffi:foreign-type-size :pointer))
    (cffi:defctype non-dispatchable-handle :pointer)
    (cffi:defctype non-dispatchable-handle :uint64))
(cffi:defctype VkBool32 :uint32)
(cffi:defctype VkDeviceAddress :uint64)
(cffi:defctype VkDeviceSize :uint64)
(cffi:defctype VkFlags :uint32)
(cffi:defctype VkSampleMask :uint32)
(cffi:defctype VkBuffer non_dispatchable_handle)
(cffi:defctype VkImage non_dispatchable_handle)
(cffi:defctype VkInstance handle)
(cffi:defctype VkPhysicalDevice handle)
(cffi:defctype VkDevice handle)
(cffi:defctype VkQueue handle)
(cffi:defctype VkSemaphore non_dispatchable_handle)
(cffi:defctype VkCommandBuffer handle)
(cffi:defctype VkFence non_dispatchable_handle)
(cffi:defctype VkDeviceMemory non_dispatchable_handle)
(cffi:defctype VkEvent non_dispatchable_handle)
(cffi:defctype VkQueryPool non_dispatchable_handle)
(cffi:defctype VkBufferView non_dispatchable_handle)
(cffi:defctype VkImageView non_dispatchable_handle)
(cffi:defctype VkShaderModule non_dispatchable_handle)
(cffi:defctype VkPipelineCache non_dispatchable_handle)
(cffi:defctype VkPipelineLayout non_dispatchable_handle)
(cffi:defctype VkPipeline non_dispatchable_handle)
(cffi:defctype VkRenderPass non_dispatchable_handle)
(cffi:defctype VkDescriptorSetLayout non_dispatchable_handle)
(cffi:defctype VkSampler non_dispatchable_handle)
(cffi:defctype VkDescriptorSet non_dispatchable_handle)
(cffi:defctype VkDescriptorPool non_dispatchable_handle)
(cffi:defctype VkFramebuffer non_dispatchable_handle)
(cffi:defctype VkCommandPool non_dispatchable_handle)
(cffi:defctype VkAccessFlags VkFlags)
(cffi:defctype VkImageAspectFlags VkFlags)
(cffi:defctype VkFormatFeatureFlags VkFlags)
(cffi:defctype VkImageCreateFlags VkFlags)
(cffi:defctype VkSampleCountFlags VkFlags)
(cffi:defctype VkImageUsageFlags VkFlags)
(cffi:defctype VkInstanceCreateFlags VkFlags)
(cffi:defctype VkMemoryHeapFlags VkFlags)
(cffi:defctype VkMemoryPropertyFlags VkFlags)
(cffi:defctype VkQueueFlags VkFlags)
(cffi:defctype VkDeviceCreateFlags VkFlags)
(cffi:defctype VkDeviceQueueCreateFlags VkFlags)
(cffi:defctype VkPipelineStageFlags VkFlags)
(cffi:defctype VkMemoryMapFlags VkFlags)
(cffi:defctype VkSparseMemoryBindFlags VkFlags)
(cffi:defctype VkSparseImageFormatFlags VkFlags)
(cffi:defctype VkFenceCreateFlags VkFlags)
(cffi:defctype VkSemaphoreCreateFlags VkFlags)
(cffi:defctype VkEventCreateFlags VkFlags)
(cffi:defctype VkQueryPipelineStatisticFlags VkFlags)
(cffi:defctype VkQueryPoolCreateFlags VkFlags)
(cffi:defctype VkQueryResultFlags VkFlags)
(cffi:defctype VkBufferCreateFlags VkFlags)
(cffi:defctype VkBufferUsageFlags VkFlags)
(cffi:defctype VkBufferViewCreateFlags VkFlags)
(cffi:defctype VkImageViewCreateFlags VkFlags)
(cffi:defctype VkShaderModuleCreateFlags VkFlags)
(cffi:defctype VkPipelineCacheCreateFlags VkFlags)
(cffi:defctype VkColorComponentFlags VkFlags)
(cffi:defctype VkPipelineCreateFlags VkFlags)
(cffi:defctype VkPipelineShaderStageCreateFlags VkFlags)
(cffi:defctype VkCullModeFlags VkFlags)
(cffi:defctype VkPipelineVertexInputStateCreateFlags VkFlags)
(cffi:defctype VkPipelineInputAssemblyStateCreateFlags VkFlags)
(cffi:defctype VkPipelineTessellationStateCreateFlags VkFlags)
(cffi:defctype VkPipelineViewportStateCreateFlags VkFlags)
(cffi:defctype VkPipelineRasterizationStateCreateFlags VkFlags)
(cffi:defctype VkPipelineMultisampleStateCreateFlags VkFlags)
(cffi:defctype VkPipelineDepthStencilStateCreateFlags VkFlags)
(cffi:defctype VkPipelineColorBlendStateCreateFlags VkFlags)
(cffi:defctype VkPipelineDynamicStateCreateFlags VkFlags)
(cffi:defctype VkPipelineLayoutCreateFlags VkFlags)
(cffi:defctype VkShaderStageFlags VkFlags)
(cffi:defctype VkSamplerCreateFlags VkFlags)
(cffi:defctype VkDescriptorPoolCreateFlags VkFlags)
(cffi:defctype VkDescriptorPoolResetFlags VkFlags)
(cffi:defctype VkDescriptorSetLayoutCreateFlags VkFlags)
(cffi:defctype VkAttachmentDescriptionFlags VkFlags)
(cffi:defctype VkDependencyFlags VkFlags)
(cffi:defctype VkFramebufferCreateFlags VkFlags)
(cffi:defctype VkRenderPassCreateFlags VkFlags)
(cffi:defctype VkSubpassDescriptionFlags VkFlags)
(cffi:defctype VkCommandPoolCreateFlags VkFlags)
(cffi:defctype VkCommandPoolResetFlags VkFlags)
(cffi:defctype VkCommandBufferUsageFlags VkFlags)
(cffi:defctype VkQueryControlFlags VkFlags)
(cffi:defctype VkCommandBufferResetFlags VkFlags)
(cffi:defctype VkStencilFaceFlags VkFlags)
(cffi:defctype VkSamplerYcbcrConversion non_dispatchable_handle)
(cffi:defctype VkDescriptorUpdateTemplate non_dispatchable_handle)
(cffi:defctype VkSubgroupFeatureFlags VkFlags)
(cffi:defctype VkPeerMemoryFeatureFlags VkFlags)
(cffi:defctype VkMemoryAllocateFlags VkFlags)
(cffi:defctype VkCommandPoolTrimFlags VkFlags)
(cffi:defctype VkDescriptorUpdateTemplateCreateFlags VkFlags)
(cffi:defctype VkExternalMemoryHandleTypeFlags VkFlags)
(cffi:defctype VkExternalMemoryFeatureFlags VkFlags)
(cffi:defctype VkExternalFenceHandleTypeFlags VkFlags)
(cffi:defctype VkExternalFenceFeatureFlags VkFlags)
(cffi:defctype VkFenceImportFlags VkFlags)
(cffi:defctype VkSemaphoreImportFlags VkFlags)
(cffi:defctype VkExternalSemaphoreHandleTypeFlags VkFlags)
(cffi:defctype VkExternalSemaphoreFeatureFlags VkFlags)
(cffi:defctype VkPhysicalDeviceVariablePointerFeatures VkPhysicalDeviceVariablePointersFeatures)
(cffi:defctype VkPhysicalDeviceShaderDrawParameterFeatures VkPhysicalDeviceShaderDrawParametersFeatures)
(cffi:defctype VkResolveModeFlags VkFlags)
(cffi:defctype VkDescriptorBindingFlags VkFlags)
(cffi:defctype VkSemaphoreWaitFlags VkFlags)
(cffi:defctype VkFlags64 :uint64)
(cffi:defctype VkPrivateDataSlot non_dispatchable_handle)
(cffi:defctype VkPipelineCreationFeedbackFlags VkFlags)
(cffi:defctype VkToolPurposeFlags VkFlags)
(cffi:defctype VkPrivateDataSlotCreateFlags VkFlags)
(cffi:defctype VkPipelineStageFlags2 VkFlags64)
(cffi:defctype VkPipelineStageFlagBits2 VkFlags64)
(cffi:defctype VkAccessFlags2 VkFlags64)
(cffi:defctype VkAccessFlagBits2 VkFlags64)
(cffi:defctype VkSubmitFlags VkFlags)
(cffi:defctype VkRenderingFlags VkFlags)
(cffi:defctype VkFormatFeatureFlags2 VkFlags64)
(cffi:defctype VkFormatFeatureFlagBits2 VkFlags64)
(cffi:defctype VkSurfaceKHR non_dispatchable_handle)
(cffi:defctype VkCompositeAlphaFlagsKHR VkFlags)
(cffi:defctype VkSurfaceTransformFlagsKHR VkFlags)
(cffi:defctype VkSwapchainKHR non_dispatchable_handle)
(cffi:defctype VkSwapchainCreateFlagsKHR VkFlags)
(cffi:defctype VkDeviceGroupPresentModeFlagsKHR VkFlags)
(cffi:defctype VkDisplayKHR non_dispatchable_handle)
(cffi:defctype VkDisplayModeKHR non_dispatchable_handle)
(cffi:defctype VkDisplayModeCreateFlagsKHR VkFlags)
(cffi:defctype VkDisplayPlaneAlphaFlagsKHR VkFlags)
(cffi:defctype VkDisplaySurfaceCreateFlagsKHR VkFlags)
(cffi:defctype VkRenderingFlagsKHR VkRenderingFlags)
(cffi:defctype VkRenderingFlagBitsKHR VkRenderingFlagBits)
(cffi:defctype VkRenderingInfoKHR VkRenderingInfo)
(cffi:defctype VkRenderingAttachmentInfoKHR VkRenderingAttachmentInfo)
(cffi:defctype VkPipelineRenderingCreateInfoKHR VkPipelineRenderingCreateInfo)
(cffi:defctype VkPhysicalDeviceDynamicRenderingFeaturesKHR VkPhysicalDeviceDynamicRenderingFeatures)
(cffi:defctype VkCommandBufferInheritanceRenderingInfoKHR VkCommandBufferInheritanceRenderingInfo)
(cffi:defctype VkAttachmentSampleCountInfoNV VkAttachmentSampleCountInfoAMD)
(cffi:defctype VkRenderPassMultiviewCreateInfoKHR VkRenderPassMultiviewCreateInfo)
(cffi:defctype VkPhysicalDeviceMultiviewFeaturesKHR VkPhysicalDeviceMultiviewFeatures)
(cffi:defctype VkPhysicalDeviceMultiviewPropertiesKHR VkPhysicalDeviceMultiviewProperties)
(cffi:defctype VkPhysicalDeviceFeatures2KHR VkPhysicalDeviceFeatures2)
(cffi:defctype VkPhysicalDeviceProperties2KHR VkPhysicalDeviceProperties2)
(cffi:defctype VkFormatProperties2KHR VkFormatProperties2)
(cffi:defctype VkImageFormatProperties2KHR VkImageFormatProperties2)
(cffi:defctype VkPhysicalDeviceImageFormatInfo2KHR VkPhysicalDeviceImageFormatInfo2)
(cffi:defctype VkQueueFamilyProperties2KHR VkQueueFamilyProperties2)
(cffi:defctype VkPhysicalDeviceMemoryProperties2KHR VkPhysicalDeviceMemoryProperties2)
(cffi:defctype VkSparseImageFormatProperties2KHR VkSparseImageFormatProperties2)
(cffi:defctype VkPhysicalDeviceSparseImageFormatInfo2KHR VkPhysicalDeviceSparseImageFormatInfo2)
(cffi:defctype VkPeerMemoryFeatureFlagsKHR VkPeerMemoryFeatureFlags)
(cffi:defctype VkPeerMemoryFeatureFlagBitsKHR VkPeerMemoryFeatureFlagBits)
(cffi:defctype VkMemoryAllocateFlagsKHR VkMemoryAllocateFlags)
(cffi:defctype VkMemoryAllocateFlagBitsKHR VkMemoryAllocateFlagBits)
(cffi:defctype VkMemoryAllocateFlagsInfoKHR VkMemoryAllocateFlagsInfo)
(cffi:defctype VkDeviceGroupRenderPassBeginInfoKHR VkDeviceGroupRenderPassBeginInfo)
(cffi:defctype VkDeviceGroupCommandBufferBeginInfoKHR VkDeviceGroupCommandBufferBeginInfo)
(cffi:defctype VkDeviceGroupSubmitInfoKHR VkDeviceGroupSubmitInfo)
(cffi:defctype VkDeviceGroupBindSparseInfoKHR VkDeviceGroupBindSparseInfo)
(cffi:defctype VkBindBufferMemoryDeviceGroupInfoKHR VkBindBufferMemoryDeviceGroupInfo)
(cffi:defctype VkBindImageMemoryDeviceGroupInfoKHR VkBindImageMemoryDeviceGroupInfo)
(cffi:defctype VkCommandPoolTrimFlagsKHR VkCommandPoolTrimFlags)
(cffi:defctype VkPhysicalDeviceGroupPropertiesKHR VkPhysicalDeviceGroupProperties)
(cffi:defctype VkDeviceGroupDeviceCreateInfoKHR VkDeviceGroupDeviceCreateInfo)
(cffi:defctype VkExternalMemoryHandleTypeFlagsKHR VkExternalMemoryHandleTypeFlags)
(cffi:defctype VkExternalMemoryHandleTypeFlagBitsKHR VkExternalMemoryHandleTypeFlagBits)
(cffi:defctype VkExternalMemoryFeatureFlagsKHR VkExternalMemoryFeatureFlags)
(cffi:defctype VkExternalMemoryFeatureFlagBitsKHR VkExternalMemoryFeatureFlagBits)
(cffi:defctype VkExternalMemoryPropertiesKHR VkExternalMemoryProperties)
(cffi:defctype VkPhysicalDeviceExternalImageFormatInfoKHR VkPhysicalDeviceExternalImageFormatInfo)
(cffi:defctype VkExternalImageFormatPropertiesKHR VkExternalImageFormatProperties)
(cffi:defctype VkPhysicalDeviceExternalBufferInfoKHR VkPhysicalDeviceExternalBufferInfo)
(cffi:defctype VkExternalBufferPropertiesKHR VkExternalBufferProperties)
(cffi:defctype VkPhysicalDeviceIDPropertiesKHR VkPhysicalDeviceIDProperties)
(cffi:defctype VkExternalMemoryImageCreateInfoKHR VkExternalMemoryImageCreateInfo)
(cffi:defctype VkExternalMemoryBufferCreateInfoKHR VkExternalMemoryBufferCreateInfo)
(cffi:defctype VkExportMemoryAllocateInfoKHR VkExportMemoryAllocateInfo)
(cffi:defctype VkExternalSemaphoreHandleTypeFlagsKHR VkExternalSemaphoreHandleTypeFlags)
(cffi:defctype VkExternalSemaphoreHandleTypeFlagBitsKHR VkExternalSemaphoreHandleTypeFlagBits)
(cffi:defctype VkExternalSemaphoreFeatureFlagsKHR VkExternalSemaphoreFeatureFlags)
(cffi:defctype VkExternalSemaphoreFeatureFlagBitsKHR VkExternalSemaphoreFeatureFlagBits)
(cffi:defctype VkPhysicalDeviceExternalSemaphoreInfoKHR VkPhysicalDeviceExternalSemaphoreInfo)
(cffi:defctype VkExternalSemaphorePropertiesKHR VkExternalSemaphoreProperties)
(cffi:defctype VkSemaphoreImportFlagsKHR VkSemaphoreImportFlags)
(cffi:defctype VkSemaphoreImportFlagBitsKHR VkSemaphoreImportFlagBits)
(cffi:defctype VkExportSemaphoreCreateInfoKHR VkExportSemaphoreCreateInfo)
(cffi:defctype VkPhysicalDeviceShaderFloat16Int8FeaturesKHR VkPhysicalDeviceShaderFloat16Int8Features)
(cffi:defctype VkPhysicalDeviceFloat16Int8FeaturesKHR VkPhysicalDeviceShaderFloat16Int8Features)
(cffi:defctype VkPhysicalDevice16BitStorageFeaturesKHR VkPhysicalDevice16BitStorageFeatures)
(cffi:defctype VkDescriptorUpdateTemplateKHR VkDescriptorUpdateTemplate)
(cffi:defctype VkDescriptorUpdateTemplateTypeKHR VkDescriptorUpdateTemplateType)
(cffi:defctype VkDescriptorUpdateTemplateCreateFlagsKHR VkDescriptorUpdateTemplateCreateFlags)
(cffi:defctype VkDescriptorUpdateTemplateEntryKHR VkDescriptorUpdateTemplateEntry)
(cffi:defctype VkDescriptorUpdateTemplateCreateInfoKHR VkDescriptorUpdateTemplateCreateInfo)
(cffi:defctype VkPhysicalDeviceImagelessFramebufferFeaturesKHR VkPhysicalDeviceImagelessFramebufferFeatures)
(cffi:defctype VkFramebufferAttachmentsCreateInfoKHR VkFramebufferAttachmentsCreateInfo)
(cffi:defctype VkFramebufferAttachmentImageInfoKHR VkFramebufferAttachmentImageInfo)
(cffi:defctype VkRenderPassAttachmentBeginInfoKHR VkRenderPassAttachmentBeginInfo)
(cffi:defctype VkRenderPassCreateInfo2KHR VkRenderPassCreateInfo2)
(cffi:defctype VkAttachmentDescription2KHR VkAttachmentDescription2)
(cffi:defctype VkAttachmentReference2KHR VkAttachmentReference2)
(cffi:defctype VkSubpassDescription2KHR VkSubpassDescription2)
(cffi:defctype VkSubpassDependency2KHR VkSubpassDependency2)
(cffi:defctype VkSubpassBeginInfoKHR VkSubpassBeginInfo)
(cffi:defctype VkSubpassEndInfoKHR VkSubpassEndInfo)
(cffi:defctype VkExternalFenceHandleTypeFlagsKHR VkExternalFenceHandleTypeFlags)
(cffi:defctype VkExternalFenceHandleTypeFlagBitsKHR VkExternalFenceHandleTypeFlagBits)
(cffi:defctype VkExternalFenceFeatureFlagsKHR VkExternalFenceFeatureFlags)
(cffi:defctype VkExternalFenceFeatureFlagBitsKHR VkExternalFenceFeatureFlagBits)
(cffi:defctype VkPhysicalDeviceExternalFenceInfoKHR VkPhysicalDeviceExternalFenceInfo)
(cffi:defctype VkExternalFencePropertiesKHR VkExternalFenceProperties)
(cffi:defctype VkFenceImportFlagsKHR VkFenceImportFlags)
(cffi:defctype VkFenceImportFlagBitsKHR VkFenceImportFlagBits)
(cffi:defctype VkExportFenceCreateInfoKHR VkExportFenceCreateInfo)
(cffi:defctype VkPerformanceCounterDescriptionFlagsKHR VkFlags)
(cffi:defctype VkAcquireProfilingLockFlagsKHR VkFlags)
(cffi:defctype VkPointClippingBehaviorKHR VkPointClippingBehavior)
(cffi:defctype VkTessellationDomainOriginKHR VkTessellationDomainOrigin)
(cffi:defctype VkPhysicalDevicePointClippingPropertiesKHR VkPhysicalDevicePointClippingProperties)
(cffi:defctype VkRenderPassInputAttachmentAspectCreateInfoKHR VkRenderPassInputAttachmentAspectCreateInfo)
(cffi:defctype VkInputAttachmentAspectReferenceKHR VkInputAttachmentAspectReference)
(cffi:defctype VkImageViewUsageCreateInfoKHR VkImageViewUsageCreateInfo)
(cffi:defctype VkPipelineTessellationDomainOriginStateCreateInfoKHR VkPipelineTessellationDomainOriginStateCreateInfo)
(cffi:defctype VkPhysicalDeviceVariablePointerFeaturesKHR VkPhysicalDeviceVariablePointersFeatures)
(cffi:defctype VkPhysicalDeviceVariablePointersFeaturesKHR VkPhysicalDeviceVariablePointersFeatures)
(cffi:defctype VkMemoryDedicatedRequirementsKHR VkMemoryDedicatedRequirements)
(cffi:defctype VkMemoryDedicatedAllocateInfoKHR VkMemoryDedicatedAllocateInfo)
(cffi:defctype VkBufferMemoryRequirementsInfo2KHR VkBufferMemoryRequirementsInfo2)
(cffi:defctype VkImageMemoryRequirementsInfo2KHR VkImageMemoryRequirementsInfo2)
(cffi:defctype VkImageSparseMemoryRequirementsInfo2KHR VkImageSparseMemoryRequirementsInfo2)
(cffi:defctype VkMemoryRequirements2KHR VkMemoryRequirements2)
(cffi:defctype VkSparseImageMemoryRequirements2KHR VkSparseImageMemoryRequirements2)
(cffi:defctype VkImageFormatListCreateInfoKHR VkImageFormatListCreateInfo)
(cffi:defctype VkSamplerYcbcrConversionKHR VkSamplerYcbcrConversion)
(cffi:defctype VkSamplerYcbcrModelConversionKHR VkSamplerYcbcrModelConversion)
(cffi:defctype VkSamplerYcbcrRangeKHR VkSamplerYcbcrRange)
(cffi:defctype VkChromaLocationKHR VkChromaLocation)
(cffi:defctype VkSamplerYcbcrConversionCreateInfoKHR VkSamplerYcbcrConversionCreateInfo)
(cffi:defctype VkSamplerYcbcrConversionInfoKHR VkSamplerYcbcrConversionInfo)
(cffi:defctype VkBindImagePlaneMemoryInfoKHR VkBindImagePlaneMemoryInfo)
(cffi:defctype VkImagePlaneMemoryRequirementsInfoKHR VkImagePlaneMemoryRequirementsInfo)
(cffi:defctype VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR VkPhysicalDeviceSamplerYcbcrConversionFeatures)
(cffi:defctype VkSamplerYcbcrConversionImageFormatPropertiesKHR VkSamplerYcbcrConversionImageFormatProperties)
(cffi:defctype VkBindBufferMemoryInfoKHR VkBindBufferMemoryInfo)
(cffi:defctype VkBindImageMemoryInfoKHR VkBindImageMemoryInfo)
(cffi:defctype VkPhysicalDeviceMaintenance3PropertiesKHR VkPhysicalDeviceMaintenance3Properties)
(cffi:defctype VkDescriptorSetLayoutSupportKHR VkDescriptorSetLayoutSupport)
(cffi:defctype VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures)
(cffi:defctype VkPhysicalDevice8BitStorageFeaturesKHR VkPhysicalDevice8BitStorageFeatures)
(cffi:defctype VkPhysicalDeviceShaderAtomicInt64FeaturesKHR VkPhysicalDeviceShaderAtomicInt64Features)
(cffi:defctype VkDriverIdKHR VkDriverId)
(cffi:defctype VkConformanceVersionKHR VkConformanceVersion)
(cffi:defctype VkPhysicalDeviceDriverPropertiesKHR VkPhysicalDeviceDriverProperties)
(cffi:defctype VkShaderFloatControlsIndependenceKHR VkShaderFloatControlsIndependence)
(cffi:defctype VkPhysicalDeviceFloatControlsPropertiesKHR VkPhysicalDeviceFloatControlsProperties)
(cffi:defctype VkResolveModeFlagBitsKHR VkResolveModeFlagBits)
(cffi:defctype VkResolveModeFlagsKHR VkResolveModeFlags)
(cffi:defctype VkSubpassDescriptionDepthStencilResolveKHR VkSubpassDescriptionDepthStencilResolve)
(cffi:defctype VkPhysicalDeviceDepthStencilResolvePropertiesKHR VkPhysicalDeviceDepthStencilResolveProperties)
(cffi:defctype VkSemaphoreTypeKHR VkSemaphoreType)
(cffi:defctype VkSemaphoreWaitFlagBitsKHR VkSemaphoreWaitFlagBits)
(cffi:defctype VkSemaphoreWaitFlagsKHR VkSemaphoreWaitFlags)
(cffi:defctype VkPhysicalDeviceTimelineSemaphoreFeaturesKHR VkPhysicalDeviceTimelineSemaphoreFeatures)
(cffi:defctype VkPhysicalDeviceTimelineSemaphorePropertiesKHR VkPhysicalDeviceTimelineSemaphoreProperties)
(cffi:defctype VkSemaphoreTypeCreateInfoKHR VkSemaphoreTypeCreateInfo)
(cffi:defctype VkTimelineSemaphoreSubmitInfoKHR VkTimelineSemaphoreSubmitInfo)
(cffi:defctype VkSemaphoreWaitInfoKHR VkSemaphoreWaitInfo)
(cffi:defctype VkSemaphoreSignalInfoKHR VkSemaphoreSignalInfo)
(cffi:defctype VkPhysicalDeviceVulkanMemoryModelFeaturesKHR VkPhysicalDeviceVulkanMemoryModelFeatures)
(cffi:defctype VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR VkPhysicalDeviceShaderTerminateInvocationFeatures)
(cffi:defctype VkPhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures)
(cffi:defctype VkAttachmentReferenceStencilLayoutKHR VkAttachmentReferenceStencilLayout)
(cffi:defctype VkAttachmentDescriptionStencilLayoutKHR VkAttachmentDescriptionStencilLayout)
(cffi:defctype VkPhysicalDeviceUniformBufferStandardLayoutFeaturesKHR VkPhysicalDeviceUniformBufferStandardLayoutFeatures)
(cffi:defctype VkPhysicalDeviceBufferDeviceAddressFeaturesKHR VkPhysicalDeviceBufferDeviceAddressFeatures)
(cffi:defctype VkBufferDeviceAddressInfoKHR VkBufferDeviceAddressInfo)
(cffi:defctype VkBufferOpaqueCaptureAddressCreateInfoKHR VkBufferOpaqueCaptureAddressCreateInfo)
(cffi:defctype VkMemoryOpaqueCaptureAddressAllocateInfoKHR VkMemoryOpaqueCaptureAddressAllocateInfo)
(cffi:defctype VkDeviceMemoryOpaqueCaptureAddressInfoKHR VkDeviceMemoryOpaqueCaptureAddressInfo)
(cffi:defctype VkDeferredOperationKHR non_dispatchable_handle)
(cffi:defctype VkPhysicalDeviceShaderIntegerDotProductFeaturesKHR VkPhysicalDeviceShaderIntegerDotProductFeatures)
(cffi:defctype VkPhysicalDeviceShaderIntegerDotProductPropertiesKHR VkPhysicalDeviceShaderIntegerDotProductProperties)
(cffi:defctype VkPipelineStageFlags2KHR VkPipelineStageFlags2)
(cffi:defctype VkPipelineStageFlagBits2KHR VkPipelineStageFlagBits2)
(cffi:defctype VkAccessFlags2KHR VkAccessFlags2)
(cffi:defctype VkAccessFlagBits2KHR VkAccessFlagBits2)
(cffi:defctype VkSubmitFlagBitsKHR VkSubmitFlagBits)
(cffi:defctype VkSubmitFlagsKHR VkSubmitFlags)
(cffi:defctype VkMemoryBarrier2KHR VkMemoryBarrier2)
(cffi:defctype VkBufferMemoryBarrier2KHR VkBufferMemoryBarrier2)
(cffi:defctype VkImageMemoryBarrier2KHR VkImageMemoryBarrier2)
(cffi:defctype VkDependencyInfoKHR VkDependencyInfo)
(cffi:defctype VkSubmitInfo2KHR VkSubmitInfo2)
(cffi:defctype VkSemaphoreSubmitInfoKHR VkSemaphoreSubmitInfo)
(cffi:defctype VkCommandBufferSubmitInfoKHR VkCommandBufferSubmitInfo)
(cffi:defctype VkPhysicalDeviceSynchronization2FeaturesKHR VkPhysicalDeviceSynchronization2Features)
(cffi:defctype VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeatures)
(cffi:defctype VkCopyBufferInfo2KHR VkCopyBufferInfo2)
(cffi:defctype VkCopyImageInfo2KHR VkCopyImageInfo2)
(cffi:defctype VkCopyBufferToImageInfo2KHR VkCopyBufferToImageInfo2)
(cffi:defctype VkCopyImageToBufferInfo2KHR VkCopyImageToBufferInfo2)
(cffi:defctype VkBlitImageInfo2KHR VkBlitImageInfo2)
(cffi:defctype VkResolveImageInfo2KHR VkResolveImageInfo2)
(cffi:defctype VkBufferCopy2KHR VkBufferCopy2)
(cffi:defctype VkImageCopy2KHR VkImageCopy2)
(cffi:defctype VkImageBlit2KHR VkImageBlit2)
(cffi:defctype VkBufferImageCopy2KHR VkBufferImageCopy2)
(cffi:defctype VkImageResolve2KHR VkImageResolve2)
(cffi:defctype VkFormatFeatureFlags2KHR VkFormatFeatureFlags2)
(cffi:defctype VkFormatFeatureFlagBits2KHR VkFormatFeatureFlagBits2)
(cffi:defctype VkFormatProperties3KHR VkFormatProperties3)
(cffi:defctype VkPhysicalDeviceMaintenance4FeaturesKHR VkPhysicalDeviceMaintenance4Features)
(cffi:defctype VkPhysicalDeviceMaintenance4PropertiesKHR VkPhysicalDeviceMaintenance4Properties)
(cffi:defctype VkDeviceBufferMemoryRequirementsKHR VkDeviceBufferMemoryRequirements)
(cffi:defctype VkDeviceImageMemoryRequirementsKHR VkDeviceImageMemoryRequirements)
(cffi:defctype VkDebugReportCallbackEXT non_dispatchable_handle)
(cffi:defctype VkDebugReportFlagsEXT VkFlags)
(cffi:defctype VkPipelineRasterizationStateStreamCreateFlagsEXT VkFlags)
(cffi:defctype VkCuModuleNVX non_dispatchable_handle)
(cffi:defctype VkCuFunctionNVX non_dispatchable_handle)
(cffi:defctype VkExternalMemoryHandleTypeFlagsNV VkFlags)
(cffi:defctype VkExternalMemoryFeatureFlagsNV VkFlags)
(cffi:defctype VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT VkPhysicalDeviceTextureCompressionASTCHDRFeatures)
(cffi:defctype VkConditionalRenderingFlagsEXT VkFlags)
(cffi:defctype VkSurfaceCounterFlagsEXT VkFlags)
(cffi:defctype VkPipelineViewportSwizzleStateCreateFlagsNV VkFlags)
(cffi:defctype VkPipelineDiscardRectangleStateCreateFlagsEXT VkFlags)
(cffi:defctype VkPipelineRasterizationConservativeStateCreateFlagsEXT VkFlags)
(cffi:defctype VkPipelineRasterizationDepthClipStateCreateFlagsEXT VkFlags)
(cffi:defctype VkDebugUtilsMessengerEXT non_dispatchable_handle)
(cffi:defctype VkDebugUtilsMessengerCallbackDataFlagsEXT VkFlags)
(cffi:defctype VkDebugUtilsMessageTypeFlagsEXT VkFlags)
(cffi:defctype VkDebugUtilsMessageSeverityFlagsEXT VkFlags)
(cffi:defctype VkDebugUtilsMessengerCreateFlagsEXT VkFlags)
(cffi:defctype VkSamplerReductionModeEXT VkSamplerReductionMode)
(cffi:defctype VkSamplerReductionModeCreateInfoEXT VkSamplerReductionModeCreateInfo)
(cffi:defctype VkPhysicalDeviceSamplerFilterMinmaxPropertiesEXT VkPhysicalDeviceSamplerFilterMinmaxProperties)
(cffi:defctype VkPhysicalDeviceInlineUniformBlockFeaturesEXT VkPhysicalDeviceInlineUniformBlockFeatures)
(cffi:defctype VkPhysicalDeviceInlineUniformBlockPropertiesEXT VkPhysicalDeviceInlineUniformBlockProperties)
(cffi:defctype VkWriteDescriptorSetInlineUniformBlockEXT VkWriteDescriptorSetInlineUniformBlock)
(cffi:defctype VkDescriptorPoolInlineUniformBlockCreateInfoEXT VkDescriptorPoolInlineUniformBlockCreateInfo)
(cffi:defctype VkPipelineCoverageToColorStateCreateFlagsNV VkFlags)
(cffi:defctype VkPipelineCoverageModulationStateCreateFlagsNV VkFlags)
(cffi:defctype VkValidationCacheEXT non_dispatchable_handle)
(cffi:defctype VkValidationCacheCreateFlagsEXT VkFlags)
(cffi:defctype VkDescriptorBindingFlagBitsEXT VkDescriptorBindingFlagBits)
(cffi:defctype VkDescriptorBindingFlagsEXT VkDescriptorBindingFlags)
(cffi:defctype VkDescriptorSetLayoutBindingFlagsCreateInfoEXT VkDescriptorSetLayoutBindingFlagsCreateInfo)
(cffi:defctype VkPhysicalDeviceDescriptorIndexingFeaturesEXT VkPhysicalDeviceDescriptorIndexingFeatures)
(cffi:defctype VkPhysicalDeviceDescriptorIndexingPropertiesEXT VkPhysicalDeviceDescriptorIndexingProperties)
(cffi:defctype VkDescriptorSetVariableDescriptorCountAllocateInfoEXT VkDescriptorSetVariableDescriptorCountAllocateInfo)
(cffi:defctype VkDescriptorSetVariableDescriptorCountLayoutSupportEXT VkDescriptorSetVariableDescriptorCountLayoutSupport)
(cffi:defctype VkAccelerationStructureNV non_dispatchable_handle)
(cffi:defctype VkRayTracingShaderGroupTypeNV VkRayTracingShaderGroupTypeKHR)
(cffi:defctype VkGeometryTypeNV VkGeometryTypeKHR)
(cffi:defctype VkAccelerationStructureTypeNV VkAccelerationStructureTypeKHR)
(cffi:defctype VkCopyAccelerationStructureModeNV VkCopyAccelerationStructureModeKHR)
(cffi:defctype VkGeometryFlagsKHR VkFlags)
(cffi:defctype VkGeometryFlagsNV VkGeometryFlagsKHR)
(cffi:defctype VkGeometryFlagBitsNV VkGeometryFlagBitsKHR)
(cffi:defctype VkGeometryInstanceFlagsKHR VkFlags)
(cffi:defctype VkGeometryInstanceFlagsNV VkGeometryInstanceFlagsKHR)
(cffi:defctype VkGeometryInstanceFlagBitsNV VkGeometryInstanceFlagBitsKHR)
(cffi:defctype VkBuildAccelerationStructureFlagsKHR VkFlags)
(cffi:defctype VkBuildAccelerationStructureFlagsNV VkBuildAccelerationStructureFlagsKHR)
(cffi:defctype VkBuildAccelerationStructureFlagBitsNV VkBuildAccelerationStructureFlagBitsKHR)
(cffi:defctype VkTransformMatrixNV VkTransformMatrixKHR)
(cffi:defctype VkAabbPositionsNV VkAabbPositionsKHR)
(cffi:defctype VkAccelerationStructureInstanceNV VkAccelerationStructureInstanceKHR)
(cffi:defctype VkQueueGlobalPriorityEXT VkQueueGlobalPriorityKHR)
(cffi:defctype VkDeviceQueueGlobalPriorityCreateInfoEXT VkDeviceQueueGlobalPriorityCreateInfoKHR)
(cffi:defctype VkPipelineCompilerControlFlagsAMD VkFlags)
(cffi:defctype VkPipelineCreationFeedbackFlagBitsEXT VkPipelineCreationFeedbackFlagBits)
(cffi:defctype VkPipelineCreationFeedbackFlagsEXT VkPipelineCreationFeedbackFlags)
(cffi:defctype VkPipelineCreationFeedbackCreateInfoEXT VkPipelineCreationFeedbackCreateInfo)
(cffi:defctype VkPipelineCreationFeedbackEXT VkPipelineCreationFeedback)
(cffi:defctype VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR)
(cffi:defctype VkPerformanceConfigurationINTEL non_dispatchable_handle)
(cffi:defctype VkQueryPoolCreateInfoINTEL VkQueryPoolPerformanceQueryCreateInfoINTEL)
(cffi:defctype VkPhysicalDeviceScalarBlockLayoutFeaturesEXT VkPhysicalDeviceScalarBlockLayoutFeatures)
(cffi:defctype VkPhysicalDeviceSubgroupSizeControlFeaturesEXT VkPhysicalDeviceSubgroupSizeControlFeatures)
(cffi:defctype VkPhysicalDeviceSubgroupSizeControlPropertiesEXT VkPhysicalDeviceSubgroupSizeControlProperties)
(cffi:defctype VkPipelineShaderStageRequiredSubgroupSizeCreateInfoEXT VkPipelineShaderStageRequiredSubgroupSizeCreateInfo)
(cffi:defctype VkShaderCorePropertiesFlagsAMD VkFlags)
(cffi:defctype VkPhysicalDeviceBufferAddressFeaturesEXT VkPhysicalDeviceBufferDeviceAddressFeaturesEXT)
(cffi:defctype VkBufferDeviceAddressInfoEXT VkBufferDeviceAddressInfo)
(cffi:defctype VkToolPurposeFlagBitsEXT VkToolPurposeFlagBits)
(cffi:defctype VkToolPurposeFlagsEXT VkToolPurposeFlags)
(cffi:defctype VkPhysicalDeviceToolPropertiesEXT VkPhysicalDeviceToolProperties)
(cffi:defctype VkImageStencilUsageCreateInfoEXT VkImageStencilUsageCreateInfo)
(cffi:defctype VkPipelineCoverageReductionStateCreateFlagsNV VkFlags)
(cffi:defctype VkHeadlessSurfaceCreateFlagsEXT VkFlags)
(cffi:defctype VkPhysicalDeviceHostQueryResetFeaturesEXT VkPhysicalDeviceHostQueryResetFeatures)
(cffi:defctype VkPhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT VkPhysicalDeviceShaderDemoteToHelperInvocationFeatures)
(cffi:defctype VkIndirectCommandsLayoutNV non_dispatchable_handle)
(cffi:defctype VkIndirectStateFlagsNV VkFlags)
(cffi:defctype VkIndirectCommandsLayoutUsageFlagsNV VkFlags)
(cffi:defctype VkPhysicalDeviceTexelBufferAlignmentPropertiesEXT VkPhysicalDeviceTexelBufferAlignmentProperties)
(cffi:defctype VkDeviceMemoryReportFlagsEXT VkFlags)
(cffi:defctype VkPrivateDataSlotEXT VkPrivateDataSlot)
(cffi:defctype VkPrivateDataSlotCreateFlagsEXT VkPrivateDataSlotCreateFlags)
(cffi:defctype VkPhysicalDevicePrivateDataFeaturesEXT VkPhysicalDevicePrivateDataFeatures)
(cffi:defctype VkDevicePrivateDataCreateInfoEXT VkDevicePrivateDataCreateInfo)
(cffi:defctype VkPrivateDataSlotCreateInfoEXT VkPrivateDataSlotCreateInfo)
(cffi:defctype VkPhysicalDevicePipelineCreationCacheControlFeaturesEXT VkPhysicalDevicePipelineCreationCacheControlFeatures)
(cffi:defctype VkDeviceDiagnosticsConfigFlagsNV VkFlags)
(cffi:defctype VkGraphicsPipelineLibraryFlagsEXT VkFlags)
(cffi:defctype VkAccelerationStructureMotionInfoFlagsNV VkFlags)
(cffi:defctype VkAccelerationStructureMotionInstanceFlagsNV VkFlags)
(cffi:defctype VkPhysicalDeviceImageRobustnessFeaturesEXT VkPhysicalDeviceImageRobustnessFeatures)
(cffi:defctype VkImageCompressionFlagsEXT VkFlags)
(cffi:defctype VkImageCompressionFixedRateFlagsEXT VkFlags)
(cffi:defctype VkRemoteAddressNV void*)
(cffi:defctype VkPipelineInfoEXT VkPipelineInfoKHR)
(cffi:defctype VkPhysicalDeviceGlobalPriorityQueryFeaturesEXT VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR)
(cffi:defctype VkQueueFamilyGlobalPriorityPropertiesEXT VkQueueFamilyGlobalPriorityPropertiesKHR)
(cffi:defctype VkAccelerationStructureKHR non_dispatchable_handle)
(cffi:defctype VkAccelerationStructureCreateFlagsKHR VkFlags)