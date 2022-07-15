
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
  (pnext (:pointer (:struct vkbaseinstructure))))

(cffi:defcstruct vkbaseoutstructure
  (stype vkstructuretype)
  (pnext (:pointer (:struct vkbaseoutstructure))))

(cffi:defcstruct vkbuffermemorybarrier
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (srcaccessmask vkaccessflags)
  (dstaccessmask vkaccessflags))

(cffi:defcstruct vkpipelinecacheheaderversionone
  (headersize :uint32)
  (headerversion vkpipelinecacheheaderversion)
  (vendorid :uint32)
  (deviceid :uint32)
  (pipelinecacheuuid :uint8 :count vk_uuid_size))

(cffi:defcstruct vkallocationcallbacks
  (puserdata (:pointer :void))
  (pfnallocation :pfn_vkallocationfunction)
  (pfnreallocation :pfn_vkreallocationfunction)
  (pfnfree :pfn_vkfreefunction)
  (pfninternalallocation :pfn_vkinternalallocationnotification)
  (pfninternalfree :pfn_vkinternalfreenotification))

(cffi:defcstruct vkapplicationinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (papplicationname (:pointer :char))
  (applicationversion :uint32)
  (penginename (:pointer :char))
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
  (pnext (:pointer :void))
  (flags vkinstancecreateflags)
  (papplicationinfo (:pointer (:struct vkapplicationinfo)))
  (enabledlayercount :uint32)
  (ppenabledlayernames (:pointer :char))
  (enabledextensioncount :uint32)
  (ppenabledextensionnames (:pointer :char)))

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
  (maxcomputeworkgroupcount :uint32 :count 3)
  (maxcomputeworkgroupinvocations :uint32)
  (maxcomputeworkgroupsize :uint32 :count 3)
  (subpixelprecisionbits :uint32)
  (subtexelprecisionbits :uint32)
  (mipmapprecisionbits :uint32)
  (maxdrawindexedindexvalue :uint32)
  (maxdrawindirectcount :uint32)
  (maxsamplerlodbias :float)
  (maxsampleranisotropy :float)
  (maxviewports :uint32)
  (maxviewportdimensions :uint32 :count 2)
  (viewportboundsrange :float :count 2)
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
  (pointsizerange :float :count 2)
  (linewidthrange :float :count 2)
  (pointsizegranularity :float)
  (linewidthgranularity :float)
  (strictlines vkbool32)
  (standardsamplelocations vkbool32)
  (optimalbuffercopyoffsetalignment vkdevicesize)
  (optimalbuffercopyrowpitchalignment vkdevicesize)
  (noncoherentatomsize vkdevicesize))

(cffi:defcstruct vkphysicaldevicememoryproperties
  (memorytypecount :uint32)
  (memorytypes (:struct vkmemorytype) :count vk_max_memoryypes)
  (memoryheapcount :uint32)
  (memoryheaps (:struct vkmemoryheap) :count vk_max_memory_heaps))

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
  (devicename :char :count vk_max_physical_device_name_size)
  (pipelinecacheuuid :uint8 :count vk_uuid_size)
  (limits (:struct vkphysicaldevicelimits))
  (sparseproperties (:struct vkphysicaldevicesparseproperties)))

(cffi:defcstruct vkqueuefamilyproperties
  (queueflags vkqueueflags)
  (queuecount :uint32)
  (timestampvalidbits :uint32)
  (minimagetransfergranularity (:struct vkextent3d)))

(cffi:defcstruct vkdevicequeuecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdevicequeuecreateflags)
  (queuefamilyindex :uint32)
  (queuecount :uint32)
  (pqueuepriorities (:pointer :float)))

(cffi:defcstruct vkdevicecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdevicecreateflags)
  (queuecreateinfocount :uint32)
  (pqueuecreateinfos (:pointer (:struct vkdevicequeuecreateinfo)))
  (enabledlayercount :uint32)
  (ppenabledlayernames (:pointer :char))
  (enabledextensioncount :uint32)
  (ppenabledextensionnames (:pointer :char))
  (penabledfeatures (:pointer (:struct vkphysicaldevicefeatures))))

(cffi:defcstruct vkextensionproperties
  (extensionname :char :count vk_max_extension_name_size)
  (specversion :uint32))

(cffi:defcstruct vklayerproperties
  (layername :char :count vk_max_extension_name_size)
  (specversion :uint32)
  (implementationversion :uint32)
  (description :char :count vk_max_description_size))

(cffi:defcstruct vksubmitinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (waitsemaphorecount :uint32)
  (pwaitsemaphores (:pointer vksemaphore))
  (pwaitdststagemask (:pointer vkpipelinestageflags))
  (commandbuffercount :uint32)
  (pcommandbuffers (:pointer vkcommandbuffer))
  (signalsemaphorecount :uint32)
  (psignalsemaphores (:pointer vksemaphore)))

(cffi:defcstruct vkmappedmemoryrange
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (memory vkdevicememory)
  (offset vkdevicesize)
  (size vkdevicesize))

(cffi:defcstruct vkmemoryallocateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pbinds (:pointer (:struct vksparsememorybind))))

(cffi:defcstruct vksparseimageopaquememorybindinfo
  (image vkimage)
  (bindcount :uint32)
  (pbinds (:pointer (:struct vksparsememorybind))))

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
  (pbinds (:pointer (:struct vksparseimagememorybind))))

(cffi:defcstruct vkbindsparseinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (waitsemaphorecount :uint32)
  (pwaitsemaphores (:pointer vksemaphore))
  (bufferbindcount :uint32)
  (pbufferbinds (:pointer (:struct vksparsebuffermemorybindinfo)))
  (imageopaquebindcount :uint32)
  (pimageopaquebinds (:pointer (:struct vksparseimageopaquememorybindinfo)))
  (imagebindcount :uint32)
  (pimagebinds (:pointer (:struct vksparseimagememorybindinfo)))
  (signalsemaphorecount :uint32)
  (psignalsemaphores (:pointer vksemaphore)))

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
  (pnext (:pointer :void))
  (flags vkfencecreateflags))

(cffi:defcstruct vksemaphorecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vksemaphorecreateflags))

(cffi:defcstruct vkeventcreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkeventcreateflags))

(cffi:defcstruct vkquerypoolcreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkquerypoolcreateflags)
  (querytype vkquerytype)
  (querycount :uint32)
  (pipelinestatistics vkquerypipelinestatisticflags))

(cffi:defcstruct vkbuffercreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkbuffercreateflags)
  (size vkdevicesize)
  (usage vkbufferusageflags)
  (sharingmode vksharingmode)
  (queuefamilyindexcount :uint32)
  (pqueuefamilyindices (:pointer :uint32)))

(cffi:defcstruct vkbufferviewcreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkbufferviewcreateflags)
  (buffer vkbuffer)
  (format vkformat)
  (offset vkdevicesize)
  (range vkdevicesize))

(cffi:defcstruct vkimagecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pqueuefamilyindices (:pointer :uint32))
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
  (pnext (:pointer :void))
  (flags vkimageviewcreateflags)
  (image vkimage)
  (viewtype vkimageviewtype)
  (format vkformat)
  (components (:struct vkcomponentmapping))
  (subresourcerange (:struct vkimagesubresourcerange)))

(cffi:defcstruct vkshadermodulecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkshadermodulecreateflags)
  (codesize :size)
  (pcode (:pointer :uint32)))

(cffi:defcstruct vkpipelinecachecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelinecachecreateflags)
  (initialdatasize :size)
  (pinitialdata (:pointer :void)))

(cffi:defcstruct vkspecializationmapentry
  (constantid :uint32)
  (offset :uint32)
  (size :size))

(cffi:defcstruct vkspecializationinfo
  (mapentrycount :uint32)
  (pmapentries (:pointer (:struct vkspecializationmapentry)))
  (datasize :size)
  (pdata (:pointer :void)))

(cffi:defcstruct vkpipelineshaderstagecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelineshaderstagecreateflags)
  (stage vkshaderstageflagbits)
  (module vkshadermodule)
  (pname (:pointer :char))
  (pspecializationinfo (:pointer (:struct vkspecializationinfo))))

(cffi:defcstruct vkcomputepipelinecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (flags vkpipelinevertexinputstatecreateflags)
  (vertexbindingdescriptioncount :uint32)
  (pvertexbindingdescriptions
   (:pointer (:struct vkvertexinputbindingdescription)))
  (vertexattributedescriptioncount :uint32)
  (pvertexattributedescriptions
   (:pointer (:struct vkvertexinputattributedescription))))

(cffi:defcstruct vkpipelineinputassemblystatecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelineinputassemblystatecreateflags)
  (topology vkprimitivetopology)
  (primitiverestartenable vkbool32))

(cffi:defcstruct vkpipelinetessellationstatecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (flags vkpipelineviewportstatecreateflags)
  (viewportcount :uint32)
  (pviewports (:pointer (:struct vkviewport)))
  (scissorcount :uint32)
  (pscissors (:pointer (:struct vkrect2d))))

(cffi:defcstruct vkpipelinerasterizationstatecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (flags vkpipelinemultisamplestatecreateflags)
  (rasterizationsamples vksamplecountflagbits)
  (sampleshadingenable vkbool32)
  (minsampleshading :float)
  (psamplemask (:pointer vksamplemask))
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
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (flags vkpipelinecolorblendstatecreateflags)
  (logicopenable vkbool32)
  (logicop vklogicop)
  (attachmentcount :uint32)
  (pattachments (:pointer (:struct vkpipelinecolorblendattachmentstate)))
  (blendconstants :float :count 4))

(cffi:defcstruct vkpipelinedynamicstatecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelinedynamicstatecreateflags)
  (dynamicstatecount :uint32)
  (pdynamicstates (:pointer vkdynamicstate)))

(cffi:defcstruct vkgraphicspipelinecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelinecreateflags)
  (stagecount :uint32)
  (pstages (:pointer (:struct vkpipelineshaderstagecreateinfo)))
  (pvertexinputstate (:pointer (:struct vkpipelinevertexinputstatecreateinfo)))
  (pinputassemblystate
   (:pointer (:struct vkpipelineinputassemblystatecreateinfo)))
  (ptessellationstate
   (:pointer (:struct vkpipelinetessellationstatecreateinfo)))
  (pviewportstate (:pointer (:struct vkpipelineviewportstatecreateinfo)))
  (prasterizationstate
   (:pointer (:struct vkpipelinerasterizationstatecreateinfo)))
  (pmultisamplestate (:pointer (:struct vkpipelinemultisamplestatecreateinfo)))
  (pdepthstencilstate
   (:pointer (:struct vkpipelinedepthstencilstatecreateinfo)))
  (pcolorblendstate (:pointer (:struct vkpipelinecolorblendstatecreateinfo)))
  (pdynamicstate (:pointer (:struct vkpipelinedynamicstatecreateinfo)))
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
  (pnext (:pointer :void))
  (flags vkpipelinelayoutcreateflags)
  (setlayoutcount :uint32)
  (psetlayouts (:pointer vkdescriptorsetlayout))
  (pushconstantrangecount :uint32)
  (ppushconstantranges (:pointer (:struct vkpushconstantrange))))

(cffi:defcstruct vksamplercreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (flags vkdescriptorpoolcreateflags)
  (maxsets :uint32)
  (poolsizecount :uint32)
  (ppoolsizes (:pointer (:struct vkdescriptorpoolsize))))

(cffi:defcstruct vkdescriptorsetallocateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (descriptorpool vkdescriptorpool)
  (descriptorsetcount :uint32)
  (psetlayouts (:pointer vkdescriptorsetlayout)))

(cffi:defcstruct vkdescriptorsetlayoutbinding
  (binding :uint32)
  (descriptortype vkdescriptortype)
  (descriptorcount :uint32)
  (stageflags vkshaderstageflags)
  (pimmutablesamplers (:pointer vksampler)))

(cffi:defcstruct vkdescriptorsetlayoutcreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdescriptorsetlayoutcreateflags)
  (bindingcount :uint32)
  (pbindings (:pointer (:struct vkdescriptorsetlayoutbinding))))

(cffi:defcstruct vkwritedescriptorset
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (dstset vkdescriptorset)
  (dstbinding :uint32)
  (dstarrayelement :uint32)
  (descriptorcount :uint32)
  (descriptortype vkdescriptortype)
  (pimageinfo (:pointer (:struct vkdescriptorimageinfo)))
  (pbufferinfo (:pointer (:struct vkdescriptorbufferinfo)))
  (ptexelbufferview (:pointer vkbufferview)))

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
  (pnext (:pointer :void))
  (flags vkframebuffercreateflags)
  (renderpass vkrenderpass)
  (attachmentcount :uint32)
  (pattachments (:pointer vkimageview))
  (width :uint32)
  (height :uint32)
  (layers :uint32))

