
(in-package :cvk)


(more-cffi:defcfun ("vkCreateInstance" vkcreateinstance
                    funcall-vkcreateinstance)
    vkresult
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pinstance :pointer))

(more-cffi:defcfun ("vkDestroyInstance" vkdestroyinstance
                    funcall-vkdestroyinstance)
    :void
  (instance vkinstance)
  (pallocator :pointer))

(more-cffi:defcfun ("vkEnumeratePhysicalDevices" vkenumeratephysicaldevices
                    funcall-vkenumeratephysicaldevices)
    vkresult
  (instance vkinstance)
  (pphysicaldevicecount :pointer)
  (pphysicaldevices :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceFeatures" vkgetphysicaldevicefeatures
                    funcall-vkgetphysicaldevicefeatures)
    :void
  (physicaldevice vkphysicaldevice)
  (pfeatures :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceFormatProperties"
                    vkgetphysicaldeviceformatproperties
                    funcall-vkgetphysicaldeviceformatproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (pformatproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties"
                    vkgetphysicaldeviceimageformatproperties
                    funcall-vkgetphysicaldeviceimageformatproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (type vkimagetype)
  (tiling vkimagetiling)
  (usage vkimageusageflags)
  (flags vkimagecreateflags)
  (pimageformatproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceProperties"
                    vkgetphysicaldeviceproperties
                    funcall-vkgetphysicaldeviceproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties"
                    vkgetphysicaldevicequeuefamilyproperties
                    funcall-vkgetphysicaldevicequeuefamilyproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pqueuefamilypropertycount :pointer)
  (pqueuefamilyproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties"
                    vkgetphysicaldevicememoryproperties
                    funcall-vkgetphysicaldevicememoryproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pmemoryproperties :pointer))

(more-cffi:defcfun ("vkGetInstanceProcAddr" vkgetinstanceprocaddr
                    funcall-vkgetinstanceprocaddr)
    pfn_vkvoidfunction
  (instance vkinstance)
  (pname :pointer))

(more-cffi:defcfun ("vkGetDeviceProcAddr" vkgetdeviceprocaddr
                    funcall-vkgetdeviceprocaddr)
    pfn_vkvoidfunction
  (device vkdevice)
  (pname :pointer))

(more-cffi:defcfun ("vkCreateDevice" vkcreatedevice funcall-vkcreatedevice)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pdevice :pointer))

(more-cffi:defcfun ("vkDestroyDevice" vkdestroydevice funcall-vkdestroydevice)
    :void
  (device vkdevice)
  (pallocator :pointer))

(more-cffi:defcfun ("vkEnumerateInstanceExtensionProperties"
                    vkenumerateinstanceextensionproperties
                    funcall-vkenumerateinstanceextensionproperties)
    vkresult
  (playername :pointer)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkEnumerateDeviceExtensionProperties"
                    vkenumeratedeviceextensionproperties
                    funcall-vkenumeratedeviceextensionproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (playername :pointer)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkEnumerateInstanceLayerProperties"
                    vkenumerateinstancelayerproperties
                    funcall-vkenumerateinstancelayerproperties)
    vkresult
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkEnumerateDeviceLayerProperties"
                    vkenumeratedevicelayerproperties
                    funcall-vkenumeratedevicelayerproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetDeviceQueue" vkgetdevicequeue
                    funcall-vkgetdevicequeue)
    :void
  (device vkdevice)
  (queuefamilyindex :uint32)
  (queueindex :uint32)
  (pqueue :pointer))

(more-cffi:defcfun ("vkQueueSubmit" vkqueuesubmit funcall-vkqueuesubmit)
    vkresult
  (queue vkqueue)
  (submitcount :uint32)
  (psubmits :pointer)
  (fence vkfence))

(more-cffi:defcfun ("vkQueueWaitIdle" vkqueuewaitidle funcall-vkqueuewaitidle)
    vkresult
  (queue vkqueue))

(more-cffi:defcfun ("vkDeviceWaitIdle" vkdevicewaitidle
                    funcall-vkdevicewaitidle)
    vkresult
  (device vkdevice))

(more-cffi:defcfun ("vkAllocateMemory" vkallocatememory
                    funcall-vkallocatememory)
    vkresult
  (device vkdevice)
  (pallocateinfo :pointer)
  (pallocator :pointer)
  (pmemory :pointer))

(more-cffi:defcfun ("vkFreeMemory" vkfreememory funcall-vkfreememory)
    :void
  (device vkdevice)
  (memory vkdevicememory)
  (pallocator :pointer))

(more-cffi:defcfun ("vkMapMemory" vkmapmemory funcall-vkmapmemory)
    vkresult
  (device vkdevice)
  (memory vkdevicememory)
  (offset vkdevicesize)
  (size vkdevicesize)
  (flags vkmemorymapflags)
  (ppdata :pointer))

(more-cffi:defcfun ("vkUnmapMemory" vkunmapmemory funcall-vkunmapmemory)
    :void
  (device vkdevice)
  (memory vkdevicememory))

(more-cffi:defcfun ("vkFlushMappedMemoryRanges" vkflushmappedmemoryranges
                    funcall-vkflushmappedmemoryranges)
    vkresult
  (device vkdevice)
  (memoryrangecount :uint32)
  (pmemoryranges :pointer))

(more-cffi:defcfun ("vkInvalidateMappedMemoryRanges"
                    vkinvalidatemappedmemoryranges
                    funcall-vkinvalidatemappedmemoryranges)
    vkresult
  (device vkdevice)
  (memoryrangecount :uint32)
  (pmemoryranges :pointer))

(more-cffi:defcfun ("vkGetDeviceMemoryCommitment" vkgetdevicememorycommitment
                    funcall-vkgetdevicememorycommitment)
    :void
  (device vkdevice)
  (memory vkdevicememory)
  (pcommittedmemoryinbytes :pointer))

(more-cffi:defcfun ("vkBindBufferMemory" vkbindbuffermemory
                    funcall-vkbindbuffermemory)
    vkresult
  (device vkdevice)
  (buffer vkbuffer)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize))

(more-cffi:defcfun ("vkBindImageMemory" vkbindimagememory
                    funcall-vkbindimagememory)
    vkresult
  (device vkdevice)
  (image vkimage)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize))

(more-cffi:defcfun ("vkGetBufferMemoryRequirements"
                    vkgetbuffermemoryrequirements
                    funcall-vkgetbuffermemoryrequirements)
    :void
  (device vkdevice)
  (buffer vkbuffer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkGetImageMemoryRequirements" vkgetimagememoryrequirements
                    funcall-vkgetimagememoryrequirements)
    :void
  (device vkdevice)
  (image vkimage)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkGetImageSparseMemoryRequirements"
                    vkgetimagesparsememoryrequirements
                    funcall-vkgetimagesparsememoryrequirements)
    :void
  (device vkdevice)
  (image vkimage)
  (psparsememoryrequirementcount :pointer)
  (psparsememoryrequirements :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties"
                    vkgetphysicaldevicesparseimageformatproperties
                    funcall-vkgetphysicaldevicesparseimageformatproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (type vkimagetype)
  (samples vksamplecountflagbits)
  (usage vkimageusageflags)
  (tiling vkimagetiling)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkQueueBindSparse" vkqueuebindsparse
                    funcall-vkqueuebindsparse)
    vkresult
  (queue vkqueue)
  (bindinfocount :uint32)
  (pbindinfo :pointer)
  (fence vkfence))

(more-cffi:defcfun ("vkCreateFence" vkcreatefence funcall-vkcreatefence)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pfence :pointer))

(more-cffi:defcfun ("vkDestroyFence" vkdestroyfence funcall-vkdestroyfence)
    :void
  (device vkdevice)
  (fence vkfence)
  (pallocator :pointer))

(more-cffi:defcfun ("vkResetFences" vkresetfences funcall-vkresetfences)
    vkresult
  (device vkdevice)
  (fencecount :uint32)
  (pfences :pointer))

(more-cffi:defcfun ("vkGetFenceStatus" vkgetfencestatus
                    funcall-vkgetfencestatus)
    vkresult
  (device vkdevice)
  (fence vkfence))

(more-cffi:defcfun ("vkWaitForFences" vkwaitforfences funcall-vkwaitforfences)
    vkresult
  (device vkdevice)
  (fencecount :uint32)
  (pfences :pointer)
  (waitall vkbool32)
  (timeout :uint64))

(more-cffi:defcfun ("vkCreateSemaphore" vkcreatesemaphore
                    funcall-vkcreatesemaphore)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (psemaphore :pointer))

(more-cffi:defcfun ("vkDestroySemaphore" vkdestroysemaphore
                    funcall-vkdestroysemaphore)
    :void
  (device vkdevice)
  (semaphore vksemaphore)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreateEvent" vkcreateevent funcall-vkcreateevent)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pevent :pointer))

(more-cffi:defcfun ("vkDestroyEvent" vkdestroyevent funcall-vkdestroyevent)
    :void
  (device vkdevice)
  (event vkevent)
  (pallocator :pointer))

(more-cffi:defcfun ("vkGetEventStatus" vkgeteventstatus
                    funcall-vkgeteventstatus)
    vkresult
  (device vkdevice)
  (event vkevent))

(more-cffi:defcfun ("vkSetEvent" vksetevent funcall-vksetevent)
    vkresult
  (device vkdevice)
  (event vkevent))

(more-cffi:defcfun ("vkResetEvent" vkresetevent funcall-vkresetevent)
    vkresult
  (device vkdevice)
  (event vkevent))

(more-cffi:defcfun ("vkCreateQueryPool" vkcreatequerypool
                    funcall-vkcreatequerypool)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pquerypool :pointer))

(more-cffi:defcfun ("vkDestroyQueryPool" vkdestroyquerypool
                    funcall-vkdestroyquerypool)
    :void
  (device vkdevice)
  (querypool vkquerypool)
  (pallocator :pointer))

(more-cffi:defcfun ("vkGetQueryPoolResults" vkgetquerypoolresults
                    funcall-vkgetquerypoolresults)
    vkresult
  (device vkdevice)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32)
  (datasize :size)
  (pdata :pointer)
  (stride vkdevicesize)
  (flags vkqueryresultflags))

(more-cffi:defcfun ("vkCreateBuffer" vkcreatebuffer funcall-vkcreatebuffer)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pbuffer :pointer))

(more-cffi:defcfun ("vkDestroyBuffer" vkdestroybuffer funcall-vkdestroybuffer)
    :void
  (device vkdevice)
  (buffer vkbuffer)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreateBufferView" vkcreatebufferview
                    funcall-vkcreatebufferview)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pview :pointer))

(more-cffi:defcfun ("vkDestroyBufferView" vkdestroybufferview
                    funcall-vkdestroybufferview)
    :void
  (device vkdevice)
  (bufferview vkbufferview)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreateImage" vkcreateimage funcall-vkcreateimage)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pimage :pointer))

(more-cffi:defcfun ("vkDestroyImage" vkdestroyimage funcall-vkdestroyimage)
    :void
  (device vkdevice)
  (image vkimage)
  (pallocator :pointer))

(more-cffi:defcfun ("vkGetImageSubresourceLayout" vkgetimagesubresourcelayout
                    funcall-vkgetimagesubresourcelayout)
    :void
  (device vkdevice)
  (image vkimage)
  (psubresource :pointer)
  (playout :pointer))

(more-cffi:defcfun ("vkCreateImageView" vkcreateimageview
                    funcall-vkcreateimageview)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pview :pointer))

(more-cffi:defcfun ("vkDestroyImageView" vkdestroyimageview
                    funcall-vkdestroyimageview)
    :void
  (device vkdevice)
  (imageview vkimageview)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreateShaderModule" vkcreateshadermodule
                    funcall-vkcreateshadermodule)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pshadermodule :pointer))

(more-cffi:defcfun ("vkDestroyShaderModule" vkdestroyshadermodule
                    funcall-vkdestroyshadermodule)
    :void
  (device vkdevice)
  (shadermodule vkshadermodule)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreatePipelineCache" vkcreatepipelinecache
                    funcall-vkcreatepipelinecache)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (ppipelinecache :pointer))

(more-cffi:defcfun ("vkDestroyPipelineCache" vkdestroypipelinecache
                    funcall-vkdestroypipelinecache)
    :void
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (pallocator :pointer))

(more-cffi:defcfun ("vkGetPipelineCacheData" vkgetpipelinecachedata
                    funcall-vkgetpipelinecachedata)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (pdatasize :pointer)
  (pdata :pointer))

(more-cffi:defcfun ("vkMergePipelineCaches" vkmergepipelinecaches
                    funcall-vkmergepipelinecaches)
    vkresult
  (device vkdevice)
  (dstcache vkpipelinecache)
  (srccachecount :uint32)
  (psrccaches :pointer))

(more-cffi:defcfun ("vkCreateGraphicsPipelines" vkcreategraphicspipelines
                    funcall-vkcreategraphicspipelines)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos :pointer)
  (pallocator :pointer)
  (ppipelines :pointer))

(more-cffi:defcfun ("vkCreateComputePipelines" vkcreatecomputepipelines
                    funcall-vkcreatecomputepipelines)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos :pointer)
  (pallocator :pointer)
  (ppipelines :pointer))

(more-cffi:defcfun ("vkDestroyPipeline" vkdestroypipeline
                    funcall-vkdestroypipeline)
    :void
  (device vkdevice)
  (pipeline vkpipeline)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreatePipelineLayout" vkcreatepipelinelayout
                    funcall-vkcreatepipelinelayout)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (ppipelinelayout :pointer))

(more-cffi:defcfun ("vkDestroyPipelineLayout" vkdestroypipelinelayout
                    funcall-vkdestroypipelinelayout)
    :void
  (device vkdevice)
  (pipelinelayout vkpipelinelayout)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreateSampler" vkcreatesampler funcall-vkcreatesampler)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (psampler :pointer))

(more-cffi:defcfun ("vkDestroySampler" vkdestroysampler
                    funcall-vkdestroysampler)
    :void
  (device vkdevice)
  (sampler vksampler)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreateDescriptorSetLayout" vkcreatedescriptorsetlayout
                    funcall-vkcreatedescriptorsetlayout)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (psetlayout :pointer))

(more-cffi:defcfun ("vkDestroyDescriptorSetLayout" vkdestroydescriptorsetlayout
                    funcall-vkdestroydescriptorsetlayout)
    :void
  (device vkdevice)
  (descriptorsetlayout vkdescriptorsetlayout)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreateDescriptorPool" vkcreatedescriptorpool
                    funcall-vkcreatedescriptorpool)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pdescriptorpool :pointer))

(more-cffi:defcfun ("vkDestroyDescriptorPool" vkdestroydescriptorpool
                    funcall-vkdestroydescriptorpool)
    :void
  (device vkdevice)
  (descriptorpool vkdescriptorpool)
  (pallocator :pointer))

(more-cffi:defcfun ("vkResetDescriptorPool" vkresetdescriptorpool
                    funcall-vkresetdescriptorpool)
    vkresult
  (device vkdevice)
  (descriptorpool vkdescriptorpool)
  (flags vkdescriptorpoolresetflags))

