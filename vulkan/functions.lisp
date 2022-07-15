
(cffi:defcfun ("vkCreateInstance" vkcreateinstance)
    vkresult
  (pcreateinfo (:pointer (:struct vkinstancecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pinstance (:pointer vkinstance)))

(cffi:defcfun ("vkDestroyInstance" vkdestroyinstance)
    :void
  (instance vkinstance)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkEnumeratePhysicalDevices" vkenumeratephysicaldevices)
    vkresult
  (instance vkinstance)
  (pphysicaldevicecount (:pointer :uint32))
  (pphysicaldevices (:pointer vkphysicaldevice)))

(cffi:defcfun ("vkGetPhysicalDeviceFeatures" vkgetphysicaldevicefeatures)
    :void
  (physicaldevice vkphysicaldevice)
  (pfeatures (:pointer (:struct vkphysicaldevicefeatures))))

(cffi:defcfun ("vkGetPhysicalDeviceFormatProperties"
               vkgetphysicaldeviceformatproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (pformatproperties (:pointer (:struct vkformatproperties))))

(cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties"
               vkgetphysicaldeviceimageformatproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (type vkimagetype)
  (tiling vkimagetiling)
  (usage vkimageusageflags)
  (flags vkimagecreateflags)
  (pimageformatproperties (:pointer (:struct vkimageformatproperties))))

(cffi:defcfun ("vkGetPhysicalDeviceProperties" vkgetphysicaldeviceproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pproperties (:pointer (:struct vkphysicaldeviceproperties))))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties"
               vkgetphysicaldevicequeuefamilyproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pqueuefamilypropertycount (:pointer :uint32))
  (pqueuefamilyproperties (:pointer (:struct vkqueuefamilyproperties))))

(cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties"
               vkgetphysicaldevicememoryproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pmemoryproperties (:pointer (:struct vkphysicaldevicememoryproperties))))

(cffi:defcfun ("vkGetInstanceProcAddr" vkgetinstanceprocaddr)
    pfn_vkvoidfunction
  (instance vkinstance)
  (pname (:pointer :char)))

(cffi:defcfun ("vkGetDeviceProcAddr" vkgetdeviceprocaddr)
    pfn_vkvoidfunction
  (device vkdevice)
  (pname (:pointer :char)))

(cffi:defcfun ("vkCreateDevice" vkcreatedevice)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pcreateinfo (:pointer (:struct vkdevicecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pdevice (:pointer vkdevice)))

(cffi:defcfun ("vkDestroyDevice" vkdestroydevice)
    :void
  (device vkdevice)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkEnumerateInstanceExtensionProperties"
               vkenumerateinstanceextensionproperties)
    vkresult
  (playername (:pointer :char))
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vkextensionproperties))))

(cffi:defcfun ("vkEnumerateDeviceExtensionProperties"
               vkenumeratedeviceextensionproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (playername (:pointer :char))
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vkextensionproperties))))

(cffi:defcfun ("vkEnumerateInstanceLayerProperties"
               vkenumerateinstancelayerproperties)
    vkresult
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vklayerproperties))))

(cffi:defcfun ("vkEnumerateDeviceLayerProperties"
               vkenumeratedevicelayerproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vklayerproperties))))

(cffi:defcfun ("vkGetDeviceQueue" vkgetdevicequeue)
    :void
  (device vkdevice)
  (queuefamilyindex :uint32)
  (queueindex :uint32)
  (pqueue (:pointer vkqueue)))

(cffi:defcfun ("vkQueueSubmit" vkqueuesubmit)
    vkresult
  (queue vkqueue)
  (submitcount :uint32)
  (psubmits (:pointer (:struct vksubmitinfo)))
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
  (pallocateinfo (:pointer (:struct vkmemoryallocateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pmemory (:pointer vkdevicememory)))

(cffi:defcfun ("vkFreeMemory" vkfreememory)
    :void
  (device vkdevice)
  (memory vkdevicememory)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkMapMemory" vkmapmemory)
    vkresult
  (device vkdevice)
  (memory vkdevicememory)
  (offset vkdevicesize)
  (size vkdevicesize)
  (flags vkmemorymapflags)
  (* (:pointer :void))
  ppdata)

(cffi:defcfun ("vkUnmapMemory" vkunmapmemory)
    :void
  (device vkdevice)
  (memory vkdevicememory))

(cffi:defcfun ("vkFlushMappedMemoryRanges" vkflushmappedmemoryranges)
    vkresult
  (device vkdevice)
  (memoryrangecount :uint32)
  (pmemoryranges (:pointer (:struct vkmappedmemoryrange))))

(cffi:defcfun ("vkInvalidateMappedMemoryRanges" vkinvalidatemappedmemoryranges)
    vkresult
  (device vkdevice)
  (memoryrangecount :uint32)
  (pmemoryranges (:pointer (:struct vkmappedmemoryrange))))

(cffi:defcfun ("vkGetDeviceMemoryCommitment" vkgetdevicememorycommitment)
    :void
  (device vkdevice)
  (memory vkdevicememory)
  (pcommittedmemoryinbytes (:pointer vkdevicesize)))

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
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements))))

(cffi:defcfun ("vkGetImageMemoryRequirements" vkgetimagememoryrequirements)
    :void
  (device vkdevice)
  (image vkimage)
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements))))

(cffi:defcfun ("vkGetImageSparseMemoryRequirements"
               vkgetimagesparsememoryrequirements)
    :void
  (device vkdevice)
  (image vkimage)
  (psparsememoryrequirementcount (:pointer :uint32))
  (psparsememoryrequirements
   (:pointer (:struct vksparseimagememoryrequirements))))

(cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties"
               vkgetphysicaldevicesparseimageformatproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (type vkimagetype)
  (samples vksamplecountflagbits)
  (usage vkimageusageflags)
  (tiling vkimagetiling)
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vksparseimageformatproperties))))

(cffi:defcfun ("vkQueueBindSparse" vkqueuebindsparse)
    vkresult
  (queue vkqueue)
  (bindinfocount :uint32)
  (pbindinfo (:pointer (:struct vkbindsparseinfo)))
  (fence vkfence))

(cffi:defcfun ("vkCreateFence" vkcreatefence)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkfencecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pfence (:pointer vkfence)))

(cffi:defcfun ("vkDestroyFence" vkdestroyfence)
    :void
  (device vkdevice)
  (fence vkfence)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkResetFences" vkresetfences)
    vkresult
  (device vkdevice)
  (fencecount :uint32)
  (pfences (:pointer vkfence)))

(cffi:defcfun ("vkGetFenceStatus" vkgetfencestatus)
    vkresult
  (device vkdevice)
  (fence vkfence))

(cffi:defcfun ("vkWaitForFences" vkwaitforfences)
    vkresult
  (device vkdevice)
  (fencecount :uint32)
  (pfences (:pointer vkfence))
  (waitall vkbool32)
  (timeout :uint64))

(cffi:defcfun ("vkCreateSemaphore" vkcreatesemaphore)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vksemaphorecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (psemaphore (:pointer vksemaphore)))