(cffi:defcstruct vksubpassdescription
  (flags vksubpassdescriptionflags)
  (pipelinebindpoint vkpipelinebindpoint)
  (inputattachmentcount :uint32)
  (pinputattachments (:pointer (:struct vkattachmentreference)))
  (colorattachmentcount :uint32)
  (pcolorattachments (:pointer (:struct vkattachmentreference)))
  (presolveattachments (:pointer (:struct vkattachmentreference)))
  (pdepthstencilattachment (:pointer (:struct vkattachmentreference)))
  (preserveattachmentcount :uint32)
  (ppreserveattachments (:pointer :uint32)))

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
  (pnext (:pointer :void))
  (flags vkrenderpasscreateflags)
  (attachmentcount :uint32)
  (pattachments (:pointer (:struct vkattachmentdescription)))
  (subpasscount :uint32)
  (psubpasses (:pointer (:struct vksubpassdescription)))
  (dependencycount :uint32)
  (pdependencies (:pointer (:struct vksubpassdependency))))

(cffi:defcstruct vkcommandpoolcreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkcommandpoolcreateflags)
  (queuefamilyindex :uint32))

(cffi:defcstruct vkcommandbufferallocateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (commandpool vkcommandpool)
  (level vkcommandbufferlevel)
  (commandbuffercount :uint32))

(cffi:defcstruct vkcommandbufferinheritanceinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (renderpass vkrenderpass)
  (subpass :uint32)
  (framebuffer vkframebuffer)
  (occlusionqueryenable vkbool32)
  (queryflags vkquerycontrolflags)
  (pipelinestatistics vkquerypipelinestatisticflags))

(cffi:defcstruct vkcommandbufferbegininfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkcommandbufferusageflags)
  (pinheritanceinfo (:pointer (:struct vkcommandbufferinheritanceinfo))))

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

(cffi:defcstruct vkcleardepthstencilvalue
  (depth :float)
  (stencil :uint32))

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
  (srcoffsets (:struct vkoffset3d) :count 2)
  (dstsubresource (:struct vkimagesubresourcelayers))
  (dstoffsets (:struct vkoffset3d) :count 2))

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
  (pnext (:pointer :void))
  (renderpass vkrenderpass)
  (framebuffer vkframebuffer)
  (renderarea (:struct vkrect2d))
  (clearvaluecount :uint32)
  (pclearvalues (:pointer (:union vkclearvalue))))

(cffi:defcstruct vkphysicaldevicesubgroupproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (subgroupsize :uint32)
  (supportedstages vkshaderstageflags)
  (supportedoperations vksubgroupfeatureflags)
  (quadoperationsinallstages vkbool32))

(cffi:defcstruct vkbindbuffermemoryinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (buffer vkbuffer)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize))

(cffi:defcstruct vkbindimagememoryinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (image vkimage)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize))

(cffi:defcstruct vkphysicaldevice16bitstoragefeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (storagebuffer16bitaccess vkbool32)
  (uniformandstoragebuffer16bitaccess vkbool32)
  (storagepushconstant16 vkbool32)
  (storageinputoutput16 vkbool32))

(cffi:defcstruct vkmemorydedicatedrequirements
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (prefersdedicatedallocation vkbool32)
  (requiresdedicatedallocation vkbool32))

(cffi:defcstruct vkmemorydedicatedallocateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (image vkimage)
  (buffer vkbuffer))

(cffi:defcstruct vkmemoryallocateflagsinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkmemoryallocateflags)
  (devicemask :uint32))

(cffi:defcstruct vkdevicegrouprenderpassbegininfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (devicemask :uint32)
  (devicerenderareacount :uint32)
  (pdevicerenderareas (:pointer (:struct vkrect2d))))

(cffi:defcstruct vkdevicegroupcommandbufferbegininfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (devicemask :uint32))

(cffi:defcstruct vkdevicegroupsubmitinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (waitsemaphorecount :uint32)
  (pwaitsemaphoredeviceindices (:pointer :uint32))
  (commandbuffercount :uint32)
  (pcommandbufferdevicemasks (:pointer :uint32))
  (signalsemaphorecount :uint32)
  (psignalsemaphoredeviceindices (:pointer :uint32)))

(cffi:defcstruct vkdevicegroupbindsparseinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (resourcedeviceindex :uint32)
  (memorydeviceindex :uint32))

(cffi:defcstruct vkbindbuffermemorydevicegroupinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (deviceindexcount :uint32)
  (pdeviceindices (:pointer :uint32)))

(cffi:defcstruct vkbindimagememorydevicegroupinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (deviceindexcount :uint32)
  (pdeviceindices (:pointer :uint32))
  (splitinstancebindregioncount :uint32)
  (psplitinstancebindregions (:pointer (:struct vkrect2d))))

(cffi:defcstruct vkphysicaldevicegroupproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (physicaldevicecount :uint32)
  (physicaldevices vkphysicaldevice :count vk_max_device_group_size)
  (subsetallocation vkbool32))

(cffi:defcstruct vkdevicegroupdevicecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (physicaldevicecount :uint32)
  (pphysicaldevices (:pointer vkphysicaldevice)))

(cffi:defcstruct vkbuffermemoryrequirementsinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (buffer vkbuffer))

(cffi:defcstruct vkimagememoryrequirementsinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (image vkimage))

(cffi:defcstruct vkimagesparsememoryrequirementsinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (image vkimage))

(cffi:defcstruct vkmemoryrequirements2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (memoryrequirements (:struct vkmemoryrequirements)))

(cffi:defcstruct vksparseimagememoryrequirements2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (memoryrequirements (:struct vksparseimagememoryrequirements)))

(cffi:defcstruct vkphysicaldevicefeatures2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (features (:struct vkphysicaldevicefeatures)))

(cffi:defcstruct vkphysicaldeviceproperties2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (properties (:struct vkphysicaldeviceproperties)))

(cffi:defcstruct vkformatproperties2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (formatproperties (:struct vkformatproperties)))

(cffi:defcstruct vkimageformatproperties2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imageformatproperties (:struct vkimageformatproperties)))

(cffi:defcstruct vkphysicaldeviceimageformatinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (format vkformat)
  (type vkimagetype)
  (tiling vkimagetiling)
  (usage vkimageusageflags)
  (flags vkimagecreateflags))

(cffi:defcstruct vkqueuefamilyproperties2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (queuefamilyproperties (:struct vkqueuefamilyproperties)))

(cffi:defcstruct vkphysicaldevicememoryproperties2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (memoryproperties (:struct vkphysicaldevicememoryproperties)))

(cffi:defcstruct vksparseimageformatproperties2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (properties (:struct vksparseimageformatproperties)))

(cffi:defcstruct vkphysicaldevicesparseimageformatinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (format vkformat)
  (type vkimagetype)
  (samples vksamplecountflagbits)
  (usage vkimageusageflags)
  (tiling vkimagetiling))

(cffi:defcstruct vkphysicaldevicepointclippingproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pointclippingbehavior vkpointclippingbehavior))

(cffi:defcstruct vkinputattachmentaspectreference
  (subpass :uint32)
  (inputattachmentindex :uint32)
  (aspectmask vkimageaspectflags))

(cffi:defcstruct vkrenderpassinputattachmentaspectcreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (aspectreferencecount :uint32)
  (paspectreferences (:pointer (:struct vkinputattachmentaspectreference))))

(cffi:defcstruct vkimageviewusagecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (usage vkimageusageflags))

(cffi:defcstruct vkpipelinetessellationdomainoriginstatecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (domainorigin vktessellationdomainorigin))

(cffi:defcstruct vkrenderpassmultiviewcreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (subpasscount :uint32)
  (pviewmasks (:pointer :uint32))
  (dependencycount :uint32)
  (pviewoffsets (:pointer :int32))
  (correlationmaskcount :uint32)
  (pcorrelationmasks (:pointer :uint32)))

(cffi:defcstruct vkphysicaldevicemultiviewfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (multiview vkbool32)
  (multiviewgeometryshader vkbool32)
  (multiviewtessellationshader vkbool32))

(cffi:defcstruct vkphysicaldevicemultiviewproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxmultiviewviewcount :uint32)
  (maxmultiviewinstanceindex :uint32))

(cffi:defcstruct vkphysicaldevicevariablepointersfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (variablepointersstoragebuffer vkbool32)
  (variablepointers vkbool32))

(cffi:defcstruct vkphysicaldeviceprotectedmemoryfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (protectedmemory vkbool32))

(cffi:defcstruct vkphysicaldeviceprotectedmemoryproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (protectednofault vkbool32))

(cffi:defcstruct vkdevicequeueinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdevicequeuecreateflags)
  (queuefamilyindex :uint32)
  (queueindex :uint32))

(cffi:defcstruct vkprotectedsubmitinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (protectedsubmit vkbool32))

(cffi:defcstruct vksamplerycbcrconversioncreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (conversion vksamplerycbcrconversion))

(cffi:defcstruct vkbindimageplanememoryinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (planeaspect vkimageaspectflagbits))

(cffi:defcstruct vkimageplanememoryrequirementsinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (planeaspect vkimageaspectflagbits))

(cffi:defcstruct vkphysicaldevicesamplerycbcrconversionfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (samplerycbcrconversion vkbool32))

(cffi:defcstruct vksamplerycbcrconversionimageformatproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (flags vkdescriptorupdatetemplatecreateflags)
  (descriptorupdateentrycount :uint32)
  (pdescriptorupdateentries
   (:pointer (:struct vkdescriptorupdatetemplateentry)))
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
  (pnext (:pointer :void))
  (handletype vkexternalmemoryhandletypeflagbits))

(cffi:defcstruct vkexternalimageformatproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (externalmemoryproperties (:struct vkexternalmemoryproperties)))

(cffi:defcstruct vkphysicaldeviceexternalbufferinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkbuffercreateflags)
  (usage vkbufferusageflags)
  (handletype vkexternalmemoryhandletypeflagbits))

(cffi:defcstruct vkexternalbufferproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (externalmemoryproperties (:struct vkexternalmemoryproperties)))

(cffi:defcstruct vkphysicaldeviceidproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (deviceuuid :uint8 :count vk_uuid_size)
  (driveruuid :uint8 :count vk_uuid_size)
  (deviceluid :uint8 :count vk_luid_size)
  (devicenodemask :uint32)
  (deviceluidvalid vkbool32))

(cffi:defcstruct vkexternalmemoryimagecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletypes vkexternalmemoryhandletypeflags))

(cffi:defcstruct vkexternalmemorybuffercreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletypes vkexternalmemoryhandletypeflags))

(cffi:defcstruct vkexportmemoryallocateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletypes vkexternalmemoryhandletypeflags))

(cffi:defcstruct vkphysicaldeviceexternalfenceinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletype vkexternalfencehandletypeflagbits))

(cffi:defcstruct vkexternalfenceproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (exportfromimportedhandletypes vkexternalfencehandletypeflags)
  (compatiblehandletypes vkexternalfencehandletypeflags)
  (externalfencefeatures vkexternalfencefeatureflags))

(cffi:defcstruct vkexportfencecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletypes vkexternalfencehandletypeflags))

(cffi:defcstruct vkexportsemaphorecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletypes vkexternalsemaphorehandletypeflags))

(cffi:defcstruct vkphysicaldeviceexternalsemaphoreinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletype vkexternalsemaphorehandletypeflagbits))

(cffi:defcstruct vkexternalsemaphoreproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (exportfromimportedhandletypes vkexternalsemaphorehandletypeflags)
  (compatiblehandletypes vkexternalsemaphorehandletypeflags)
  (externalsemaphorefeatures vkexternalsemaphorefeatureflags))

(cffi:defcstruct vkphysicaldevicemaintenance3properties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxpersetdescriptors :uint32)
  (maxmemoryallocationsize vkdevicesize))

(cffi:defcstruct vkdescriptorsetlayoutsupport
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (supported vkbool32))

(cffi:defcstruct vkphysicaldeviceshaderdrawparametersfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shaderdrawparameters vkbool32))

(cffi:defcstruct vkphysicaldevicevulkan11features
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (deviceuuid :uint8 :count vk_uuid_size)
  (driveruuid :uint8 :count vk_uuid_size)
  (deviceluid :uint8 :count vk_luid_size)
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
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (driverid vkdriverid)
  (drivername :char :count vk_max_driver_name_size)
  (driverinfo :char :count vk_max_driver_info_size)
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
  (pnext (:pointer :void))
  (viewformatcount :uint32)
  (pviewformats (:pointer vkformat)))

(cffi:defcstruct vkattachmentdescription2
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (attachment :uint32)
  (layout vkimagelayout)
  (aspectmask vkimageaspectflags))