(more-cffi:defcfun ("vkAllocateDescriptorSets" vkallocatedescriptorsets
                    funcall-vkallocatedescriptorsets)
    vkresult
  (device vkdevice)
  (pallocateinfo :pointer)
  (pdescriptorsets :pointer))

(more-cffi:defcfun ("vkFreeDescriptorSets" vkfreedescriptorsets
                    funcall-vkfreedescriptorsets)
    vkresult
  (device vkdevice)
  (descriptorpool vkdescriptorpool)
  (descriptorsetcount :uint32)
  (pdescriptorsets :pointer))

(more-cffi:defcfun ("vkUpdateDescriptorSets" vkupdatedescriptorsets
                    funcall-vkupdatedescriptorsets)
    :void
  (device vkdevice)
  (descriptorwritecount :uint32)
  (pdescriptorwrites :pointer)
  (descriptorcopycount :uint32)
  (pdescriptorcopies :pointer))

(more-cffi:defcfun ("vkCreateFramebuffer" vkcreateframebuffer
                    funcall-vkcreateframebuffer)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pframebuffer :pointer))

(more-cffi:defcfun ("vkDestroyFramebuffer" vkdestroyframebuffer
                    funcall-vkdestroyframebuffer)
    :void
  (device vkdevice)
  (framebuffer vkframebuffer)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreateRenderPass" vkcreaterenderpass
                    funcall-vkcreaterenderpass)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (prenderpass :pointer))

(more-cffi:defcfun ("vkDestroyRenderPass" vkdestroyrenderpass
                    funcall-vkdestroyrenderpass)
    :void
  (device vkdevice)
  (renderpass vkrenderpass)
  (pallocator :pointer))

(more-cffi:defcfun ("vkGetRenderAreaGranularity" vkgetrenderareagranularity
                    funcall-vkgetrenderareagranularity)
    :void
  (device vkdevice)
  (renderpass vkrenderpass)
  (pgranularity :pointer))

(more-cffi:defcfun ("vkCreateCommandPool" vkcreatecommandpool
                    funcall-vkcreatecommandpool)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pcommandpool :pointer))

(more-cffi:defcfun ("vkDestroyCommandPool" vkdestroycommandpool
                    funcall-vkdestroycommandpool)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (pallocator :pointer))

(more-cffi:defcfun ("vkResetCommandPool" vkresetcommandpool
                    funcall-vkresetcommandpool)
    vkresult
  (device vkdevice)
  (commandpool vkcommandpool)
  (flags vkcommandpoolresetflags))

(more-cffi:defcfun ("vkAllocateCommandBuffers" vkallocatecommandbuffers
                    funcall-vkallocatecommandbuffers)
    vkresult
  (device vkdevice)
  (pallocateinfo :pointer)
  (pcommandbuffers :pointer))

(more-cffi:defcfun ("vkFreeCommandBuffers" vkfreecommandbuffers
                    funcall-vkfreecommandbuffers)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (commandbuffercount :uint32)
  (pcommandbuffers :pointer))

(more-cffi:defcfun ("vkBeginCommandBuffer" vkbegincommandbuffer
                    funcall-vkbegincommandbuffer)
    vkresult
  (commandbuffer vkcommandbuffer)
  (pbegininfo :pointer))

(more-cffi:defcfun ("vkEndCommandBuffer" vkendcommandbuffer
                    funcall-vkendcommandbuffer)
    vkresult
  (commandbuffer vkcommandbuffer))

(more-cffi:defcfun ("vkResetCommandBuffer" vkresetcommandbuffer
                    funcall-vkresetcommandbuffer)
    vkresult
  (commandbuffer vkcommandbuffer)
  (flags vkcommandbufferresetflags))

(more-cffi:defcfun ("vkCmdBindPipeline" vkcmdbindpipeline
                    funcall-vkcmdbindpipeline)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinebindpoint vkpipelinebindpoint)
  (pipeline vkpipeline))

(more-cffi:defcfun ("vkCmdSetViewport" vkcmdsetviewport
                    funcall-vkcmdsetviewport)
    :void
  (commandbuffer vkcommandbuffer)
  (firstviewport :uint32)
  (viewportcount :uint32)
  (pviewports :pointer))

(more-cffi:defcfun ("vkCmdSetScissor" vkcmdsetscissor funcall-vkcmdsetscissor)
    :void
  (commandbuffer vkcommandbuffer)
  (firstscissor :uint32)
  (scissorcount :uint32)
  (pscissors :pointer))

(more-cffi:defcfun ("vkCmdSetLineWidth" vkcmdsetlinewidth
                    funcall-vkcmdsetlinewidth)
    :void
  (commandbuffer vkcommandbuffer)
  (linewidth :float))

(more-cffi:defcfun ("vkCmdSetDepthBias" vkcmdsetdepthbias
                    funcall-vkcmdsetdepthbias)
    :void
  (commandbuffer vkcommandbuffer)
  (depthbiasconstantfactor :float)
  (depthbiasclamp :float)
  (depthbiasslopefactor :float))

(more-cffi:defcfun ("vkCmdSetBlendConstants" vkcmdsetblendconstants
                    funcall-vkcmdsetblendconstants)
    :void
  (commandbuffer vkcommandbuffer)
  (blendconstants :float))

(more-cffi:defcfun ("vkCmdSetDepthBounds" vkcmdsetdepthbounds
                    funcall-vkcmdsetdepthbounds)
    :void
  (commandbuffer vkcommandbuffer)
  (mindepthbounds :float)
  (maxdepthbounds :float))

(more-cffi:defcfun ("vkCmdSetStencilCompareMask" vkcmdsetstencilcomparemask
                    funcall-vkcmdsetstencilcomparemask)
    :void
  (commandbuffer vkcommandbuffer)
  (facemask vkstencilfaceflags)
  (comparemask :uint32))

(more-cffi:defcfun ("vkCmdSetStencilWriteMask" vkcmdsetstencilwritemask
                    funcall-vkcmdsetstencilwritemask)
    :void
  (commandbuffer vkcommandbuffer)
  (facemask vkstencilfaceflags)
  (writemask :uint32))

(more-cffi:defcfun ("vkCmdSetStencilReference" vkcmdsetstencilreference
                    funcall-vkcmdsetstencilreference)
    :void
  (commandbuffer vkcommandbuffer)
  (facemask vkstencilfaceflags)
  (reference :uint32))

(more-cffi:defcfun ("vkCmdBindDescriptorSets" vkcmdbinddescriptorsets
                    funcall-vkcmdbinddescriptorsets)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinebindpoint vkpipelinebindpoint)
  (layout vkpipelinelayout)
  (firstset :uint32)
  (descriptorsetcount :uint32)
  (pdescriptorsets :pointer)
  (dynamicoffsetcount :uint32)
  (pdynamicoffsets :pointer))

(more-cffi:defcfun ("vkCmdBindIndexBuffer" vkcmdbindindexbuffer
                    funcall-vkcmdbindindexbuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (indextype vkindextype))

(more-cffi:defcfun ("vkCmdBindVertexBuffers" vkcmdbindvertexbuffers
                    funcall-vkcmdbindvertexbuffers)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers :pointer)
  (poffsets :pointer))

(more-cffi:defcfun ("vkCmdDraw" vkcmddraw funcall-vkcmddraw)
    :void
  (commandbuffer vkcommandbuffer)
  (vertexcount :uint32)
  (instancecount :uint32)
  (firstvertex :uint32)
  (firstinstance :uint32))

(more-cffi:defcfun ("vkCmdDrawIndexed" vkcmddrawindexed
                    funcall-vkcmddrawindexed)
    :void
  (commandbuffer vkcommandbuffer)
  (indexcount :uint32)
  (instancecount :uint32)
  (firstindex :uint32)
  (vertexoffset :int32)
  (firstinstance :uint32))

(more-cffi:defcfun ("vkCmdDrawIndirect" vkcmddrawindirect
                    funcall-vkcmddrawindirect)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (drawcount :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkCmdDrawIndexedIndirect" vkcmddrawindexedindirect
                    funcall-vkcmddrawindexedindirect)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (drawcount :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkCmdDispatch" vkcmddispatch funcall-vkcmddispatch)
    :void
  (commandbuffer vkcommandbuffer)
  (groupcountx :uint32)
  (groupcounty :uint32)
  (groupcountz :uint32))

(more-cffi:defcfun ("vkCmdDispatchIndirect" vkcmddispatchindirect
                    funcall-vkcmddispatchindirect)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize))

(more-cffi:defcfun ("vkCmdCopyBuffer" vkcmdcopybuffer funcall-vkcmdcopybuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (srcbuffer vkbuffer)
  (dstbuffer vkbuffer)
  (regioncount :uint32)
  (pregions :pointer))

(more-cffi:defcfun ("vkCmdCopyImage" vkcmdcopyimage funcall-vkcmdcopyimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer))

(more-cffi:defcfun ("vkCmdBlitImage" vkcmdblitimage funcall-vkcmdblitimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer)
  (filter vkfilter))

(more-cffi:defcfun ("vkCmdCopyBufferToImage" vkcmdcopybuffertoimage
                    funcall-vkcmdcopybuffertoimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcbuffer vkbuffer)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer))

(more-cffi:defcfun ("vkCmdCopyImageToBuffer" vkcmdcopyimagetobuffer
                    funcall-vkcmdcopyimagetobuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstbuffer vkbuffer)
  (regioncount :uint32)
  (pregions :pointer))

(more-cffi:defcfun ("vkCmdUpdateBuffer" vkcmdupdatebuffer
                    funcall-vkcmdupdatebuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (datasize vkdevicesize)
  (pdata :pointer))

(more-cffi:defcfun ("vkCmdFillBuffer" vkcmdfillbuffer funcall-vkcmdfillbuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (size vkdevicesize)
  (data :uint32))

(more-cffi:defcfun ("vkCmdClearColorImage" vkcmdclearcolorimage
                    funcall-vkcmdclearcolorimage)
    :void
  (commandbuffer vkcommandbuffer)
  (image vkimage)
  (imagelayout vkimagelayout)
  (pcolor :pointer)
  (rangecount :uint32)
  (pranges :pointer))

(more-cffi:defcfun ("vkCmdClearDepthStencilImage" vkcmdcleardepthstencilimage
                    funcall-vkcmdcleardepthstencilimage)
    :void
  (commandbuffer vkcommandbuffer)
  (image vkimage)
  (imagelayout vkimagelayout)
  (pdepthstencil :pointer)
  (rangecount :uint32)
  (pranges :pointer))

(more-cffi:defcfun ("vkCmdClearAttachments" vkcmdclearattachments
                    funcall-vkcmdclearattachments)
    :void
  (commandbuffer vkcommandbuffer)
  (attachmentcount :uint32)
  (pattachments :pointer)
  (rectcount :uint32)
  (prects :pointer))

(more-cffi:defcfun ("vkCmdResolveImage" vkcmdresolveimage
                    funcall-vkcmdresolveimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer))

(more-cffi:defcfun ("vkCmdSetEvent" vkcmdsetevent funcall-vkcmdsetevent)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (stagemask vkpipelinestageflags))

(more-cffi:defcfun ("vkCmdResetEvent" vkcmdresetevent funcall-vkcmdresetevent)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (stagemask vkpipelinestageflags))

(more-cffi:defcfun ("vkCmdWaitEvents" vkcmdwaitevents funcall-vkcmdwaitevents)
    :void
  (commandbuffer vkcommandbuffer)
  (eventcount :uint32)
  (pevents :pointer)
  (srcstagemask vkpipelinestageflags)
  (dststagemask vkpipelinestageflags)
  (memorybarriercount :uint32)
  (pmemorybarriers :pointer)
  (buffermemorybarriercount :uint32)
  (pbuffermemorybarriers :pointer)
  (imagememorybarriercount :uint32)
  (pimagememorybarriers :pointer))

(more-cffi:defcfun ("vkCmdPipelineBarrier" vkcmdpipelinebarrier
                    funcall-vkcmdpipelinebarrier)
    :void
  (commandbuffer vkcommandbuffer)
  (srcstagemask vkpipelinestageflags)
  (dststagemask vkpipelinestageflags)
  (dependencyflags vkdependencyflags)
  (memorybarriercount :uint32)
  (pmemorybarriers :pointer)
  (buffermemorybarriercount :uint32)
  (pbuffermemorybarriers :pointer)
  (imagememorybarriercount :uint32)
  (pimagememorybarriers :pointer))

(more-cffi:defcfun ("vkCmdBeginQuery" vkcmdbeginquery funcall-vkcmdbeginquery)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (query :uint32)
  (flags vkquerycontrolflags))

(more-cffi:defcfun ("vkCmdEndQuery" vkcmdendquery funcall-vkcmdendquery)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (query :uint32))

(more-cffi:defcfun ("vkCmdResetQueryPool" vkcmdresetquerypool
                    funcall-vkcmdresetquerypool)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32))

(more-cffi:defcfun ("vkCmdWriteTimestamp" vkcmdwritetimestamp
                    funcall-vkcmdwritetimestamp)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinestage vkpipelinestageflagbits)
  (querypool vkquerypool)
  (query :uint32))

(more-cffi:defcfun ("vkCmdCopyQueryPoolResults" vkcmdcopyquerypoolresults
                    funcall-vkcmdcopyquerypoolresults)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (stride vkdevicesize)
  (flags vkqueryresultflags))

(more-cffi:defcfun ("vkCmdPushConstants" vkcmdpushconstants
                    funcall-vkcmdpushconstants)
    :void
  (commandbuffer vkcommandbuffer)
  (layout vkpipelinelayout)
  (stageflags vkshaderstageflags)
  (offset :uint32)
  (size :uint32)
  (pvalues :pointer))

(more-cffi:defcfun ("vkCmdBeginRenderPass" vkcmdbeginrenderpass
                    funcall-vkcmdbeginrenderpass)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderpassbegin :pointer)
  (contents vksubpasscontents))

(more-cffi:defcfun ("vkCmdNextSubpass" vkcmdnextsubpass
                    funcall-vkcmdnextsubpass)
    :void
  (commandbuffer vkcommandbuffer)
  (contents vksubpasscontents))

(more-cffi:defcfun ("vkCmdEndRenderPass" vkcmdendrenderpass
                    funcall-vkcmdendrenderpass)
    :void
  (commandbuffer vkcommandbuffer))

(more-cffi:defcfun ("vkCmdExecuteCommands" vkcmdexecutecommands
                    funcall-vkcmdexecutecommands)
    :void
  (commandbuffer vkcommandbuffer)
  (commandbuffercount :uint32)
  (pcommandbuffers :pointer))

(more-cffi:defcfun ("vkEnumerateInstanceVersion" vkenumerateinstanceversion
                    funcall-vkenumerateinstanceversion)
    vkresult
  (papiversion :pointer))

(more-cffi:defcfun ("vkBindBufferMemory2" vkbindbuffermemory2
                    funcall-vkbindbuffermemory2)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos :pointer))

(more-cffi:defcfun ("vkBindImageMemory2" vkbindimagememory2
                    funcall-vkbindimagememory2)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos :pointer))