(cffi:defcfun ("vkDestroySemaphore" vkdestroysemaphore)
    :void
  (device vkdevice)
  (semaphore vksemaphore)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreateEvent" vkcreateevent)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkeventcreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pevent (:pointer vkevent)))

(cffi:defcfun ("vkDestroyEvent" vkdestroyevent)
    :void
  (device vkdevice)
  (event vkevent)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

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
  (pcreateinfo (:pointer (:struct vkquerypoolcreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pquerypool (:pointer vkquerypool)))

(cffi:defcfun ("vkDestroyQueryPool" vkdestroyquerypool)
    :void
  (device vkdevice)
  (querypool vkquerypool)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkGetQueryPoolResults" vkgetquerypoolresults)
    vkresult
  (device vkdevice)
  (querypool vkquerypool)
  (firstquery :uint32)
  (querycount :uint32)
  (datasize :size)
  (pdata (:pointer :void))
  (stride vkdevicesize)
  (flags vkqueryresultflags))

(cffi:defcfun ("vkCreateBuffer" vkcreatebuffer)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkbuffercreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pbuffer (:pointer vkbuffer)))

(cffi:defcfun ("vkDestroyBuffer" vkdestroybuffer)
    :void
  (device vkdevice)
  (buffer vkbuffer)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreateBufferView" vkcreatebufferview)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkbufferviewcreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pview (:pointer vkbufferview)))

(cffi:defcfun ("vkDestroyBufferView" vkdestroybufferview)
    :void
  (device vkdevice)
  (bufferview vkbufferview)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreateImage" vkcreateimage)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkimagecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pimage (:pointer vkimage)))

(cffi:defcfun ("vkDestroyImage" vkdestroyimage)
    :void
  (device vkdevice)
  (image vkimage)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkGetImageSubresourceLayout" vkgetimagesubresourcelayout)
    :void
  (device vkdevice)
  (image vkimage)
  (psubresource (:pointer (:struct vkimagesubresource)))
  (playout (:pointer (:struct vksubresourcelayout))))

(cffi:defcfun ("vkCreateImageView" vkcreateimageview)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkimageviewcreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pview (:pointer vkimageview)))

(cffi:defcfun ("vkDestroyImageView" vkdestroyimageview)
    :void
  (device vkdevice)
  (imageview vkimageview)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreateShaderModule" vkcreateshadermodule)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkshadermodulecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pshadermodule (:pointer vkshadermodule)))

(cffi:defcfun ("vkDestroyShaderModule" vkdestroyshadermodule)
    :void
  (device vkdevice)
  (shadermodule vkshadermodule)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreatePipelineCache" vkcreatepipelinecache)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkpipelinecachecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (ppipelinecache (:pointer vkpipelinecache)))

(cffi:defcfun ("vkDestroyPipelineCache" vkdestroypipelinecache)
    :void
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkGetPipelineCacheData" vkgetpipelinecachedata)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (pdatasize (:pointer :size))
  (pdata (:pointer :void)))

(cffi:defcfun ("vkMergePipelineCaches" vkmergepipelinecaches)
    vkresult
  (device vkdevice)
  (dstcache vkpipelinecache)
  (srccachecount :uint32)
  (psrccaches (:pointer vkpipelinecache)))

(cffi:defcfun ("vkCreateGraphicsPipelines" vkcreategraphicspipelines)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos (:pointer (:struct vkgraphicspipelinecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (ppipelines (:pointer vkpipeline)))

(cffi:defcfun ("vkCreateComputePipelines" vkcreatecomputepipelines)
    vkresult
  (device vkdevice)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos (:pointer (:struct vkcomputepipelinecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (ppipelines (:pointer vkpipeline)))

(cffi:defcfun ("vkDestroyPipeline" vkdestroypipeline)
    :void
  (device vkdevice)
  (pipeline vkpipeline)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreatePipelineLayout" vkcreatepipelinelayout)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkpipelinelayoutcreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (ppipelinelayout (:pointer vkpipelinelayout)))

(cffi:defcfun ("vkDestroyPipelineLayout" vkdestroypipelinelayout)
    :void
  (device vkdevice)
  (pipelinelayout vkpipelinelayout)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreateSampler" vkcreatesampler)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vksamplercreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (psampler (:pointer vksampler)))

(cffi:defcfun ("vkDestroySampler" vkdestroysampler)
    :void
  (device vkdevice)
  (sampler vksampler)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreateDescriptorSetLayout" vkcreatedescriptorsetlayout)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkdescriptorsetlayoutcreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (psetlayout (:pointer vkdescriptorsetlayout)))

(cffi:defcfun ("vkDestroyDescriptorSetLayout" vkdestroydescriptorsetlayout)
    :void
  (device vkdevice)
  (descriptorsetlayout vkdescriptorsetlayout)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreateDescriptorPool" vkcreatedescriptorpool)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkdescriptorpoolcreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pdescriptorpool (:pointer vkdescriptorpool)))

(cffi:defcfun ("vkDestroyDescriptorPool" vkdestroydescriptorpool)
    :void
  (device vkdevice)
  (descriptorpool vkdescriptorpool)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkResetDescriptorPool" vkresetdescriptorpool)
    vkresult
  (device vkdevice)
  (descriptorpool vkdescriptorpool)
  (flags vkdescriptorpoolresetflags))

(cffi:defcfun ("vkAllocateDescriptorSets" vkallocatedescriptorsets)
    vkresult
  (device vkdevice)
  (pallocateinfo (:pointer (:struct vkdescriptorsetallocateinfo)))
  (pdescriptorsets (:pointer vkdescriptorset)))

(cffi:defcfun ("vkFreeDescriptorSets" vkfreedescriptorsets)
    vkresult
  (device vkdevice)
  (descriptorpool vkdescriptorpool)
  (descriptorsetcount :uint32)
  (pdescriptorsets (:pointer vkdescriptorset)))

(cffi:defcfun ("vkUpdateDescriptorSets" vkupdatedescriptorsets)
    :void
  (device vkdevice)
  (descriptorwritecount :uint32)
  (pdescriptorwrites (:pointer (:struct vkwritedescriptorset)))
  (descriptorcopycount :uint32)
  (pdescriptorcopies (:pointer (:struct vkcopydescriptorset))))

(cffi:defcfun ("vkCreateFramebuffer" vkcreateframebuffer)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkframebuffercreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pframebuffer (:pointer vkframebuffer)))

(cffi:defcfun ("vkDestroyFramebuffer" vkdestroyframebuffer)
    :void
  (device vkdevice)
  (framebuffer vkframebuffer)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreateRenderPass" vkcreaterenderpass)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkrenderpasscreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (prenderpass (:pointer vkrenderpass)))

(cffi:defcfun ("vkDestroyRenderPass" vkdestroyrenderpass)
    :void
  (device vkdevice)
  (renderpass vkrenderpass)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkGetRenderAreaGranularity" vkgetrenderareagranularity)
    :void
  (device vkdevice)
  (renderpass vkrenderpass)
  (pgranularity (:pointer (:struct vkextent2d))))

(cffi:defcfun ("vkCreateCommandPool" vkcreatecommandpool)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkcommandpoolcreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pcommandpool (:pointer vkcommandpool)))

(cffi:defcfun ("vkDestroyCommandPool" vkdestroycommandpool)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkResetCommandPool" vkresetcommandpool)
    vkresult
  (device vkdevice)
  (commandpool vkcommandpool)
  (flags vkcommandpoolresetflags))

(cffi:defcfun ("vkAllocateCommandBuffers" vkallocatecommandbuffers)
    vkresult
  (device vkdevice)
  (pallocateinfo (:pointer (:struct vkcommandbufferallocateinfo)))
  (pcommandbuffers (:pointer vkcommandbuffer)))

(cffi:defcfun ("vkFreeCommandBuffers" vkfreecommandbuffers)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (commandbuffercount :uint32)
  (pcommandbuffers (:pointer vkcommandbuffer)))

(cffi:defcfun ("vkBeginCommandBuffer" vkbegincommandbuffer)
    vkresult
  (commandbuffer vkcommandbuffer)
  (pbegininfo (:pointer (:struct vkcommandbufferbegininfo))))

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
  (pviewports (:pointer (:struct vkviewport))))

(cffi:defcfun ("vkCmdSetScissor" vkcmdsetscissor)
    :void
  (commandbuffer vkcommandbuffer)
  (firstscissor :uint32)
  (scissorcount :uint32)
  (pscissors (:pointer (:struct vkrect2d))))

(cffi:defcfun ("vkCmdSetLineWidth" vkcmdsetlinewidth)
    :void
  (commandbuffer vkcommandbuffer)
  (linewidth :float))

(cffi:defcfun ("vkCmdSetDepthBias" vkcmdsetdepthbias)
    :void
  (commandbuffer vkcommandbuffer)
  (ntfactor :float)
  (depthbiasclamp :float)
  (depthbiasslopefactor :float))

(cffi:defcfun ("nts" nts)
    :void
  (commandbuffer vkcommandbuffer)
  (blendconstants[4] :float))

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
  (pdescriptorsets (:pointer vkdescriptorset))
  (dynamicoffsetcount :uint32)
  (pdynamicoffsets (:pointer :uint32)))

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
  (pbuffers (:pointer vkbuffer))
  (poffsets (:pointer vkdevicesize)))

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
  (pregions (:pointer (:struct vkbuffercopy))))

(cffi:defcfun ("vkCmdCopyImage" vkcmdcopyimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkimagecopy))))

(cffi:defcfun ("vkCmdBlitImage" vkcmdblitimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkimageblit)))
  (filter vkfilter))

(cffi:defcfun ("vkCmdCopyBufferToImage" vkcmdcopybuffertoimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcbuffer vkbuffer)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkbufferimagecopy))))

(cffi:defcfun ("vkCmdCopyImageToBuffer" vkcmdcopyimagetobuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstbuffer vkbuffer)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkbufferimagecopy))))

(cffi:defcfun ("vkCmdUpdateBuffer" vkcmdupdatebuffer)
    :void
  (commandbuffer vkcommandbuffer)
  (dstbuffer vkbuffer)
  (dstoffset vkdevicesize)
  (datasize vkdevicesize)
  (pdata (:pointer :void)))

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
  (pcolor (:pointer (:union vkclearcolorvalue)))
  (rangecount :uint32)
  (pranges (:pointer (:struct vkimagesubresourcerange))))

(cffi:defcfun ("vkCmdClearDepthStencilImage" vkcmdcleardepthstencilimage)
    :void
  (commandbuffer vkcommandbuffer)
  (image vkimage)
  (imagelayout vkimagelayout)
  (pdepthstencil (:pointer (:struct vkcleardepthstencilvalue)))
  (rangecount :uint32)
  (pranges (:pointer (:struct vkimagesubresourcerange))))

(cffi:defcfun ("vkCmdClearAttachments" vkcmdclearattachments)
    :void
  (commandbuffer vkcommandbuffer)
  (attachmentcount :uint32)
  (pattachments (:pointer (:struct vkclearattachment)))
  (rectcount :uint32)
  (prects (:pointer (:struct vkclearrect))))

(cffi:defcfun ("vkCmdResolveImage" vkcmdresolveimage)
    :void
  (commandbuffer vkcommandbuffer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkimageresolve))))

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
  (pevents (:pointer vkevent))
  (srcstagemask vkpipelinestageflags)
  (dststagemask vkpipelinestageflags)
  (memorybarriercount :uint32)
  (pmemorybarriers (:pointer (:struct vkmemorybarrier)))
  (buffermemorybarriercount :uint32)
  (pbuffermemorybarriers (:pointer (:struct vkbuffermemorybarrier)))
  (imagememorybarriercount :uint32)
  (pimagememorybarriers (:pointer (:struct vkimagememorybarrier))))

(cffi:defcfun ("vkCmdPipelineBarrier" vkcmdpipelinebarrier)
    :void
  (commandbuffer vkcommandbuffer)
  (srcstagemask vkpipelinestageflags)
  (dststagemask vkpipelinestageflags)
  (dependencyflags vkdependencyflags)
  (memorybarriercount :uint32)
  (pmemorybarriers (:pointer (:struct vkmemorybarrier)))
  (buffermemorybarriercount :uint32)
  (pbuffermemorybarriers (:pointer (:struct vkbuffermemorybarrier)))
  (imagememorybarriercount :uint32)
  (pimagememorybarriers (:pointer (:struct vkimagememorybarrier))))

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

(cffi:defcfun ("nts" nts)
    :void
  (commandbuffer vkcommandbuffer)
  (layout vkpipelinelayout)
  (stageflags vkshaderstageflags)
  (offset :uint32)
  (size :uint32)
  (pvalues (:pointer :void)))

(cffi:defcfun ("vkCmdBeginRenderPass" vkcmdbeginrenderpass)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderpassbegin (:pointer (:struct vkrenderpassbegininfo)))
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
  (pcommandbuffers (:pointer vkcommandbuffer)))

(cffi:defcfun ("vkEnumerateInstanceVersion" vkenumerateinstanceversion)
    vkresult
  (papiversion (:pointer :uint32)))

(cffi:defcfun ("vkBindBufferMemory2" vkbindbuffermemory2)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos (:pointer (:struct vkbindbuffermemoryinfo))))

(cffi:defcfun ("vkBindImageMemory2" vkbindimagememory2)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos (:pointer (:struct vkbindimagememoryinfo))))

(cffi:defcfun ("vkGetDeviceGroupPeerMemoryFeatures"
               vkgetdevicegrouppeermemoryfeatures)
    :void
  (device vkdevice)
  (heapindex :uint32)
  (localdeviceindex :uint32)
  (remotedeviceindex :uint32)
  (ppeermemoryfeatures (:pointer vkpeermemoryfeatureflags)))

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
  (pphysicaldevicegroupcount (:pointer :uint32))
  (pphysicaldevicegroupproperties
   (:pointer (:struct vkphysicaldevicegroupproperties))))

(cffi:defcfun ("vkGetImageMemoryRequirements2" vkgetimagememoryrequirements2)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkimagememoryrequirementsinfo2)))
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements2))))

(cffi:defcfun ("vkGetBufferMemoryRequirements2" vkgetbuffermemoryrequirements2)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkbuffermemoryrequirementsinfo2)))
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements2))))

(cffi:defcfun ("vkGetImageSparseMemoryRequirements2"
               vkgetimagesparsememoryrequirements2)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkimagesparsememoryrequirementsinfo2)))
  (psparsememoryrequirementcount (:pointer :uint32))
  (psparsememoryrequirements
   (:pointer (:struct vksparseimagememoryrequirements2))))

(cffi:defcfun ("vkGetPhysicalDeviceFeatures2" vkgetphysicaldevicefeatures2)
    :void
  (physicaldevice vkphysicaldevice)
  (pfeatures (:pointer (:struct vkphysicaldevicefeatures2))))

(cffi:defcfun ("vkGetPhysicalDeviceProperties2" vkgetphysicaldeviceproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pproperties (:pointer (:struct vkphysicaldeviceproperties2))))