(cffi:defcstruct vksubpassdescription2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vksubpassdescriptionflags)
  (pipelinebindpoint vkpipelinebindpoint)
  (viewmask :uint32)
  (inputattachmentcount :uint32)
  (pinputattachments (:pointer (:struct vkattachmentreference2)))
  (colorattachmentcount :uint32)
  (pcolorattachments (:pointer (:struct vkattachmentreference2)))
  (presolveattachments (:pointer (:struct vkattachmentreference2)))
  (pdepthstencilattachment (:pointer (:struct vkattachmentreference2)))
  (preserveattachmentcount :uint32)
  (ppreserveattachments (:pointer :uint32)))

(cffi:defcstruct vksubpassdependency2
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (flags vkrenderpasscreateflags)
  (attachmentcount :uint32)
  (pattachments (:pointer (:struct vkattachmentdescription2)))
  (subpasscount :uint32)
  (psubpasses (:pointer (:struct vksubpassdescription2)))
  (dependencycount :uint32)
  (pdependencies (:pointer (:struct vksubpassdependency2)))
  (correlatedviewmaskcount :uint32)
  (pcorrelatedviewmasks (:pointer :uint32)))

(cffi:defcstruct vksubpassbegininfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (contents vksubpasscontents))

(cffi:defcstruct vksubpassendinfo
  (stype vkstructuretype)
  (pnext (:pointer :void)))

(cffi:defcstruct vkphysicaldevice8bitstoragefeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (storagebuffer8bitaccess vkbool32)
  (uniformandstoragebuffer8bitaccess vkbool32)
  (storagepushconstant8 vkbool32))

(cffi:defcstruct vkphysicaldevicedriverproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (driverid vkdriverid)
  (drivername :char :count vk_max_driver_name_size)
  (driverinfo :char :count vk_max_driver_info_size)
  (conformanceversion (:struct vkconformanceversion)))

(cffi:defcstruct vkphysicaldeviceshaderatomicint64features
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shaderbufferint64atomics vkbool32)
  (shadersharedint64atomics vkbool32))

(cffi:defcstruct vkphysicaldeviceshaderfloat16int8features
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shaderfloat16 vkbool32)
  (shaderint8 vkbool32))

(cffi:defcstruct vkphysicaldevicefloatcontrolsproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (bindingcount :uint32)
  (pbindingflags (:pointer vkdescriptorbindingflags)))

(cffi:defcstruct vkphysicaldevicedescriptorindexingfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (descriptorsetcount :uint32)
  (pdescriptorcounts (:pointer :uint32)))

(cffi:defcstruct vkdescriptorsetvariabledescriptorcountlayoutsupport
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxvariabledescriptorcount :uint32))

(cffi:defcstruct vksubpassdescriptiondepthstencilresolve
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (depthresolvemode vkresolvemodeflagbits)
  (stencilresolvemode vkresolvemodeflagbits)
  (pdepthstencilresolveattachment (:pointer (:struct vkattachmentreference2))))

(cffi:defcstruct vkphysicaldevicedepthstencilresolveproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (supporteddepthresolvemodes vkresolvemodeflags)
  (supportedstencilresolvemodes vkresolvemodeflags)
  (independentresolvenone vkbool32)
  (independentresolve vkbool32))

(cffi:defcstruct vkphysicaldevicescalarblocklayoutfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (scalarblocklayout vkbool32))

(cffi:defcstruct vkimagestencilusagecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (stencilusage vkimageusageflags))

(cffi:defcstruct vksamplerreductionmodecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (reductionmode vksamplerreductionmode))

(cffi:defcstruct vkphysicaldevicesamplerfilterminmaxproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (filterminmaxsinglecomponentformats vkbool32)
  (filterminmaximagecomponentmapping vkbool32))

(cffi:defcstruct vkphysicaldevicevulkanmemorymodelfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (vulkanmemorymodel vkbool32)
  (vulkanmemorymodeldevicescope vkbool32)
  (vulkanmemorymodelavailabilityvisibilitychains vkbool32))

(cffi:defcstruct vkphysicaldeviceimagelessframebufferfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imagelessframebuffer vkbool32))

(cffi:defcstruct vkframebufferattachmentimageinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkimagecreateflags)
  (usage vkimageusageflags)
  (width :uint32)
  (height :uint32)
  (layercount :uint32)
  (viewformatcount :uint32)
  (pviewformats (:pointer vkformat)))

(cffi:defcstruct vkframebufferattachmentscreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (attachmentimageinfocount :uint32)
  (pattachmentimageinfos (:pointer (:struct vkframebufferattachmentimageinfo))))

(cffi:defcstruct vkrenderpassattachmentbegininfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (attachmentcount :uint32)
  (pattachments (:pointer vkimageview)))

(cffi:defcstruct vkphysicaldeviceuniformbufferstandardlayoutfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (uniformbufferstandardlayout vkbool32))

(cffi:defcstruct vkphysicaldeviceshadersubgroupextendedtypesfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shadersubgroupextendedtypes vkbool32))

(cffi:defcstruct vkphysicaldeviceseparatedepthstencillayoutsfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (separatedepthstencillayouts vkbool32))

(cffi:defcstruct vkattachmentreferencestencillayout
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (stencillayout vkimagelayout))

(cffi:defcstruct vkattachmentdescriptionstencillayout
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (stencilinitiallayout vkimagelayout)
  (stencilfinallayout vkimagelayout))

(cffi:defcstruct vkphysicaldevicehostqueryresetfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (hostqueryreset vkbool32))

(cffi:defcstruct vkphysicaldevicetimelinesemaphorefeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (timelinesemaphore vkbool32))

(cffi:defcstruct vkphysicaldevicetimelinesemaphoreproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxtimelinesemaphorevaluedifference :uint64))

(cffi:defcstruct vksemaphoretypecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (semaphoretype vksemaphoretype)
  (initialvalue :uint64))

(cffi:defcstruct vktimelinesemaphoresubmitinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (waitsemaphorevaluecount :uint32)
  (pwaitsemaphorevalues (:pointer :uint64))
  (signalsemaphorevaluecount :uint32)
  (psignalsemaphorevalues (:pointer :uint64)))

(cffi:defcstruct vksemaphorewaitinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vksemaphorewaitflags)
  (semaphorecount :uint32)
  (psemaphores (:pointer vksemaphore))
  (pvalues (:pointer :uint64)))

(cffi:defcstruct vksemaphoresignalinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (semaphore vksemaphore)
  (value :uint64))

(cffi:defcstruct vkphysicaldevicebufferdeviceaddressfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (bufferdeviceaddress vkbool32)
  (bufferdeviceaddresscapturereplay vkbool32)
  (bufferdeviceaddressmultidevice vkbool32))

(cffi:defcstruct vkbufferdeviceaddressinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (buffer vkbuffer))

(cffi:defcstruct vkbufferopaquecaptureaddresscreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (opaquecaptureaddress :uint64))

(cffi:defcstruct vkmemoryopaquecaptureaddressallocateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (opaquecaptureaddress :uint64))

(cffi:defcstruct vkdevicememoryopaquecaptureaddressinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (memory vkdevicememory))

(cffi:defcstruct vkphysicaldevicevulkan13features
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (ppipelinecreationfeedback (:pointer (:struct vkpipelinecreationfeedback)))
  (pipelinestagecreationfeedbackcount :uint32)
  (ppipelinestagecreationfeedbacks
   (:pointer (:struct vkpipelinecreationfeedback))))

(cffi:defcstruct vkphysicaldeviceshaderterminateinvocationfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shaderterminateinvocation vkbool32))

(cffi:defcstruct vkphysicaldevicetoolproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (name :char :count vk_max_extension_name_size)
  (version :char :count vk_max_extension_name_size)
  (purposes vktoolpurposeflags)
  (description :char :count vk_max_description_size)
  (layer :char :count vk_max_extension_name_size))

(cffi:defcstruct vkphysicaldeviceshaderdemotetohelperinvocationfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shaderdemotetohelperinvocation vkbool32))

(cffi:defcstruct vkphysicaldeviceprivatedatafeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (privatedata vkbool32))

(cffi:defcstruct vkdeviceprivatedatacreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (privatedataslotrequestcount :uint32))

(cffi:defcstruct vkprivatedataslotcreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkprivatedataslotcreateflags))

(cffi:defcstruct vkphysicaldevicepipelinecreationcachecontrolfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pipelinecreationcachecontrol vkbool32))

(cffi:defcstruct vkmemorybarrier2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcstagemask vkpipelinestageflags2)
  (srcaccessmask vkaccessflags2)
  (dststagemask vkpipelinestageflags2)
  (dstaccessmask vkaccessflags2))

(cffi:defcstruct vkbuffermemorybarrier2
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (dependencyflags vkdependencyflags)
  (memorybarriercount :uint32)
  (pmemorybarriers (:pointer (:struct vkmemorybarrier2)))
  (buffermemorybarriercount :uint32)
  (pbuffermemorybarriers (:pointer (:struct vkbuffermemorybarrier2)))
  (imagememorybarriercount :uint32)
  (pimagememorybarriers (:pointer (:struct vkimagememorybarrier2))))

(cffi:defcstruct vksemaphoresubmitinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (semaphore vksemaphore)
  (value :uint64)
  (stagemask vkpipelinestageflags2)
  (deviceindex :uint32))

(cffi:defcstruct vkcommandbuffersubmitinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (commandbuffer vkcommandbuffer)
  (devicemask :uint32))

(cffi:defcstruct vksubmitinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vksubmitflags)
  (waitsemaphoreinfocount :uint32)
  (pwaitsemaphoreinfos (:pointer (:struct vksemaphoresubmitinfo)))
  (commandbufferinfocount :uint32)
  (pcommandbufferinfos (:pointer (:struct vkcommandbuffersubmitinfo)))
  (signalsemaphoreinfocount :uint32)
  (psignalsemaphoreinfos (:pointer (:struct vksemaphoresubmitinfo))))

(cffi:defcstruct vkphysicaldevicesynchronization2features
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (synchronization2 vkbool32))

(cffi:defcstruct vkphysicaldevicezeroinitializeworkgroupmemoryfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shaderzeroinitializeworkgroupmemory vkbool32))

(cffi:defcstruct vkphysicaldeviceimagerobustnessfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (robustimageaccess vkbool32))

(cffi:defcstruct vkbuffercopy2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcoffset vkdevicesize)
  (dstoffset vkdevicesize)
  (size vkdevicesize))

(cffi:defcstruct vkcopybufferinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcbuffer vkbuffer)
  (dstbuffer vkbuffer)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkbuffercopy2))))

(cffi:defcstruct vkimagecopy2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcsubresource (:struct vkimagesubresourcelayers))
  (srcoffset (:struct vkoffset3d))
  (dstsubresource (:struct vkimagesubresourcelayers))
  (dstoffset (:struct vkoffset3d))
  (extent (:struct vkextent3d)))

(cffi:defcstruct vkcopyimageinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkimagecopy2))))

(cffi:defcstruct vkbufferimagecopy2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (bufferoffset vkdevicesize)
  (bufferrowlength :uint32)
  (bufferimageheight :uint32)
  (imagesubresource (:struct vkimagesubresourcelayers))
  (imageoffset (:struct vkoffset3d))
  (imageextent (:struct vkextent3d)))

(cffi:defcstruct vkcopybuffertoimageinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcbuffer vkbuffer)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkbufferimagecopy2))))

(cffi:defcstruct vkcopyimagetobufferinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstbuffer vkbuffer)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkbufferimagecopy2))))

(cffi:defcstruct vkimageblit2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcsubresource (:struct vkimagesubresourcelayers))
  (srcoffsets (:struct vkoffset3d) :count 2)
  (dstsubresource (:struct vkimagesubresourcelayers))
  (dstoffsets (:struct vkoffset3d) :count 2))

(cffi:defcstruct vkblitimageinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkimageblit2)))
  (filter vkfilter))

(cffi:defcstruct vkimageresolve2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcsubresource (:struct vkimagesubresourcelayers))
  (srcoffset (:struct vkoffset3d))
  (dstsubresource (:struct vkimagesubresourcelayers))
  (dstoffset (:struct vkoffset3d))
  (extent (:struct vkextent3d)))

(cffi:defcstruct vkresolveimageinfo2
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcimage vkimage)
  (srcimagelayout vkimagelayout)
  (dstimage vkimage)
  (dstimagelayout vkimagelayout)
  (regioncount :uint32)
  (pregions (:pointer (:struct vkimageresolve2))))

(cffi:defcstruct vkphysicaldevicesubgroupsizecontrolfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (subgroupsizecontrol vkbool32)
  (computefullsubgroups vkbool32))

(cffi:defcstruct vkphysicaldevicesubgroupsizecontrolproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (minsubgroupsize :uint32)
  (maxsubgroupsize :uint32)
  (maxcomputeworkgroupsubgroups :uint32)
  (requiredsubgroupsizestages vkshaderstageflags))

(cffi:defcstruct vkpipelineshaderstagerequiredsubgroupsizecreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (requiredsubgroupsize :uint32))