(more-cffi:defcfun ("vkGetDeviceGroupPeerMemoryFeatures"
                    vkgetdevicegrouppeermemoryfeatures
                    funcall-vkgetdevicegrouppeermemoryfeatures)
    :void
  (device vkdevice)
  (heapindex :uint32)
  (localdeviceindex :uint32)
  (remotedeviceindex :uint32)
  (ppeermemoryfeatures :pointer))

(more-cffi:defcfun ("vkCmdSetDeviceMask" vkcmdsetdevicemask
                    funcall-vkcmdsetdevicemask)
    :void
  (commandbuffer vkcommandbuffer)
  (devicemask :uint32))

(more-cffi:defcfun ("vkCmdDispatchBase" vkcmddispatchbase
                    funcall-vkcmddispatchbase)
    :void
  (commandbuffer vkcommandbuffer)
  (basegroupx :uint32)
  (basegroupy :uint32)
  (basegroupz :uint32)
  (groupcountx :uint32)
  (groupcounty :uint32)
  (groupcountz :uint32))

(more-cffi:defcfun ("vkEnumeratePhysicalDeviceGroups"
                    vkenumeratephysicaldevicegroups
                    funcall-vkenumeratephysicaldevicegroups)
    vkresult
  (instance vkinstance)
  (pphysicaldevicegroupcount :pointer)
  (pphysicaldevicegroupproperties :pointer))

(more-cffi:defcfun ("vkGetImageMemoryRequirements2"
                    vkgetimagememoryrequirements2
                    funcall-vkgetimagememoryrequirements2)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkGetBufferMemoryRequirements2"
                    vkgetbuffermemoryrequirements2
                    funcall-vkgetbuffermemoryrequirements2)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkGetImageSparseMemoryRequirements2"
                    vkgetimagesparsememoryrequirements2
                    funcall-vkgetimagesparsememoryrequirements2)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (psparsememoryrequirementcount :pointer)
  (psparsememoryrequirements :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceFeatures2" vkgetphysicaldevicefeatures2
                    funcall-vkgetphysicaldevicefeatures2)
    :void
  (physicaldevice vkphysicaldevice)
  (pfeatures :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceProperties2"
                    vkgetphysicaldeviceproperties2
                    funcall-vkgetphysicaldeviceproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceFormatProperties2"
                    vkgetphysicaldeviceformatproperties2
                    funcall-vkgetphysicaldeviceformatproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (pformatproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties2"
                    vkgetphysicaldeviceimageformatproperties2
                    funcall-vkgetphysicaldeviceimageformatproperties2)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pimageformatinfo :pointer)
  (pimageformatproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties2"
                    vkgetphysicaldevicequeuefamilyproperties2
                    funcall-vkgetphysicaldevicequeuefamilyproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pqueuefamilypropertycount :pointer)
  (pqueuefamilyproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties2"
                    vkgetphysicaldevicememoryproperties2
                    funcall-vkgetphysicaldevicememoryproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pmemoryproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties2"
                    vkgetphysicaldevicesparseimageformatproperties2
                    funcall-vkgetphysicaldevicesparseimageformatproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pformatinfo :pointer)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkTrimCommandPool" vktrimcommandpool
                    funcall-vktrimcommandpool)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (flags vkcommandpooltrimflags))

(more-cffi:defcfun ("vkGetDeviceQueue2" vkgetdevicequeue2
                    funcall-vkgetdevicequeue2)
    :void
  (device vkdevice)
  (pqueueinfo :pointer)
  (pqueue :pointer))

(more-cffi:defcfun ("vkCreateSamplerYcbcrConversion"
                    vkcreatesamplerycbcrconversion
                    funcall-vkcreatesamplerycbcrconversion)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pycbcrconversion :pointer))

(more-cffi:defcfun ("vkDestroySamplerYcbcrConversion"
                    vkdestroysamplerycbcrconversion
                    funcall-vkdestroysamplerycbcrconversion)
    :void
  (device vkdevice)
  (ycbcrconversion vksamplerycbcrconversion)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCreateDescriptorUpdateTemplate"
                    vkcreatedescriptorupdatetemplate
                    funcall-vkcreatedescriptorupdatetemplate)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pdescriptorupdatetemplate :pointer))

(more-cffi:defcfun ("vkDestroyDescriptorUpdateTemplate"
                    vkdestroydescriptorupdatetemplate
                    funcall-vkdestroydescriptorupdatetemplate)
    :void
  (device vkdevice)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pallocator :pointer))

(more-cffi:defcfun ("vkUpdateDescriptorSetWithTemplate"
                    vkupdatedescriptorsetwithtemplate
                    funcall-vkupdatedescriptorsetwithtemplate)
    :void
  (device vkdevice)
  (descriptorset vkdescriptorset)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pdata :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceExternalBufferProperties"
                    vkgetphysicaldeviceexternalbufferproperties
                    funcall-vkgetphysicaldeviceexternalbufferproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalbufferinfo :pointer)
  (pexternalbufferproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceExternalFenceProperties"
                    vkgetphysicaldeviceexternalfenceproperties
                    funcall-vkgetphysicaldeviceexternalfenceproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalfenceinfo :pointer)
  (pexternalfenceproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceExternalSemaphoreProperties"
                    vkgetphysicaldeviceexternalsemaphoreproperties
                    funcall-vkgetphysicaldeviceexternalsemaphoreproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalsemaphoreinfo :pointer)
  (pexternalsemaphoreproperties :pointer))

(more-cffi:defcfun ("vkGetDescriptorSetLayoutSupport"
                    vkgetdescriptorsetlayoutsupport
                    funcall-vkgetdescriptorsetlayoutsupport)
    :void
  (device vkdevice)
  (pcreateinfo :pointer)
  (psupport :pointer))

(more-cffi:defcfun ("vkCmdDrawIndirectCount" vkcmddrawindirectcount
                    funcall-vkcmddrawindirectcount)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkCmdDrawIndexedIndirectCount"
                    vkcmddrawindexedindirectcount
                    funcall-vkcmddrawindexedindirectcount)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkCreateRenderPass2" vkcreaterenderpass2
                    funcall-vkcreaterenderpass2)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (prenderpass :pointer))

(more-cffi:defcfun ("vkCmdBeginRenderPass2" vkcmdbeginrenderpass2
                    funcall-vkcmdbeginrenderpass2)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderpassbegin :pointer)
  (psubpassbegininfo :pointer))

(more-cffi:defcfun ("vkCmdNextSubpass2" vkcmdnextsubpass2
                    funcall-vkcmdnextsubpass2)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassbegininfo :pointer)
  (psubpassendinfo :pointer))

(more-cffi:defcfun ("vkCmdEndRenderPass2" vkcmdendrenderpass2
                    funcall-vkcmdendrenderpass2)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassendinfo :pointer))

(more-cffi:defcfun ("vkResetQueryPool" vkresetquerypool
                    funcall-vkresetquerypool)
    :void
  (device vkdevice)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32))

(more-cffi:defcfun ("vkGetSemaphoreCounterValue" vkgetsemaphorecountervalue
                    funcall-vkgetsemaphorecountervalue)
    vkresult
  (device vkdevice)
  (semaphore vksemaphore)
  (pvalue :pointer))

(more-cffi:defcfun ("vkWaitSemaphores" vkwaitsemaphores
                    funcall-vkwaitsemaphores)
    vkresult
  (device vkdevice)
  (pwaitinfo :pointer)
  (timeout :uint64))

(more-cffi:defcfun ("vkSignalSemaphore" vksignalsemaphore
                    funcall-vksignalsemaphore)
    vkresult
  (device vkdevice)
  (psignalinfo :pointer))

(more-cffi:defcfun ("vkGetBufferDeviceAddress" vkgetbufferdeviceaddress
                    funcall-vkgetbufferdeviceaddress)
    vkdeviceaddress
  (device vkdevice)
  (pinfo :pointer))

(more-cffi:defcfun ("vkGetBufferOpaqueCaptureAddress"
                    vkgetbufferopaquecaptureaddress
                    funcall-vkgetbufferopaquecaptureaddress)
    :uint64
  (device vkdevice)
  (pinfo :pointer))

(more-cffi:defcfun ("vkGetDeviceMemoryOpaqueCaptureAddress"
                    vkgetdevicememoryopaquecaptureaddress
                    funcall-vkgetdevicememoryopaquecaptureaddress)
    :uint64
  (device vkdevice)
  (pinfo :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceToolProperties"
                    vkgetphysicaldevicetoolproperties
                    funcall-vkgetphysicaldevicetoolproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ptoolcount :pointer)
  (ptoolproperties :pointer))

(more-cffi:defcfun ("vkCreatePrivateDataSlot" vkcreateprivatedataslot
                    funcall-vkcreateprivatedataslot)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pprivatedataslot :pointer))

(more-cffi:defcfun ("vkDestroyPrivateDataSlot" vkdestroyprivatedataslot
                    funcall-vkdestroyprivatedataslot)
    :void
  (device vkdevice)
  (privatedataslot vkprivatedataslot)
  (pallocator :pointer))

(more-cffi:defcfun ("vkSetPrivateData" vksetprivatedata
                    funcall-vksetprivatedata)
    vkresult
  (device vkdevice)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (privatedataslot vkprivatedataslot)
  (data :uint64))

(more-cffi:defcfun ("vkGetPrivateData" vkgetprivatedata
                    funcall-vkgetprivatedata)
    :void
  (device vkdevice)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (privatedataslot vkprivatedataslot)
  (pdata :pointer))

(more-cffi:defcfun ("vkCmdSetEvent2" vkcmdsetevent2 funcall-vkcmdsetevent2)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (pdependencyinfo :pointer))

(more-cffi:defcfun ("vkCmdResetEvent2" vkcmdresetevent2
                    funcall-vkcmdresetevent2)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (stagemask vkpipelinestageflags2))

(more-cffi:defcfun ("vkCmdWaitEvents2" vkcmdwaitevents2
                    funcall-vkcmdwaitevents2)
    :void
  (commandbuffer vkcommandbuffer)
  (eventcount :uint32)
  (pevents :pointer)
  (pdependencyinfos :pointer))

(more-cffi:defcfun ("vkCmdPipelineBarrier2" vkcmdpipelinebarrier2
                    funcall-vkcmdpipelinebarrier2)
    :void
  (commandbuffer vkcommandbuffer)
  (pdependencyinfo :pointer))

(more-cffi:defcfun ("vkCmdWriteTimestamp2" vkcmdwritetimestamp2
                    funcall-vkcmdwritetimestamp2)
    :void
  (commandbuffer vkcommandbuffer)
  (stage vkpipelinestageflags2)
  (querypool vkquerypool)
  (query :uint32))

(more-cffi:defcfun ("vkQueueSubmit2" vkqueuesubmit2 funcall-vkqueuesubmit2)
    vkresult
  (queue vkqueue)
  (submitcount :uint32)
  (psubmits :pointer)
  (fence vkfence))

(more-cffi:defcfun ("vkCmdCopyBuffer2" vkcmdcopybuffer2
                    funcall-vkcmdcopybuffer2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybufferinfo :pointer))

(more-cffi:defcfun ("vkCmdCopyImage2" vkcmdcopyimage2 funcall-vkcmdcopyimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimageinfo :pointer))

(more-cffi:defcfun ("vkCmdCopyBufferToImage2" vkcmdcopybuffertoimage2
                    funcall-vkcmdcopybuffertoimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybuffertoimageinfo :pointer))

(more-cffi:defcfun ("vkCmdCopyImageToBuffer2" vkcmdcopyimagetobuffer2
                    funcall-vkcmdcopyimagetobuffer2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimagetobufferinfo :pointer))

(more-cffi:defcfun ("vkCmdBlitImage2" vkcmdblitimage2 funcall-vkcmdblitimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (pblitimageinfo :pointer))

(more-cffi:defcfun ("vkCmdResolveImage2" vkcmdresolveimage2
                    funcall-vkcmdresolveimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (presolveimageinfo :pointer))

(more-cffi:defcfun ("vkCmdBeginRendering" vkcmdbeginrendering
                    funcall-vkcmdbeginrendering)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderinginfo :pointer))

(more-cffi:defcfun ("vkCmdEndRendering" vkcmdendrendering
                    funcall-vkcmdendrendering)
    :void
  (commandbuffer vkcommandbuffer))

(more-cffi:defcfun ("vkCmdSetCullMode" vkcmdsetcullmode
                    funcall-vkcmdsetcullmode)
    :void
  (commandbuffer vkcommandbuffer)
  (cullmode vkcullmodeflags))

(more-cffi:defcfun ("vkCmdSetFrontFace" vkcmdsetfrontface
                    funcall-vkcmdsetfrontface)
    :void
  (commandbuffer vkcommandbuffer)
  (frontface vkfrontface))

(more-cffi:defcfun ("vkCmdSetPrimitiveTopology" vkcmdsetprimitivetopology
                    funcall-vkcmdsetprimitivetopology)
    :void
  (commandbuffer vkcommandbuffer)
  (primitivetopology vkprimitivetopology))

(more-cffi:defcfun ("vkCmdSetViewportWithCount" vkcmdsetviewportwithcount
                    funcall-vkcmdsetviewportwithcount)
    :void
  (commandbuffer vkcommandbuffer)
  (viewportcount :uint32)
  (pviewports :pointer))

(more-cffi:defcfun ("vkCmdSetScissorWithCount" vkcmdsetscissorwithcount
                    funcall-vkcmdsetscissorwithcount)
    :void
  (commandbuffer vkcommandbuffer)
  (scissorcount :uint32)
  (pscissors :pointer))

(more-cffi:defcfun ("vkCmdBindVertexBuffers2" vkcmdbindvertexbuffers2
                    funcall-vkcmdbindvertexbuffers2)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers :pointer)
  (poffsets :pointer)
  (psizes :pointer)
  (pstrides :pointer))

(more-cffi:defcfun ("vkCmdSetDepthTestEnable" vkcmdsetdepthtestenable
                    funcall-vkcmdsetdepthtestenable)
    :void
  (commandbuffer vkcommandbuffer)
  (depthtestenable vkbool32))

(more-cffi:defcfun ("vkCmdSetDepthWriteEnable" vkcmdsetdepthwriteenable
                    funcall-vkcmdsetdepthwriteenable)
    :void
  (commandbuffer vkcommandbuffer)
  (depthwriteenable vkbool32))

(more-cffi:defcfun ("vkCmdSetDepthCompareOp" vkcmdsetdepthcompareop
                    funcall-vkcmdsetdepthcompareop)
    :void
  (commandbuffer vkcommandbuffer)
  (depthcompareop vkcompareop))

(more-cffi:defcfun ("vkCmdSetDepthBoundsTestEnable"
                    vkcmdsetdepthboundstestenable
                    funcall-vkcmdsetdepthboundstestenable)
    :void
  (commandbuffer vkcommandbuffer)
  (depthboundstestenable vkbool32))