(cffi:defcfun ("vkGetPhysicalDeviceFormatProperties2"
               vkgetphysicaldeviceformatproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (pformatproperties (:pointer (:struct vkformatproperties2))))

(cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties2"
               vkgetphysicaldeviceimageformatproperties2)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pimageformatinfo (:pointer (:struct vkphysicaldeviceimageformatinfo2)))
  (pimageformatproperties (:pointer (:struct vkimageformatproperties2))))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties2"
               vkgetphysicaldevicequeuefamilyproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pqueuefamilypropertycount (:pointer :uint32))
  (pqueuefamilyproperties (:pointer (:struct vkqueuefamilyproperties2))))

(cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties2"
               vkgetphysicaldevicememoryproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pmemoryproperties (:pointer (:struct vkphysicaldevicememoryproperties2))))

(cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties2"
               vkgetphysicaldevicesparseimageformatproperties2)
    :void
  (physicaldevice vkphysicaldevice)
  (pformatinfo (:pointer (:struct vkphysicaldevicesparseimageformatinfo2)))
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vksparseimageformatproperties2))))

(cffi:defcfun ("vkTrimCommandPool" vktrimcommandpool)
    :void
  (device vkdevice)
  (commandpool vkcommandpool)
  (flags vkcommandpooltrimflags))

(cffi:defcfun ("vkGetDeviceQueue2" vkgetdevicequeue2)
    :void
  (device vkdevice)
  (pqueueinfo (:pointer (:struct vkdevicequeueinfo2)))
  (pqueue (:pointer vkqueue)))

(cffi:defcfun ("vkCreateSamplerYcbcrConversion" vkcreatesamplerycbcrconversion)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vksamplerycbcrconversioncreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pycbcrconversion (:pointer vksamplerycbcrconversion)))

(cffi:defcfun ("vkDestroySamplerYcbcrConversion"
               vkdestroysamplerycbcrconversion)
    :void
  (device vkdevice)
  (ycbcrconversion vksamplerycbcrconversion)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCreateDescriptorUpdateTemplate"
               vkcreatedescriptorupdatetemplate)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkdescriptorupdatetemplatecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pdescriptorupdatetemplate (:pointer vkdescriptorupdatetemplate)))

(cffi:defcfun ("vkDestroyDescriptorUpdateTemplate"
               vkdestroydescriptorupdatetemplate)
    :void
  (device vkdevice)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkUpdateDescriptorSetWithTemplate"
               vkupdatedescriptorsetwithtemplate)
    :void
  (device vkdevice)
  (descriptorset vkdescriptorset)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pdata (:pointer :void)))

(cffi:defcfun ("vkGetPhysicalDeviceExternalBufferProperties"
               vkgetphysicaldeviceexternalbufferproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalbufferinfo (:pointer (:struct vkphysicaldeviceexternalbufferinfo)))
  (pexternalbufferproperties (:pointer (:struct vkexternalbufferproperties))))

(cffi:defcfun ("vkGetPhysicalDeviceExternalFenceProperties"
               vkgetphysicaldeviceexternalfenceproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalfenceinfo (:pointer (:struct vkphysicaldeviceexternalfenceinfo)))
  (pexternalfenceproperties (:pointer (:struct vkexternalfenceproperties))))

(cffi:defcfun ("vkGetPhysicalDeviceExternalSemaphoreProperties"
               vkgetphysicaldeviceexternalsemaphoreproperties)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalsemaphoreinfo
   (:pointer (:struct vkphysicaldeviceexternalsemaphoreinfo)))
  (pexternalsemaphoreproperties
   (:pointer (:struct vkexternalsemaphoreproperties))))

(cffi:defcfun ("vkGetDescriptorSetLayoutSupport"
               vkgetdescriptorsetlayoutsupport)
    :void
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkdescriptorsetlayoutcreateinfo)))
  (psupport (:pointer (:struct vkdescriptorsetlayoutsupport))))

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
  (pcreateinfo (:pointer (:struct vkrenderpasscreateinfo2)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (prenderpass (:pointer vkrenderpass)))

(cffi:defcfun ("vkCmdBeginRenderPass2" vkcmdbeginrenderpass2)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderpassbegin (:pointer (:struct vkrenderpassbegininfo)))
  (psubpassbegininfo (:pointer (:struct vksubpassbegininfo))))

(cffi:defcfun ("vkCmdNextSubpass2" vkcmdnextsubpass2)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassbegininfo (:pointer (:struct vksubpassbegininfo)))
  (psubpassendinfo (:pointer (:struct vksubpassendinfo))))

(cffi:defcfun ("vkCmdEndRenderPass2" vkcmdendrenderpass2)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassendinfo (:pointer (:struct vksubpassendinfo))))

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
  (pvalue (:pointer :uint64)))

(cffi:defcfun ("vkWaitSemaphores" vkwaitsemaphores)
    vkresult
  (device vkdevice)
  (pwaitinfo (:pointer (:struct vksemaphorewaitinfo)))
  (timeout :uint64))

(cffi:defcfun ("vkSignalSemaphore" vksignalsemaphore)
    vkresult
  (device vkdevice)
  (psignalinfo (:pointer (:struct vksemaphoresignalinfo))))

(cffi:defcfun ("vkGetBufferDeviceAddress" vkgetbufferdeviceaddress)
    vkdeviceaddress
  (device vkdevice)
  (pinfo (:pointer (:struct vkbufferdeviceaddressinfo))))

(cffi:defcfun ("vkGetBufferOpaqueCaptureAddress"
               vkgetbufferopaquecaptureaddress)
    :uint64
  (device vkdevice)
  (pinfo (:pointer (:struct vkbufferdeviceaddressinfo))))

(cffi:defcfun ("vkGetDeviceMemoryOpaqueCaptureAddress"
               vkgetdevicememoryopaquecaptureaddress)
    :uint64
  (device vkdevice)
  (pinfo (:pointer (:struct vkdevicememoryopaquecaptureaddressinfo))))

(cffi:defcfun ("vkGetPhysicalDeviceToolProperties"
               vkgetphysicaldevicetoolproperties)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ptoolcount (:pointer :uint32))
  (ptoolproperties (:pointer (:struct vkphysicaldevicetoolproperties))))

(cffi:defcfun ("vkCreatePrivateDataSlot" vkcreateprivatedataslot)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkprivatedataslotcreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pprivatedataslot (:pointer vkprivatedataslot)))

(cffi:defcfun ("vkDestroyPrivateDataSlot" vkdestroyprivatedataslot)
    :void
  (device vkdevice)
  (privatedataslot vkprivatedataslot)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

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
  (pdata (:pointer :uint64)))

(cffi:defcfun ("vkCmdSetEvent2" vkcmdsetevent2)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (pdependencyinfo (:pointer (:struct vkdependencyinfo))))

(cffi:defcfun ("vkCmdResetEvent2" vkcmdresetevent2)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (stagemask vkpipelinestageflags2))

(cffi:defcfun ("vkCmdWaitEvents2" vkcmdwaitevents2)
    :void
  (commandbuffer vkcommandbuffer)
  (eventcount :uint32)
  (pevents (:pointer vkevent))
  (pdependencyinfos (:pointer (:struct vkdependencyinfo))))

(cffi:defcfun ("vkCmdPipelineBarrier2" vkcmdpipelinebarrier2)
    :void
  (commandbuffer vkcommandbuffer)
  (pdependencyinfo (:pointer (:struct vkdependencyinfo))))

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
  (psubmits (:pointer (:struct vksubmitinfo2)))
  (fence vkfence))

(cffi:defcfun ("vkCmdCopyBuffer2" vkcmdcopybuffer2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybufferinfo (:pointer (:struct vkcopybufferinfo2))))

(cffi:defcfun ("vkCmdCopyImage2" vkcmdcopyimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimageinfo (:pointer (:struct vkcopyimageinfo2))))

(cffi:defcfun ("vkCmdCopyBufferToImage2" vkcmdcopybuffertoimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybuffertoimageinfo (:pointer (:struct vkcopybuffertoimageinfo2))))

(cffi:defcfun ("vkCmdCopyImageToBuffer2" vkcmdcopyimagetobuffer2)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimagetobufferinfo (:pointer (:struct vkcopyimagetobufferinfo2))))

(cffi:defcfun ("vkCmdBlitImage2" vkcmdblitimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (pblitimageinfo (:pointer (:struct vkblitimageinfo2))))

(cffi:defcfun ("vkCmdResolveImage2" vkcmdresolveimage2)
    :void
  (commandbuffer vkcommandbuffer)
  (presolveimageinfo (:pointer (:struct vkresolveimageinfo2))))

(cffi:defcfun ("vkCmdBeginRendering" vkcmdbeginrendering)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderinginfo (:pointer (:struct vkrenderinginfo))))

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
  (pviewports (:pointer (:struct vkviewport))))

(cffi:defcfun ("vkCmdSetScissorWithCount" vkcmdsetscissorwithcount)
    :void
  (commandbuffer vkcommandbuffer)
  (scissorcount :uint32)
  (pscissors (:pointer (:struct vkrect2d))))

(cffi:defcfun ("vkCmdBindVertexBuffers2" vkcmdbindvertexbuffers2)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers (:pointer vkbuffer))
  (poffsets (:pointer vkdevicesize))
  (psizes (:pointer vkdevicesize))
  (pstrides (:pointer vkdevicesize)))

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
  (pinfo (:pointer (:struct vkdevicebuffermemoryrequirements)))
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements2))))

(cffi:defcfun ("vkGetDeviceImageMemoryRequirements"
               vkgetdeviceimagememoryrequirements)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkdeviceimagememoryrequirements)))
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements2))))

(cffi:defcfun ("vkGetDeviceImageSparseMemoryRequirements"
               vkgetdeviceimagesparsememoryrequirements)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkdeviceimagememoryrequirements)))
  (psparsememoryrequirementcount (:pointer :uint32))
  (psparsememoryrequirements
   (:pointer (:struct vksparseimagememoryrequirements2))))

(cffi:defcfun ("vkDestroySurfaceKHR" vkdestroysurfacekhr)
    :void
  (instance vkinstance)
  (surface vksurfacekhr)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceSupportKHR"
               vkgetphysicaldevicesurfacesupportkhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (queuefamilyindex :uint32)
  (surface vksurfacekhr)
  (psupported (:pointer vkbool32)))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilitiesKHR"
               vkgetphysicaldevicesurfacecapabilitieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (psurfacecapabilities (:pointer (:struct vksurfacecapabilitieskhr))))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceFormatsKHR"
               vkgetphysicaldevicesurfaceformatskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (psurfaceformatcount (:pointer :uint32))
  (psurfaceformats (:pointer (:struct vksurfaceformatkhr))))