(cffi:defcstruct vkphysicaldeviceinlineuniformblockfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (inlineuniformblock vkbool32)
  (descriptorbindinginlineuniformblockupdateafterbind vkbool32))

(cffi:defcstruct vkphysicaldeviceinlineuniformblockproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxinlineuniformblocksize :uint32)
  (maxperstagedescriptorinlineuniformblocks :uint32)
  (maxperstagedescriptorupdateafterbindinlineuniformblocks :uint32)
  (maxdescriptorsetinlineuniformblocks :uint32)
  (maxdescriptorsetupdateafterbindinlineuniformblocks :uint32))

(cffi:defcstruct vkwritedescriptorsetinlineuniformblock
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (datasize :uint32)
  (pdata (:pointer :void)))

(cffi:defcstruct vkdescriptorpoolinlineuniformblockcreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxinlineuniformblockbindings :uint32))

(cffi:defcstruct vkphysicaldevicetexturecompressionastchdrfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (texturecompressionastc_hdr vkbool32))

(cffi:defcstruct vkrenderingattachmentinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (flags vkrenderingflags)
  (renderarea (:struct vkrect2d))
  (layercount :uint32)
  (viewmask :uint32)
  (colorattachmentcount :uint32)
  (pcolorattachments (:pointer (:struct vkrenderingattachmentinfo)))
  (pdepthattachment (:pointer (:struct vkrenderingattachmentinfo)))
  (pstencilattachment (:pointer (:struct vkrenderingattachmentinfo))))

(cffi:defcstruct vkpipelinerenderingcreateinfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (viewmask :uint32)
  (colorattachmentcount :uint32)
  (pcolorattachmentformats (:pointer vkformat))
  (depthattachmentformat vkformat)
  (stencilattachmentformat vkformat))

(cffi:defcstruct vkphysicaldevicedynamicrenderingfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (dynamicrendering vkbool32))

(cffi:defcstruct vkcommandbufferinheritancerenderinginfo
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkrenderingflags)
  (viewmask :uint32)
  (colorattachmentcount :uint32)
  (pcolorattachmentformats (:pointer vkformat))
  (depthattachmentformat vkformat)
  (stencilattachmentformat vkformat)
  (rasterizationsamples vksamplecountflagbits))

(cffi:defcstruct vkphysicaldeviceshaderintegerdotproductfeatures
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shaderintegerdotproduct vkbool32))

(cffi:defcstruct vkphysicaldeviceshaderintegerdotproductproperties
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (storagetexelbufferoffsetalignmentbytes vkdevicesize)
  (storagetexelbufferoffsetsingletexelalignment vkbool32)
  (uniformtexelbufferoffsetalignmentbytes vkdevicesize)
  (uniformtexelbufferoffsetsingletexelalignment vkbool32))

(cffi:defcstruct vkformatproperties3
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (lineartilingfeatures vkformatfeatureflags2)
  (optimaltilingfeatures vkformatfeatureflags2)
  (bufferfeatures vkformatfeatureflags2))

(cffi:defcstruct vkphysicaldevicemaintenance4features
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maintenance4 vkbool32))

(cffi:defcstruct vkphysicaldevicemaintenance4properties
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxbuffersize vkdevicesize))

(cffi:defcstruct vkdevicebuffermemoryrequirements
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pcreateinfo (:pointer (:struct vkbuffercreateinfo))))

(cffi:defcstruct vkdeviceimagememoryrequirements
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pcreateinfo (:pointer (:struct vkimagecreateinfo)))
  (planeaspect vkimageaspectflagbits))

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

(cffi:defcstruct vkswapchaincreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pqueuefamilyindices (:pointer :uint32))
  (pretransform vksurfacetransformflagbitskhr)
  (compositealpha vkcompositealphaflagbitskhr)
  (presentmode vkpresentmodekhr)
  (clipped vkbool32)
  (oldswapchain vkswapchainkhr))

(cffi:defcstruct vkpresentinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (waitsemaphorecount :uint32)
  (pwaitsemaphores (:pointer vksemaphore))
  (swapchaincount :uint32)
  (pswapchains (:pointer vkswapchainkhr))
  (pimageindices (:pointer :uint32))
  (presults (:pointer vkresult)))

(cffi:defcstruct vkimageswapchaincreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (swapchain vkswapchainkhr))

(cffi:defcstruct vkbindimagememoryswapchaininfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (swapchain vkswapchainkhr)
  (imageindex :uint32))

(cffi:defcstruct vkacquirenextimageinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (swapchain vkswapchainkhr)
  (timeout :uint64)
  (semaphore vksemaphore)
  (fence vkfence)
  (devicemask :uint32))

(cffi:defcstruct vkdevicegrouppresentcapabilitieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (presentmask :uint32 :count vk_max_device_group_size)
  (modes vkdevicegrouppresentmodeflagskhr))

(cffi:defcstruct vkdevicegrouppresentinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (swapchaincount :uint32)
  (pdevicemasks (:pointer :uint32))
  (mode vkdevicegrouppresentmodeflagbitskhr))

(cffi:defcstruct vkdevicegroupswapchaincreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (modes vkdevicegrouppresentmodeflagskhr))

(cffi:defcstruct vkdisplaymodeparameterskhr
  (visibleregion (:struct vkextent2d))
  (refreshrate :uint32))

(cffi:defcstruct vkdisplaymodecreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (displayname (:pointer :char))
  (physicaldimensions (:struct vkextent2d))
  (physicalresolution (:struct vkextent2d))
  (supportedtransforms vksurfacetransformflagskhr)
  (planereorderpossible vkbool32)
  (persistentcontent vkbool32))

(cffi:defcstruct vkdisplaysurfacecreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdisplaysurfacecreateflagskhr)
  (displaymode vkdisplaymodekhr)
  (planeindex :uint32)
  (planestackindex :uint32)
  (transform vksurfacetransformflagbitskhr)
  (globalalpha :float)
  (alphamode vkdisplayplanealphaflagbitskhr)
  (imageextent (:struct vkextent2d)))

(cffi:defcstruct vkdisplaypresentinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcrect (:struct vkrect2d))
  (dstrect (:struct vkrect2d))
  (persistent vkbool32))

(cffi:defcstruct vkrenderingfragmentshadingrateattachmentinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imageview vkimageview)
  (imagelayout vkimagelayout)
  (shadingrateattachmenttexelsize (:struct vkextent2d)))

(cffi:defcstruct vkrenderingfragmentdensitymapattachmentinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imageview vkimageview)
  (imagelayout vkimagelayout))

(cffi:defcstruct vkattachmentsamplecountinfoamd
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (colorattachmentcount :uint32)
  (pcolorattachmentsamples (:pointer vksamplecountflagbits))
  (depthstencilattachmentsamples vksamplecountflagbits))

(cffi:defcstruct vkmultiviewperviewattributesinfonvx
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (perviewattributes vkbool32)
  (perviewattributespositionxonly vkbool32))

(cffi:defcstruct vkimportmemoryfdinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletype vkexternalmemoryhandletypeflagbits)
  (fd :int))

(cffi:defcstruct vkmemoryfdpropertieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (memorytypebits :uint32))

(cffi:defcstruct vkmemorygetfdinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (memory vkdevicememory)
  (handletype vkexternalmemoryhandletypeflagbits))

(cffi:defcstruct vkimportsemaphorefdinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (semaphore vksemaphore)
  (flags vksemaphoreimportflags)
  (handletype vkexternalsemaphorehandletypeflagbits)
  (fd :int))

(cffi:defcstruct vksemaphoregetfdinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (semaphore vksemaphore)
  (handletype vkexternalsemaphorehandletypeflagbits))

(cffi:defcstruct vkphysicaldevicepushdescriptorpropertieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxpushdescriptors :uint32))

(cffi:defcstruct vkrectlayerkhr
  (offset (:struct vkoffset2d))
  (extent (:struct vkextent2d))
  (layer :uint32))

(cffi:defcstruct vkpresentregionkhr
  (rectanglecount :uint32)
  (prectangles (:pointer (:struct vkrectlayerkhr))))

(cffi:defcstruct vkpresentregionskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (swapchaincount :uint32)
  (pregions (:pointer (:struct vkpresentregionkhr))))

(cffi:defcstruct vksharedpresentsurfacecapabilitieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (sharedpresentsupportedusageflags vkimageusageflags))

(cffi:defcstruct vkimportfencefdinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fence vkfence)
  (flags vkfenceimportflags)
  (handletype vkexternalfencehandletypeflagbits)
  (fd :int))

(cffi:defcstruct vkfencegetfdinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fence vkfence)
  (handletype vkexternalfencehandletypeflagbits))

(cffi:defcstruct vkphysicaldeviceperformancequeryfeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (performancecounterquerypools vkbool32)
  (performancecountermultiplequerypools vkbool32))

(cffi:defcstruct vkphysicaldeviceperformancequerypropertieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (allowcommandbufferquerycopies vkbool32))

(cffi:defcstruct vkperformancecounterkhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (unit vkperformancecounterunitkhr)
  (scope vkperformancecounterscopekhr)
  (storage vkperformancecounterstoragekhr)
  (uuid :uint8 :count vk_uuid_size))

(cffi:defcstruct vkperformancecounterdescriptionkhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkperformancecounterdescriptionflagskhr)
  (name :char :count vk_max_description_size)
  (category :char :count vk_max_description_size)
  (description :char :count vk_max_description_size))

(cffi:defcstruct vkquerypoolperformancecreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (queuefamilyindex :uint32)
  (counterindexcount :uint32)
  (pcounterindices (:pointer :uint32)))

(cffi:defcstruct vkacquireprofilinglockinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkacquireprofilinglockflagskhr)
  (timeout :uint64))

(cffi:defcstruct vkperformancequerysubmitinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (counterpassindex :uint32))

(cffi:defcstruct vkphysicaldevicesurfaceinfo2khr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (surface vksurfacekhr))

(cffi:defcstruct vksurfacecapabilities2khr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (surfacecapabilities (:struct vksurfacecapabilitieskhr)))

(cffi:defcstruct vksurfaceformat2khr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (surfaceformat (:struct vksurfaceformatkhr)))

(cffi:defcstruct vkdisplayproperties2khr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (displayproperties (:struct vkdisplaypropertieskhr)))

(cffi:defcstruct vkdisplayplaneproperties2khr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (displayplaneproperties (:struct vkdisplayplanepropertieskhr)))

(cffi:defcstruct vkdisplaymodeproperties2khr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (displaymodeproperties (:struct vkdisplaymodepropertieskhr)))

(cffi:defcstruct vkdisplayplaneinfo2khr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (mode vkdisplaymodekhr)
  (planeindex :uint32))

(cffi:defcstruct vkdisplayplanecapabilities2khr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (capabilities (:struct vkdisplayplanecapabilitieskhr)))

(cffi:defcstruct vkphysicaldeviceshaderclockfeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shadersubgroupclock vkbool32)
  (shaderdeviceclock vkbool32))

(cffi:defcstruct vkdevicequeueglobalprioritycreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (globalpriority vkqueueglobalprioritykhr))

(cffi:defcstruct vkphysicaldeviceglobalpriorityqueryfeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (globalpriorityquery vkbool32))

(cffi:defcstruct vkqueuefamilyglobalprioritypropertieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (prioritycount :uint32)
  (priorities vkqueueglobalprioritykhr :count vk_max_global_priority_size_khr))

(cffi:defcstruct vkfragmentshadingrateattachmentinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pfragmentshadingrateattachment (:pointer (:struct vkattachmentreference2)))
  (shadingrateattachmenttexelsize (:struct vkextent2d)))

(cffi:defcstruct vkpipelinefragmentshadingratestatecreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fragmentsize (:struct vkextent2d))
  (combinerops vkfragmentshadingratecombineropkhr :count 2))

(cffi:defcstruct vkphysicaldevicefragmentshadingratefeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pipelinefragmentshadingrate vkbool32)
  (primitivefragmentshadingrate vkbool32)
  (attachmentfragmentshadingrate vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentshadingratepropertieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (samplecounts vksamplecountflags)
  (fragmentsize (:struct vkextent2d)))

(cffi:defcstruct vksurfaceprotectedcapabilitieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (supportsprotected vkbool32))

(cffi:defcstruct vkphysicaldevicepresentwaitfeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (presentwait vkbool32))

(cffi:defcstruct vkphysicaldevicepipelineexecutablepropertiesfeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pipelineexecutableinfo vkbool32))

(cffi:defcstruct vkpipelineinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pipeline vkpipeline))

(cffi:defcstruct vkpipelineexecutablepropertieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (stages vkshaderstageflags)
  (name :char :count vk_max_description_size)
  (description :char :count vk_max_description_size)
  (subgroupsize :uint32))