(more-cffi:defcfun ("vkCmdSetStencilTestEnable" vkcmdsetstenciltestenable
                    funcall-vkcmdsetstenciltestenable)
    :void
  (commandbuffer vkcommandbuffer)
  (stenciltestenable vkbool32))

(more-cffi:defcfun ("vkCmdSetStencilOp" vkcmdsetstencilop
                    funcall-vkcmdsetstencilop)
    :void
  (commandbuffer vkcommandbuffer)
  (facemask vkstencilfaceflags)
  (failop vkstencilop)
  (passop vkstencilop)
  (depthfailop vkstencilop)
  (compareop vkcompareop))

(more-cffi:defcfun ("vkCmdSetRasterizerDiscardEnable"
                    vkcmdsetrasterizerdiscardenable
                    funcall-vkcmdsetrasterizerdiscardenable)
    :void
  (commandbuffer vkcommandbuffer)
  (rasterizerdiscardenable vkbool32))

(more-cffi:defcfun ("vkCmdSetDepthBiasEnable" vkcmdsetdepthbiasenable
                    funcall-vkcmdsetdepthbiasenable)
    :void
  (commandbuffer vkcommandbuffer)
  (depthbiasenable vkbool32))

(more-cffi:defcfun ("vkCmdSetPrimitiveRestartEnable"
                    vkcmdsetprimitiverestartenable
                    funcall-vkcmdsetprimitiverestartenable)
    :void
  (commandbuffer vkcommandbuffer)
  (primitiverestartenable vkbool32))

(more-cffi:defcfun ("vkGetDeviceBufferMemoryRequirements"
                    vkgetdevicebuffermemoryrequirements
                    funcall-vkgetdevicebuffermemoryrequirements)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkGetDeviceImageMemoryRequirements"
                    vkgetdeviceimagememoryrequirements
                    funcall-vkgetdeviceimagememoryrequirements)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkGetDeviceImageSparseMemoryRequirements"
                    vkgetdeviceimagesparsememoryrequirements
                    funcall-vkgetdeviceimagesparsememoryrequirements)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (psparsememoryrequirementcount :pointer)
  (psparsememoryrequirements :pointer))

