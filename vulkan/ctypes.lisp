
(in-package :cvk)

(cffi:defctype handle :pointer)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (if (= 8 (cffi:foreign-type-size :pointer))
      (cffi:defctype non-dispatchable-handle :pointer)
      (cffi:defctype non-dispatchable-handle :uint64)))

(cffi:defctype vkbool32 :uint32)

(cffi:defctype vkdeviceaddress :uint64)

(cffi:defctype vkdevicesize :uint64)

(cffi:defctype vkflags :uint32)

(cffi:defctype vksamplemask :uint32)

(cffi:defctype vkbuffer non-dispatchable-handle)

(cffi:defctype vkimage non-dispatchable-handle)

(cffi:defctype vkinstance handle)

(cffi:defctype vkphysicaldevice handle)

(cffi:defctype vkdevice handle)

(cffi:defctype vkqueue handle)

(cffi:defctype vksemaphore non-dispatchable-handle)

(cffi:defctype vkcommandbuffer handle)

(cffi:defctype vkfence non-dispatchable-handle)

(cffi:defctype vkdevicememory non-dispatchable-handle)

(cffi:defctype vkevent non-dispatchable-handle)

(cffi:defctype vkquerypool non-dispatchable-handle)

(cffi:defctype vkbufferview non-dispatchable-handle)

(cffi:defctype vkimageview non-dispatchable-handle)

(cffi:defctype vkshadermodule non-dispatchable-handle)

(cffi:defctype vkpipelinecache non-dispatchable-handle)

(cffi:defctype vkpipelinelayout non-dispatchable-handle)

(cffi:defctype vkpipeline non-dispatchable-handle)

(cffi:defctype vkrenderpass non-dispatchable-handle)

(cffi:defctype vkdescriptorsetlayout non-dispatchable-handle)

(cffi:defctype vksampler non-dispatchable-handle)

(cffi:defctype vkdescriptorset non-dispatchable-handle)

(cffi:defctype vkdescriptorpool non-dispatchable-handle)

(cffi:defctype vkframebuffer non-dispatchable-handle)

(cffi:defctype vkcommandpool non-dispatchable-handle)

(cffi:defctype vkaccessflags vkflags)

(cffi:defctype vkimageaspectflags vkflags)

(cffi:defctype vkformatfeatureflags vkflags)

(cffi:defctype vkimagecreateflags vkflags)

(cffi:defctype vksamplecountflags vkflags)

(cffi:defctype vkimageusageflags vkflags)

(cffi:defctype vkinstancecreateflags vkflags)

(cffi:defctype vkmemoryheapflags vkflags)

(cffi:defctype vkmemorypropertyflags vkflags)

(cffi:defctype vkqueueflags vkflags)

(cffi:defctype vkdevicecreateflags vkflags)

(cffi:defctype vkdevicequeuecreateflags vkflags)

(cffi:defctype vkpipelinestageflags vkflags)

(cffi:defctype vkmemorymapflags vkflags)

(cffi:defctype vksparsememorybindflags vkflags)

(cffi:defctype vksparseimageformatflags vkflags)

(cffi:defctype vkfencecreateflags vkflags)

(cffi:defctype vksemaphorecreateflags vkflags)

(cffi:defctype vkeventcreateflags vkflags)

(cffi:defctype vkquerypipelinestatisticflags vkflags)

(cffi:defctype vkquerypoolcreateflags vkflags)

(cffi:defctype vkqueryresultflags vkflags)

(cffi:defctype vkbuffercreateflags vkflags)

(cffi:defctype vkbufferusageflags vkflags)

(cffi:defctype vkbufferviewcreateflags vkflags)

(cffi:defctype vkimageviewcreateflags vkflags)

(cffi:defctype vkshadermodulecreateflags vkflags)

(cffi:defctype vkpipelinecachecreateflags vkflags)

(cffi:defctype vkcolorcomponentflags vkflags)

(cffi:defctype vkpipelinecreateflags vkflags)

(cffi:defctype vkpipelineshaderstagecreateflags vkflags)

(cffi:defctype vkcullmodeflags vkflags)

(cffi:defctype vkpipelinevertexinputstatecreateflags vkflags)

(cffi:defctype vkpipelineinputassemblystatecreateflags vkflags)

(cffi:defctype vkpipelinetessellationstatecreateflags vkflags)

(cffi:defctype vkpipelineviewportstatecreateflags vkflags)

(cffi:defctype vkpipelinerasterizationstatecreateflags vkflags)

(cffi:defctype vkpipelinemultisamplestatecreateflags vkflags)

(cffi:defctype vkpipelinedepthstencilstatecreateflags vkflags)

(cffi:defctype vkpipelinecolorblendstatecreateflags vkflags)

(cffi:defctype vkpipelinedynamicstatecreateflags vkflags)

(cffi:defctype vkpipelinelayoutcreateflags vkflags)

(cffi:defctype vkshaderstageflags vkflags)

(cffi:defctype vksamplercreateflags vkflags)

(cffi:defctype vkdescriptorpoolcreateflags vkflags)

(cffi:defctype vkdescriptorpoolresetflags vkflags)

(cffi:defctype vkdescriptorsetlayoutcreateflags vkflags)

(cffi:defctype vkattachmentdescriptionflags vkflags)

(cffi:defctype vkdependencyflags vkflags)

(cffi:defctype vkframebuffercreateflags vkflags)

(cffi:defctype vkrenderpasscreateflags vkflags)

(cffi:defctype vksubpassdescriptionflags vkflags)

(cffi:defctype vkcommandpoolcreateflags vkflags)

(cffi:defctype vkcommandpoolresetflags vkflags)

(cffi:defctype vkcommandbufferusageflags vkflags)

(cffi:defctype vkquerycontrolflags vkflags)

(cffi:defctype vkcommandbufferresetflags vkflags)

(cffi:defctype vkstencilfaceflags vkflags)

(cffi:defcstruct vkextent2d
  (width :uint32)
  (height :uint32))