(cffi:defcstruct vkpipelineexecutableinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pipeline vkpipeline)
  (executableindex :uint32))

(cffi:defcstruct vkpipelineexecutablestatistickhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (name :char :count vk_max_description_size)
  (description :char :count vk_max_description_size)
  (format vkpipelineexecutablestatisticformatkhr)
  (value (:union vkpipelineexecutablestatisticvaluekhr)))

(cffi:defcstruct vkpipelineexecutableinternalrepresentationkhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (name :char :count vk_max_description_size)
  (description :char :count vk_max_description_size)
  (istext vkbool32)
  (datasize :size)
  (pdata (:pointer :void)))

(cffi:defcstruct vkpipelinelibrarycreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (librarycount :uint32)
  (plibraries (:pointer vkpipeline)))

(cffi:defcstruct vkpresentidkhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (swapchaincount :uint32)
  (ppresentids (:pointer :uint64)))

(cffi:defcstruct vkphysicaldevicepresentidfeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (presentid vkbool32))

(cffi:defcstruct vkqueuefamilycheckpointproperties2nv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (checkpointexecutionstagemask vkpipelinestageflags2))

(cffi:defcstruct vkcheckpointdata2nv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (stage vkpipelinestageflags2)
  (pcheckpointmarker (:pointer :void)))

(cffi:defcstruct vkphysicaldevicefragmentshaderbarycentricfeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fragmentshaderbarycentric vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentshaderbarycentricpropertieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (tristripvertexorderindependentofprovokingvertex vkbool32))

(cffi:defcstruct vkphysicaldeviceshadersubgroupuniformcontrolflowfeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shadersubgroupuniformcontrolflow vkbool32))

(cffi:defcstruct vkphysicaldeviceworkgroupmemoryexplicitlayoutfeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (workgroupmemoryexplicitlayout vkbool32)
  (workgroupmemoryexplicitlayoutscalarblocklayout vkbool32)
  (workgroupmemoryexplicitlayout8bitaccess vkbool32)
  (workgroupmemoryexplicitlayout16bitaccess vkbool32))

(cffi:defcstruct vkphysicaldeviceraytracingmaintenance1featureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
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

(cffi:defcstruct vkdebugreportcallbackcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdebugreportflagsext)
  (pfncallback :pfn_vkdebugreportcallbackext)
  (puserdata (:pointer :void)))

(cffi:defcstruct vkpipelinerasterizationstaterasterizationorderamd
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (rasterizationorder vkrasterizationorderamd))

(cffi:defcstruct vkdebugmarkerobjectnameinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (objecttype vkdebugreportobjecttypeext)
  (object :uint64)
  (pobjectname (:pointer :char)))

(cffi:defcstruct vkdebugmarkerobjecttaginfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (objecttype vkdebugreportobjecttypeext)
  (object :uint64)
  (tagname :uint64)
  (tagsize :size)
  (ptag (:pointer :void)))

(cffi:defcstruct vkdebugmarkermarkerinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pmarkername (:pointer :char))
  (color :float :count 4))

(cffi:defcstruct vkdedicatedallocationimagecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (dedicatedallocation vkbool32))

(cffi:defcstruct vkdedicatedallocationbuffercreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (dedicatedallocation vkbool32))

(cffi:defcstruct vkdedicatedallocationmemoryallocateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (image vkimage)
  (buffer vkbuffer))

(cffi:defcstruct vkphysicaldevicetransformfeedbackfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (transformfeedback vkbool32)
  (geometrystreams vkbool32))

(cffi:defcstruct vkphysicaldevicetransformfeedbackpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (flags vkpipelinerasterizationstatestreamcreateflagsext)
  (rasterizationstream :uint32))

(cffi:defcstruct vkcumodulecreateinfonvx
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (datasize :size)
  (pdata (:pointer :void)))

(cffi:defcstruct vkcufunctioncreateinfonvx
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (module vkcumodulenvx)
  (pname (:pointer :char)))

(cffi:defcstruct vkculaunchinfonvx
  (stype vkstructuretype)
  (pnext (:pointer :void))
  #'vkcufunctionnvx
  (griddimx :uint32)
  (griddimy :uint32)
  (griddimz :uint32)
  (blockdimx :uint32)
  (blockdimy :uint32)
  (blockdimz :uint32)
  (sharedmembytes :uint32)
  (paramcount :size)
  (pparams (:pointer :void))
  (extracount :size)
  (pextras (:pointer :void)))

(cffi:defcstruct vkimageviewhandleinfonvx
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imageview vkimageview)
  (descriptortype vkdescriptortype)
  (sampler vksampler))

(cffi:defcstruct vkimageviewaddresspropertiesnvx
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (deviceaddress vkdeviceaddress)
  (size vkdevicesize))

(cffi:defcstruct vktexturelodgatherformatpropertiesamd
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (computeworkgroupsize :uint32 :count 3))

(cffi:defcstruct vkphysicaldevicecornersampledimagefeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (cornersampledimage vkbool32))

(cffi:defcstruct vkexternalimageformatpropertiesnv
  (imageformatproperties (:struct vkimageformatproperties))
  (externalmemoryfeatures vkexternalmemoryfeatureflagsnv)
  (exportfromimportedhandletypes vkexternalmemoryhandletypeflagsnv)
  (compatiblehandletypes vkexternalmemoryhandletypeflagsnv))

(cffi:defcstruct vkexternalmemoryimagecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletypes vkexternalmemoryhandletypeflagsnv))

(cffi:defcstruct vkexportmemoryallocateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletypes vkexternalmemoryhandletypeflagsnv))

(cffi:defcstruct vkvalidationflagsext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (disabledvalidationcheckcount :uint32)
  (pdisabledvalidationchecks (:pointer vkvalidationcheckext)))

(cffi:defcstruct vkimageviewastcdecodemodeext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (decodemode vkformat))

(cffi:defcstruct vkphysicaldeviceastcdecodefeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (decodemodesharedexponent vkbool32))

(cffi:defcstruct vkconditionalrenderingbegininfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (buffer vkbuffer)
  (offset vkdevicesize)
  (flags vkconditionalrenderingflagsext))

(cffi:defcstruct vkphysicaldeviceconditionalrenderingfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (conditionalrendering vkbool32)
  (inheritedconditionalrendering vkbool32))

(cffi:defcstruct vkcommandbufferinheritanceconditionalrenderinginfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (conditionalrenderingenable vkbool32))

(cffi:defcstruct vkviewportwscalingnv
  (xcoeff :float)
  (ycoeff :float))

(cffi:defcstruct vkpipelineviewportwscalingstatecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (viewportwscalingenable vkbool32)
  (viewportcount :uint32)
  (pviewportwscalings (:pointer (:struct vkviewportwscalingnv))))

(cffi:defcstruct vksurfacecapabilities2ext
  (stype vkstructuretype)
  (pnext (:pointer :void))
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

(cffi:defcstruct vkdisplaypowerinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (powerstate vkdisplaypowerstateext))

(cffi:defcstruct vkdeviceeventinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (deviceevent vkdeviceeventtypeext))

(cffi:defcstruct vkdisplayeventinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (displayevent vkdisplayeventtypeext))

(cffi:defcstruct vkswapchaincountercreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (surfacecounters vksurfacecounterflagsext))

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
  (pnext (:pointer :void))
  (swapchaincount :uint32)
  (ptimes (:pointer (:struct vkpresenttimegoogle))))

(cffi:defcstruct vkphysicaldevicemultiviewperviewattributespropertiesnvx
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (perviewpositionallcomponents vkbool32))

(cffi:defcstruct vkviewportswizzlenv
  (x vkviewportcoordinateswizzlenv)
  (y vkviewportcoordinateswizzlenv)
  (z vkviewportcoordinateswizzlenv)
  (w vkviewportcoordinateswizzlenv))

(cffi:defcstruct vkpipelineviewportswizzlestatecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelineviewportswizzlestatecreateflagsnv)
  (viewportcount :uint32)
  (pviewportswizzles (:pointer (:struct vkviewportswizzlenv))))

(cffi:defcstruct vkphysicaldevicediscardrectanglepropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxdiscardrectangles :uint32))

(cffi:defcstruct vkpipelinediscardrectanglestatecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelinediscardrectanglestatecreateflagsext)
  (discardrectanglemode vkdiscardrectanglemodeext)
  (discardrectanglecount :uint32)
  (pdiscardrectangles (:pointer (:struct vkrect2d))))

(cffi:defcstruct vkphysicaldeviceconservativerasterizationpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (flags vkpipelinerasterizationconservativestatecreateflagsext)
  (conservativerasterizationmode vkconservativerasterizationmodeext)
  (extraprimitiveoverestimationsize :float))

(cffi:defcstruct vkphysicaldevicedepthclipenablefeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (depthclipenable vkbool32))

(cffi:defcstruct vkpipelinerasterizationdepthclipstatecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelinerasterizationdepthclipstatecreateflagsext)
  (depthclipenable vkbool32))

(cffi:defcstruct vkxycolorext
  (x :float)
  (y :float))

(cffi:defcstruct vkhdrmetadataext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (displayprimaryred (:struct vkxycolorext))
  (displayprimarygreen (:struct vkxycolorext))
  (displayprimaryblue (:struct vkxycolorext))
  (whitepoint (:struct vkxycolorext))
  (maxluminance :float)
  (minluminance :float)
  (maxcontentlightlevel :float)
  (maxframeaveragelightlevel :float))

(cffi:defcstruct vkdebugutilslabelext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (plabelname (:pointer :char))
  (color :float :count 4))

(cffi:defcstruct vkdebugutilsobjectnameinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (pobjectname (:pointer :char)))

(cffi:defcstruct vkdebugutilsmessengercallbackdataext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdebugutilsmessengercallbackdataflagsext)
  (pmessageidname (:pointer :char))
  (messageidnumber :int32)
  (pmessage (:pointer :char))
  (queuelabelcount :uint32)
  (pqueuelabels (:pointer (:struct vkdebugutilslabelext)))
  (cmdbuflabelcount :uint32)
  (pcmdbuflabels (:pointer (:struct vkdebugutilslabelext)))
  (objectcount :uint32)
  (pobjects (:pointer (:struct vkdebugutilsobjectnameinfoext))))

(cffi:defcstruct vkdebugutilsmessengercreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdebugutilsmessengercreateflagsext)
  (messageseverity vkdebugutilsmessageseverityflagsext)
  (messagetype vkdebugutilsmessagetypeflagsext)
  (pfnusercallback :pfn_vkdebugutilsmessengercallbackext)
  (puserdata (:pointer :void)))

(cffi:defcstruct vkdebugutilsobjecttaginfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (tagname :uint64)
  (tagsize :size)
  (ptag (:pointer :void)))

(cffi:defcstruct vksamplelocationext
  (x :float)
  (y :float))

(cffi:defcstruct vksamplelocationsinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (samplelocationsperpixel vksamplecountflagbits)
  (samplelocationgridsize (:struct vkextent2d))
  (samplelocationscount :uint32)
  (psamplelocations (:pointer (:struct vksamplelocationext))))

(cffi:defcstruct vkattachmentsamplelocationsext
  (attachmentindex :uint32)
  (samplelocationsinfo (:struct vksamplelocationsinfoext)))

(cffi:defcstruct vksubpasssamplelocationsext
  (subpassindex :uint32)
  (samplelocationsinfo (:struct vksamplelocationsinfoext)))

(cffi:defcstruct vkrenderpasssamplelocationsbegininfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (attachmentinitialsamplelocationscount :uint32)
  (pattachmentinitialsamplelocations
   (:pointer (:struct vkattachmentsamplelocationsext)))
  (postsubpasssamplelocationscount :uint32)
  (ppostsubpasssamplelocations
   (:pointer (:struct vksubpasssamplelocationsext))))

(cffi:defcstruct vkpipelinesamplelocationsstatecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (samplelocationsenable vkbool32)
  (samplelocationsinfo (:struct vksamplelocationsinfoext)))

(cffi:defcstruct vkphysicaldevicesamplelocationspropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (samplelocationsamplecounts vksamplecountflags)
  (maxsamplelocationgridsize (:struct vkextent2d))
  (samplelocationcoordinaterange :float :count 2)
  (samplelocationsubpixelbits :uint32)
  (variablesamplelocations vkbool32))

(cffi:defcstruct vkmultisamplepropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxsamplelocationgridsize (:struct vkextent2d)))

(cffi:defcstruct vkphysicaldeviceblendoperationadvancedfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (advancedblendcoherentoperations vkbool32))

(cffi:defcstruct vkphysicaldeviceblendoperationadvancedpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (advancedblendmaxcolorattachments :uint32)
  (advancedblendindependentblend vkbool32)
  (advancedblendnonpremultipliedsrccolor vkbool32)
  (advancedblendnonpremultiplieddstcolor vkbool32)
  (advancedblendcorrelatedoverlap vkbool32)
  (advancedblendalloperations vkbool32))