(cffi:defcfun ("vkGetPhysicalDeviceSurfacePresentModesKHR"
               vkgetphysicaldevicesurfacepresentmodeskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (ppresentmodecount (:pointer :uint32))
  (ppresentmodes (:pointer vkpresentmodekhr)))

(cffi:defcfun ("vkCreateSwapchainKHR" vkcreateswapchainkhr)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkswapchaincreateinfokhr)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pswapchain (:pointer vkswapchainkhr)))

(cffi:defcfun ("vkDestroySwapchainKHR" vkdestroyswapchainkhr)
    :void
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkGetSwapchainImagesKHR" vkgetswapchainimageskhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (pswapchainimagecount (:pointer :uint32))
  (pswapchainimages (:pointer vkimage)))

(cffi:defcfun ("vkAcquireNextImageKHR" vkacquirenextimagekhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (timeout :uint64)
  (semaphore vksemaphore)
  (fence vkfence)
  (pimageindex (:pointer :uint32)))

(cffi:defcfun ("vkQueuePresentKHR" vkqueuepresentkhr)
    vkresult
  (queue vkqueue)
  (ppresentinfo (:pointer (:struct vkpresentinfokhr))))

(cffi:defcfun ("vkGetDeviceGroupPresentCapabilitiesKHR"
               vkgetdevicegrouppresentcapabilitieskhr)
    vkresult
  (device vkdevice)
  (pdevicegrouppresentcapabilities
   (:pointer (:struct vkdevicegrouppresentcapabilitieskhr))))

(cffi:defcfun ("vkGetDeviceGroupSurfacePresentModesKHR"
               vkgetdevicegroupsurfacepresentmodeskhr)
    vkresult
  (device vkdevice)
  (surface vksurfacekhr)
  (pmodes (:pointer vkdevicegrouppresentmodeflagskhr)))

(cffi:defcfun ("vkGetPhysicalDevicePresentRectanglesKHR"
               vkgetphysicaldevicepresentrectangleskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (prectcount (:pointer :uint32))
  (prects (:pointer (:struct vkrect2d))))

(cffi:defcfun ("vkAcquireNextImage2KHR" vkacquirenextimage2khr)
    vkresult
  (device vkdevice)
  (pacquireinfo (:pointer (:struct vkacquirenextimageinfokhr)))
  (pimageindex (:pointer :uint32)))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayPropertiesKHR"
               vkgetphysicaldevicedisplaypropertieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vkdisplaypropertieskhr))))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayPlanePropertiesKHR"
               vkgetphysicaldevicedisplayplanepropertieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vkdisplayplanepropertieskhr))))

(cffi:defcfun ("vkGetDisplayPlaneSupportedDisplaysKHR"
               vkgetdisplayplanesupporteddisplayskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (planeindex :uint32)
  (pdisplaycount (:pointer :uint32))
  (pdisplays (:pointer vkdisplaykhr)))

(cffi:defcfun ("vkGetDisplayModePropertiesKHR" vkgetdisplaymodepropertieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr)
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vkdisplaymodepropertieskhr))))

(cffi:defcfun ("vkCreateDisplayModeKHR" vkcreatedisplaymodekhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr)
  (pcreateinfo (:pointer (:struct vkdisplaymodecreateinfokhr)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pmode (:pointer vkdisplaymodekhr)))

(cffi:defcfun ("vkGetDisplayPlaneCapabilitiesKHR"
               vkgetdisplayplanecapabilitieskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (mode vkdisplaymodekhr)
  (planeindex :uint32)
  (pcapabilities (:pointer (:struct vkdisplayplanecapabilitieskhr))))

(cffi:defcfun ("vkCreateDisplayPlaneSurfaceKHR" vkcreatedisplayplanesurfacekhr)
    vkresult
  (instance vkinstance)
  (pcreateinfo (:pointer (:struct vkdisplaysurfacecreateinfokhr)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (psurface (:pointer vksurfacekhr)))

(cffi:defcfun ("vkCreateSharedSwapchainsKHR" vkcreatesharedswapchainskhr)
    vkresult
  (device vkdevice)
  (swapchaincount :uint32)
  (pcreateinfos (:pointer (:struct vkswapchaincreateinfokhr)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pswapchains (:pointer vkswapchainkhr)))

(cffi:defcfun ("vkCmdBeginRenderingKHR" vkcmdbeginrenderingkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderinginfo (:pointer (:struct vkrenderinginfo))))

(cffi:defcfun ("vkCmdEndRenderingKHR" vkcmdendrenderingkhr)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkGetPhysicalDeviceFeatures2KHR"
               vkgetphysicaldevicefeatures2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pfeatures (:pointer (:struct vkphysicaldevicefeatures2))))

(cffi:defcfun ("vkGetPhysicalDeviceProperties2KHR"
               vkgetphysicaldeviceproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pproperties (:pointer (:struct vkphysicaldeviceproperties2))))

(cffi:defcfun ("vkGetPhysicalDeviceFormatProperties2KHR"
               vkgetphysicaldeviceformatproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (format vkformat)
  (pformatproperties (:pointer (:struct vkformatproperties2))))

(cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties2KHR"
               vkgetphysicaldeviceimageformatproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pimageformatinfo (:pointer (:struct vkphysicaldeviceimageformatinfo2)))
  (pimageformatproperties (:pointer (:struct vkimageformatproperties2))))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties2KHR"
               vkgetphysicaldevicequeuefamilyproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pqueuefamilypropertycount (:pointer :uint32))
  (pqueuefamilyproperties (:pointer (:struct vkqueuefamilyproperties2))))

(cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties2KHR"
               vkgetphysicaldevicememoryproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pmemoryproperties (:pointer (:struct vkphysicaldevicememoryproperties2))))

(cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties2KHR"
               vkgetphysicaldevicesparseimageformatproperties2khr)
    :void
  (physicaldevice vkphysicaldevice)
  (pformatinfo (:pointer (:struct vkphysicaldevicesparseimageformatinfo2)))
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vksparseimageformatproperties2))))

(cffi:defcfun ("vkGetDeviceGroupPeerMemoryFeaturesKHR"
               vkgetdevicegrouppeermemoryfeatureskhr)
    :void
  (device vkdevice)
  (heapindex :uint32)
  (localdeviceindex :uint32)
  (remotedeviceindex :uint32)
  (ppeermemoryfeatures (:pointer vkpeermemoryfeatureflags)))

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
  (pphysicaldevicegroupcount (:pointer :uint32))
  (pphysicaldevicegroupproperties
   (:pointer (:struct vkphysicaldevicegroupproperties))))

(cffi:defcfun ("vkGetPhysicalDeviceExternalBufferPropertiesKHR"
               vkgetphysicaldeviceexternalbufferpropertieskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalbufferinfo (:pointer (:struct vkphysicaldeviceexternalbufferinfo)))
  (pexternalbufferproperties (:pointer (:struct vkexternalbufferproperties))))

(cffi:defcfun ("vkGetMemoryFdKHR" vkgetmemoryfdkhr)
    vkresult
  (device vkdevice)
  (pgetfdinfo (:pointer (:struct vkmemorygetfdinfokhr)))
  (pfd (:pointer :int)))

(cffi:defcfun ("vkGetMemoryFdPropertiesKHR" vkgetmemoryfdpropertieskhr)
    vkresult
  (device vkdevice)
  (handletype vkexternalmemoryhandletypeflagbits)
  (fd :int)
  (pmemoryfdproperties (:pointer (:struct vkmemoryfdpropertieskhr))))

(cffi:defcfun ("vkGetPhysicalDeviceExternalSemaphorePropertiesKHR"
               vkgetphysicaldeviceexternalsemaphorepropertieskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalsemaphoreinfo
   (:pointer (:struct vkphysicaldeviceexternalsemaphoreinfo)))
  (pexternalsemaphoreproperties
   (:pointer (:struct vkexternalsemaphoreproperties))))

(cffi:defcfun ("vkImportSemaphoreFdKHR" vkimportsemaphorefdkhr)
    vkresult
  (device vkdevice)
  (pimportsemaphorefdinfo (:pointer (:struct vkimportsemaphorefdinfokhr))))

(cffi:defcfun ("vkGetSemaphoreFdKHR" vkgetsemaphorefdkhr)
    vkresult
  (device vkdevice)
  (pgetfdinfo (:pointer (:struct vksemaphoregetfdinfokhr)))
  (pfd (:pointer :int)))

(cffi:defcfun ("vkCmdPushDescriptorSetKHR" vkcmdpushdescriptorsetkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pipelinebindpoint vkpipelinebindpoint)
  (layout vkpipelinelayout)
  (set :uint32)
  (descriptorwritecount :uint32)
  (pdescriptorwrites (:pointer (:struct vkwritedescriptorset))))

(cffi:defcfun ("vkCmdPushDescriptorSetWithTemplateKHR"
               vkcmdpushdescriptorsetwithtemplatekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (layout vkpipelinelayout)
  (set :uint32)
  (pdata (:pointer :void)))

(cffi:defcfun ("vkCreateDescriptorUpdateTemplateKHR"
               vkcreatedescriptorupdatetemplatekhr)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkdescriptorupdatetemplatecreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pdescriptorupdatetemplate (:pointer vkdescriptorupdatetemplate)))

(cffi:defcfun ("vkDestroyDescriptorUpdateTemplateKHR"
               vkdestroydescriptorupdatetemplatekhr)
    :void
  (device vkdevice)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkUpdateDescriptorSetWithTemplateKHR"
               vkupdatedescriptorsetwithtemplatekhr)
    :void
  (device vkdevice)
  (descriptorset vkdescriptorset)
  (descriptorupdatetemplate vkdescriptorupdatetemplate)
  (pdata (:pointer :void)))

(cffi:defcfun ("vkCreateRenderPass2KHR" vkcreaterenderpass2khr)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkrenderpasscreateinfo2)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (prenderpass (:pointer vkrenderpass)))