(more-cffi:defcfun ("vkDestroySurfaceKHR" vkdestroysurfacekhr
                    funcall-vkdestroysurfacekhr)
    :void
  (instance vkinstance)
  (surface vksurfacekhr)
  (pallocator :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceSurfaceSupportKHR"
                    vkgetphysicaldevicesurfacesupportkhr
                    funcall-vkgetphysicaldevicesurfacesupportkhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (queuefamilyindex :uint32)
  (surface vksurfacekhr)
  (psupported :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilitiesKHR"
                    vkgetphysicaldevicesurfacecapabilitieskhr
                    funcall-vkgetphysicaldevicesurfacecapabilitieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (psurfacecapabilities :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceSurfaceFormatsKHR"
                    vkgetphysicaldevicesurfaceformatskhr
                    funcall-vkgetphysicaldevicesurfaceformatskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (psurfaceformatcount :pointer)
  (psurfaceformats :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceSurfacePresentModesKHR"
                    vkgetphysicaldevicesurfacepresentmodeskhr
                    funcall-vkgetphysicaldevicesurfacepresentmodeskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (ppresentmodecount :pointer)
  (ppresentmodes :pointer))

(more-cffi:defcfun ("vkCreateSwapchainKHR" vkcreateswapchainkhr
                    funcall-vkcreateswapchainkhr)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pswapchain :pointer))

(more-cffi:defcfun ("vkDestroySwapchainKHR" vkdestroyswapchainkhr
                    funcall-vkdestroyswapchainkhr)
    :void
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (pallocator :pointer))

(more-cffi:defcfun ("vkGetSwapchainImagesKHR" vkgetswapchainimageskhr
                    funcall-vkgetswapchainimageskhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (pswapchainimagecount :pointer)
  (pswapchainimages :pointer))

(more-cffi:defcfun ("vkAcquireNextImageKHR" vkacquirenextimagekhr
                    funcall-vkacquirenextimagekhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (timeout :uint64)
  (semaphore vksemaphore)
  (fence vkfence)
  (pimageindex :pointer))

(more-cffi:defcfun ("vkQueuePresentKHR" vkqueuepresentkhr
                    funcall-vkqueuepresentkhr)
    vkresult
  (queue vkqueue)
  (ppresentinfo :pointer))

(more-cffi:defcfun ("vkGetDeviceGroupPresentCapabilitiesKHR"
                    vkgetdevicegrouppresentcapabilitieskhr
                    funcall-vkgetdevicegrouppresentcapabilitieskhr)
    vkresult
  (device vkdevice)
  (pdevicegrouppresentcapabilities :pointer))

(more-cffi:defcfun ("vkGetDeviceGroupSurfacePresentModesKHR"
                    vkgetdevicegroupsurfacepresentmodeskhr
                    funcall-vkgetdevicegroupsurfacepresentmodeskhr)
    vkresult
  (device vkdevice)
  (surface vksurfacekhr)
  (pmodes :pointer))

(more-cffi:defcfun ("vkGetPhysicalDevicePresentRectanglesKHR"
                    vkgetphysicaldevicepresentrectangleskhr
                    funcall-vkgetphysicaldevicepresentrectangleskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (prectcount :pointer)
  (prects :pointer))

(more-cffi:defcfun ("vkAcquireNextImage2KHR" vkacquirenextimage2khr
                    funcall-vkacquirenextimage2khr)
    vkresult
  (device vkdevice)
  (pacquireinfo :pointer)
  (pimageindex :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceDisplayPropertiesKHR"
                    vkgetphysicaldevicedisplaypropertieskhr
                    funcall-vkgetphysicaldevicedisplaypropertieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceDisplayPlanePropertiesKHR"
                    vkgetphysicaldevicedisplayplanepropertieskhr
                    funcall-vkgetphysicaldevicedisplayplanepropertieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetDisplayPlaneSupportedDisplaysKHR"
                    vkgetdisplayplanesupporteddisplayskhr
                    funcall-vkgetdisplayplanesupporteddisplayskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (planeindex :uint32)
  (pdisplaycount :pointer)
  (pdisplays :pointer))

(more-cffi:defcfun ("vkGetDisplayModePropertiesKHR"
                    vkgetdisplaymodepropertieskhr
                    funcall-vkgetdisplaymodepropertieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkCreateDisplayModeKHR" vkcreatedisplaymodekhr
                    funcall-vkcreatedisplaymodekhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pmode :pointer))

(more-cffi:defcfun ("vkGetDisplayPlaneCapabilitiesKHR"
                    vkgetdisplayplanecapabilitieskhr
                    funcall-vkgetdisplayplanecapabilitieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (mode vkdisplaymodekhr)
  (planeindex :uint32)
  (pcapabilities :pointer))

(more-cffi:defcfun ("vkCreateDisplayPlaneSurfaceKHR"
                    vkcreatedisplayplanesurfacekhr
                    funcall-vkcreatedisplayplanesurfacekhr)
    vkresult
  (instance vkinstance)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (psurface :pointer))

(more-cffi:defcfun ("vkCreateSharedSwapchainsKHR" vkcreatesharedswapchainskhr
                    funcall-vkcreatesharedswapchainskhr)
    vkresult
  (device vkdevice)
  (swapchaincount :uint32)
  (pcreateinfos :pointer)
  (pallocator :pointer)
  (pswapchains :pointer))

(more-cffi:defcfun ("vkCmdBeginRenderingKHR" vkcmdbeginrenderingkhr
                    funcall-vkcmdbeginrenderingkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderinginfo :pointer))

(more-cffi:defcfun ("vkCmdEndRenderingKHR" vkcmdendrenderingkhr
                    funcall-vkcmdendrenderingkhr)
    :void
  (commandbuffer vkcommandbuffer))

(more-cffi:defcfun ("vkGetPhysicalDeviceFeatures2KHR"
                    vkgetphysicaldevicefeatures2khr
                    funcall-vkgetphysicaldevicefeatures2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pfeatures :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceProperties2KHR"
                    vkgetphysicaldeviceproperties2khr
                    funcall-vkgetphysicaldeviceproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceFormatProperties2KHR"
                    vkgetphysicaldeviceformatproperties2khr
                    funcall-vkgetphysicaldeviceformatproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (pformatproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties2KHR"
                    vkgetphysicaldeviceimageformatproperties2khr
                    funcall-vkgetphysicaldeviceimageformatproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pimageformatinfo :pointer)
  (pimageformatproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties2KHR"
                    vkgetphysicaldevicequeuefamilyproperties2khr
                    funcall-vkgetphysicaldevicequeuefamilyproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pqueuefamilypropertycount :pointer)
  (pqueuefamilyproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties2KHR"
                    vkgetphysicaldevicememoryproperties2khr
                    funcall-vkgetphysicaldevicememoryproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pmemoryproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties2KHR"
                    vkgetphysicaldevicesparseimageformatproperties2khr
                    funcall-vkgetphysicaldevicesparseimageformatproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pformatinfo :pointer)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetDeviceGroupPeerMemoryFeaturesKHR"
                    vkgetdevicegrouppeermemoryfeatureskhr
                    funcall-vkgetdevicegrouppeermemoryfeatureskhr)
    :void
  (device vkdevice)
  (heapindex :uint32)
  (localdeviceindex :uint32)
  (remotedeviceindex :uint32)
  (ppeermemoryfeatures :pointer))

(more-cffi:defcfun ("vkCmdSetDeviceMaskKHR" vkcmdsetdevicemaskkhr
                    funcall-vkcmdsetdevicemaskkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (devicemask :uint32))

(more-cffi:defcfun ("vkCmdDispatchBaseKHR" vkcmddispatchbasekhr
                    funcall-vkcmddispatchbasekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (basegroupx :uint32)
  (basegroupy :uint32)
  (basegroupz :uint32)
  (groupcountx :uint32)
  (groupcounty :uint32)
  (groupcountz :uint32))

(more-cffi:defcfun ("vkTrimCommandPoolKHR" vktrimcommandpoolkhr
                    funcall-vktrimcommandpoolkhr)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (flags vkcommandpooltrimflags))

(more-cffi:defcfun ("vkEnumeratePhysicalDeviceGroupsKHR"
                    vkenumeratephysicaldevicegroupskhr
                    funcall-vkenumeratephysicaldevicegroupskhr)
    vkresult
  (instance vkinstance)
  (pphysicaldevicegroupcount :pointer)
  (pphysicaldevicegroupproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceExternalBufferPropertiesKHR"
                    vkgetphysicaldeviceexternalbufferpropertieskhr
                    funcall-vkgetphysicaldeviceexternalbufferpropertieskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalbufferinfo :pointer)
  (pexternalbufferproperties :pointer))

(more-cffi:defcfun ("vkGetMemoryFdKHR" vkgetmemoryfdkhr
                    funcall-vkgetmemoryfdkhr)
    vkresult
  (device vkdevice)
  (pgetfdinfo :pointer)
  (pfd :pointer))

(more-cffi:defcfun ("vkGetMemoryFdPropertiesKHR" vkgetmemoryfdpropertieskhr
                    funcall-vkgetmemoryfdpropertieskhr)
    vkresult
  (device vkdevice)
  (handletype vkexternalmemoryhandletypeflagbits)
  (fd :int)
  (pmemoryfdproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceExternalSemaphorePropertiesKHR"
                    vkgetphysicaldeviceexternalsemaphorepropertieskhr
                    funcall-vkgetphysicaldeviceexternalsemaphorepropertieskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalsemaphoreinfo :pointer)
  (pexternalsemaphoreproperties :pointer))

(more-cffi:defcfun ("vkImportSemaphoreFdKHR" vkimportsemaphorefdkhr
                    funcall-vkimportsemaphorefdkhr)
    vkresult
  (device vkdevice)
  (pimportsemaphorefdinfo :pointer))

(more-cffi:defcfun ("vkGetSemaphoreFdKHR" vkgetsemaphorefdkhr
                    funcall-vkgetsemaphorefdkhr)
    vkresult
  (device vkdevice)
  (pgetfdinfo :pointer)
  (pfd :pointer))

(more-cffi:defcfun ("vkCmdPushDescriptorSetKHR" vkcmdpushdescriptorsetkhr
                    funcall-vkcmdpushdescriptorsetkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinebindpoint vkpipelinebindpoint)
  (layout vkpipelinelayout)
  (set :uint32)
  (descriptorwritecount :uint32)
  (pdescriptorwrites :pointer))

(more-cffi:defcfun ("vkCmdPushDescriptorSetWithTemplateKHR"
                    vkcmdpushdescriptorsetwithtemplatekhr
                    funcall-vkcmdpushdescriptorsetwithtemplatekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (layout vkpipelinelayout)
  (set :uint32)
  (pdata :pointer))

(more-cffi:defcfun ("vkCreateDescriptorUpdateTemplateKHR"
                    vkcreatedescriptorupdatetemplatekhr
                    funcall-vkcreatedescriptorupdatetemplatekhr)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pdescriptorupdatetemplate :pointer))

(more-cffi:defcfun ("vkDestroyDescriptorUpdateTemplateKHR"
                    vkdestroydescriptorupdatetemplatekhr
                    funcall-vkdestroydescriptorupdatetemplatekhr)
    :void
  (device vkdevice)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pallocator :pointer))

(more-cffi:defcfun ("vkUpdateDescriptorSetWithTemplateKHR"
                    vkupdatedescriptorsetwithtemplatekhr
                    funcall-vkupdatedescriptorsetwithtemplatekhr)
    :void
  (device vkdevice)
  (descriptorset vkdescriptorset)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pdata :pointer))

(more-cffi:defcfun ("vkCreateRenderPass2KHR" vkcreaterenderpass2khr
                    funcall-vkcreaterenderpass2khr)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (prenderpass :pointer))

(more-cffi:defcfun ("vkCmdBeginRenderPass2KHR" vkcmdbeginrenderpass2khr
                    funcall-vkcmdbeginrenderpass2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderpassbegin :pointer)
  (psubpassbegininfo :pointer))

(more-cffi:defcfun ("vkCmdNextSubpass2KHR" vkcmdnextsubpass2khr
                    funcall-vkcmdnextsubpass2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassbegininfo :pointer)
  (psubpassendinfo :pointer))

(more-cffi:defcfun ("vkCmdEndRenderPass2KHR" vkcmdendrenderpass2khr
                    funcall-vkcmdendrenderpass2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassendinfo :pointer))

(more-cffi:defcfun ("vkGetSwapchainStatusKHR" vkgetswapchainstatuskhr
                    funcall-vkgetswapchainstatuskhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr))

(more-cffi:defcfun ("vkGetPhysicalDeviceExternalFencePropertiesKHR"
                    vkgetphysicaldeviceexternalfencepropertieskhr
                    funcall-vkgetphysicaldeviceexternalfencepropertieskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalfenceinfo :pointer)
  (pexternalfenceproperties :pointer))

(more-cffi:defcfun ("vkImportFenceFdKHR" vkimportfencefdkhr
                    funcall-vkimportfencefdkhr)
    vkresult
  (device vkdevice)
  (pimportfencefdinfo :pointer))

(more-cffi:defcfun ("vkGetFenceFdKHR" vkgetfencefdkhr funcall-vkgetfencefdkhr)
    vkresult
  (device vkdevice)
  (pgetfdinfo :pointer)
  (pfd :pointer))

(more-cffi:defcfun ("vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR"
                    vkenumeratephysicaldevicequeuefamilyperformancequerycounterskhr
                    funcall-vkenumeratephysicaldevicequeuefamilyperformancequerycounterskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (queuefamilyindex :uint32)
  (pcountercount :pointer)
  (pcounters :pointer)
  (pcounterdescriptions :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR"
                    vkgetphysicaldevicequeuefamilyperformancequerypasseskhr
                    funcall-vkgetphysicaldevicequeuefamilyperformancequerypasseskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pperformancequerycreateinfo :pointer)
  (pnumpasses :pointer))

(more-cffi:defcfun ("vkAcquireProfilingLockKHR" vkacquireprofilinglockkhr
                    funcall-vkacquireprofilinglockkhr)
    vkresult
  (device vkdevice)
  (pinfo :pointer))

(more-cffi:defcfun ("vkReleaseProfilingLockKHR" vkreleaseprofilinglockkhr
                    funcall-vkreleaseprofilinglockkhr)
    :void
  (device vkdevice))

(more-cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilities2KHR"
                    vkgetphysicaldevicesurfacecapabilities2khr
                    funcall-vkgetphysicaldevicesurfacecapabilities2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (psurfaceinfo :pointer)
  (psurfacecapabilities :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceSurfaceFormats2KHR"
                    vkgetphysicaldevicesurfaceformats2khr
                    funcall-vkgetphysicaldevicesurfaceformats2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (psurfaceinfo :pointer)
  (psurfaceformatcount :pointer)
  (psurfaceformats :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceDisplayProperties2KHR"
                    vkgetphysicaldevicedisplayproperties2khr
                    funcall-vkgetphysicaldevicedisplayproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceDisplayPlaneProperties2KHR"
                    vkgetphysicaldevicedisplayplaneproperties2khr
                    funcall-vkgetphysicaldevicedisplayplaneproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetDisplayModeProperties2KHR"
                    vkgetdisplaymodeproperties2khr
                    funcall-vkgetdisplaymodeproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetDisplayPlaneCapabilities2KHR"
                    vkgetdisplayplanecapabilities2khr
                    funcall-vkgetdisplayplanecapabilities2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pdisplayplaneinfo :pointer)
  (pcapabilities :pointer))

(more-cffi:defcfun ("vkGetImageMemoryRequirements2KHR"
                    vkgetimagememoryrequirements2khr
                    funcall-vkgetimagememoryrequirements2khr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkGetBufferMemoryRequirements2KHR"
                    vkgetbuffermemoryrequirements2khr
                    funcall-vkgetbuffermemoryrequirements2khr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkGetImageSparseMemoryRequirements2KHR"
                    vkgetimagesparsememoryrequirements2khr
                    funcall-vkgetimagesparsememoryrequirements2khr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (psparsememoryrequirementcount :pointer)
  (psparsememoryrequirements :pointer))

(more-cffi:defcfun ("vkCreateSamplerYcbcrConversionKHR"
                    vkcreatesamplerycbcrconversionkhr
                    funcall-vkcreatesamplerycbcrconversionkhr)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pycbcrconversion :pointer))

(more-cffi:defcfun ("vkDestroySamplerYcbcrConversionKHR"
                    vkdestroysamplerycbcrconversionkhr
                    funcall-vkdestroysamplerycbcrconversionkhr)
    :void
  (device vkdevice)
  (ycbcrconversion vksamplerycbcrconversion)
  (pallocator :pointer))

(more-cffi:defcfun ("vkBindBufferMemory2KHR" vkbindbuffermemory2khr
                    funcall-vkbindbuffermemory2khr)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos :pointer))

(more-cffi:defcfun ("vkBindImageMemory2KHR" vkbindimagememory2khr
                    funcall-vkbindimagememory2khr)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos :pointer))

(more-cffi:defcfun ("vkGetDescriptorSetLayoutSupportKHR"
                    vkgetdescriptorsetlayoutsupportkhr
                    funcall-vkgetdescriptorsetlayoutsupportkhr)
    :void
  (device vkdevice)
  (pcreateinfo :pointer)
  (psupport :pointer))

(more-cffi:defcfun ("vkCmdDrawIndirectCountKHR" vkcmddrawindirectcountkhr
                    funcall-vkcmddrawindirectcountkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkCmdDrawIndexedIndirectCountKHR"
                    vkcmddrawindexedindirectcountkhr
                    funcall-vkcmddrawindexedindirectcountkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkGetSemaphoreCounterValueKHR"
                    vkgetsemaphorecountervaluekhr
                    funcall-vkgetsemaphorecountervaluekhr)
    vkresult
  (device vkdevice)
  (semaphore vksemaphore)
  (pvalue :pointer))

(more-cffi:defcfun ("vkWaitSemaphoresKHR" vkwaitsemaphoreskhr
                    funcall-vkwaitsemaphoreskhr)
    vkresult
  (device vkdevice)
  (pwaitinfo :pointer)
  (timeout :uint64))

(more-cffi:defcfun ("vkSignalSemaphoreKHR" vksignalsemaphorekhr
                    funcall-vksignalsemaphorekhr)
    vkresult
  (device vkdevice)
  (psignalinfo :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceFragmentShadingRatesKHR"
                    vkgetphysicaldevicefragmentshadingrateskhr
                    funcall-vkgetphysicaldevicefragmentshadingrateskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pfragmentshadingratecount :pointer)
  (pfragmentshadingrates :pointer))

(more-cffi:defcfun ("vkCmdSetFragmentShadingRateKHR"
                    vkcmdsetfragmentshadingratekhr
                    funcall-vkcmdsetfragmentshadingratekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pfragmentsize :pointer)
  (combinerops vkfragmentshadingratecombineropkhr))

(more-cffi:defcfun ("vkWaitForPresentKHR" vkwaitforpresentkhr
                    funcall-vkwaitforpresentkhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (presentid :uint64)
  (timeout :uint64))

(more-cffi:defcfun ("vkGetBufferDeviceAddressKHR" vkgetbufferdeviceaddresskhr
                    funcall-vkgetbufferdeviceaddresskhr)
    vkdeviceaddress
  (device vkdevice)
  (pinfo :pointer))

(more-cffi:defcfun ("vkGetBufferOpaqueCaptureAddressKHR"
                    vkgetbufferopaquecaptureaddresskhr
                    funcall-vkgetbufferopaquecaptureaddresskhr)
    :uint64
  (device vkdevice)
  (pinfo :pointer))

(more-cffi:defcfun ("vkGetDeviceMemoryOpaqueCaptureAddressKHR"
                    vkgetdevicememoryopaquecaptureaddresskhr
                    funcall-vkgetdevicememoryopaquecaptureaddresskhr)
    :uint64
  (device vkdevice)
  (pinfo :pointer))

(more-cffi:defcfun ("vkCreateDeferredOperationKHR" vkcreatedeferredoperationkhr
                    funcall-vkcreatedeferredoperationkhr)
    vkresult
  (device vkdevice)
  (pallocator :pointer)
  (pdeferredoperation :pointer))

(more-cffi:defcfun ("vkDestroyDeferredOperationKHR"
                    vkdestroydeferredoperationkhr
                    funcall-vkdestroydeferredoperationkhr)
    :void
  (device vkdevice)
  (operation vkdeferredoperationkhr)
  (pallocator :pointer))

(more-cffi:defcfun ("vkGetDeferredOperationMaxConcurrencyKHR"
                    vkgetdeferredoperationmaxconcurrencykhr
                    funcall-vkgetdeferredoperationmaxconcurrencykhr)
    :uint32
  (device vkdevice)
  (operation vkdeferredoperationkhr))

(more-cffi:defcfun ("vkGetDeferredOperationResultKHR"
                    vkgetdeferredoperationresultkhr
                    funcall-vkgetdeferredoperationresultkhr)
    vkresult
  (device vkdevice)
  (operation vkdeferredoperationkhr))

(more-cffi:defcfun ("vkDeferredOperationJoinKHR" vkdeferredoperationjoinkhr
                    funcall-vkdeferredoperationjoinkhr)
    vkresult
  (device vkdevice)
  (operation vkdeferredoperationkhr))

(more-cffi:defcfun ("vkGetPipelineExecutablePropertiesKHR"
                    vkgetpipelineexecutablepropertieskhr
                    funcall-vkgetpipelineexecutablepropertieskhr)
    vkresult
  (device vkdevice)
  (ppipelineinfo :pointer)
  (pexecutablecount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetPipelineExecutableStatisticsKHR"
                    vkgetpipelineexecutablestatisticskhr
                    funcall-vkgetpipelineexecutablestatisticskhr)
    vkresult
  (device vkdevice)
  (pexecutableinfo :pointer)
  (pstatisticcount :pointer)
  (pstatistics :pointer))

(more-cffi:defcfun ("vkGetPipelineExecutableInternalRepresentationsKHR"
                    vkgetpipelineexecutableinternalrepresentationskhr
                    funcall-vkgetpipelineexecutableinternalrepresentationskhr)
    vkresult
  (device vkdevice)
  (pexecutableinfo :pointer)
  (pinternalrepresentationcount :pointer)
  (pinternalrepresentations :pointer))

(more-cffi:defcfun ("vkCmdSetEvent2KHR" vkcmdsetevent2khr
                    funcall-vkcmdsetevent2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (pdependencyinfo :pointer))

(more-cffi:defcfun ("vkCmdResetEvent2KHR" vkcmdresetevent2khr
                    funcall-vkcmdresetevent2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (stagemask vkpipelinestageflags2))

(more-cffi:defcfun ("vkCmdWaitEvents2KHR" vkcmdwaitevents2khr
                    funcall-vkcmdwaitevents2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (eventcount :uint32)
  (pevents :pointer)
  (pdependencyinfos :pointer))

(more-cffi:defcfun ("vkCmdPipelineBarrier2KHR" vkcmdpipelinebarrier2khr
                    funcall-vkcmdpipelinebarrier2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pdependencyinfo :pointer))

(more-cffi:defcfun ("vkCmdWriteTimestamp2KHR" vkcmdwritetimestamp2khr
                    funcall-vkcmdwritetimestamp2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (stage vkpipelinestageflags2)
  (querypool vkquerypool)
  (query :uint32))

(more-cffi:defcfun ("vkQueueSubmit2KHR" vkqueuesubmit2khr
                    funcall-vkqueuesubmit2khr)
    vkresult
  (queue vkqueue)
  (submitcount :uint32)
  (psubmits :pointer)
  (fence vkfence))

(more-cffi:defcfun ("vkCmdWriteBufferMarker2AMD" vkcmdwritebuffermarker2amd
                    funcall-vkcmdwritebuffermarker2amd)
    :void
  (commandbuffer vkcommandbuffer)
  (stage vkpipelinestageflags2)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (marker :uint32))

(more-cffi:defcfun ("vkGetQueueCheckpointData2NV" vkgetqueuecheckpointdata2nv
                    funcall-vkgetqueuecheckpointdata2nv)
    :void
  (queue vkqueue)
  (pcheckpointdatacount :pointer)
  (pcheckpointdata :pointer))

(more-cffi:defcfun ("vkCmdCopyBuffer2KHR" vkcmdcopybuffer2khr
                    funcall-vkcmdcopybuffer2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybufferinfo :pointer))

(more-cffi:defcfun ("vkCmdCopyImage2KHR" vkcmdcopyimage2khr
                    funcall-vkcmdcopyimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimageinfo :pointer))

(more-cffi:defcfun ("vkCmdCopyBufferToImage2KHR" vkcmdcopybuffertoimage2khr
                    funcall-vkcmdcopybuffertoimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybuffertoimageinfo :pointer))

(more-cffi:defcfun ("vkCmdCopyImageToBuffer2KHR" vkcmdcopyimagetobuffer2khr
                    funcall-vkcmdcopyimagetobuffer2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimagetobufferinfo :pointer))

(more-cffi:defcfun ("vkCmdBlitImage2KHR" vkcmdblitimage2khr
                    funcall-vkcmdblitimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pblitimageinfo :pointer))

(more-cffi:defcfun ("vkCmdResolveImage2KHR" vkcmdresolveimage2khr
                    funcall-vkcmdresolveimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (presolveimageinfo :pointer))

(more-cffi:defcfun ("vkCmdTraceRaysIndirect2KHR" vkcmdtraceraysindirect2khr
                    funcall-vkcmdtraceraysindirect2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (indirectdeviceaddress vkdeviceaddress))

(more-cffi:defcfun ("vkGetDeviceBufferMemoryRequirementsKHR"
                    vkgetdevicebuffermemoryrequirementskhr
                    funcall-vkgetdevicebuffermemoryrequirementskhr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkGetDeviceImageMemoryRequirementsKHR"
                    vkgetdeviceimagememoryrequirementskhr
                    funcall-vkgetdeviceimagememoryrequirementskhr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkGetDeviceImageSparseMemoryRequirementsKHR"
                    vkgetdeviceimagesparsememoryrequirementskhr
                    funcall-vkgetdeviceimagesparsememoryrequirementskhr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (psparsememoryrequirementcount :pointer)
  (psparsememoryrequirements :pointer))

(more-cffi:defcfun ("vkCreateDebugReportCallbackEXT"
                    vkcreatedebugreportcallbackext
                    funcall-vkcreatedebugreportcallbackext)
    vkresult
  (instance vkinstance)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pcallback :pointer))

(more-cffi:defcfun ("vkDestroyDebugReportCallbackEXT"
                    vkdestroydebugreportcallbackext
                    funcall-vkdestroydebugreportcallbackext)
    :void
  (instance vkinstance)
  (callback vkdebugreportcallbackext)
  (pallocator :pointer))

(more-cffi:defcfun ("vkDebugReportMessageEXT" vkdebugreportmessageext
                    funcall-vkdebugreportmessageext)
    :void
  (instance vkinstance)
  (flags vkdebugreportflagsext)
  (objecttype vkdebugreportobjecttypeext)
  (object :uint64)
  (location :size)
  (messagecode :int32)
  (playerprefix :pointer)
  (pmessage :pointer))

(more-cffi:defcfun ("vkDebugMarkerSetObjectTagEXT" vkdebugmarkersetobjecttagext
                    funcall-vkdebugmarkersetobjecttagext)
    vkresult
  (device vkdevice)
  (ptaginfo :pointer))

(more-cffi:defcfun ("vkDebugMarkerSetObjectNameEXT"
                    vkdebugmarkersetobjectnameext
                    funcall-vkdebugmarkersetobjectnameext)
    vkresult
  (device vkdevice)
  (pnameinfo :pointer))

(more-cffi:defcfun ("vkCmdDebugMarkerBeginEXT" vkcmddebugmarkerbeginext
                    funcall-vkcmddebugmarkerbeginext)
    :void
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo :pointer))

(more-cffi:defcfun ("vkCmdDebugMarkerEndEXT" vkcmddebugmarkerendext
                    funcall-vkcmddebugmarkerendext)
    :void
  (commandbuffer vkcommandbuffer))

(more-cffi:defcfun ("vkCmdDebugMarkerInsertEXT" vkcmddebugmarkerinsertext
                    funcall-vkcmddebugmarkerinsertext)
    :void
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo :pointer))

(more-cffi:defcfun ("vkCmdBindTransformFeedbackBuffersEXT"
                    vkcmdbindtransformfeedbackbuffersext
                    funcall-vkcmdbindtransformfeedbackbuffersext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers :pointer)
  (poffsets :pointer)
  (psizes :pointer))

(more-cffi:defcfun ("vkCmdBeginTransformFeedbackEXT"
                    vkcmdbegintransformfeedbackext
                    funcall-vkcmdbegintransformfeedbackext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstcounterbuffer :uint32)
  (counterbuffercount :uint32)
  (pcounterbuffers :pointer)
  (pcounterbufferoffsets :pointer))

(more-cffi:defcfun ("vkCmdEndTransformFeedbackEXT" vkcmdendtransformfeedbackext
                    funcall-vkcmdendtransformfeedbackext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstcounterbuffer :uint32)
  (counterbuffercount :uint32)
  (pcounterbuffers :pointer)
  (pcounterbufferoffsets :pointer))

(more-cffi:defcfun ("vkCmdBeginQueryIndexedEXT" vkcmdbeginqueryindexedext
                    funcall-vkcmdbeginqueryindexedext)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (query :uint32)
  (flags vkquerycontrolflags)
  (index :uint32))

(more-cffi:defcfun ("vkCmdEndQueryIndexedEXT" vkcmdendqueryindexedext
                    funcall-vkcmdendqueryindexedext)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (query :uint32)
  (index :uint32))

(more-cffi:defcfun ("vkCmdDrawIndirectByteCountEXT"
                    vkcmddrawindirectbytecountext
                    funcall-vkcmddrawindirectbytecountext)
    :void
  (commandbuffer vkcommandbuffer)
  (instancecount :uint32)
  (firstinstance :uint32)
  (counterbuffer vkbuffer)
  (counterbufferoffset vkdevicesize)
  (counteroffset :uint32)
  (vertexstride :uint32))

(more-cffi:defcfun ("vkCreateCuModuleNVX" vkcreatecumodulenvx
                    funcall-vkcreatecumodulenvx)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pmodule :pointer))

(more-cffi:defcfun ("vkCreateCuFunctionNVX" vkcreatecufunctionnvx
                    funcall-vkcreatecufunctionnvx)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pfunction :pointer))

(more-cffi:defcfun ("vkDestroyCuModuleNVX" vkdestroycumodulenvx
                    funcall-vkdestroycumodulenvx)
    :void
  (device vkdevice)
  (module vkcumodulenvx)
  (pallocator :pointer))

(more-cffi:defcfun ("vkDestroyCuFunctionNVX" vkdestroycufunctionnvx
                    funcall-vkdestroycufunctionnvx)
    :void
  (device vkdevice)
  #'vkcufunctionnvx
  (pallocator :pointer))

(more-cffi:defcfun ("vkCmdCuLaunchKernelNVX" vkcmdculaunchkernelnvx
                    funcall-vkcmdculaunchkernelnvx)
    :void
  (commandbuffer vkcommandbuffer)
  (plaunchinfo :pointer))

(more-cffi:defcfun ("vkGetImageViewHandleNVX" vkgetimageviewhandlenvx
                    funcall-vkgetimageviewhandlenvx)
    :uint32
  (device vkdevice)
  (pinfo :pointer))

(more-cffi:defcfun ("vkGetImageViewAddressNVX" vkgetimageviewaddressnvx
                    funcall-vkgetimageviewaddressnvx)
    vkresult
  (device vkdevice)
  (imageview vkimageview)
  (pproperties :pointer))

(more-cffi:defcfun ("vkCmdDrawIndirectCountAMD" vkcmddrawindirectcountamd
                    funcall-vkcmddrawindirectcountamd)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkCmdDrawIndexedIndirectCountAMD"
                    vkcmddrawindexedindirectcountamd
                    funcall-vkcmddrawindexedindirectcountamd)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkGetShaderInfoAMD" vkgetshaderinfoamd
                    funcall-vkgetshaderinfoamd)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (shaderstage vkshaderstageflagbits)
  (infotype vkshaderinfotypeamd)
  (pinfosize :pointer)
  (pinfo :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceExternalImageFormatPropertiesNV"
                    vkgetphysicaldeviceexternalimageformatpropertiesnv
                    funcall-vkgetphysicaldeviceexternalimageformatpropertiesnv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (type vkimagetype)
  (tiling vkimagetiling)
  (usage vkimageusageflags)
  (flags vkimagecreateflags)
  (externalhandletype vkexternalmemoryhandletypeflagsnv)
  (pexternalimageformatproperties :pointer))

(more-cffi:defcfun ("vkCmdBeginConditionalRenderingEXT"
                    vkcmdbeginconditionalrenderingext
                    funcall-vkcmdbeginconditionalrenderingext)
    :void
  (commandbuffer vkcommandbuffer)
  (pconditionalrenderingbegin :pointer))

(more-cffi:defcfun ("vkCmdEndConditionalRenderingEXT"
                    vkcmdendconditionalrenderingext
                    funcall-vkcmdendconditionalrenderingext)
    :void
  (commandbuffer vkcommandbuffer))

(more-cffi:defcfun ("vkCmdSetViewportWScalingNV" vkcmdsetviewportwscalingnv
                    funcall-vkcmdsetviewportwscalingnv)
    :void
  (commandbuffer vkcommandbuffer)
  (firstviewport :uint32)
  (viewportcount :uint32)
  (pviewportwscalings :pointer))

(more-cffi:defcfun ("vkReleaseDisplayEXT" vkreleasedisplayext
                    funcall-vkreleasedisplayext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr))

(more-cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilities2EXT"
                    vkgetphysicaldevicesurfacecapabilities2ext
                    funcall-vkgetphysicaldevicesurfacecapabilities2ext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (psurfacecapabilities :pointer))

(more-cffi:defcfun ("vkDisplayPowerControlEXT" vkdisplaypowercontrolext
                    funcall-vkdisplaypowercontrolext)
    vkresult
  (device vkdevice)
  (display vkdisplaykhr)
  (pdisplaypowerinfo :pointer))

(more-cffi:defcfun ("vkRegisterDeviceEventEXT" vkregisterdeviceeventext
                    funcall-vkregisterdeviceeventext)
    vkresult
  (device vkdevice)
  (pdeviceeventinfo :pointer)
  (pallocator :pointer)
  (pfence :pointer))

(more-cffi:defcfun ("vkRegisterDisplayEventEXT" vkregisterdisplayeventext
                    funcall-vkregisterdisplayeventext)
    vkresult
  (device vkdevice)
  (display vkdisplaykhr)
  (pdisplayeventinfo :pointer)
  (pallocator :pointer)
  (pfence :pointer))

(more-cffi:defcfun ("vkGetSwapchainCounterEXT" vkgetswapchaincounterext
                    funcall-vkgetswapchaincounterext)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (counter vksurfacecounterflagbitsext)
  (pcountervalue :pointer))

(more-cffi:defcfun ("vkGetRefreshCycleDurationGOOGLE"
                    vkgetrefreshcycledurationgoogle
                    funcall-vkgetrefreshcycledurationgoogle)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (pdisplaytimingproperties :pointer))

(more-cffi:defcfun ("vkGetPastPresentationTimingGOOGLE"
                    vkgetpastpresentationtiminggoogle
                    funcall-vkgetpastpresentationtiminggoogle)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (ppresentationtimingcount :pointer)
  (ppresentationtimings :pointer))

(more-cffi:defcfun ("vkCmdSetDiscardRectangleEXT" vkcmdsetdiscardrectangleext
                    funcall-vkcmdsetdiscardrectangleext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstdiscardrectangle :uint32)
  (discardrectanglecount :uint32)
  (pdiscardrectangles :pointer))

(more-cffi:defcfun ("vkSetHdrMetadataEXT" vksethdrmetadataext
                    funcall-vksethdrmetadataext)
    :void
  (device vkdevice)
  (swapchaincount :uint32)
  (pswapchains :pointer)
  (pmetadata :pointer))

(more-cffi:defcfun ("vkSetDebugUtilsObjectNameEXT" vksetdebugutilsobjectnameext
                    funcall-vksetdebugutilsobjectnameext)
    vkresult
  (device vkdevice)
  (pnameinfo :pointer))

(more-cffi:defcfun ("vkSetDebugUtilsObjectTagEXT" vksetdebugutilsobjecttagext
                    funcall-vksetdebugutilsobjecttagext)
    vkresult
  (device vkdevice)
  (ptaginfo :pointer))

(more-cffi:defcfun ("vkQueueBeginDebugUtilsLabelEXT"
                    vkqueuebegindebugutilslabelext
                    funcall-vkqueuebegindebugutilslabelext)
    :void
  (queue vkqueue)
  (plabelinfo :pointer))

(more-cffi:defcfun ("vkQueueEndDebugUtilsLabelEXT" vkqueueenddebugutilslabelext
                    funcall-vkqueueenddebugutilslabelext)
    :void
  (queue vkqueue))

(more-cffi:defcfun ("vkQueueInsertDebugUtilsLabelEXT"
                    vkqueueinsertdebugutilslabelext
                    funcall-vkqueueinsertdebugutilslabelext)
    :void
  (queue vkqueue)
  (plabelinfo :pointer))

(more-cffi:defcfun ("vkCmdBeginDebugUtilsLabelEXT" vkcmdbegindebugutilslabelext
                    funcall-vkcmdbegindebugutilslabelext)
    :void
  (commandbuffer vkcommandbuffer)
  (plabelinfo :pointer))

(more-cffi:defcfun ("vkCmdEndDebugUtilsLabelEXT" vkcmdenddebugutilslabelext
                    funcall-vkcmdenddebugutilslabelext)
    :void
  (commandbuffer vkcommandbuffer))

(more-cffi:defcfun ("vkCmdInsertDebugUtilsLabelEXT"
                    vkcmdinsertdebugutilslabelext
                    funcall-vkcmdinsertdebugutilslabelext)
    :void
  (commandbuffer vkcommandbuffer)
  (plabelinfo :pointer))

(more-cffi:defcfun ("vkCreateDebugUtilsMessengerEXT"
                    vkcreatedebugutilsmessengerext
                    funcall-vkcreatedebugutilsmessengerext)
    vkresult
  (instance vkinstance)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pmessenger :pointer))

(more-cffi:defcfun ("vkDestroyDebugUtilsMessengerEXT"
                    vkdestroydebugutilsmessengerext
                    funcall-vkdestroydebugutilsmessengerext)
    :void
  (instance vkinstance)
  (messenger vkdebugutilsmessengerext)
  (pallocator :pointer))

(more-cffi:defcfun ("vkSubmitDebugUtilsMessageEXT" vksubmitdebugutilsmessageext
                    funcall-vksubmitdebugutilsmessageext)
    :void
  (instance vkinstance)
  (messageseverity vkdebugutilsmessageseverityflagbitsext)
  (messagetypes vkdebugutilsmessagetypeflagsext)
  (pcallbackdata :pointer))

(more-cffi:defcfun ("vkCmdSetSampleLocationsEXT" vkcmdsetsamplelocationsext
                    funcall-vkcmdsetsamplelocationsext)
    :void
  (commandbuffer vkcommandbuffer)
  (psamplelocationsinfo :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceMultisamplePropertiesEXT"
                    vkgetphysicaldevicemultisamplepropertiesext
                    funcall-vkgetphysicaldevicemultisamplepropertiesext)
    :void
  (physicaldevice vkphysicaldevice)
  (samples vksamplecountflagbits)
  (pmultisampleproperties :pointer))

(more-cffi:defcfun ("vkGetImageDrmFormatModifierPropertiesEXT"
                    vkgetimagedrmformatmodifierpropertiesext
                    funcall-vkgetimagedrmformatmodifierpropertiesext)
    vkresult
  (device vkdevice)
  (image vkimage)
  (pproperties :pointer))

(more-cffi:defcfun ("vkCreateValidationCacheEXT" vkcreatevalidationcacheext
                    funcall-vkcreatevalidationcacheext)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pvalidationcache :pointer))

(more-cffi:defcfun ("vkDestroyValidationCacheEXT" vkdestroyvalidationcacheext
                    funcall-vkdestroyvalidationcacheext)
    :void
  (device vkdevice)
  (validationcache vkvalidationcacheext)
  (pallocator :pointer))

(more-cffi:defcfun ("vkMergeValidationCachesEXT" vkmergevalidationcachesext
                    funcall-vkmergevalidationcachesext)
    vkresult
  (device vkdevice)
  (dstcache vkvalidationcacheext)
  (srccachecount :uint32)
  (psrccaches :pointer))

(more-cffi:defcfun ("vkGetValidationCacheDataEXT" vkgetvalidationcachedataext
                    funcall-vkgetvalidationcachedataext)
    vkresult
  (device vkdevice)
  (validationcache vkvalidationcacheext)
  (pdatasize :pointer)
  (pdata :pointer))

(more-cffi:defcfun ("vkCmdBindShadingRateImageNV" vkcmdbindshadingrateimagenv
                    funcall-vkcmdbindshadingrateimagenv)
    :void
  (commandbuffer vkcommandbuffer)
  (imageview vkimageview)
  (imagelayout vkimagelayout))

(more-cffi:defcfun ("vkCmdSetViewportShadingRatePaletteNV"
                    vkcmdsetviewportshadingratepalettenv
                    funcall-vkcmdsetviewportshadingratepalettenv)
    :void
  (commandbuffer vkcommandbuffer)
  (firstviewport :uint32)
  (viewportcount :uint32)
  (pshadingratepalettes :pointer))

(more-cffi:defcfun ("vkCmdSetCoarseSampleOrderNV" vkcmdsetcoarsesampleordernv
                    funcall-vkcmdsetcoarsesampleordernv)
    :void
  (commandbuffer vkcommandbuffer)
  (sampleordertype vkcoarsesampleordertypenv)
  (customsampleordercount :uint32)
  (pcustomsampleorders :pointer))

(more-cffi:defcfun ("vkCreateAccelerationStructureNV"
                    vkcreateaccelerationstructurenv
                    funcall-vkcreateaccelerationstructurenv)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (paccelerationstructure :pointer))

(more-cffi:defcfun ("vkDestroyAccelerationStructureNV"
                    vkdestroyaccelerationstructurenv
                    funcall-vkdestroyaccelerationstructurenv)
    :void
  (device vkdevice)
  (accelerationstructure vkaccelerationstructurenv)
  (pallocator :pointer))

(more-cffi:defcfun ("vkGetAccelerationStructureMemoryRequirementsNV"
                    vkgetaccelerationstructurememoryrequirementsnv
                    funcall-vkgetaccelerationstructurememoryrequirementsnv)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkBindAccelerationStructureMemoryNV"
                    vkbindaccelerationstructurememorynv
                    funcall-vkbindaccelerationstructurememorynv)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos :pointer))

(more-cffi:defcfun ("vkCmdBuildAccelerationStructureNV"
                    vkcmdbuildaccelerationstructurenv
                    funcall-vkcmdbuildaccelerationstructurenv)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo :pointer)
  (instancedata vkbuffer)
  (instanceoffset vkdevicesize)
  (update vkbool32)
  (dst vkaccelerationstructurenv)
  (src vkaccelerationstructurenv)
  (scratch vkbuffer)
  (scratchoffset vkdevicesize))

(more-cffi:defcfun ("vkCmdCopyAccelerationStructureNV"
                    vkcmdcopyaccelerationstructurenv
                    funcall-vkcmdcopyaccelerationstructurenv)
    :void
  (commandbuffer vkcommandbuffer)
  (dst vkaccelerationstructurenv)
  (src vkaccelerationstructurenv)
  (mode vkcopyaccelerationstructuremodekhr))

(more-cffi:defcfun ("vkCmdTraceRaysNV" vkcmdtraceraysnv
                    funcall-vkcmdtraceraysnv)
    :void
  (commandbuffer vkcommandbuffer)
  (raygenshaderbindingtablebuffer vkbuffer)
  (raygenshaderbindingoffset vkdevicesize)
  (missshaderbindingtablebuffer vkbuffer)
  (missshaderbindingoffset vkdevicesize)
  (missshaderbindingstride vkdevicesize)
  (hitshaderbindingtablebuffer vkbuffer)
  (hitshaderbindingoffset vkdevicesize)
  (hitshaderbindingstride vkdevicesize)
  (callableshaderbindingtablebuffer vkbuffer)
  (callableshaderbindingoffset vkdevicesize)
  (callableshaderbindingstride vkdevicesize)
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(more-cffi:defcfun ("vkCreateRayTracingPipelinesNV"
                    vkcreateraytracingpipelinesnv
                    funcall-vkcreateraytracingpipelinesnv)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos :pointer)
  (pallocator :pointer)
  (ppipelines :pointer))

(more-cffi:defcfun ("vkGetRayTracingShaderGroupHandlesKHR"
                    vkgetraytracingshadergrouphandleskhr
                    funcall-vkgetraytracingshadergrouphandleskhr)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (firstgroup :uint32)
  (groupcount :uint32)
  (datasize :size)
  (pdata :pointer))

(more-cffi:defcfun ("vkGetRayTracingShaderGroupHandlesNV"
                    vkgetraytracingshadergrouphandlesnv
                    funcall-vkgetraytracingshadergrouphandlesnv)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (firstgroup :uint32)
  (groupcount :uint32)
  (datasize :size)
  (pdata :pointer))

(more-cffi:defcfun ("vkGetAccelerationStructureHandleNV"
                    vkgetaccelerationstructurehandlenv
                    funcall-vkgetaccelerationstructurehandlenv)
    vkresult
  (device vkdevice)
  (accelerationstructure vkaccelerationstructurenv)
  (datasize :size)
  (pdata :pointer))

(more-cffi:defcfun ("vkCmdWriteAccelerationStructuresPropertiesNV"
                    vkcmdwriteaccelerationstructurespropertiesnv
                    funcall-vkcmdwriteaccelerationstructurespropertiesnv)
    :void
  (commandbuffer vkcommandbuffer)
  (accelerationstructurecount :uint32)
  (paccelerationstructures :pointer)
  (querytype vkquerytype)
  (querypool vkquerypool)
  (firstquery :uint32))

(more-cffi:defcfun ("vkCompileDeferredNV" vkcompiledeferrednv
                    funcall-vkcompiledeferrednv)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (shader :uint32))

(more-cffi:defcfun ("vkGetMemoryHostPointerPropertiesEXT"
                    vkgetmemoryhostpointerpropertiesext
                    funcall-vkgetmemoryhostpointerpropertiesext)
    vkresult
  (device vkdevice)
  (handletype vkexternalmemoryhandletypeflagbits)
  (phostpointer :pointer)
  (pmemoryhostpointerproperties :pointer))

(more-cffi:defcfun ("vkCmdWriteBufferMarkerAMD" vkcmdwritebuffermarkeramd
                    funcall-vkcmdwritebuffermarkeramd)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinestage vkpipelinestageflagbits)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (marker :uint32))

(more-cffi:defcfun ("vkGetPhysicalDeviceCalibrateableTimeDomainsEXT"
                    vkgetphysicaldevicecalibrateabletimedomainsext
                    funcall-vkgetphysicaldevicecalibrateabletimedomainsext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ptimedomaincount :pointer)
  (ptimedomains :pointer))

(more-cffi:defcfun ("vkGetCalibratedTimestampsEXT" vkgetcalibratedtimestampsext
                    funcall-vkgetcalibratedtimestampsext)
    vkresult
  (device vkdevice)
  (timestampcount :uint32)
  (ptimestampinfos :pointer)
  (ptimestamps :pointer)
  (pmaxdeviation :pointer))

(more-cffi:defcfun ("vkCmdDrawMeshTasksNV" vkcmddrawmeshtasksnv
                    funcall-vkcmddrawmeshtasksnv)
    :void
  (commandbuffer vkcommandbuffer)
  (taskcount :uint32)
  (firsttask :uint32))

(more-cffi:defcfun ("vkCmdDrawMeshTasksIndirectNV" vkcmddrawmeshtasksindirectnv
                    funcall-vkcmddrawmeshtasksindirectnv)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (drawcount :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkCmdDrawMeshTasksIndirectCountNV"
                    vkcmddrawmeshtasksindirectcountnv
                    funcall-vkcmddrawmeshtasksindirectcountnv)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkCmdSetExclusiveScissorNV" vkcmdsetexclusivescissornv
                    funcall-vkcmdsetexclusivescissornv)
    :void
  (commandbuffer vkcommandbuffer)
  (firstexclusivescissor :uint32)
  (exclusivescissorcount :uint32)
  (pexclusivescissors :pointer))

(more-cffi:defcfun ("vkCmdSetCheckpointNV" vkcmdsetcheckpointnv
                    funcall-vkcmdsetcheckpointnv)
    :void
  (commandbuffer vkcommandbuffer)
  (pcheckpointmarker :pointer))

(more-cffi:defcfun ("vkGetQueueCheckpointDataNV" vkgetqueuecheckpointdatanv
                    funcall-vkgetqueuecheckpointdatanv)
    :void
  (queue vkqueue)
  (pcheckpointdatacount :pointer)
  (pcheckpointdata :pointer))

(more-cffi:defcfun ("vkInitializePerformanceApiINTEL"
                    vkinitializeperformanceapiintel
                    funcall-vkinitializeperformanceapiintel)
    vkresult
  (device vkdevice)
  (pinitializeinfo :pointer))

(more-cffi:defcfun ("vkUninitializePerformanceApiINTEL"
                    vkuninitializeperformanceapiintel
                    funcall-vkuninitializeperformanceapiintel)
    :void
  (device vkdevice))

(more-cffi:defcfun ("vkCmdSetPerformanceMarkerINTEL"
                    vkcmdsetperformancemarkerintel
                    funcall-vkcmdsetperformancemarkerintel)
    vkresult
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo :pointer))

(more-cffi:defcfun ("vkCmdSetPerformanceStreamMarkerINTEL"
                    vkcmdsetperformancestreammarkerintel
                    funcall-vkcmdsetperformancestreammarkerintel)
    vkresult
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo :pointer))

(more-cffi:defcfun ("vkCmdSetPerformanceOverrideINTEL"
                    vkcmdsetperformanceoverrideintel
                    funcall-vkcmdsetperformanceoverrideintel)
    vkresult
  (commandbuffer vkcommandbuffer)
  (poverrideinfo :pointer))

(more-cffi:defcfun ("vkAcquirePerformanceConfigurationINTEL"
                    vkacquireperformanceconfigurationintel
                    funcall-vkacquireperformanceconfigurationintel)
    vkresult
  (device vkdevice)
  (pacquireinfo :pointer)
  (pconfiguration :pointer))

(more-cffi:defcfun ("vkReleasePerformanceConfigurationINTEL"
                    vkreleaseperformanceconfigurationintel
                    funcall-vkreleaseperformanceconfigurationintel)
    vkresult
  (device vkdevice)
  (configuration vkperformanceconfigurationintel))

(more-cffi:defcfun ("vkQueueSetPerformanceConfigurationINTEL"
                    vkqueuesetperformanceconfigurationintel
                    funcall-vkqueuesetperformanceconfigurationintel)
    vkresult
  (queue vkqueue)
  (configuration vkperformanceconfigurationintel))

(more-cffi:defcfun ("vkGetPerformanceParameterINTEL"
                    vkgetperformanceparameterintel
                    funcall-vkgetperformanceparameterintel)
    vkresult
  (device vkdevice)
  (parameter vkperformanceparametertypeintel)
  (pvalue :pointer))

(more-cffi:defcfun ("vkSetLocalDimmingAMD" vksetlocaldimmingamd
                    funcall-vksetlocaldimmingamd)
    :void
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (localdimmingenable vkbool32))

(more-cffi:defcfun ("vkGetBufferDeviceAddressEXT" vkgetbufferdeviceaddressext
                    funcall-vkgetbufferdeviceaddressext)
    vkdeviceaddress
  (device vkdevice)
  (pinfo :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceToolPropertiesEXT"
                    vkgetphysicaldevicetoolpropertiesext
                    funcall-vkgetphysicaldevicetoolpropertiesext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ptoolcount :pointer)
  (ptoolproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV"
                    vkgetphysicaldevicecooperativematrixpropertiesnv
                    funcall-vkgetphysicaldevicecooperativematrixpropertiesnv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(more-cffi:defcfun ("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV"
                    vkgetphysicaldevicesupportedframebuffermixedsamplescombinationsnv
                    funcall-vkgetphysicaldevicesupportedframebuffermixedsamplescombinationsnv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pcombinationcount :pointer)
  (pcombinations :pointer))

(more-cffi:defcfun ("vkCreateHeadlessSurfaceEXT" vkcreateheadlesssurfaceext
                    funcall-vkcreateheadlesssurfaceext)
    vkresult
  (instance vkinstance)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (psurface :pointer))

(more-cffi:defcfun ("vkCmdSetLineStippleEXT" vkcmdsetlinestippleext
                    funcall-vkcmdsetlinestippleext)
    :void
  (commandbuffer vkcommandbuffer)
  (linestipplefactor :uint32)
  (linestipplepattern :uint16))

(more-cffi:defcfun ("vkResetQueryPoolEXT" vkresetquerypoolext
                    funcall-vkresetquerypoolext)
    :void
  (device vkdevice)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32))

(more-cffi:defcfun ("vkCmdSetCullModeEXT" vkcmdsetcullmodeext
                    funcall-vkcmdsetcullmodeext)
    :void
  (commandbuffer vkcommandbuffer)
  (cullmode vkcullmodeflags))

(more-cffi:defcfun ("vkCmdSetFrontFaceEXT" vkcmdsetfrontfaceext
                    funcall-vkcmdsetfrontfaceext)
    :void
  (commandbuffer vkcommandbuffer)
  (frontface vkfrontface))

(more-cffi:defcfun ("vkCmdSetPrimitiveTopologyEXT" vkcmdsetprimitivetopologyext
                    funcall-vkcmdsetprimitivetopologyext)
    :void
  (commandbuffer vkcommandbuffer)
  (primitivetopology vkprimitivetopology))

(more-cffi:defcfun ("vkCmdSetViewportWithCountEXT" vkcmdsetviewportwithcountext
                    funcall-vkcmdsetviewportwithcountext)
    :void
  (commandbuffer vkcommandbuffer)
  (viewportcount :uint32)
  (pviewports :pointer))

(more-cffi:defcfun ("vkCmdSetScissorWithCountEXT" vkcmdsetscissorwithcountext
                    funcall-vkcmdsetscissorwithcountext)
    :void
  (commandbuffer vkcommandbuffer)
  (scissorcount :uint32)
  (pscissors :pointer))

(more-cffi:defcfun ("vkCmdBindVertexBuffers2EXT" vkcmdbindvertexbuffers2ext
                    funcall-vkcmdbindvertexbuffers2ext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers :pointer)
  (poffsets :pointer)
  (psizes :pointer)
  (pstrides :pointer))

(more-cffi:defcfun ("vkCmdSetDepthTestEnableEXT" vkcmdsetdepthtestenableext
                    funcall-vkcmdsetdepthtestenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (depthtestenable vkbool32))

(more-cffi:defcfun ("vkCmdSetDepthWriteEnableEXT" vkcmdsetdepthwriteenableext
                    funcall-vkcmdsetdepthwriteenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (depthwriteenable vkbool32))

(more-cffi:defcfun ("vkCmdSetDepthCompareOpEXT" vkcmdsetdepthcompareopext
                    funcall-vkcmdsetdepthcompareopext)
    :void
  (commandbuffer vkcommandbuffer)
  (depthcompareop vkcompareop))

(more-cffi:defcfun ("vkCmdSetDepthBoundsTestEnableEXT"
                    vkcmdsetdepthboundstestenableext
                    funcall-vkcmdsetdepthboundstestenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (depthboundstestenable vkbool32))

(more-cffi:defcfun ("vkCmdSetStencilTestEnableEXT" vkcmdsetstenciltestenableext
                    funcall-vkcmdsetstenciltestenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (stenciltestenable vkbool32))

(more-cffi:defcfun ("vkCmdSetStencilOpEXT" vkcmdsetstencilopext
                    funcall-vkcmdsetstencilopext)
    :void
  (commandbuffer vkcommandbuffer)
  (facemask vkstencilfaceflags)
  (failop vkstencilop)
  (passop vkstencilop)
  (depthfailop vkstencilop)
  (compareop vkcompareop))

(more-cffi:defcfun ("vkGetGeneratedCommandsMemoryRequirementsNV"
                    vkgetgeneratedcommandsmemoryrequirementsnv
                    funcall-vkgetgeneratedcommandsmemoryrequirementsnv)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(more-cffi:defcfun ("vkCmdPreprocessGeneratedCommandsNV"
                    vkcmdpreprocessgeneratedcommandsnv
                    funcall-vkcmdpreprocessgeneratedcommandsnv)
    :void
  (commandbuffer vkcommandbuffer)
  (pgeneratedcommandsinfo :pointer))

(more-cffi:defcfun ("vkCmdExecuteGeneratedCommandsNV"
                    vkcmdexecutegeneratedcommandsnv
                    funcall-vkcmdexecutegeneratedcommandsnv)
    :void
  (commandbuffer vkcommandbuffer)
  (ispreprocessed vkbool32)
  (pgeneratedcommandsinfo :pointer))

(more-cffi:defcfun ("vkCmdBindPipelineShaderGroupNV"
                    vkcmdbindpipelineshadergroupnv
                    funcall-vkcmdbindpipelineshadergroupnv)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinebindpoint vkpipelinebindpoint)
  (pipeline vkpipeline)
  (groupindex :uint32))

(more-cffi:defcfun ("vkCreateIndirectCommandsLayoutNV"
                    vkcreateindirectcommandslayoutnv
                    funcall-vkcreateindirectcommandslayoutnv)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pindirectcommandslayout :pointer))

(more-cffi:defcfun ("vkDestroyIndirectCommandsLayoutNV"
                    vkdestroyindirectcommandslayoutnv
                    funcall-vkdestroyindirectcommandslayoutnv)
    :void
  (device vkdevice)
  (indirectcommandslayout vkindirectcommandslayoutnv)
  (pallocator :pointer))

(more-cffi:defcfun ("vkAcquireDrmDisplayEXT" vkacquiredrmdisplayext
                    funcall-vkacquiredrmdisplayext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (drmfd :int32)
  (display vkdisplaykhr))

(more-cffi:defcfun ("vkGetDrmDisplayEXT" vkgetdrmdisplayext
                    funcall-vkgetdrmdisplayext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (drmfd :int32)
  (connectorid :uint32)
  (display :pointer))

(more-cffi:defcfun ("vkCreatePrivateDataSlotEXT" vkcreateprivatedataslotext
                    funcall-vkcreateprivatedataslotext)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pprivatedataslot :pointer))

(more-cffi:defcfun ("vkDestroyPrivateDataSlotEXT" vkdestroyprivatedataslotext
                    funcall-vkdestroyprivatedataslotext)
    :void
  (device vkdevice)
  (privatedataslot vkprivatedataslot)
  (pallocator :pointer))

(more-cffi:defcfun ("vkSetPrivateDataEXT" vksetprivatedataext
                    funcall-vksetprivatedataext)
    vkresult
  (device vkdevice)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (privatedataslot vkprivatedataslot)
  (data :uint64))

(more-cffi:defcfun ("vkGetPrivateDataEXT" vkgetprivatedataext
                    funcall-vkgetprivatedataext)
    :void
  (device vkdevice)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (privatedataslot vkprivatedataslot)
  (pdata :pointer))

(more-cffi:defcfun ("vkCmdSetFragmentShadingRateEnumNV"
                    vkcmdsetfragmentshadingrateenumnv
                    funcall-vkcmdsetfragmentshadingrateenumnv)
    :void
  (commandbuffer vkcommandbuffer)
  (shadingrate vkfragmentshadingratenv)
  (combinerops vkfragmentshadingratecombineropkhr))

(more-cffi:defcfun ("vkGetImageSubresourceLayout2EXT"
                    vkgetimagesubresourcelayout2ext
                    funcall-vkgetimagesubresourcelayout2ext)
    :void
  (device vkdevice)
  (image vkimage)
  (psubresource :pointer)
  (playout :pointer))

(more-cffi:defcfun ("vkAcquireWinrtDisplayNV" vkacquirewinrtdisplaynv
                    funcall-vkacquirewinrtdisplaynv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr))

(more-cffi:defcfun ("vkGetWinrtDisplayNV" vkgetwinrtdisplaynv
                    funcall-vkgetwinrtdisplaynv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (devicerelativeid :uint32)
  (pdisplay :pointer))

(more-cffi:defcfun ("vkCmdSetVertexInputEXT" vkcmdsetvertexinputext
                    funcall-vkcmdsetvertexinputext)
    :void
  (commandbuffer vkcommandbuffer)
  (vertexbindingdescriptioncount :uint32)
  (pvertexbindingdescriptions :pointer)
  (vertexattributedescriptioncount :uint32)
  (pvertexattributedescriptions :pointer))

(more-cffi:defcfun ("vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI"
                    vkgetdevicesubpassshadingmaxworkgroupsizehuawei
                    funcall-vkgetdevicesubpassshadingmaxworkgroupsizehuawei)
    vkresult
  (device vkdevice)
  (renderpass vkrenderpass)
  (pmaxworkgroupsize :pointer))

(more-cffi:defcfun ("vkCmdSubpassShadingHUAWEI" vkcmdsubpassshadinghuawei
                    funcall-vkcmdsubpassshadinghuawei)
    :void
  (commandbuffer vkcommandbuffer))

(more-cffi:defcfun ("vkCmdBindInvocationMaskHUAWEI"
                    vkcmdbindinvocationmaskhuawei
                    funcall-vkcmdbindinvocationmaskhuawei)
    :void
  (commandbuffer vkcommandbuffer)
  (imageview vkimageview)
  (imagelayout vkimagelayout))

(more-cffi:defcfun ("vkGetMemoryRemoteAddressNV" vkgetmemoryremoteaddressnv
                    funcall-vkgetmemoryremoteaddressnv)
    vkresult
  (device vkdevice)
  (pmemorygetremoteaddressinfo :pointer)
  (paddress :pointer))

(more-cffi:defcfun ("vkGetPipelinePropertiesEXT" vkgetpipelinepropertiesext
                    funcall-vkgetpipelinepropertiesext)
    vkresult
  (device vkdevice)
  (ppipelineinfo :pointer)
  (ppipelineproperties :pointer))

(more-cffi:defcfun ("vkCmdSetPatchControlPointsEXT"
                    vkcmdsetpatchcontrolpointsext
                    funcall-vkcmdsetpatchcontrolpointsext)
    :void
  (commandbuffer vkcommandbuffer)
  (patchcontrolpoints :uint32))

(more-cffi:defcfun ("vkCmdSetRasterizerDiscardEnableEXT"
                    vkcmdsetrasterizerdiscardenableext
                    funcall-vkcmdsetrasterizerdiscardenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (rasterizerdiscardenable vkbool32))

(more-cffi:defcfun ("vkCmdSetDepthBiasEnableEXT" vkcmdsetdepthbiasenableext
                    funcall-vkcmdsetdepthbiasenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (depthbiasenable vkbool32))

(more-cffi:defcfun ("vkCmdSetLogicOpEXT" vkcmdsetlogicopext
                    funcall-vkcmdsetlogicopext)
    :void
  (commandbuffer vkcommandbuffer)
  (logicop vklogicop))

(more-cffi:defcfun ("vkCmdSetPrimitiveRestartEnableEXT"
                    vkcmdsetprimitiverestartenableext
                    funcall-vkcmdsetprimitiverestartenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (primitiverestartenable vkbool32))

(more-cffi:defcfun ("vkCmdSetColorWriteEnableEXT" vkcmdsetcolorwriteenableext
                    funcall-vkcmdsetcolorwriteenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (attachmentcount :uint32)
  (pcolorwriteenables :pointer))

(more-cffi:defcfun ("vkCmdDrawMultiEXT" vkcmddrawmultiext
                    funcall-vkcmddrawmultiext)
    :void
  (commandbuffer vkcommandbuffer)
  (drawcount :uint32)
  (pvertexinfo :pointer)
  (instancecount :uint32)
  (firstinstance :uint32)
  (stride :uint32))

(more-cffi:defcfun ("vkCmdDrawMultiIndexedEXT" vkcmddrawmultiindexedext
                    funcall-vkcmddrawmultiindexedext)
    :void
  (commandbuffer vkcommandbuffer)
  (drawcount :uint32)
  (pindexinfo :pointer)
  (instancecount :uint32)
  (firstinstance :uint32)
  (stride :uint32)
  (pvertexoffset :pointer))

(more-cffi:defcfun ("vkSetDeviceMemoryPriorityEXT" vksetdevicememorypriorityext
                    funcall-vksetdevicememorypriorityext)
    :void
  (device vkdevice)
  (memory vkdevicememory)
  (priority :float))

(more-cffi:defcfun ("vkGetDescriptorSetLayoutHostMappingInfoVALVE"
                    vkgetdescriptorsetlayouthostmappinginfovalve
                    funcall-vkgetdescriptorsetlayouthostmappinginfovalve)
    :void
  (device vkdevice)
  (pbindingreference :pointer)
  (phostmapping :pointer))

(more-cffi:defcfun ("vkGetDescriptorSetHostMappingVALVE"
                    vkgetdescriptorsethostmappingvalve
                    funcall-vkgetdescriptorsethostmappingvalve)
    :void
  (device vkdevice)
  (descriptorset vkdescriptorset)
  (ppdata :pointer))

(more-cffi:defcfun ("vkCreateAccelerationStructureKHR"
                    vkcreateaccelerationstructurekhr
                    funcall-vkcreateaccelerationstructurekhr)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (paccelerationstructure :pointer))

(more-cffi:defcfun ("vkDestroyAccelerationStructureKHR"
                    vkdestroyaccelerationstructurekhr
                    funcall-vkdestroyaccelerationstructurekhr)
    :void
  (device vkdevice)
  (accelerationstructure vkaccelerationstructurekhr)
  (pallocator :pointer))

(more-cffi:defcfun ("vkCmdBuildAccelerationStructuresKHR"
                    vkcmdbuildaccelerationstructureskhr
                    funcall-vkcmdbuildaccelerationstructureskhr)
    :void
  (commandbuffer vkcommandbuffer)
  (infocount :uint32)
  (pinfos :pointer)
  (ppbuildrangeinfos :pointer))

(more-cffi:defcfun ("vkCmdBuildAccelerationStructuresIndirectKHR"
                    vkcmdbuildaccelerationstructuresindirectkhr
                    funcall-vkcmdbuildaccelerationstructuresindirectkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (infocount :uint32)
  (pinfos :pointer)
  (pindirectdeviceaddresses :pointer)
  (pindirectstrides :pointer)
  (ppmaxprimitivecounts :pointer))

(more-cffi:defcfun ("vkBuildAccelerationStructuresKHR"
                    vkbuildaccelerationstructureskhr
                    funcall-vkbuildaccelerationstructureskhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (infocount :uint32)
  (pinfos :pointer)
  (ppbuildrangeinfos :pointer))

(more-cffi:defcfun ("vkCopyAccelerationStructureKHR"
                    vkcopyaccelerationstructurekhr
                    funcall-vkcopyaccelerationstructurekhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pinfo :pointer))

(more-cffi:defcfun ("vkCopyAccelerationStructureToMemoryKHR"
                    vkcopyaccelerationstructuretomemorykhr
                    funcall-vkcopyaccelerationstructuretomemorykhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pinfo :pointer))

(more-cffi:defcfun ("vkCopyMemoryToAccelerationStructureKHR"
                    vkcopymemorytoaccelerationstructurekhr
                    funcall-vkcopymemorytoaccelerationstructurekhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pinfo :pointer))

(more-cffi:defcfun ("vkWriteAccelerationStructuresPropertiesKHR"
                    vkwriteaccelerationstructurespropertieskhr
                    funcall-vkwriteaccelerationstructurespropertieskhr)
    vkresult
  (device vkdevice)
  (accelerationstructurecount :uint32)
  (paccelerationstructures :pointer)
  (querytype vkquerytype)
  (datasize :size)
  (pdata :pointer)
  (stride :size))

(more-cffi:defcfun ("vkCmdCopyAccelerationStructureKHR"
                    vkcmdcopyaccelerationstructurekhr
                    funcall-vkcmdcopyaccelerationstructurekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo :pointer))

(more-cffi:defcfun ("vkCmdCopyAccelerationStructureToMemoryKHR"
                    vkcmdcopyaccelerationstructuretomemorykhr
                    funcall-vkcmdcopyaccelerationstructuretomemorykhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo :pointer))

(more-cffi:defcfun ("vkCmdCopyMemoryToAccelerationStructureKHR"
                    vkcmdcopymemorytoaccelerationstructurekhr
                    funcall-vkcmdcopymemorytoaccelerationstructurekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo :pointer))

(more-cffi:defcfun ("vkGetAccelerationStructureDeviceAddressKHR"
                    vkgetaccelerationstructuredeviceaddresskhr
                    funcall-vkgetaccelerationstructuredeviceaddresskhr)
    vkdeviceaddress
  (device vkdevice)
  (pinfo :pointer))

(more-cffi:defcfun ("vkCmdWriteAccelerationStructuresPropertiesKHR"
                    vkcmdwriteaccelerationstructurespropertieskhr
                    funcall-vkcmdwriteaccelerationstructurespropertieskhr)
    :void
  (commandbuffer vkcommandbuffer)
  (accelerationstructurecount :uint32)
  (paccelerationstructures :pointer)
  (querytype vkquerytype)
  (querypool vkquerypool)
  (firstquery :uint32))

(more-cffi:defcfun ("vkGetDeviceAccelerationStructureCompatibilityKHR"
                    vkgetdeviceaccelerationstructurecompatibilitykhr
                    funcall-vkgetdeviceaccelerationstructurecompatibilitykhr)
    :void
  (device vkdevice)
  (pversioninfo :pointer)
  (pcompatibility :pointer))

(more-cffi:defcfun ("vkGetAccelerationStructureBuildSizesKHR"
                    vkgetaccelerationstructurebuildsizeskhr
                    funcall-vkgetaccelerationstructurebuildsizeskhr)
    :void
  (device vkdevice)
  (buildtype vkaccelerationstructurebuildtypekhr)
  (pbuildinfo :pointer)
  (pmaxprimitivecounts :pointer)
  (psizeinfo :pointer))

(more-cffi:defcfun ("vkCmdTraceRaysKHR" vkcmdtracerayskhr
                    funcall-vkcmdtracerayskhr)
    :void
  (commandbuffer vkcommandbuffer)
  (praygenshaderbindingtable :pointer)
  (pmissshaderbindingtable :pointer)
  (phitshaderbindingtable :pointer)
  (pcallableshaderbindingtable :pointer)
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(more-cffi:defcfun ("vkCreateRayTracingPipelinesKHR"
                    vkcreateraytracingpipelineskhr
                    funcall-vkcreateraytracingpipelineskhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos :pointer)
  (pallocator :pointer)
  (ppipelines :pointer))

(more-cffi:defcfun ("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR"
                    vkgetraytracingcapturereplayshadergrouphandleskhr
                    funcall-vkgetraytracingcapturereplayshadergrouphandleskhr)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (firstgroup :uint32)
  (groupcount :uint32)
  (datasize :size)
  (pdata :pointer))

(more-cffi:defcfun ("vkCmdTraceRaysIndirectKHR" vkcmdtraceraysindirectkhr
                    funcall-vkcmdtraceraysindirectkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (praygenshaderbindingtable :pointer)
  (pmissshaderbindingtable :pointer)
  (phitshaderbindingtable :pointer)
  (pcallableshaderbindingtable :pointer)
  (indirectdeviceaddress vkdeviceaddress))

(more-cffi:defcfun ("vkGetRayTracingShaderGroupStackSizeKHR"
                    vkgetraytracingshadergroupstacksizekhr
                    funcall-vkgetraytracingshadergroupstacksizekhr)
    vkdevicesize
  (device vkdevice)
  (pipeline vkpipeline)
  (group :uint32)
  (groupshader vkshadergroupshaderkhr))

(more-cffi:defcfun ("vkCmdSetRayTracingPipelineStackSizeKHR"
                    vkcmdsetraytracingpipelinestacksizekhr
                    funcall-vkcmdsetraytracingpipelinestacksizekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinestacksize :uint32))