(cffi:defcstruct vkextent3d
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(cffi:defcstruct vkoffset2d
  (x :int32)
  (y :int32))

(cffi:defcstruct vkoffset3d
  (x :int32)
  (y :int32)
  (z :int32))

(cffi:defcstruct vkrect2d
  (offset (:struct vkoffset2d))
  (extent (:struct vkextent2d)))

(cffi:defcstruct vkbaseinstructure
  (stype vkstructuretype)
  (pnext :pointer))

(cffi:defcstruct vkbaseoutstructure
  (stype vkstructuretype)
  (pnext :pointer))

(cffi:defcstruct vkbuffermemorybarrier
  (stype vkstructuretype)
  (pnext :pointer)
  (srcaccessmask vkaccessflags)
  (dstaccessmask vkaccessflags)
  (srcqueuefamilyindex :uint32)
  (dstqueuefamilyindex :uint32)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (size vkdevicesize))

(cffi:defcstruct vkdispatchindirectcommand
  (x :uint32)
  (y :uint32)
  (z :uint32))

(cffi:defcstruct vkdrawindexedindirectcommand
  (indexcount :uint32)
  (instancecount :uint32)
  (firstindex :uint32)
  (vertexoffset :int32)
  (firstinstance :uint32))

(cffi:defcstruct vkdrawindirectcommand
  (vertexcount :uint32)
  (instancecount :uint32)
  (firstvertex :uint32)
  (firstinstance :uint32))

(cffi:defcstruct vkimagesubresourcerange
  (aspectmask vkimageaspectflags)
  (basemiplevel :uint32)
  (levelcount :uint32)
  (basearraylayer :uint32)
  (layercount :uint32))

(cffi:defcstruct vkimagememorybarrier
  (stype vkstructuretype)
  (pnext :pointer)
  (srcaccessmask vkaccessflags)
  (dstaccessmask vkaccessflags)
  (oldlayout vkimagelayout)
  (newlayout vkimagelayout)
  (srcqueuefamilyindex :uint32)
  (dstqueuefamilyindex :uint32)
  (image vkimage)
  (subresourcerange (:struct vkimagesubresourcerange)))

(cffi:defcstruct vkmemorybarrier
  (stype vkstructuretype)
  (pnext :pointer)
  (srcaccessmask vkaccessflags)
  (dstaccessmask vkaccessflags))

(cffi:defcstruct vkpipelinecacheheaderversionone
  (headersize :uint32)
  (headerversion vkpipelinecacheheaderversion)
  (vendorid :uint32)
  (deviceid :uint32)
  (pipelinecacheuuid :uint8 :count (apply #'* (list vk_uuid_size))))

(cffi:defctype pfn_vkallocationfunction :pointer)

(cffi:defctype pfn_vkfreefunction :pointer)

(cffi:defctype pfn_vkinternalallocationnotification :pointer)

(cffi:defctype pfn_vkinternalfreenotification :pointer)

(cffi:defctype pfn_vkreallocationfunction :pointer)

(cffi:defctype pfn_vkvoidfunction :pointer)

(cffi:defcstruct vkallocationcallbacks
  (puserdata :pointer)
  (pfnallocation pfn_vkallocationfunction)
  (pfnreallocation pfn_vkreallocationfunction)
  (pfnfree pfn_vkfreefunction)
  (pfninternalallocation pfn_vkinternalallocationnotification)
  (pfninternalfree pfn_vkinternalfreenotification))

(cffi:defcstruct vkapplicationinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (papplicationname :pointer)
  (applicationversion :uint32)
  (penginename :pointer)
  (engineversion :uint32)
  (apiversion :uint32))

(cffi:defcstruct vkformatproperties
  (lineartilingfeatures vkformatfeatureflags)
  (optimaltilingfeatures vkformatfeatureflags)
  (bufferfeatures vkformatfeatureflags))

(cffi:defcstruct vkimageformatproperties
  (maxextent (:struct vkextent3d))
  (maxmiplevels :uint32)
  (maxarraylayers :uint32)
  (samplecounts vksamplecountflags)
  (maxresourcesize vkdevicesize))

(cffi:defcstruct vkinstancecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkinstancecreateflags)
  (papplicationinfo :pointer)
  (enabledlayercount :uint32)
  (ppenabledlayernames :pointer)
  (enabledextensioncount :uint32)
  (ppenabledextensionnames :pointer))

(cffi:defcstruct vkmemoryheap
  (size vkdevicesize)
  (flags vkmemoryheapflags))

(cffi:defcstruct vkmemorytype
  (propertyflags vkmemorypropertyflags)
  (heapindex :uint32))

(cffi:defcstruct vkphysicaldevicefeatures
  (robustbufferaccess vkbool32)
  (fulldrawindexuint32 vkbool32)
  (imagecubearray vkbool32)
  (independentblend vkbool32)
  (geometryshader vkbool32)
  (tessellationshader vkbool32)
  (samplerateshading vkbool32)
  (dualsrcblend vkbool32)
  (logicop vkbool32)
  (multidrawindirect vkbool32)
  (drawindirectfirstinstance vkbool32)
  (depthclamp vkbool32)
  (depthbiasclamp vkbool32)
  (fillmodenonsolid vkbool32)
  (depthbounds vkbool32)
  (widelines vkbool32)
  (largepoints vkbool32)
  (alphatoone vkbool32)
  (multiviewport vkbool32)
  (sampleranisotropy vkbool32)
  (texturecompressionetc2 vkbool32)
  (texturecompressionastc_ldr vkbool32)
  (texturecompressionbc vkbool32)
  (occlusionqueryprecise vkbool32)
  (pipelinestatisticsquery vkbool32)
  (vertexpipelinestoresandatomics vkbool32)
  (fragmentstoresandatomics vkbool32)
  (shadertessellationandgeometrypointsize vkbool32)
  (shaderimagegatherextended vkbool32)
  (shaderstorageimageextendedformats vkbool32)
  (shaderstorageimagemultisample vkbool32)
  (shaderstorageimagereadwithoutformat vkbool32)
  (shaderstorageimagewritewithoutformat vkbool32)
  (shaderuniformbufferarraydynamicindexing vkbool32)
  (shadersampledimagearraydynamicindexing vkbool32)
  (shaderstoragebufferarraydynamicindexing vkbool32)
  (shaderstorageimagearraydynamicindexing vkbool32)
  (shaderclipdistance vkbool32)
  (shaderculldistance vkbool32)
  (shaderfloat64 vkbool32)
  (shaderint64 vkbool32)
  (shaderint16 vkbool32)
  (shaderresourceresidency vkbool32)
  (shaderresourceminlod vkbool32)
  (sparsebinding vkbool32)
  (sparseresidencybuffer vkbool32)
  (sparseresidencyimage2d vkbool32)
  (sparseresidencyimage3d vkbool32)
  (sparseresidency2samples vkbool32)
  (sparseresidency4samples vkbool32)
  (sparseresidency8samples vkbool32)
  (sparseresidency16samples vkbool32)
  (sparseresidencyaliased vkbool32)
  (variablemultisamplerate vkbool32)
  (inheritedqueries vkbool32))

(cffi:defcstruct vkphysicaldevicelimits
  (maximagedimension1d :uint32)
  (maximagedimension2d :uint32)
  (maximagedimension3d :uint32)
  (maximagedimensioncube :uint32)
  (maximagearraylayers :uint32)
  (maxtexelbufferelements :uint32)
  (maxuniformbufferrange :uint32)
  (maxstoragebufferrange :uint32)
  (maxpushconstantssize :uint32)
  (maxmemoryallocationcount :uint32)
  (maxsamplerallocationcount :uint32)
  (bufferimagegranularity vkdevicesize)
  (sparseaddressspacesize vkdevicesize)
  (maxbounddescriptorsets :uint32)
  (maxperstagedescriptorsamplers :uint32)
  (maxperstagedescriptoruniformbuffers :uint32)
  (maxperstagedescriptorstoragebuffers :uint32)
  (maxperstagedescriptorsampledimages :uint32)
  (maxperstagedescriptorstorageimages :uint32)
  (maxperstagedescriptorinputattachments :uint32)
  (maxperstageresources :uint32)
  (maxdescriptorsetsamplers :uint32)
  (maxdescriptorsetuniformbuffers :uint32)
  (maxdescriptorsetuniformbuffersdynamic :uint32)
  (maxdescriptorsetstoragebuffers :uint32)
  (maxdescriptorsetstoragebuffersdynamic :uint32)
  (maxdescriptorsetsampledimages :uint32)
  (maxdescriptorsetstorageimages :uint32)
  (maxdescriptorsetinputattachments :uint32)
  (maxvertexinputattributes :uint32)
  (maxvertexinputbindings :uint32)
  (maxvertexinputattributeoffset :uint32)
  (maxvertexinputbindingstride :uint32)
  (maxvertexoutputcomponents :uint32)
  (maxtessellationgenerationlevel :uint32)
  (maxtessellationpatchsize :uint32)
  (maxtessellationcontrolpervertexinputcomponents :uint32)
  (maxtessellationcontrolpervertexoutputcomponents :uint32)
  (maxtessellationcontrolperpatchoutputcomponents :uint32)
  (maxtessellationcontroltotaloutputcomponents :uint32)
  (maxtessellationevaluationinputcomponents :uint32)
  (maxtessellationevaluationoutputcomponents :uint32)
  (maxgeometryshaderinvocations :uint32)
  (maxgeometryinputcomponents :uint32)
  (maxgeometryoutputcomponents :uint32)
  (maxgeometryoutputvertices :uint32)
  (maxgeometrytotaloutputcomponents :uint32)
  (maxfragmentinputcomponents :uint32)
  (maxfragmentoutputattachments :uint32)
  (maxfragmentdualsrcattachments :uint32)
  (maxfragmentcombinedoutputresources :uint32)
  (maxcomputesharedmemorysize :uint32)
  (maxcomputeworkgroupcount :uint32 :count (apply #'* (list 3)))
  (maxcomputeworkgroupinvocations :uint32)
  (maxcomputeworkgroupsize :uint32 :count (apply #'* (list 3)))
  (subpixelprecisionbits :uint32)
  (subtexelprecisionbits :uint32)
  (mipmapprecisionbits :uint32)
  (maxdrawindexedindexvalue :uint32)
  (maxdrawindirectcount :uint32)
  (maxsamplerlodbias :float)
  (maxsampleranisotropy :float)
  (maxviewports :uint32)
  (maxviewportdimensions :uint32 :count (apply #'* (list 2)))
  (viewportboundsrange :float :count (apply #'* (list 2)))
  (viewportsubpixelbits :uint32)
  (minmemorymapalignment :size)
  (mintexelbufferoffsetalignment vkdevicesize)
  (minuniformbufferoffsetalignment vkdevicesize)
  (minstoragebufferoffsetalignment vkdevicesize)
  (mintexeloffset :int32)
  (maxtexeloffset :uint32)
  (mintexelgatheroffset :int32)
  (maxtexelgatheroffset :uint32)
  (mininterpolationoffset :float)
  (maxinterpolationoffset :float)
  (subpixelinterpolationoffsetbits :uint32)
  (maxframebufferwidth :uint32)
  (maxframebufferheight :uint32)
  (maxframebufferlayers :uint32)
  (framebuffercolorsamplecounts vksamplecountflags)
  (framebufferdepthsamplecounts vksamplecountflags)
  (framebufferstencilsamplecounts vksamplecountflags)
  (framebuffernoattachmentssamplecounts vksamplecountflags)
  (maxcolorattachments :uint32)
  (sampledimagecolorsamplecounts vksamplecountflags)
  (sampledimageintegersamplecounts vksamplecountflags)
  (sampledimagedepthsamplecounts vksamplecountflags)
  (sampledimagestencilsamplecounts vksamplecountflags)
  (storageimagesamplecounts vksamplecountflags)
  (maxsamplemaskwords :uint32)
  (timestampcomputeandgraphics vkbool32)
  (timestampperiod :float)
  (maxclipdistances :uint32)
  (maxculldistances :uint32)
  (maxcombinedclipandculldistances :uint32)
  (discretequeuepriorities :uint32)
  (pointsizerange :float :count (apply #'* (list 2)))
  (linewidthrange :float :count (apply #'* (list 2)))
  (pointsizegranularity :float)
  (linewidthgranularity :float)
  (strictlines vkbool32)
  (standardsamplelocations vkbool32)
  (optimalbuffercopyoffsetalignment vkdevicesize)
  (optimalbuffercopyrowpitchalignment vkdevicesize)
  (noncoherentatomsize vkdevicesize))

(cffi:defcstruct vkphysicaldevicememoryproperties
  (memorytypecount :uint32)
  (memorytypes (:struct vkmemorytype) :count
   (apply #'* (list vk_max_memory_types)))
  (memoryheapcount :uint32)
  (memoryheaps (:struct vkmemoryheap) :count
   (apply #'* (list vk_max_memory_heaps))))

(cffi:defcstruct vkphysicaldevicesparseproperties
  (residencystandard2dblockshape vkbool32)
  (residencystandard2dmultisampleblockshape vkbool32)
  (residencystandard3dblockshape vkbool32)
  (residencyalignedmipsize vkbool32)
  (residencynonresidentstrict vkbool32))

(cffi:defcstruct vkphysicaldeviceproperties
  (apiversion :uint32)
  (driverversion :uint32)
  (vendorid :uint32)
  (deviceid :uint32)
  (devicetype vkphysicaldevicetype)
  (devicename :char :count (apply #'* (list vk_max_physical_device_name_size)))
  (pipelinecacheuuid :uint8 :count (apply #'* (list vk_uuid_size)))
  (limits (:struct vkphysicaldevicelimits))
  (sparseproperties (:struct vkphysicaldevicesparseproperties)))

(cffi:defcstruct vkqueuefamilyproperties
  (queueflags vkqueueflags)
  (queuecount :uint32)
  (timestampvalidbits :uint32)
  (minimagetransfergranularity (:struct vkextent3d)))

(cffi:defcstruct vkdevicequeuecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdevicequeuecreateflags)
  (queuefamilyindex :uint32)
  (queuecount :uint32)
  (pqueuepriorities :pointer))

(cffi:defcstruct vkdevicecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdevicecreateflags)
  (queuecreateinfocount :uint32)
  (pqueuecreateinfos :pointer)
  (enabledlayercount :uint32)
  (ppenabledlayernames :pointer)
  (enabledextensioncount :uint32)
  (ppenabledextensionnames :pointer)
  (penabledfeatures :pointer))

(cffi:defcstruct vkextensionproperties
  (extensionname :char :count (apply #'* (list vk_max_extension_name_size)))
  (specversion :uint32))

(cffi:defcstruct vklayerproperties
  (layername :char :count (apply #'* (list vk_max_extension_name_size)))
  (specversion :uint32)
  (implementationversion :uint32)
  (description :char :count (apply #'* (list vk_max_description_size))))

(cffi:defcstruct vksubmitinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (waitsemaphorecount :uint32)
  (pwaitsemaphores :pointer)
  (pwaitdststagemask :pointer)
  (commandbuffercount :uint32)
  (pcommandbuffers :pointer)
  (signalsemaphorecount :uint32)
  (psignalsemaphores :pointer))

(cffi:defcstruct vkmappedmemoryrange
  (stype vkstructuretype)
  (pnext :pointer)
  (memory vkdevicememory)
  (offset vkdevicesize)
  (size vkdevicesize))

(cffi:defcstruct vkmemoryallocateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (allocationsize vkdevicesize)
  (memorytypeindex :uint32))

(cffi:defcstruct vkmemoryrequirements
  (size vkdevicesize)
  (alignment vkdevicesize)
  (memorytypebits :uint32))

(cffi:defcstruct vksparsememorybind
  (resourceoffset vkdevicesize)
  (size vkdevicesize)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize)
  (flags vksparsememorybindflags))

(cffi:defcstruct vksparsebuffermemorybindinfo
  (buffer vkbuffer)
  (bindcount :uint32)
  (pbinds :pointer))

(cffi:defcstruct vksparseimageopaquememorybindinfo
  (image vkimage)
  (bindcount :uint32)
  (pbinds :pointer))

(cffi:defcstruct vkimagesubresource
  (aspectmask vkimageaspectflags)
  (miplevel :uint32)
  (arraylayer :uint32))

(cffi:defcstruct vksparseimagememorybind
  (subresource (:struct vkimagesubresource))
  (offset (:struct vkoffset3d))
  (extent (:struct vkextent3d))
  (memory vkdevicememory)
  (memoryoffset vkdevicesize)
  (flags vksparsememorybindflags))

(cffi:defcstruct vksparseimagememorybindinfo
  (image vkimage)
  (bindcount :uint32)
  (pbinds :pointer))

(cffi:defcstruct vkbindsparseinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (waitsemaphorecount :uint32)
  (pwaitsemaphores :pointer)
  (bufferbindcount :uint32)
  (pbufferbinds :pointer)
  (imageopaquebindcount :uint32)
  (pimageopaquebinds :pointer)
  (imagebindcount :uint32)
  (pimagebinds :pointer)
  (signalsemaphorecount :uint32)
  (psignalsemaphores :pointer))

(cffi:defcstruct vksparseimageformatproperties
  (aspectmask vkimageaspectflags)
  (imagegranularity (:struct vkextent3d))
  (flags vksparseimageformatflags))

(cffi:defcstruct vksparseimagememoryrequirements
  (formatproperties (:struct vksparseimageformatproperties))
  (imagemiptailfirstlod :uint32)
  (imagemiptailsize vkdevicesize)
  (imagemiptailoffset vkdevicesize)
  (imagemiptailstride vkdevicesize))

(cffi:defcstruct vkfencecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkfencecreateflags))

(cffi:defcstruct vksemaphorecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vksemaphorecreateflags))

(cffi:defcstruct vkeventcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkeventcreateflags))

(cffi:defcstruct vkquerypoolcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkquerypoolcreateflags)
  (querytype vkquerytype)
  (querycount :uint32)
  (pipelinestatistics vkquerypipelinestatisticflags))

(cffi:defcstruct vkbuffercreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkbuffercreateflags)
  (size vkdevicesize)
  (usage vkbufferusageflags)
  (sharingmode vksharingmode)
  (queuefamilyindexcount :uint32)
  (pqueuefamilyindices :pointer))

(cffi:defcstruct vkbufferviewcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkbufferviewcreateflags)
  (buffer vkbuffer)
  (format vkformat)
  (offset vkdevicesize)
  (range vkdevicesize))

(cffi:defcstruct vkimagecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkimagecreateflags)
  (imagetype vkimagetype)
  (format vkformat)
  (extent (:struct vkextent3d))
  (miplevels :uint32)
  (arraylayers :uint32)
  (samples vksamplecountflagbits)
  (tiling vkimagetiling)
  (usage vkimageusageflags)
  (sharingmode vksharingmode)
  (queuefamilyindexcount :uint32)
  (pqueuefamilyindices :pointer)
  (initiallayout vkimagelayout))

(cffi:defcstruct vksubresourcelayout
  (offset vkdevicesize)
  (size vkdevicesize)
  (rowpitch vkdevicesize)
  (arraypitch vkdevicesize)
  (depthpitch vkdevicesize))

(cffi:defcstruct vkcomponentmapping
  (r vkcomponentswizzle)
  (g vkcomponentswizzle)
  (b vkcomponentswizzle)
  (a vkcomponentswizzle))

(cffi:defcstruct vkimageviewcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkimageviewcreateflags)
  (image vkimage)
  (viewtype vkimageviewtype)
  (format vkformat)
  (components (:struct vkcomponentmapping))
  (subresourcerange (:struct vkimagesubresourcerange)))

(cffi:defcstruct vkshadermodulecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkshadermodulecreateflags)
  (codesize :size)
  (pcode :pointer))

(cffi:defcstruct vkpipelinecachecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinecachecreateflags)
  (initialdatasize :size)
  (pinitialdata :pointer))

(cffi:defcstruct vkspecializationmapentry
  (antid :uint32)
  (offset :uint32)
  (size :size))

(cffi:defcstruct vkspecializationinfo
  (mapentrycount :uint32)
  (pmapentries :pointer)
  (datasize :size)
  (pdata :pointer))

(cffi:defcstruct vkpipelineshaderstagecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelineshaderstagecreateflags)
  (stage vkshaderstageflagbits)
  (module vkshadermodule)
  (pname :pointer)
  (pspecializationinfo :pointer))

(cffi:defcstruct vkcomputepipelinecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinecreateflags)
  (stage (:struct vkpipelineshaderstagecreateinfo))
  (layout vkpipelinelayout)
  (basepipelinehandle vkpipeline)
  (basepipelineindex :int32))

(cffi:defcstruct vkvertexinputbindingdescription
  (binding :uint32)
  (stride :uint32)
  (inputrate vkvertexinputrate))

(cffi:defcstruct vkvertexinputattributedescription
  (location :uint32)
  (binding :uint32)
  (format vkformat)
  (offset :uint32))

(cffi:defcstruct vkpipelinevertexinputstatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinevertexinputstatecreateflags)
  (vertexbindingdescriptioncount :uint32)
  (pvertexbindingdescriptions :pointer)
  (vertexattributedescriptioncount :uint32)
  (pvertexattributedescriptions :pointer))

(cffi:defcstruct vkpipelineinputassemblystatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelineinputassemblystatecreateflags)
  (topology vkprimitivetopology)
  (primitiverestartenable vkbool32))

(cffi:defcstruct vkpipelinetessellationstatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinetessellationstatecreateflags)
  (patchcontrolpoints :uint32))

(cffi:defcstruct vkviewport
  (x :float)
  (y :float)
  (width :float)
  (height :float)
  (mindepth :float)
  (maxdepth :float))

(cffi:defcstruct vkpipelineviewportstatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelineviewportstatecreateflags)
  (viewportcount :uint32)
  (pviewports :pointer)
  (scissorcount :uint32)
  (pscissors :pointer))

(cffi:defcstruct vkpipelinerasterizationstatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinerasterizationstatecreateflags)
  (depthclampenable vkbool32)
  (rasterizerdiscardenable vkbool32)
  (polygonmode vkpolygonmode)
  (cullmode vkcullmodeflags)
  (frontface vkfrontface)
  (depthbiasenable vkbool32)
  (depthbiasconstantfactor :float)
  (depthbiasclamp :float)
  (depthbiasslopefactor :float)
  (linewidth :float))

(cffi:defcstruct vkpipelinemultisamplestatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinemultisamplestatecreateflags)
  (rasterizationsamples vksamplecountflagbits)
  (sampleshadingenable vkbool32)
  (minsampleshading :float)
  (psamplemask :pointer)
  (alphatocoverageenable vkbool32)
  (alphatooneenable vkbool32))

(cffi:defcstruct vkstencilopstate
  (failop vkstencilop)
  (passop vkstencilop)
  (depthfailop vkstencilop)
  (compareop vkcompareop)
  (comparemask :uint32)
  (writemask :uint32)
  (reference :uint32))

(cffi:defcstruct vkpipelinedepthstencilstatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinedepthstencilstatecreateflags)
  (depthtestenable vkbool32)
  (depthwriteenable vkbool32)
  (depthcompareop vkcompareop)
  (depthboundstestenable vkbool32)
  (stenciltestenable vkbool32)
  (front (:struct vkstencilopstate))
  (back (:struct vkstencilopstate))
  (mindepthbounds :float)
  (maxdepthbounds :float))

(cffi:defcstruct vkpipelinecolorblendattachmentstate
  (blendenable vkbool32)
  (srccolorblendfactor vkblendfactor)
  (dstcolorblendfactor vkblendfactor)
  (colorblendop vkblendop)
  (srcalphablendfactor vkblendfactor)
  (dstalphablendfactor vkblendfactor)
  (alphablendop vkblendop)
  (colorwritemask vkcolorcomponentflags))

(cffi:defcstruct vkpipelinecolorblendstatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinecolorblendstatecreateflags)
  (logicopenable vkbool32)
  (logicop vklogicop)
  (attachmentcount :uint32)
  (pattachments :pointer)
  (blendconstants :float :count (apply #'* (list 4))))

(cffi:defcstruct vkpipelinedynamicstatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinedynamicstatecreateflags)
  (dynamicstatecount :uint32)
  (pdynamicstates :pointer))

(cffi:defcstruct vkgraphicspipelinecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinecreateflags)
  (stagecount :uint32)
  (pstages :pointer)
  (pvertexinputstate :pointer)
  (pinputassemblystate :pointer)
  (ptessellationstate :pointer)
  (pviewportstate :pointer)
  (prasterizationstate :pointer)
  (pmultisamplestate :pointer)
  (pdepthstencilstate :pointer)
  (pcolorblendstate :pointer)
  (pdynamicstate :pointer)
  (layout vkpipelinelayout)
  (renderpass vkrenderpass)
  (subpass :uint32)
  (basepipelinehandle vkpipeline)
  (basepipelineindex :int32))

(cffi:defcstruct vkpushconstantrange
  (stageflags vkshaderstageflags)
  (offset :uint32)
  (size :uint32))

(cffi:defcstruct vkpipelinelayoutcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinelayoutcreateflags)
  (setlayoutcount :uint32)
  (psetlayouts :pointer)
  (pushconstantrangecount :uint32)
  (ppushconstantranges :pointer))

(cffi:defcstruct vksamplercreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vksamplercreateflags)
  (magfilter vkfilter)
  (minfilter vkfilter)
  (mipmapmode vksamplermipmapmode)
  (addressmodeu vksampleraddressmode)
  (addressmodev vksampleraddressmode)
  (addressmodew vksampleraddressmode)
  (miplodbias :float)
  (anisotropyenable vkbool32)
  (maxanisotropy :float)
  (compareenable vkbool32)
  (compareop vkcompareop)
  (minlod :float)
  (maxlod :float)
  (bordercolor vkbordercolor)
  (unnormalizedcoordinates vkbool32))

(cffi:defcstruct vkcopydescriptorset
  (stype vkstructuretype)
  (pnext :pointer)
  (srcset vkdescriptorset)
  (srcbinding :uint32)
  (srcarrayelement :uint32)
  (dstset vkdescriptorset)
  (dstbinding :uint32)
  (dstarrayelement :uint32)
  (descriptorcount :uint32))

(cffi:defcstruct vkdescriptorbufferinfo
  (buffer vkbuffer)
  (offset vkdevicesize)
  (range vkdevicesize))

(cffi:defcstruct vkdescriptorimageinfo
  (sampler vksampler)
  (imageview vkimageview)
  (imagelayout vkimagelayout))

(cffi:defcstruct vkdescriptorpoolsize
  (type vkdescriptortype)
  (descriptorcount :uint32))

(cffi:defcstruct vkdescriptorpoolcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdescriptorpoolcreateflags)
  (maxsets :uint32)
  (poolsizecount :uint32)
  (ppoolsizes :pointer))

(cffi:defcstruct vkdescriptorsetallocateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (descriptorpool vkdescriptorpool)
  (descriptorsetcount :uint32)
  (psetlayouts :pointer))

(cffi:defcstruct vkdescriptorsetlayoutbinding
  (binding :uint32)
  (descriptortype vkdescriptortype)
  (descriptorcount :uint32)
  (stageflags vkshaderstageflags)
  (pimmutablesamplers :pointer))

(cffi:defcstruct vkdescriptorsetlayoutcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdescriptorsetlayoutcreateflags)
  (bindingcount :uint32)
  (pbindings :pointer))

(cffi:defcstruct vkwritedescriptorset
  (stype vkstructuretype)
  (pnext :pointer)
  (dstset vkdescriptorset)
  (dstbinding :uint32)
  (dstarrayelement :uint32)
  (descriptorcount :uint32)
  (descriptortype vkdescriptortype)
  (pimageinfo :pointer)
  (pbufferinfo :pointer)
  (ptexelbufferview :pointer))

(cffi:defcstruct vkattachmentdescription
  (flags vkattachmentdescriptionflags)
  (format vkformat)
  (samples vksamplecountflagbits)
  (loadop vkattachmentloadop)
  (storeop vkattachmentstoreop)
  (stencilloadop vkattachmentloadop)
  (stencilstoreop vkattachmentstoreop)
  (initiallayout vkimagelayout)
  (finallayout vkimagelayout))

(cffi:defcstruct vkattachmentreference
  (attachment :uint32)
  (layout vkimagelayout))

(cffi:defcstruct vkframebuffercreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkframebuffercreateflags)
  (renderpass vkrenderpass)
  (attachmentcount :uint32)
  (pattachments :pointer)
  (width :uint32)
  (height :uint32)
  (layers :uint32))

(cffi:defcstruct vksubpassdescription
  (flags vksubpassdescriptionflags)
  (pipelinebindpoint vkpipelinebindpoint)
  (inputattachmentcount :uint32)
  (pinputattachments :pointer)
  (colorattachmentcount :uint32)
  (pcolorattachments :pointer)
  (presolveattachments :pointer)
  (pdepthstencilattachment :pointer)
  (preserveattachmentcount :uint32)
  (ppreserveattachments :pointer))

(cffi:defcstruct vksubpassdependency
  (srcsubpass :uint32)
  (dstsubpass :uint32)
  (srcstagemask vkpipelinestageflags)
  (dststagemask vkpipelinestageflags)
  (srcaccessmask vkaccessflags)
  (dstaccessmask vkaccessflags)
  (dependencyflags vkdependencyflags))

(cffi:defcstruct vkrenderpasscreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkrenderpasscreateflags)
  (attachmentcount :uint32)
  (pattachments :pointer)
  (subpasscount :uint32)
  (psubpasses :pointer)
  (dependencycount :uint32)
  (pdependencies :pointer))

(cffi:defcstruct vkcommandpoolcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkcommandpoolcreateflags)
  (queuefamilyindex :uint32))

(cffi:defcstruct vkcommandbufferallocateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (commandpool vkcommandpool)
  (level vkcommandbufferlevel)
  (commandbuffercount :uint32))

(cffi:defcstruct vkcommandbufferinheritanceinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (renderpass vkrenderpass)
  (subpass :uint32)
  (framebuffer vkframebuffer)
  (occlusionqueryenable vkbool32)
  (queryflags vkquerycontrolflags)
  (pipelinestatistics vkquerypipelinestatisticflags))

(cffi:defcstruct vkcommandbufferbegininfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkcommandbufferusageflags)
  (pinheritanceinfo :pointer))

(cffi:defcstruct vkbuffercopy
  (srcoffset vkdevicesize)
  (dstoffset vkdevicesize)
  (size vkdevicesize))

(cffi:defcstruct vkimagesubresourcelayers
  (aspectmask vkimageaspectflags)
  (miplevel :uint32)
  (basearraylayer :uint32)
  (layercount :uint32))

(cffi:defcstruct vkbufferimagecopy
  (bufferoffset vkdevicesize)
  (bufferrowlength :uint32)
  (bufferimageheight :uint32)
  (imagesubresource (:struct vkimagesubresourcelayers))
  (imageoffset (:struct vkoffset3d))
  (imageextent (:struct vkextent3d)))

(cffi:defcunion vkclearcolorvalue
  (float32 :float :count (apply #'* (list 4)))
  (int32 :int32 :count (apply #'* (list 4)))
  (uint32 :uint32 :count (apply #'* (list 4))))

(cffi:defcstruct vkcleardepthstencilvalue
  (depth :float)
  (stencil :uint32))

(cffi:defcunion vkclearvalue
  (color (:union vkclearcolorvalue))
  (depthstencil (:struct vkcleardepthstencilvalue)))

(cffi:defcstruct vkclearattachment
  (aspectmask vkimageaspectflags)
  (colorattachment :uint32)
  (clearvalue (:union vkclearvalue)))

(cffi:defcstruct vkclearrect
  (rect (:struct vkrect2d))
  (basearraylayer :uint32)
  (layercount :uint32))

(cffi:defcstruct vkimageblit
  (srcsubresource (:struct vkimagesubresourcelayers))
  (srcoffsets (:struct vkoffset3d) :count (apply #'* (list 2)))
  (dstsubresource (:struct vkimagesubresourcelayers))
  (dstoffsets (:struct vkoffset3d) :count (apply #'* (list 2))))

(cffi:defcstruct vkimagecopy
  (srcsubresource (:struct vkimagesubresourcelayers))
  (srcoffset (:struct vkoffset3d))
  (dstsubresource (:struct vkimagesubresourcelayers))
  (dstoffset (:struct vkoffset3d))
  (extent (:struct vkextent3d)))

(cffi:defcstruct vkimageresolve
  (srcsubresource (:struct vkimagesubresourcelayers))
  (srcoffset (:struct vkoffset3d))
  (dstsubresource (:struct vkimagesubresourcelayers))
  (dstoffset (:struct vkoffset3d))
  (extent (:struct vkextent3d)))

(cffi:defcstruct vkrenderpassbegininfo
  (stype vkstructuretype)
  (pnext :pointer)
  (renderpass vkrenderpass)
  (framebuffer vkframebuffer)
  (renderarea (:struct vkrect2d))
  (clearvaluecount :uint32)
  (pclearvalues :pointer))

(cffi:defctype pfn_vkcreateinstance :pointer)

(cffi:defctype pfn_vkdestroyinstance :pointer)

(cffi:defctype pfn_vkenumeratephysicaldevices :pointer)

(cffi:defctype pfn_vkgetphysicaldevicefeatures :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceformatproperties :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceimageformatproperties :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceproperties :pointer)

(cffi:defctype pfn_vkgetphysicaldevicequeuefamilyproperties :pointer)

(cffi:defctype pfn_vkgetphysicaldevicememoryproperties :pointer)

(cffi:defctype pfn_vkgetinstanceprocaddr :pointer)

(cffi:defctype pfn_vkgetdeviceprocaddr :pointer)

(cffi:defctype pfn_vkcreatedevice :pointer)

(cffi:defctype pfn_vkdestroydevice :pointer)

(cffi:defctype pfn_vkenumerateinstanceextensionproperties :pointer)

(cffi:defctype pfn_vkenumeratedeviceextensionproperties :pointer)

(cffi:defctype pfn_vkenumerateinstancelayerproperties :pointer)

(cffi:defctype pfn_vkenumeratedevicelayerproperties :pointer)

(cffi:defctype pfn_vkgetdevicequeue :pointer)

(cffi:defctype pfn_vkqueuesubmit :pointer)

(cffi:defctype pfn_vkqueuewaitidle :pointer)

(cffi:defctype pfn_vkdevicewaitidle :pointer)

(cffi:defctype pfn_vkallocatememory :pointer)

(cffi:defctype pfn_vkfreememory :pointer)

(cffi:defctype pfn_vkmapmemory :pointer)

(cffi:defctype pfn_vkunmapmemory :pointer)

(cffi:defctype pfn_vkflushmappedmemoryranges :pointer)

(cffi:defctype pfn_vkinvalidatemappedmemoryranges :pointer)

(cffi:defctype pfn_vkgetdevicememorycommitment :pointer)

(cffi:defctype pfn_vkbindbuffermemory :pointer)

(cffi:defctype pfn_vkbindimagememory :pointer)

(cffi:defctype pfn_vkgetbuffermemoryrequirements :pointer)

(cffi:defctype pfn_vkgetimagememoryrequirements :pointer)

(cffi:defctype pfn_vkgetimagesparsememoryrequirements :pointer)

(cffi:defctype pfn_vkgetphysicaldevicesparseimageformatproperties :pointer)

(cffi:defctype pfn_vkqueuebindsparse :pointer)

(cffi:defctype pfn_vkcreatefence :pointer)

(cffi:defctype pfn_vkdestroyfence :pointer)

(cffi:defctype pfn_vkresetfences :pointer)

(cffi:defctype pfn_vkgetfencestatus :pointer)

(cffi:defctype pfn_vkwaitforfences :pointer)

(cffi:defctype pfn_vkcreatesemaphore :pointer)

(cffi:defctype pfn_vkdestroysemaphore :pointer)

(cffi:defctype pfn_vkcreateevent :pointer)

(cffi:defctype pfn_vkdestroyevent :pointer)

(cffi:defctype pfn_vkgeteventstatus :pointer)

(cffi:defctype pfn_vksetevent :pointer)

(cffi:defctype pfn_vkresetevent :pointer)

(cffi:defctype pfn_vkcreatequerypool :pointer)

(cffi:defctype pfn_vkdestroyquerypool :pointer)

(cffi:defctype pfn_vkgetquerypoolresults :pointer)

(cffi:defctype pfn_vkcreatebuffer :pointer)

(cffi:defctype pfn_vkdestroybuffer :pointer)

(cffi:defctype pfn_vkcreatebufferview :pointer)

(cffi:defctype pfn_vkdestroybufferview :pointer)

(cffi:defctype pfn_vkcreateimage :pointer)

(cffi:defctype pfn_vkdestroyimage :pointer)

(cffi:defctype pfn_vkgetimagesubresourcelayout :pointer)

(cffi:defctype pfn_vkcreateimageview :pointer)

(cffi:defctype pfn_vkdestroyimageview :pointer)

(cffi:defctype pfn_vkcreateshadermodule :pointer)

(cffi:defctype pfn_vkdestroyshadermodule :pointer)

(cffi:defctype pfn_vkcreatepipelinecache :pointer)

(cffi:defctype pfn_vkdestroypipelinecache :pointer)

(cffi:defctype pfn_vkgetpipelinecachedata :pointer)

(cffi:defctype pfn_vkmergepipelinecaches :pointer)

(cffi:defctype pfn_vkcreategraphicspipelines :pointer)

(cffi:defctype pfn_vkcreatecomputepipelines :pointer)

(cffi:defctype pfn_vkdestroypipeline :pointer)

(cffi:defctype pfn_vkcreatepipelinelayout :pointer)

(cffi:defctype pfn_vkdestroypipelinelayout :pointer)

(cffi:defctype pfn_vkcreatesampler :pointer)

(cffi:defctype pfn_vkdestroysampler :pointer)

(cffi:defctype pfn_vkcreatedescriptorsetlayout :pointer)

(cffi:defctype pfn_vkdestroydescriptorsetlayout :pointer)

(cffi:defctype pfn_vkcreatedescriptorpool :pointer)

(cffi:defctype pfn_vkdestroydescriptorpool :pointer)

(cffi:defctype pfn_vkresetdescriptorpool :pointer)

(cffi:defctype pfn_vkallocatedescriptorsets :pointer)

(cffi:defctype pfn_vkfreedescriptorsets :pointer)

(cffi:defctype pfn_vkupdatedescriptorsets :pointer)

(cffi:defctype pfn_vkcreateframebuffer :pointer)

(cffi:defctype pfn_vkdestroyframebuffer :pointer)

(cffi:defctype pfn_vkcreaterenderpass :pointer)

(cffi:defctype pfn_vkdestroyrenderpass :pointer)

(cffi:defctype pfn_vkgetrenderareagranularity :pointer)

(cffi:defctype pfn_vkcreatecommandpool :pointer)

(cffi:defctype pfn_vkdestroycommandpool :pointer)

(cffi:defctype pfn_vkresetcommandpool :pointer)

(cffi:defctype pfn_vkallocatecommandbuffers :pointer)

(cffi:defctype pfn_vkfreecommandbuffers :pointer)

(cffi:defctype pfn_vkbegincommandbuffer :pointer)

(cffi:defctype pfn_vkendcommandbuffer :pointer)

(cffi:defctype pfn_vkresetcommandbuffer :pointer)

(cffi:defctype pfn_vkcmdbindpipeline :pointer)

(cffi:defctype pfn_vkcmdsetviewport :pointer)

(cffi:defctype pfn_vkcmdsetscissor :pointer)

(cffi:defctype pfn_vkcmdsetlinewidth :pointer)

(cffi:defctype pfn_vkcmdsetdepthbias :pointer)

(cffi:defctype pfn_vkcmdsetblendconstants :pointer)

(cffi:defctype pfn_vkcmdsetdepthbounds :pointer)

(cffi:defctype pfn_vkcmdsetstencilcomparemask :pointer)

(cffi:defctype pfn_vkcmdsetstencilwritemask :pointer)

(cffi:defctype pfn_vkcmdsetstencilreference :pointer)

(cffi:defctype pfn_vkcmdbinddescriptorsets :pointer)

(cffi:defctype pfn_vkcmdbindindexbuffer :pointer)

(cffi:defctype pfn_vkcmdbindvertexbuffers :pointer)

(cffi:defctype pfn_vkcmddraw :pointer)

(cffi:defctype pfn_vkcmddrawindexed :pointer)

(cffi:defctype pfn_vkcmddrawindirect :pointer)

(cffi:defctype pfn_vkcmddrawindexedindirect :pointer)

(cffi:defctype pfn_vkcmddispatch :pointer)

(cffi:defctype pfn_vkcmddispatchindirect :pointer)

(cffi:defctype pfn_vkcmdcopybuffer :pointer)

(cffi:defctype pfn_vkcmdcopyimage :pointer)

(cffi:defctype pfn_vkcmdblitimage :pointer)

(cffi:defctype pfn_vkcmdcopybuffertoimage :pointer)

(cffi:defctype pfn_vkcmdcopyimagetobuffer :pointer)

(cffi:defctype pfn_vkcmdupdatebuffer :pointer)

(cffi:defctype pfn_vkcmdfillbuffer :pointer)

(cffi:defctype pfn_vkcmdclearcolorimage :pointer)

(cffi:defctype pfn_vkcmdcleardepthstencilimage :pointer)

(cffi:defctype pfn_vkcmdclearattachments :pointer)

(cffi:defctype pfn_vkcmdresolveimage :pointer)

(cffi:defctype pfn_vkcmdsetevent :pointer)

(cffi:defctype pfn_vkcmdresetevent :pointer)

(cffi:defctype pfn_vkcmdwaitevents :pointer)

(cffi:defctype pfn_vkcmdpipelinebarrier :pointer)

(cffi:defctype pfn_vkcmdbeginquery :pointer)

(cffi:defctype pfn_vkcmdendquery :pointer)

(cffi:defctype pfn_vkcmdresetquerypool :pointer)

(cffi:defctype pfn_vkcmdwritetimestamp :pointer)

(cffi:defctype pfn_vkcmdcopyquerypoolresults :pointer)

(cffi:defctype pfn_vkcmdpushconstants :pointer)

(cffi:defctype pfn_vkcmdbeginrenderpass :pointer)

(cffi:defctype pfn_vkcmdnextsubpass :pointer)

(cffi:defctype pfn_vkcmdendrenderpass :pointer)

(cffi:defctype pfn_vkcmdexecutecommands :pointer)

(cffi:defctype vksamplerycbcrconversion non-dispatchable-handle)

(cffi:defctype vkdescriptorupdatetemplate non-dispatchable-handle)

(cffi:defctype vksubgroupfeatureflags vkflags)

(cffi:defctype vkpeermemoryfeatureflags vkflags)

(cffi:defctype vkmemoryallocateflags vkflags)

(cffi:defctype vkcommandpooltrimflags vkflags)

(cffi:defctype vkdescriptorupdatetemplatecreateflags vkflags)

(cffi:defctype vkexternalmemoryhandletypeflags vkflags)

(cffi:defctype vkexternalmemoryfeatureflags vkflags)

(cffi:defctype vkexternalfencehandletypeflags vkflags)

(cffi:defctype vkexternalfencefeatureflags vkflags)

(cffi:defctype vkfenceimportflags vkflags)

(cffi:defctype vksemaphoreimportflags vkflags)

(cffi:defctype vkexternalsemaphorehandletypeflags vkflags)

(cffi:defctype vkexternalsemaphorefeatureflags vkflags)

(cffi:defcstruct vkphysicaldevicesubgroupproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (subgroupsize :uint32)
  (supportedstages vkshaderstageflags)
  (supportedoperations vksubgroupfeatureflags)
  (quadoperationsinallstages vkbool32))

(cffi:defcstruct vkbindbuffermemoryinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (buffer vkbuffer)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize))

(cffi:defcstruct vkbindimagememoryinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (image vkimage)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize))

(cffi:defcstruct vkphysicaldevice16bitstoragefeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (storagebuffer16bitaccess vkbool32)
  (uniformandstoragebuffer16bitaccess vkbool32)
  (storagepushconstant16 vkbool32)
  (storageinputoutput16 vkbool32))

(cffi:defcstruct vkmemorydedicatedrequirements
  (stype vkstructuretype)
  (pnext :pointer)
  (prefersdedicatedallocation vkbool32)
  (requiresdedicatedallocation vkbool32))

(cffi:defcstruct vkmemorydedicatedallocateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (image vkimage)
  (buffer vkbuffer))

(cffi:defcstruct vkmemoryallocateflagsinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkmemoryallocateflags)
  (devicemask :uint32))

(cffi:defcstruct vkdevicegrouprenderpassbegininfo
  (stype vkstructuretype)
  (pnext :pointer)
  (devicemask :uint32)
  (devicerenderareacount :uint32)
  (pdevicerenderareas :pointer))

(cffi:defcstruct vkdevicegroupcommandbufferbegininfo
  (stype vkstructuretype)
  (pnext :pointer)
  (devicemask :uint32))

(cffi:defcstruct vkdevicegroupsubmitinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (waitsemaphorecount :uint32)
  (pwaitsemaphoredeviceindices :pointer)
  (commandbuffercount :uint32)
  (pcommandbufferdevicemasks :pointer)
  (signalsemaphorecount :uint32)
  (psignalsemaphoredeviceindices :pointer))

(cffi:defcstruct vkdevicegroupbindsparseinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (resourcedeviceindex :uint32)
  (memorydeviceindex :uint32))

(cffi:defcstruct vkbindbuffermemorydevicegroupinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (deviceindexcount :uint32)
  (pdeviceindices :pointer))

(cffi:defcstruct vkbindimagememorydevicegroupinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (deviceindexcount :uint32)
  (pdeviceindices :pointer)
  (splitinstancebindregioncount :uint32)
  (psplitinstancebindregions :pointer))

(cffi:defcstruct vkphysicaldevicegroupproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (physicaldevicecount :uint32)
  (physicaldevices vkphysicaldevice :count
   (apply #'* (list vk_max_device_group_size)))
  (subsetallocation vkbool32))

(cffi:defcstruct vkdevicegroupdevicecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (physicaldevicecount :uint32)
  (pphysicaldevices :pointer))

(cffi:defcstruct vkbuffermemoryrequirementsinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (buffer vkbuffer))

(cffi:defcstruct vkimagememoryrequirementsinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (image vkimage))

(cffi:defcstruct vkimagesparsememoryrequirementsinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (image vkimage))

(cffi:defcstruct vkmemoryrequirements2
  (stype vkstructuretype)
  (pnext :pointer)
  (memoryrequirements (:struct vkmemoryrequirements)))

(cffi:defcstruct vksparseimagememoryrequirements2
  (stype vkstructuretype)
  (pnext :pointer)
  (memoryrequirements (:struct vksparseimagememoryrequirements)))

(cffi:defcstruct vkphysicaldevicefeatures2
  (stype vkstructuretype)
  (pnext :pointer)
  (features (:struct vkphysicaldevicefeatures)))

(cffi:defcstruct vkphysicaldeviceproperties2
  (stype vkstructuretype)
  (pnext :pointer)
  (properties (:struct vkphysicaldeviceproperties)))

(cffi:defcstruct vkformatproperties2
  (stype vkstructuretype)
  (pnext :pointer)
  (formatproperties (:struct vkformatproperties)))

(cffi:defcstruct vkimageformatproperties2
  (stype vkstructuretype)
  (pnext :pointer)
  (imageformatproperties (:struct vkimageformatproperties)))

(cffi:defcstruct vkphysicaldeviceimageformatinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (format vkformat)
  (type vkimagetype)
  (tiling vkimagetiling)
  (usage vkimageusageflags)
  (flags vkimagecreateflags))

(cffi:defcstruct vkqueuefamilyproperties2
  (stype vkstructuretype)
  (pnext :pointer)
  (queuefamilyproperties (:struct vkqueuefamilyproperties)))

(cffi:defcstruct vkphysicaldevicememoryproperties2
  (stype vkstructuretype)
  (pnext :pointer)
  (memoryproperties (:struct vkphysicaldevicememoryproperties)))

(cffi:defcstruct vksparseimageformatproperties2
  (stype vkstructuretype)
  (pnext :pointer)
  (properties (:struct vksparseimageformatproperties)))

(cffi:defcstruct vkphysicaldevicesparseimageformatinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (format vkformat)
  (type vkimagetype)
  (samples vksamplecountflagbits)
  (usage vkimageusageflags)
  (tiling vkimagetiling))

(cffi:defcstruct vkphysicaldevicepointclippingproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (pointclippingbehavior vkpointclippingbehavior))

(cffi:defcstruct vkinputattachmentaspectreference
  (subpass :uint32)
  (inputattachmentindex :uint32)
  (aspectmask vkimageaspectflags))

(cffi:defcstruct vkrenderpassinputattachmentaspectcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (aspectreferencecount :uint32)
  (paspectreferences :pointer))

(cffi:defcstruct vkimageviewusagecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (usage vkimageusageflags))

(cffi:defcstruct vkpipelinetessellationdomainoriginstatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (domainorigin vktessellationdomainorigin))

(cffi:defcstruct vkrenderpassmultiviewcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (subpasscount :uint32)
  (pviewmasks :pointer)
  (dependencycount :uint32)
  (pviewoffsets :pointer)
  (correlationmaskcount :uint32)
  (pcorrelationmasks :pointer))

(cffi:defcstruct vkphysicaldevicemultiviewfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (multiview vkbool32)
  (multiviewgeometryshader vkbool32)
  (multiviewtessellationshader vkbool32))

(cffi:defcstruct vkphysicaldevicemultiviewproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (maxmultiviewviewcount :uint32)
  (maxmultiviewinstanceindex :uint32))

(cffi:defcstruct vkphysicaldevicevariablepointersfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (variablepointersstoragebuffer vkbool32)
  (variablepointers vkbool32))

(cffi:defctype vkphysicaldevicevariablepointerfeatures
               (:struct vkphysicaldevicevariablepointersfeatures))

(cffi:defcstruct vkphysicaldeviceprotectedmemoryfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (protectedmemory vkbool32))

(cffi:defcstruct vkphysicaldeviceprotectedmemoryproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (protectednofault vkbool32))

(cffi:defcstruct vkdevicequeueinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdevicequeuecreateflags)
  (queuefamilyindex :uint32)
  (queueindex :uint32))

(cffi:defcstruct vkprotectedsubmitinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (protectedsubmit vkbool32))

(cffi:defcstruct vksamplerycbcrconversioncreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (format vkformat)
  (ycbcrmodel vksamplerycbcrmodelconversion)
  (ycbcrrange vksamplerycbcrrange)
  (components (:struct vkcomponentmapping))
  (xchromaoffset vkchromalocation)
  (ychromaoffset vkchromalocation)
  (chromafilter vkfilter)
  (forceexplicitreconstruction vkbool32))

(cffi:defcstruct vksamplerycbcrconversioninfo
  (stype vkstructuretype)
  (pnext :pointer)
  (conversion vksamplerycbcrconversion))

(cffi:defcstruct vkbindimageplanememoryinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (planeaspect vkimageaspectflagbits))

(cffi:defcstruct vkimageplanememoryrequirementsinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (planeaspect vkimageaspectflagbits))

(cffi:defcstruct vkphysicaldevicesamplerycbcrconversionfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (samplerycbcrconversion vkbool32))

(cffi:defcstruct vksamplerycbcrconversionimageformatproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (combinedimagesamplerdescriptorcount :uint32))

(cffi:defcstruct vkdescriptorupdatetemplateentry
  (dstbinding :uint32)
  (dstarrayelement :uint32)
  (descriptorcount :uint32)
  (descriptortype vkdescriptortype)
  (offset :size)
  (stride :size))

(cffi:defcstruct vkdescriptorupdatetemplatecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdescriptorupdatetemplatecreateflags)
  (descriptorupdateentrycount :uint32)
  (pdescriptorupdateentries :pointer)
  (templatetype vkdescriptorupdatetemplatetype)
  (descriptorsetlayout vkdescriptorsetlayout)
  (pipelinebindpoint vkpipelinebindpoint)
  (pipelinelayout vkpipelinelayout)
  (set :uint32))

(cffi:defcstruct vkexternalmemoryproperties
  (externalmemoryfeatures vkexternalmemoryfeatureflags)
  (exportfromimportedhandletypes vkexternalmemoryhandletypeflags)
  (compatiblehandletypes vkexternalmemoryhandletypeflags))

(cffi:defcstruct vkphysicaldeviceexternalimageformatinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (handletype vkexternalmemoryhandletypeflagbits))

(cffi:defcstruct vkexternalimageformatproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (externalmemoryproperties (:struct vkexternalmemoryproperties)))

(cffi:defcstruct vkphysicaldeviceexternalbufferinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkbuffercreateflags)
  (usage vkbufferusageflags)
  (handletype vkexternalmemoryhandletypeflagbits))

(cffi:defcstruct vkexternalbufferproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (externalmemoryproperties (:struct vkexternalmemoryproperties)))

(cffi:defcstruct vkphysicaldeviceidproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (deviceuuid :uint8 :count (apply #'* (list vk_uuid_size)))
  (driveruuid :uint8 :count (apply #'* (list vk_uuid_size)))
  (deviceluid :uint8 :count (apply #'* (list vk_luid_size)))
  (devicenodemask :uint32)
  (deviceluidvalid vkbool32))

(cffi:defcstruct vkexternalmemoryimagecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (handletypes vkexternalmemoryhandletypeflags))

(cffi:defcstruct vkexternalmemorybuffercreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (handletypes vkexternalmemoryhandletypeflags))

(cffi:defcstruct vkexportmemoryallocateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (handletypes vkexternalmemoryhandletypeflags))

(cffi:defcstruct vkphysicaldeviceexternalfenceinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (handletype vkexternalfencehandletypeflagbits))

(cffi:defcstruct vkexternalfenceproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (exportfromimportedhandletypes vkexternalfencehandletypeflags)
  (compatiblehandletypes vkexternalfencehandletypeflags)
  (externalfencefeatures vkexternalfencefeatureflags))

(cffi:defcstruct vkexportfencecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (handletypes vkexternalfencehandletypeflags))

(cffi:defcstruct vkexportsemaphorecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (handletypes vkexternalsemaphorehandletypeflags))

(cffi:defcstruct vkphysicaldeviceexternalsemaphoreinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (handletype vkexternalsemaphorehandletypeflagbits))

(cffi:defcstruct vkexternalsemaphoreproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (exportfromimportedhandletypes vkexternalsemaphorehandletypeflags)
  (compatiblehandletypes vkexternalsemaphorehandletypeflags)
  (externalsemaphorefeatures vkexternalsemaphorefeatureflags))

(cffi:defcstruct vkphysicaldevicemaintenance3properties
  (stype vkstructuretype)
  (pnext :pointer)
  (maxpersetdescriptors :uint32)
  (maxmemoryallocationsize vkdevicesize))

(cffi:defcstruct vkdescriptorsetlayoutsupport
  (stype vkstructuretype)
  (pnext :pointer)
  (supported vkbool32))

(cffi:defcstruct vkphysicaldeviceshaderdrawparametersfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderdrawparameters vkbool32))

(cffi:defctype vkphysicaldeviceshaderdrawparameterfeatures
               (:struct vkphysicaldeviceshaderdrawparametersfeatures))

(cffi:defctype pfn_vkenumerateinstanceversion :pointer)

(cffi:defctype pfn_vkbindbuffermemory2 :pointer)

(cffi:defctype pfn_vkbindimagememory2 :pointer)

(cffi:defctype pfn_vkgetdevicegrouppeermemoryfeatures :pointer)

(cffi:defctype pfn_vkcmdsetdevicemask :pointer)

(cffi:defctype pfn_vkcmddispatchbase :pointer)

(cffi:defctype pfn_vkenumeratephysicaldevicegroups :pointer)

(cffi:defctype pfn_vkgetimagememoryrequirements2 :pointer)

(cffi:defctype pfn_vkgetbuffermemoryrequirements2 :pointer)

(cffi:defctype pfn_vkgetimagesparsememoryrequirements2 :pointer)

(cffi:defctype pfn_vkgetphysicaldevicefeatures2 :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceproperties2 :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceformatproperties2 :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceimageformatproperties2 :pointer)

(cffi:defctype pfn_vkgetphysicaldevicequeuefamilyproperties2 :pointer)

(cffi:defctype pfn_vkgetphysicaldevicememoryproperties2 :pointer)

(cffi:defctype pfn_vkgetphysicaldevicesparseimageformatproperties2 :pointer)

(cffi:defctype pfn_vktrimcommandpool :pointer)

(cffi:defctype pfn_vkgetdevicequeue2 :pointer)

(cffi:defctype pfn_vkcreatesamplerycbcrconversion :pointer)

(cffi:defctype pfn_vkdestroysamplerycbcrconversion :pointer)

(cffi:defctype pfn_vkcreatedescriptorupdatetemplate :pointer)

(cffi:defctype pfn_vkdestroydescriptorupdatetemplate :pointer)

(cffi:defctype pfn_vkupdatedescriptorsetwithtemplate :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceexternalbufferproperties :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceexternalfenceproperties :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceexternalsemaphoreproperties :pointer)

(cffi:defctype pfn_vkgetdescriptorsetlayoutsupport :pointer)

(cffi:defctype vkresolvemodeflags vkflags)

(cffi:defctype vkdescriptorbindingflags vkflags)

(cffi:defctype vksemaphorewaitflags vkflags)

(cffi:defcstruct vkphysicaldevicevulkan11features
  (stype vkstructuretype)
  (pnext :pointer)
  (storagebuffer16bitaccess vkbool32)
  (uniformandstoragebuffer16bitaccess vkbool32)
  (storagepushconstant16 vkbool32)
  (storageinputoutput16 vkbool32)
  (multiview vkbool32)
  (multiviewgeometryshader vkbool32)
  (multiviewtessellationshader vkbool32)
  (variablepointersstoragebuffer vkbool32)
  (variablepointers vkbool32)
  (protectedmemory vkbool32)
  (samplerycbcrconversion vkbool32)
  (shaderdrawparameters vkbool32))

(cffi:defcstruct vkphysicaldevicevulkan11properties
  (stype vkstructuretype)
  (pnext :pointer)
  (deviceuuid :uint8 :count (apply #'* (list vk_uuid_size)))
  (driveruuid :uint8 :count (apply #'* (list vk_uuid_size)))
  (deviceluid :uint8 :count (apply #'* (list vk_luid_size)))
  (devicenodemask :uint32)
  (deviceluidvalid vkbool32)
  (subgroupsize :uint32)
  (subgroupsupportedstages vkshaderstageflags)
  (subgroupsupportedoperations vksubgroupfeatureflags)
  (subgroupquadoperationsinallstages vkbool32)
  (pointclippingbehavior vkpointclippingbehavior)
  (maxmultiviewviewcount :uint32)
  (maxmultiviewinstanceindex :uint32)
  (protectednofault vkbool32)
  (maxpersetdescriptors :uint32)
  (maxmemoryallocationsize vkdevicesize))

(cffi:defcstruct vkphysicaldevicevulkan12features
  (stype vkstructuretype)
  (pnext :pointer)
  (samplermirrorclamptoedge vkbool32)
  (drawindirectcount vkbool32)
  (storagebuffer8bitaccess vkbool32)
  (uniformandstoragebuffer8bitaccess vkbool32)
  (storagepushconstant8 vkbool32)
  (shaderbufferint64atomics vkbool32)
  (shadersharedint64atomics vkbool32)
  (shaderfloat16 vkbool32)
  (shaderint8 vkbool32)
  (descriptorindexing vkbool32)
  (shaderinputattachmentarraydynamicindexing vkbool32)
  (shaderuniformtexelbufferarraydynamicindexing vkbool32)
  (shaderstoragetexelbufferarraydynamicindexing vkbool32)
  (shaderuniformbufferarraynonuniformindexing vkbool32)
  (shadersampledimagearraynonuniformindexing vkbool32)
  (shaderstoragebufferarraynonuniformindexing vkbool32)
  (shaderstorageimagearraynonuniformindexing vkbool32)
  (shaderinputattachmentarraynonuniformindexing vkbool32)
  (shaderuniformtexelbufferarraynonuniformindexing vkbool32)
  (shaderstoragetexelbufferarraynonuniformindexing vkbool32)
  (descriptorbindinguniformbufferupdateafterbind vkbool32)
  (descriptorbindingsampledimageupdateafterbind vkbool32)
  (descriptorbindingstorageimageupdateafterbind vkbool32)
  (descriptorbindingstoragebufferupdateafterbind vkbool32)
  (descriptorbindinguniformtexelbufferupdateafterbind vkbool32)
  (descriptorbindingstoragetexelbufferupdateafterbind vkbool32)
  (descriptorbindingupdateunusedwhilepending vkbool32)
  (descriptorbindingpartiallybound vkbool32)
  (descriptorbindingvariabledescriptorcount vkbool32)
  (runtimedescriptorarray vkbool32)
  (samplerfilterminmax vkbool32)
  (scalarblocklayout vkbool32)
  (imagelessframebuffer vkbool32)
  (uniformbufferstandardlayout vkbool32)
  (shadersubgroupextendedtypes vkbool32)
  (separatedepthstencillayouts vkbool32)
  (hostqueryreset vkbool32)
  (timelinesemaphore vkbool32)
  (bufferdeviceaddress vkbool32)
  (bufferdeviceaddresscapturereplay vkbool32)
  (bufferdeviceaddressmultidevice vkbool32)
  (vulkanmemorymodel vkbool32)
  (vulkanmemorymodeldevicescope vkbool32)
  (vulkanmemorymodelavailabilityvisibilitychains vkbool32)
  (shaderoutputviewportindex vkbool32)
  (shaderoutputlayer vkbool32)
  (subgroupbroadcastdynamicid vkbool32))

(cffi:defcstruct vkconformanceversion
  (major :uint8)
  (minor :uint8)
  (subminor :uint8)
  (patch :uint8))

(cffi:defcstruct vkphysicaldevicevulkan12properties
  (stype vkstructuretype)
  (pnext :pointer)
  (driverid vkdriverid)
  (drivername :char :count (apply #'* (list vk_max_driver_name_size)))
  (driverinfo :char :count (apply #'* (list vk_max_driver_info_size)))
  (conformanceversion (:struct vkconformanceversion))
  (denormbehaviorindependence vkshaderfloatcontrolsindependence)
  (roundingmodeindependence vkshaderfloatcontrolsindependence)
  (shadersignedzeroinfnanpreservefloat16 vkbool32)
  (shadersignedzeroinfnanpreservefloat32 vkbool32)
  (shadersignedzeroinfnanpreservefloat64 vkbool32)
  (shaderdenormpreservefloat16 vkbool32)
  (shaderdenormpreservefloat32 vkbool32)
  (shaderdenormpreservefloat64 vkbool32)
  (shaderdenormflushtozerofloat16 vkbool32)
  (shaderdenormflushtozerofloat32 vkbool32)
  (shaderdenormflushtozerofloat64 vkbool32)
  (shaderroundingmodertefloat16 vkbool32)
  (shaderroundingmodertefloat32 vkbool32)
  (shaderroundingmodertefloat64 vkbool32)
  (shaderroundingmodertzfloat16 vkbool32)
  (shaderroundingmodertzfloat32 vkbool32)
  (shaderroundingmodertzfloat64 vkbool32)
  (maxupdateafterbinddescriptorsinallpools :uint32)
  (shaderuniformbufferarraynonuniformindexingnative vkbool32)
  (shadersampledimagearraynonuniformindexingnative vkbool32)
  (shaderstoragebufferarraynonuniformindexingnative vkbool32)
  (shaderstorageimagearraynonuniformindexingnative vkbool32)
  (shaderinputattachmentarraynonuniformindexingnative vkbool32)
  (robustbufferaccessupdateafterbind vkbool32)
  (quaddivergentimplicitlod vkbool32)
  (maxperstagedescriptorupdateafterbindsamplers :uint32)
  (maxperstagedescriptorupdateafterbinduniformbuffers :uint32)
  (maxperstagedescriptorupdateafterbindstoragebuffers :uint32)
  (maxperstagedescriptorupdateafterbindsampledimages :uint32)
  (maxperstagedescriptorupdateafterbindstorageimages :uint32)
  (maxperstagedescriptorupdateafterbindinputattachments :uint32)
  (maxperstageupdateafterbindresources :uint32)
  (maxdescriptorsetupdateafterbindsamplers :uint32)
  (maxdescriptorsetupdateafterbinduniformbuffers :uint32)
  (maxdescriptorsetupdateafterbinduniformbuffersdynamic :uint32)
  (maxdescriptorsetupdateafterbindstoragebuffers :uint32)
  (maxdescriptorsetupdateafterbindstoragebuffersdynamic :uint32)
  (maxdescriptorsetupdateafterbindsampledimages :uint32)
  (maxdescriptorsetupdateafterbindstorageimages :uint32)
  (maxdescriptorsetupdateafterbindinputattachments :uint32)
  (supporteddepthresolvemodes vkresolvemodeflags)
  (supportedstencilresolvemodes vkresolvemodeflags)
  (independentresolvenone vkbool32)
  (independentresolve vkbool32)
  (filterminmaxsinglecomponentformats vkbool32)
  (filterminmaximagecomponentmapping vkbool32)
  (maxtimelinesemaphorevaluedifference :uint64)
  (framebufferintegercolorsamplecounts vksamplecountflags))

(cffi:defcstruct vkimageformatlistcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (viewformatcount :uint32)
  (pviewformats :pointer))

(cffi:defcstruct vkattachmentdescription2
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkattachmentdescriptionflags)
  (format vkformat)
  (samples vksamplecountflagbits)
  (loadop vkattachmentloadop)
  (storeop vkattachmentstoreop)
  (stencilloadop vkattachmentloadop)
  (stencilstoreop vkattachmentstoreop)
  (initiallayout vkimagelayout)
  (finallayout vkimagelayout))

(cffi:defcstruct vkattachmentreference2
  (stype vkstructuretype)
  (pnext :pointer)
  (attachment :uint32)
  (layout vkimagelayout)
  (aspectmask vkimageaspectflags))

(cffi:defcstruct vksubpassdescription2
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vksubpassdescriptionflags)
  (pipelinebindpoint vkpipelinebindpoint)
  (viewmask :uint32)
  (inputattachmentcount :uint32)
  (pinputattachments :pointer)
  (colorattachmentcount :uint32)
  (pcolorattachments :pointer)
  (presolveattachments :pointer)
  (pdepthstencilattachment :pointer)
  (preserveattachmentcount :uint32)
  (ppreserveattachments :pointer))

(cffi:defcstruct vksubpassdependency2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcsubpass :uint32)
  (dstsubpass :uint32)
  (srcstagemask vkpipelinestageflags)
  (dststagemask vkpipelinestageflags)
  (srcaccessmask vkaccessflags)
  (dstaccessmask vkaccessflags)
  (dependencyflags vkdependencyflags)
  (viewoffset :int32))

(cffi:defcstruct vkrenderpasscreateinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkrenderpasscreateflags)
  (attachmentcount :uint32)
  (pattachments :pointer)
  (subpasscount :uint32)
  (psubpasses :pointer)
  (dependencycount :uint32)
  (pdependencies :pointer)
  (correlatedviewmaskcount :uint32)
  (pcorrelatedviewmasks :pointer))

(cffi:defcstruct vksubpassbegininfo
  (stype vkstructuretype)
  (pnext :pointer)
  (contents vksubpasscontents))

(cffi:defcstruct vksubpassendinfo
  (stype vkstructuretype)
  (pnext :pointer))

(cffi:defcstruct vkphysicaldevice8bitstoragefeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (storagebuffer8bitaccess vkbool32)
  (uniformandstoragebuffer8bitaccess vkbool32)
  (storagepushconstant8 vkbool32))

(cffi:defcstruct vkphysicaldevicedriverproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (driverid vkdriverid)
  (drivername :char :count (apply #'* (list vk_max_driver_name_size)))
  (driverinfo :char :count (apply #'* (list vk_max_driver_info_size)))
  (conformanceversion (:struct vkconformanceversion)))

(cffi:defcstruct vkphysicaldeviceshaderatomicint64features
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderbufferint64atomics vkbool32)
  (shadersharedint64atomics vkbool32))

(cffi:defcstruct vkphysicaldeviceshaderfloat16int8features
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderfloat16 vkbool32)
  (shaderint8 vkbool32))

(cffi:defcstruct vkphysicaldevicefloatcontrolsproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (denormbehaviorindependence vkshaderfloatcontrolsindependence)
  (roundingmodeindependence vkshaderfloatcontrolsindependence)
  (shadersignedzeroinfnanpreservefloat16 vkbool32)
  (shadersignedzeroinfnanpreservefloat32 vkbool32)
  (shadersignedzeroinfnanpreservefloat64 vkbool32)
  (shaderdenormpreservefloat16 vkbool32)
  (shaderdenormpreservefloat32 vkbool32)
  (shaderdenormpreservefloat64 vkbool32)
  (shaderdenormflushtozerofloat16 vkbool32)
  (shaderdenormflushtozerofloat32 vkbool32)
  (shaderdenormflushtozerofloat64 vkbool32)
  (shaderroundingmodertefloat16 vkbool32)
  (shaderroundingmodertefloat32 vkbool32)
  (shaderroundingmodertefloat64 vkbool32)
  (shaderroundingmodertzfloat16 vkbool32)
  (shaderroundingmodertzfloat32 vkbool32)
  (shaderroundingmodertzfloat64 vkbool32))

(cffi:defcstruct vkdescriptorsetlayoutbindingflagscreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (bindingcount :uint32)
  (pbindingflags :pointer))

(cffi:defcstruct vkphysicaldevicedescriptorindexingfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderinputattachmentarraydynamicindexing vkbool32)
  (shaderuniformtexelbufferarraydynamicindexing vkbool32)
  (shaderstoragetexelbufferarraydynamicindexing vkbool32)
  (shaderuniformbufferarraynonuniformindexing vkbool32)
  (shadersampledimagearraynonuniformindexing vkbool32)
  (shaderstoragebufferarraynonuniformindexing vkbool32)
  (shaderstorageimagearraynonuniformindexing vkbool32)
  (shaderinputattachmentarraynonuniformindexing vkbool32)
  (shaderuniformtexelbufferarraynonuniformindexing vkbool32)
  (shaderstoragetexelbufferarraynonuniformindexing vkbool32)
  (descriptorbindinguniformbufferupdateafterbind vkbool32)
  (descriptorbindingsampledimageupdateafterbind vkbool32)
  (descriptorbindingstorageimageupdateafterbind vkbool32)
  (descriptorbindingstoragebufferupdateafterbind vkbool32)
  (descriptorbindinguniformtexelbufferupdateafterbind vkbool32)
  (descriptorbindingstoragetexelbufferupdateafterbind vkbool32)
  (descriptorbindingupdateunusedwhilepending vkbool32)
  (descriptorbindingpartiallybound vkbool32)
  (descriptorbindingvariabledescriptorcount vkbool32)
  (runtimedescriptorarray vkbool32))

(cffi:defcstruct vkphysicaldevicedescriptorindexingproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (maxupdateafterbinddescriptorsinallpools :uint32)
  (shaderuniformbufferarraynonuniformindexingnative vkbool32)
  (shadersampledimagearraynonuniformindexingnative vkbool32)
  (shaderstoragebufferarraynonuniformindexingnative vkbool32)
  (shaderstorageimagearraynonuniformindexingnative vkbool32)
  (shaderinputattachmentarraynonuniformindexingnative vkbool32)
  (robustbufferaccessupdateafterbind vkbool32)
  (quaddivergentimplicitlod vkbool32)
  (maxperstagedescriptorupdateafterbindsamplers :uint32)
  (maxperstagedescriptorupdateafterbinduniformbuffers :uint32)
  (maxperstagedescriptorupdateafterbindstoragebuffers :uint32)
  (maxperstagedescriptorupdateafterbindsampledimages :uint32)
  (maxperstagedescriptorupdateafterbindstorageimages :uint32)
  (maxperstagedescriptorupdateafterbindinputattachments :uint32)
  (maxperstageupdateafterbindresources :uint32)
  (maxdescriptorsetupdateafterbindsamplers :uint32)
  (maxdescriptorsetupdateafterbinduniformbuffers :uint32)
  (maxdescriptorsetupdateafterbinduniformbuffersdynamic :uint32)
  (maxdescriptorsetupdateafterbindstoragebuffers :uint32)
  (maxdescriptorsetupdateafterbindstoragebuffersdynamic :uint32)
  (maxdescriptorsetupdateafterbindsampledimages :uint32)
  (maxdescriptorsetupdateafterbindstorageimages :uint32)
  (maxdescriptorsetupdateafterbindinputattachments :uint32))

(cffi:defcstruct vkdescriptorsetvariabledescriptorcountallocateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (descriptorsetcount :uint32)
  (pdescriptorcounts :pointer))

(cffi:defcstruct vkdescriptorsetvariabledescriptorcountlayoutsupport
  (stype vkstructuretype)
  (pnext :pointer)
  (maxvariabledescriptorcount :uint32))

(cffi:defcstruct vksubpassdescriptiondepthstencilresolve
  (stype vkstructuretype)
  (pnext :pointer)
  (depthresolvemode vkresolvemodeflagbits)
  (stencilresolvemode vkresolvemodeflagbits)
  (pdepthstencilresolveattachment :pointer))

(cffi:defcstruct vkphysicaldevicedepthstencilresolveproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (supporteddepthresolvemodes vkresolvemodeflags)
  (supportedstencilresolvemodes vkresolvemodeflags)
  (independentresolvenone vkbool32)
  (independentresolve vkbool32))

(cffi:defcstruct vkphysicaldevicescalarblocklayoutfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (scalarblocklayout vkbool32))

(cffi:defcstruct vkimagestencilusagecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (stencilusage vkimageusageflags))

(cffi:defcstruct vksamplerreductionmodecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (reductionmode vksamplerreductionmode))

(cffi:defcstruct vkphysicaldevicesamplerfilterminmaxproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (filterminmaxsinglecomponentformats vkbool32)
  (filterminmaximagecomponentmapping vkbool32))

(cffi:defcstruct vkphysicaldevicevulkanmemorymodelfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (vulkanmemorymodel vkbool32)
  (vulkanmemorymodeldevicescope vkbool32)
  (vulkanmemorymodelavailabilityvisibilitychains vkbool32))

(cffi:defcstruct vkphysicaldeviceimagelessframebufferfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (imagelessframebuffer vkbool32))

(cffi:defcstruct vkframebufferattachmentimageinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkimagecreateflags)
  (usage vkimageusageflags)
  (width :uint32)
  (height :uint32)
  (layercount :uint32)
  (viewformatcount :uint32)
  (pviewformats :pointer))

(cffi:defcstruct vkframebufferattachmentscreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (attachmentimageinfocount :uint32)
  (pattachmentimageinfos :pointer))

(cffi:defcstruct vkrenderpassattachmentbegininfo
  (stype vkstructuretype)
  (pnext :pointer)
  (attachmentcount :uint32)
  (pattachments :pointer))

(cffi:defcstruct vkphysicaldeviceuniformbufferstandardlayoutfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (uniformbufferstandardlayout vkbool32))

(cffi:defcstruct vkphysicaldeviceshadersubgroupextendedtypesfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (shadersubgroupextendedtypes vkbool32))

(cffi:defcstruct vkphysicaldeviceseparatedepthstencillayoutsfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (separatedepthstencillayouts vkbool32))

(cffi:defcstruct vkattachmentreferencestencillayout
  (stype vkstructuretype)
  (pnext :pointer)
  (stencillayout vkimagelayout))

(cffi:defcstruct vkattachmentdescriptionstencillayout
  (stype vkstructuretype)
  (pnext :pointer)
  (stencilinitiallayout vkimagelayout)
  (stencilfinallayout vkimagelayout))

(cffi:defcstruct vkphysicaldevicehostqueryresetfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (hostqueryreset vkbool32))

(cffi:defcstruct vkphysicaldevicetimelinesemaphorefeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (timelinesemaphore vkbool32))

(cffi:defcstruct vkphysicaldevicetimelinesemaphoreproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (maxtimelinesemaphorevaluedifference :uint64))

(cffi:defcstruct vksemaphoretypecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (semaphoretype vksemaphoretype)
  (initialvalue :uint64))

(cffi:defcstruct vktimelinesemaphoresubmitinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (waitsemaphorevaluecount :uint32)
  (pwaitsemaphorevalues :pointer)
  (signalsemaphorevaluecount :uint32)
  (psignalsemaphorevalues :pointer))

(cffi:defcstruct vksemaphorewaitinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vksemaphorewaitflags)
  (semaphorecount :uint32)
  (psemaphores :pointer)
  (pvalues :pointer))

(cffi:defcstruct vksemaphoresignalinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (semaphore vksemaphore)
  (value :uint64))

(cffi:defcstruct vkphysicaldevicebufferdeviceaddressfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (bufferdeviceaddress vkbool32)
  (bufferdeviceaddresscapturereplay vkbool32)
  (bufferdeviceaddressmultidevice vkbool32))

(cffi:defcstruct vkbufferdeviceaddressinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (buffer vkbuffer))

(cffi:defcstruct vkbufferopaquecaptureaddresscreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (opaquecaptureaddress :uint64))

(cffi:defcstruct vkmemoryopaquecaptureaddressallocateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (opaquecaptureaddress :uint64))

(cffi:defcstruct vkdevicememoryopaquecaptureaddressinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (memory vkdevicememory))

(cffi:defctype pfn_vkcmddrawindirectcount :pointer)

(cffi:defctype pfn_vkcmddrawindexedindirectcount :pointer)

(cffi:defctype pfn_vkcreaterenderpass2 :pointer)

(cffi:defctype pfn_vkcmdbeginrenderpass2 :pointer)

(cffi:defctype pfn_vkcmdnextsubpass2 :pointer)

(cffi:defctype pfn_vkcmdendrenderpass2 :pointer)

(cffi:defctype pfn_vkresetquerypool :pointer)

(cffi:defctype pfn_vkgetsemaphorecountervalue :pointer)

(cffi:defctype pfn_vkwaitsemaphores :pointer)

(cffi:defctype pfn_vksignalsemaphore :pointer)

(cffi:defctype pfn_vkgetbufferdeviceaddress :pointer)

(cffi:defctype pfn_vkgetbufferopaquecaptureaddress :pointer)

(cffi:defctype pfn_vkgetdevicememoryopaquecaptureaddress :pointer)

(cffi:defctype vkflags64 :uint64)

(cffi:defctype vkprivatedataslot non-dispatchable-handle)

(cffi:defctype vkpipelinecreationfeedbackflags vkflags)

(cffi:defctype vktoolpurposeflags vkflags)

(cffi:defctype vkprivatedataslotcreateflags vkflags)

(cffi:defctype vkpipelinestageflags2 vkflags64)

(cffi:defctype vkpipelinestageflagbits2 vkflags64)

(cffi:defctype vkaccessflags2 vkflags64)

(cffi:defctype vkaccessflagbits2 vkflags64)

(cffi:defctype vksubmitflags vkflags)

(cffi:defctype vkrenderingflags vkflags)

(cffi:defctype vkformatfeatureflags2 vkflags64)

(cffi:defctype vkformatfeatureflagbits2 vkflags64)

(cffi:defcstruct vkphysicaldevicevulkan13features
  (stype vkstructuretype)
  (pnext :pointer)
  (robustimageaccess vkbool32)
  (inlineuniformblock vkbool32)
  (descriptorbindinginlineuniformblockupdateafterbind vkbool32)
  (pipelinecreationcachecontrol vkbool32)
  (privatedata vkbool32)
  (shaderdemotetohelperinvocation vkbool32)
  (shaderterminateinvocation vkbool32)
  (subgroupsizecontrol vkbool32)
  (computefullsubgroups vkbool32)
  (synchronization2 vkbool32)
  (texturecompressionastc_hdr vkbool32)
  (shaderzeroinitializeworkgroupmemory vkbool32)
  (dynamicrendering vkbool32)
  (shaderintegerdotproduct vkbool32)
  (maintenance4 vkbool32))

(cffi:defcstruct vkphysicaldevicevulkan13properties
  (stype vkstructuretype)
  (pnext :pointer)
  (minsubgroupsize :uint32)
  (maxsubgroupsize :uint32)
  (maxcomputeworkgroupsubgroups :uint32)
  (requiredsubgroupsizestages vkshaderstageflags)
  (maxinlineuniformblocksize :uint32)
  (maxperstagedescriptorinlineuniformblocks :uint32)
  (maxperstagedescriptorupdateafterbindinlineuniformblocks :uint32)
  (maxdescriptorsetinlineuniformblocks :uint32)
  (maxdescriptorsetupdateafterbindinlineuniformblocks :uint32)
  (maxinlineuniformtotalsize :uint32)
  (integerdotproduct8bitunsignedaccelerated vkbool32)
  (integerdotproduct8bitsignedaccelerated vkbool32)
  (integerdotproduct8bitmixedsignednessaccelerated vkbool32)
  (integerdotproduct4x8bitpackedunsignedaccelerated vkbool32)
  (integerdotproduct4x8bitpackedsignedaccelerated vkbool32)
  (integerdotproduct4x8bitpackedmixedsignednessaccelerated vkbool32)
  (integerdotproduct16bitunsignedaccelerated vkbool32)
  (integerdotproduct16bitsignedaccelerated vkbool32)
  (integerdotproduct16bitmixedsignednessaccelerated vkbool32)
  (integerdotproduct32bitunsignedaccelerated vkbool32)
  (integerdotproduct32bitsignedaccelerated vkbool32)
  (integerdotproduct32bitmixedsignednessaccelerated vkbool32)
  (integerdotproduct64bitunsignedaccelerated vkbool32)
  (integerdotproduct64bitsignedaccelerated vkbool32)
  (integerdotproduct64bitmixedsignednessaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating8bitunsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating8bitsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating8bitmixedsignednessaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating4x8bitpackedunsignedaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating4x8bitpackedsignedaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating4x8bitpackedmixedsignednessaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating16bitunsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating16bitsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating16bitmixedsignednessaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating32bitunsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating32bitsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating32bitmixedsignednessaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating64bitunsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating64bitsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating64bitmixedsignednessaccelerated
   vkbool32)
  (storagetexelbufferoffsetalignmentbytes vkdevicesize)
  (storagetexelbufferoffsetsingletexelalignment vkbool32)
  (uniformtexelbufferoffsetalignmentbytes vkdevicesize)
  (uniformtexelbufferoffsetsingletexelalignment vkbool32)
  (maxbuffersize vkdevicesize))

(cffi:defcstruct vkpipelinecreationfeedback
  (flags vkpipelinecreationfeedbackflags)
  (duration :uint64))

(cffi:defcstruct vkpipelinecreationfeedbackcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (ppipelinecreationfeedback :pointer)
  (pipelinestagecreationfeedbackcount :uint32)
  (ppipelinestagecreationfeedbacks :pointer))

(cffi:defcstruct vkphysicaldeviceshaderterminateinvocationfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderterminateinvocation vkbool32))

(cffi:defcstruct vkphysicaldevicetoolproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (name :char :count (apply #'* (list vk_max_extension_name_size)))
  (version :char :count (apply #'* (list vk_max_extension_name_size)))
  (purposes vktoolpurposeflags)
  (description :char :count (apply #'* (list vk_max_description_size)))
  (layer :char :count (apply #'* (list vk_max_extension_name_size))))

(cffi:defcstruct vkphysicaldeviceshaderdemotetohelperinvocationfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderdemotetohelperinvocation vkbool32))

(cffi:defcstruct vkphysicaldeviceprivatedatafeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (privatedata vkbool32))

(cffi:defcstruct vkdeviceprivatedatacreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (privatedataslotrequestcount :uint32))

(cffi:defcstruct vkprivatedataslotcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkprivatedataslotcreateflags))

(cffi:defcstruct vkphysicaldevicepipelinecreationcachecontrolfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (pipelinecreationcachecontrol vkbool32))

(cffi:defcstruct vkmemorybarrier2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcstagemask vkpipelinestageflags2)
  (srcaccessmask vkaccessflags2)
  (dststagemask vkpipelinestageflags2)
  (dstaccessmask vkaccessflags2))

(cffi:defcstruct vkbuffermemorybarrier2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcstagemask vkpipelinestageflags2)
  (srcaccessmask vkaccessflags2)
  (dststagemask vkpipelinestageflags2)
  (dstaccessmask vkaccessflags2)
  (srcqueuefamilyindex :uint32)
  (dstqueuefamilyindex :uint32)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (size vkdevicesize))

(cffi:defcstruct vkimagememorybarrier2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcstagemask vkpipelinestageflags2)
  (srcaccessmask vkaccessflags2)
  (dststagemask vkpipelinestageflags2)
  (dstaccessmask vkaccessflags2)
  (oldlayout vkimagelayout)
  (newlayout vkimagelayout)
  (srcqueuefamilyindex :uint32)
  (dstqueuefamilyindex :uint32)
  (image vkimage)
  (subresourcerange (:struct vkimagesubresourcerange)))

(cffi:defcstruct vkdependencyinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (dependencyflags vkdependencyflags)
  (memorybarriercount :uint32)
  (pmemorybarriers :pointer)
  (buffermemorybarriercount :uint32)
  (pbuffermemorybarriers :pointer)
  (imagememorybarriercount :uint32)
  (pimagememorybarriers :pointer))

(cffi:defcstruct vksemaphoresubmitinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (semaphore vksemaphore)
  (value :uint64)
  (stagemask vkpipelinestageflags2)
  (deviceindex :uint32))

(cffi:defcstruct vkcommandbuffersubmitinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (commandbuffer vkcommandbuffer)
  (devicemask :uint32))

(cffi:defcstruct vksubmitinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vksubmitflags)
  (waitsemaphoreinfocount :uint32)
  (pwaitsemaphoreinfos :pointer)
  (commandbufferinfocount :uint32)
  (pcommandbufferinfos :pointer)
  (signalsemaphoreinfocount :uint32)
  (psignalsemaphoreinfos :pointer))

(cffi:defcstruct vkphysicaldevicesynchronization2features
  (stype vkstructuretype)
  (pnext :pointer)
  (synchronization2 vkbool32))

(cffi:defcstruct vkphysicaldevicezeroinitializeworkgroupmemoryfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderzeroinitializeworkgroupmemory vkbool32))

(cffi:defcstruct vkphysicaldeviceimagerobustnessfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (robustimageaccess vkbool32))

(cffi:defcstruct vkbuffercopy2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcoffset vkdevicesize)
  (dstoffset vkdevicesize)
  (size vkdevicesize))

(cffi:defcstruct vkcopybufferinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcbuffer vkbuffer)
  (dstbuffer vkbuffer)
  (regioncount :uint32)
  (pregions :pointer))

(cffi:defcstruct vkimagecopy2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcsubresource (:struct vkimagesubresourcelayers))
  (srcoffset (:struct vkoffset3d))
  (dstsubresource (:struct vkimagesubresourcelayers))
  (dstoffset (:struct vkoffset3d))
  (extent (:struct vkextent3d)))

(cffi:defcstruct vkcopyimageinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer))

(cffi:defcstruct vkbufferimagecopy2
  (stype vkstructuretype)
  (pnext :pointer)
  (bufferoffset vkdevicesize)
  (bufferrowlength :uint32)
  (bufferimageheight :uint32)
  (imagesubresource (:struct vkimagesubresourcelayers))
  (imageoffset (:struct vkoffset3d))
  (imageextent (:struct vkextent3d)))

(cffi:defcstruct vkcopybuffertoimageinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcbuffer vkbuffer)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer))

(cffi:defcstruct vkcopyimagetobufferinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstbuffer vkbuffer)
  (regioncount :uint32)
  (pregions :pointer))

(cffi:defcstruct vkimageblit2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcsubresource (:struct vkimagesubresourcelayers))
  (srcoffsets (:struct vkoffset3d) :count (apply #'* (list 2)))
  (dstsubresource (:struct vkimagesubresourcelayers))
  (dstoffsets (:struct vkoffset3d) :count (apply #'* (list 2))))

(cffi:defcstruct vkblitimageinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer)
  (filter vkfilter))

(cffi:defcstruct vkimageresolve2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcsubresource (:struct vkimagesubresourcelayers))
  (srcoffset (:struct vkoffset3d))
  (dstsubresource (:struct vkimagesubresourcelayers))
  (dstoffset (:struct vkoffset3d))
  (extent (:struct vkextent3d)))

(cffi:defcstruct vkresolveimageinfo2
  (stype vkstructuretype)
  (pnext :pointer)
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions :pointer))

(cffi:defcstruct vkphysicaldevicesubgroupsizecontrolfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (subgroupsizecontrol vkbool32)
  (computefullsubgroups vkbool32))

(cffi:defcstruct vkphysicaldevicesubgroupsizecontrolproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (minsubgroupsize :uint32)
  (maxsubgroupsize :uint32)
  (maxcomputeworkgroupsubgroups :uint32)
  (requiredsubgroupsizestages vkshaderstageflags))

(cffi:defcstruct vkpipelineshaderstagerequiredsubgroupsizecreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (requiredsubgroupsize :uint32))

(cffi:defcstruct vkphysicaldeviceinlineuniformblockfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (inlineuniformblock vkbool32)
  (descriptorbindinginlineuniformblockupdateafterbind vkbool32))

(cffi:defcstruct vkphysicaldeviceinlineuniformblockproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (maxinlineuniformblocksize :uint32)
  (maxperstagedescriptorinlineuniformblocks :uint32)
  (maxperstagedescriptorupdateafterbindinlineuniformblocks :uint32)
  (maxdescriptorsetinlineuniformblocks :uint32)
  (maxdescriptorsetupdateafterbindinlineuniformblocks :uint32))

(cffi:defcstruct vkwritedescriptorsetinlineuniformblock
  (stype vkstructuretype)
  (pnext :pointer)
  (datasize :uint32)
  (pdata :pointer))

(cffi:defcstruct vkdescriptorpoolinlineuniformblockcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (maxinlineuniformblockbindings :uint32))

(cffi:defcstruct vkphysicaldevicetexturecompressionastchdrfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (texturecompressionastc_hdr vkbool32))

(cffi:defcstruct vkrenderingattachmentinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (imageview vkimageview)
  (imagelayout vkimagelayout)
  (resolvemode vkresolvemodeflagbits)
  (resolveimageview vkimageview)
  (resolveimagelayout vkimagelayout)
  (loadop vkattachmentloadop)
  (storeop vkattachmentstoreop)
  (clearvalue (:union vkclearvalue)))

(cffi:defcstruct vkrenderinginfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkrenderingflags)
  (renderarea (:struct vkrect2d))
  (layercount :uint32)
  (viewmask :uint32)
  (colorattachmentcount :uint32)
  (pcolorattachments :pointer)
  (pdepthattachment :pointer)
  (pstencilattachment :pointer))

(cffi:defcstruct vkpipelinerenderingcreateinfo
  (stype vkstructuretype)
  (pnext :pointer)
  (viewmask :uint32)
  (colorattachmentcount :uint32)
  (pcolorattachmentformats :pointer)
  (depthattachmentformat vkformat)
  (stencilattachmentformat vkformat))

(cffi:defcstruct vkphysicaldevicedynamicrenderingfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (dynamicrendering vkbool32))

(cffi:defcstruct vkcommandbufferinheritancerenderinginfo
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkrenderingflags)
  (viewmask :uint32)
  (colorattachmentcount :uint32)
  (pcolorattachmentformats :pointer)
  (depthattachmentformat vkformat)
  (stencilattachmentformat vkformat)
  (rasterizationsamples vksamplecountflagbits))

(cffi:defcstruct vkphysicaldeviceshaderintegerdotproductfeatures
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderintegerdotproduct vkbool32))

(cffi:defcstruct vkphysicaldeviceshaderintegerdotproductproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (integerdotproduct8bitunsignedaccelerated vkbool32)
  (integerdotproduct8bitsignedaccelerated vkbool32)
  (integerdotproduct8bitmixedsignednessaccelerated vkbool32)
  (integerdotproduct4x8bitpackedunsignedaccelerated vkbool32)
  (integerdotproduct4x8bitpackedsignedaccelerated vkbool32)
  (integerdotproduct4x8bitpackedmixedsignednessaccelerated vkbool32)
  (integerdotproduct16bitunsignedaccelerated vkbool32)
  (integerdotproduct16bitsignedaccelerated vkbool32)
  (integerdotproduct16bitmixedsignednessaccelerated vkbool32)
  (integerdotproduct32bitunsignedaccelerated vkbool32)
  (integerdotproduct32bitsignedaccelerated vkbool32)
  (integerdotproduct32bitmixedsignednessaccelerated vkbool32)
  (integerdotproduct64bitunsignedaccelerated vkbool32)
  (integerdotproduct64bitsignedaccelerated vkbool32)
  (integerdotproduct64bitmixedsignednessaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating8bitunsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating8bitsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating8bitmixedsignednessaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating4x8bitpackedunsignedaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating4x8bitpackedsignedaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating4x8bitpackedmixedsignednessaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating16bitunsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating16bitsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating16bitmixedsignednessaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating32bitunsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating32bitsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating32bitmixedsignednessaccelerated
   vkbool32)
  (integerdotproductaccumulatingsaturating64bitunsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating64bitsignedaccelerated vkbool32)
  (integerdotproductaccumulatingsaturating64bitmixedsignednessaccelerated
   vkbool32))

(cffi:defcstruct vkphysicaldevicetexelbufferalignmentproperties
  (stype vkstructuretype)
  (pnext :pointer)
  (storagetexelbufferoffsetalignmentbytes vkdevicesize)
  (storagetexelbufferoffsetsingletexelalignment vkbool32)
  (uniformtexelbufferoffsetalignmentbytes vkdevicesize)
  (uniformtexelbufferoffsetsingletexelalignment vkbool32))

(cffi:defcstruct vkformatproperties3
  (stype vkstructuretype)
  (pnext :pointer)
  (lineartilingfeatures vkformatfeatureflags2)
  (optimaltilingfeatures vkformatfeatureflags2)
  (bufferfeatures vkformatfeatureflags2))

(cffi:defcstruct vkphysicaldevicemaintenance4features
  (stype vkstructuretype)
  (pnext :pointer)
  (maintenance4 vkbool32))

(cffi:defcstruct vkphysicaldevicemaintenance4properties
  (stype vkstructuretype)
  (pnext :pointer)
  (maxbuffersize vkdevicesize))

(cffi:defcstruct vkdevicebuffermemoryrequirements
  (stype vkstructuretype)
  (pnext :pointer)
  (pcreateinfo :pointer))

(cffi:defcstruct vkdeviceimagememoryrequirements
  (stype vkstructuretype)
  (pnext :pointer)
  (pcreateinfo :pointer)
  (planeaspect vkimageaspectflagbits))

(cffi:defctype pfn_vkgetphysicaldevicetoolproperties :pointer)

(cffi:defctype pfn_vkcreateprivatedataslot :pointer)

(cffi:defctype pfn_vkdestroyprivatedataslot :pointer)

(cffi:defctype pfn_vksetprivatedata :pointer)

(cffi:defctype pfn_vkgetprivatedata :pointer)

(cffi:defctype pfn_vkcmdsetevent2 :pointer)

(cffi:defctype pfn_vkcmdresetevent2 :pointer)

(cffi:defctype pfn_vkcmdwaitevents2 :pointer)

(cffi:defctype pfn_vkcmdpipelinebarrier2 :pointer)

(cffi:defctype pfn_vkcmdwritetimestamp2 :pointer)

(cffi:defctype pfn_vkqueuesubmit2 :pointer)

(cffi:defctype pfn_vkcmdcopybuffer2 :pointer)

(cffi:defctype pfn_vkcmdcopyimage2 :pointer)

(cffi:defctype pfn_vkcmdcopybuffertoimage2 :pointer)

(cffi:defctype pfn_vkcmdcopyimagetobuffer2 :pointer)

(cffi:defctype pfn_vkcmdblitimage2 :pointer)

(cffi:defctype pfn_vkcmdresolveimage2 :pointer)

(cffi:defctype pfn_vkcmdbeginrendering :pointer)

(cffi:defctype pfn_vkcmdendrendering :pointer)

(cffi:defctype pfn_vkcmdsetcullmode :pointer)

(cffi:defctype pfn_vkcmdsetfrontface :pointer)

(cffi:defctype pfn_vkcmdsetprimitivetopology :pointer)

(cffi:defctype pfn_vkcmdsetviewportwithcount :pointer)

(cffi:defctype pfn_vkcmdsetscissorwithcount :pointer)

(cffi:defctype pfn_vkcmdbindvertexbuffers2 :pointer)

(cffi:defctype pfn_vkcmdsetdepthtestenable :pointer)

(cffi:defctype pfn_vkcmdsetdepthwriteenable :pointer)

(cffi:defctype pfn_vkcmdsetdepthcompareop :pointer)

(cffi:defctype pfn_vkcmdsetdepthboundstestenable :pointer)

(cffi:defctype pfn_vkcmdsetstenciltestenable :pointer)

(cffi:defctype pfn_vkcmdsetstencilop :pointer)

(cffi:defctype pfn_vkcmdsetrasterizerdiscardenable :pointer)

(cffi:defctype pfn_vkcmdsetdepthbiasenable :pointer)

(cffi:defctype pfn_vkcmdsetprimitiverestartenable :pointer)

(cffi:defctype pfn_vkgetdevicebuffermemoryrequirements :pointer)

(cffi:defctype pfn_vkgetdeviceimagememoryrequirements :pointer)

(cffi:defctype pfn_vkgetdeviceimagesparsememoryrequirements :pointer)

(cffi:defctype vksurfacekhr non-dispatchable-handle)

(cffi:defctype vkcompositealphaflagskhr vkflags)

(cffi:defctype vksurfacetransformflagskhr vkflags)

(cffi:defcstruct vksurfacecapabilitieskhr
  (minimagecount :uint32)
  (maximagecount :uint32)
  (currentextent (:struct vkextent2d))
  (minimageextent (:struct vkextent2d))
  (maximageextent (:struct vkextent2d))
  (maximagearraylayers :uint32)
  (supportedtransforms vksurfacetransformflagskhr)
  (currenttransform vksurfacetransformflagbitskhr)
  (supportedcompositealpha vkcompositealphaflagskhr)
  (supportedusageflags vkimageusageflags))

(cffi:defcstruct vksurfaceformatkhr
  (format vkformat)
  (colorspace vkcolorspacekhr))

(cffi:defctype pfn_vkdestroysurfacekhr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicesurfacesupportkhr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicesurfacecapabilitieskhr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicesurfaceformatskhr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicesurfacepresentmodeskhr :pointer)

(cffi:defctype vkswapchainkhr non-dispatchable-handle)

(cffi:defctype vkswapchaincreateflagskhr vkflags)

(cffi:defctype vkdevicegrouppresentmodeflagskhr vkflags)

(cffi:defcstruct vkswapchaincreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkswapchaincreateflagskhr)
  (surface vksurfacekhr)
  (minimagecount :uint32)
  (imageformat vkformat)
  (imagecolorspace vkcolorspacekhr)
  (imageextent (:struct vkextent2d))
  (imagearraylayers :uint32)
  (imageusage vkimageusageflags)
  (imagesharingmode vksharingmode)
  (queuefamilyindexcount :uint32)
  (pqueuefamilyindices :pointer)
  (pretransform vksurfacetransformflagbitskhr)
  (compositealpha vkcompositealphaflagbitskhr)
  (presentmode vkpresentmodekhr)
  (clipped vkbool32)
  (oldswapchain vkswapchainkhr))

(cffi:defcstruct vkpresentinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (waitsemaphorecount :uint32)
  (pwaitsemaphores :pointer)
  (swapchaincount :uint32)
  (pswapchains :pointer)
  (pimageindices :pointer)
  (presults :pointer))

(cffi:defcstruct vkimageswapchaincreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (swapchain vkswapchainkhr))

(cffi:defcstruct vkbindimagememoryswapchaininfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (swapchain vkswapchainkhr)
  (imageindex :uint32))

(cffi:defcstruct vkacquirenextimageinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (swapchain vkswapchainkhr)
  (timeout :uint64)
  (semaphore vksemaphore)
  (fence vkfence)
  (devicemask :uint32))

(cffi:defcstruct vkdevicegrouppresentcapabilitieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (presentmask :uint32 :count (apply #'* (list vk_max_device_group_size)))
  (modes vkdevicegrouppresentmodeflagskhr))

(cffi:defcstruct vkdevicegrouppresentinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (swapchaincount :uint32)
  (pdevicemasks :pointer)
  (mode vkdevicegrouppresentmodeflagbitskhr))

(cffi:defcstruct vkdevicegroupswapchaincreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (modes vkdevicegrouppresentmodeflagskhr))

(cffi:defctype pfn_vkcreateswapchainkhr :pointer)

(cffi:defctype pfn_vkdestroyswapchainkhr :pointer)

(cffi:defctype pfn_vkgetswapchainimageskhr :pointer)

(cffi:defctype pfn_vkacquirenextimagekhr :pointer)

(cffi:defctype pfn_vkqueuepresentkhr :pointer)

(cffi:defctype pfn_vkgetdevicegrouppresentcapabilitieskhr :pointer)

(cffi:defctype pfn_vkgetdevicegroupsurfacepresentmodeskhr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicepresentrectangleskhr :pointer)

(cffi:defctype pfn_vkacquirenextimage2khr :pointer)

(cffi:defctype vkdisplaykhr non-dispatchable-handle)

(cffi:defctype vkdisplaymodekhr non-dispatchable-handle)

(cffi:defctype vkdisplaymodecreateflagskhr vkflags)

(cffi:defctype vkdisplayplanealphaflagskhr vkflags)

(cffi:defctype vkdisplaysurfacecreateflagskhr vkflags)

(cffi:defcstruct vkdisplaymodeparameterskhr
  (visibleregion (:struct vkextent2d))
  (refreshrate :uint32))

(cffi:defcstruct vkdisplaymodecreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdisplaymodecreateflagskhr)
  (parameters (:struct vkdisplaymodeparameterskhr)))

(cffi:defcstruct vkdisplaymodepropertieskhr
  (displaymode vkdisplaymodekhr)
  (parameters (:struct vkdisplaymodeparameterskhr)))

(cffi:defcstruct vkdisplayplanecapabilitieskhr
  (supportedalpha vkdisplayplanealphaflagskhr)
  (minsrcposition (:struct vkoffset2d))
  (maxsrcposition (:struct vkoffset2d))
  (minsrcextent (:struct vkextent2d))
  (maxsrcextent (:struct vkextent2d))
  (mindstposition (:struct vkoffset2d))
  (maxdstposition (:struct vkoffset2d))
  (mindstextent (:struct vkextent2d))
  (maxdstextent (:struct vkextent2d)))

(cffi:defcstruct vkdisplayplanepropertieskhr
  (currentdisplay vkdisplaykhr)
  (currentstackindex :uint32))

(cffi:defcstruct vkdisplaypropertieskhr
  (display vkdisplaykhr)
  (displayname :pointer)
  (physicaldimensions (:struct vkextent2d))
  (physicalresolution (:struct vkextent2d))
  (supportedtransforms vksurfacetransformflagskhr)
  (planereorderpossible vkbool32)
  (persistentcontent vkbool32))

(cffi:defcstruct vkdisplaysurfacecreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdisplaysurfacecreateflagskhr)
  (displaymode vkdisplaymodekhr)
  (planeindex :uint32)
  (planestackindex :uint32)
  (transform vksurfacetransformflagbitskhr)
  (globalalpha :float)
  (alphamode vkdisplayplanealphaflagbitskhr)
  (imageextent (:struct vkextent2d)))

(cffi:defctype pfn_vkgetphysicaldevicedisplaypropertieskhr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicedisplayplanepropertieskhr :pointer)

(cffi:defctype pfn_vkgetdisplayplanesupporteddisplayskhr :pointer)

(cffi:defctype pfn_vkgetdisplaymodepropertieskhr :pointer)

(cffi:defctype pfn_vkcreatedisplaymodekhr :pointer)

(cffi:defctype pfn_vkgetdisplayplanecapabilitieskhr :pointer)

(cffi:defctype pfn_vkcreatedisplayplanesurfacekhr :pointer)

(cffi:defcstruct vkdisplaypresentinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (srcrect (:struct vkrect2d))
  (dstrect (:struct vkrect2d))
  (persistent vkbool32))

(cffi:defctype pfn_vkcreatesharedswapchainskhr :pointer)

(cffi:defctype vkrenderingflagskhr vkrenderingflags)

(cffi:defctype vkrenderingflagbitskhr vkrenderingflagbits)

(cffi:defctype vkrenderinginfokhr (:struct vkrenderinginfo))

(cffi:defctype vkrenderingattachmentinfokhr (:struct vkrenderingattachmentinfo))

(cffi:defctype vkpipelinerenderingcreateinfokhr
               (:struct vkpipelinerenderingcreateinfo))

(cffi:defctype vkphysicaldevicedynamicrenderingfeatureskhr
               (:struct vkphysicaldevicedynamicrenderingfeatures))

(cffi:defctype vkcommandbufferinheritancerenderinginfokhr
               (:struct vkcommandbufferinheritancerenderinginfo))

(cffi:defcstruct vkrenderingfragmentshadingrateattachmentinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (imageview vkimageview)
  (imagelayout vkimagelayout)
  (shadingrateattachmenttexelsize (:struct vkextent2d)))

(cffi:defcstruct vkrenderingfragmentdensitymapattachmentinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (imageview vkimageview)
  (imagelayout vkimagelayout))

(cffi:defcstruct vkattachmentsamplecountinfoamd
  (stype vkstructuretype)
  (pnext :pointer)
  (colorattachmentcount :uint32)
  (pcolorattachmentsamples :pointer)
  (depthstencilattachmentsamples vksamplecountflagbits))

(cffi:defctype vkattachmentsamplecountinfonv
               (:struct vkattachmentsamplecountinfoamd))

(cffi:defcstruct vkmultiviewperviewattributesinfonvx
  (stype vkstructuretype)
  (pnext :pointer)
  (perviewattributes vkbool32)
  (perviewattributespositionxonly vkbool32))

(cffi:defctype pfn_vkcmdbeginrenderingkhr :pointer)

(cffi:defctype pfn_vkcmdendrenderingkhr :pointer)

(cffi:defctype vkrenderpassmultiviewcreateinfokhr
               (:struct vkrenderpassmultiviewcreateinfo))

(cffi:defctype vkphysicaldevicemultiviewfeatureskhr
               (:struct vkphysicaldevicemultiviewfeatures))

(cffi:defctype vkphysicaldevicemultiviewpropertieskhr
               (:struct vkphysicaldevicemultiviewproperties))

(cffi:defctype vkphysicaldevicefeatures2khr (:struct vkphysicaldevicefeatures2))

(cffi:defctype vkphysicaldeviceproperties2khr
               (:struct vkphysicaldeviceproperties2))

(cffi:defctype vkformatproperties2khr (:struct vkformatproperties2))

(cffi:defctype vkimageformatproperties2khr (:struct vkimageformatproperties2))

(cffi:defctype vkphysicaldeviceimageformatinfo2khr
               (:struct vkphysicaldeviceimageformatinfo2))

(cffi:defctype vkqueuefamilyproperties2khr (:struct vkqueuefamilyproperties2))

(cffi:defctype vkphysicaldevicememoryproperties2khr
               (:struct vkphysicaldevicememoryproperties2))

(cffi:defctype vksparseimageformatproperties2khr
               (:struct vksparseimageformatproperties2))

(cffi:defctype vkphysicaldevicesparseimageformatinfo2khr
               (:struct vkphysicaldevicesparseimageformatinfo2))

(cffi:defctype pfn_vkgetphysicaldevicefeatures2khr :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceproperties2khr :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceformatproperties2khr :pointer)

(cffi:defctype pfn_vkgetphysicaldeviceimageformatproperties2khr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicequeuefamilyproperties2khr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicememoryproperties2khr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicesparseimageformatproperties2khr :pointer)

(cffi:defctype vkpeermemoryfeatureflagskhr vkpeermemoryfeatureflags)

(cffi:defctype vkpeermemoryfeatureflagbitskhr vkpeermemoryfeatureflagbits)

(cffi:defctype vkmemoryallocateflagskhr vkmemoryallocateflags)

(cffi:defctype vkmemoryallocateflagbitskhr vkmemoryallocateflagbits)

(cffi:defctype vkmemoryallocateflagsinfokhr (:struct vkmemoryallocateflagsinfo))

(cffi:defctype vkdevicegrouprenderpassbegininfokhr
               (:struct vkdevicegrouprenderpassbegininfo))

(cffi:defctype vkdevicegroupcommandbufferbegininfokhr
               (:struct vkdevicegroupcommandbufferbegininfo))

(cffi:defctype vkdevicegroupsubmitinfokhr (:struct vkdevicegroupsubmitinfo))

(cffi:defctype vkdevicegroupbindsparseinfokhr
               (:struct vkdevicegroupbindsparseinfo))

(cffi:defctype vkbindbuffermemorydevicegroupinfokhr
               (:struct vkbindbuffermemorydevicegroupinfo))

(cffi:defctype vkbindimagememorydevicegroupinfokhr
               (:struct vkbindimagememorydevicegroupinfo))

(cffi:defctype pfn_vkgetdevicegrouppeermemoryfeatureskhr :pointer)

(cffi:defctype pfn_vkcmdsetdevicemaskkhr :pointer)

(cffi:defctype pfn_vkcmddispatchbasekhr :pointer)

(cffi:defctype vkcommandpooltrimflagskhr vkcommandpooltrimflags)

(cffi:defctype pfn_vktrimcommandpoolkhr :pointer)

(cffi:defctype vkphysicaldevicegrouppropertieskhr
               (:struct vkphysicaldevicegroupproperties))

(cffi:defctype vkdevicegroupdevicecreateinfokhr
               (:struct vkdevicegroupdevicecreateinfo))

(cffi:defctype pfn_vkenumeratephysicaldevicegroupskhr :pointer)

(cffi:defctype vkexternalmemoryhandletypeflagskhr
               vkexternalmemoryhandletypeflags)

(cffi:defctype vkexternalmemoryhandletypeflagbitskhr
               vkexternalmemoryhandletypeflagbits)

(cffi:defctype vkexternalmemoryfeatureflagskhr vkexternalmemoryfeatureflags)

(cffi:defctype vkexternalmemoryfeatureflagbitskhr
               vkexternalmemoryfeatureflagbits)

(cffi:defctype vkexternalmemorypropertieskhr
               (:struct vkexternalmemoryproperties))

(cffi:defctype vkphysicaldeviceexternalimageformatinfokhr
               (:struct vkphysicaldeviceexternalimageformatinfo))

(cffi:defctype vkexternalimageformatpropertieskhr
               (:struct vkexternalimageformatproperties))

(cffi:defctype vkphysicaldeviceexternalbufferinfokhr
               (:struct vkphysicaldeviceexternalbufferinfo))

(cffi:defctype vkexternalbufferpropertieskhr
               (:struct vkexternalbufferproperties))

(cffi:defctype vkphysicaldeviceidpropertieskhr
               (:struct vkphysicaldeviceidproperties))

(cffi:defctype pfn_vkgetphysicaldeviceexternalbufferpropertieskhr :pointer)

(cffi:defctype vkexternalmemoryimagecreateinfokhr
               (:struct vkexternalmemoryimagecreateinfo))

(cffi:defctype vkexternalmemorybuffercreateinfokhr
               (:struct vkexternalmemorybuffercreateinfo))

(cffi:defctype vkexportmemoryallocateinfokhr
               (:struct vkexportmemoryallocateinfo))

(cffi:defcstruct vkimportmemoryfdinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (handletype vkexternalmemoryhandletypeflagbits)
  (fd :int))

(cffi:defcstruct vkmemoryfdpropertieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (memorytypebits :uint32))

(cffi:defcstruct vkmemorygetfdinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (memory vkdevicememory)
  (handletype vkexternalmemoryhandletypeflagbits))

(cffi:defctype pfn_vkgetmemoryfdkhr :pointer)

(cffi:defctype pfn_vkgetmemoryfdpropertieskhr :pointer)

(cffi:defctype vkexternalsemaphorehandletypeflagskhr
               vkexternalsemaphorehandletypeflags)

(cffi:defctype vkexternalsemaphorehandletypeflagbitskhr
               vkexternalsemaphorehandletypeflagbits)

(cffi:defctype vkexternalsemaphorefeatureflagskhr
               vkexternalsemaphorefeatureflags)

(cffi:defctype vkexternalsemaphorefeatureflagbitskhr
               vkexternalsemaphorefeatureflagbits)

(cffi:defctype vkphysicaldeviceexternalsemaphoreinfokhr
               (:struct vkphysicaldeviceexternalsemaphoreinfo))

(cffi:defctype vkexternalsemaphorepropertieskhr
               (:struct vkexternalsemaphoreproperties))

(cffi:defctype pfn_vkgetphysicaldeviceexternalsemaphorepropertieskhr :pointer)

(cffi:defctype vksemaphoreimportflagskhr vksemaphoreimportflags)

(cffi:defctype vksemaphoreimportflagbitskhr vksemaphoreimportflagbits)

(cffi:defctype vkexportsemaphorecreateinfokhr
               (:struct vkexportsemaphorecreateinfo))

(cffi:defcstruct vkimportsemaphorefdinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (semaphore vksemaphore)
  (flags vksemaphoreimportflags)
  (handletype vkexternalsemaphorehandletypeflagbits)
  (fd :int))

(cffi:defcstruct vksemaphoregetfdinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (semaphore vksemaphore)
  (handletype vkexternalsemaphorehandletypeflagbits))

(cffi:defctype pfn_vkimportsemaphorefdkhr :pointer)

(cffi:defctype pfn_vkgetsemaphorefdkhr :pointer)

(cffi:defcstruct vkphysicaldevicepushdescriptorpropertieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (maxpushdescriptors :uint32))

(cffi:defctype pfn_vkcmdpushdescriptorsetkhr :pointer)

(cffi:defctype pfn_vkcmdpushdescriptorsetwithtemplatekhr :pointer)

(cffi:defctype vkphysicaldeviceshaderfloat16int8featureskhr
               (:struct vkphysicaldeviceshaderfloat16int8features))

(cffi:defctype vkphysicaldevicefloat16int8featureskhr
               (:struct vkphysicaldeviceshaderfloat16int8features))

(cffi:defctype vkphysicaldevice16bitstoragefeatureskhr
               (:struct vkphysicaldevice16bitstoragefeatures))

(cffi:defcstruct vkrectlayerkhr
  (offset (:struct vkoffset2d))
  (extent (:struct vkextent2d))
  (layer :uint32))

(cffi:defcstruct vkpresentregionkhr
  (rectanglecount :uint32)
  (prectangles :pointer))

(cffi:defcstruct vkpresentregionskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (swapchaincount :uint32)
  (pregions :pointer))

(cffi:defctype vkdescriptorupdatetemplatekhr :pointer)

(cffi:defctype vkdescriptorupdatetemplatetypekhr vkdescriptorupdatetemplatetype)

(cffi:defctype vkdescriptorupdatetemplatecreateflagskhr
               vkdescriptorupdatetemplatecreateflags)

(cffi:defctype vkdescriptorupdatetemplateentrykhr
               (:struct vkdescriptorupdatetemplateentry))

(cffi:defctype vkdescriptorupdatetemplatecreateinfokhr
               (:struct vkdescriptorupdatetemplatecreateinfo))

(cffi:defctype pfn_vkcreatedescriptorupdatetemplatekhr :pointer)

(cffi:defctype pfn_vkdestroydescriptorupdatetemplatekhr :pointer)

(cffi:defctype pfn_vkupdatedescriptorsetwithtemplatekhr :pointer)

(cffi:defctype vkphysicaldeviceimagelessframebufferfeatureskhr
               (:struct vkphysicaldeviceimagelessframebufferfeatures))

(cffi:defctype vkframebufferattachmentscreateinfokhr
               (:struct vkframebufferattachmentscreateinfo))

(cffi:defctype vkframebufferattachmentimageinfokhr
               (:struct vkframebufferattachmentimageinfo))

(cffi:defctype vkrenderpassattachmentbegininfokhr
               (:struct vkrenderpassattachmentbegininfo))

(cffi:defctype vkrenderpasscreateinfo2khr (:struct vkrenderpasscreateinfo2))

(cffi:defctype vkattachmentdescription2khr (:struct vkattachmentdescription2))

(cffi:defctype vkattachmentreference2khr (:struct vkattachmentreference2))

(cffi:defctype vksubpassdescription2khr (:struct vksubpassdescription2))

(cffi:defctype vksubpassdependency2khr (:struct vksubpassdependency2))

(cffi:defctype vksubpassbegininfokhr (:struct vksubpassbegininfo))

(cffi:defctype vksubpassendinfokhr (:struct vksubpassendinfo))

(cffi:defctype pfn_vkcreaterenderpass2khr :pointer)

(cffi:defctype pfn_vkcmdbeginrenderpass2khr :pointer)

(cffi:defctype pfn_vkcmdnextsubpass2khr :pointer)

(cffi:defctype pfn_vkcmdendrenderpass2khr :pointer)

(cffi:defcstruct vksharedpresentsurfacecapabilitieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (sharedpresentsupportedusageflags vkimageusageflags))

(cffi:defctype pfn_vkgetswapchainstatuskhr :pointer)

(cffi:defctype vkexternalfencehandletypeflagskhr vkexternalfencehandletypeflags)

(cffi:defctype vkexternalfencehandletypeflagbitskhr
               vkexternalfencehandletypeflagbits)

(cffi:defctype vkexternalfencefeatureflagskhr vkexternalfencefeatureflags)

(cffi:defctype vkexternalfencefeatureflagbitskhr vkexternalfencefeatureflagbits)

(cffi:defctype vkphysicaldeviceexternalfenceinfokhr
               (:struct vkphysicaldeviceexternalfenceinfo))

(cffi:defctype vkexternalfencepropertieskhr (:struct vkexternalfenceproperties))

(cffi:defctype pfn_vkgetphysicaldeviceexternalfencepropertieskhr :pointer)

(cffi:defctype vkfenceimportflagskhr vkfenceimportflags)

(cffi:defctype vkfenceimportflagbitskhr vkfenceimportflagbits)

(cffi:defctype vkexportfencecreateinfokhr (:struct vkexportfencecreateinfo))

(cffi:defcstruct vkimportfencefdinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (fence vkfence)
  (flags vkfenceimportflags)
  (handletype vkexternalfencehandletypeflagbits)
  (fd :int))

(cffi:defcstruct vkfencegetfdinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (fence vkfence)
  (handletype vkexternalfencehandletypeflagbits))

(cffi:defctype pfn_vkimportfencefdkhr :pointer)

(cffi:defctype pfn_vkgetfencefdkhr :pointer)

(cffi:defctype vkperformancecounterdescriptionflagskhr vkflags)

(cffi:defctype vkacquireprofilinglockflagskhr vkflags)

(cffi:defcstruct vkphysicaldeviceperformancequeryfeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (performancecounterquerypools vkbool32)
  (performancecountermultiplequerypools vkbool32))

(cffi:defcstruct vkphysicaldeviceperformancequerypropertieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (allowcommandbufferquerycopies vkbool32))

(cffi:defcstruct vkperformancecounterkhr
  (stype vkstructuretype)
  (pnext :pointer)
  (unit vkperformancecounterunitkhr)
  (scope vkperformancecounterscopekhr)
  (storage vkperformancecounterstoragekhr)
  (uuid :uint8 :count (apply #'* (list vk_uuid_size))))

(cffi:defcstruct vkperformancecounterdescriptionkhr
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkperformancecounterdescriptionflagskhr)
  (name :char :count (apply #'* (list vk_max_description_size)))
  (category :char :count (apply #'* (list vk_max_description_size)))
  (description :char :count (apply #'* (list vk_max_description_size))))

(cffi:defcstruct vkquerypoolperformancecreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (queuefamilyindex :uint32)
  (counterindexcount :uint32)
  (pcounterindices :pointer))

(cffi:defcunion vkperformancecounterresultkhr
  (int32 :int32)
  (int64 :int64)
  (uint32 :uint32)
  (uint64 :uint64)
  (float32 :float)
  (float64 :double))

(cffi:defcstruct vkacquireprofilinglockinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkacquireprofilinglockflagskhr)
  (timeout :uint64))

(cffi:defcstruct vkperformancequerysubmitinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (counterpassindex :uint32))

(cffi:defctype
 pfn_vkenumeratephysicaldevicequeuefamilyperformancequerycounterskhr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicequeuefamilyperformancequerypasseskhr
               :pointer)

(cffi:defctype pfn_vkacquireprofilinglockkhr :pointer)

(cffi:defctype pfn_vkreleaseprofilinglockkhr :pointer)

(cffi:defctype vkpointclippingbehaviorkhr vkpointclippingbehavior)

(cffi:defctype vktessellationdomainoriginkhr vktessellationdomainorigin)

(cffi:defctype vkphysicaldevicepointclippingpropertieskhr
               (:struct vkphysicaldevicepointclippingproperties))

(cffi:defctype vkrenderpassinputattachmentaspectcreateinfokhr
               (:struct vkrenderpassinputattachmentaspectcreateinfo))

(cffi:defctype vkinputattachmentaspectreferencekhr
               (:struct vkinputattachmentaspectreference))

(cffi:defctype vkimageviewusagecreateinfokhr
               (:struct vkimageviewusagecreateinfo))

(cffi:defctype vkpipelinetessellationdomainoriginstatecreateinfokhr
               (:struct vkpipelinetessellationdomainoriginstatecreateinfo))

(cffi:defcstruct vkphysicaldevicesurfaceinfo2khr
  (stype vkstructuretype)
  (pnext :pointer)
  (surface vksurfacekhr))

(cffi:defcstruct vksurfacecapabilities2khr
  (stype vkstructuretype)
  (pnext :pointer)
  (surfacecapabilities (:struct vksurfacecapabilitieskhr)))

(cffi:defcstruct vksurfaceformat2khr
  (stype vkstructuretype)
  (pnext :pointer)
  (surfaceformat (:struct vksurfaceformatkhr)))

(cffi:defctype pfn_vkgetphysicaldevicesurfacecapabilities2khr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicesurfaceformats2khr :pointer)

(cffi:defctype vkphysicaldevicevariablepointerfeatureskhr
               (:struct vkphysicaldevicevariablepointersfeatures))

(cffi:defctype vkphysicaldevicevariablepointersfeatureskhr
               (:struct vkphysicaldevicevariablepointersfeatures))

(cffi:defcstruct vkdisplayproperties2khr
  (stype vkstructuretype)
  (pnext :pointer)
  (displayproperties (:struct vkdisplaypropertieskhr)))

(cffi:defcstruct vkdisplayplaneproperties2khr
  (stype vkstructuretype)
  (pnext :pointer)
  (displayplaneproperties (:struct vkdisplayplanepropertieskhr)))

(cffi:defcstruct vkdisplaymodeproperties2khr
  (stype vkstructuretype)
  (pnext :pointer)
  (displaymodeproperties (:struct vkdisplaymodepropertieskhr)))

(cffi:defcstruct vkdisplayplaneinfo2khr
  (stype vkstructuretype)
  (pnext :pointer)
  (mode vkdisplaymodekhr)
  (planeindex :uint32))

(cffi:defcstruct vkdisplayplanecapabilities2khr
  (stype vkstructuretype)
  (pnext :pointer)
  (capabilities (:struct vkdisplayplanecapabilitieskhr)))

(cffi:defctype pfn_vkgetphysicaldevicedisplayproperties2khr :pointer)

(cffi:defctype pfn_vkgetphysicaldevicedisplayplaneproperties2khr :pointer)

(cffi:defctype pfn_vkgetdisplaymodeproperties2khr :pointer)

(cffi:defctype pfn_vkgetdisplayplanecapabilities2khr :pointer)

(cffi:defctype vkmemorydedicatedrequirementskhr
               (:struct vkmemorydedicatedrequirements))

(cffi:defctype vkmemorydedicatedallocateinfokhr
               (:struct vkmemorydedicatedallocateinfo))

(cffi:defctype vkbuffermemoryrequirementsinfo2khr
               (:struct vkbuffermemoryrequirementsinfo2))

(cffi:defctype vkimagememoryrequirementsinfo2khr
               (:struct vkimagememoryrequirementsinfo2))

(cffi:defctype vkimagesparsememoryrequirementsinfo2khr
               (:struct vkimagesparsememoryrequirementsinfo2))

(cffi:defctype vkmemoryrequirements2khr (:struct vkmemoryrequirements2))

(cffi:defctype vksparseimagememoryrequirements2khr
               (:struct vksparseimagememoryrequirements2))

(cffi:defctype pfn_vkgetimagememoryrequirements2khr :pointer)

(cffi:defctype pfn_vkgetbuffermemoryrequirements2khr :pointer)

(cffi:defctype pfn_vkgetimagesparsememoryrequirements2khr :pointer)

(cffi:defctype vkimageformatlistcreateinfokhr
               (:struct vkimageformatlistcreateinfo))

(cffi:defctype vksamplerycbcrconversionkhr :pointer)

(cffi:defctype vksamplerycbcrmodelconversionkhr vksamplerycbcrmodelconversion)

(cffi:defctype vksamplerycbcrrangekhr vksamplerycbcrrange)

(cffi:defctype vkchromalocationkhr vkchromalocation)

(cffi:defctype vksamplerycbcrconversioncreateinfokhr
               (:struct vksamplerycbcrconversioncreateinfo))

(cffi:defctype vksamplerycbcrconversioninfokhr
               (:struct vksamplerycbcrconversioninfo))

(cffi:defctype vkbindimageplanememoryinfokhr
               (:struct vkbindimageplanememoryinfo))

(cffi:defctype vkimageplanememoryrequirementsinfokhr
               (:struct vkimageplanememoryrequirementsinfo))

(cffi:defctype vkphysicaldevicesamplerycbcrconversionfeatureskhr
               (:struct vkphysicaldevicesamplerycbcrconversionfeatures))

(cffi:defctype vksamplerycbcrconversionimageformatpropertieskhr
               (:struct vksamplerycbcrconversionimageformatproperties))

(cffi:defctype pfn_vkcreatesamplerycbcrconversionkhr :pointer)

(cffi:defctype pfn_vkdestroysamplerycbcrconversionkhr :pointer)

(cffi:defctype vkbindbuffermemoryinfokhr (:struct vkbindbuffermemoryinfo))

(cffi:defctype vkbindimagememoryinfokhr (:struct vkbindimagememoryinfo))

(cffi:defctype pfn_vkbindbuffermemory2khr :pointer)

(cffi:defctype pfn_vkbindimagememory2khr :pointer)

(cffi:defctype vkphysicaldevicemaintenance3propertieskhr
               (:struct vkphysicaldevicemaintenance3properties))

(cffi:defctype vkdescriptorsetlayoutsupportkhr
               (:struct vkdescriptorsetlayoutsupport))

(cffi:defctype pfn_vkgetdescriptorsetlayoutsupportkhr :pointer)

(cffi:defctype pfn_vkcmddrawindirectcountkhr :pointer)

(cffi:defctype pfn_vkcmddrawindexedindirectcountkhr :pointer)

(cffi:defctype vkphysicaldeviceshadersubgroupextendedtypesfeatureskhr
               (:struct vkphysicaldeviceshadersubgroupextendedtypesfeatures))

(cffi:defctype vkphysicaldevice8bitstoragefeatureskhr
               (:struct vkphysicaldevice8bitstoragefeatures))

(cffi:defctype vkphysicaldeviceshaderatomicint64featureskhr
               (:struct vkphysicaldeviceshaderatomicint64features))

(cffi:defcstruct vkphysicaldeviceshaderclockfeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (shadersubgroupclock vkbool32)
  (shaderdeviceclock vkbool32))

(cffi:defcstruct vkdevicequeueglobalprioritycreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (globalpriority vkqueueglobalprioritykhr))

(cffi:defcstruct vkphysicaldeviceglobalpriorityqueryfeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (globalpriorityquery vkbool32))

(cffi:defcstruct vkqueuefamilyglobalprioritypropertieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (prioritycount :uint32)
  (priorities vkqueueglobalprioritykhr :count
   (apply #'* (list vk_max_global_priority_size_khr))))

(cffi:defctype vkdriveridkhr vkdriverid)

(cffi:defctype vkconformanceversionkhr (:struct vkconformanceversion))

(cffi:defctype vkphysicaldevicedriverpropertieskhr
               (:struct vkphysicaldevicedriverproperties))

(cffi:defctype vkshaderfloatcontrolsindependencekhr
               vkshaderfloatcontrolsindependence)

(cffi:defctype vkphysicaldevicefloatcontrolspropertieskhr
               (:struct vkphysicaldevicefloatcontrolsproperties))

(cffi:defctype vkresolvemodeflagbitskhr vkresolvemodeflagbits)

(cffi:defctype vkresolvemodeflagskhr vkresolvemodeflags)

(cffi:defctype vksubpassdescriptiondepthstencilresolvekhr
               (:struct vksubpassdescriptiondepthstencilresolve))

(cffi:defctype vkphysicaldevicedepthstencilresolvepropertieskhr
               (:struct vkphysicaldevicedepthstencilresolveproperties))

(cffi:defctype vksemaphoretypekhr vksemaphoretype)

(cffi:defctype vksemaphorewaitflagbitskhr vksemaphorewaitflagbits)

(cffi:defctype vksemaphorewaitflagskhr vksemaphorewaitflags)

(cffi:defctype vkphysicaldevicetimelinesemaphorefeatureskhr
               (:struct vkphysicaldevicetimelinesemaphorefeatures))

(cffi:defctype vkphysicaldevicetimelinesemaphorepropertieskhr
               (:struct vkphysicaldevicetimelinesemaphoreproperties))

(cffi:defctype vksemaphoretypecreateinfokhr (:struct vksemaphoretypecreateinfo))

(cffi:defctype vktimelinesemaphoresubmitinfokhr
               (:struct vktimelinesemaphoresubmitinfo))

(cffi:defctype vksemaphorewaitinfokhr (:struct vksemaphorewaitinfo))

(cffi:defctype vksemaphoresignalinfokhr (:struct vksemaphoresignalinfo))

(cffi:defctype pfn_vkgetsemaphorecountervaluekhr :pointer)

(cffi:defctype pfn_vkwaitsemaphoreskhr :pointer)

(cffi:defctype pfn_vksignalsemaphorekhr :pointer)

(cffi:defctype vkphysicaldevicevulkanmemorymodelfeatureskhr
               (:struct vkphysicaldevicevulkanmemorymodelfeatures))

(cffi:defctype vkphysicaldeviceshaderterminateinvocationfeatureskhr
               (:struct vkphysicaldeviceshaderterminateinvocationfeatures))

(cffi:defcstruct vkfragmentshadingrateattachmentinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (pfragmentshadingrateattachment :pointer)
  (shadingrateattachmenttexelsize (:struct vkextent2d)))

(cffi:defcstruct vkpipelinefragmentshadingratestatecreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (fragmentsize (:struct vkextent2d))
  (combinerops vkfragmentshadingratecombineropkhr :count (apply #'* (list 2))))

(cffi:defcstruct vkphysicaldevicefragmentshadingratefeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (pipelinefragmentshadingrate vkbool32)
  (primitivefragmentshadingrate vkbool32)
  (attachmentfragmentshadingrate vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentshadingratepropertieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (minfragmentshadingrateattachmenttexelsize (:struct vkextent2d))
  (maxfragmentshadingrateattachmenttexelsize (:struct vkextent2d))
  (maxfragmentshadingrateattachmenttexelsizeaspectratio :uint32)
  (primitivefragmentshadingratewithmultipleviewports vkbool32)
  (layeredshadingrateattachments vkbool32)
  (fragmentshadingratenontrivialcombinerops vkbool32)
  (maxfragmentsize (:struct vkextent2d))
  (maxfragmentsizeaspectratio :uint32)
  (maxfragmentshadingratecoveragesamples :uint32)
  (maxfragmentshadingraterasterizationsamples vksamplecountflagbits)
  (fragmentshadingratewithshaderdepthstencilwrites vkbool32)
  (fragmentshadingratewithsamplemask vkbool32)
  (fragmentshadingratewithshadersamplemask vkbool32)
  (fragmentshadingratewithconservativerasterization vkbool32)
  (fragmentshadingratewithfragmentshaderinterlock vkbool32)
  (fragmentshadingratewithcustomsamplelocations vkbool32)
  (fragmentshadingratestrictmultiplycombiner vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentshadingratekhr
  (stype vkstructuretype)
  (pnext :pointer)
  (samplecounts vksamplecountflags)
  (fragmentsize (:struct vkextent2d)))

(cffi:defctype pfn_vkgetphysicaldevicefragmentshadingrateskhr :pointer)

(cffi:defctype pfn_vkcmdsetfragmentshadingratekhr :pointer)

(cffi:defcstruct vksurfaceprotectedcapabilitieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (supportsprotected vkbool32))

(cffi:defctype vkphysicaldeviceseparatedepthstencillayoutsfeatureskhr
               (:struct vkphysicaldeviceseparatedepthstencillayoutsfeatures))

(cffi:defctype vkattachmentreferencestencillayoutkhr
               (:struct vkattachmentreferencestencillayout))

(cffi:defctype vkattachmentdescriptionstencillayoutkhr
               (:struct vkattachmentdescriptionstencillayout))

(cffi:defcstruct vkphysicaldevicepresentwaitfeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (presentwait vkbool32))

(cffi:defctype pfn_vkwaitforpresentkhr :pointer)

(cffi:defctype vkphysicaldeviceuniformbufferstandardlayoutfeatureskhr
               (:struct vkphysicaldeviceuniformbufferstandardlayoutfeatures))

(cffi:defctype vkphysicaldevicebufferdeviceaddressfeatureskhr
               (:struct vkphysicaldevicebufferdeviceaddressfeatures))

(cffi:defctype vkbufferdeviceaddressinfokhr (:struct vkbufferdeviceaddressinfo))

(cffi:defctype vkbufferopaquecaptureaddresscreateinfokhr
               (:struct vkbufferopaquecaptureaddresscreateinfo))

(cffi:defctype vkmemoryopaquecaptureaddressallocateinfokhr
               (:struct vkmemoryopaquecaptureaddressallocateinfo))

(cffi:defctype vkdevicememoryopaquecaptureaddressinfokhr
               (:struct vkdevicememoryopaquecaptureaddressinfo))

(cffi:defctype pfn_vkgetbufferdeviceaddresskhr :pointer)

(cffi:defctype pfn_vkgetbufferopaquecaptureaddresskhr :pointer)

(cffi:defctype pfn_vkgetdevicememoryopaquecaptureaddresskhr :pointer)

(cffi:defctype vkdeferredoperationkhr non-dispatchable-handle)

(cffi:defctype pfn_vkcreatedeferredoperationkhr :pointer)

(cffi:defctype pfn_vkdestroydeferredoperationkhr :pointer)

(cffi:defctype pfn_vkgetdeferredoperationmaxconcurrencykhr :pointer)

(cffi:defctype pfn_vkgetdeferredoperationresultkhr :pointer)

(cffi:defctype pfn_vkdeferredoperationjoinkhr :pointer)

(cffi:defcstruct vkphysicaldevicepipelineexecutablepropertiesfeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (pipelineexecutableinfo vkbool32))

(cffi:defcstruct vkpipelineinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (pipeline vkpipeline))

(cffi:defcstruct vkpipelineexecutablepropertieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (stages vkshaderstageflags)
  (name :char :count (apply #'* (list vk_max_description_size)))
  (description :char :count (apply #'* (list vk_max_description_size)))
  (subgroupsize :uint32))

(cffi:defcstruct vkpipelineexecutableinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (pipeline vkpipeline)
  (executableindex :uint32))

(cffi:defcunion vkpipelineexecutablestatisticvaluekhr
  (b32 vkbool32)
  (i64 :int64)
  (u64 :uint64)
  (f64 :double))

(cffi:defcstruct vkpipelineexecutablestatistickhr
  (stype vkstructuretype)
  (pnext :pointer)
  (name :char :count (apply #'* (list vk_max_description_size)))
  (description :char :count (apply #'* (list vk_max_description_size)))
  (format vkpipelineexecutablestatisticformatkhr)
  (value (:union vkpipelineexecutablestatisticvaluekhr)))

(cffi:defcstruct vkpipelineexecutableinternalrepresentationkhr
  (stype vkstructuretype)
  (pnext :pointer)
  (name :char :count (apply #'* (list vk_max_description_size)))
  (description :char :count (apply #'* (list vk_max_description_size)))
  (istext vkbool32)
  (datasize :size)
  (pdata :pointer))

(cffi:defctype pfn_vkgetpipelineexecutablepropertieskhr :pointer)

(cffi:defctype pfn_vkgetpipelineexecutablestatisticskhr :pointer)

(cffi:defctype pfn_vkgetpipelineexecutableinternalrepresentationskhr :pointer)

(cffi:defctype vkphysicaldeviceshaderintegerdotproductfeatureskhr
               (:struct vkphysicaldeviceshaderintegerdotproductfeatures))

(cffi:defctype vkphysicaldeviceshaderintegerdotproductpropertieskhr
               (:struct vkphysicaldeviceshaderintegerdotproductproperties))

(cffi:defcstruct vkpipelinelibrarycreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (librarycount :uint32)
  (plibraries :pointer))

(cffi:defcstruct vkpresentidkhr
  (stype vkstructuretype)
  (pnext :pointer)
  (swapchaincount :uint32)
  (ppresentids :pointer))

(cffi:defcstruct vkphysicaldevicepresentidfeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (presentid vkbool32))

(cffi:defctype vkpipelinestageflags2khr vkpipelinestageflags2)

(cffi:defctype vkpipelinestageflagbits2khr vkpipelinestageflagbits2)

(cffi:defctype vkaccessflags2khr vkaccessflags2)

(cffi:defctype vkaccessflagbits2khr vkaccessflagbits2)

(cffi:defctype vksubmitflagbitskhr vksubmitflagbits)

(cffi:defctype vksubmitflagskhr vksubmitflags)

(cffi:defctype vkmemorybarrier2khr (:struct vkmemorybarrier2))

(cffi:defctype vkbuffermemorybarrier2khr (:struct vkbuffermemorybarrier2))

(cffi:defctype vkimagememorybarrier2khr (:struct vkimagememorybarrier2))

(cffi:defctype vkdependencyinfokhr (:struct vkdependencyinfo))

(cffi:defctype vksubmitinfo2khr (:struct vksubmitinfo2))

(cffi:defctype vksemaphoresubmitinfokhr (:struct vksemaphoresubmitinfo))

(cffi:defctype vkcommandbuffersubmitinfokhr (:struct vkcommandbuffersubmitinfo))

(cffi:defctype vkphysicaldevicesynchronization2featureskhr
               (:struct vkphysicaldevicesynchronization2features))

(cffi:defcstruct vkqueuefamilycheckpointproperties2nv
  (stype vkstructuretype)
  (pnext :pointer)
  (checkpointexecutionstagemask vkpipelinestageflags2))

(cffi:defcstruct vkcheckpointdata2nv
  (stype vkstructuretype)
  (pnext :pointer)
  (stage vkpipelinestageflags2)
  (pcheckpointmarker :pointer))

(cffi:defctype pfn_vkcmdsetevent2khr :pointer)

(cffi:defctype pfn_vkcmdresetevent2khr :pointer)

(cffi:defctype pfn_vkcmdwaitevents2khr :pointer)

(cffi:defctype pfn_vkcmdpipelinebarrier2khr :pointer)

(cffi:defctype pfn_vkcmdwritetimestamp2khr :pointer)

(cffi:defctype pfn_vkqueuesubmit2khr :pointer)

(cffi:defctype pfn_vkcmdwritebuffermarker2amd :pointer)

(cffi:defctype pfn_vkgetqueuecheckpointdata2nv :pointer)

(cffi:defcstruct vkphysicaldevicefragmentshaderbarycentricfeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (fragmentshaderbarycentric vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentshaderbarycentricpropertieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (tristripvertexorderindependentofprovokingvertex vkbool32))

(cffi:defcstruct vkphysicaldeviceshadersubgroupuniformcontrolflowfeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (shadersubgroupuniformcontrolflow vkbool32))

(cffi:defctype vkphysicaldevicezeroinitializeworkgroupmemoryfeatureskhr
               (:struct vkphysicaldevicezeroinitializeworkgroupmemoryfeatures))

(cffi:defcstruct vkphysicaldeviceworkgroupmemoryexplicitlayoutfeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (workgroupmemoryexplicitlayout vkbool32)
  (workgroupmemoryexplicitlayoutscalarblocklayout vkbool32)
  (workgroupmemoryexplicitlayout8bitaccess vkbool32)
  (workgroupmemoryexplicitlayout16bitaccess vkbool32))

(cffi:defctype vkcopybufferinfo2khr (:struct vkcopybufferinfo2))

(cffi:defctype vkcopyimageinfo2khr (:struct vkcopyimageinfo2))

(cffi:defctype vkcopybuffertoimageinfo2khr (:struct vkcopybuffertoimageinfo2))

(cffi:defctype vkcopyimagetobufferinfo2khr (:struct vkcopyimagetobufferinfo2))

(cffi:defctype vkblitimageinfo2khr (:struct vkblitimageinfo2))

(cffi:defctype vkresolveimageinfo2khr (:struct vkresolveimageinfo2))

(cffi:defctype vkbuffercopy2khr (:struct vkbuffercopy2))

(cffi:defctype vkimagecopy2khr (:struct vkimagecopy2))

(cffi:defctype vkimageblit2khr (:struct vkimageblit2))

(cffi:defctype vkbufferimagecopy2khr (:struct vkbufferimagecopy2))

(cffi:defctype vkimageresolve2khr (:struct vkimageresolve2))

(cffi:defctype pfn_vkcmdcopybuffer2khr :pointer)

(cffi:defctype pfn_vkcmdcopyimage2khr :pointer)

(cffi:defctype pfn_vkcmdcopybuffertoimage2khr :pointer)

(cffi:defctype pfn_vkcmdcopyimagetobuffer2khr :pointer)

(cffi:defctype pfn_vkcmdblitimage2khr :pointer)

(cffi:defctype pfn_vkcmdresolveimage2khr :pointer)

(cffi:defctype vkformatfeatureflags2khr vkformatfeatureflags2)

(cffi:defctype vkformatfeatureflagbits2khr vkformatfeatureflagbits2)

(cffi:defctype vkformatproperties3khr (:struct vkformatproperties3))

(cffi:defcstruct vkphysicaldeviceraytracingmaintenance1featureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (raytracingmaintenance1 vkbool32)
  (raytracingpipelinetraceraysindirect2 vkbool32))

(cffi:defcstruct vktraceraysindirectcommand2khr
  (raygenshaderrecordaddress vkdeviceaddress)
  (raygenshaderrecordsize vkdevicesize)
  (missshaderbindingtableaddress vkdeviceaddress)
  (missshaderbindingtablesize vkdevicesize)
  (missshaderbindingtablestride vkdevicesize)
  (hitshaderbindingtableaddress vkdeviceaddress)
  (hitshaderbindingtablesize vkdevicesize)
  (hitshaderbindingtablestride vkdevicesize)
  (callableshaderbindingtableaddress vkdeviceaddress)
  (callableshaderbindingtablesize vkdevicesize)
  (callableshaderbindingtablestride vkdevicesize)
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(cffi:defctype pfn_vkcmdtraceraysindirect2khr :pointer)

(cffi:defctype vkphysicaldevicemaintenance4featureskhr
               (:struct vkphysicaldevicemaintenance4features))

(cffi:defctype vkphysicaldevicemaintenance4propertieskhr
               (:struct vkphysicaldevicemaintenance4properties))

(cffi:defctype vkdevicebuffermemoryrequirementskhr
               (:struct vkdevicebuffermemoryrequirements))

(cffi:defctype vkdeviceimagememoryrequirementskhr
               (:struct vkdeviceimagememoryrequirements))

(cffi:defctype pfn_vkgetdevicebuffermemoryrequirementskhr :pointer)

(cffi:defctype pfn_vkgetdeviceimagememoryrequirementskhr :pointer)

(cffi:defctype pfn_vkgetdeviceimagesparsememoryrequirementskhr :pointer)

(cffi:defctype vkdebugreportcallbackext non-dispatchable-handle)

(cffi:defctype vkdebugreportflagsext vkflags)

(cffi:defctype pfn_vkdebugreportcallbackext :pointer)

(cffi:defcstruct vkdebugreportcallbackcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdebugreportflagsext)
  (pfncallback pfn_vkdebugreportcallbackext)
  (puserdata :pointer))

(cffi:defctype pfn_vkcreatedebugreportcallbackext :pointer)

(cffi:defctype pfn_vkdestroydebugreportcallbackext :pointer)

(cffi:defctype pfn_vkdebugreportmessageext :pointer)

(cffi:defcstruct vkpipelinerasterizationstaterasterizationorderamd
  (stype vkstructuretype)
  (pnext :pointer)
  (rasterizationorder vkrasterizationorderamd))

(cffi:defcstruct vkdebugmarkerobjectnameinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (objecttype vkdebugreportobjecttypeext)
  (object :uint64)
  (pobjectname :pointer))

(cffi:defcstruct vkdebugmarkerobjecttaginfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (objecttype vkdebugreportobjecttypeext)
  (object :uint64)
  (tagname :uint64)
  (tagsize :size)
  (ptag :pointer))

(cffi:defcstruct vkdebugmarkermarkerinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (pmarkername :pointer)
  (color :float :count (apply #'* (list 4))))

(cffi:defctype pfn_vkdebugmarkersetobjecttagext :pointer)

(cffi:defctype pfn_vkdebugmarkersetobjectnameext :pointer)

(cffi:defctype pfn_vkcmddebugmarkerbeginext :pointer)

(cffi:defctype pfn_vkcmddebugmarkerendext :pointer)

(cffi:defctype pfn_vkcmddebugmarkerinsertext :pointer)

(cffi:defcstruct vkdedicatedallocationimagecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (dedicatedallocation vkbool32))

(cffi:defcstruct vkdedicatedallocationbuffercreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (dedicatedallocation vkbool32))

(cffi:defcstruct vkdedicatedallocationmemoryallocateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (image vkimage)
  (buffer vkbuffer))

(cffi:defctype vkpipelinerasterizationstatestreamcreateflagsext vkflags)

(cffi:defcstruct vkphysicaldevicetransformfeedbackfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (transformfeedback vkbool32)
  (geometrystreams vkbool32))

(cffi:defcstruct vkphysicaldevicetransformfeedbackpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (maxtransformfeedbackstreams :uint32)
  (maxtransformfeedbackbuffers :uint32)
  (maxtransformfeedbackbuffersize vkdevicesize)
  (maxtransformfeedbackstreamdatasize :uint32)
  (maxtransformfeedbackbufferdatasize :uint32)
  (maxtransformfeedbackbufferdatastride :uint32)
  (transformfeedbackqueries vkbool32)
  (transformfeedbackstreamslinestriangles vkbool32)
  (transformfeedbackrasterizationstreamselect vkbool32)
  (transformfeedbackdraw vkbool32))

(cffi:defcstruct vkpipelinerasterizationstatestreamcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinerasterizationstatestreamcreateflagsext)
  (rasterizationstream :uint32))

(cffi:defctype pfn_vkcmdbindtransformfeedbackbuffersext :pointer)

(cffi:defctype pfn_vkcmdbegintransformfeedbackext :pointer)

(cffi:defctype pfn_vkcmdendtransformfeedbackext :pointer)

(cffi:defctype pfn_vkcmdbeginqueryindexedext :pointer)

(cffi:defctype pfn_vkcmdendqueryindexedext :pointer)

(cffi:defctype pfn_vkcmddrawindirectbytecountext :pointer)

(cffi:defctype vkcumodulenvx non-dispatchable-handle)

(cffi:defctype vkcufunctionnvx non-dispatchable-handle)

(cffi:defcstruct vkcumodulecreateinfonvx
  (stype vkstructuretype)
  (pnext :pointer)
  (datasize :size)
  (pdata :pointer))

(cffi:defcstruct vkcufunctioncreateinfonvx
  (stype vkstructuretype)
  (pnext :pointer)
  (module vkcumodulenvx)
  (pname :pointer))

(cffi:defcstruct vkculaunchinfonvx
  (stype vkstructuretype)
  (pnext :pointer)
  #'vkcufunctionnvx
  (griddimx :uint32)
  (griddimy :uint32)
  (griddimz :uint32)
  (blockdimx :uint32)
  (blockdimy :uint32)
  (blockdimz :uint32)
  (sharedmembytes :uint32)
  (paramcount :size)
  (pparams :pointer)
  (extracount :size)
  (pextras :pointer))

(cffi:defctype pfn_vkcreatecumodulenvx :pointer)

(cffi:defctype pfn_vkcreatecufunctionnvx :pointer)

(cffi:defctype pfn_vkdestroycumodulenvx :pointer)

(cffi:defctype pfn_vkdestroycufunctionnvx :pointer)

(cffi:defctype pfn_vkcmdculaunchkernelnvx :pointer)

(cffi:defcstruct vkimageviewhandleinfonvx
  (stype vkstructuretype)
  (pnext :pointer)
  (imageview vkimageview)
  (descriptortype vkdescriptortype)
  (sampler vksampler))

(cffi:defcstruct vkimageviewaddresspropertiesnvx
  (stype vkstructuretype)
  (pnext :pointer)
  (deviceaddress vkdeviceaddress)
  (size vkdevicesize))

(cffi:defctype pfn_vkgetimageviewhandlenvx :pointer)

(cffi:defctype pfn_vkgetimageviewaddressnvx :pointer)

(cffi:defctype pfn_vkcmddrawindirectcountamd :pointer)

(cffi:defctype pfn_vkcmddrawindexedindirectcountamd :pointer)

(cffi:defcstruct vktexturelodgatherformatpropertiesamd
  (stype vkstructuretype)
  (pnext :pointer)
  (supportstexturegatherlodbiasamd vkbool32))

(cffi:defcstruct vkshaderresourceusageamd
  (numusedvgprs :uint32)
  (numusedsgprs :uint32)
  (ldssizeperlocalworkgroup :uint32)
  (ldsusagesizeinbytes :size)
  (scratchmemusageinbytes :size))

(cffi:defcstruct vkshaderstatisticsinfoamd
  (shaderstagemask vkshaderstageflags)
  (resourceusage (:struct vkshaderresourceusageamd))
  (numphysicalvgprs :uint32)
  (numphysicalsgprs :uint32)
  (numavailablevgprs :uint32)
  (numavailablesgprs :uint32)
  (computeworkgroupsize :uint32 :count (apply #'* (list 3))))

(cffi:defctype pfn_vkgetshaderinfoamd :pointer)

(cffi:defcstruct vkphysicaldevicecornersampledimagefeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (cornersampledimage vkbool32))

(cffi:defctype vkexternalmemoryhandletypeflagsnv vkflags)

(cffi:defctype vkexternalmemoryfeatureflagsnv vkflags)

(cffi:defcstruct vkexternalimageformatpropertiesnv
  (imageformatproperties (:struct vkimageformatproperties))
  (externalmemoryfeatures vkexternalmemoryfeatureflagsnv)
  (exportfromimportedhandletypes vkexternalmemoryhandletypeflagsnv)
  (compatiblehandletypes vkexternalmemoryhandletypeflagsnv))

(cffi:defctype pfn_vkgetphysicaldeviceexternalimageformatpropertiesnv :pointer)

(cffi:defcstruct vkexternalmemoryimagecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (handletypes vkexternalmemoryhandletypeflagsnv))

(cffi:defcstruct vkexportmemoryallocateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (handletypes vkexternalmemoryhandletypeflagsnv))

(cffi:defcstruct vkvalidationflagsext
  (stype vkstructuretype)
  (pnext :pointer)
  (disabledvalidationcheckcount :uint32)
  (pdisabledvalidationchecks :pointer))

(cffi:defctype vkphysicaldevicetexturecompressionastchdrfeaturesext
               (:struct vkphysicaldevicetexturecompressionastchdrfeatures))

(cffi:defcstruct vkimageviewastcdecodemodeext
  (stype vkstructuretype)
  (pnext :pointer)
  (decodemode vkformat))

(cffi:defcstruct vkphysicaldeviceastcdecodefeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (decodemodesharedexponent vkbool32))

(cffi:defctype vkconditionalrenderingflagsext vkflags)

(cffi:defcstruct vkconditionalrenderingbegininfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (flags vkconditionalrenderingflagsext))

(cffi:defcstruct vkphysicaldeviceconditionalrenderingfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (conditionalrendering vkbool32)
  (inheritedconditionalrendering vkbool32))

(cffi:defcstruct vkcommandbufferinheritanceconditionalrenderinginfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (conditionalrenderingenable vkbool32))

(cffi:defctype pfn_vkcmdbeginconditionalrenderingext :pointer)

(cffi:defctype pfn_vkcmdendconditionalrenderingext :pointer)

(cffi:defcstruct vkviewportwscalingnv
  (xcoeff :float)
  (ycoeff :float))

(cffi:defcstruct vkpipelineviewportwscalingstatecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (viewportwscalingenable vkbool32)
  (viewportcount :uint32)
  (pviewportwscalings :pointer))

(cffi:defctype pfn_vkcmdsetviewportwscalingnv :pointer)

(cffi:defctype pfn_vkreleasedisplayext :pointer)

(cffi:defctype vksurfacecounterflagsext vkflags)

(cffi:defcstruct vksurfacecapabilities2ext
  (stype vkstructuretype)
  (pnext :pointer)
  (minimagecount :uint32)
  (maximagecount :uint32)
  (currentextent (:struct vkextent2d))
  (minimageextent (:struct vkextent2d))
  (maximageextent (:struct vkextent2d))
  (maximagearraylayers :uint32)
  (supportedtransforms vksurfacetransformflagskhr)
  (currenttransform vksurfacetransformflagbitskhr)
  (supportedcompositealpha vkcompositealphaflagskhr)
  (supportedusageflags vkimageusageflags)
  (supportedsurfacecounters vksurfacecounterflagsext))

(cffi:defctype pfn_vkgetphysicaldevicesurfacecapabilities2ext :pointer)

(cffi:defcstruct vkdisplaypowerinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (powerstate vkdisplaypowerstateext))

(cffi:defcstruct vkdeviceeventinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (deviceevent vkdeviceeventtypeext))

(cffi:defcstruct vkdisplayeventinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (displayevent vkdisplayeventtypeext))

(cffi:defcstruct vkswapchaincountercreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (surfacecounters vksurfacecounterflagsext))

(cffi:defctype pfn_vkdisplaypowercontrolext :pointer)

(cffi:defctype pfn_vkregisterdeviceeventext :pointer)

(cffi:defctype pfn_vkregisterdisplayeventext :pointer)

(cffi:defctype pfn_vkgetswapchaincounterext :pointer)

(cffi:defcstruct vkrefreshcycledurationgoogle
  (refreshduration :uint64))

(cffi:defcstruct vkpastpresentationtiminggoogle
  (presentid :uint32)
  (desiredpresenttime :uint64)
  (actualpresenttime :uint64)
  (earliestpresenttime :uint64)
  (presentmargin :uint64))

(cffi:defcstruct vkpresenttimegoogle
  (presentid :uint32)
  (desiredpresenttime :uint64))

(cffi:defcstruct vkpresenttimesinfogoogle
  (stype vkstructuretype)
  (pnext :pointer)
  (swapchaincount :uint32)
  (ptimes :pointer))

(cffi:defctype pfn_vkgetrefreshcycledurationgoogle :pointer)

(cffi:defctype pfn_vkgetpastpresentationtiminggoogle :pointer)

(cffi:defcstruct vkphysicaldevicemultiviewperviewattributespropertiesnvx
  (stype vkstructuretype)
  (pnext :pointer)
  (perviewpositionallcomponents vkbool32))

(cffi:defctype vkpipelineviewportswizzlestatecreateflagsnv vkflags)

(cffi:defcstruct vkviewportswizzlenv
  (x vkviewportcoordinateswizzlenv)
  (y vkviewportcoordinateswizzlenv)
  (z vkviewportcoordinateswizzlenv)
  (w vkviewportcoordinateswizzlenv))

(cffi:defcstruct vkpipelineviewportswizzlestatecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelineviewportswizzlestatecreateflagsnv)
  (viewportcount :uint32)
  (pviewportswizzles :pointer))

(cffi:defctype vkpipelinediscardrectanglestatecreateflagsext vkflags)

(cffi:defcstruct vkphysicaldevicediscardrectanglepropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (maxdiscardrectangles :uint32))

(cffi:defcstruct vkpipelinediscardrectanglestatecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinediscardrectanglestatecreateflagsext)
  (discardrectanglemode vkdiscardrectanglemodeext)
  (discardrectanglecount :uint32)
  (pdiscardrectangles :pointer))

(cffi:defctype pfn_vkcmdsetdiscardrectangleext :pointer)

(cffi:defctype vkpipelinerasterizationconservativestatecreateflagsext vkflags)

(cffi:defcstruct vkphysicaldeviceconservativerasterizationpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (primitiveoverestimationsize :float)
  (maxextraprimitiveoverestimationsize :float)
  (extraprimitiveoverestimationsizegranularity :float)
  (primitiveunderestimation vkbool32)
  (conservativepointandlinerasterization vkbool32)
  (degeneratetrianglesrasterized vkbool32)
  (degeneratelinesrasterized vkbool32)
  (fullycoveredfragmentshaderinputvariable vkbool32)
  (conservativerasterizationpostdepthcoverage vkbool32))

(cffi:defcstruct vkpipelinerasterizationconservativestatecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinerasterizationconservativestatecreateflagsext)
  (conservativerasterizationmode vkconservativerasterizationmodeext)
  (extraprimitiveoverestimationsize :float))

(cffi:defctype vkpipelinerasterizationdepthclipstatecreateflagsext vkflags)

(cffi:defcstruct vkphysicaldevicedepthclipenablefeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (depthclipenable vkbool32))

(cffi:defcstruct vkpipelinerasterizationdepthclipstatecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinerasterizationdepthclipstatecreateflagsext)
  (depthclipenable vkbool32))

(cffi:defcstruct vkxycolorext
  (x :float)
  (y :float))

(cffi:defcstruct vkhdrmetadataext
  (stype vkstructuretype)
  (pnext :pointer)
  (displayprimaryred (:struct vkxycolorext))
  (displayprimarygreen (:struct vkxycolorext))
  (displayprimaryblue (:struct vkxycolorext))
  (whitepoint (:struct vkxycolorext))
  (maxluminance :float)
  (minluminance :float)
  (maxcontentlightlevel :float)
  (maxframeaveragelightlevel :float))

(cffi:defctype pfn_vksethdrmetadataext :pointer)

(cffi:defctype vkdebugutilsmessengerext non-dispatchable-handle)

(cffi:defctype vkdebugutilsmessengercallbackdataflagsext vkflags)

(cffi:defctype vkdebugutilsmessagetypeflagsext vkflags)

(cffi:defctype vkdebugutilsmessageseverityflagsext vkflags)

(cffi:defctype vkdebugutilsmessengercreateflagsext vkflags)

(cffi:defcstruct vkdebugutilslabelext
  (stype vkstructuretype)
  (pnext :pointer)
  (plabelname :pointer)
  (color :float :count (apply #'* (list 4))))

(cffi:defcstruct vkdebugutilsobjectnameinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (pobjectname :pointer))

(cffi:defcstruct vkdebugutilsmessengercallbackdataext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdebugutilsmessengercallbackdataflagsext)
  (pmessageidname :pointer)
  (messageidnumber :int32)
  (pmessage :pointer)
  (queuelabelcount :uint32)
  (pqueuelabels :pointer)
  (cmdbuflabelcount :uint32)
  (pcmdbuflabels :pointer)
  (objectcount :uint32)
  (pobjects :pointer))

(cffi:defctype pfn_vkdebugutilsmessengercallbackext :pointer)

(cffi:defcstruct vkdebugutilsmessengercreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdebugutilsmessengercreateflagsext)
  (messageseverity vkdebugutilsmessageseverityflagsext)
  (messagetype vkdebugutilsmessagetypeflagsext)
  (pfnusercallback pfn_vkdebugutilsmessengercallbackext)
  (puserdata :pointer))

(cffi:defcstruct vkdebugutilsobjecttaginfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (tagname :uint64)
  (tagsize :size)
  (ptag :pointer))

(cffi:defctype pfn_vksetdebugutilsobjectnameext :pointer)

(cffi:defctype pfn_vksetdebugutilsobjecttagext :pointer)

(cffi:defctype pfn_vkqueuebegindebugutilslabelext :pointer)

(cffi:defctype pfn_vkqueueenddebugutilslabelext :pointer)

(cffi:defctype pfn_vkqueueinsertdebugutilslabelext :pointer)

(cffi:defctype pfn_vkcmdbegindebugutilslabelext :pointer)

(cffi:defctype pfn_vkcmdenddebugutilslabelext :pointer)

(cffi:defctype pfn_vkcmdinsertdebugutilslabelext :pointer)

(cffi:defctype pfn_vkcreatedebugutilsmessengerext :pointer)

(cffi:defctype pfn_vkdestroydebugutilsmessengerext :pointer)

(cffi:defctype pfn_vksubmitdebugutilsmessageext :pointer)

(cffi:defctype vksamplerreductionmodeext vksamplerreductionmode)

(cffi:defctype vksamplerreductionmodecreateinfoext
               (:struct vksamplerreductionmodecreateinfo))

(cffi:defctype vkphysicaldevicesamplerfilterminmaxpropertiesext
               (:struct vkphysicaldevicesamplerfilterminmaxproperties))

(cffi:defctype vkphysicaldeviceinlineuniformblockfeaturesext
               (:struct vkphysicaldeviceinlineuniformblockfeatures))

(cffi:defctype vkphysicaldeviceinlineuniformblockpropertiesext
               (:struct vkphysicaldeviceinlineuniformblockproperties))

(cffi:defctype vkwritedescriptorsetinlineuniformblockext
               (:struct vkwritedescriptorsetinlineuniformblock))

(cffi:defctype vkdescriptorpoolinlineuniformblockcreateinfoext
               (:struct vkdescriptorpoolinlineuniformblockcreateinfo))

(cffi:defcstruct vksamplelocationext
  (x :float)
  (y :float))

(cffi:defcstruct vksamplelocationsinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (samplelocationsperpixel vksamplecountflagbits)
  (samplelocationgridsize (:struct vkextent2d))
  (samplelocationscount :uint32)
  (psamplelocations :pointer))

(cffi:defcstruct vkattachmentsamplelocationsext
  (attachmentindex :uint32)
  (samplelocationsinfo (:struct vksamplelocationsinfoext)))

(cffi:defcstruct vksubpasssamplelocationsext
  (subpassindex :uint32)
  (samplelocationsinfo (:struct vksamplelocationsinfoext)))

(cffi:defcstruct vkrenderpasssamplelocationsbegininfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (attachmentinitialsamplelocationscount :uint32)
  (pattachmentinitialsamplelocations :pointer)
  (postsubpasssamplelocationscount :uint32)
  (ppostsubpasssamplelocations :pointer))

(cffi:defcstruct vkpipelinesamplelocationsstatecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (samplelocationsenable vkbool32)
  (samplelocationsinfo (:struct vksamplelocationsinfoext)))

(cffi:defcstruct vkphysicaldevicesamplelocationspropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (samplelocationsamplecounts vksamplecountflags)
  (maxsamplelocationgridsize (:struct vkextent2d))
  (samplelocationcoordinaterange :float :count (apply #'* (list 2)))
  (samplelocationsubpixelbits :uint32)
  (variablesamplelocations vkbool32))

(cffi:defcstruct vkmultisamplepropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (maxsamplelocationgridsize (:struct vkextent2d)))

(cffi:defctype pfn_vkcmdsetsamplelocationsext :pointer)

(cffi:defctype pfn_vkgetphysicaldevicemultisamplepropertiesext :pointer)

(cffi:defcstruct vkphysicaldeviceblendoperationadvancedfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (advancedblendcoherentoperations vkbool32))

(cffi:defcstruct vkphysicaldeviceblendoperationadvancedpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (advancedblendmaxcolorattachments :uint32)
  (advancedblendindependentblend vkbool32)
  (advancedblendnonpremultipliedsrccolor vkbool32)
  (advancedblendnonpremultiplieddstcolor vkbool32)
  (advancedblendcorrelatedoverlap vkbool32)
  (advancedblendalloperations vkbool32))

(cffi:defcstruct vkpipelinecolorblendadvancedstatecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (srcpremultiplied vkbool32)
  (dstpremultiplied vkbool32)
  (blendoverlap vkblendoverlapext))

(cffi:defctype vkpipelinecoveragetocolorstatecreateflagsnv vkflags)

(cffi:defcstruct vkpipelinecoveragetocolorstatecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinecoveragetocolorstatecreateflagsnv)
  (coveragetocolorenable vkbool32)
  (coveragetocolorlocation :uint32))

(cffi:defctype vkpipelinecoveragemodulationstatecreateflagsnv vkflags)

(cffi:defcstruct vkpipelinecoveragemodulationstatecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinecoveragemodulationstatecreateflagsnv)
  (coveragemodulationmode vkcoveragemodulationmodenv)
  (coveragemodulationtableenable vkbool32)
  (coveragemodulationtablecount :uint32)
  (pcoveragemodulationtable :pointer))

(cffi:defcstruct vkphysicaldeviceshadersmbuiltinspropertiesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (shadersmcount :uint32)
  (shaderwarpspersm :uint32))

(cffi:defcstruct vkphysicaldeviceshadersmbuiltinsfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (shadersmbuiltins vkbool32))

(cffi:defcstruct vkdrmformatmodifierpropertiesext
  (drmformatmodifier :uint64)
  (drmformatmodifierplanecount :uint32)
  (drmformatmodifiertilingfeatures vkformatfeatureflags))

(cffi:defcstruct vkdrmformatmodifierpropertieslistext
  (stype vkstructuretype)
  (pnext :pointer)
  (drmformatmodifiercount :uint32)
  (pdrmformatmodifierproperties :pointer))

(cffi:defcstruct vkphysicaldeviceimagedrmformatmodifierinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (drmformatmodifier :uint64)
  (sharingmode vksharingmode)
  (queuefamilyindexcount :uint32)
  (pqueuefamilyindices :pointer))

(cffi:defcstruct vkimagedrmformatmodifierlistcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (drmformatmodifiercount :uint32)
  (pdrmformatmodifiers :pointer))

(cffi:defcstruct vkimagedrmformatmodifierexplicitcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (drmformatmodifier :uint64)
  (drmformatmodifierplanecount :uint32)
  (pplanelayouts :pointer))

(cffi:defcstruct vkimagedrmformatmodifierpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (drmformatmodifier :uint64))

(cffi:defcstruct vkdrmformatmodifierproperties2ext
  (drmformatmodifier :uint64)
  (drmformatmodifierplanecount :uint32)
  (drmformatmodifiertilingfeatures vkformatfeatureflags2))

(cffi:defcstruct vkdrmformatmodifierpropertieslist2ext
  (stype vkstructuretype)
  (pnext :pointer)
  (drmformatmodifiercount :uint32)
  (pdrmformatmodifierproperties :pointer))

(cffi:defctype pfn_vkgetimagedrmformatmodifierpropertiesext :pointer)

(cffi:defctype vkvalidationcacheext non-dispatchable-handle)

(cffi:defctype vkvalidationcachecreateflagsext vkflags)

(cffi:defcstruct vkvalidationcachecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkvalidationcachecreateflagsext)
  (initialdatasize :size)
  (pinitialdata :pointer))

(cffi:defcstruct vkshadermodulevalidationcachecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (validationcache vkvalidationcacheext))

(cffi:defctype pfn_vkcreatevalidationcacheext :pointer)

(cffi:defctype pfn_vkdestroyvalidationcacheext :pointer)

(cffi:defctype pfn_vkmergevalidationcachesext :pointer)

(cffi:defctype pfn_vkgetvalidationcachedataext :pointer)

(cffi:defctype vkdescriptorbindingflagbitsext vkdescriptorbindingflagbits)

(cffi:defctype vkdescriptorbindingflagsext vkdescriptorbindingflags)

(cffi:defctype vkdescriptorsetlayoutbindingflagscreateinfoext
               (:struct vkdescriptorsetlayoutbindingflagscreateinfo))

(cffi:defctype vkphysicaldevicedescriptorindexingfeaturesext
               (:struct vkphysicaldevicedescriptorindexingfeatures))

(cffi:defctype vkphysicaldevicedescriptorindexingpropertiesext
               (:struct vkphysicaldevicedescriptorindexingproperties))

(cffi:defctype vkdescriptorsetvariabledescriptorcountallocateinfoext
               (:struct vkdescriptorsetvariabledescriptorcountallocateinfo))

(cffi:defctype vkdescriptorsetvariabledescriptorcountlayoutsupportext
               (:struct vkdescriptorsetvariabledescriptorcountlayoutsupport))

(cffi:defcstruct vkshadingratepalettenv
  (shadingratepaletteentrycount :uint32)
  (pshadingratepaletteentries :pointer))

(cffi:defcstruct vkpipelineviewportshadingrateimagestatecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (shadingrateimageenable vkbool32)
  (viewportcount :uint32)
  (pshadingratepalettes :pointer))

(cffi:defcstruct vkphysicaldeviceshadingrateimagefeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (shadingrateimage vkbool32)
  (shadingratecoarsesampleorder vkbool32))

(cffi:defcstruct vkphysicaldeviceshadingrateimagepropertiesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (shadingratetexelsize (:struct vkextent2d))
  (shadingratepalettesize :uint32)
  (shadingratemaxcoarsesamples :uint32))

(cffi:defcstruct vkcoarsesamplelocationnv
  (pixelx :uint32)
  (pixely :uint32)
  (sample :uint32))

(cffi:defcstruct vkcoarsesampleordercustomnv
  (shadingrate vkshadingratepaletteentrynv)
  (samplecount :uint32)
  (samplelocationcount :uint32)
  (psamplelocations :pointer))

(cffi:defcstruct vkpipelineviewportcoarsesampleorderstatecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (sampleordertype vkcoarsesampleordertypenv)
  (customsampleordercount :uint32)
  (pcustomsampleorders :pointer))

(cffi:defctype pfn_vkcmdbindshadingrateimagenv :pointer)

(cffi:defctype pfn_vkcmdsetviewportshadingratepalettenv :pointer)

(cffi:defctype pfn_vkcmdsetcoarsesampleordernv :pointer)

(cffi:defctype vkaccelerationstructurenv non-dispatchable-handle)

(cffi:defctype vkraytracingshadergrouptypenv vkraytracingshadergrouptypekhr)

(cffi:defctype vkgeometrytypenv vkgeometrytypekhr)

(cffi:defctype vkaccelerationstructuretypenv vkaccelerationstructuretypekhr)

(cffi:defctype vkcopyaccelerationstructuremodenv
               vkcopyaccelerationstructuremodekhr)

(cffi:defctype vkgeometryflagskhr vkflags)

(cffi:defctype vkgeometryflagsnv vkgeometryflagskhr)

(cffi:defctype vkgeometryflagbitsnv vkgeometryflagbitskhr)

(cffi:defctype vkgeometryinstanceflagskhr vkflags)

(cffi:defctype vkgeometryinstanceflagsnv vkgeometryinstanceflagskhr)

(cffi:defctype vkgeometryinstanceflagbitsnv vkgeometryinstanceflagbitskhr)

(cffi:defctype vkbuildaccelerationstructureflagskhr vkflags)

(cffi:defctype vkbuildaccelerationstructureflagsnv
               vkbuildaccelerationstructureflagskhr)

(cffi:defctype vkbuildaccelerationstructureflagbitsnv
               vkbuildaccelerationstructureflagbitskhr)

(cffi:defcstruct vkraytracingshadergroupcreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (type vkraytracingshadergrouptypekhr)
  (generalshader :uint32)
  (closesthitshader :uint32)
  (anyhitshader :uint32)
  (intersectionshader :uint32))

(cffi:defcstruct vkraytracingpipelinecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinecreateflags)
  (stagecount :uint32)
  (pstages :pointer)
  (groupcount :uint32)
  (pgroups :pointer)
  (maxrecursiondepth :uint32)
  (layout vkpipelinelayout)
  (basepipelinehandle vkpipeline)
  (basepipelineindex :int32))

(cffi:defcstruct vkgeometrytrianglesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (vertexdata vkbuffer)
  (vertexoffset vkdevicesize)
  (vertexcount :uint32)
  (vertexstride vkdevicesize)
  (vertexformat vkformat)
  (indexdata vkbuffer)
  (indexoffset vkdevicesize)
  (indexcount :uint32)
  (indextype vkindextype)
  (transformdata vkbuffer)
  (transformoffset vkdevicesize))

(cffi:defcstruct vkgeometryaabbnv
  (stype vkstructuretype)
  (pnext :pointer)
  (aabbdata vkbuffer)
  (numaabbs :uint32)
  (stride :uint32)
  (offset vkdevicesize))

(cffi:defcstruct vkgeometrydatanv
  (triangles (:struct vkgeometrytrianglesnv))
  (aabbs (:struct vkgeometryaabbnv)))

(cffi:defcstruct vkgeometrynv
  (stype vkstructuretype)
  (pnext :pointer)
  (geometrytype vkgeometrytypekhr)
  (geometry (:struct vkgeometrydatanv))
  (flags vkgeometryflagskhr))

(cffi:defcstruct vkaccelerationstructureinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (type vkaccelerationstructuretypenv)
  (flags vkbuildaccelerationstructureflagsnv)
  (instancecount :uint32)
  (geometrycount :uint32)
  (pgeometries :pointer))

(cffi:defcstruct vkaccelerationstructurecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (compactedsize vkdevicesize)
  (info (:struct vkaccelerationstructureinfonv)))

(cffi:defcstruct vkbindaccelerationstructurememoryinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (accelerationstructure vkaccelerationstructurenv)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize)
  (deviceindexcount :uint32)
  (pdeviceindices :pointer))

(cffi:defcstruct vkwritedescriptorsetaccelerationstructurenv
  (stype vkstructuretype)
  (pnext :pointer)
  (accelerationstructurecount :uint32)
  (paccelerationstructures :pointer))

(cffi:defcstruct vkaccelerationstructurememoryrequirementsinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (type vkaccelerationstructurememoryrequirementstypenv)
  (accelerationstructure vkaccelerationstructurenv))

(cffi:defcstruct vkphysicaldeviceraytracingpropertiesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (shadergrouphandlesize :uint32)
  (maxrecursiondepth :uint32)
  (maxshadergroupstride :uint32)
  (shadergroupbasealignment :uint32)
  (maxgeometrycount :uint64)
  (maxinstancecount :uint64)
  (maxtrianglecount :uint64)
  (maxdescriptorsetaccelerationstructures :uint32))

(cffi:defcstruct vktransformmatrixkhr
  (matrix :float :count (apply #'* (list 3 4))))

(cffi:defctype vktransformmatrixnv (:struct vktransformmatrixkhr))

(cffi:defcstruct vkaabbpositionskhr
  (minx :float)
  (miny :float)
  (minz :float)
  (maxx :float)
  (maxy :float)
  (maxz :float))

(cffi:defctype vkaabbpositionsnv (:struct vkaabbpositionskhr))

(cffi:defcstruct vkaccelerationstructureinstancekhr
  (transform (:struct vktransformmatrixkhr))
  (instancecustomindex :uint32)
  (instanceshaderbindingtablerecordoffset :uint32)
  (accelerationstructurereference :uint64))

(cffi:defctype vkaccelerationstructureinstancenv
               (:struct vkaccelerationstructureinstancekhr))

(cffi:defctype pfn_vkcreateaccelerationstructurenv :pointer)

(cffi:defctype pfn_vkdestroyaccelerationstructurenv :pointer)

(cffi:defctype pfn_vkgetaccelerationstructurememoryrequirementsnv :pointer)

(cffi:defctype pfn_vkbindaccelerationstructurememorynv :pointer)

(cffi:defctype pfn_vkcmdbuildaccelerationstructurenv :pointer)

(cffi:defctype pfn_vkcmdcopyaccelerationstructurenv :pointer)

(cffi:defctype pfn_vkcmdtraceraysnv :pointer)

(cffi:defctype pfn_vkcreateraytracingpipelinesnv :pointer)

(cffi:defctype pfn_vkgetraytracingshadergrouphandleskhr :pointer)

(cffi:defctype pfn_vkgetraytracingshadergrouphandlesnv :pointer)

(cffi:defctype pfn_vkgetaccelerationstructurehandlenv :pointer)

(cffi:defctype pfn_vkcmdwriteaccelerationstructurespropertiesnv :pointer)

(cffi:defctype pfn_vkcompiledeferrednv :pointer)

(cffi:defcstruct vkphysicaldevicerepresentativefragmenttestfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (representativefragmenttest vkbool32))

(cffi:defcstruct vkpipelinerepresentativefragmentteststatecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (representativefragmenttestenable vkbool32))

(cffi:defcstruct vkphysicaldeviceimageviewimageformatinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (imageviewtype vkimageviewtype))

(cffi:defcstruct vkfiltercubicimageviewimageformatpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (filtercubic vkbool32)
  (filtercubicminmax vkbool32))

(cffi:defctype vkqueueglobalpriorityext vkqueueglobalprioritykhr)

(cffi:defctype vkdevicequeueglobalprioritycreateinfoext
               (:struct vkdevicequeueglobalprioritycreateinfokhr))

(cffi:defcstruct vkimportmemoryhostpointerinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (handletype vkexternalmemoryhandletypeflagbits)
  (phostpointer :pointer))

(cffi:defcstruct vkmemoryhostpointerpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (memorytypebits :uint32))

(cffi:defcstruct vkphysicaldeviceexternalmemoryhostpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (minimportedhostpointeralignment vkdevicesize))

(cffi:defctype pfn_vkgetmemoryhostpointerpropertiesext :pointer)

(cffi:defctype pfn_vkcmdwritebuffermarkeramd :pointer)

(cffi:defctype vkpipelinecompilercontrolflagsamd vkflags)

(cffi:defcstruct vkpipelinecompilercontrolcreateinfoamd
  (stype vkstructuretype)
  (pnext :pointer)
  (compilercontrolflags vkpipelinecompilercontrolflagsamd))

(cffi:defcstruct vkcalibratedtimestampinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (timedomain vktimedomainext))

(cffi:defctype pfn_vkgetphysicaldevicecalibrateabletimedomainsext :pointer)

(cffi:defctype pfn_vkgetcalibratedtimestampsext :pointer)

(cffi:defcstruct vkphysicaldeviceshadercorepropertiesamd
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderenginecount :uint32)
  (shaderarraysperenginecount :uint32)
  (computeunitspershaderarray :uint32)
  (simdpercomputeunit :uint32)
  (wavefrontspersimd :uint32)
  (wavefrontsize :uint32)
  (sgprspersimd :uint32)
  (minsgprallocation :uint32)
  (maxsgprallocation :uint32)
  (sgprallocationgranularity :uint32)
  (vgprspersimd :uint32)
  (minvgprallocation :uint32)
  (maxvgprallocation :uint32)
  (vgprallocationgranularity :uint32))

(cffi:defcstruct vkdevicememoryoverallocationcreateinfoamd
  (stype vkstructuretype)
  (pnext :pointer)
  (overallocationbehavior vkmemoryoverallocationbehavioramd))

(cffi:defcstruct vkphysicaldevicevertexattributedivisorpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (maxvertexattribdivisor :uint32))

(cffi:defcstruct vkvertexinputbindingdivisordescriptionext
  (binding :uint32)
  (divisor :uint32))

(cffi:defcstruct vkpipelinevertexinputdivisorstatecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (vertexbindingdivisorcount :uint32)
  (pvertexbindingdivisors :pointer))

(cffi:defcstruct vkphysicaldevicevertexattributedivisorfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (vertexattributeinstanceratedivisor vkbool32)
  (vertexattributeinstanceratezerodivisor vkbool32))

(cffi:defctype vkpipelinecreationfeedbackflagbitsext
               vkpipelinecreationfeedbackflagbits)

(cffi:defctype vkpipelinecreationfeedbackflagsext
               vkpipelinecreationfeedbackflags)

(cffi:defctype vkpipelinecreationfeedbackcreateinfoext
               (:struct vkpipelinecreationfeedbackcreateinfo))

(cffi:defctype vkpipelinecreationfeedbackext
               (:struct vkpipelinecreationfeedback))

(cffi:defcstruct vkphysicaldevicecomputeshaderderivativesfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (computederivativegroupquads vkbool32)
  (computederivativegrouplinear vkbool32))

(cffi:defcstruct vkphysicaldevicemeshshaderfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (taskshader vkbool32)
  (meshshader vkbool32))

(cffi:defcstruct vkphysicaldevicemeshshaderpropertiesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (maxdrawmeshtaskscount :uint32)
  (maxtaskworkgroupinvocations :uint32)
  (maxtaskworkgroupsize :uint32 :count (apply #'* (list 3)))
  (maxtasktotalmemorysize :uint32)
  (maxtaskoutputcount :uint32)
  (maxmeshworkgroupinvocations :uint32)
  (maxmeshworkgroupsize :uint32 :count (apply #'* (list 3)))
  (maxmeshtotalmemorysize :uint32)
  (maxmeshoutputvertices :uint32)
  (maxmeshoutputprimitives :uint32)
  (maxmeshmultiviewviewcount :uint32)
  (meshoutputpervertexgranularity :uint32)
  (meshoutputperprimitivegranularity :uint32))

(cffi:defcstruct vkdrawmeshtasksindirectcommandnv
  (taskcount :uint32)
  (firsttask :uint32))

(cffi:defctype pfn_vkcmddrawmeshtasksnv :pointer)

(cffi:defctype pfn_vkcmddrawmeshtasksindirectnv :pointer)

(cffi:defctype pfn_vkcmddrawmeshtasksindirectcountnv :pointer)

(cffi:defctype vkphysicaldevicefragmentshaderbarycentricfeaturesnv
               (:struct vkphysicaldevicefragmentshaderbarycentricfeatureskhr))

(cffi:defcstruct vkphysicaldeviceshaderimagefootprintfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (imagefootprint vkbool32))

(cffi:defcstruct vkpipelineviewportexclusivescissorstatecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (exclusivescissorcount :uint32)
  (pexclusivescissors :pointer))

(cffi:defcstruct vkphysicaldeviceexclusivescissorfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (exclusivescissor vkbool32))

(cffi:defctype pfn_vkcmdsetexclusivescissornv :pointer)

(cffi:defcstruct vkqueuefamilycheckpointpropertiesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (checkpointexecutionstagemask vkpipelinestageflags))

(cffi:defcstruct vkcheckpointdatanv
  (stype vkstructuretype)
  (pnext :pointer)
  (stage vkpipelinestageflagbits)
  (pcheckpointmarker :pointer))

(cffi:defctype pfn_vkcmdsetcheckpointnv :pointer)

(cffi:defctype pfn_vkgetqueuecheckpointdatanv :pointer)

(cffi:defcstruct vkphysicaldeviceshaderintegerfunctions2featuresintel
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderintegerfunctions2 vkbool32))

(cffi:defctype vkperformanceconfigurationintel non-dispatchable-handle)

(cffi:defcunion vkperformancevaluedataintel
  (value32 :uint32)
  (value64 :uint64)
  (valuefloat :float)
  (valuebool vkbool32)
  (valuestring :pointer))

(cffi:defcstruct vkperformancevalueintel
  (type vkperformancevaluetypeintel)
  (data (:union vkperformancevaluedataintel)))

(cffi:defcstruct vkinitializeperformanceapiinfointel
  (stype vkstructuretype)
  (pnext :pointer)
  (puserdata :pointer))

(cffi:defcstruct vkquerypoolperformancequerycreateinfointel
  (stype vkstructuretype)
  (pnext :pointer)
  (performancecounterssampling vkquerypoolsamplingmodeintel))

(cffi:defctype vkquerypoolcreateinfointel
               (:struct vkquerypoolperformancequerycreateinfointel))

(cffi:defcstruct vkperformancemarkerinfointel
  (stype vkstructuretype)
  (pnext :pointer)
  (marker :uint64))

(cffi:defcstruct vkperformancestreammarkerinfointel
  (stype vkstructuretype)
  (pnext :pointer)
  (marker :uint32))

(cffi:defcstruct vkperformanceoverrideinfointel
  (stype vkstructuretype)
  (pnext :pointer)
  (type vkperformanceoverridetypeintel)
  (enable vkbool32)
  (parameter :uint64))

(cffi:defcstruct vkperformanceconfigurationacquireinfointel
  (stype vkstructuretype)
  (pnext :pointer)
  (type vkperformanceconfigurationtypeintel))

(cffi:defctype pfn_vkinitializeperformanceapiintel :pointer)

(cffi:defctype pfn_vkuninitializeperformanceapiintel :pointer)

(cffi:defctype pfn_vkcmdsetperformancemarkerintel :pointer)

(cffi:defctype pfn_vkcmdsetperformancestreammarkerintel :pointer)

(cffi:defctype pfn_vkcmdsetperformanceoverrideintel :pointer)

(cffi:defctype pfn_vkacquireperformanceconfigurationintel :pointer)

(cffi:defctype pfn_vkreleaseperformanceconfigurationintel :pointer)

(cffi:defctype pfn_vkqueuesetperformanceconfigurationintel :pointer)

(cffi:defctype pfn_vkgetperformanceparameterintel :pointer)

(cffi:defcstruct vkphysicaldevicepcibusinfopropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (pcidomain :uint32)
  (pcibus :uint32)
  (pcidevice :uint32)
  (pcifunction :uint32))

(cffi:defcstruct vkdisplaynativehdrsurfacecapabilitiesamd
  (stype vkstructuretype)
  (pnext :pointer)
  (localdimmingsupport vkbool32))

(cffi:defcstruct vkswapchaindisplaynativehdrcreateinfoamd
  (stype vkstructuretype)
  (pnext :pointer)
  (localdimmingenable vkbool32))

(cffi:defctype pfn_vksetlocaldimmingamd :pointer)

(cffi:defcstruct vkphysicaldevicefragmentdensitymapfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (fragmentdensitymap vkbool32)
  (fragmentdensitymapdynamic vkbool32)
  (fragmentdensitymapnonsubsampledimages vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentdensitymappropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (minfragmentdensitytexelsize (:struct vkextent2d))
  (maxfragmentdensitytexelsize (:struct vkextent2d))
  (fragmentdensityinvocations vkbool32))

(cffi:defcstruct vkrenderpassfragmentdensitymapcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (fragmentdensitymapattachment (:struct vkattachmentreference)))

(cffi:defctype vkphysicaldevicescalarblocklayoutfeaturesext
               (:struct vkphysicaldevicescalarblocklayoutfeatures))

(cffi:defctype vkphysicaldevicesubgroupsizecontrolfeaturesext
               (:struct vkphysicaldevicesubgroupsizecontrolfeatures))

(cffi:defctype vkphysicaldevicesubgroupsizecontrolpropertiesext
               (:struct vkphysicaldevicesubgroupsizecontrolproperties))

(cffi:defctype vkpipelineshaderstagerequiredsubgroupsizecreateinfoext
               (:struct vkpipelineshaderstagerequiredsubgroupsizecreateinfo))

(cffi:defctype vkshadercorepropertiesflagsamd vkflags)

(cffi:defcstruct vkphysicaldeviceshadercoreproperties2amd
  (stype vkstructuretype)
  (pnext :pointer)
  (shadercorefeatures vkshadercorepropertiesflagsamd)
  (activecomputeunitcount :uint32))

(cffi:defcstruct vkphysicaldevicecoherentmemoryfeaturesamd
  (stype vkstructuretype)
  (pnext :pointer)
  (devicecoherentmemory vkbool32))

(cffi:defcstruct vkphysicaldeviceshaderimageatomicint64featuresext
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderimageint64atomics vkbool32)
  (sparseimageint64atomics vkbool32))

(cffi:defcstruct vkphysicaldevicememorybudgetpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (heapbudget vkdevicesize :count (apply #'* (list vk_max_memory_heaps)))
  (heapusage vkdevicesize :count (apply #'* (list vk_max_memory_heaps))))

(cffi:defcstruct vkphysicaldevicememorypriorityfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (memorypriority vkbool32))

(cffi:defcstruct vkmemorypriorityallocateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (priority :float))

(cffi:defcstruct vkphysicaldevicededicatedallocationimagealiasingfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (dedicatedallocationimagealiasing vkbool32))

(cffi:defcstruct vkphysicaldevicebufferdeviceaddressfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (bufferdeviceaddress vkbool32)
  (bufferdeviceaddresscapturereplay vkbool32)
  (bufferdeviceaddressmultidevice vkbool32))

(cffi:defctype vkphysicaldevicebufferaddressfeaturesext
               (:struct vkphysicaldevicebufferdeviceaddressfeaturesext))

(cffi:defctype vkbufferdeviceaddressinfoext (:struct vkbufferdeviceaddressinfo))

(cffi:defcstruct vkbufferdeviceaddresscreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (deviceaddress vkdeviceaddress))

(cffi:defctype pfn_vkgetbufferdeviceaddressext :pointer)

(cffi:defctype vktoolpurposeflagbitsext vktoolpurposeflagbits)

(cffi:defctype vktoolpurposeflagsext vktoolpurposeflags)

(cffi:defctype vkphysicaldevicetoolpropertiesext
               (:struct vkphysicaldevicetoolproperties))

(cffi:defctype pfn_vkgetphysicaldevicetoolpropertiesext :pointer)

(cffi:defctype vkimagestencilusagecreateinfoext
               (:struct vkimagestencilusagecreateinfo))

(cffi:defcstruct vkvalidationfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (enabledvalidationfeaturecount :uint32)
  (penabledvalidationfeatures :pointer)
  (disabledvalidationfeaturecount :uint32)
  (pdisabledvalidationfeatures :pointer))

(cffi:defcstruct vkcooperativematrixpropertiesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (msize :uint32)
  (nsize :uint32)
  (ksize :uint32)
  (atype vkcomponenttypenv)
  (btype vkcomponenttypenv)
  (ctype vkcomponenttypenv)
  (dtype vkcomponenttypenv)
  (scope vkscopenv))

(cffi:defcstruct vkphysicaldevicecooperativematrixfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (cooperativematrix vkbool32)
  (cooperativematrixrobustbufferaccess vkbool32))

(cffi:defcstruct vkphysicaldevicecooperativematrixpropertiesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (cooperativematrixsupportedstages vkshaderstageflags))

(cffi:defctype pfn_vkgetphysicaldevicecooperativematrixpropertiesnv :pointer)

(cffi:defctype vkpipelinecoveragereductionstatecreateflagsnv vkflags)

(cffi:defcstruct vkphysicaldevicecoveragereductionmodefeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (coveragereductionmode vkbool32))

(cffi:defcstruct vkpipelinecoveragereductionstatecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinecoveragereductionstatecreateflagsnv)
  (coveragereductionmode vkcoveragereductionmodenv))

(cffi:defcstruct vkframebuffermixedsamplescombinationnv
  (stype vkstructuretype)
  (pnext :pointer)
  (coveragereductionmode vkcoveragereductionmodenv)
  (rasterizationsamples vksamplecountflagbits)
  (depthstencilsamples vksamplecountflags)
  (colorsamples vksamplecountflags))

(cffi:defctype
 pfn_vkgetphysicaldevicesupportedframebuffermixedsamplescombinationsnv :pointer)

(cffi:defcstruct vkphysicaldevicefragmentshaderinterlockfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (fragmentshadersampleinterlock vkbool32)
  (fragmentshaderpixelinterlock vkbool32)
  (fragmentshadershadingrateinterlock vkbool32))

(cffi:defcstruct vkphysicaldeviceycbcrimagearraysfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (ycbcrimagearrays vkbool32))

(cffi:defcstruct vkphysicaldeviceprovokingvertexfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (provokingvertexlast vkbool32)
  (transformfeedbackpreservesprovokingvertex vkbool32))

(cffi:defcstruct vkphysicaldeviceprovokingvertexpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (provokingvertexmodeperpipeline vkbool32)
  (transformfeedbackpreservestrianglefanprovokingvertex vkbool32))

(cffi:defcstruct vkpipelinerasterizationprovokingvertexstatecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (provokingvertexmode vkprovokingvertexmodeext))

(cffi:defctype vkheadlesssurfacecreateflagsext vkflags)

(cffi:defcstruct vkheadlesssurfacecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkheadlesssurfacecreateflagsext))

(cffi:defctype pfn_vkcreateheadlesssurfaceext :pointer)

(cffi:defcstruct vkphysicaldevicelinerasterizationfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (rectangularlines vkbool32)
  (bresenhamlines vkbool32)
  (smoothlines vkbool32)
  (stippledrectangularlines vkbool32)
  (stippledbresenhamlines vkbool32)
  (stippledsmoothlines vkbool32))

(cffi:defcstruct vkphysicaldevicelinerasterizationpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (linesubpixelprecisionbits :uint32))

(cffi:defcstruct vkpipelinerasterizationlinestatecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (linerasterizationmode vklinerasterizationmodeext)
  (stippledlineenable vkbool32)
  (linestipplefactor :uint32)
  (linestipplepattern :uint16))

(cffi:defctype pfn_vkcmdsetlinestippleext :pointer)

(cffi:defcstruct vkphysicaldeviceshaderatomicfloatfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderbufferfloat32atomics vkbool32)
  (shaderbufferfloat32atomicadd vkbool32)
  (shaderbufferfloat64atomics vkbool32)
  (shaderbufferfloat64atomicadd vkbool32)
  (shadersharedfloat32atomics vkbool32)
  (shadersharedfloat32atomicadd vkbool32)
  (shadersharedfloat64atomics vkbool32)
  (shadersharedfloat64atomicadd vkbool32)
  (shaderimagefloat32atomics vkbool32)
  (shaderimagefloat32atomicadd vkbool32)
  (sparseimagefloat32atomics vkbool32)
  (sparseimagefloat32atomicadd vkbool32))

(cffi:defctype vkphysicaldevicehostqueryresetfeaturesext
               (:struct vkphysicaldevicehostqueryresetfeatures))

(cffi:defctype pfn_vkresetquerypoolext :pointer)

(cffi:defcstruct vkphysicaldeviceindextypeuint8featuresext
  (stype vkstructuretype)
  (pnext :pointer)
  (indextypeuint8 vkbool32))

(cffi:defcstruct vkphysicaldeviceextendeddynamicstatefeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (extendeddynamicstate vkbool32))

(cffi:defctype pfn_vkcmdsetcullmodeext :pointer)

(cffi:defctype pfn_vkcmdsetfrontfaceext :pointer)

(cffi:defctype pfn_vkcmdsetprimitivetopologyext :pointer)

(cffi:defctype pfn_vkcmdsetviewportwithcountext :pointer)

(cffi:defctype pfn_vkcmdsetscissorwithcountext :pointer)

(cffi:defctype pfn_vkcmdbindvertexbuffers2ext :pointer)

(cffi:defctype pfn_vkcmdsetdepthtestenableext :pointer)

(cffi:defctype pfn_vkcmdsetdepthwriteenableext :pointer)

(cffi:defctype pfn_vkcmdsetdepthcompareopext :pointer)

(cffi:defctype pfn_vkcmdsetdepthboundstestenableext :pointer)

(cffi:defctype pfn_vkcmdsetstenciltestenableext :pointer)

(cffi:defctype pfn_vkcmdsetstencilopext :pointer)

(cffi:defcstruct vkphysicaldeviceshaderatomicfloat2featuresext
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderbufferfloat16atomics vkbool32)
  (shaderbufferfloat16atomicadd vkbool32)
  (shaderbufferfloat16atomicminmax vkbool32)
  (shaderbufferfloat32atomicminmax vkbool32)
  (shaderbufferfloat64atomicminmax vkbool32)
  (shadersharedfloat16atomics vkbool32)
  (shadersharedfloat16atomicadd vkbool32)
  (shadersharedfloat16atomicminmax vkbool32)
  (shadersharedfloat32atomicminmax vkbool32)
  (shadersharedfloat64atomicminmax vkbool32)
  (shaderimagefloat32atomicminmax vkbool32)
  (sparseimagefloat32atomicminmax vkbool32))

(cffi:defctype vkphysicaldeviceshaderdemotetohelperinvocationfeaturesext
               (:struct vkphysicaldeviceshaderdemotetohelperinvocationfeatures))

(cffi:defctype vkindirectcommandslayoutnv non-dispatchable-handle)

(cffi:defctype vkindirectstateflagsnv vkflags)

(cffi:defctype vkindirectcommandslayoutusageflagsnv vkflags)

(cffi:defcstruct vkphysicaldevicedevicegeneratedcommandspropertiesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (maxgraphicsshadergroupcount :uint32)
  (maxindirectsequencecount :uint32)
  (maxindirectcommandstokencount :uint32)
  (maxindirectcommandsstreamcount :uint32)
  (maxindirectcommandstokenoffset :uint32)
  (maxindirectcommandsstreamstride :uint32)
  (minsequencescountbufferoffsetalignment :uint32)
  (minsequencesindexbufferoffsetalignment :uint32)
  (minindirectcommandsbufferoffsetalignment :uint32))

(cffi:defcstruct vkphysicaldevicedevicegeneratedcommandsfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (devicegeneratedcommands vkbool32))

(cffi:defcstruct vkgraphicsshadergroupcreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (stagecount :uint32)
  (pstages :pointer)
  (pvertexinputstate :pointer)
  (ptessellationstate :pointer))

(cffi:defcstruct vkgraphicspipelineshadergroupscreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (groupcount :uint32)
  (pgroups :pointer)
  (pipelinecount :uint32)
  (ppipelines :pointer))

(cffi:defcstruct vkbindshadergroupindirectcommandnv
  (groupindex :uint32))

(cffi:defcstruct vkbindindexbufferindirectcommandnv
  (bufferaddress vkdeviceaddress)
  (size :uint32)
  (indextype vkindextype))

(cffi:defcstruct vkbindvertexbufferindirectcommandnv
  (bufferaddress vkdeviceaddress)
  (size :uint32)
  (stride :uint32))

(cffi:defcstruct vksetstateflagsindirectcommandnv
  (data :uint32))

(cffi:defcstruct vkindirectcommandsstreamnv
  (buffer vkbuffer)
  (offset vkdevicesize))

(cffi:defcstruct vkindirectcommandslayouttokennv
  (stype vkstructuretype)
  (pnext :pointer)
  (tokentype vkindirectcommandstokentypenv)
  (stream :uint32)
  (offset :uint32)
  (vertexbindingunit :uint32)
  (vertexdynamicstride vkbool32)
  (pushconstantpipelinelayout vkpipelinelayout)
  (pushconstantshaderstageflags vkshaderstageflags)
  (pushconstantoffset :uint32)
  (pushconstantsize :uint32)
  (indirectstateflags vkindirectstateflagsnv)
  (indextypecount :uint32)
  (pindextypes :pointer)
  (pindextypevalues :pointer))

(cffi:defcstruct vkindirectcommandslayoutcreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkindirectcommandslayoutusageflagsnv)
  (pipelinebindpoint vkpipelinebindpoint)
  (tokencount :uint32)
  (ptokens :pointer)
  (streamcount :uint32)
  (pstreamstrides :pointer))

(cffi:defcstruct vkgeneratedcommandsinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (pipelinebindpoint vkpipelinebindpoint)
  (pipeline vkpipeline)
  (indirectcommandslayout vkindirectcommandslayoutnv)
  (streamcount :uint32)
  (pstreams :pointer)
  (sequencescount :uint32)
  (preprocessbuffer vkbuffer)
  (preprocessoffset vkdevicesize)
  (preprocesssize vkdevicesize)
  (sequencescountbuffer vkbuffer)
  (sequencescountoffset vkdevicesize)
  (sequencesindexbuffer vkbuffer)
  (sequencesindexoffset vkdevicesize))

(cffi:defcstruct vkgeneratedcommandsmemoryrequirementsinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (pipelinebindpoint vkpipelinebindpoint)
  (pipeline vkpipeline)
  (indirectcommandslayout vkindirectcommandslayoutnv)
  (maxsequencescount :uint32))

(cffi:defctype pfn_vkgetgeneratedcommandsmemoryrequirementsnv :pointer)

(cffi:defctype pfn_vkcmdpreprocessgeneratedcommandsnv :pointer)

(cffi:defctype pfn_vkcmdexecutegeneratedcommandsnv :pointer)

(cffi:defctype pfn_vkcmdbindpipelineshadergroupnv :pointer)

(cffi:defctype pfn_vkcreateindirectcommandslayoutnv :pointer)

(cffi:defctype pfn_vkdestroyindirectcommandslayoutnv :pointer)

(cffi:defcstruct vkphysicaldeviceinheritedviewportscissorfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (inheritedviewportscissor2d vkbool32))

(cffi:defcstruct vkcommandbufferinheritanceviewportscissorinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (viewportscissor2d vkbool32)
  (viewportdepthcount :uint32)
  (pviewportdepths :pointer))

(cffi:defcstruct vkphysicaldevicetexelbufferalignmentfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (texelbufferalignment vkbool32))

(cffi:defctype vkphysicaldevicetexelbufferalignmentpropertiesext
               (:struct vkphysicaldevicetexelbufferalignmentproperties))

(cffi:defcstruct vkrenderpasstransformbegininfoqcom
  (stype vkstructuretype)
  (pnext :pointer)
  (transform vksurfacetransformflagbitskhr))

(cffi:defcstruct vkcommandbufferinheritancerenderpasstransforminfoqcom
  (stype vkstructuretype)
  (pnext :pointer)
  (transform vksurfacetransformflagbitskhr)
  (renderarea (:struct vkrect2d)))

(cffi:defctype vkdevicememoryreportflagsext vkflags)

(cffi:defcstruct vkphysicaldevicedevicememoryreportfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (devicememoryreport vkbool32))

(cffi:defcstruct vkdevicememoryreportcallbackdataext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdevicememoryreportflagsext)
  (type vkdevicememoryreporteventtypeext)
  (memoryobjectid :uint64)
  (size vkdevicesize)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (heapindex :uint32))

(cffi:defctype pfn_vkdevicememoryreportcallbackext :pointer)

(cffi:defcstruct vkdevicedevicememoryreportcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdevicememoryreportflagsext)
  (pfnusercallback pfn_vkdevicememoryreportcallbackext)
  (puserdata :pointer))

(cffi:defctype pfn_vkacquiredrmdisplayext :pointer)

(cffi:defctype pfn_vkgetdrmdisplayext :pointer)

(cffi:defcstruct vkphysicaldevicerobustness2featuresext
  (stype vkstructuretype)
  (pnext :pointer)
  (robustbufferaccess2 vkbool32)
  (robustimageaccess2 vkbool32)
  (nulldescriptor vkbool32))

(cffi:defcstruct vkphysicaldevicerobustness2propertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (robuststoragebufferaccesssizealignment vkdevicesize)
  (robustuniformbufferaccesssizealignment vkdevicesize))

(cffi:defcstruct vksamplercustombordercolorcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (custombordercolor (:union vkclearcolorvalue))
  (format vkformat))

(cffi:defcstruct vkphysicaldevicecustombordercolorpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (maxcustombordercolorsamplers :uint32))

(cffi:defcstruct vkphysicaldevicecustombordercolorfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (custombordercolors vkbool32)
  (custombordercolorwithoutformat vkbool32))

(cffi:defctype vkprivatedataslotext :pointer)

(cffi:defctype vkprivatedataslotcreateflagsext vkprivatedataslotcreateflags)

(cffi:defctype vkphysicaldeviceprivatedatafeaturesext
               (:struct vkphysicaldeviceprivatedatafeatures))

(cffi:defctype vkdeviceprivatedatacreateinfoext
               (:struct vkdeviceprivatedatacreateinfo))

(cffi:defctype vkprivatedataslotcreateinfoext
               (:struct vkprivatedataslotcreateinfo))

(cffi:defctype pfn_vkcreateprivatedataslotext :pointer)

(cffi:defctype pfn_vkdestroyprivatedataslotext :pointer)

(cffi:defctype pfn_vksetprivatedataext :pointer)

(cffi:defctype pfn_vkgetprivatedataext :pointer)

(cffi:defctype vkphysicaldevicepipelinecreationcachecontrolfeaturesext
               (:struct vkphysicaldevicepipelinecreationcachecontrolfeatures))

(cffi:defctype vkdevicediagnosticsconfigflagsnv vkflags)

(cffi:defcstruct vkphysicaldevicediagnosticsconfigfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (diagnosticsconfig vkbool32))

(cffi:defcstruct vkdevicediagnosticsconfigcreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkdevicediagnosticsconfigflagsnv))

(cffi:defctype vkgraphicspipelinelibraryflagsext vkflags)

(cffi:defcstruct vkphysicaldevicegraphicspipelinelibraryfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (graphicspipelinelibrary vkbool32))

(cffi:defcstruct vkphysicaldevicegraphicspipelinelibrarypropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (graphicspipelinelibraryfastlinking vkbool32)
  (graphicspipelinelibraryindependentinterpolationdecoration vkbool32))

(cffi:defcstruct vkgraphicspipelinelibrarycreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkgraphicspipelinelibraryflagsext))

(cffi:defcstruct vkphysicaldeviceshaderearlyandlatefragmenttestsfeaturesamd
  (stype vkstructuretype)
  (pnext :pointer)
  (shaderearlyandlatefragmenttests vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentshadingrateenumsfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (fragmentshadingrateenums vkbool32)
  (supersamplefragmentshadingrates vkbool32)
  (noinvocationfragmentshadingrates vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentshadingrateenumspropertiesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (maxfragmentshadingrateinvocationcount vksamplecountflagbits))

(cffi:defcstruct vkpipelinefragmentshadingrateenumstatecreateinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (shadingratetype vkfragmentshadingratetypenv)
  (shadingrate vkfragmentshadingratenv)
  (combinerops vkfragmentshadingratecombineropkhr :count (apply #'* (list 2))))

(cffi:defctype pfn_vkcmdsetfragmentshadingrateenumnv :pointer)

(cffi:defctype vkaccelerationstructuremotioninfoflagsnv vkflags)

(cffi:defctype vkaccelerationstructuremotioninstanceflagsnv vkflags)

(cffi:defcunion vkdeviceorhostaddressconstkhr
  (deviceaddress vkdeviceaddress)
  (hostaddress :pointer))

(cffi:defcstruct vkaccelerationstructuregeometrymotiontrianglesdatanv
  (stype vkstructuretype)
  (pnext :pointer)
  (vertexdata (:union vkdeviceorhostaddressconstkhr)))

(cffi:defcstruct vkaccelerationstructuremotioninfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (maxinstances :uint32)
  (flags vkaccelerationstructuremotioninfoflagsnv))

(cffi:defcstruct vkaccelerationstructurematrixmotioninstancenv
  (transformt0 (:struct vktransformmatrixkhr))
  (transformt1 (:struct vktransformmatrixkhr))
  (instancecustomindex :uint32)
  (instanceshaderbindingtablerecordoffset :uint32)
  (accelerationstructurereference :uint64))

(cffi:defcstruct vksrtdatanv
  (sx :float)
  (a :float)
  (b :float)
  (pvx :float)
  (sy :float)
  (c :float)
  (pvy :float)
  (sz :float)
  (pvz :float)
  (qx :float)
  (qy :float)
  (qz :float)
  (qw :float)
  (tx :float)
  (ty :float)
  (tz :float))

(cffi:defcstruct vkaccelerationstructuresrtmotioninstancenv
  (transformt0 (:struct vksrtdatanv))
  (transformt1 (:struct vksrtdatanv))
  (instancecustomindex :uint32)
  (instanceshaderbindingtablerecordoffset :uint32)
  (accelerationstructurereference :uint64))

(cffi:defcunion vkaccelerationstructuremotioninstancedatanv
  (staticinstance (:struct vkaccelerationstructureinstancekhr))
  (matrixmotioninstance (:struct vkaccelerationstructurematrixmotioninstancenv))
  (srtmotioninstance (:struct vkaccelerationstructuresrtmotioninstancenv)))

(cffi:defcstruct vkaccelerationstructuremotioninstancenv
  (type vkaccelerationstructuremotioninstancetypenv)
  (flags vkaccelerationstructuremotioninstanceflagsnv)
  (data (:union vkaccelerationstructuremotioninstancedatanv)))

(cffi:defcstruct vkphysicaldeviceraytracingmotionblurfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (raytracingmotionblur vkbool32)
  (raytracingmotionblurpipelinetraceraysindirect vkbool32))

(cffi:defcstruct vkphysicaldeviceycbcr2plane444formatsfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (ycbcr2plane444formats vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentdensitymap2featuresext
  (stype vkstructuretype)
  (pnext :pointer)
  (fragmentdensitymapdeferred vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentdensitymap2propertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (subsampledloads vkbool32)
  (subsampledcoarsereconstructionearlyaccess vkbool32)
  (maxsubsampledarraylayers :uint32)
  (maxdescriptorsetsubsampledsamplers :uint32))

(cffi:defcstruct vkcopycommandtransforminfoqcom
  (stype vkstructuretype)
  (pnext :pointer)
  (transform vksurfacetransformflagbitskhr))

(cffi:defctype vkphysicaldeviceimagerobustnessfeaturesext
               (:struct vkphysicaldeviceimagerobustnessfeatures))

(cffi:defctype vkimagecompressionflagsext vkflags)

(cffi:defctype vkimagecompressionfixedrateflagsext vkflags)

(cffi:defcstruct vkphysicaldeviceimagecompressioncontrolfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (imagecompressioncontrol vkbool32))

(cffi:defcstruct vkimagecompressioncontrolext
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkimagecompressionflagsext)
  (compressioncontrolplanecount :uint32)
  (pfixedrateflags :pointer))

(cffi:defcstruct vksubresourcelayout2ext
  (stype vkstructuretype)
  (pnext :pointer)
  (subresourcelayout (:struct vksubresourcelayout)))

(cffi:defcstruct vkimagesubresource2ext
  (stype vkstructuretype)
  (pnext :pointer)
  (imagesubresource (:struct vkimagesubresource)))

(cffi:defcstruct vkimagecompressionpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (imagecompressionflags vkimagecompressionflagsext)
  (imagecompressionfixedrateflags vkimagecompressionfixedrateflagsext))

(cffi:defctype pfn_vkgetimagesubresourcelayout2ext :pointer)

(cffi:defcstruct vkphysicaldevice4444formatsfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (formata4r4g4b4 vkbool32)
  (formata4b4g4r4 vkbool32))

(cffi:defcstruct vkphysicaldevicerasterizationorderattachmentaccessfeaturesarm
  (stype vkstructuretype)
  (pnext :pointer)
  (rasterizationordercolorattachmentaccess vkbool32)
  (rasterizationorderdepthattachmentaccess vkbool32)
  (rasterizationorderstencilattachmentaccess vkbool32))

(cffi:defcstruct vkphysicaldevicergba10x6formatsfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (formatrgba10x6withoutycbcrsampler vkbool32))

(cffi:defctype pfn_vkacquirewinrtdisplaynv :pointer)

(cffi:defctype pfn_vkgetwinrtdisplaynv :pointer)

(cffi:defcstruct vkphysicaldevicemutabledescriptortypefeaturesvalve
  (stype vkstructuretype)
  (pnext :pointer)
  (mutabledescriptortype vkbool32))

(cffi:defcstruct vkmutabledescriptortypelistvalve
  (descriptortypecount :uint32)
  (pdescriptortypes :pointer))

(cffi:defcstruct vkmutabledescriptortypecreateinfovalve
  (stype vkstructuretype)
  (pnext :pointer)
  (mutabledescriptortypelistcount :uint32)
  (pmutabledescriptortypelists :pointer))

(cffi:defcstruct vkphysicaldevicevertexinputdynamicstatefeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (vertexinputdynamicstate vkbool32))

(cffi:defcstruct vkvertexinputbindingdescription2ext
  (stype vkstructuretype)
  (pnext :pointer)
  (binding :uint32)
  (stride :uint32)
  (inputrate vkvertexinputrate)
  (divisor :uint32))

(cffi:defcstruct vkvertexinputattributedescription2ext
  (stype vkstructuretype)
  (pnext :pointer)
  (location :uint32)
  (binding :uint32)
  (format vkformat)
  (offset :uint32))

(cffi:defctype pfn_vkcmdsetvertexinputext :pointer)

(cffi:defcstruct vkphysicaldevicedrmpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (hasprimary vkbool32)
  (hasrender vkbool32)
  (primarymajor :int64)
  (primaryminor :int64)
  (rendermajor :int64)
  (renderminor :int64))

(cffi:defcstruct vkphysicaldevicedepthclipcontrolfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (depthclipcontrol vkbool32))

(cffi:defcstruct vkpipelineviewportdepthclipcontrolcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (negativeonetoone vkbool32))

(cffi:defcstruct vkphysicaldeviceprimitivetopologylistrestartfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (primitivetopologylistrestart vkbool32)
  (primitivetopologypatchlistrestart vkbool32))

(cffi:defcstruct vksubpassshadingpipelinecreateinfohuawei
  (stype vkstructuretype)
  (pnext :pointer)
  (renderpass vkrenderpass)
  (subpass :uint32))

(cffi:defcstruct vkphysicaldevicesubpassshadingfeatureshuawei
  (stype vkstructuretype)
  (pnext :pointer)
  (subpassshading vkbool32))

(cffi:defcstruct vkphysicaldevicesubpassshadingpropertieshuawei
  (stype vkstructuretype)
  (pnext :pointer)
  (maxsubpassshadingworkgroupsizeaspectratio :uint32))

(cffi:defctype pfn_vkgetdevicesubpassshadingmaxworkgroupsizehuawei :pointer)

(cffi:defctype pfn_vkcmdsubpassshadinghuawei :pointer)

(cffi:defcstruct vkphysicaldeviceinvocationmaskfeatureshuawei
  (stype vkstructuretype)
  (pnext :pointer)
  (invocationmask vkbool32))

(cffi:defctype pfn_vkcmdbindinvocationmaskhuawei :pointer)

(cffi:defctype vkremoteaddressnv :pointer)

(cffi:defcstruct vkmemorygetremoteaddressinfonv
  (stype vkstructuretype)
  (pnext :pointer)
  (memory vkdevicememory)
  (handletype vkexternalmemoryhandletypeflagbits))

(cffi:defcstruct vkphysicaldeviceexternalmemoryrdmafeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (externalmemoryrdma vkbool32))

(cffi:defctype pfn_vkgetmemoryremoteaddressnv :pointer)

(cffi:defctype vkpipelineinfoext (:struct vkpipelineinfokhr))

(cffi:defcstruct vkpipelinepropertiesidentifierext
  (stype vkstructuretype)
  (pnext :pointer)
  (pipelineidentifier :uint8 :count (apply #'* (list vk_uuid_size))))

(cffi:defcstruct vkphysicaldevicepipelinepropertiesfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (pipelinepropertiesidentifier vkbool32))

(cffi:defctype pfn_vkgetpipelinepropertiesext :pointer)

(cffi:defcstruct vkphysicaldeviceextendeddynamicstate2featuresext
  (stype vkstructuretype)
  (pnext :pointer)
  (extendeddynamicstate2 vkbool32)
  (extendeddynamicstate2logicop vkbool32)
  (extendeddynamicstate2patchcontrolpoints vkbool32))

(cffi:defctype pfn_vkcmdsetpatchcontrolpointsext :pointer)

(cffi:defctype pfn_vkcmdsetrasterizerdiscardenableext :pointer)

(cffi:defctype pfn_vkcmdsetdepthbiasenableext :pointer)

(cffi:defctype pfn_vkcmdsetlogicopext :pointer)

(cffi:defctype pfn_vkcmdsetprimitiverestartenableext :pointer)

(cffi:defcstruct vkphysicaldevicecolorwriteenablefeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (colorwriteenable vkbool32))

(cffi:defcstruct vkpipelinecolorwritecreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (attachmentcount :uint32)
  (pcolorwriteenables :pointer))

(cffi:defctype pfn_vkcmdsetcolorwriteenableext :pointer)

(cffi:defcstruct vkphysicaldeviceprimitivesgeneratedqueryfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (primitivesgeneratedquery vkbool32)
  (primitivesgeneratedquerywithrasterizerdiscard vkbool32)
  (primitivesgeneratedquerywithnonzerostreams vkbool32))

(cffi:defctype vkphysicaldeviceglobalpriorityqueryfeaturesext
               (:struct vkphysicaldeviceglobalpriorityqueryfeatureskhr))

(cffi:defctype vkqueuefamilyglobalprioritypropertiesext
               (:struct vkqueuefamilyglobalprioritypropertieskhr))

(cffi:defcstruct vkphysicaldeviceimageviewminlodfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (minlod vkbool32))

(cffi:defcstruct vkimageviewminlodcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (minlod :float))

(cffi:defcstruct vkphysicaldevicemultidrawfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (multidraw vkbool32))

(cffi:defcstruct vkphysicaldevicemultidrawpropertiesext
  (stype vkstructuretype)
  (pnext :pointer)
  (maxmultidrawcount :uint32))

(cffi:defcstruct vkmultidrawinfoext
  (firstvertex :uint32)
  (vertexcount :uint32))

(cffi:defcstruct vkmultidrawindexedinfoext
  (firstindex :uint32)
  (indexcount :uint32)
  (vertexoffset :int32))

(cffi:defctype pfn_vkcmddrawmultiext :pointer)

(cffi:defctype pfn_vkcmddrawmultiindexedext :pointer)

(cffi:defcstruct vkphysicaldeviceimage2dviewof3dfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (image2dviewof3d vkbool32)
  (sampler2dviewof3d vkbool32))

(cffi:defcstruct vkphysicaldevicebordercolorswizzlefeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (bordercolorswizzle vkbool32)
  (bordercolorswizzlefromimage vkbool32))

(cffi:defcstruct vksamplerbordercolorcomponentmappingcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (components (:struct vkcomponentmapping))
  (srgb vkbool32))

(cffi:defcstruct vkphysicaldevicepageabledevicelocalmemoryfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (pageabledevicelocalmemory vkbool32))

(cffi:defctype pfn_vksetdevicememorypriorityext :pointer)

(cffi:defcstruct vkphysicaldevicedescriptorsethostmappingfeaturesvalve
  (stype vkstructuretype)
  (pnext :pointer)
  (descriptorsethostmapping vkbool32))

(cffi:defcstruct vkdescriptorsetbindingreferencevalve
  (stype vkstructuretype)
  (pnext :pointer)
  (descriptorsetlayout vkdescriptorsetlayout)
  (binding :uint32))

(cffi:defcstruct vkdescriptorsetlayouthostmappinginfovalve
  (stype vkstructuretype)
  (pnext :pointer)
  (descriptoroffset :size)
  (descriptorsize :uint32))

(cffi:defctype pfn_vkgetdescriptorsetlayouthostmappinginfovalve :pointer)

(cffi:defctype pfn_vkgetdescriptorsethostmappingvalve :pointer)

(cffi:defcstruct vkphysicaldevicefragmentdensitymapoffsetfeaturesqcom
  (stype vkstructuretype)
  (pnext :pointer)
  (fragmentdensitymapoffset vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentdensitymapoffsetpropertiesqcom
  (stype vkstructuretype)
  (pnext :pointer)
  (fragmentdensityoffsetgranularity (:struct vkextent2d)))

(cffi:defcstruct vksubpassfragmentdensitymapoffsetendinfoqcom
  (stype vkstructuretype)
  (pnext :pointer)
  (fragmentdensityoffsetcount :uint32)
  (pfragmentdensityoffsets :pointer))

(cffi:defcstruct vkphysicaldevicelinearcolorattachmentfeaturesnv
  (stype vkstructuretype)
  (pnext :pointer)
  (linearcolorattachment vkbool32))

(cffi:defcstruct vkphysicaldeviceimagecompressioncontrolswapchainfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (imagecompressioncontrolswapchain vkbool32))

(cffi:defcstruct vkphysicaldevicesubpassmergefeedbackfeaturesext
  (stype vkstructuretype)
  (pnext :pointer)
  (subpassmergefeedback vkbool32))

(cffi:defcstruct vkrenderpasscreationcontrolext
  (stype vkstructuretype)
  (pnext :pointer)
  (disallowmerging vkbool32))

(cffi:defcstruct vkrenderpasscreationfeedbackinfoext
  (postmergesubpasscount :uint32))

(cffi:defcstruct vkrenderpasscreationfeedbackcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (prenderpassfeedback :pointer))

(cffi:defcstruct vkrenderpasssubpassfeedbackinfoext
  (subpassmergestatus vksubpassmergestatusext)
  (description :char :count (apply #'* (list vk_max_description_size)))
  (postmergeindex :uint32))

(cffi:defcstruct vkrenderpasssubpassfeedbackcreateinfoext
  (stype vkstructuretype)
  (pnext :pointer)
  (psubpassfeedback :pointer))

(cffi:defctype vkaccelerationstructurekhr non-dispatchable-handle)

(cffi:defctype vkaccelerationstructurecreateflagskhr vkflags)

(cffi:defcunion vkdeviceorhostaddresskhr
  (deviceaddress vkdeviceaddress)
  (hostaddress :pointer))

(cffi:defcstruct vkaccelerationstructurebuildrangeinfokhr
  (primitivecount :uint32)
  (primitiveoffset :uint32)
  (firstvertex :uint32)
  (transformoffset :uint32))

(cffi:defcstruct vkaccelerationstructuregeometrytrianglesdatakhr
  (stype vkstructuretype)
  (pnext :pointer)
  (vertexformat vkformat)
  (vertexdata (:union vkdeviceorhostaddressconstkhr))
  (vertexstride vkdevicesize)
  (maxvertex :uint32)
  (indextype vkindextype)
  (indexdata (:union vkdeviceorhostaddressconstkhr))
  (transformdata (:union vkdeviceorhostaddressconstkhr)))

(cffi:defcstruct vkaccelerationstructuregeometryaabbsdatakhr
  (stype vkstructuretype)
  (pnext :pointer)
  (data (:union vkdeviceorhostaddressconstkhr))
  (stride vkdevicesize))

(cffi:defcstruct vkaccelerationstructuregeometryinstancesdatakhr
  (stype vkstructuretype)
  (pnext :pointer)
  (arrayofpointers vkbool32)
  (data (:union vkdeviceorhostaddressconstkhr)))

(cffi:defcunion vkaccelerationstructuregeometrydatakhr
  (triangles (:struct vkaccelerationstructuregeometrytrianglesdatakhr))
  (aabbs (:struct vkaccelerationstructuregeometryaabbsdatakhr))
  (instances (:struct vkaccelerationstructuregeometryinstancesdatakhr)))

(cffi:defcstruct vkaccelerationstructuregeometrykhr
  (stype vkstructuretype)
  (pnext :pointer)
  (geometrytype vkgeometrytypekhr)
  (geometry (:union vkaccelerationstructuregeometrydatakhr))
  (flags vkgeometryflagskhr))

(cffi:defcstruct vkaccelerationstructurebuildgeometryinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (type vkaccelerationstructuretypekhr)
  (flags vkbuildaccelerationstructureflagskhr)
  (mode vkbuildaccelerationstructuremodekhr)
  (srcaccelerationstructure vkaccelerationstructurekhr)
  (dstaccelerationstructure vkaccelerationstructurekhr)
  (geometrycount :uint32)
  (pgeometries :pointer)
  (ppgeometries :pointer)
  (scratchdata (:union vkdeviceorhostaddresskhr)))

(cffi:defcstruct vkaccelerationstructurecreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (createflags vkaccelerationstructurecreateflagskhr)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (size vkdevicesize)
  (type vkaccelerationstructuretypekhr)
  (deviceaddress vkdeviceaddress))

(cffi:defcstruct vkwritedescriptorsetaccelerationstructurekhr
  (stype vkstructuretype)
  (pnext :pointer)
  (accelerationstructurecount :uint32)
  (paccelerationstructures :pointer))

(cffi:defcstruct vkphysicaldeviceaccelerationstructurefeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (accelerationstructure vkbool32)
  (accelerationstructurecapturereplay vkbool32)
  (accelerationstructureindirectbuild vkbool32)
  (accelerationstructurehostcommands vkbool32)
  (descriptorbindingaccelerationstructureupdateafterbind vkbool32))

(cffi:defcstruct vkphysicaldeviceaccelerationstructurepropertieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (maxgeometrycount :uint64)
  (maxinstancecount :uint64)
  (maxprimitivecount :uint64)
  (maxperstagedescriptoraccelerationstructures :uint32)
  (maxperstagedescriptorupdateafterbindaccelerationstructures :uint32)
  (maxdescriptorsetaccelerationstructures :uint32)
  (maxdescriptorsetupdateafterbindaccelerationstructures :uint32)
  (minaccelerationstructurescratchoffsetalignment :uint32))

(cffi:defcstruct vkaccelerationstructuredeviceaddressinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (accelerationstructure vkaccelerationstructurekhr))

(cffi:defcstruct vkaccelerationstructureversioninfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (pversiondata :pointer))

(cffi:defcstruct vkcopyaccelerationstructuretomemoryinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (src vkaccelerationstructurekhr)
  (dst (:union vkdeviceorhostaddresskhr))
  (mode vkcopyaccelerationstructuremodekhr))

(cffi:defcstruct vkcopymemorytoaccelerationstructureinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (src (:union vkdeviceorhostaddressconstkhr))
  (dst vkaccelerationstructurekhr)
  (mode vkcopyaccelerationstructuremodekhr))

(cffi:defcstruct vkcopyaccelerationstructureinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (src vkaccelerationstructurekhr)
  (dst vkaccelerationstructurekhr)
  (mode vkcopyaccelerationstructuremodekhr))

(cffi:defcstruct vkaccelerationstructurebuildsizesinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (accelerationstructuresize vkdevicesize)
  (updatescratchsize vkdevicesize)
  (buildscratchsize vkdevicesize))

(cffi:defctype pfn_vkcreateaccelerationstructurekhr :pointer)

(cffi:defctype pfn_vkdestroyaccelerationstructurekhr :pointer)

(cffi:defctype pfn_vkcmdbuildaccelerationstructureskhr :pointer)

(cffi:defctype pfn_vkcmdbuildaccelerationstructuresindirectkhr :pointer)

(cffi:defctype pfn_vkbuildaccelerationstructureskhr :pointer)

(cffi:defctype pfn_vkcopyaccelerationstructurekhr :pointer)

(cffi:defctype pfn_vkcopyaccelerationstructuretomemorykhr :pointer)

(cffi:defctype pfn_vkcopymemorytoaccelerationstructurekhr :pointer)

(cffi:defctype pfn_vkwriteaccelerationstructurespropertieskhr :pointer)

(cffi:defctype pfn_vkcmdcopyaccelerationstructurekhr :pointer)

(cffi:defctype pfn_vkcmdcopyaccelerationstructuretomemorykhr :pointer)

(cffi:defctype pfn_vkcmdcopymemorytoaccelerationstructurekhr :pointer)

(cffi:defctype pfn_vkgetaccelerationstructuredeviceaddresskhr :pointer)

(cffi:defctype pfn_vkcmdwriteaccelerationstructurespropertieskhr :pointer)

(cffi:defctype pfn_vkgetdeviceaccelerationstructurecompatibilitykhr :pointer)

(cffi:defctype pfn_vkgetaccelerationstructurebuildsizeskhr :pointer)

(cffi:defcstruct vkraytracingshadergroupcreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (type vkraytracingshadergrouptypekhr)
  (generalshader :uint32)
  (closesthitshader :uint32)
  (anyhitshader :uint32)
  (intersectionshader :uint32)
  (pshadergroupcapturereplayhandle :pointer))

(cffi:defcstruct vkraytracingpipelineinterfacecreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (maxpipelineraypayloadsize :uint32)
  (maxpipelinerayhitattributesize :uint32))

(cffi:defcstruct vkraytracingpipelinecreateinfokhr
  (stype vkstructuretype)
  (pnext :pointer)
  (flags vkpipelinecreateflags)
  (stagecount :uint32)
  (pstages :pointer)
  (groupcount :uint32)
  (pgroups :pointer)
  (maxpipelinerayrecursiondepth :uint32)
  (plibraryinfo :pointer)
  (plibraryinterface :pointer)
  (pdynamicstate :pointer)
  (layout vkpipelinelayout)
  (basepipelinehandle vkpipeline)
  (basepipelineindex :int32))

(cffi:defcstruct vkphysicaldeviceraytracingpipelinefeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (raytracingpipeline vkbool32)
  (raytracingpipelineshadergrouphandlecapturereplay vkbool32)
  (raytracingpipelineshadergrouphandlecapturereplaymixed vkbool32)
  (raytracingpipelinetraceraysindirect vkbool32)
  (raytraversalprimitiveculling vkbool32))

(cffi:defcstruct vkphysicaldeviceraytracingpipelinepropertieskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (shadergrouphandlesize :uint32)
  (maxrayrecursiondepth :uint32)
  (maxshadergroupstride :uint32)
  (shadergroupbasealignment :uint32)
  (shadergrouphandlecapturereplaysize :uint32)
  (maxraydispatchinvocationcount :uint32)
  (shadergrouphandlealignment :uint32)
  (maxrayhitattributesize :uint32))

(cffi:defcstruct vkstrideddeviceaddressregionkhr
  (deviceaddress vkdeviceaddress)
  (stride vkdevicesize)
  (size vkdevicesize))

(cffi:defcstruct vktraceraysindirectcommandkhr
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(cffi:defctype pfn_vkcmdtracerayskhr :pointer)

(cffi:defctype pfn_vkcreateraytracingpipelineskhr :pointer)

(cffi:defctype pfn_vkgetraytracingcapturereplayshadergrouphandleskhr :pointer)

(cffi:defctype pfn_vkcmdtraceraysindirectkhr :pointer)

(cffi:defctype pfn_vkgetraytracingshadergroupstacksizekhr :pointer)

(cffi:defctype pfn_vkcmdsetraytracingpipelinestacksizekhr :pointer)

(cffi:defcstruct vkphysicaldevicerayqueryfeatureskhr
  (stype vkstructuretype)
  (pnext :pointer)
  (rayquery vkbool32))