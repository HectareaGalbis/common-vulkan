
(in-package :cvk)


(cffi:defcfun ("vkCreateInstance" vkcreateinstance)
    vkresult
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pinstance :pointer))

(cffi:defcfun ("vkDestroyInstance" vkdestroyinstance)
    :void
  (instance vkinstance)
  (pallocator :pointer))

(cffi:defcfun ("vkEnumeratePhysicalDevices" vkenumeratephysicaldevices)
    vkresult
  (instance vkinstance)
  (pphysicaldevicecount :pointer)
  (pphysicaldevices :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceFeatures" vkgetphysicaldevicefeatures)
    :void
  (physicaldevice vkphysicaldevice)
  (pfeatures :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceFormatProperties"
               vkgetphysicaldeviceformatproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (pformatproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties"
               vkgetphysicaldeviceimageformatproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (type vkimagetype)
  (tiling vkimagetiling)
  (usage vkimageusageflags)
  (flags vkimagecreateflags)
  (pimageformatproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceProperties" vkgetphysicaldeviceproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties"
               vkgetphysicaldevicequeuefamilyproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pqueuefamilypropertycount :pointer)
  (pqueuefamilyproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties"
               vkgetphysicaldevicememoryproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pmemoryproperties :pointer))

(cffi:defcfun ("vkGetInstanceProcAddr" vkgetinstanceprocaddr)
    pfn_vkvoidfunction
  (instance vkinstance)
  (pname :pointer))

(cffi:defcfun ("vkGetDeviceProcAddr" vkgetdeviceprocaddr)
    pfn_vkvoidfunction
  (device vkdevice)
  (pname :pointer))

(cffi:defcfun ("vkCreateDevice" vkcreatedevice)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pdevice :pointer))

(cffi:defcfun ("vkDestroyDevice" vkdestroydevice)
    :void
  (device vkdevice)
  (pallocator :pointer))

(cffi:defcfun ("vkEnumerateInstanceExtensionProperties"
               vkenumerateinstanceextensionproperties)
    vkresult
  (playername :pointer)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkEnumerateDeviceExtensionProperties"
               vkenumeratedeviceextensionproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (playername :pointer)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkEnumerateInstanceLayerProperties"
               vkenumerateinstancelayerproperties)
    vkresult
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkEnumerateDeviceLayerProperties"
               vkenumeratedevicelayerproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkGetDeviceQueue" vkgetdevicequeue)
    :void
  (device vkdevice)
  (queuefamilyindex :uint32)
  (queueindex :uint32)
  (pqueue :pointer))

(cffi:defcfun ("vkQueueSubmit" vkqueuesubmit)
    vkresult
  (queue vkqueue)
  (submitcount :uint32)
  (psubmits :pointer)
  (fence vkfence))

(cffi:defcfun ("vkQueueWaitIdle" vkqueuewaitidle)
    vkresult
  (queue vkqueue))

(cffi:defcfun ("vkDeviceWaitIdle" vkdevicewaitidle)
    vkresult
  (device vkdevice))

(cffi:defcfun ("vkAllocateMemory" vkallocatememory)
    vkresult
  (device vkdevice)
  (pallocateinfo :pointer)
  (pallocator :pointer)
  (pmemory :pointer))

(cffi:defcfun ("vkFreeMemory" vkfreememory)
    :void
  (device vkdevice)
  (memory vkdevicememory)
  (pallocator :pointer))

(cffi:defcfun ("vkMapMemory" vkmapmemory)
    vkresult
  (device vkdevice)
  (memory vkdevicememory)
  (offset vkdevicesize)
  (size vkdevicesize)
  (flags vkmemorymapflags)
  (ppdata :pointer))

(cffi:defcfun ("vkUnmapMemory" vkunmapmemory)
    :void
  (device vkdevice)
  (memory vkdevicememory))

(cffi:defcfun ("vkFlushMappedMemoryRanges" vkflushmappedmemoryranges)
    vkresult
  (device vkdevice)
  (memoryrangecount :uint32)
  (pmemoryranges :pointer))

(cffi:defcfun ("vkInvalidateMappedMemoryRanges" vkinvalidatemappedmemoryranges)
    vkresult
  (device vkdevice)
  (memoryrangecount :uint32)
  (pmemoryranges :pointer))

(cffi:defcfun ("vkGetDeviceMemoryCommitment" vkgetdevicememorycommitment)
    :void
  (device vkdevice)
  (memory vkdevicememory)
  (pcommittedmemoryinbytes :pointer))

(cffi:defcfun ("vkBindBufferMemory" vkbindbuffermemory)
    vkresult
  (device vkdevice)
  (buffer vkbuffer)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize))

(cffi:defcfun ("vkBindImageMemory" vkbindimagememory)
    vkresult
  (device vkdevice)
  (image vkimage)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize))

(cffi:defcfun ("vkGetBufferMemoryRequirements" vkgetbuffermemoryrequirements)
    :void
  (device vkdevice)
  (buffer vkbuffer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkGetImageMemoryRequirements" vkgetimagememoryrequirements)
    :void
  (device vkdevice)
  (image vkimage)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkGetImageSparseMemoryRequirements"
               vkgetimagesparsememoryrequirements)
    :void
  (device vkdevice)
  (image vkimage)
  (psparsememoryrequirementcount :pointer)
  (psparsememoryrequirements :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties"
               vkgetphysicaldevicesparseimageformatproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (type vkimagetype)
  (samples vksamplecountflagbits)
  (usage vkimageusageflags)
  (tiling vkimagetiling)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkQueueBindSparse" vkqueuebindsparse)
    vkresult
  (queue vkqueue)
  (bindinfocount :uint32)
  (pbindinfo :pointer)
  (fence vkfence))

(cffi:defcfun ("vkCreateFence" vkcreatefence)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pfence :pointer))

(cffi:defcfun ("vkDestroyFence" vkdestroyfence)
    :void
  (device vkdevice)
  (fence vkfence)
  (pallocator :pointer))

(cffi:defcfun ("vkResetFences" vkresetfences)
    vkresult
  (device vkdevice)
  (fencecount :uint32)
  (pfences :pointer))

(cffi:defcfun ("vkGetFenceStatus" vkgetfencestatus)
    vkresult
  (device vkdevice)
  (fence vkfence))

(cffi:defcfun ("vkWaitForFences" vkwaitforfences)
    vkresult
  (device vkdevice)
  (fencecount :uint32)
  (pfences :pointer)
  (waitall vkbool32)
  (timeout :uint64))

(cffi:defcfun ("vkCreateSemaphore" vkcreatesemaphore)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (psemaphore :pointer))

(cffi:defcfun ("vkDestroySemaphore" vkdestroysemaphore)
    :void
  (device vkdevice)
  (semaphore vksemaphore)
  (pallocator :pointer))

(cffi:defcfun ("vkCreateEvent" vkcreateevent)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pevent :pointer))

(cffi:defcfun ("vkDestroyEvent" vkdestroyevent)
    :void
  (device vkdevice)
  (event vkevent)
  (pallocator :pointer))

(cffi:defcfun ("vkGetEventStatus" vkgeteventstatus)
    vkresult
  (device vkdevice)
  (event vkevent))

(cffi:defcfun ("vkSetEvent" vksetevent)
    vkresult
  (device vkdevice)
  (event vkevent))

(cffi:defcfun ("vkResetEvent" vkresetevent)
    vkresult
  (device vkdevice)
  (event vkevent))

(cffi:defcfun ("vkCreateQueryPool" vkcreatequerypool)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pquerypool :pointer))

(cffi:defcfun ("vkDestroyQueryPool" vkdestroyquerypool)
    :void
  (device vkdevice)
  (querypool vkquerypool)
  (pallocator :pointer))

(cffi:defcfun ("vkGetQueryPoolResults" vkgetquerypoolresults)
    vkresult
  (device vkdevice)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32)
  (datasize :size)
  (pdata :pointer)
  (stride vkdevicesize)
  (flags vkqueryresultflags))

(cffi:defcfun ("vkCreateBuffer" vkcreatebuffer)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pbuffer :pointer))

(cffi:defcfun ("vkDestroyBuffer" vkdestroybuffer)
    :void
  (device vkdevice)
  (buffer vkbuffer)
  (pallocator :pointer))

(cffi:defcfun ("vkCreateBufferView" vkcreatebufferview)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pview :pointer))

(cffi:defcfun ("vkDestroyBufferView" vkdestroybufferview)
    :void
  (device vkdevice)
  (bufferview vkbufferview)
  (pallocator :pointer))

(cffi:defcfun ("vkCreateImage" vkcreateimage)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pimage :pointer))

(cffi:defcfun ("vkDestroyImage" vkdestroyimage)
    :void
  (device vkdevice)
  (image vkimage)
  (pallocator :pointer))

(cffi:defcfun ("vkGetImageSubresourceLayout" vkgetimagesubresourcelayout)
    :void
  (device vkdevice)
  (image vkimage)
  (psubresource :pointer)
  (playout :pointer))

(cffi:defcfun ("vkCreateImageView" vkcreateimageview)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pview :pointer))

(cffi:defcfun ("vkDestroyImageView" vkdestroyimageview)
    :void
  (device vkdevice)
  (imageview vkimageview)
  (pallocator :pointer))

(cffi:defcfun ("vkCreateShaderModule" vkcreateshadermodule)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pshadermodule :pointer))

(cffi:defcfun ("vkDestroyShaderModule" vkdestroyshadermodule)
    :void
  (device vkdevice)
  (shadermodule vkshadermodule)
  (pallocator :pointer))

(cffi:defcfun ("vkCreatePipelineCache" vkcreatepipelinecache)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (ppipelinecache :pointer))

(cffi:defcfun ("vkDestroyPipelineCache" vkdestroypipelinecache)
    :void
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (pallocator :pointer))

(cffi:defcfun ("vkGetPipelineCacheData" vkgetpipelinecachedata)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (pdatasize :pointer)
  (pdata :pointer))

(cffi:defcfun ("vkMergePipelineCaches" vkmergepipelinecaches)
    vkresult
  (device vkdevice)
  (dstcache vkpipelinecache)
  (srccachecount :uint32)
  (psrccaches :pointer))

(cffi:defcfun ("vkCreateGraphicsPipelines" vkcreategraphicspipelines)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos :pointer)
  (pallocator :pointer)
  (ppipelines :pointer))

(cffi:defcfun ("vkCreateComputePipelines" vkcreatecomputepipelines)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos :pointer)
  (pallocator :pointer)
  (ppipelines :pointer))

(cffi:defcfun ("vkDestroyPipeline" vkdestroypipeline)
    :void
  (device vkdevice)
  (pipeline vkpipeline)
  (pallocator :pointer))

(cffi:defcfun ("vkCreatePipelineLayout" vkcreatepipelinelayout)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (ppipelinelayout :pointer))

(cffi:defcfun ("vkDestroyPipelineLayout" vkdestroypipelinelayout)
    :void
  (device vkdevice)
  (pipelinelayout vkpipelinelayout)
  (pallocator :pointer))

(cffi:defcfun ("vkCreateSampler" vkcreatesampler)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (psampler :pointer))

(cffi:defcfun ("vkDestroySampler" vkdestroysampler)
    :void
  (device vkdevice)
  (sampler vksampler)
  (pallocator :pointer))