(cffi:defcstruct vkpipelinecolorblendadvancedstatecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (srcpremultiplied vkbool32)
  (dstpremultiplied vkbool32)
  (blendoverlap vkblendoverlapext))

(cffi:defcstruct vkpipelinecoveragetocolorstatecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelinecoveragetocolorstatecreateflagsnv)
  (coveragetocolorenable vkbool32)
  (coveragetocolorlocation :uint32))

(cffi:defcstruct vkpipelinecoveragemodulationstatecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelinecoveragemodulationstatecreateflagsnv)
  (coveragemodulationmode vkcoveragemodulationmodenv)
  (coveragemodulationtableenable vkbool32)
  (coveragemodulationtablecount :uint32)
  (pcoveragemodulationtable (:pointer :float)))

(cffi:defcstruct vkphysicaldeviceshadersmbuiltinspropertiesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shadersmcount :uint32)
  (shaderwarpspersm :uint32))

(cffi:defcstruct vkphysicaldeviceshadersmbuiltinsfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shadersmbuiltins vkbool32))

(cffi:defcstruct vkdrmformatmodifierpropertiesext
  (drmformatmodifier :uint64)
  (drmformatmodifierplanecount :uint32)
  (drmformatmodifiertilingfeatures vkformatfeatureflags))

(cffi:defcstruct vkdrmformatmodifierpropertieslistext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (drmformatmodifiercount :uint32)
  (pdrmformatmodifierproperties
   (:pointer (:struct vkdrmformatmodifierpropertiesext))))

(cffi:defcstruct vkphysicaldeviceimagedrmformatmodifierinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (drmformatmodifier :uint64)
  (sharingmode vksharingmode)
  (queuefamilyindexcount :uint32)
  (pqueuefamilyindices (:pointer :uint32)))

(cffi:defcstruct vkimagedrmformatmodifierlistcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (drmformatmodifiercount :uint32)
  (pdrmformatmodifiers (:pointer :uint64)))

(cffi:defcstruct vkimagedrmformatmodifierexplicitcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (drmformatmodifier :uint64)
  (drmformatmodifierplanecount :uint32)
  (pplanelayouts (:pointer (:struct vksubresourcelayout))))

(cffi:defcstruct vkimagedrmformatmodifierpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (drmformatmodifier :uint64))

(cffi:defcstruct vkdrmformatmodifierproperties2ext
  (drmformatmodifier :uint64)
  (drmformatmodifierplanecount :uint32)
  (drmformatmodifiertilingfeatures vkformatfeatureflags2))

(cffi:defcstruct vkdrmformatmodifierpropertieslist2ext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (drmformatmodifiercount :uint32)
  (pdrmformatmodifierproperties
   (:pointer (:struct vkdrmformatmodifierproperties2ext))))

(cffi:defcstruct vkvalidationcachecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkvalidationcachecreateflagsext)
  (initialdatasize :size)
  (pinitialdata (:pointer :void)))

(cffi:defcstruct vkshadermodulevalidationcachecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (validationcache vkvalidationcacheext))

(cffi:defcstruct vkshadingratepalettenv
  (shadingratepaletteentrycount :uint32)
  (pshadingratepaletteentries (:pointer vkshadingratepaletteentrynv)))

(cffi:defcstruct vkpipelineviewportshadingrateimagestatecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shadingrateimageenable vkbool32)
  (viewportcount :uint32)
  (pshadingratepalettes (:pointer (:struct vkshadingratepalettenv))))

(cffi:defcstruct vkphysicaldeviceshadingrateimagefeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shadingrateimage vkbool32)
  (shadingratecoarsesampleorder vkbool32))

(cffi:defcstruct vkphysicaldeviceshadingrateimagepropertiesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (psamplelocations (:pointer (:struct vkcoarsesamplelocationnv))))

(cffi:defcstruct vkpipelineviewportcoarsesampleorderstatecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (sampleordertype vkcoarsesampleordertypenv)
  (customsampleordercount :uint32)
  (pcustomsampleorders (:pointer (:struct vkcoarsesampleordercustomnv))))

(cffi:defcstruct vkraytracingshadergroupcreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (type vkraytracingshadergrouptypekhr)
  (generalshader :uint32)
  (closesthitshader :uint32)
  (anyhitshader :uint32)
  (intersectionshader :uint32))

(cffi:defcstruct vkraytracingpipelinecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelinecreateflags)
  (stagecount :uint32)
  (pstages (:pointer (:struct vkpipelineshaderstagecreateinfo)))
  (groupcount :uint32)
  (pgroups (:pointer (:struct vkraytracingshadergroupcreateinfonv)))
  (maxrecursiondepth :uint32)
  (layout vkpipelinelayout)
  (basepipelinehandle vkpipeline)
  (basepipelineindex :int32))

(cffi:defcstruct vkgeometrytrianglesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (aabbdata vkbuffer)
  (numaabbs :uint32)
  (stride :uint32)
  (offset vkdevicesize))

(cffi:defcstruct vkgeometrydatanv
  (triangles (:struct vkgeometrytrianglesnv))
  (aabbs (:struct vkgeometryaabbnv)))

(cffi:defcstruct vkgeometrynv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (geometrytype vkgeometrytypekhr)
  (geometry (:struct vkgeometrydatanv))
  (flags vkgeometryflagskhr))

(cffi:defcstruct vkaccelerationstructureinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (type vkaccelerationstructuretypenv)
  (flags vkbuildaccelerationstructureflagsnv)
  (instancecount :uint32)
  (geometrycount :uint32)
  (pgeometries (:pointer (:struct vkgeometrynv))))

(cffi:defcstruct vkaccelerationstructurecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (compactedsize vkdevicesize)
  (info (:struct vkaccelerationstructureinfonv)))

(cffi:defcstruct vkbindaccelerationstructurememoryinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (accelerationstructure vkaccelerationstructurenv)
  (memory vkdevicememory)
  (memoryoffset vkdevicesize)
  (deviceindexcount :uint32)
  (pdeviceindices (:pointer :uint32)))

(cffi:defcstruct vkwritedescriptorsetaccelerationstructurenv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (accelerationstructurecount :uint32)
  (paccelerationstructures (:pointer vkaccelerationstructurenv)))

(cffi:defcstruct vkaccelerationstructurememoryrequirementsinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (type vkaccelerationstructurememoryrequirementstypenv)
  (accelerationstructure vkaccelerationstructurenv))

(cffi:defcstruct vkphysicaldeviceraytracingpropertiesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shadergrouphandlesize :uint32)
  (maxrecursiondepth :uint32)
  (maxshadergroupstride :uint32)
  (shadergroupbasealignment :uint32)
  (maxgeometrycount :uint64)
  (maxinstancecount :uint64)
  (maxtrianglecount :uint64)
  (maxdescriptorsetaccelerationstructures :uint32))

(cffi:defcstruct vktransformmatrixkhr
  (matrix :float :count 12))

(cffi:defcstruct vkaabbpositionskhr
  (minx :float)
  (miny :float)
  (minz :float)
  (maxx :float)
  (maxy :float)
  (maxz :float))

(cffi:defcstruct vkaccelerationstructureinstancekhr
  (transform (:struct vktransformmatrixkhr))
  (instancecustomindex :uint32)
  (instanceshaderbindingtablerecordoffset :uint32)
  (accelerationstructurereference :uint64))

(cffi:defcstruct vkphysicaldevicerepresentativefragmenttestfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (representativefragmenttest vkbool32))

(cffi:defcstruct vkpipelinerepresentativefragmentteststatecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (representativefragmenttestenable vkbool32))

(cffi:defcstruct vkphysicaldeviceimageviewimageformatinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imageviewtype vkimageviewtype))

(cffi:defcstruct vkfiltercubicimageviewimageformatpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (filtercubic vkbool32)
  (filtercubicminmax vkbool32))

(cffi:defcstruct vkimportmemoryhostpointerinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (handletype vkexternalmemoryhandletypeflagbits)
  (phostpointer (:pointer :void)))

(cffi:defcstruct vkmemoryhostpointerpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (memorytypebits :uint32))

(cffi:defcstruct vkphysicaldeviceexternalmemoryhostpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (minimportedhostpointeralignment vkdevicesize))

(cffi:defcstruct vkpipelinecompilercontrolcreateinfoamd
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (compilercontrolflags vkpipelinecompilercontrolflagsamd))

(cffi:defcstruct vkcalibratedtimestampinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (timedomain vktimedomainext))

(cffi:defcstruct vkphysicaldeviceshadercorepropertiesamd
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (overallocationbehavior vkmemoryoverallocationbehavioramd))

(cffi:defcstruct vkphysicaldevicevertexattributedivisorpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxvertexattribdivisor :uint32))

(cffi:defcstruct vkvertexinputbindingdivisordescriptionext
  (binding :uint32)
  (divisor :uint32))

(cffi:defcstruct vkpipelinevertexinputdivisorstatecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (vertexbindingdivisorcount :uint32)
  (pvertexbindingdivisors
   (:pointer (:struct vkvertexinputbindingdivisordescriptionext))))

(cffi:defcstruct vkphysicaldevicevertexattributedivisorfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (vertexattributeinstanceratedivisor vkbool32)
  (vertexattributeinstanceratezerodivisor vkbool32))

(cffi:defcstruct vkphysicaldevicecomputeshaderderivativesfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (computederivativegroupquads vkbool32)
  (computederivativegrouplinear vkbool32))

(cffi:defcstruct vkphysicaldevicemeshshaderfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (taskshader vkbool32)
  (meshshader vkbool32))

(cffi:defcstruct vkphysicaldevicemeshshaderpropertiesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxdrawmeshtaskscount :uint32)
  (maxtaskworkgroupinvocations :uint32)
  (maxtaskworkgroupsize :uint32 :count 3)
  (maxtasktotalmemorysize :uint32)
  (maxtaskoutputcount :uint32)
  (maxmeshworkgroupinvocations :uint32)
  (maxmeshworkgroupsize :uint32 :count 3)
  (maxmeshtotalmemorysize :uint32)
  (maxmeshoutputvertices :uint32)
  (maxmeshoutputprimitives :uint32)
  (maxmeshmultiviewviewcount :uint32)
  (meshoutputpervertexgranularity :uint32)
  (meshoutputperprimitivegranularity :uint32))

(cffi:defcstruct vkdrawmeshtasksindirectcommandnv
  (taskcount :uint32)
  (firsttask :uint32))

(cffi:defcstruct vkphysicaldeviceshaderimagefootprintfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imagefootprint vkbool32))

(cffi:defcstruct vkpipelineviewportexclusivescissorstatecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (exclusivescissorcount :uint32)
  (pexclusivescissors (:pointer (:struct vkrect2d))))

(cffi:defcstruct vkphysicaldeviceexclusivescissorfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (exclusivescissor vkbool32))

(cffi:defcstruct vkqueuefamilycheckpointpropertiesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (checkpointexecutionstagemask vkpipelinestageflags))

(cffi:defcstruct vkcheckpointdatanv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (stage vkpipelinestageflagbits)
  (pcheckpointmarker (:pointer :void)))

(cffi:defcstruct vkphysicaldeviceshaderintegerfunctions2featuresintel
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shaderintegerfunctions2 vkbool32))

(cffi:defcstruct vkperformancevalueintel
  (type vkperformancevaluetypeintel)
  (data (:union vkperformancevaluedataintel)))

(cffi:defcstruct vkinitializeperformanceapiinfointel
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (puserdata (:pointer :void)))

(cffi:defcstruct vkquerypoolperformancequerycreateinfointel
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (performancecounterssampling vkquerypoolsamplingmodeintel))

(cffi:defcstruct vkperformancemarkerinfointel
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (marker :uint64))

(cffi:defcstruct vkperformancestreammarkerinfointel
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (marker :uint32))

(cffi:defcstruct vkperformanceoverrideinfointel
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (type vkperformanceoverridetypeintel)
  (enable vkbool32)
  (parameter :uint64))

(cffi:defcstruct vkperformanceconfigurationacquireinfointel
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (type vkperformanceconfigurationtypeintel))

(cffi:defcstruct vkphysicaldevicepcibusinfopropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pcidomain :uint32)
  (pcibus :uint32)
  (pcidevice :uint32)
  (pcifunction :uint32))

(cffi:defcstruct vkdisplaynativehdrsurfacecapabilitiesamd
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (localdimmingsupport vkbool32))

(cffi:defcstruct vkswapchaindisplaynativehdrcreateinfoamd
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (localdimmingenable vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentdensitymapfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fragmentdensitymap vkbool32)
  (fragmentdensitymapdynamic vkbool32)
  (fragmentdensitymapnonsubsampledimages vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentdensitymappropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (minfragmentdensitytexelsize (:struct vkextent2d))
  (maxfragmentdensitytexelsize (:struct vkextent2d))
  (fragmentdensityinvocations vkbool32))

(cffi:defcstruct vkrenderpassfragmentdensitymapcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fragmentdensitymapattachment (:struct vkattachmentreference)))