(cffi:defcfun ("vkCmdBeginRenderPass2KHR" vkcmdbeginrenderpass2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (prenderpassbegin (:pointer (:struct vkrenderpassbegininfo)))
  (psubpassbegininfo (:pointer (:struct vksubpassbegininfo))))

(cffi:defcfun ("vkCmdNextSubpass2KHR" vkcmdnextsubpass2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassbegininfo (:pointer (:struct vksubpassbegininfo)))
  (psubpassendinfo (:pointer (:struct vksubpassendinfo))))

(cffi:defcfun ("vkCmdEndRenderPass2KHR" vkcmdendrenderpass2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (psubpassendinfo (:pointer (:struct vksubpassendinfo))))

(cffi:defcfun ("vkGetSwapchainStatusKHR" vkgetswapchainstatuskhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr))

(cffi:defcfun ("vkGetPhysicalDeviceExternalFencePropertiesKHR"
               vkgetphysicaldeviceexternalfencepropertieskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pexternalfenceinfo (:pointer (:struct vkphysicaldeviceexternalfenceinfo)))
  (pexternalfenceproperties (:pointer (:struct vkexternalfenceproperties))))

(cffi:defcfun ("vkImportFenceFdKHR" vkimportfencefdkhr)
    vkresult
  (device vkdevice)
  (pimportfencefdinfo (:pointer (:struct vkimportfencefdinfokhr))))

(cffi:defcfun ("vkGetFenceFdKHR" vkgetfencefdkhr)
    vkresult
  (device vkdevice)
  (pgetfdinfo (:pointer (:struct vkfencegetfdinfokhr)))
  (pfd (:pointer :int)))

(cffi:defcfun ("vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR"
               vkenumeratephysicaldevicequeuefamilyperformancequerycounterskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (queuefamilyindex :uint32)
  (pcountercount (:pointer :uint32))
  (pcounters (:pointer (:struct vkperformancecounterkhr)))
  (pcounterdescriptions
   (:pointer (:struct vkperformancecounterdescriptionkhr))))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR"
               vkgetphysicaldevicequeuefamilyperformancequerypasseskhr)
    :void
  (physicaldevice vkphysicaldevice)
  (pperformancequerycreateinfo
   (:pointer (:struct vkquerypoolperformancecreateinfokhr)))
  (pnumpasses (:pointer :uint32)))

(cffi:defcfun ("vkAcquireProfilingLockKHR" vkacquireprofilinglockkhr)
    vkresult
  (device vkdevice)
  (pinfo (:pointer (:struct vkacquireprofilinglockinfokhr))))

(cffi:defcfun ("vkReleaseProfilingLockKHR" vkreleaseprofilinglockkhr)
    :void
  (device vkdevice))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilities2KHR"
               vkgetphysicaldevicesurfacecapabilities2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (psurfaceinfo (:pointer (:struct vkphysicaldevicesurfaceinfo2khr)))
  (psurfacecapabilities (:pointer (:struct vksurfacecapabilities2khr))))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceFormats2KHR"
               vkgetphysicaldevicesurfaceformats2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (psurfaceinfo (:pointer (:struct vkphysicaldevicesurfaceinfo2khr)))
  (psurfaceformatcount (:pointer :uint32))
  (psurfaceformats (:pointer (:struct vksurfaceformat2khr))))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayProperties2KHR"
               vkgetphysicaldevicedisplayproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vkdisplayproperties2khr))))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayPlaneProperties2KHR"
               vkgetphysicaldevicedisplayplaneproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vkdisplayplaneproperties2khr))))

(cffi:defcfun ("vkGetDisplayModeProperties2KHR" vkgetdisplaymodeproperties2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr)
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vkdisplaymodeproperties2khr))))

(cffi:defcfun ("vkGetDisplayPlaneCapabilities2KHR"
               vkgetdisplayplanecapabilities2khr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pdisplayplaneinfo (:pointer (:struct vkdisplayplaneinfo2khr)))
  (pcapabilities (:pointer (:struct vkdisplayplanecapabilities2khr))))

(cffi:defcfun ("vkGetImageMemoryRequirements2KHR"
               vkgetimagememoryrequirements2khr)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkimagememoryrequirementsinfo2)))
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements2))))

(cffi:defcfun ("vkGetBufferMemoryRequirements2KHR"
               vkgetbuffermemoryrequirements2khr)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkbuffermemoryrequirementsinfo2)))
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements2))))

(cffi:defcfun ("vkGetImageSparseMemoryRequirements2KHR"
               vkgetimagesparsememoryrequirements2khr)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkimagesparsememoryrequirementsinfo2)))
  (psparsememoryrequirementcount (:pointer :uint32))
  (psparsememoryrequirements
   (:pointer (:struct vksparseimagememoryrequirements2))))

(cffi:defcfun ("vkCreateSamplerYcbcrConversionKHR"
               vkcreatesamplerycbcrconversionkhr)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vksamplerycbcrconversioncreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pycbcrconversion (:pointer vksamplerycbcrconversion)))

(cffi:defcfun ("vkDestroySamplerYcbcrConversionKHR"
               vkdestroysamplerycbcrconversionkhr)
    :void
  (device vkdevice)
  (ycbcrconversion vksamplerycbcrconversion)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkBindBufferMemory2KHR" vkbindbuffermemory2khr)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos (:pointer (:struct vkbindbuffermemoryinfo))))

(cffi:defcfun ("vkBindImageMemory2KHR" vkbindimagememory2khr)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos (:pointer (:struct vkbindimagememoryinfo))))

(cffi:defcfun ("vkGetDescriptorSetLayoutSupportKHR"
               vkgetdescriptorsetlayoutsupportkhr)
    :void
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkdescriptorsetlayoutcreateinfo)))
  (psupport (:pointer (:struct vkdescriptorsetlayoutsupport))))

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
  (pvalue (:pointer :uint64)))

(cffi:defcfun ("vkWaitSemaphoresKHR" vkwaitsemaphoreskhr)
    vkresult
  (device vkdevice)
  (pwaitinfo (:pointer (:struct vksemaphorewaitinfo)))
  (timeout :uint64))

(cffi:defcfun ("vkSignalSemaphoreKHR" vksignalsemaphorekhr)
    vkresult
  (device vkdevice)
  (psignalinfo (:pointer (:struct vksemaphoresignalinfo))))

(cffi:defcfun ("vkGetPhysicalDeviceFragmentShadingRatesKHR"
               vkgetphysicaldevicefragmentshadingrateskhr)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pfragmentshadingratecount (:pointer :uint32))
  (pfragmentshadingrates
   (:pointer (:struct vkphysicaldevicefragmentshadingratekhr))))

(cffi:defcfun ("vkCmdSetFragmentShadingRateKHR" vkcmdsetfragmentshadingratekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pfragmentsize (:pointer (:struct vkextent2d)))
  (combinerops[2] vkfragmentshadingratecombineropkhr))

(cffi:defcfun ("vkWaitForPresentKHR" vkwaitforpresentkhr)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (presentid :uint64)
  (timeout :uint64))

(cffi:defcfun ("vkGetBufferDeviceAddressKHR" vkgetbufferdeviceaddresskhr)
    vkdeviceaddress
  (device vkdevice)
  (pinfo (:pointer (:struct vkbufferdeviceaddressinfo))))

(cffi:defcfun ("vkGetBufferOpaqueCaptureAddressKHR"
               vkgetbufferopaquecaptureaddresskhr)
    :uint64
  (device vkdevice)
  (pinfo (:pointer (:struct vkbufferdeviceaddressinfo))))

(cffi:defcfun ("vkGetDeviceMemoryOpaqueCaptureAddressKHR"
               vkgetdevicememoryopaquecaptureaddresskhr)
    :uint64
  (device vkdevice)
  (pinfo (:pointer (:struct vkdevicememoryopaquecaptureaddressinfo))))

(cffi:defcfun ("vkCreateDeferredOperationKHR" vkcreatedeferredoperationkhr)
    vkresult
  (device vkdevice)
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pdeferredoperation (:pointer vkdeferredoperationkhr)))

(cffi:defcfun ("vkDestroyDeferredOperationKHR" vkdestroydeferredoperationkhr)
    :void
  (device vkdevice)
  (operation vkdeferredoperationkhr)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

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
  (ppipelineinfo (:pointer (:struct vkpipelineinfokhr)))
  (pexecutablecount (:pointer :uint32))
  (pproperties (:pointer (:struct vkpipelineexecutablepropertieskhr))))

(cffi:defcfun ("vkGetPipelineExecutableStatisticsKHR"
               vkgetpipelineexecutablestatisticskhr)
    vkresult
  (device vkdevice)
  (pexecutableinfo (:pointer (:struct vkpipelineexecutableinfokhr)))
  (pstatisticcount (:pointer :uint32))
  (pstatistics (:pointer (:struct vkpipelineexecutablestatistickhr))))

(cffi:defcfun ("vkGetPipelineExecutableInternalRepresentationsKHR"
               vkgetpipelineexecutableinternalrepresentationskhr)
    vkresult
  (device vkdevice)
  (pexecutableinfo (:pointer (:struct vkpipelineexecutableinfokhr)))
  (pinternalrepresentationcount (:pointer :uint32))
  (pinternalrepresentations
   (:pointer (:struct vkpipelineexecutableinternalrepresentationkhr))))

(cffi:defcfun ("vkCmdSetEvent2KHR" vkcmdsetevent2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (pdependencyinfo (:pointer (:struct vkdependencyinfo))))

(cffi:defcfun ("vkCmdResetEvent2KHR" vkcmdresetevent2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (event vkevent)
  (stagemask vkpipelinestageflags2))

(cffi:defcfun ("vkCmdWaitEvents2KHR" vkcmdwaitevents2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (eventcount :uint32)
  (pevents (:pointer vkevent))
  (pdependencyinfos (:pointer (:struct vkdependencyinfo))))

(cffi:defcfun ("vkCmdPipelineBarrier2KHR" vkcmdpipelinebarrier2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pdependencyinfo (:pointer (:struct vkdependencyinfo))))

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
  (psubmits (:pointer (:struct vksubmitinfo2)))
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
  (pcheckpointdatacount (:pointer :uint32))
  (pcheckpointdata (:pointer (:struct vkcheckpointdata2nv))))

(cffi:defcfun ("vkCmdCopyBuffer2KHR" vkcmdcopybuffer2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybufferinfo (:pointer (:struct vkcopybufferinfo2))))

(cffi:defcfun ("vkCmdCopyImage2KHR" vkcmdcopyimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimageinfo (:pointer (:struct vkcopyimageinfo2))))

(cffi:defcfun ("vkCmdCopyBufferToImage2KHR" vkcmdcopybuffertoimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopybuffertoimageinfo (:pointer (:struct vkcopybuffertoimageinfo2))))

(cffi:defcfun ("vkCmdCopyImageToBuffer2KHR" vkcmdcopyimagetobuffer2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pcopyimagetobufferinfo (:pointer (:struct vkcopyimagetobufferinfo2))))

(cffi:defcfun ("vkCmdBlitImage2KHR" vkcmdblitimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (pblitimageinfo (:pointer (:struct vkblitimageinfo2))))

(cffi:defcfun ("vkCmdResolveImage2KHR" vkcmdresolveimage2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (presolveimageinfo (:pointer (:struct vkresolveimageinfo2))))

(cffi:defcfun ("vkCmdTraceRaysIndirect2KHR" vkcmdtraceraysindirect2khr)
    :void
  (commandbuffer vkcommandbuffer)
  (indirectdeviceaddress vkdeviceaddress))

(cffi:defcfun ("vkGetDeviceBufferMemoryRequirementsKHR"
               vkgetdevicebuffermemoryrequirementskhr)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkdevicebuffermemoryrequirements)))
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements2))))

(cffi:defcfun ("vkGetDeviceImageMemoryRequirementsKHR"
               vkgetdeviceimagememoryrequirementskhr)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkdeviceimagememoryrequirements)))
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements2))))

(cffi:defcfun ("vkGetDeviceImageSparseMemoryRequirementsKHR"
               vkgetdeviceimagesparsememoryrequirementskhr)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkdeviceimagememoryrequirements)))
  (psparsememoryrequirementcount (:pointer :uint32))
  (psparsememoryrequirements
   (:pointer (:struct vksparseimagememoryrequirements2))))