(cffi:defcfun ("vkCreateDescriptorSetLayout" vkcreatedescriptorsetlayout)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (psetlayout :pointer))

(cffi:defcfun ("vkDestroyDescriptorSetLayout" vkdestroydescriptorsetlayout)
    :void
  (device vkdevice)
  (descriptorsetlayout vkdescriptorsetlayout)
  (pallocator :pointer))

(cffi:defcfun ("vkCreateDescriptorPool" vkcreatedescriptorpool)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pdescriptorpool :pointer))

(cffi:defcfun ("vkDestroyDescriptorPool" vkdestroydescriptorpool)
    :void
  (device vkdevice)
  (descriptorpool vkdescriptorpool)
  (pallocator :pointer))

(cffi:defcfun ("vkResetDescriptorPool" vkresetdescriptorpool)
    vkresult
  (device vkdevice)
  (descriptorpool vkdescriptorpool)
  (flags vkdescriptorpoolresetflags))

(cffi:defcfun ("vkAllocateDescriptorSets" vkallocatedescriptorsets)
    vkresult
  (device vkdevice)
  (pallocateinfo :pointer)
  (pdescriptorsets :pointer))

(cffi:defcfun ("vkFreeDescriptorSets" vkfreedescriptorsets)
    vkresult
  (device vkdevice)
  (descriptorpool vkdescriptorpool)
  (descriptorsetcount :uint32)
  (pdescriptorsets :pointer))

(cffi:defcfun ("vkUpdateDescriptorSets" vkupdatedescriptorsets)
    :void
  (device vkdevice)
  (descriptorwritecount :uint32)
  (pdescriptorwrites :pointer)
  (descriptorcopycount :uint32)
  (pdescriptorcopies :pointer))

(cffi:defcfun ("vkCreateFramebuffer" vkcreateframebuffer)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pframebuffer :pointer))

(cffi:defcfun ("vkDestroyFramebuffer" vkdestroyframebuffer)
    :void
  (device vkdevice)
  (framebuffer vkframebuffer)
  (pallocator :pointer))

(cffi:defcfun ("vkCreateRenderPass" vkcreaterenderpass)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (prenderpass :pointer))

(cffi:defcfun ("vkDestroyRenderPass" vkdestroyrenderpass)
    :void
  (device vkdevice)
  (renderpass vkrenderpass)
  (pallocator :pointer))

(cffi:defcfun ("vkGetRenderAreaGranularity" vkgetrenderareagranularity)
    :void
  (device vkdevice)
  (renderpass vkrenderpass)
  (pgranularity :pointer))

(cffi:defcfun ("vkCreateCommandPool" vkcreatecommandpool)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pcommandpool :pointer))

(cffi:defcfun ("vkDestroyCommandPool" vkdestroycommandpool)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (pallocator :pointer))

(cffi:defcfun ("vkResetCommandPool" vkresetcommandpool)
    vkresult
  (device vkdevice)
  (commandpool vkcommandpool)
  (flags vkcommandpoolresetflags))

(cffi:defcfun ("vkAllocateCommandBuffers" vkallocatecommandbuffers)
    vkresult
  (device vkdevice)
  (pallocateinfo :pointer)
  (pcommandbuffers :pointer))

(cffi:defcfun ("vkFreeCommandBuffers" vkfreecommandbuffers)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (commandbuffercount :uint32)
  (pcommandbuffers :pointer))

(cffi:defcfun ("vkBeginCommandBuffer" vkbegincommandbuffer)
    vkresult
  (commandbuffer vkcommandbuffer)
  (pbegininfo :pointer))

(cffi:defcfun ("vkEndCommandBuffer" vkendcommandbuffer)
    vkresult
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkResetCommandBuffer" vkresetcommandbuffer)
    vkresult
  (commandbuffer vkcommandbuffer)
  (flags vkcommandbufferresetflags))

(cffi:defcfun ("vkCmdBindPipeline" vkcmdbindpipeline)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinebindpoint vkpipelinebindpoint)
  (pipeline vkpipeline))

(cffi:defcfun ("vkCmdSetViewport" vkcmdsetviewport)
    :void
  (commandbuffer vkcommandbuffer)
  (firstviewport :uint32)
  (viewportcount :uint32)
  (pviewports :pointer))

(cffi:defcfun ("vkCmdSetScissor" vkcmdsetscissor)
    :void
  (commandbuffer vkcommandbuffer)
  (firstscissor :uint32)
  (scissorcount :uint32)
  (pscissors :pointer))

(cffi:defcfun ("vkCmdSetLineWidth" vkcmdsetlinewidth)
    :void
  (commandbuffer vkcommandbuffer)
  (linewidth :float))

(cffi:defcfun ("vkCmdSetDepthBias" vkcmdsetdepthbias)
    :void
  (commandbuffer vkcommandbuffer)
  (depthbiasconstantfactor :float)
  (depthbiasclamp :float)
  (depthbiasslopefactor :float))

(cffi:defcfun ("vkCmdSetBlendConstants" vkcmdsetblendconstants)
    :void
  (commandbuffer vkcommandbuffer)
  (blendconstants :float))

(cffi:defcfun ("vkCmdSetDepthBounds" vkcmdsetdepthbounds)
    :void
  (commandbuffer vkcommandbuffer)
  (mindepthbounds :float)
  (maxdepthbounds :float))

(cffi:defcfun ("vkCmdSetStencilCompareMask" vkcmdsetstencilcomparemask)
    :void
  (commandbuffer vkcommandbuffer)
  (facemask vkstencilfaceflags)
  (comparemask :uint32))

(cffi:defcfun ("vkCmdSetStencilWriteMask" vkcmdsetstencilwritemask)
    :void
  (commandbuffer vkcommandbuffer)
  (facemask vkstencilfaceflags)
  (writemask :uint32))

(cffi:defcfun ("vkCmdSetStencilReference" vkcmdsetstencilreference)
    :void
  (commandbuffer vkcommandbuffer)
  (facemask vkstencilfaceflags)
  (reference :uint32))

(cffi:defcfun ("vkCmdBindDescriptorSets" vkcmdbinddescriptorsets)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinebindpoint vkpipelinebindpoint)
  (layout vkpipelinelayout)
  (firstset :uint32)
  (descriptorsetcount :uint32)
  (pdescriptorsets :pointer)
  (dynamicoffsetcount :uint32)
  (pdynamicoffsets :pointer))

(cffi:defcfun ("vkCmdBindIndexBuffer" vkcmdbindindexbuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (indextype vkindextype))

(cffi:defcfun ("vkCmdBindVertexBuffers" vkcmdbindvertexbuffers)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers :pointer)
  (poffsets :pointer))

(cffi:defcfun ("vkCmdDraw" vkcmddraw)
    :void
  (commandbuffer vkcommandbuffer)
  (vertexcount :uint32)
  (instancecount :uint32)
  (firstvertex :uint32)
  (firstinstance :uint32))

(cffi:defcfun ("vkCmdDrawIndexed" vkcmddrawindexed)
    :void
  (commandbuffer vkcommandbuffer)
  (indexcount :uint32)
  (instancecount :uint32)
  (firstindex :uint32)
  (vertexoffset :int32)
  (firstinstance :uint32))

(cffi:defcfun ("vkCmdDrawIndirect" vkcmddrawindirect)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (drawcount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawIndexedIndirect" vkcmddrawindexedindirect)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (drawcount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDispatch" vkcmddispatch)
    :void
  (commandbuffer vkcommandbuffer)
  (groupcountx :uint32)
  (groupcounty :uint32)
  (groupcountz :uint32))

(cffi:defcfun ("vkCmdDispatchIndirect" vkcmddispatchindirect)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize))

(cffi:defcfun ("vkCmdCopyBuffer" vkcmdcopybuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (srcbuffer vkbuffer)
  (dstbuffer vkbuffer)
  (regioncount :uint32)
  (pregions :pointer))

(cffi:defcfun ("vkCmdCopyImage" vkcmdcopyimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer))

(cffi:defcfun ("vkCmdBlitImage" vkcmdblitimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer)
  (filter vkfilter))

(cffi:defcfun ("vkCmdCopyBufferToImage" vkcmdcopybuffertoimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcbuffer vkbuffer)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer))

(cffi:defcfun ("vkCmdCopyImageToBuffer" vkcmdcopyimagetobuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstbuffer vkbuffer)
  (regioncount :uint32)
  (pregions :pointer))

(cffi:defcfun ("vkCmdUpdateBuffer" vkcmdupdatebuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (datasize vkdevicesize)
  (pdata :pointer))

(cffi:defcfun ("vkCmdFillBuffer" vkcmdfillbuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (size vkdevicesize)
  (data :uint32))

(cffi:defcfun ("vkCmdClearColorImage" vkcmdclearcolorimage)
    :void
  (commandbuffer vkcommandbuffer)
  (image vkimage)
  (imagelayout vkimagelayout)
  (pcolor :pointer)
  (rangecount :uint32)
  (pranges :pointer))

(cffi:defcfun ("vkCmdClearDepthStencilImage" vkcmdcleardepthstencilimage)
    :void
  (commandbuffer vkcommandbuffer)
  (image vkimage)
  (imagelayout vkimagelayout)
  (pdepthstencil :pointer)
  (rangecount :uint32)
  (pranges :pointer))

(cffi:defcfun ("vkCmdClearAttachments" vkcmdclearattachments)
    :void
  (commandbuffer vkcommandbuffer)
  (attachmentcount :uint32)
  (pattachments :pointer)
  (rectcount :uint32)
  (prects :pointer))

(cffi:defcfun ("vkCmdResolveImage" vkcmdresolveimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer))

(cffi:defcfun ("vkCmdSetEvent" vkcmdsetevent)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (stagemask vkpipelinestageflags))

(cffi:defcfun ("vkCmdResetEvent" vkcmdresetevent)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (stagemask vkpipelinestageflags))

(cffi:defcfun ("vkCmdWaitEvents" vkcmdwaitevents)
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

(cffi:defcfun ("vkCmdPipelineBarrier" vkcmdpipelinebarrier)
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

(cffi:defcfun ("vkCmdBeginQuery" vkcmdbeginquery)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (query :uint32)
  (flags vkquerycontrolflags))

(cffi:defcfun ("vkCmdEndQuery" vkcmdendquery)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (query :uint32))

(cffi:defcfun ("vkCmdResetQueryPool" vkcmdresetquerypool)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32))

(cffi:defcfun ("vkCmdWriteTimestamp" vkcmdwritetimestamp)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinestage vkpipelinestageflagbits)
  (querypool vkquerypool)
  (query :uint32))

(cffi:defcfun ("vkCmdCopyQueryPoolResults" vkcmdcopyquerypoolresults)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (stride vkdevicesize)
  (flags vkqueryresultflags))

(cffi:defcfun ("vkCmdPushConstants" vkcmdpushconstants)
    :void
  (commandbuffer vkcommandbuffer)
  (layout vkpipelinelayout)
  (stageflags vkshaderstageflags)
  (offset :uint32)
  (size :uint32)
  (pvalues :pointer))

(cffi:defcfun ("vkCmdBeginRenderPass" vkcmdbeginrenderpass)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderpassbegin :pointer)
  (contents vksubpasscontents))

(cffi:defcfun ("vkCmdNextSubpass" vkcmdnextsubpass)
    :void
  (commandbuffer vkcommandbuffer)
  (contents vksubpasscontents))

(cffi:defcfun ("vkCmdEndRenderPass" vkcmdendrenderpass)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkCmdExecuteCommands" vkcmdexecutecommands)
    :void
  (commandbuffer vkcommandbuffer)
  (commandbuffercount :uint32)
  (pcommandbuffers :pointer))

(cffi:defcfun ("vkEnumerateInstanceVersion" vkenumerateinstanceversion)
    vkresult
  (papiversion :pointer))

(cffi:defcfun ("vkBindBufferMemory2" vkbindbuffermemory2)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos :pointer))