(cffi:defcstruct vkphysicaldeviceshadercoreproperties2amd
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shadercorefeatures vkshadercorepropertiesflagsamd)
  (activecomputeunitcount :uint32))

(cffi:defcstruct vkphysicaldevicecoherentmemoryfeaturesamd
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (devicecoherentmemory vkbool32))

(cffi:defcstruct vkphysicaldeviceshaderimageatomicint64featuresext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shaderimageint64atomics vkbool32)
  (sparseimageint64atomics vkbool32))

(cffi:defcstruct vkphysicaldevicememorybudgetpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (heapbudget vkdevicesize :count vk_max_memory_heaps)
  (heapusage vkdevicesize :count vk_max_memory_heaps))

(cffi:defcstruct vkphysicaldevicememorypriorityfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (memorypriority vkbool32))

(cffi:defcstruct vkmemorypriorityallocateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (priority :float))

(cffi:defcstruct vkphysicaldevicededicatedallocationimagealiasingfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (dedicatedallocationimagealiasing vkbool32))

(cffi:defcstruct vkphysicaldevicebufferdeviceaddressfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (bufferdeviceaddress vkbool32)
  (bufferdeviceaddresscapturereplay vkbool32)
  (bufferdeviceaddressmultidevice vkbool32))

(cffi:defcstruct vkbufferdeviceaddresscreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (deviceaddress vkdeviceaddress))

(cffi:defcstruct vkvalidationfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (enabledvalidationfeaturecount :uint32)
  (penabledvalidationfeatures (:pointer vkvalidationfeatureenableext))
  (disabledvalidationfeaturecount :uint32)
  (pdisabledvalidationfeatures (:pointer vkvalidationfeaturedisableext)))

(cffi:defcstruct vkcooperativematrixpropertiesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (cooperativematrix vkbool32)
  (cooperativematrixrobustbufferaccess vkbool32))

(cffi:defcstruct vkphysicaldevicecooperativematrixpropertiesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (cooperativematrixsupportedstages vkshaderstageflags))

(cffi:defcstruct vkphysicaldevicecoveragereductionmodefeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (coveragereductionmode vkbool32))

(cffi:defcstruct vkpipelinecoveragereductionstatecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelinecoveragereductionstatecreateflagsnv)
  (coveragereductionmode vkcoveragereductionmodenv))

(cffi:defcstruct vkframebuffermixedsamplescombinationnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (coveragereductionmode vkcoveragereductionmodenv)
  (rasterizationsamples vksamplecountflagbits)
  (depthstencilsamples vksamplecountflags)
  (colorsamples vksamplecountflags))

(cffi:defcstruct vkphysicaldevicefragmentshaderinterlockfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fragmentshadersampleinterlock vkbool32)
  (fragmentshaderpixelinterlock vkbool32)
  (fragmentshadershadingrateinterlock vkbool32))

(cffi:defcstruct vkphysicaldeviceycbcrimagearraysfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (ycbcrimagearrays vkbool32))

(cffi:defcstruct vkphysicaldeviceprovokingvertexfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (provokingvertexlast vkbool32)
  (transformfeedbackpreservesprovokingvertex vkbool32))

(cffi:defcstruct vkphysicaldeviceprovokingvertexpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (provokingvertexmodeperpipeline vkbool32)
  (transformfeedbackpreservestrianglefanprovokingvertex vkbool32))

(cffi:defcstruct vkpipelinerasterizationprovokingvertexstatecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (provokingvertexmode vkprovokingvertexmodeext))

(cffi:defcstruct vkheadlesssurfacecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkheadlesssurfacecreateflagsext))

(cffi:defcstruct vkphysicaldevicelinerasterizationfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (rectangularlines vkbool32)
  (bresenhamlines vkbool32)
  (smoothlines vkbool32)
  (stippledrectangularlines vkbool32)
  (stippledbresenhamlines vkbool32)
  (stippledsmoothlines vkbool32))

(cffi:defcstruct vkphysicaldevicelinerasterizationpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (linesubpixelprecisionbits :uint32))

(cffi:defcstruct vkpipelinerasterizationlinestatecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (linerasterizationmode vklinerasterizationmodeext)
  (stippledlineenable vkbool32)
  (linestipplefactor :uint32)
  (linestipplepattern :uint16))

(cffi:defcstruct vkphysicaldeviceshaderatomicfloatfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
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

(cffi:defcstruct vkphysicaldeviceindextypeuint8featuresext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (indextypeuint8 vkbool32))

(cffi:defcstruct vkphysicaldeviceextendeddynamicstatefeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (extendeddynamicstate vkbool32))

(cffi:defcstruct vkphysicaldeviceshaderatomicfloat2featuresext
  (stype vkstructuretype)
  (pnext (:pointer :void))
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

(cffi:defcstruct vkphysicaldevicedevicegeneratedcommandspropertiesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (devicegeneratedcommands vkbool32))

(cffi:defcstruct vkgraphicsshadergroupcreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (stagecount :uint32)
  (pstages (:pointer (:struct vkpipelineshaderstagecreateinfo)))
  (pvertexinputstate (:pointer (:struct vkpipelinevertexinputstatecreateinfo)))
  (ptessellationstate
   (:pointer (:struct vkpipelinetessellationstatecreateinfo))))

(cffi:defcstruct vkgraphicspipelineshadergroupscreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (groupcount :uint32)
  (pgroups (:pointer (:struct vkgraphicsshadergroupcreateinfonv)))
  (pipelinecount :uint32)
  (ppipelines (:pointer vkpipeline)))

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
  (pnext (:pointer :void))
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
  (pindextypes (:pointer vkindextype))
  (pindextypevalues (:pointer :uint32)))

(cffi:defcstruct vkindirectcommandslayoutcreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkindirectcommandslayoutusageflagsnv)
  (pipelinebindpoint vkpipelinebindpoint)
  (tokencount :uint32)
  (ptokens (:pointer (:struct vkindirectcommandslayouttokennv)))
  (streamcount :uint32)
  (pstreamstrides (:pointer :uint32)))

(cffi:defcstruct vkgeneratedcommandsinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pipelinebindpoint vkpipelinebindpoint)
  (pipeline vkpipeline)
  (indirectcommandslayout vkindirectcommandslayoutnv)
  (streamcount :uint32)
  (pstreams (:pointer (:struct vkindirectcommandsstreamnv)))
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
  (pnext (:pointer :void))
  (pipelinebindpoint vkpipelinebindpoint)
  (pipeline vkpipeline)
  (indirectcommandslayout vkindirectcommandslayoutnv)
  (maxsequencescount :uint32))

(cffi:defcstruct vkphysicaldeviceinheritedviewportscissorfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (inheritedviewportscissor2d vkbool32))

(cffi:defcstruct vkcommandbufferinheritanceviewportscissorinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (viewportscissor2d vkbool32)
  (viewportdepthcount :uint32)
  (pviewportdepths (:pointer (:struct vkviewport))))

(cffi:defcstruct vkphysicaldevicetexelbufferalignmentfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (texelbufferalignment vkbool32))

(cffi:defcstruct vkrenderpasstransformbegininfoqcom
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (transform vksurfacetransformflagbitskhr))

(cffi:defcstruct vkcommandbufferinheritancerenderpasstransforminfoqcom
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (transform vksurfacetransformflagbitskhr)
  (renderarea (:struct vkrect2d)))

(cffi:defcstruct vkphysicaldevicedevicememoryreportfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (devicememoryreport vkbool32))

(cffi:defcstruct vkdevicememoryreportcallbackdataext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdevicememoryreportflagsext)
  (type vkdevicememoryreporteventtypeext)
  (memoryobjectid :uint64)
  (size vkdevicesize)
  (objecttype vkobjecttype)
  (objecthandle :uint64)
  (heapindex :uint32))

(cffi:defcstruct vkdevicedevicememoryreportcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdevicememoryreportflagsext)
  (pfnusercallback :pfn_vkdevicememoryreportcallbackext)
  (puserdata (:pointer :void)))

(cffi:defcstruct vkphysicaldevicerobustness2featuresext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (robustbufferaccess2 vkbool32)
  (robustimageaccess2 vkbool32)
  (nulldescriptor vkbool32))

(cffi:defcstruct vkphysicaldevicerobustness2propertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (robuststoragebufferaccesssizealignment vkdevicesize)
  (robustuniformbufferaccesssizealignment vkdevicesize))

(cffi:defcstruct vksamplercustombordercolorcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (custombordercolor (:union vkclearcolorvalue))
  (format vkformat))

(cffi:defcstruct vkphysicaldevicecustombordercolorpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxcustombordercolorsamplers :uint32))

(cffi:defcstruct vkphysicaldevicecustombordercolorfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (custombordercolors vkbool32)
  (custombordercolorwithoutformat vkbool32))

(cffi:defcstruct vkphysicaldevicediagnosticsconfigfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (diagnosticsconfig vkbool32))

(cffi:defcstruct vkdevicediagnosticsconfigcreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkdevicediagnosticsconfigflagsnv))

(cffi:defcstruct vkphysicaldevicegraphicspipelinelibraryfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (graphicspipelinelibrary vkbool32))

(cffi:defcstruct vkphysicaldevicegraphicspipelinelibrarypropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (graphicspipelinelibraryfastlinking vkbool32)
  (graphicspipelinelibraryindependentinterpolationdecoration vkbool32))

(cffi:defcstruct vkgraphicspipelinelibrarycreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkgraphicspipelinelibraryflagsext))

(cffi:defcstruct vkphysicaldeviceshaderearlyandlatefragmenttestsfeaturesamd
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shaderearlyandlatefragmenttests vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentshadingrateenumsfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fragmentshadingrateenums vkbool32)
  (supersamplefragmentshadingrates vkbool32)
  (noinvocationfragmentshadingrates vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentshadingrateenumspropertiesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxfragmentshadingrateinvocationcount vksamplecountflagbits))

(cffi:defcstruct vkpipelinefragmentshadingrateenumstatecreateinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (shadingratetype vkfragmentshadingratetypenv)
  (shadingrate vkfragmentshadingratenv)
  (combinerops vkfragmentshadingratecombineropkhr :count 2))

(cffi:defcstruct vkaccelerationstructuregeometrymotiontrianglesdatanv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (vertexdata (:union vkdeviceorhostaddressconstkhr)))

(cffi:defcstruct vkaccelerationstructuremotioninfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
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

(cffi:defcstruct vkaccelerationstructuremotioninstancenv
  (type vkaccelerationstructuremotioninstancetypenv)
  (flags vkaccelerationstructuremotioninstanceflagsnv)
  (data (:union vkaccelerationstructuremotioninstancedatanv)))

(cffi:defcstruct vkphysicaldeviceraytracingmotionblurfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (raytracingmotionblur vkbool32)
  (raytracingmotionblurpipelinetraceraysindirect vkbool32))

(cffi:defcstruct vkphysicaldeviceycbcr2plane444formatsfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (ycbcr2plane444formats vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentdensitymap2featuresext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fragmentdensitymapdeferred vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentdensitymap2propertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (subsampledloads vkbool32)
  (subsampledcoarsereconstructionearlyaccess vkbool32)
  (maxsubsampledarraylayers :uint32)
  (maxdescriptorsetsubsampledsamplers :uint32))

(cffi:defcstruct vkcopycommandtransforminfoqcom
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (transform vksurfacetransformflagbitskhr))

(cffi:defcstruct vkphysicaldeviceimagecompressioncontrolfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imagecompressioncontrol vkbool32))

(cffi:defcstruct vkimagecompressioncontrolext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkimagecompressionflagsext)
  (compressioncontrolplanecount :uint32)
  (pfixedrateflags (:pointer vkimagecompressionfixedrateflagsext)))

(cffi:defcstruct vksubresourcelayout2ext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (subresourcelayout (:struct vksubresourcelayout)))

(cffi:defcstruct vkimagesubresource2ext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imagesubresource (:struct vkimagesubresource)))

(cffi:defcstruct vkimagecompressionpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imagecompressionflags vkimagecompressionflagsext)
  (imagecompressionfixedrateflags vkimagecompressionfixedrateflagsext))

(cffi:defcstruct vkphysicaldevice4444formatsfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (formata4r4g4b4 vkbool32)
  (formata4b4g4r4 vkbool32))

(cffi:defcstruct vkphysicaldevicerasterizationorderattachmentaccessfeaturesarm
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (rasterizationordercolorattachmentaccess vkbool32)
  (rasterizationorderdepthattachmentaccess vkbool32)
  (rasterizationorderstencilattachmentaccess vkbool32))

(cffi:defcstruct vkphysicaldevicergba10x6formatsfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (formatrgba10x6withoutycbcrsampler vkbool32))