(cffi:defcfun ("vkCreateDebugReportCallbackEXT" vkcreatedebugreportcallbackext)
    vkresult
  (instance vkinstance)
  (pcreateinfo (:pointer (:struct vkdebugreportcallbackcreateinfoext)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pcallback (:pointer vkdebugreportcallbackext)))

(cffi:defcfun ("vkDestroyDebugReportCallbackEXT"
               vkdestroydebugreportcallbackext)
    :void
  (instance vkinstance)
  (callback vkdebugreportcallbackext)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkDebugReportMessageEXT" vkdebugreportmessageext)
    :void
  (instance vkinstance)
  (flags vkdebugreportflagsext)
  (objecttype vkdebugreportobjecttypeext)
  (object :uint64)
  (location :size)
  (messagecode :int32)
  (playerprefix (:pointer :char))
  (pmessage (:pointer :char)))

(cffi:defcfun ("vkDebugMarkerSetObjectTagEXT" vkdebugmarkersetobjecttagext)
    vkresult
  (device vkdevice)
  (ptaginfo (:pointer (:struct vkdebugmarkerobjecttaginfoext))))

(cffi:defcfun ("vkDebugMarkerSetObjectNameEXT" vkdebugmarkersetobjectnameext)
    vkresult
  (device vkdevice)
  (pnameinfo (:pointer (:struct vkdebugmarkerobjectnameinfoext))))

(cffi:defcfun ("vkCmdDebugMarkerBeginEXT" vkcmddebugmarkerbeginext)
    :void
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo (:pointer (:struct vkdebugmarkermarkerinfoext))))

(cffi:defcfun ("vkCmdDebugMarkerEndEXT" vkcmddebugmarkerendext)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkCmdDebugMarkerInsertEXT" vkcmddebugmarkerinsertext)
    :void
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo (:pointer (:struct vkdebugmarkermarkerinfoext))))

(cffi:defcfun ("vkCmdBindTransformFeedbackBuffersEXT"
               vkcmdbindtransformfeedbackbuffersext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers (:pointer vkbuffer))
  (poffsets (:pointer vkdevicesize))
  (psizes (:pointer vkdevicesize)))

(cffi:defcfun ("vkCmdBeginTransformFeedbackEXT" vkcmdbegintransformfeedbackext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstcounterbuffer :uint32)
  (counterbuffercount :uint32)
  (pcounterbuffers (:pointer vkbuffer))
  (pcounterbufferoffsets (:pointer vkdevicesize)))

(cffi:defcfun ("vkCmdEndTransformFeedbackEXT" vkcmdendtransformfeedbackext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstcounterbuffer :uint32)
  (counterbuffercount :uint32)
  (pcounterbuffers (:pointer vkbuffer))
  (pcounterbufferoffsets (:pointer vkdevicesize)))

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
  (pcreateinfo (:pointer (:struct vkcumodulecreateinfonvx)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pmodule (:pointer vkcumodulenvx)))

(cffi:defcfun ("vkCreateCuFunctionNVX" vkcreatecufunctionnvx)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkcufunctioncreateinfonvx)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pfunction (:pointer vkcufunctionnvx)))

(cffi:defcfun ("vkDestroyCuModuleNVX" vkdestroycumodulenvx)
    :void
  (device vkdevice)
  (module vkcumodulenvx)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkDestroyCuFunctionNVX" vkdestroycufunctionnvx)
    :void
  (device vkdevice)
  #'vkcufunctionnvx
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCmdCuLaunchKernelNVX" vkcmdculaunchkernelnvx)
    :void
  (commandbuffer vkcommandbuffer)
  (plaunchinfo (:pointer (:struct vkculaunchinfonvx))))

(cffi:defcfun ("vkGetImageViewHandleNVX" vkgetimageviewhandlenvx)
    :uint32
  (device vkdevice)
  (pinfo (:pointer (:struct vkimageviewhandleinfonvx))))

(cffi:defcfun ("vkGetImageViewAddressNVX" vkgetimageviewaddressnvx)
    vkresult
  (device vkdevice)
  (imageview vkimageview)
  (pproperties (:pointer (:struct vkimageviewaddresspropertiesnvx))))

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
  (pinfosize (:pointer :size))
  (pinfo (:pointer :void)))

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
  (pexternalimageformatproperties
   (:pointer (:struct vkexternalimageformatpropertiesnv))))

(cffi:defcfun ("vkCmdBeginConditionalRenderingEXT"
               vkcmdbeginconditionalrenderingext)
    :void
  (commandbuffer vkcommandbuffer)
  (pconditionalrenderingbegin
   (:pointer (:struct vkconditionalrenderingbegininfoext))))

(cffi:defcfun ("vkCmdEndConditionalRenderingEXT"
               vkcmdendconditionalrenderingext)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkCmdSetViewportWScalingNV" vkcmdsetviewportwscalingnv)
    :void
  (commandbuffer vkcommandbuffer)
  (firstviewport :uint32)
  (viewportcount :uint32)
  (pviewportwscalings (:pointer (:struct vkviewportwscalingnv))))

(cffi:defcfun ("vkReleaseDisplayEXT" vkreleasedisplayext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilities2EXT"
               vkgetphysicaldevicesurfacecapabilities2ext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (surface vksurfacekhr)
  (psurfacecapabilities (:pointer (:struct vksurfacecapabilities2ext))))

(cffi:defcfun ("vkDisplayPowerControlEXT" vkdisplaypowercontrolext)
    vkresult
  (device vkdevice)
  (display vkdisplaykhr)
  (pdisplaypowerinfo (:pointer (:struct vkdisplaypowerinfoext))))

(cffi:defcfun ("vkRegisterDeviceEventEXT" vkregisterdeviceeventext)
    vkresult
  (device vkdevice)
  (pdeviceeventinfo (:pointer (:struct vkdeviceeventinfoext)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pfence (:pointer vkfence)))

(cffi:defcfun ("vkRegisterDisplayEventEXT" vkregisterdisplayeventext)
    vkresult
  (device vkdevice)
  (display vkdisplaykhr)
  (pdisplayeventinfo (:pointer (:struct vkdisplayeventinfoext)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pfence (:pointer vkfence)))

(cffi:defcfun ("vkGetSwapchainCounterEXT" vkgetswapchaincounterext)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (counter vksurfacecounterflagbitsext)
  (pcountervalue (:pointer :uint64)))

(cffi:defcfun ("vkGetRefreshCycleDurationGOOGLE"
               vkgetrefreshcycledurationgoogle)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (pdisplaytimingproperties (:pointer (:struct vkrefreshcycledurationgoogle))))

(cffi:defcfun ("vkGetPastPresentationTimingGOOGLE"
               vkgetpastpresentationtiminggoogle)
    vkresult
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (ppresentationtimingcount (:pointer :uint32))
  (ppresentationtimings (:pointer (:struct vkpastpresentationtiminggoogle))))

(cffi:defcfun ("vkCmdSetDiscardRectangleEXT" vkcmdsetdiscardrectangleext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstdiscardrectangle :uint32)
  (discardrectanglecount :uint32)
  (pdiscardrectangles (:pointer (:struct vkrect2d))))

(cffi:defcfun ("vkSetHdrMetadataEXT" vksethdrmetadataext)
    :void
  (device vkdevice)
  (swapchaincount :uint32)
  (pswapchains (:pointer vkswapchainkhr))
  (pmetadata (:pointer (:struct vkhdrmetadataext))))

(cffi:defcfun ("vkSetDebugUtilsObjectNameEXT" vksetdebugutilsobjectnameext)
    vkresult
  (device vkdevice)
  (pnameinfo (:pointer (:struct vkdebugutilsobjectnameinfoext))))

(cffi:defcfun ("vkSetDebugUtilsObjectTagEXT" vksetdebugutilsobjecttagext)
    vkresult
  (device vkdevice)
  (ptaginfo (:pointer (:struct vkdebugutilsobjecttaginfoext))))

(cffi:defcfun ("vkQueueBeginDebugUtilsLabelEXT" vkqueuebegindebugutilslabelext)
    :void
  (queue vkqueue)
  (plabelinfo (:pointer (:struct vkdebugutilslabelext))))

(cffi:defcfun ("vkQueueEndDebugUtilsLabelEXT" vkqueueenddebugutilslabelext)
    :void
  (queue vkqueue))

(cffi:defcfun ("vkQueueInsertDebugUtilsLabelEXT"
               vkqueueinsertdebugutilslabelext)
    :void
  (queue vkqueue)
  (plabelinfo (:pointer (:struct vkdebugutilslabelext))))

(cffi:defcfun ("vkCmdBeginDebugUtilsLabelEXT" vkcmdbegindebugutilslabelext)
    :void
  (commandbuffer vkcommandbuffer)
  (plabelinfo (:pointer (:struct vkdebugutilslabelext))))

(cffi:defcfun ("vkCmdEndDebugUtilsLabelEXT" vkcmdenddebugutilslabelext)
    :void
  (commandbuffer vkcommandbuffer))

(cffi:defcfun ("vkCmdInsertDebugUtilsLabelEXT" vkcmdinsertdebugutilslabelext)
    :void
  (commandbuffer vkcommandbuffer)
  (plabelinfo (:pointer (:struct vkdebugutilslabelext))))

(cffi:defcfun ("vkCreateDebugUtilsMessengerEXT" vkcreatedebugutilsmessengerext)
    vkresult
  (instance vkinstance)
  (pcreateinfo (:pointer (:struct vkdebugutilsmessengercreateinfoext)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pmessenger (:pointer vkdebugutilsmessengerext)))

(cffi:defcfun ("vkDestroyDebugUtilsMessengerEXT"
               vkdestroydebugutilsmessengerext)
    :void
  (instance vkinstance)
  (messenger vkdebugutilsmessengerext)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkSubmitDebugUtilsMessageEXT" vksubmitdebugutilsmessageext)
    :void
  (instance vkinstance)
  (messageseverity vkdebugutilsmessageseverityflagbitsext)
  (messagetypes vkdebugutilsmessagetypeflagsext)
  (pcallbackdata (:pointer (:struct vkdebugutilsmessengercallbackdataext))))

(cffi:defcfun ("vkCmdSetSampleLocationsEXT" vkcmdsetsamplelocationsext)
    :void
  (commandbuffer vkcommandbuffer)
  (psamplelocationsinfo (:pointer (:struct vksamplelocationsinfoext))))

(cffi:defcfun ("vkGetPhysicalDeviceMultisamplePropertiesEXT"
               vkgetphysicaldevicemultisamplepropertiesext)
    :void
  (physicaldevice vkphysicaldevice)
  (samples vksamplecountflagbits)
  (pmultisampleproperties (:pointer (:struct vkmultisamplepropertiesext))))

(cffi:defcfun ("vkGetImageDrmFormatModifierPropertiesEXT"
               vkgetimagedrmformatmodifierpropertiesext)
    vkresult
  (device vkdevice)
  (image vkimage)
  (pproperties (:pointer (:struct vkimagedrmformatmodifierpropertiesext))))

(cffi:defcfun ("vkCreateValidationCacheEXT" vkcreatevalidationcacheext)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkvalidationcachecreateinfoext)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pvalidationcache (:pointer vkvalidationcacheext)))

(cffi:defcfun ("vkDestroyValidationCacheEXT" vkdestroyvalidationcacheext)
    :void
  (device vkdevice)
  (validationcache vkvalidationcacheext)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkMergeValidationCachesEXT" vkmergevalidationcachesext)
    vkresult
  (device vkdevice)
  (dstcache vkvalidationcacheext)
  (srccachecount :uint32)
  (psrccaches (:pointer vkvalidationcacheext)))

(cffi:defcfun ("vkGetValidationCacheDataEXT" vkgetvalidationcachedataext)
    vkresult
  (device vkdevice)
  (validationcache vkvalidationcacheext)
  (pdatasize (:pointer :size))
  (pdata (:pointer :void)))

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
  (pshadingratepalettes (:pointer (:struct vkshadingratepalettenv))))

(cffi:defcfun ("vkCmdSetCoarseSampleOrderNV" vkcmdsetcoarsesampleordernv)
    :void
  (commandbuffer vkcommandbuffer)
  (sampleordertype vkcoarsesampleordertypenv)
  (customsampleordercount :uint32)
  (pcustomsampleorders (:pointer (:struct vkcoarsesampleordercustomnv))))

(cffi:defcfun ("vkCreateAccelerationStructureNV"
               vkcreateaccelerationstructurenv)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkaccelerationstructurecreateinfonv)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (paccelerationstructure (:pointer vkaccelerationstructurenv)))