(cffi:defcfun ("vkBindImageMemory2" vkbindimagememory2)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos :pointer))

(cffi:defcfun ("vkGetDeviceGroupPeerMemoryFeatures"
               vkgetdevicegrouppeermemoryfeatures)
    :void
  (device vkdevice)
  (heapindex :uint32)
  (localdeviceindex :uint32)
  (remotedeviceindex :uint32)
  (ppeermemoryfeatures :pointer))

(cffi:defcfun ("vkCmdSetDeviceMask" vkcmdsetdevicemask)
    :void
  (commandbuffer vkcommandbuffer)
  (devicemask :uint32))

(cffi:defcfun ("vkCmdDispatchBase" vkcmddispatchbase)
    :void
  (commandbuffer vkcommandbuffer)
  (basegroupx :uint32)
  (basegroupy :uint32)
  (basegroupz :uint32)
  (groupcountx :uint32)
  (groupcounty :uint32)
  (groupcountz :uint32))

(cffi:defcfun ("vkEnumeratePhysicalDeviceGroups"
               vkenumeratephysicaldevicegroups)
    vkresult
  (instance vkinstance)
  (pphysicaldevicegroupcount :pointer)
  (pphysicaldevicegroupproperties :pointer))

(cffi:defcfun ("vkGetImageMemoryRequirements2" vkgetimagememoryrequirements2)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkGetBufferMemoryRequirements2" vkgetbuffermemoryrequirements2)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkGetImageSparseMemoryRequirements2"
               vkgetimagesparsememoryrequirements2)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (psparsememoryrequirementcount :pointer)
  (psparsememoryrequirements :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceFeatures2" vkgetphysicaldevicefeatures2)
    :void
  (physicaldevice vkphysicaldevice)
  (pfeatures :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceProperties2" vkgetphysicaldeviceproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceFormatProperties2"
               vkgetphysicaldeviceformatproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (pformatproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties2"
               vkgetphysicaldeviceimageformatproperties2)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pimageformatinfo :pointer)
  (pimageformatproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties2"
               vkgetphysicaldevicequeuefamilyproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pqueuefamilypropertycount :pointer)
  (pqueuefamilyproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties2"
               vkgetphysicaldevicememoryproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pmemoryproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties2"
               vkgetphysicaldevicesparseimageformatproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pformatinfo :pointer)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkTrimCommandPool" vktrimcommandpool)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (flags vkcommandpooltrimflags))

(cffi:defcfun ("vkGetDeviceQueue2" vkgetdevicequeue2)
    :void
  (device vkdevice)
  (pqueueinfo :pointer)
  (pqueue :pointer))

(cffi:defcfun ("vkCreateSamplerYcbcrConversion" vkcreatesamplerycbcrconversion)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pycbcrconversion :pointer))

(cffi:defcfun ("vkDestroySamplerYcbcrConversion"
               vkdestroysamplerycbcrconversion)
    :void
  (device vkdevice)
  (ycbcrconversion vksamplerycbcrconversion)
  (pallocator :pointer))

(cffi:defcfun ("vkCreateDescriptorUpdateTemplate"
               vkcreatedescriptorupdatetemplate)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pdescriptorupdatetemplate :pointer))

(cffi:defcfun ("vkDestroyDescriptorUpdateTemplate"
               vkdestroydescriptorupdatetemplate)
    :void
  (device vkdevice)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pallocator :pointer))

(cffi:defcfun ("vkUpdateDescriptorSetWithTemplate"
               vkupdatedescriptorsetwithtemplate)
    :void
  (device vkdevice)
  (descriptorset vkdescriptorset)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pdata :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceExternalBufferProperties"
               vkgetphysicaldeviceexternalbufferproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalbufferinfo :pointer)
  (pexternalbufferproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceExternalFenceProperties"
               vkgetphysicaldeviceexternalfenceproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalfenceinfo :pointer)
  (pexternalfenceproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceExternalSemaphoreProperties"
               vkgetphysicaldeviceexternalsemaphoreproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalsemaphoreinfo :pointer)
  (pexternalsemaphoreproperties :pointer))

(cffi:defcfun ("vkGetDescriptorSetLayoutSupport"
               vkgetdescriptorsetlayoutsupport)
    :void
  (device vkdevice)
  (pcreateinfo :pointer)
  (psupport :pointer))

(cffi:defcfun ("vkCmdDrawIndirectCount" vkcmddrawindirectcount)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawIndexedIndirectCount" vkcmddrawindexedindirectcount)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCreateRenderPass2" vkcreaterenderpass2)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (prenderpass :pointer))

(cffi:defcfun ("vkCmdBeginRenderPass2" vkcmdbeginrenderpass2)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderpassbegin :pointer)
  (psubpassbegininfo :pointer))

(cffi:defcfun ("vkCmdNextSubpass2" vkcmdnextsubpass2)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassbegininfo :pointer)
  (psubpassendinfo :pointer))

(cffi:defcfun ("vkCmdEndRenderPass2" vkcmdendrenderpass2)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassendinfo :pointer))

(cffi:defcfun ("vkResetQueryPool" vkresetquerypool)
    :void
  (device vkdevice)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32))

(cffi:defcfun ("vkGetSemaphoreCounterValue" vkgetsemaphorecountervalue)
    vkresult
  (device vkdevice)
  (semaphore vksemaphore)
  (pvalue :pointer))

(cffi:defcfun ("vkWaitSemaphores" vkwaitsemaphores)
    vkresult
  (device vkdevice)
  (pwaitinfo :pointer)
  (timeout :uint64))

(cffi:defcfun ("vkSignalSemaphore" vksignalsemaphore)
    vkresult
  (device vkdevice)
  (psignalinfo :pointer))

(cffi:defcfun ("vkGetBufferDeviceAddress" vkgetbufferdeviceaddress)
    vkdeviceaddress
  (device vkdevice)
  (pinfo :pointer))

(cffi:defcfun ("vkGetBufferOpaqueCaptureAddress"
               vkgetbufferopaquecaptureaddress)
    :uint64
  (device vkdevice)
  (pinfo :pointer))

(cffi:defcfun ("vkGetDeviceMemoryOpaqueCaptureAddress"
               vkgetdevicememoryopaquecaptureaddress)
    :uint64
  (device vkdevice)
  (pinfo :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceToolProperties"
               vkgetphysicaldevicetoolproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ptoolcount :pointer)
  (ptoolproperties :pointer))

(cffi:defcfun ("vkCreatePrivateDataSlot" vkcreateprivatedataslot)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pprivatedataslot :pointer))

(cffi:defcfun ("vkDestroyPrivateDataSlot" vkdestroyprivatedataslot)
    :void
  (device vkdevice)
  (privatedataslot vkprivatedataslot)
  (pallocator :pointer))

(cffi:defcfun ("vkSetPrivateData" vksetprivatedata)
    vkresult
  (device vkdevice)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (privatedataslot vkprivatedataslot)
  (data :uint64))

(cffi:defcfun ("vkGetPrivateData" vkgetprivatedata)
    :void
  (device vkdevice)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (privatedataslot vkprivatedataslot)
  (pdata :pointer))

(cffi:defcfun ("vkCmdSetEvent2" vkcmdsetevent2)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (pdependencyinfo :pointer))

(cffi:defcfun ("vkCmdResetEvent2" vkcmdresetevent2)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (stagemask vkpipelinestageflags2))

(cffi:defcfun ("vkCmdWaitEvents2" vkcmdwaitevents2)
    :void
  (commandbuffer vkcommandbuffer)
  (eventcount :uint32)
  (pevents :pointer)
  (pdependencyinfos :pointer))

(cffi:defcfun ("vkCmdPipelineBarrier2" vkcmdpipelinebarrier2)
    :void
  (commandbuffer vkcommandbuffer)
  (pdependencyinfo :pointer))

(cffi:defcfun ("vkCmdWriteTimestamp2" vkcmdwritetimestamp2)
    :void
  (commandbuffer vkcommandbuffer)
  (stage vkpipelinestageflags2)
  (querypool vkquerypool)
  (query :uint32))

(cffi:defcfun ("vkQueueSubmit2" vkqueuesubmit2)
    vkresult
  (queue vkqueue)
  (submitcount :uint32)
  (psubmits :pointer)
  (fence vkfence))

(cffi:defcfun ("vkCmdCopyBuffer2" vkcmdcopybuffer2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybufferinfo :pointer))

(cffi:defcfun ("vkCmdCopyImage2" vkcmdcopyimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimageinfo :pointer))

(cffi:defcfun ("vkCmdCopyBufferToImage2" vkcmdcopybuffertoimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybuffertoimageinfo :pointer))

(cffi:defcfun ("vkCmdCopyImageToBuffer2" vkcmdcopyimagetobuffer2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimagetobufferinfo :pointer))

(cffi:defcfun ("vkCmdBlitImage2" vkcmdblitimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (pblitimageinfo :pointer))

(cffi:defcfun ("vkCmdResolveImage2" vkcmdresolveimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (presolveimageinfo :pointer))

(cffi:defcfun ("vkCmdBeginRendering" vkcmdbeginrendering)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderinginfo :pointer))

(cffi:defcfun ("vkCmdEndRendering" vkcmdendrendering)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkCmdSetCullMode" vkcmdsetcullmode)
    :void
  (commandbuffer vkcommandbuffer)
  (cullmode vkcullmodeflags))

(cffi:defcfun ("vkCmdSetFrontFace" vkcmdsetfrontface)
    :void
  (commandbuffer vkcommandbuffer)
  (frontface vkfrontface))

(cffi:defcfun ("vkCmdSetPrimitiveTopology" vkcmdsetprimitivetopology)
    :void
  (commandbuffer vkcommandbuffer)
  (primitivetopology vkprimitivetopology))

(cffi:defcfun ("vkCmdSetViewportWithCount" vkcmdsetviewportwithcount)
    :void
  (commandbuffer vkcommandbuffer)
  (viewportcount :uint32)
  (pviewports :pointer))

(cffi:defcfun ("vkCmdSetScissorWithCount" vkcmdsetscissorwithcount)
    :void
  (commandbuffer vkcommandbuffer)
  (scissorcount :uint32)
  (pscissors :pointer))

(cffi:defcfun ("vkCmdBindVertexBuffers2" vkcmdbindvertexbuffers2)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers :pointer)
  (poffsets :pointer)
  (psizes :pointer)
  (pstrides :pointer))

(cffi:defcfun ("vkCmdSetDepthTestEnable" vkcmdsetdepthtestenable)
    :void
  (commandbuffer vkcommandbuffer)
  (depthtestenable vkbool32))

(cffi:defcfun ("vkCmdSetDepthWriteEnable" vkcmdsetdepthwriteenable)
    :void
  (commandbuffer vkcommandbuffer)
  (depthwriteenable vkbool32))