(cffi:defcstruct vkphysicaldevicemutabledescriptortypefeaturesvalve
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (mutabledescriptortype vkbool32))

(cffi:defcstruct vkmutabledescriptortypelistvalve
  (descriptortypecount :uint32)
  (pdescriptortypes (:pointer vkdescriptortype)))

(cffi:defcstruct vkmutabledescriptortypecreateinfovalve
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (mutabledescriptortypelistcount :uint32)
  (pmutabledescriptortypelists
   (:pointer (:struct vkmutabledescriptortypelistvalve))))

(cffi:defcstruct vkphysicaldevicevertexinputdynamicstatefeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (vertexinputdynamicstate vkbool32))

(cffi:defcstruct vkvertexinputbindingdescription2ext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (binding :uint32)
  (stride :uint32)
  (inputrate vkvertexinputrate)
  (divisor :uint32))

(cffi:defcstruct vkvertexinputattributedescription2ext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (location :uint32)
  (binding :uint32)
  (format vkformat)
  (offset :uint32))

(cffi:defcstruct vkphysicaldevicedrmpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (hasprimary vkbool32)
  (hasrender vkbool32)
  (primarymajor :int64)
  (primaryminor :int64)
  (rendermajor :int64)
  (renderminor :int64))

(cffi:defcstruct vkphysicaldevicedepthclipcontrolfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (depthclipcontrol vkbool32))

(cffi:defcstruct vkpipelineviewportdepthclipcontrolcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (negativeonetoone vkbool32))

(cffi:defcstruct vkphysicaldeviceprimitivetopologylistrestartfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (primitivetopologylistrestart vkbool32)
  (primitivetopologypatchlistrestart vkbool32))

(cffi:defcstruct vksubpassshadingpipelinecreateinfohuawei
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (renderpass vkrenderpass)
  (subpass :uint32))

(cffi:defcstruct vkphysicaldevicesubpassshadingfeatureshuawei
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (subpassshading vkbool32))

(cffi:defcstruct vkphysicaldevicesubpassshadingpropertieshuawei
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxsubpassshadingworkgroupsizeaspectratio :uint32))

(cffi:defcstruct vkphysicaldeviceinvocationmaskfeatureshuawei
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (invocationmask vkbool32))

(cffi:defcstruct vkmemorygetremoteaddressinfonv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (memory vkdevicememory)
  (handletype vkexternalmemoryhandletypeflagbits))

(cffi:defcstruct vkphysicaldeviceexternalmemoryrdmafeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (externalmemoryrdma vkbool32))

(cffi:defcstruct vkpipelinepropertiesidentifierext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pipelineidentifier :uint8 :count vk_uuid_size))

(cffi:defcstruct vkphysicaldevicepipelinepropertiesfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pipelinepropertiesidentifier vkbool32))

(cffi:defcstruct vkphysicaldeviceextendeddynamicstate2featuresext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (extendeddynamicstate2 vkbool32)
  (extendeddynamicstate2logicop vkbool32)
  (extendeddynamicstate2patchcontrolpoints vkbool32))

(cffi:defcstruct vkphysicaldevicecolorwriteenablefeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (colorwriteenable vkbool32))

(cffi:defcstruct vkpipelinecolorwritecreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (attachmentcount :uint32)
  (pcolorwriteenables (:pointer vkbool32)))

(cffi:defcstruct vkphysicaldeviceprimitivesgeneratedqueryfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (primitivesgeneratedquery vkbool32)
  (primitivesgeneratedquerywithrasterizerdiscard vkbool32)
  (primitivesgeneratedquerywithnonzerostreams vkbool32))

(cffi:defcstruct vkphysicaldeviceimageviewminlodfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (minlod vkbool32))

(cffi:defcstruct vkimageviewminlodcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (minlod :float))

(cffi:defcstruct vkphysicaldevicemultidrawfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (multidraw vkbool32))

(cffi:defcstruct vkphysicaldevicemultidrawpropertiesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxmultidrawcount :uint32))

(cffi:defcstruct vkmultidrawinfoext
  (firstvertex :uint32)
  (vertexcount :uint32))

(cffi:defcstruct vkmultidrawindexedinfoext
  (firstindex :uint32)
  (indexcount :uint32)
  (vertexoffset :int32))

(cffi:defcstruct vkphysicaldeviceimage2dviewof3dfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (image2dviewof3d vkbool32)
  (sampler2dviewof3d vkbool32))

(cffi:defcstruct vkphysicaldevicebordercolorswizzlefeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (bordercolorswizzle vkbool32)
  (bordercolorswizzlefromimage vkbool32))

(cffi:defcstruct vksamplerbordercolorcomponentmappingcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (components (:struct vkcomponentmapping))
  (srgb vkbool32))

(cffi:defcstruct vkphysicaldevicepageabledevicelocalmemoryfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pageabledevicelocalmemory vkbool32))

(cffi:defcstruct vkphysicaldevicedescriptorsethostmappingfeaturesvalve
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (descriptorsethostmapping vkbool32))

(cffi:defcstruct vkdescriptorsetbindingreferencevalve
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (descriptorsetlayout vkdescriptorsetlayout)
  (binding :uint32))

(cffi:defcstruct vkdescriptorsetlayouthostmappinginfovalve
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (descriptoroffset :size)
  (descriptorsize :uint32))

(cffi:defcstruct vkphysicaldevicefragmentdensitymapoffsetfeaturesqcom
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fragmentdensitymapoffset vkbool32))

(cffi:defcstruct vkphysicaldevicefragmentdensitymapoffsetpropertiesqcom
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fragmentdensityoffsetgranularity (:struct vkextent2d)))

(cffi:defcstruct vksubpassfragmentdensitymapoffsetendinfoqcom
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (fragmentdensityoffsetcount :uint32)
  (pfragmentdensityoffsets (:pointer (:struct vkoffset2d))))

(cffi:defcstruct vkphysicaldevicelinearcolorattachmentfeaturesnv
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (linearcolorattachment vkbool32))

(cffi:defcstruct vkphysicaldeviceimagecompressioncontrolswapchainfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (imagecompressioncontrolswapchain vkbool32))

(cffi:defcstruct vkphysicaldevicesubpassmergefeedbackfeaturesext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (subpassmergefeedback vkbool32))

(cffi:defcstruct vkrenderpasscreationcontrolext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (disallowmerging vkbool32))

(cffi:defcstruct vkrenderpasscreationfeedbackinfoext
  (postmergesubpasscount :uint32))

(cffi:defcstruct vkrenderpasscreationfeedbackcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (prenderpassfeedback
   (:pointer (:struct vkrenderpasscreationfeedbackinfoext))))

(cffi:defcstruct vkrenderpasssubpassfeedbackinfoext
  (subpassmergestatus vksubpassmergestatusext)
  (description :char :count vk_max_description_size)
  (postmergeindex :uint32))

(cffi:defcstruct vkrenderpasssubpassfeedbackcreateinfoext
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (psubpassfeedback (:pointer (:struct vkrenderpasssubpassfeedbackinfoext))))

(cffi:defcstruct vkaccelerationstructurebuildrangeinfokhr
  (primitivecount :uint32)
  (primitiveoffset :uint32)
  (firstvertex :uint32)
  (transformoffset :uint32))

(cffi:defcstruct vkaccelerationstructuregeometrytrianglesdatakhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (vertexformat vkformat)
  (vertexdata (:union vkdeviceorhostaddressconstkhr))
  (vertexstride vkdevicesize)
  (maxvertex :uint32)
  (indextype vkindextype)
  (indexdata (:union vkdeviceorhostaddressconstkhr))
  (transformdata (:union vkdeviceorhostaddressconstkhr)))

(cffi:defcstruct vkaccelerationstructuregeometryaabbsdatakhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (data (:union vkdeviceorhostaddressconstkhr))
  (stride vkdevicesize))

(cffi:defcstruct vkaccelerationstructuregeometryinstancesdatakhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (arrayofpointers vkbool32)
  (data (:union vkdeviceorhostaddressconstkhr)))

(cffi:defcstruct vkaccelerationstructuregeometrykhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (geometrytype vkgeometrytypekhr)
  (geometry (:union vkaccelerationstructuregeometrydatakhr))
  (flags vkgeometryflagskhr))

(cffi:defcstruct vkaccelerationstructurebuildgeometryinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (type vkaccelerationstructuretypekhr)
  (flags vkbuildaccelerationstructureflagskhr)
  (mode vkbuildaccelerationstructuremodekhr)
  (srcaccelerationstructure vkaccelerationstructurekhr)
  (dstaccelerationstructure vkaccelerationstructurekhr)
  (geometrycount :uint32)
  (pgeometries (:pointer (:struct vkaccelerationstructuregeometrykhr)))
  (ppgeometries (:pointer (:struct vkaccelerationstructuregeometrykhr)))
  (scratchdata (:union vkdeviceorhostaddresskhr)))

(cffi:defcstruct vkaccelerationstructurecreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (createflags vkaccelerationstructurecreateflagskhr)
  (buffer vkbuffer)
  (offset vkdevicesize)
  (size vkdevicesize)
  (type vkaccelerationstructuretypekhr)
  (deviceaddress vkdeviceaddress))

(cffi:defcstruct vkwritedescriptorsetaccelerationstructurekhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (accelerationstructurecount :uint32)
  (paccelerationstructures (:pointer vkaccelerationstructurekhr)))

(cffi:defcstruct vkphysicaldeviceaccelerationstructurefeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (accelerationstructure vkbool32)
  (accelerationstructurecapturereplay vkbool32)
  (accelerationstructureindirectbuild vkbool32)
  (accelerationstructurehostcommands vkbool32)
  (descriptorbindingaccelerationstructureupdateafterbind vkbool32))

(cffi:defcstruct vkphysicaldeviceaccelerationstructurepropertieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
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
  (pnext (:pointer :void))
  (accelerationstructure vkaccelerationstructurekhr))

(cffi:defcstruct vkaccelerationstructureversioninfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (pversiondata (:pointer :uint8)))

(cffi:defcstruct vkcopyaccelerationstructuretomemoryinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (src vkaccelerationstructurekhr)
  (dst (:union vkdeviceorhostaddresskhr))
  (mode vkcopyaccelerationstructuremodekhr))

(cffi:defcstruct vkcopymemorytoaccelerationstructureinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (src (:union vkdeviceorhostaddressconstkhr))
  (dst vkaccelerationstructurekhr)
  (mode vkcopyaccelerationstructuremodekhr))

(cffi:defcstruct vkcopyaccelerationstructureinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (src vkaccelerationstructurekhr)
  (dst vkaccelerationstructurekhr)
  (mode vkcopyaccelerationstructuremodekhr))

(cffi:defcstruct vkaccelerationstructurebuildsizesinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (accelerationstructuresize vkdevicesize)
  (updatescratchsize vkdevicesize)
  (buildscratchsize vkdevicesize))

(cffi:defcstruct vkraytracingshadergroupcreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (type vkraytracingshadergrouptypekhr)
  (generalshader :uint32)
  (closesthitshader :uint32)
  (anyhitshader :uint32)
  (intersectionshader :uint32)
  (pshadergroupcapturereplayhandle (:pointer :void)))

(cffi:defcstruct vkraytracingpipelineinterfacecreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (maxpipelineraypayloadsize :uint32)
  (maxpipelinerayhitattributesize :uint32))

(cffi:defcstruct vkraytracingpipelinecreateinfokhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (flags vkpipelinecreateflags)
  (stagecount :uint32)
  (pstages (:pointer (:struct vkpipelineshaderstagecreateinfo)))
  (groupcount :uint32)
  (pgroups (:pointer (:struct vkraytracingshadergroupcreateinfokhr)))
  (maxpipelinerayrecursiondepth :uint32)
  (plibraryinfo (:pointer (:struct vkpipelinelibrarycreateinfokhr)))
  (plibraryinterface
   (:pointer (:struct vkraytracingpipelineinterfacecreateinfokhr)))
  (pdynamicstate (:pointer (:struct vkpipelinedynamicstatecreateinfo)))
  (layout vkpipelinelayout)
  (basepipelinehandle vkpipeline)
  (basepipelineindex :int32))

(cffi:defcstruct vkphysicaldeviceraytracingpipelinefeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (raytracingpipeline vkbool32)
  (raytracingpipelineshadergrouphandlecapturereplay vkbool32)
  (raytracingpipelineshadergrouphandlecapturereplaymixed vkbool32)
  (raytracingpipelinetraceraysindirect vkbool32)
  (raytraversalprimitiveculling vkbool32))

(cffi:defcstruct vkphysicaldeviceraytracingpipelinepropertieskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
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

(cffi:defcstruct vkphysicaldevicerayqueryfeatureskhr
  (stype vkstructuretype)
  (pnext (:pointer :void))
  (rayquery vkbool32))