(cffi:defcfun ("vkDestroyAccelerationStructureNV"
               vkdestroyaccelerationstructurenv)
    :void
  (device vkdevice)
  (accelerationstructure vkaccelerationstructurenv)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkGetAccelerationStructureMemoryRequirementsNV"
               vkgetaccelerationstructurememoryrequirementsnv)
    :void
  (device vkdevice)
  (pinfo (:pointer (:struct vkaccelerationstructurememoryrequirementsinfonv)))
  (pmemoryrequirements (:pointer vkmemoryrequirements2khr)))

(cffi:defcfun ("vkBindAccelerationStructureMemoryNV"
               vkbindaccelerationstructurememorynv)
    vkresult
  (device vkdevice)
  (bindinfocount :uint32)
  (pbindinfos (:pointer (:struct vkbindaccelerationstructurememoryinfonv))))

(cffi:defcfun ("vkCmdBuildAccelerationStructureNV"
               vkcmdbuildaccelerationstructurenv)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo (:pointer (:struct vkaccelerationstructureinfonv)))
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
  (pcreateinfos (:pointer (:struct vkraytracingpipelinecreateinfonv)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (ppipelines (:pointer vkpipeline)))

(cffi:defcfun ("vkGetRayTracingShaderGroupHandlesKHR"
               vkgetraytracingshadergrouphandleskhr)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (firstgroup :uint32)
  (groupcount :uint32)
  (datasize :size)
  (pdata (:pointer :void)))

(cffi:defcfun ("vkGetRayTracingShaderGroupHandlesNV"
               vkgetraytracingshadergrouphandlesnv)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (firstgroup :uint32)
  (groupcount :uint32)
  (datasize :size)
  (pdata (:pointer :void)))

(cffi:defcfun ("vkGetAccelerationStructureHandleNV"
               vkgetaccelerationstructurehandlenv)
    vkresult
  (device vkdevice)
  (accelerationstructure vkaccelerationstructurenv)
  (datasize :size)
  (pdata (:pointer :void)))

(cffi:defcfun ("vkCmdWriteAccelerationStructuresPropertiesNV"
               vkcmdwriteaccelerationstructurespropertiesnv)
    :void
  (commandbuffer vkcommandbuffer)
  (accelerationstructurecount :uint32)
  (paccelerationstructures (:pointer vkaccelerationstructurenv))
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
  (phostpointer (:pointer :void))
  (pmemoryhostpointerproperties
   (:pointer (:struct vkmemoryhostpointerpropertiesext))))

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
  (ptimedomaincount (:pointer :uint32))
  (ptimedomains (:pointer vktimedomainext)))

(cffi:defcfun ("vkGetCalibratedTimestampsEXT" vkgetcalibratedtimestampsext)
    vkresult
  (device vkdevice)
  (timestampcount :uint32)
  (ptimestampinfos (:pointer (:struct vkcalibratedtimestampinfoext)))
  (ptimestamps (:pointer :uint64))
  (pmaxdeviation (:pointer :uint64)))

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
  (pexclusivescissors (:pointer (:struct vkrect2d))))

(cffi:defcfun ("vkCmdSetCheckpointNV" vkcmdsetcheckpointnv)
    :void
  (commandbuffer vkcommandbuffer)
  (pcheckpointmarker (:pointer :void)))

(cffi:defcfun ("vkGetQueueCheckpointDataNV" vkgetqueuecheckpointdatanv)
    :void
  (queue vkqueue)
  (pcheckpointdatacount (:pointer :uint32))
  (pcheckpointdata (:pointer (:struct vkcheckpointdatanv))))

(cffi:defcfun ("vkInitializePerformanceApiINTEL"
               vkinitializeperformanceapiintel)
    vkresult
  (device vkdevice)
  (pinitializeinfo (:pointer (:struct vkinitializeperformanceapiinfointel))))

(cffi:defcfun ("vkUninitializePerformanceApiINTEL"
               vkuninitializeperformanceapiintel)
    :void
  (device vkdevice))

(cffi:defcfun ("vkCmdSetPerformanceMarkerINTEL" vkcmdsetperformancemarkerintel)
    vkresult
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo (:pointer (:struct vkperformancemarkerinfointel))))

(cffi:defcfun ("vkCmdSetPerformanceStreamMarkerINTEL"
               vkcmdsetperformancestreammarkerintel)
    vkresult
  (commandbuffer vkcommandbuffer)
  (pmarkerinfo (:pointer (:struct vkperformancestreammarkerinfointel))))

(cffi:defcfun ("vkCmdSetPerformanceOverrideINTEL"
               vkcmdsetperformanceoverrideintel)
    vkresult
  (commandbuffer vkcommandbuffer)
  (poverrideinfo (:pointer (:struct vkperformanceoverrideinfointel))))

(cffi:defcfun ("vkAcquirePerformanceConfigurationINTEL"
               vkacquireperformanceconfigurationintel)
    vkresult
  (device vkdevice)
  (pacquireinfo (:pointer (:struct vkperformanceconfigurationacquireinfointel)))
  (pconfiguration (:pointer vkperformanceconfigurationintel)))

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
  (pvalue (:pointer (:struct vkperformancevalueintel))))

(cffi:defcfun ("vkSetLocalDimmingAMD" vksetlocaldimmingamd)
    :void
  (device vkdevice)
  (swapchain vkswapchainkhr)
  (localdimmingenable vkbool32))

(cffi:defcfun ("vkGetBufferDeviceAddressEXT" vkgetbufferdeviceaddressext)
    vkdeviceaddress
  (device vkdevice)
  (pinfo (:pointer (:struct vkbufferdeviceaddressinfo))))

(cffi:defcfun ("vkGetPhysicalDeviceToolPropertiesEXT"
               vkgetphysicaldevicetoolpropertiesext)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ptoolcount (:pointer :uint32))
  (ptoolproperties (:pointer (:struct vkphysicaldevicetoolproperties))))

(cffi:defcfun ("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV"
               vkgetphysicaldevicecooperativematrixpropertiesnv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (ppropertycount (:pointer :uint32))
  (pproperties (:pointer (:struct vkcooperativematrixpropertiesnv))))

(cffi:defcfun ("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV"
               vkgetphysicaldevicesupportedframebuffermixedsamplescombinationsnv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (pcombinationcount (:pointer :uint32))
  (pcombinations (:pointer (:struct vkframebuffermixedsamplescombinationnv))))

(cffi:defcfun ("vkCreateHeadlessSurfaceEXT" vkcreateheadlesssurfaceext)
    vkresult
  (instance vkinstance)
  (pcreateinfo (:pointer (:struct vkheadlesssurfacecreateinfoext)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (psurface (:pointer vksurfacekhr)))

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
  (pviewports (:pointer (:struct vkviewport))))

(cffi:defcfun ("vkCmdSetScissorWithCountEXT" vkcmdsetscissorwithcountext)
    :void
  (commandbuffer vkcommandbuffer)
  (scissorcount :uint32)
  (pscissors (:pointer (:struct vkrect2d))))

(cffi:defcfun ("vkCmdBindVertexBuffers2EXT" vkcmdbindvertexbuffers2ext)
    :void
  (commandbuffer vkcommandbuffer)
  (firstbinding :uint32)
  (bindingcount :uint32)
  (pbuffers (:pointer vkbuffer))
  (poffsets (:pointer vkdevicesize))
  (psizes (:pointer vkdevicesize))
  (pstrides (:pointer vkdevicesize)))

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
  (pinfo (:pointer (:struct vkgeneratedcommandsmemoryrequirementsinfonv)))
  (pmemoryrequirements (:pointer (:struct vkmemoryrequirements2))))

(cffi:defcfun ("vkCmdPreprocessGeneratedCommandsNV"
               vkcmdpreprocessgeneratedcommandsnv)
    :void
  (commandbuffer vkcommandbuffer)
  (pgeneratedcommandsinfo (:pointer (:struct vkgeneratedcommandsinfonv))))

(cffi:defcfun ("vkCmdExecuteGeneratedCommandsNV"
               vkcmdexecutegeneratedcommandsnv)
    :void
  (commandbuffer vkcommandbuffer)
  (ispreprocessed vkbool32)
  (pgeneratedcommandsinfo (:pointer (:struct vkgeneratedcommandsinfonv))))

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
  (pcreateinfo (:pointer (:struct vkindirectcommandslayoutcreateinfonv)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pindirectcommandslayout (:pointer vkindirectcommandslayoutnv)))

(cffi:defcfun ("vkDestroyIndirectCommandsLayoutNV"
               vkdestroyindirectcommandslayoutnv)
    :void
  (device vkdevice)
  (indirectcommandslayout vkindirectcommandslayoutnv)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

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
  (display (:pointer vkdisplaykhr)))

(cffi:defcfun ("vkCreatePrivateDataSlotEXT" vkcreateprivatedataslotext)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkprivatedataslotcreateinfo)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (pprivatedataslot (:pointer vkprivatedataslot)))

(cffi:defcfun ("vkDestroyPrivateDataSlotEXT" vkdestroyprivatedataslotext)
    :void
  (device vkdevice)
  (privatedataslot vkprivatedataslot)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

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
  (pdata (:pointer :uint64)))

(cffi:defcfun ("vkCmdSetFragmentShadingRateEnumNV"
               vkcmdsetfragmentshadingrateenumnv)
    :void
  (commandbuffer vkcommandbuffer)
  (shadingrate vkfragmentshadingratenv)
  (combinerops[2] vkfragmentshadingratecombineropkhr))

(cffi:defcfun ("vkGetImageSubresourceLayout2EXT"
               vkgetimagesubresourcelayout2ext)
    :void
  (device vkdevice)
  (image vkimage)
  (psubresource (:pointer (:struct vkimagesubresource2ext)))
  (playout (:pointer (:struct vksubresourcelayout2ext))))

(cffi:defcfun ("vkAcquireWinrtDisplayNV" vkacquirewinrtdisplaynv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (display vkdisplaykhr))

(cffi:defcfun ("vkGetWinrtDisplayNV" vkgetwinrtdisplaynv)
    vkresult
  (physicaldevice vkphysicaldevice)
  (devicerelativeid :uint32)
  (pdisplay (:pointer vkdisplaykhr)))

(cffi:defcfun ("vkCmdSetVertexInputEXT" vkcmdsetvertexinputext)
    :void
  (commandbuffer vkcommandbuffer)
  (vertexbindingdescriptioncount :uint32)
  (pvertexbindingdescriptions
   (:pointer (:struct vkvertexinputbindingdescription2ext)))
  (vertexattributedescriptioncount :uint32)
  (pvertexattributedescriptions
   (:pointer (:struct vkvertexinputattributedescription2ext))))

(cffi:defcfun ("vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI"
               vkgetdevicesubpassshadingmaxworkgroupsizehuawei)
    vkresult
  (device vkdevice)
  (renderpass vkrenderpass)
  (pmaxworkgroupsize (:pointer (:struct vkextent2d))))

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
  (pmemorygetremoteaddressinfo
   (:pointer (:struct vkmemorygetremoteaddressinfonv)))
  (paddress (:pointer vkremoteaddressnv)))

(cffi:defcfun ("vkGetPipelinePropertiesEXT" vkgetpipelinepropertiesext)
    vkresult
  (device vkdevice)
  (ppipelineinfo (:pointer vkpipelineinfoext))
  (ppipelineproperties (:pointer (:struct vkbaseoutstructure))))

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
  (pcolorwriteenables (:pointer vkbool32)))