(cffi:defcfun ("vkCmdSetDepthCompareOp" vkcmdsetdepthcompareop)
    :void
  (commandbuffer vkcommandbuffer)
  (depthcompareop vkcompareop))

(cffi:defcfun ("vkCmdSetDepthBoundsTestEnable" vkcmdsetdepthboundstestenable)
    :void
  (commandbuffer vkcommandbuffer)
  (depthboundstestenable vkbool32))

(cffi:defcfun ("vkCmdSetStencilTestEnable" vkcmdsetstenciltestenable)
    :void
  (commandbuffer vkcommandbuffer)
  (stenciltestenable vkbool32))

(cffi:defcfun ("vkCmdSetStencilOp" vkcmdsetstencilop)
    :void
  (commandbuffer vkcommandbuffer)
  (facemask vkstencilfaceflags)
  (failop vkstencilop)
  (passop vkstencilop)
  (depthfailop vkstencilop)
  (compareop vkcompareop))

(cffi:defcfun ("vkCmdSetRasterizerDiscardEnable"
               vkcmdsetrasterizerdiscardenable)
    :void
  (commandbuffer vkcommandbuffer)
  (rasterizerdiscardenable vkbool32))

(cffi:defcfun ("vkCmdSetDepthBiasEnable" vkcmdsetdepthbiasenable)
    :void
  (commandbuffer vkcommandbuffer)
  (depthbiasenable vkbool32))

(cffi:defcfun ("vkCmdSetPrimitiveRestartEnable" vkcmdsetprimitiverestartenable)
    :void
  (commandbuffer vkcommandbuffer)
  (primitiverestartenable vkbool32))

(cffi:defcfun ("vkGetDeviceBufferMemoryRequirements"
               vkgetdevicebuffermemoryrequirements)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkGetDeviceImageMemoryRequirements"
               vkgetdeviceimagememoryrequirements)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkGetDeviceImageSparseMemoryRequirements"
               vkgetdeviceimagesparsememoryrequirements)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (psparsememoryrequirementcount :pointer)
  (psparsememoryrequirements :pointer))

(cffi:defcfun ("vkDestroySurfaceKHR" vkdestroysurfacekhr)
    :void
  (instance vkinstance)
  (surface vksurfacekhr)
  (pallocator :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceSupportKHR"
               vkgetphysicaldevicesurfacesupportkhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (queuefamilyindex :uint32)
  (surface vksurfacekhr)
  (psupported :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilitiesKHR"
               vkgetphysicaldevicesurfacecapabilitieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (psurfacecapabilities :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceFormatsKHR"
               vkgetphysicaldevicesurfaceformatskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (psurfaceformatcount :pointer)
  (psurfaceformats :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceSurfacePresentModesKHR"
               vkgetphysicaldevicesurfacepresentmodeskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (ppresentmodecount :pointer)
  (ppresentmodes :pointer))

(cffi:defcfun ("vkCreateSwapchainKHR" vkcreateswapchainkhr)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pswapchain :pointer))

(cffi:defcfun ("vkDestroySwapchainKHR" vkdestroyswapchainkhr)
    :void
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (pallocator :pointer))

(cffi:defcfun ("vkGetSwapchainImagesKHR" vkgetswapchainimageskhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (pswapchainimagecount :pointer)
  (pswapchainimages :pointer))

(cffi:defcfun ("vkAcquireNextImageKHR" vkacquirenextimagekhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (timeout :uint64)
  (semaphore vksemaphore)
  (fence vkfence)
  (pimageindex :pointer))

(cffi:defcfun ("vkQueuePresentKHR" vkqueuepresentkhr)
    vkresult
  (queue vkqueue)
  (ppresentinfo :pointer))

(cffi:defcfun ("vkGetDeviceGroupPresentCapabilitiesKHR"
               vkgetdevicegrouppresentcapabilitieskhr)
    vkresult
  (device vkdevice)
  (pdevicegrouppresentcapabilities :pointer))

(cffi:defcfun ("vkGetDeviceGroupSurfacePresentModesKHR"
               vkgetdevicegroupsurfacepresentmodeskhr)
    vkresult
  (device vkdevice)
  (surface vksurfacekhr)
  (pmodes :pointer))

(cffi:defcfun ("vkGetPhysicalDevicePresentRectanglesKHR"
               vkgetphysicaldevicepresentrectangleskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (prectcount :pointer)
  (prects :pointer))

(cffi:defcfun ("vkAcquireNextImage2KHR" vkacquirenextimage2khr)
    vkresult
  (device vkdevice)
  (pacquireinfo :pointer)
  (pimageindex :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayPropertiesKHR"
               vkgetphysicaldevicedisplaypropertieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayPlanePropertiesKHR"
               vkgetphysicaldevicedisplayplanepropertieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkGetDisplayPlaneSupportedDisplaysKHR"
               vkgetdisplayplanesupporteddisplayskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (planeindex :uint32)
  (pdisplaycount :pointer)
  (pdisplays :pointer))

(cffi:defcfun ("vkGetDisplayModePropertiesKHR" vkgetdisplaymodepropertieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkCreateDisplayModeKHR" vkcreatedisplaymodekhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pmode :pointer))

(cffi:defcfun ("vkGetDisplayPlaneCapabilitiesKHR"
               vkgetdisplayplanecapabilitieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (mode vkdisplaymodekhr)
  (planeindex :uint32)
  (pcapabilities :pointer))

(cffi:defcfun ("vkCreateDisplayPlaneSurfaceKHR" vkcreatedisplayplanesurfacekhr)
    vkresult
  (instance vkinstance)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (psurface :pointer))

(cffi:defcfun ("vkCreateSharedSwapchainsKHR" vkcreatesharedswapchainskhr)
    vkresult
  (device vkdevice)
  (swapchaincount :uint32)
  (pcreateinfos :pointer)
  (pallocator :pointer)
  (pswapchains :pointer))

(cffi:defcfun ("vkCmdBeginRenderingKHR" vkcmdbeginrenderingkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderinginfo :pointer))

(cffi:defcfun ("vkCmdEndRenderingKHR" vkcmdendrenderingkhr)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkGetPhysicalDeviceFeatures2KHR"
               vkgetphysicaldevicefeatures2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pfeatures :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceProperties2KHR"
               vkgetphysicaldeviceproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceFormatProperties2KHR"
               vkgetphysicaldeviceformatproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (pformatproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties2KHR"
               vkgetphysicaldeviceimageformatproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pimageformatinfo :pointer)
  (pimageformatproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties2KHR"
               vkgetphysicaldevicequeuefamilyproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pqueuefamilypropertycount :pointer)
  (pqueuefamilyproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties2KHR"
               vkgetphysicaldevicememoryproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pmemoryproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties2KHR"
               vkgetphysicaldevicesparseimageformatproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pformatinfo :pointer)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkGetDeviceGroupPeerMemoryFeaturesKHR"
               vkgetdevicegrouppeermemoryfeatureskhr)
    :void
  (device vkdevice)
  (heapindex :uint32)
  (localdeviceindex :uint32)
  (remotedeviceindex :uint32)
  (ppeermemoryfeatures :pointer))

(cffi:defcfun ("vkCmdSetDeviceMaskKHR" vkcmdsetdevicemaskkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (devicemask :uint32))

(cffi:defcfun ("vkCmdDispatchBaseKHR" vkcmddispatchbasekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (basegroupx :uint32)
  (basegroupy :uint32)
  (basegroupz :uint32)
  (groupcountx :uint32)
  (groupcounty :uint32)
  (groupcountz :uint32))

(cffi:defcfun ("vkTrimCommandPoolKHR" vktrimcommandpoolkhr)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (flags vkcommandpooltrimflags))

(cffi:defcfun ("vkEnumeratePhysicalDeviceGroupsKHR"
               vkenumeratephysicaldevicegroupskhr)
    vkresult
  (instance vkinstance)
  (pphysicaldevicegroupcount :pointer)
  (pphysicaldevicegroupproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceExternalBufferPropertiesKHR"
               vkgetphysicaldeviceexternalbufferpropertieskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalbufferinfo :pointer)
  (pexternalbufferproperties :pointer))

(cffi:defcfun ("vkGetMemoryFdKHR" vkgetmemoryfdkhr)
    vkresult
  (device vkdevice)
  (pgetfdinfo :pointer)
  (pfd :pointer))

(cffi:defcfun ("vkGetMemoryFdPropertiesKHR" vkgetmemoryfdpropertieskhr)
    vkresult
  (device vkdevice)
  (handletype vkexternalmemoryhandletypeflagbits)
  (fd :int)
  (pmemoryfdproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceExternalSemaphorePropertiesKHR"
               vkgetphysicaldeviceexternalsemaphorepropertieskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalsemaphoreinfo :pointer)
  (pexternalsemaphoreproperties :pointer))

(cffi:defcfun ("vkImportSemaphoreFdKHR" vkimportsemaphorefdkhr)
    vkresult
  (device vkdevice)
  (pimportsemaphorefdinfo :pointer))

(cffi:defcfun ("vkGetSemaphoreFdKHR" vkgetsemaphorefdkhr)
    vkresult
  (device vkdevice)
  (pgetfdinfo :pointer)
  (pfd :pointer))

(cffi:defcfun ("vkCmdPushDescriptorSetKHR" vkcmdpushdescriptorsetkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinebindpoint vkpipelinebindpoint)
  (layout vkpipelinelayout)
  (set :uint32)
  (descriptorwritecount :uint32)
  (pdescriptorwrites :pointer))

(cffi:defcfun ("vkCmdPushDescriptorSetWithTemplateKHR"
               vkcmdpushdescriptorsetwithtemplatekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (layout vkpipelinelayout)
  (set :uint32)
  (pdata :pointer))

(cffi:defcfun ("vkCreateDescriptorUpdateTemplateKHR"
               vkcreatedescriptorupdatetemplatekhr)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pdescriptorupdatetemplate :pointer))

(cffi:defcfun ("vkDestroyDescriptorUpdateTemplateKHR"
               vkdestroydescriptorupdatetemplatekhr)
    :void
  (device vkdevice)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pallocator :pointer))

(cffi:defcfun ("vkUpdateDescriptorSetWithTemplateKHR"
               vkupdatedescriptorsetwithtemplatekhr)
    :void
  (device vkdevice)
  (descriptorset vkdescriptorset)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pdata :pointer))

(cffi:defcfun ("vkCreateRenderPass2KHR" vkcreaterenderpass2khr)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (prenderpass :pointer))

(cffi:defcfun ("vkCmdBeginRenderPass2KHR" vkcmdbeginrenderpass2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderpassbegin :pointer)
  (psubpassbegininfo :pointer))

(cffi:defcfun ("vkCmdNextSubpass2KHR" vkcmdnextsubpass2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassbegininfo :pointer)
  (psubpassendinfo :pointer))

(cffi:defcfun ("vkCmdEndRenderPass2KHR" vkcmdendrenderpass2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassendinfo :pointer))

(cffi:defcfun ("vkGetSwapchainStatusKHR" vkgetswapchainstatuskhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr))

(cffi:defcfun ("vkGetPhysicalDeviceExternalFencePropertiesKHR"
               vkgetphysicaldeviceexternalfencepropertieskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalfenceinfo :pointer)
  (pexternalfenceproperties :pointer))

(cffi:defcfun ("vkImportFenceFdKHR" vkimportfencefdkhr)
    vkresult
  (device vkdevice)
  (pimportfencefdinfo :pointer))

(cffi:defcfun ("vkGetFenceFdKHR" vkgetfencefdkhr)
    vkresult
  (device vkdevice)
  (pgetfdinfo :pointer)
  (pfd :pointer))

(cffi:defcfun ("vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR"
               vkenumeratephysicaldevicequeuefamilyperformancequerycounterskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (queuefamilyindex :uint32)
  (pcountercount :pointer)
  (pcounters :pointer)
  (pcounterdescriptions :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR"
               vkgetphysicaldevicequeuefamilyperformancequerypasseskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pperformancequerycreateinfo :pointer)
  (pnumpasses :pointer))

(cffi:defcfun ("vkAcquireProfilingLockKHR" vkacquireprofilinglockkhr)
    vkresult
  (device vkdevice)
  (pinfo :pointer))

(cffi:defcfun ("vkReleaseProfilingLockKHR" vkreleaseprofilinglockkhr)
    :void
  (device vkdevice))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilities2KHR"
               vkgetphysicaldevicesurfacecapabilities2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (psurfaceinfo :pointer)
  (psurfacecapabilities :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceFormats2KHR"
               vkgetphysicaldevicesurfaceformats2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (psurfaceinfo :pointer)
  (psurfaceformatcount :pointer)
  (psurfaceformats :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayProperties2KHR"
               vkgetphysicaldevicedisplayproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayPlaneProperties2KHR"
               vkgetphysicaldevicedisplayplaneproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkGetDisplayModeProperties2KHR" vkgetdisplaymodeproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkGetDisplayPlaneCapabilities2KHR"
               vkgetdisplayplanecapabilities2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pdisplayplaneinfo :pointer)
  (pcapabilities :pointer))

(cffi:defcfun ("vkGetImageMemoryRequirements2KHR"
               vkgetimagememoryrequirements2khr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkGetBufferMemoryRequirements2KHR"
               vkgetbuffermemoryrequirements2khr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkGetImageSparseMemoryRequirements2KHR"
               vkgetimagesparsememoryrequirements2khr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (psparsememoryrequirementcount :pointer)
  (psparsememoryrequirements :pointer))

(cffi:defcfun ("vkCreateSamplerYcbcrConversionKHR"
               vkcreatesamplerycbcrconversionkhr)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pycbcrconversion :pointer))

(cffi:defcfun ("vkDestroySamplerYcbcrConversionKHR"
               vkdestroysamplerycbcrconversionkhr)
    :void
  (device vkdevice)
  (ycbcrconversion vksamplerycbcrconversion)
  (pallocator :pointer))

(cffi:defcfun ("vkBindBufferMemory2KHR" vkbindbuffermemory2khr)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos :pointer))

(cffi:defcfun ("vkBindImageMemory2KHR" vkbindimagememory2khr)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos :pointer))

(cffi:defcfun ("vkGetDescriptorSetLayoutSupportKHR"
               vkgetdescriptorsetlayoutsupportkhr)
    :void
  (device vkdevice)
  (pcreateinfo :pointer)
  (psupport :pointer))

(cffi:defcfun ("vkCmdDrawIndirectCountKHR" vkcmddrawindirectcountkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawIndexedIndirectCountKHR"
               vkcmddrawindexedindirectcountkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkGetSemaphoreCounterValueKHR" vkgetsemaphorecountervaluekhr)
    vkresult
  (device vkdevice)
  (semaphore vksemaphore)
  (pvalue :pointer))

(cffi:defcfun ("vkWaitSemaphoresKHR" vkwaitsemaphoreskhr)
    vkresult
  (device vkdevice)
  (pwaitinfo :pointer)
  (timeout :uint64))

(cffi:defcfun ("vkSignalSemaphoreKHR" vksignalsemaphorekhr)
    vkresult
  (device vkdevice)
  (psignalinfo :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceFragmentShadingRatesKHR"
               vkgetphysicaldevicefragmentshadingrateskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pfragmentshadingratecount :pointer)
  (pfragmentshadingrates :pointer))

(cffi:defcfun ("vkCmdSetFragmentShadingRateKHR" vkcmdsetfragmentshadingratekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pfragmentsize :pointer)
  (combinerops vkfragmentshadingratecombineropkhr))

(cffi:defcfun ("vkWaitForPresentKHR" vkwaitforpresentkhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (presentid :uint64)
  (timeout :uint64))

(cffi:defcfun ("vkGetBufferDeviceAddressKHR" vkgetbufferdeviceaddresskhr)
    vkdeviceaddress
  (device vkdevice)
  (pinfo :pointer))

(cffi:defcfun ("vkGetBufferOpaqueCaptureAddressKHR"
               vkgetbufferopaquecaptureaddresskhr)
    :uint64
  (device vkdevice)
  (pinfo :pointer))

(cffi:defcfun ("vkGetDeviceMemoryOpaqueCaptureAddressKHR"
               vkgetdevicememoryopaquecaptureaddresskhr)
    :uint64
  (device vkdevice)
  (pinfo :pointer))

(cffi:defcfun ("vkCreateDeferredOperationKHR" vkcreatedeferredoperationkhr)
    vkresult
  (device vkdevice)
  (pallocator :pointer)
  (pdeferredoperation :pointer))

(cffi:defcfun ("vkDestroyDeferredOperationKHR" vkdestroydeferredoperationkhr)
    :void
  (device vkdevice)
  (operation vkdeferredoperationkhr)
  (pallocator :pointer))

(cffi:defcfun ("vkGetDeferredOperationMaxConcurrencyKHR"
               vkgetdeferredoperationmaxconcurrencykhr)
    :uint32
  (device vkdevice)
  (operation vkdeferredoperationkhr))

(cffi:defcfun ("vkGetDeferredOperationResultKHR"
               vkgetdeferredoperationresultkhr)
    vkresult
  (device vkdevice)
  (operation vkdeferredoperationkhr))

(cffi:defcfun ("vkDeferredOperationJoinKHR" vkdeferredoperationjoinkhr)
    vkresult
  (device vkdevice)
  (operation vkdeferredoperationkhr))

(cffi:defcfun ("vkGetPipelineExecutablePropertiesKHR"
               vkgetpipelineexecutablepropertieskhr)
    vkresult
  (device vkdevice)
  (ppipelineinfo :pointer)
  (pexecutablecount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkGetPipelineExecutableStatisticsKHR"
               vkgetpipelineexecutablestatisticskhr)
    vkresult
  (device vkdevice)
  (pexecutableinfo :pointer)
  (pstatisticcount :pointer)
  (pstatistics :pointer))

(cffi:defcfun ("vkGetPipelineExecutableInternalRepresentationsKHR"
               vkgetpipelineexecutableinternalrepresentationskhr)
    vkresult
  (device vkdevice)
  (pexecutableinfo :pointer)
  (pinternalrepresentationcount :pointer)
  (pinternalrepresentations :pointer))

(cffi:defcfun ("vkCmdSetEvent2KHR" vkcmdsetevent2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (pdependencyinfo :pointer))

(cffi:defcfun ("vkCmdResetEvent2KHR" vkcmdresetevent2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (stagemask vkpipelinestageflags2))

(cffi:defcfun ("vkCmdWaitEvents2KHR" vkcmdwaitevents2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (eventcount :uint32)
  (pevents :pointer)
  (pdependencyinfos :pointer))

(cffi:defcfun ("vkCmdPipelineBarrier2KHR" vkcmdpipelinebarrier2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pdependencyinfo :pointer))

(cffi:defcfun ("vkCmdWriteTimestamp2KHR" vkcmdwritetimestamp2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (stage vkpipelinestageflags2)
  (querypool vkquerypool)
  (query :uint32))

(cffi:defcfun ("vkQueueSubmit2KHR" vkqueuesubmit2khr)
    vkresult
  (queue vkqueue)
  (submitcount :uint32)
  (psubmits :pointer)
  (fence vkfence))

(cffi:defcfun ("vkCmdWriteBufferMarker2AMD" vkcmdwritebuffermarker2amd)
    :void
  (commandbuffer vkcommandbuffer)
  (stage vkpipelinestageflags2)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (marker :uint32))

(cffi:defcfun ("vkGetQueueCheckpointData2NV" vkgetqueuecheckpointdata2nv)
    :void
  (queue vkqueue)
  (pcheckpointdatacount :pointer)
  (pcheckpointdata :pointer))

(cffi:defcfun ("vkCmdCopyBuffer2KHR" vkcmdcopybuffer2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybufferinfo :pointer))

(cffi:defcfun ("vkCmdCopyImage2KHR" vkcmdcopyimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimageinfo :pointer))

(cffi:defcfun ("vkCmdCopyBufferToImage2KHR" vkcmdcopybuffertoimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybuffertoimageinfo :pointer))

(cffi:defcfun ("vkCmdCopyImageToBuffer2KHR" vkcmdcopyimagetobuffer2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimagetobufferinfo :pointer))

(cffi:defcfun ("vkCmdBlitImage2KHR" vkcmdblitimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pblitimageinfo :pointer))

(cffi:defcfun ("vkCmdResolveImage2KHR" vkcmdresolveimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (presolveimageinfo :pointer))

(cffi:defcfun ("vkCmdTraceRaysIndirect2KHR" vkcmdtraceraysindirect2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (indirectdeviceaddress vkdeviceaddress))

(cffi:defcfun ("vkGetDeviceBufferMemoryRequirementsKHR"
               vkgetdevicebuffermemoryrequirementskhr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkGetDeviceImageMemoryRequirementsKHR"
               vkgetdeviceimagememoryrequirementskhr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkGetDeviceImageSparseMemoryRequirementsKHR"
               vkgetdeviceimagesparsememoryrequirementskhr)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (psparsememoryrequirementcount :pointer)
  (psparsememoryrequirements :pointer))

(cffi:defcfun ("vkCreateDebugReportCallbackEXT" vkcreatedebugreportcallbackext)
    vkresult
  (instance vkinstance)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pcallback :pointer))

(cffi:defcfun ("vkDestroyDebugReportCallbackEXT"
               vkdestroydebugreportcallbackext)
    :void
  (instance vkinstance)
  (callback vkdebugreportcallbackext)
  (pallocator :pointer))

(cffi:defcfun ("vkDebugReportMessageEXT" vkdebugreportmessageext)
    :void
  (instance vkinstance)
  (flags vkdebugreportflagsext)
  (objecttype vkdebugreportobjecttypeext)
  (object :uint64)
  (location :size)
  (messagecode :int32)
  (playerprefix :pointer)
  (pmessage :pointer))

(cffi:defcfun ("vkDebugMarkerSetObjectTagEXT" vkdebugmarkersetobjecttagext)
    vkresult
  (device vkdevice)
  (ptaginfo :pointer))

(cffi:defcfun ("vkDebugMarkerSetObjectNameEXT" vkdebugmarkersetobjectnameext)
    vkresult
  (device vkdevice)
  (pnameinfo :pointer))

(cffi:defcfun ("vkCmdDebugMarkerBeginEXT" vkcmddebugmarkerbeginext)
    :void
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo :pointer))

(cffi:defcfun ("vkCmdDebugMarkerEndEXT" vkcmddebugmarkerendext)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkCmdDebugMarkerInsertEXT" vkcmddebugmarkerinsertext)
    :void
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo :pointer))

(cffi:defcfun ("vkCmdBindTransformFeedbackBuffersEXT"
               vkcmdbindtransformfeedbackbuffersext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers :pointer)
  (poffsets :pointer)
  (psizes :pointer))

(cffi:defcfun ("vkCmdBeginTransformFeedbackEXT" vkcmdbegintransformfeedbackext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstcounterbuffer :uint32)
  (counterbuffercount :uint32)
  (pcounterbuffers :pointer)
  (pcounterbufferoffsets :pointer))

(cffi:defcfun ("vkCmdEndTransformFeedbackEXT" vkcmdendtransformfeedbackext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstcounterbuffer :uint32)
  (counterbuffercount :uint32)
  (pcounterbuffers :pointer)
  (pcounterbufferoffsets :pointer))

(cffi:defcfun ("vkCmdBeginQueryIndexedEXT" vkcmdbeginqueryindexedext)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (query :uint32)
  (flags vkquerycontrolflags)
  (index :uint32))

(cffi:defcfun ("vkCmdEndQueryIndexedEXT" vkcmdendqueryindexedext)
    :void
  (commandbuffer vkcommandbuffer)
  (querypool vkquerypool)
  (query :uint32)
  (index :uint32))

(cffi:defcfun ("vkCmdDrawIndirectByteCountEXT" vkcmddrawindirectbytecountext)
    :void
  (commandbuffer vkcommandbuffer)
  (instancecount :uint32)
  (firstinstance :uint32)
  (counterbuffer vkbuffer)
  (counterbufferoffset vkdevicesize)
  (counteroffset :uint32)
  (vertexstride :uint32))

(cffi:defcfun ("vkCreateCuModuleNVX" vkcreatecumodulenvx)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pmodule :pointer))

(cffi:defcfun ("vkCreateCuFunctionNVX" vkcreatecufunctionnvx)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pfunction :pointer))

(cffi:defcfun ("vkDestroyCuModuleNVX" vkdestroycumodulenvx)
    :void
  (device vkdevice)
  (module vkcumodulenvx)
  (pallocator :pointer))

(cffi:defcfun ("vkDestroyCuFunctionNVX" vkdestroycufunctionnvx)
    :void
  (device vkdevice)
  #'vkcufunctionnvx
  (pallocator :pointer))

(cffi:defcfun ("vkCmdCuLaunchKernelNVX" vkcmdculaunchkernelnvx)
    :void
  (commandbuffer vkcommandbuffer)
  (plaunchinfo :pointer))

(cffi:defcfun ("vkGetImageViewHandleNVX" vkgetimageviewhandlenvx)
    :uint32
  (device vkdevice)
  (pinfo :pointer))

(cffi:defcfun ("vkGetImageViewAddressNVX" vkgetimageviewaddressnvx)
    vkresult
  (device vkdevice)
  (imageview vkimageview)
  (pproperties :pointer))

(cffi:defcfun ("vkCmdDrawIndirectCountAMD" vkcmddrawindirectcountamd)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawIndexedIndirectCountAMD"
               vkcmddrawindexedindirectcountamd)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkGetShaderInfoAMD" vkgetshaderinfoamd)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (shaderstage vkshaderstageflagbits)
  (infotype vkshaderinfotypeamd)
  (pinfosize :pointer)
  (pinfo :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceExternalImageFormatPropertiesNV"
               vkgetphysicaldeviceexternalimageformatpropertiesnv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (type vkimagetype)
  (tiling vkimagetiling)
  (usage vkimageusageflags)
  (flags vkimagecreateflags)
  (externalhandletype vkexternalmemoryhandletypeflagsnv)
  (pexternalimageformatproperties :pointer))

(cffi:defcfun ("vkCmdBeginConditionalRenderingEXT"
               vkcmdbeginconditionalrenderingext)
    :void
  (commandbuffer vkcommandbuffer)
  (pconditionalrenderingbegin :pointer))

(cffi:defcfun ("vkCmdEndConditionalRenderingEXT"
               vkcmdendconditionalrenderingext)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkCmdSetViewportWScalingNV" vkcmdsetviewportwscalingnv)
    :void
  (commandbuffer vkcommandbuffer)
  (firstviewport :uint32)
  (viewportcount :uint32)
  (pviewportwscalings :pointer))

(cffi:defcfun ("vkReleaseDisplayEXT" vkreleasedisplayext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilities2EXT"
               vkgetphysicaldevicesurfacecapabilities2ext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (psurfacecapabilities :pointer))

(cffi:defcfun ("vkDisplayPowerControlEXT" vkdisplaypowercontrolext)
    vkresult
  (device vkdevice)
  (display vkdisplaykhr)
  (pdisplaypowerinfo :pointer))

(cffi:defcfun ("vkRegisterDeviceEventEXT" vkregisterdeviceeventext)
    vkresult
  (device vkdevice)
  (pdeviceeventinfo :pointer)
  (pallocator :pointer)
  (pfence :pointer))

(cffi:defcfun ("vkRegisterDisplayEventEXT" vkregisterdisplayeventext)
    vkresult
  (device vkdevice)
  (display vkdisplaykhr)
  (pdisplayeventinfo :pointer)
  (pallocator :pointer)
  (pfence :pointer))

(cffi:defcfun ("vkGetSwapchainCounterEXT" vkgetswapchaincounterext)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (counter vksurfacecounterflagbitsext)
  (pcountervalue :pointer))

(cffi:defcfun ("vkGetRefreshCycleDurationGOOGLE"
               vkgetrefreshcycledurationgoogle)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (pdisplaytimingproperties :pointer))

(cffi:defcfun ("vkGetPastPresentationTimingGOOGLE"
               vkgetpastpresentationtiminggoogle)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (ppresentationtimingcount :pointer)
  (ppresentationtimings :pointer))

(cffi:defcfun ("vkCmdSetDiscardRectangleEXT" vkcmdsetdiscardrectangleext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstdiscardrectangle :uint32)
  (discardrectanglecount :uint32)
  (pdiscardrectangles :pointer))

(cffi:defcfun ("vkSetHdrMetadataEXT" vksethdrmetadataext)
    :void
  (device vkdevice)
  (swapchaincount :uint32)
  (pswapchains :pointer)
  (pmetadata :pointer))

(cffi:defcfun ("vkSetDebugUtilsObjectNameEXT" vksetdebugutilsobjectnameext)
    vkresult
  (device vkdevice)
  (pnameinfo :pointer))

(cffi:defcfun ("vkSetDebugUtilsObjectTagEXT" vksetdebugutilsobjecttagext)
    vkresult
  (device vkdevice)
  (ptaginfo :pointer))

(cffi:defcfun ("vkQueueBeginDebugUtilsLabelEXT" vkqueuebegindebugutilslabelext)
    :void
  (queue vkqueue)
  (plabelinfo :pointer))

(cffi:defcfun ("vkQueueEndDebugUtilsLabelEXT" vkqueueenddebugutilslabelext)
    :void
  (queue vkqueue))

(cffi:defcfun ("vkQueueInsertDebugUtilsLabelEXT"
               vkqueueinsertdebugutilslabelext)
    :void
  (queue vkqueue)
  (plabelinfo :pointer))

(cffi:defcfun ("vkCmdBeginDebugUtilsLabelEXT" vkcmdbegindebugutilslabelext)
    :void
  (commandbuffer vkcommandbuffer)
  (plabelinfo :pointer))

(cffi:defcfun ("vkCmdEndDebugUtilsLabelEXT" vkcmdenddebugutilslabelext)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkCmdInsertDebugUtilsLabelEXT" vkcmdinsertdebugutilslabelext)
    :void
  (commandbuffer vkcommandbuffer)
  (plabelinfo :pointer))

(cffi:defcfun ("vkCreateDebugUtilsMessengerEXT" vkcreatedebugutilsmessengerext)
    vkresult
  (instance vkinstance)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pmessenger :pointer))

(cffi:defcfun ("vkDestroyDebugUtilsMessengerEXT"
               vkdestroydebugutilsmessengerext)
    :void
  (instance vkinstance)
  (messenger vkdebugutilsmessengerext)
  (pallocator :pointer))

(cffi:defcfun ("vkSubmitDebugUtilsMessageEXT" vksubmitdebugutilsmessageext)
    :void
  (instance vkinstance)
  (messageseverity vkdebugutilsmessageseverityflagbitsext)
  (messagetypes vkdebugutilsmessagetypeflagsext)
  (pcallbackdata :pointer))

(cffi:defcfun ("vkCmdSetSampleLocationsEXT" vkcmdsetsamplelocationsext)
    :void
  (commandbuffer vkcommandbuffer)
  (psamplelocationsinfo :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceMultisamplePropertiesEXT"
               vkgetphysicaldevicemultisamplepropertiesext)
    :void
  (physicaldevice vkphysicaldevice)
  (samples vksamplecountflagbits)
  (pmultisampleproperties :pointer))

(cffi:defcfun ("vkGetImageDrmFormatModifierPropertiesEXT"
               vkgetimagedrmformatmodifierpropertiesext)
    vkresult
  (device vkdevice)
  (image vkimage)
  (pproperties :pointer))

(cffi:defcfun ("vkCreateValidationCacheEXT" vkcreatevalidationcacheext)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pvalidationcache :pointer))

(cffi:defcfun ("vkDestroyValidationCacheEXT" vkdestroyvalidationcacheext)
    :void
  (device vkdevice)
  (validationcache vkvalidationcacheext)
  (pallocator :pointer))

(cffi:defcfun ("vkMergeValidationCachesEXT" vkmergevalidationcachesext)
    vkresult
  (device vkdevice)
  (dstcache vkvalidationcacheext)
  (srccachecount :uint32)
  (psrccaches :pointer))

(cffi:defcfun ("vkGetValidationCacheDataEXT" vkgetvalidationcachedataext)
    vkresult
  (device vkdevice)
  (validationcache vkvalidationcacheext)
  (pdatasize :pointer)
  (pdata :pointer))

(cffi:defcfun ("vkCmdBindShadingRateImageNV" vkcmdbindshadingrateimagenv)
    :void
  (commandbuffer vkcommandbuffer)
  (imageview vkimageview)
  (imagelayout vkimagelayout))

(cffi:defcfun ("vkCmdSetViewportShadingRatePaletteNV"
               vkcmdsetviewportshadingratepalettenv)
    :void
  (commandbuffer vkcommandbuffer)
  (firstviewport :uint32)
  (viewportcount :uint32)
  (pshadingratepalettes :pointer))

(cffi:defcfun ("vkCmdSetCoarseSampleOrderNV" vkcmdsetcoarsesampleordernv)
    :void
  (commandbuffer vkcommandbuffer)
  (sampleordertype vkcoarsesampleordertypenv)
  (customsampleordercount :uint32)
  (pcustomsampleorders :pointer))

(cffi:defcfun ("vkCreateAccelerationStructureNV"
               vkcreateaccelerationstructurenv)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (paccelerationstructure :pointer))

(cffi:defcfun ("vkDestroyAccelerationStructureNV"
               vkdestroyaccelerationstructurenv)
    :void
  (device vkdevice)
  (accelerationstructure vkaccelerationstructurenv)
  (pallocator :pointer))

(cffi:defcfun ("vkGetAccelerationStructureMemoryRequirementsNV"
               vkgetaccelerationstructurememoryrequirementsnv)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkBindAccelerationStructureMemoryNV"
               vkbindaccelerationstructurememorynv)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos :pointer))

(cffi:defcfun ("vkCmdBuildAccelerationStructureNV"
               vkcmdbuildaccelerationstructurenv)
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

(cffi:defcfun ("vkCmdCopyAccelerationStructureNV"
               vkcmdcopyaccelerationstructurenv)
    :void
  (commandbuffer vkcommandbuffer)
  (dst vkaccelerationstructurenv)
  (src vkaccelerationstructurenv)
  (mode vkcopyaccelerationstructuremodekhr))

(cffi:defcfun ("vkCmdTraceRaysNV" vkcmdtraceraysnv)
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

(cffi:defcfun ("vkCreateRayTracingPipelinesNV" vkcreateraytracingpipelinesnv)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos :pointer)
  (pallocator :pointer)
  (ppipelines :pointer))

(cffi:defcfun ("vkGetRayTracingShaderGroupHandlesKHR"
               vkgetraytracingshadergrouphandleskhr)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (firstgroup :uint32)
  (groupcount :uint32)
  (datasize :size)
  (pdata :pointer))

(cffi:defcfun ("vkGetRayTracingShaderGroupHandlesNV"
               vkgetraytracingshadergrouphandlesnv)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (firstgroup :uint32)
  (groupcount :uint32)
  (datasize :size)
  (pdata :pointer))

(cffi:defcfun ("vkGetAccelerationStructureHandleNV"
               vkgetaccelerationstructurehandlenv)
    vkresult
  (device vkdevice)
  (accelerationstructure vkaccelerationstructurenv)
  (datasize :size)
  (pdata :pointer))

(cffi:defcfun ("vkCmdWriteAccelerationStructuresPropertiesNV"
               vkcmdwriteaccelerationstructurespropertiesnv)
    :void
  (commandbuffer vkcommandbuffer)
  (accelerationstructurecount :uint32)
  (paccelerationstructures :pointer)
  (querytype vkquerytype)
  (querypool vkquerypool)
  (firstquery :uint32))

(cffi:defcfun ("vkCompileDeferredNV" vkcompiledeferrednv)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (shader :uint32))

(cffi:defcfun ("vkGetMemoryHostPointerPropertiesEXT"
               vkgetmemoryhostpointerpropertiesext)
    vkresult
  (device vkdevice)
  (handletype vkexternalmemoryhandletypeflagbits)
  (phostpointer :pointer)
  (pmemoryhostpointerproperties :pointer))

(cffi:defcfun ("vkCmdWriteBufferMarkerAMD" vkcmdwritebuffermarkeramd)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinestage vkpipelinestageflagbits)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (marker :uint32))

(cffi:defcfun ("vkGetPhysicalDeviceCalibrateableTimeDomainsEXT"
               vkgetphysicaldevicecalibrateabletimedomainsext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ptimedomaincount :pointer)
  (ptimedomains :pointer))

(cffi:defcfun ("vkGetCalibratedTimestampsEXT" vkgetcalibratedtimestampsext)
    vkresult
  (device vkdevice)
  (timestampcount :uint32)
  (ptimestampinfos :pointer)
  (ptimestamps :pointer)
  (pmaxdeviation :pointer))

(cffi:defcfun ("vkCmdDrawMeshTasksNV" vkcmddrawmeshtasksnv)
    :void
  (commandbuffer vkcommandbuffer)
  (taskcount :uint32)
  (firsttask :uint32))

(cffi:defcfun ("vkCmdDrawMeshTasksIndirectNV" vkcmddrawmeshtasksindirectnv)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (drawcount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawMeshTasksIndirectCountNV"
               vkcmddrawmeshtasksindirectcountnv)
    :void
  (commandbuffer vkcommandbuffer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (countbuffer vkbuffer)
  (countbufferoffset vkdevicesize)
  (maxdrawcount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdSetExclusiveScissorNV" vkcmdsetexclusivescissornv)
    :void
  (commandbuffer vkcommandbuffer)
  (firstexclusivescissor :uint32)
  (exclusivescissorcount :uint32)
  (pexclusivescissors :pointer))

(cffi:defcfun ("vkCmdSetCheckpointNV" vkcmdsetcheckpointnv)
    :void
  (commandbuffer vkcommandbuffer)
  (pcheckpointmarker :pointer))

(cffi:defcfun ("vkGetQueueCheckpointDataNV" vkgetqueuecheckpointdatanv)
    :void
  (queue vkqueue)
  (pcheckpointdatacount :pointer)
  (pcheckpointdata :pointer))

(cffi:defcfun ("vkInitializePerformanceApiINTEL"
               vkinitializeperformanceapiintel)
    vkresult
  (device vkdevice)
  (pinitializeinfo :pointer))

(cffi:defcfun ("vkUninitializePerformanceApiINTEL"
               vkuninitializeperformanceapiintel)
    :void
  (device vkdevice))

(cffi:defcfun ("vkCmdSetPerformanceMarkerINTEL" vkcmdsetperformancemarkerintel)
    vkresult
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo :pointer))

(cffi:defcfun ("vkCmdSetPerformanceStreamMarkerINTEL"
               vkcmdsetperformancestreammarkerintel)
    vkresult
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo :pointer))

(cffi:defcfun ("vkCmdSetPerformanceOverrideINTEL"
               vkcmdsetperformanceoverrideintel)
    vkresult
  (commandbuffer vkcommandbuffer)
  (poverrideinfo :pointer))

(cffi:defcfun ("vkAcquirePerformanceConfigurationINTEL"
               vkacquireperformanceconfigurationintel)
    vkresult
  (device vkdevice)
  (pacquireinfo :pointer)
  (pconfiguration :pointer))

(cffi:defcfun ("vkReleasePerformanceConfigurationINTEL"
               vkreleaseperformanceconfigurationintel)
    vkresult
  (device vkdevice)
  (configuration vkperformanceconfigurationintel))

(cffi:defcfun ("vkQueueSetPerformanceConfigurationINTEL"
               vkqueuesetperformanceconfigurationintel)
    vkresult
  (queue vkqueue)
  (configuration vkperformanceconfigurationintel))

(cffi:defcfun ("vkGetPerformanceParameterINTEL" vkgetperformanceparameterintel)
    vkresult
  (device vkdevice)
  (parameter vkperformanceparametertypeintel)
  (pvalue :pointer))

(cffi:defcfun ("vkSetLocalDimmingAMD" vksetlocaldimmingamd)
    :void
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (localdimmingenable vkbool32))

(cffi:defcfun ("vkGetBufferDeviceAddressEXT" vkgetbufferdeviceaddressext)
    vkdeviceaddress
  (device vkdevice)
  (pinfo :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceToolPropertiesEXT"
               vkgetphysicaldevicetoolpropertiesext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ptoolcount :pointer)
  (ptoolproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV"
               vkgetphysicaldevicecooperativematrixpropertiesnv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount :pointer)
  (pproperties :pointer))

(cffi:defcfun ("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV"
               vkgetphysicaldevicesupportedframebuffermixedsamplescombinationsnv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pcombinationcount :pointer)
  (pcombinations :pointer))

(cffi:defcfun ("vkCreateHeadlessSurfaceEXT" vkcreateheadlesssurfaceext)
    vkresult
  (instance vkinstance)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (psurface :pointer))

(cffi:defcfun ("vkCmdSetLineStippleEXT" vkcmdsetlinestippleext)
    :void
  (commandbuffer vkcommandbuffer)
  (linestipplefactor :uint32)
  (linestipplepattern :uint16))

(cffi:defcfun ("vkResetQueryPoolEXT" vkresetquerypoolext)
    :void
  (device vkdevice)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32))

(cffi:defcfun ("vkCmdSetCullModeEXT" vkcmdsetcullmodeext)
    :void
  (commandbuffer vkcommandbuffer)
  (cullmode vkcullmodeflags))

(cffi:defcfun ("vkCmdSetFrontFaceEXT" vkcmdsetfrontfaceext)
    :void
  (commandbuffer vkcommandbuffer)
  (frontface vkfrontface))

(cffi:defcfun ("vkCmdSetPrimitiveTopologyEXT" vkcmdsetprimitivetopologyext)
    :void
  (commandbuffer vkcommandbuffer)
  (primitivetopology vkprimitivetopology))

(cffi:defcfun ("vkCmdSetViewportWithCountEXT" vkcmdsetviewportwithcountext)
    :void
  (commandbuffer vkcommandbuffer)
  (viewportcount :uint32)
  (pviewports :pointer))

(cffi:defcfun ("vkCmdSetScissorWithCountEXT" vkcmdsetscissorwithcountext)
    :void
  (commandbuffer vkcommandbuffer)
  (scissorcount :uint32)
  (pscissors :pointer))

(cffi:defcfun ("vkCmdBindVertexBuffers2EXT" vkcmdbindvertexbuffers2ext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers :pointer)
  (poffsets :pointer)
  (psizes :pointer)
  (pstrides :pointer))

(cffi:defcfun ("vkCmdSetDepthTestEnableEXT" vkcmdsetdepthtestenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (depthtestenable vkbool32))

(cffi:defcfun ("vkCmdSetDepthWriteEnableEXT" vkcmdsetdepthwriteenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (depthwriteenable vkbool32))

(cffi:defcfun ("vkCmdSetDepthCompareOpEXT" vkcmdsetdepthcompareopext)
    :void
  (commandbuffer vkcommandbuffer)
  (depthcompareop vkcompareop))

(cffi:defcfun ("vkCmdSetDepthBoundsTestEnableEXT"
               vkcmdsetdepthboundstestenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (depthboundstestenable vkbool32))

(cffi:defcfun ("vkCmdSetStencilTestEnableEXT" vkcmdsetstenciltestenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (stenciltestenable vkbool32))

(cffi:defcfun ("vkCmdSetStencilOpEXT" vkcmdsetstencilopext)
    :void
  (commandbuffer vkcommandbuffer)
  (facemask vkstencilfaceflags)
  (failop vkstencilop)
  (passop vkstencilop)
  (depthfailop vkstencilop)
  (compareop vkcompareop))

(cffi:defcfun ("vkGetGeneratedCommandsMemoryRequirementsNV"
               vkgetgeneratedcommandsmemoryrequirementsnv)
    :void
  (device vkdevice)
  (pinfo :pointer)
  (pmemoryrequirements :pointer))

(cffi:defcfun ("vkCmdPreprocessGeneratedCommandsNV"
               vkcmdpreprocessgeneratedcommandsnv)
    :void
  (commandbuffer vkcommandbuffer)
  (pgeneratedcommandsinfo :pointer))

(cffi:defcfun ("vkCmdExecuteGeneratedCommandsNV"
               vkcmdexecutegeneratedcommandsnv)
    :void
  (commandbuffer vkcommandbuffer)
  (ispreprocessed vkbool32)
  (pgeneratedcommandsinfo :pointer))

(cffi:defcfun ("vkCmdBindPipelineShaderGroupNV" vkcmdbindpipelineshadergroupnv)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinebindpoint vkpipelinebindpoint)
  (pipeline vkpipeline)
  (groupindex :uint32))

(cffi:defcfun ("vkCreateIndirectCommandsLayoutNV"
               vkcreateindirectcommandslayoutnv)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pindirectcommandslayout :pointer))

(cffi:defcfun ("vkDestroyIndirectCommandsLayoutNV"
               vkdestroyindirectcommandslayoutnv)
    :void
  (device vkdevice)
  (indirectcommandslayout vkindirectcommandslayoutnv)
  (pallocator :pointer))

(cffi:defcfun ("vkAcquireDrmDisplayEXT" vkacquiredrmdisplayext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (drmfd :int32)
  (display vkdisplaykhr))

(cffi:defcfun ("vkGetDrmDisplayEXT" vkgetdrmdisplayext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (drmfd :int32)
  (connectorid :uint32)
  (display :pointer))

(cffi:defcfun ("vkCreatePrivateDataSlotEXT" vkcreateprivatedataslotext)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (pprivatedataslot :pointer))

(cffi:defcfun ("vkDestroyPrivateDataSlotEXT" vkdestroyprivatedataslotext)
    :void
  (device vkdevice)
  (privatedataslot vkprivatedataslot)
  (pallocator :pointer))

(cffi:defcfun ("vkSetPrivateDataEXT" vksetprivatedataext)
    vkresult
  (device vkdevice)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (privatedataslot vkprivatedataslot)
  (data :uint64))

(cffi:defcfun ("vkGetPrivateDataEXT" vkgetprivatedataext)
    :void
  (device vkdevice)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (privatedataslot vkprivatedataslot)
  (pdata :pointer))

(cffi:defcfun ("vkCmdSetFragmentShadingRateEnumNV"
               vkcmdsetfragmentshadingrateenumnv)
    :void
  (commandbuffer vkcommandbuffer)
  (shadingrate vkfragmentshadingratenv)
  (combinerops vkfragmentshadingratecombineropkhr))

(cffi:defcfun ("vkGetImageSubresourceLayout2EXT"
               vkgetimagesubresourcelayout2ext)
    :void
  (device vkdevice)
  (image vkimage)
  (psubresource :pointer)
  (playout :pointer))

(cffi:defcfun ("vkAcquireWinrtDisplayNV" vkacquirewinrtdisplaynv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr))

(cffi:defcfun ("vkGetWinrtDisplayNV" vkgetwinrtdisplaynv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (devicerelativeid :uint32)
  (pdisplay :pointer))

(cffi:defcfun ("vkCmdSetVertexInputEXT" vkcmdsetvertexinputext)
    :void
  (commandbuffer vkcommandbuffer)
  (vertexbindingdescriptioncount :uint32)
  (pvertexbindingdescriptions :pointer)
  (vertexattributedescriptioncount :uint32)
  (pvertexattributedescriptions :pointer))

(cffi:defcfun ("vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI"
               vkgetdevicesubpassshadingmaxworkgroupsizehuawei)
    vkresult
  (device vkdevice)
  (renderpass vkrenderpass)
  (pmaxworkgroupsize :pointer))

(cffi:defcfun ("vkCmdSubpassShadingHUAWEI" vkcmdsubpassshadinghuawei)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkCmdBindInvocationMaskHUAWEI" vkcmdbindinvocationmaskhuawei)
    :void
  (commandbuffer vkcommandbuffer)
  (imageview vkimageview)
  (imagelayout vkimagelayout))

(cffi:defcfun ("vkGetMemoryRemoteAddressNV" vkgetmemoryremoteaddressnv)
    vkresult
  (device vkdevice)
  (pmemorygetremoteaddressinfo :pointer)
  (paddress :pointer))

(cffi:defcfun ("vkGetPipelinePropertiesEXT" vkgetpipelinepropertiesext)
    vkresult
  (device vkdevice)
  (ppipelineinfo :pointer)
  (ppipelineproperties :pointer))

(cffi:defcfun ("vkCmdSetPatchControlPointsEXT" vkcmdsetpatchcontrolpointsext)
    :void
  (commandbuffer vkcommandbuffer)
  (patchcontrolpoints :uint32))

(cffi:defcfun ("vkCmdSetRasterizerDiscardEnableEXT"
               vkcmdsetrasterizerdiscardenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (rasterizerdiscardenable vkbool32))

(cffi:defcfun ("vkCmdSetDepthBiasEnableEXT" vkcmdsetdepthbiasenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (depthbiasenable vkbool32))

(cffi:defcfun ("vkCmdSetLogicOpEXT" vkcmdsetlogicopext)
    :void
  (commandbuffer vkcommandbuffer)
  (logicop vklogicop))

(cffi:defcfun ("vkCmdSetPrimitiveRestartEnableEXT"
               vkcmdsetprimitiverestartenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (primitiverestartenable vkbool32))

(cffi:defcfun ("vkCmdSetColorWriteEnableEXT" vkcmdsetcolorwriteenableext)
    :void
  (commandbuffer vkcommandbuffer)
  (attachmentcount :uint32)
  (pcolorwriteenables :pointer))

(cffi:defcfun ("vkCmdDrawMultiEXT" vkcmddrawmultiext)
    :void
  (commandbuffer vkcommandbuffer)
  (drawcount :uint32)
  (pvertexinfo :pointer)
  (instancecount :uint32)
  (firstinstance :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawMultiIndexedEXT" vkcmddrawmultiindexedext)
    :void
  (commandbuffer vkcommandbuffer)
  (drawcount :uint32)
  (pindexinfo :pointer)
  (instancecount :uint32)
  (firstinstance :uint32)
  (stride :uint32)
  (pvertexoffset :pointer))

(cffi:defcfun ("vkSetDeviceMemoryPriorityEXT" vksetdevicememorypriorityext)
    :void
  (device vkdevice)
  (memory vkdevicememory)
  (priority :float))

(cffi:defcfun ("vkGetDescriptorSetLayoutHostMappingInfoVALVE"
               vkgetdescriptorsetlayouthostmappinginfovalve)
    :void
  (device vkdevice)
  (pbindingreference :pointer)
  (phostmapping :pointer))

(cffi:defcfun ("vkGetDescriptorSetHostMappingVALVE"
               vkgetdescriptorsethostmappingvalve)
    :void
  (device vkdevice)
  (descriptorset vkdescriptorset)
  (ppdata :pointer))

(cffi:defcfun ("vkCreateAccelerationStructureKHR"
               vkcreateaccelerationstructurekhr)
    vkresult
  (device vkdevice)
  (pcreateinfo :pointer)
  (pallocator :pointer)
  (paccelerationstructure :pointer))

(cffi:defcfun ("vkDestroyAccelerationStructureKHR"
               vkdestroyaccelerationstructurekhr)
    :void
  (device vkdevice)
  (accelerationstructure vkaccelerationstructurekhr)
  (pallocator :pointer))

(cffi:defcfun ("vkCmdBuildAccelerationStructuresKHR"
               vkcmdbuildaccelerationstructureskhr)
    :void
  (commandbuffer vkcommandbuffer)
  (infocount :uint32)
  (pinfos :pointer)
  (ppbuildrangeinfos :pointer))

(cffi:defcfun ("vkCmdBuildAccelerationStructuresIndirectKHR"
               vkcmdbuildaccelerationstructuresindirectkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (infocount :uint32)
  (pinfos :pointer)
  (pindirectdeviceaddresses :pointer)
  (pindirectstrides :pointer)
  (ppmaxprimitivecounts :pointer))

(cffi:defcfun ("vkBuildAccelerationStructuresKHR"
               vkbuildaccelerationstructureskhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (infocount :uint32)
  (pinfos :pointer)
  (ppbuildrangeinfos :pointer))

(cffi:defcfun ("vkCopyAccelerationStructureKHR" vkcopyaccelerationstructurekhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pinfo :pointer))

(cffi:defcfun ("vkCopyAccelerationStructureToMemoryKHR"
               vkcopyaccelerationstructuretomemorykhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pinfo :pointer))

(cffi:defcfun ("vkCopyMemoryToAccelerationStructureKHR"
               vkcopymemorytoaccelerationstructurekhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pinfo :pointer))

(cffi:defcfun ("vkWriteAccelerationStructuresPropertiesKHR"
               vkwriteaccelerationstructurespropertieskhr)
    vkresult
  (device vkdevice)
  (accelerationstructurecount :uint32)
  (paccelerationstructures :pointer)
  (querytype vkquerytype)
  (datasize :size)
  (pdata :pointer)
  (stride :size))

(cffi:defcfun ("vkCmdCopyAccelerationStructureKHR"
               vkcmdcopyaccelerationstructurekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo :pointer))

(cffi:defcfun ("vkCmdCopyAccelerationStructureToMemoryKHR"
               vkcmdcopyaccelerationstructuretomemorykhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo :pointer))

(cffi:defcfun ("vkCmdCopyMemoryToAccelerationStructureKHR"
               vkcmdcopymemorytoaccelerationstructurekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo :pointer))

(cffi:defcfun ("vkGetAccelerationStructureDeviceAddressKHR"
               vkgetaccelerationstructuredeviceaddresskhr)
    vkdeviceaddress
  (device vkdevice)
  (pinfo :pointer))

(cffi:defcfun ("vkCmdWriteAccelerationStructuresPropertiesKHR"
               vkcmdwriteaccelerationstructurespropertieskhr)
    :void
  (commandbuffer vkcommandbuffer)
  (accelerationstructurecount :uint32)
  (paccelerationstructures :pointer)
  (querytype vkquerytype)
  (querypool vkquerypool)
  (firstquery :uint32))

(cffi:defcfun ("vkGetDeviceAccelerationStructureCompatibilityKHR"
               vkgetdeviceaccelerationstructurecompatibilitykhr)
    :void
  (device vkdevice)
  (pversioninfo :pointer)
  (pcompatibility :pointer))

(cffi:defcfun ("vkGetAccelerationStructureBuildSizesKHR"
               vkgetaccelerationstructurebuildsizeskhr)
    :void
  (device vkdevice)
  (buildtype vkaccelerationstructurebuildtypekhr)
  (pbuildinfo :pointer)
  (pmaxprimitivecounts :pointer)
  (psizeinfo :pointer))

(cffi:defcfun ("vkCmdTraceRaysKHR" vkcmdtracerayskhr)
    :void
  (commandbuffer vkcommandbuffer)
  (praygenshaderbindingtable :pointer)
  (pmissshaderbindingtable :pointer)
  (phitshaderbindingtable :pointer)
  (pcallableshaderbindingtable :pointer)
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(cffi:defcfun ("vkCreateRayTracingPipelinesKHR" vkcreateraytracingpipelineskhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos :pointer)
  (pallocator :pointer)
  (ppipelines :pointer))

(cffi:defcfun ("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR"
               vkgetraytracingcapturereplayshadergrouphandleskhr)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (firstgroup :uint32)
  (groupcount :uint32)
  (datasize :size)
  (pdata :pointer))

(cffi:defcfun ("vkCmdTraceRaysIndirectKHR" vkcmdtraceraysindirectkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (praygenshaderbindingtable :pointer)
  (pmissshaderbindingtable :pointer)
  (phitshaderbindingtable :pointer)
  (pcallableshaderbindingtable :pointer)
  (indirectdeviceaddress vkdeviceaddress))

(cffi:defcfun ("vkGetRayTracingShaderGroupStackSizeKHR"
               vkgetraytracingshadergroupstacksizekhr)
    vkdevicesize
  (device vkdevice)
  (pipeline vkpipeline)
  (group :uint32)
  (groupshader vkshadergroupshaderkhr))

(cffi:defcfun ("vkCmdSetRayTracingPipelineStackSizeKHR"
               vkcmdsetraytracingpipelinestacksizekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinestacksize :uint32))