(cffi:defcfun ("vkCmdDrawMultiEXT" vkcmddrawmultiext)
    :void
  (commandbuffer vkcommandbuffer)
  (drawcount :uint32)
  (pvertexinfo (:pointer (:struct vkmultidrawinfoext)))
  (instancecount :uint32)
  (firstinstance :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawMultiIndexedEXT" vkcmddrawmultiindexedext)
    :void
  (commandbuffer vkcommandbuffer)
  (drawcount :uint32)
  (pindexinfo (:pointer (:struct vkmultidrawindexedinfoext)))
  (instancecount :uint32)
  (firstinstance :uint32)
  (stride :uint32)
  (pvertexoffset (:pointer :int32)))

(cffi:defcfun ("vkSetDeviceMemoryPriorityEXT" vksetdevicememorypriorityext)
    :void
  (device vkdevice)
  (memory vkdevicememory)
  (priority :float))

(cffi:defcfun ("vkGetDescriptorSetLayoutHostMappingInfoVALVE"
               vkgetdescriptorsetlayouthostmappinginfovalve)
    :void
  (device vkdevice)
  (pbindingreference (:pointer (:struct vkdescriptorsetbindingreferencevalve)))
  (phostmapping (:pointer (:struct vkdescriptorsetlayouthostmappinginfovalve))))

(cffi:defcfun ("vkGetDescriptorSetHostMappingVALVE"
               vkgetdescriptorsethostmappingvalve)
    :void
  (device vkdevice)
  (descriptorset vkdescriptorset)
  (* (:pointer :void))
  ppdata)

(cffi:defcfun ("vkCreateAccelerationStructureKHR"
               vkcreateaccelerationstructurekhr)
    vkresult
  (device vkdevice)
  (pcreateinfo (:pointer (:struct vkaccelerationstructurecreateinfokhr)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (paccelerationstructure (:pointer vkaccelerationstructurekhr)))

(cffi:defcfun ("vkDestroyAccelerationStructureKHR"
               vkdestroyaccelerationstructurekhr)
    :void
  (device vkdevice)
  (accelerationstructure vkaccelerationstructurekhr)
  (pallocator (:pointer (:struct vkallocationcallbacks))))

(cffi:defcfun ("vkCmdBuildAccelerationStructuresKHR"
               vkcmdbuildaccelerationstructureskhr)
    :void
  (commandbuffer vkcommandbuffer)
  (infocount :uint32)
  (pinfos (:pointer (:struct vkaccelerationstructurebuildgeometryinfokhr)))
  (const* (:pointer (:struct vkaccelerationstructurebuildrangeinfokhr)))
  ppbuildrangeinfos)

(cffi:defcfun ("vkCmdBuildAccelerationStructuresIndirectKHR"
               vkcmdbuildaccelerationstructuresindirectkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (infocount :uint32)
  (pinfos (:pointer (:struct vkaccelerationstructurebuildgeometryinfokhr)))
  (pindirectdeviceaddresses (:pointer vkdeviceaddress))
  (pindirectstrides (:pointer :uint32))
  (const* (:pointer :uint32))
  ppmaxprimitivecounts)

(cffi:defcfun ("vkBuildAccelerationStructuresKHR"
               vkbuildaccelerationstructureskhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (infocount :uint32)
  (pinfos (:pointer (:struct vkaccelerationstructurebuildgeometryinfokhr)))
  (const* (:pointer (:struct vkaccelerationstructurebuildrangeinfokhr)))
  ppbuildrangeinfos)

(cffi:defcfun ("vkCopyAccelerationStructureKHR" vkcopyaccelerationstructurekhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pinfo (:pointer (:struct vkcopyaccelerationstructureinfokhr))))

(cffi:defcfun ("vkCopyAccelerationStructureToMemoryKHR"
               vkcopyaccelerationstructuretomemorykhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pinfo (:pointer (:struct vkcopyaccelerationstructuretomemoryinfokhr))))

(cffi:defcfun ("vkCopyMemoryToAccelerationStructureKHR"
               vkcopymemorytoaccelerationstructurekhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pinfo (:pointer (:struct vkcopymemorytoaccelerationstructureinfokhr))))

(cffi:defcfun ("vkWriteAccelerationStructuresPropertiesKHR"
               vkwriteaccelerationstructurespropertieskhr)
    vkresult
  (device vkdevice)
  (accelerationstructurecount :uint32)
  (paccelerationstructures (:pointer vkaccelerationstructurekhr))
  (querytype vkquerytype)
  (datasize :size)
  (pdata (:pointer :void))
  (stride :size))

(cffi:defcfun ("vkCmdCopyAccelerationStructureKHR"
               vkcmdcopyaccelerationstructurekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo (:pointer (:struct vkcopyaccelerationstructureinfokhr))))

(cffi:defcfun ("vkCmdCopyAccelerationStructureToMemoryKHR"
               vkcmdcopyaccelerationstructuretomemorykhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo (:pointer (:struct vkcopyaccelerationstructuretomemoryinfokhr))))

(cffi:defcfun ("vkCmdCopyMemoryToAccelerationStructureKHR"
               vkcmdcopymemorytoaccelerationstructurekhr)
    :void
  (commandbuffer vkcommandbuffer)
  (pinfo (:pointer (:struct vkcopymemorytoaccelerationstructureinfokhr))))

(cffi:defcfun ("vkGetAccelerationStructureDeviceAddressKHR"
               vkgetaccelerationstructuredeviceaddresskhr)
    vkdeviceaddress
  (device vkdevice)
  (pinfo (:pointer (:struct vkaccelerationstructuredeviceaddressinfokhr))))

(cffi:defcfun ("vkCmdWriteAccelerationStructuresPropertiesKHR"
               vkcmdwriteaccelerationstructurespropertieskhr)
    :void
  (commandbuffer vkcommandbuffer)
  (accelerationstructurecount :uint32)
  (paccelerationstructures (:pointer vkaccelerationstructurekhr))
  (querytype vkquerytype)
  (querypool vkquerypool)
  (firstquery :uint32))

(cffi:defcfun ("vkGetDeviceAccelerationStructureCompatibilityKHR"
               vkgetdeviceaccelerationstructurecompatibilitykhr)
    :void
  (device vkdevice)
  (pversioninfo (:pointer (:struct vkaccelerationstructureversioninfokhr)))
  (pcompatibility (:pointer vkaccelerationstructurecompatibilitykhr)))

(cffi:defcfun ("vkGetAccelerationStructureBuildSizesKHR"
               vkgetaccelerationstructurebuildsizeskhr)
    :void
  (device vkdevice)
  (buildtype vkaccelerationstructurebuildtypekhr)
  (pbuildinfo (:pointer (:struct vkaccelerationstructurebuildgeometryinfokhr)))
  (pmaxprimitivecounts (:pointer :uint32))
  (psizeinfo (:pointer (:struct vkaccelerationstructurebuildsizesinfokhr))))

(cffi:defcfun ("vkCmdTraceRaysKHR" vkcmdtracerayskhr)
    :void
  (commandbuffer vkcommandbuffer)
  (praygenshaderbindingtable
   (:pointer (:struct vkstrideddeviceaddressregionkhr)))
  (pmissshaderbindingtable (:pointer (:struct vkstrideddeviceaddressregionkhr)))
  (phitshaderbindingtable (:pointer (:struct vkstrideddeviceaddressregionkhr)))
  (pcallableshaderbindingtable
   (:pointer (:struct vkstrideddeviceaddressregionkhr)))
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(cffi:defcfun ("vkCreateRayTracingPipelinesKHR" vkcreateraytracingpipelineskhr)
    vkresult
  (device vkdevice)
  (deferredoperation vkdeferredoperationkhr)
  (pipelinecache vkpipelinecache)
  (createinfocount :uint32)
  (pcreateinfos (:pointer (:struct vkraytracingpipelinecreateinfokhr)))
  (pallocator (:pointer (:struct vkallocationcallbacks)))
  (ppipelines (:pointer vkpipeline)))

(cffi:defcfun ("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR"
               vkgetraytracingcapturereplayshadergrouphandleskhr)
    vkresult
  (device vkdevice)
  (pipeline vkpipeline)
  (firstgroup :uint32)
  (groupcount :uint32)
  (datasize :size)
  (pdata (:pointer :void)))

(cffi:defcfun ("vkCmdTraceRaysIndirectKHR" vkcmdtraceraysindirectkhr)
    :void
  (commandbuffer vkcommandbuffer)
  (praygenshaderbindingtable
   (:pointer (:struct vkstrideddeviceaddressregionkhr)))
  (pmissshaderbindingtable (:pointer (:struct vkstrideddeviceaddressregionkhr)))
  (phitshaderbindingtable (:pointer (:struct vkstrideddeviceaddressregionkhr)))
  (pcallableshaderbindingtable
   (:pointer (:struct vkstrideddeviceaddressregionkhr)))
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
