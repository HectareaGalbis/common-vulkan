(in-package :cvk)

(more-cffi:with-doc-file (doc-file
                          (asdf/system:system-relative-pathname "common-vulkan"
                                                                "docs/api/functions.md"))

  (more-cffi:def-foreign-function doc-file
      ("vkCreateInstance" create-instance funcall-create-instance)
      (pcreateinfo pallocator)
    (declare-types ("VkInstanceCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") :return ("VkInstance" instance)
     ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pinstance 'vkinstance)
        (let ((result (vkcreateinstance pcreateinfo pallocator-c pinstance)))
          (values (cffi:mem-ref pinstance 'vkinstance) result
                  (if pallocator
                      pallocator-c
                      nil))))))

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyInstance" destroy-instance funcall-destroy-instance)
      (instance pallocator)
    (declare-types ("VkInstance" instance)
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroyinstance instance pallocator-c)))

  (more-cffi:defwith doc-file with-instance create-instance destroy-instance
                     :destructor-arguments (0 2))

  (more-cffi:doc-note doc-file
                      "The allocator is passed to both constructor and destructor.")

  (more-cffi:def-foreign-function doc-file
      ("vkEnumeratePhysicalDevices" enumerate-physical-devices
       funcall-enumerate-physical-devices)
      (instance)
    (declare-types ("VkInstance" instance) :return
     ((list "VkPhysicalDevice") "pPhysicalDevices") ("VkResult" result))
    (cffi:with-foreign-object (pphysicaldevicecount :uint32)
      (vkenumeratephysicaldevices instance pphysicaldevicecount
       (cffi-sys:null-pointer))
      (let ((physical-device-count (cffi:mem-ref pphysicaldevicecount :uint32)))
        (cffi:with-foreign-object (pphysicaldevices 'vkphysicaldevice
                                   physical-device-count)
          (vkenumeratephysicaldevices instance pphysicaldevicecount
           pphysicaldevices)
          (loop for i from 0 below physical-device-count
                collect (cffi:mem-aref pphysicaldevices 'vkphysicaldevice
                                       i))))))

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceFeatures" create-get-physical-device-features
       funcall-get-physical-device-features)
      (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return
     ("VkPhysicalDeviceFeatures" pfeatures))
    (let ((pfeatures (cffi:foreign-alloc '(:struct vkphysicaldevicefeatures))))
      (vkgetphysicaldevicefeatures physicaldevice pfeatures)
      (values pfeatures)))

  (more-cffi:def-foreign-function doc-file
      (nil destroy-get-physical-device-features
       funcall-destroy-get-physical-device-features)
      (pfeatures)
    (declare-types ("VkPhysicalDeviceFeatures" "pFeatures"))
    (cffi-sys:foreign-free pfeatures))

  (more-cffi:defwith doc-file with-get-physical-device-features
                     create-get-physical-device-features
                     destroy-get-physical-device-features)

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceFormatProperties"
       get-physical-device-format-properties
       funcall-get-physical-device-format-properties)
      (physicaldevice format pformatproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkFormat" format)
     ("VkFormatProperties" "pFormatProperties") :return ("void" return-value))
    (vkgetphysicaldeviceformatproperties physicaldevice format
     pformatproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceImageFormatProperties"
       get-physical-device-image-format-properties
       funcall-get-physical-device-image-format-properties)
      (physicaldevice format type tiling usage flags pimageformatproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkFormat" format)
     ("VkImageType" type) ("VkImageTiling" tiling) ("VkImageUsageFlags" usage)
     ("VkImageCreateFlags" flags)
     ("VkImageFormatProperties" "pImageFormatProperties") :return
     ("VkResult" return-value))
    (vkgetphysicaldeviceimageformatproperties physicaldevice format type tiling
     usage flags pimageformatproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceProperties" create-get-physical-device-properties
       funcall-get-physical-device-properties)
      (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return
     ("VkPhysicalDeviceProperties" "pProperties"))
    (let ((pproperties
           (cffi:foreign-alloc '(:struct vkphysicaldeviceproperties))))
      (vkgetphysicaldeviceproperties physicaldevice pproperties)
      (values pproperties)))

  (more-cffi:def-foreign-function doc-file
      (nil destroy-get-physical-device-properties
       funcall-destroy-get-physical-device-properties)
      (pproperties)
    (declare-types ("VkPhysicalDeviceProperties" "pProperties"))
    (cffi-sys:foreign-free pproperties))

  (more-cffi:defwith doc-file with-get-physical-device-properties
                     create-get-physical-device-properties
                     destroy-get-physical-device-properties)

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceQueueFamilyProperties"
       create-get-physical-device-queue-family-properties
       funcall-get-physical-device-queue-family-properties)
      (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return
     ((list "VkQueueFamilyProperties") "pQueueFamilyProperties"))
    (cffi:with-foreign-object (pqueuefamilypropertycount :uint32)
      (vkgetphysicaldevicequeuefamilyproperties physicaldevice
       pqueuefamilypropertycount (cffi-sys:null-pointer))
      (let* ((queue-family-property-count
              (cffi:mem-ref pqueuefamilypropertycount :uint32))
             (pqueuefamilyproperties
              (cffi:foreign-alloc '(:struct vkqueuefamilyproperties) :count
                                  queue-family-property-count)))
        (vkgetphysicaldevicequeuefamilyproperties physicaldevice
         pqueuefamilypropertycount pqueuefamilyproperties)
        (loop for i from 0 below queue-family-property-count
              collect (cffi:mem-aptr pqueuefamilyproperties
                                     '(:struct vkqueuefamilyproperties) i)))))

  (more-cffi:def-foreign-function doc-file
      (nil destroy-get-physical-device-queue-family-properties
       funcall-destroy-get-physical-device-queue-family-properties)
      (pqueuefamilyproperties)
    (declare-types ((list "VkQueueFamilyProperties") pqueuefamilyproperties))
    (cffi-sys:foreign-free (car pqueuefamilyproperties)))

  (more-cffi:defwith doc-file with-get-physical-device-queue-family-properties
                     create-get-physical-device-queue-family-properties
                     destroy-get-physical-device-queue-family-properties)

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceMemoryProperties"
       get-physical-device-memory-properties
       funcall-get-physical-device-memory-properties)
      (physicaldevice pmemoryproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceMemoryProperties" "pMemoryProperties") :return
     ("void" return-value))
    (vkgetphysicaldevicememoryproperties physicaldevice pmemoryproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetInstanceProcAddr" get-instance-proc-addr
       funcall-get-instance-proc-addr)
      (instance pname)
    (declare-types ("VkInstance" instance) (string "pName") :return #'result)
    (let ((instance-c (or instance (cffi-sys:null-pointer))))
      (cffi:with-foreign-string (pname-c pname)
        (let ((func-pointer (vkgetinstanceprocaddr instance-c pname-c)))
          (if (cffi-sys:null-pointer-p func-pointer)
              nil
              (let* ((lisp-function-name
                      (subseq
                       (string
                        (cffi:translate-camelcase-name pname :special-words
                                                       '("2D" "3D" "KHR" "EXT"
                                                         "VALVE" "GOOGLE" "AMD"
                                                         "INTEL" "NVX" "NV"
                                                         "HUAWEI")))
                       3))
                     (funcall-function
                      (intern
                       (concatenate 'string "FUNCALL-" lisp-function-name)
                       :cvk)))
                (lambda (&rest args)
                  (apply funcall-function func-pointer args))))))))

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceProcAddr" get-device-proc-addr funcall-get-device-proc-addr)
      (device pname)
    (declare-types ("VkDevice" device) (char "pName") :return
     ("PFN_vkVoidFunction" return-value))
    (vkgetdeviceprocaddr device pname))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateDevice" create-device funcall-create-device)
      (physicaldevice pcreateinfo pallocator)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkDeviceCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") :return ("VkDevice" "pDevice")
     ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pdevice 'vkdevice)
        (let ((result
               (vkcreatedevice physicaldevice pcreateinfo pallocator-c
                pdevice)))
          (values (cffi:mem-ref pdevice 'vkdevice) result
                  (if pallocator
                      pallocator-c
                      nil))))))

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyDevice" destroy-device funcall-destroy-device)
      (device pallocator)
    (declare-types ("VkDevice" device) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroydevice device pallocator-c)))

  (more-cffi:defwith doc-file with-device create-device destroy-device
                     :destructor-arguments (0 2))

  (more-cffi:def-foreign-function doc-file
      ("vkEnumerateInstanceExtensionProperties"
       create-enumerate-instance-extension-properties
       funcall-enumerate-instance-extension-properties)
      (playername)
    (declare-types (string "pLayerName") :return
     ((list "VkExtensionProperties") extension-props))
    (let ((playername-c
           (if playername
               (cffi:foreign-string-alloc playername)
               (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (ppropertycount :uint32)
        (vkenumerateinstanceextensionproperties playername-c ppropertycount
         (cffi-sys:null-pointer))
        (let* ((property-count (cffi:mem-ref ppropertycount :uint32))
               (pproperties
                (cffi:foreign-alloc '(:struct vkextensionproperties) :count
                                    property-count)))
          (vkenumerateinstanceextensionproperties playername-c ppropertycount
           pproperties)
          (iter
            (for i from 0 below property-count)
            (collect
             (cffi:mem-aptr pproperties '(:struct vkextensionproperties)
                            i)))))))

  (more-cffi:def-foreign-function doc-file
      (nil destroy-enumerate-instance-extension-properties
       funcall-destroy-enumerate-instance-extension-properties)
      (extension-props)
    (declare-types ("(list VkExtensionProperties)" extension-props))
    (cffi-sys:foreign-free (car extension-props)))

  (more-cffi:defwith doc-file with-enumerate-instance-extension-properties
                     create-enumerate-instance-extension-properties
                     destroy-enumerate-instance-extension-properties)

  (more-cffi:def-foreign-function doc-file
      ("vkEnumerateDeviceExtensionProperties"
       create-enumerate-device-extension-properties
       funcall-enumerate-device-extension-properties)
      (physicaldevice playername)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (string "pLayerName")
     :return ((list "VkExtensionProperties") "pProperties") ("VkResult" result))
    (let ((playername-c (or playername (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (ppropertycount :uint32)
        (vkenumeratedeviceextensionproperties physicaldevice playername-c
         ppropertycount (cffi-sys:null-pointer))
        (let* ((property-count (cffi:mem-ref ppropertycount :uint32))
               (pproperties
                (cffi:foreign-alloc '(:struct vkextensionproperties) :count
                                    property-count)))
          (let ((result
                 (vkenumeratedeviceextensionproperties physicaldevice
                  playername-c ppropertycount pproperties))
                (properties
                 (iter
                   (for i from 0 below property-count)
                   (collect
                    (cffi:mem-aptr pproperties '(:struct vkextensionproperties)
                                   i)))))
            (values properties result))))))

  (more-cffi:def-foreign-function doc-file
      (nil destroy-enumerate-device-extension-properties
       funcall-destroy-enumerate-device-extension-properties)
      (pproperties)
    (declare-types ((list "VkExtensionProperties") "pProperties"))
    (cffi-sys:foreign-free (car pproperties)))

  (more-cffi:defwith doc-file with-enumerate-device-extension-properties
                     create-enumerate-device-extension-properties
                     destroy-enumerate-device-extension-properties)

  (more-cffi:def-foreign-function doc-file
      ("vkEnumerateInstanceLayerProperties"
       create-enumerate-instance-layer-properties
       funcall-enumerate-instance-layer-properties)
      nil
    (declare-types :return ((list "VkLayerProperties") layer-props))
    (cffi:with-foreign-object (ppropertycount :uint32)
      (vkenumerateinstancelayerproperties ppropertycount
       (cffi-sys:null-pointer))
      (let* ((property-count (cffi:mem-ref ppropertycount :uint32))
             (pproperties
              (cffi:foreign-alloc '(:struct vklayerproperties) :count
                                  property-count)))
        (vkenumerateinstancelayerproperties ppropertycount pproperties)
        (iter
          (for i from 0 below property-count)
          (collect
           (cffi:mem-aptr pproperties '(:struct vklayerproperties) i))))))

  (more-cffi:def-foreign-function doc-file
      (nil destroy-enumerate-instance-layer-properties
       funcall-destroy-enumerate-instance-layer-properties)
      (layer-props)
    (declare-types ((list "VkLayerProperties") layer-props))
    (cffi-sys:foreign-free (car layer-props)))

  (more-cffi:defwith doc-file with-enumerate-instance-layer-properties
                     create-enumerate-instance-layer-properties
                     destroy-enumerate-instance-layer-properties)

  (more-cffi:def-foreign-function doc-file
      ("vkEnumerateDeviceLayerProperties" enumerate-device-layer-properties
       funcall-enumerate-device-layer-properties)
      (physicaldevice ppropertycount pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pPropertyCount") ("VkLayerProperties" "pProperties") :return
     ("VkResult" return-value))
    (vkenumeratedevicelayerproperties physicaldevice ppropertycount
     pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceQueue" get-device-queue funcall-get-device-queue)
      (device queuefamilyindex queueindex)
    (declare-types ("VkDevice" device) (uint32 "queueFamilyIndex")
     (uint32 "queueIndex") :return ("VkQueue" "pQueue"))
    (cffi:with-foreign-object (pqueue 'vkqueue)
      (vkgetdevicequeue device queuefamilyindex queueindex pqueue)
      (cffi:mem-ref pqueue 'vkqueue)))

  (more-cffi:def-foreign-function doc-file
      ("vkQueueSubmit" queue-submit funcall-queue-submit)
      (queue submitcount psubmits fence)
    (declare-types ("VkQueue" queue) (uint32 "submitCount")
     ("VkSubmitInfo" "pSubmits") ("VkFence" fence) :return
     ("VkResult" return-value))
    (vkqueuesubmit queue submitcount psubmits fence))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkQueueWaitIdle" queue-wait-idle funcall-queue-wait-idle)
      (queue)
    (declare-types ("VkQueue" queue) :return ("VkResult" return-value))
    (vkqueuewaitidle queue))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDeviceWaitIdle" device-wait-idle funcall-device-wait-idle)
      (device)
    (declare-types ("VkDevice" device) :return ("VkResult" return-value))
    (vkdevicewaitidle device))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkAllocateMemory" allocate-memory funcall-allocate-memory)
      (device pallocateinfo pallocator pmemory)
    (declare-types ("VkDevice" device) ("VkMemoryAllocateInfo" "pAllocateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkDeviceMemory" "pMemory")
     :return ("VkResult" return-value))
    (vkallocatememory device pallocateinfo pallocator pmemory))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkFreeMemory" free-memory funcall-free-memory)
      (device memory pallocator)
    (declare-types ("VkDevice" device) ("VkDeviceMemory" memory)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkfreememory device memory pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkMapMemory" map-memory funcall-map-memory)
      (device memory offset size flags ppdata)
    (declare-types ("VkDevice" device) ("VkDeviceMemory" memory)
     ("VkDeviceSize" offset) ("VkDeviceSize" size) ("VkMemoryMapFlags" flags)
     (void "ppData") :return ("VkResult" return-value))
    (vkmapmemory device memory offset size flags ppdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkUnmapMemory" unmap-memory funcall-unmap-memory)
      (device memory)
    (declare-types ("VkDevice" device) ("VkDeviceMemory" memory) :return
     ("void" return-value))
    (vkunmapmemory device memory))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkFlushMappedMemoryRanges" flush-mapped-memory-ranges
       funcall-flush-mapped-memory-ranges)
      (device memoryrangecount pmemoryranges)
    (declare-types ("VkDevice" device) (uint32 "memoryRangeCount")
     ("VkMappedMemoryRange" "pMemoryRanges") :return ("VkResult" return-value))
    (vkflushmappedmemoryranges device memoryrangecount pmemoryranges))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkInvalidateMappedMemoryRanges" invalidate-mapped-memory-ranges
       funcall-invalidate-mapped-memory-ranges)
      (device memoryrangecount pmemoryranges)
    (declare-types ("VkDevice" device) (uint32 "memoryRangeCount")
     ("VkMappedMemoryRange" "pMemoryRanges") :return ("VkResult" return-value))
    (vkinvalidatemappedmemoryranges device memoryrangecount pmemoryranges))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceMemoryCommitment" get-device-memory-commitment
       funcall-get-device-memory-commitment)
      (device memory pcommittedmemoryinbytes)
    (declare-types ("VkDevice" device) ("VkDeviceMemory" memory)
     ("VkDeviceSize" "pCommittedMemoryInBytes") :return ("void" return-value))
    (vkgetdevicememorycommitment device memory pcommittedmemoryinbytes))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkBindBufferMemory" bind-buffer-memory funcall-bind-buffer-memory)
      (device buffer memory memoryoffset)
    (declare-types ("VkDevice" device) ("VkBuffer" buffer)
     ("VkDeviceMemory" memory) ("VkDeviceSize" "memoryOffset") :return
     ("VkResult" return-value))
    (vkbindbuffermemory device buffer memory memoryoffset))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkBindImageMemory" bind-image-memory funcall-bind-image-memory)
      (device image memory memoryoffset)
    (declare-types ("VkDevice" device) ("VkImage" image)
     ("VkDeviceMemory" memory) ("VkDeviceSize" "memoryOffset") :return
     ("VkResult" return-value))
    (vkbindimagememory device image memory memoryoffset))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetBufferMemoryRequirements" get-buffer-memory-requirements
       funcall-get-buffer-memory-requirements)
      (device buffer pmemoryrequirements)
    (declare-types ("VkDevice" device) ("VkBuffer" buffer)
     ("VkMemoryRequirements" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetbuffermemoryrequirements device buffer pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageMemoryRequirements" get-image-memory-requirements
       funcall-get-image-memory-requirements)
      (device image pmemoryrequirements)
    (declare-types ("VkDevice" device) ("VkImage" image)
     ("VkMemoryRequirements" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetimagememoryrequirements device image pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageSparseMemoryRequirements"
       get-image-sparse-memory-requirements
       funcall-get-image-sparse-memory-requirements)
      (device image psparsememoryrequirementcount psparsememoryrequirements)
    (declare-types ("VkDevice" device) ("VkImage" image)
     (uint32 "pSparseMemoryRequirementCount")
     ("VkSparseImageMemoryRequirements" "pSparseMemoryRequirements") :return
     ("void" return-value))
    (vkgetimagesparsememoryrequirements device image
     psparsememoryrequirementcount psparsememoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSparseImageFormatProperties"
       get-physical-device-sparse-image-format-properties
       funcall-get-physical-device-sparse-image-format-properties)
      (physicaldevice format type samples usage tiling ppropertycount
       pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkFormat" format)
     ("VkImageType" type) ("VkSampleCountFlagBits" samples)
     ("VkImageUsageFlags" usage) ("VkImageTiling" tiling)
     (uint32 "pPropertyCount") ("VkSparseImageFormatProperties" "pProperties")
     :return ("void" return-value))
    (vkgetphysicaldevicesparseimageformatproperties physicaldevice format type
     samples usage tiling ppropertycount pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkQueueBindSparse" queue-bind-sparse funcall-queue-bind-sparse)
      (queue bindinfocount pbindinfo fence)
    (declare-types ("VkQueue" queue) (uint32 "bindInfoCount")
     ("VkBindSparseInfo" "pBindInfo") ("VkFence" fence) :return
     ("VkResult" return-value))
    (vkqueuebindsparse queue bindinfocount pbindinfo fence))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateFence" create-fence funcall-create-fence)
      (device pcreateinfo pallocator pfence)
    (declare-types ("VkDevice" device) ("VkFenceCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkFence" "pFence") :return
     ("VkResult" return-value))
    (vkcreatefence device pcreateinfo pallocator pfence))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyFence" destroy-fence funcall-destroy-fence)
      (device fence pallocator)
    (declare-types ("VkDevice" device) ("VkFence" fence)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroyfence device fence pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkResetFences" reset-fences funcall-reset-fences)
      (device fencecount pfences)
    (declare-types ("VkDevice" device) (uint32 "fenceCount")
     ("VkFence" "pFences") :return ("VkResult" return-value))
    (vkresetfences device fencecount pfences))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetFenceStatus" get-fence-status funcall-get-fence-status)
      (device fence)
    (declare-types ("VkDevice" device) ("VkFence" fence) :return
     ("VkResult" return-value))
    (vkgetfencestatus device fence))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkWaitForFences" wait-for-fences funcall-wait-for-fences)
      (device fencecount pfences waitall timeout)
    (declare-types ("VkDevice" device) (uint32 "fenceCount")
     ("VkFence" "pFences") ("VkBool32" "waitAll") (uint64 timeout) :return
     ("VkResult" return-value))
    (vkwaitforfences device fencecount pfences waitall timeout))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateSemaphore" create-semaphore funcall-create-semaphore)
      (device pcreateinfo pallocator psemaphore)
    (declare-types ("VkDevice" device) ("VkSemaphoreCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkSemaphore" "pSemaphore")
     :return ("VkResult" return-value))
    (vkcreatesemaphore device pcreateinfo pallocator psemaphore))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroySemaphore" destroy-semaphore funcall-destroy-semaphore)
      (device semaphore pallocator)
    (declare-types ("VkDevice" device) ("VkSemaphore" semaphore)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroysemaphore device semaphore pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateEvent" create-event funcall-create-event)
      (device pcreateinfo pallocator pevent)
    (declare-types ("VkDevice" device) ("VkEventCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkEvent" "pEvent") :return
     ("VkResult" return-value))
    (vkcreateevent device pcreateinfo pallocator pevent))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyEvent" destroy-event funcall-destroy-event)
      (device event pallocator)
    (declare-types ("VkDevice" device) ("VkEvent" event)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroyevent device event pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetEventStatus" get-event-status funcall-get-event-status)
      (device event)
    (declare-types ("VkDevice" device) ("VkEvent" event) :return
     ("VkResult" return-value))
    (vkgeteventstatus device event))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkSetEvent" set-event funcall-set-event)
      (device event)
    (declare-types ("VkDevice" device) ("VkEvent" event) :return
     ("VkResult" return-value))
    (vksetevent device event))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkResetEvent" reset-event funcall-reset-event)
      (device event)
    (declare-types ("VkDevice" device) ("VkEvent" event) :return
     ("VkResult" return-value))
    (vkresetevent device event))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateQueryPool" create-query-pool funcall-create-query-pool)
      (device pcreateinfo pallocator pquerypool)
    (declare-types ("VkDevice" device) ("VkQueryPoolCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkQueryPool" "pQueryPool")
     :return ("VkResult" return-value))
    (vkcreatequerypool device pcreateinfo pallocator pquerypool))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyQueryPool" destroy-query-pool funcall-destroy-query-pool)
      (device querypool pallocator)
    (declare-types ("VkDevice" device) ("VkQueryPool" "queryPool")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroyquerypool device querypool pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetQueryPoolResults" get-query-pool-results
       funcall-get-query-pool-results)
      (device querypool firstquery querycount datasize pdata stride flags)
    (declare-types ("VkDevice" device) ("VkQueryPool" "queryPool")
     (uint32 "firstQuery") (uint32 "queryCount") (size "dataSize")
     (void "pData") ("VkDeviceSize" stride) ("VkQueryResultFlags" flags)
     :return ("VkResult" return-value))
    (vkgetquerypoolresults device querypool firstquery querycount datasize
     pdata stride flags))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateBuffer" create-buffer funcall-create-buffer)
      (device pcreateinfo pallocator pbuffer)
    (declare-types ("VkDevice" device) ("VkBufferCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkBuffer" "pBuffer") :return
     ("VkResult" return-value))
    (vkcreatebuffer device pcreateinfo pallocator pbuffer))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyBuffer" destroy-buffer funcall-destroy-buffer)
      (device buffer pallocator)
    (declare-types ("VkDevice" device) ("VkBuffer" buffer)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroybuffer device buffer pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateBufferView" create-buffer-view funcall-create-buffer-view)
      (device pcreateinfo pallocator pview)
    (declare-types ("VkDevice" device) ("VkBufferViewCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkBufferView" "pView") :return
     ("VkResult" return-value))
    (vkcreatebufferview device pcreateinfo pallocator pview))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyBufferView" destroy-buffer-view funcall-destroy-buffer-view)
      (device bufferview pallocator)
    (declare-types ("VkDevice" device) ("VkBufferView" "bufferView")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroybufferview device bufferview pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateImage" create-image funcall-create-image)
      (device pcreateinfo pallocator pimage)
    (declare-types ("VkDevice" device) ("VkImageCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkImage" "pImage") :return
     ("VkResult" return-value))
    (vkcreateimage device pcreateinfo pallocator pimage))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyImage" destroy-image funcall-destroy-image)
      (device image pallocator)
    (declare-types ("VkDevice" device) ("VkImage" image)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroyimage device image pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageSubresourceLayout" get-image-subresource-layout
       funcall-get-image-subresource-layout)
      (device image psubresource playout)
    (declare-types ("VkDevice" device) ("VkImage" image)
     ("VkImageSubresource" "pSubresource") ("VkSubresourceLayout" "pLayout")
     :return ("void" return-value))
    (vkgetimagesubresourcelayout device image psubresource playout))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateImageView" create-image-view funcall-create-image-view)
      (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkImageViewCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") :return ("VkImageView" "pView")
     ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pview 'vkimageview)
        (let ((result
               (vkcreateimageview device pcreateinfo pallocator-c pview)))
          (values (cffi:mem-ref pview 'vkimageview) result device
                  pallocator)))))

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyImageView" destroy-image-view funcall-destroy-image-view)
      (device imageview pallocator)
    (declare-types ("VkDevice" device) ("VkImageView" "imageView")
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroyimageview device imageview pallocator-c)))

  (more-cffi:defwith doc-file with-image-view create-image-view
                     destroy-image-view :destructor-arguments (2 0 3))

  (more-cffi:def-foreign-function doc-file
      ("vkCreateShaderModule" create-shader-module funcall-create-shader-module)
      (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device)
     ("VkShaderModuleCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") :return
     ("VkShaderModule" "pShaderModule") ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pshadermodule 'vkshadermodule)
        (let ((result
               (vkcreateshadermodule device pcreateinfo pallocator-c
                pshadermodule)))
          (values (cffi:mem-ref pshadermodule 'vkshadermodule) result device
                  pallocator)))))

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyShaderModule" destroy-shader-module
       funcall-destroy-shader-module)
      (device shadermodule pallocator)
    (declare-types ("VkDevice" device) ("VkShaderModule" "shaderModule")
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroyshadermodule device shadermodule pallocator-c)))

  (more-cffi:defwith doc-file with-shader-module create-shader-module
                     destroy-shader-module :destructor-arguments (2 0 3))

  (more-cffi:def-foreign-function doc-file
      ("vkCreatePipelineCache" create-pipeline-cache
       funcall-create-pipeline-cache)
      (device pcreateinfo pallocator ppipelinecache)
    (declare-types ("VkDevice" device)
     ("VkPipelineCacheCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkPipelineCache" "pPipelineCache") :return ("VkResult" return-value))
    (vkcreatepipelinecache device pcreateinfo pallocator ppipelinecache))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyPipelineCache" destroy-pipeline-cache
       funcall-destroy-pipeline-cache)
      (device pipelinecache pallocator)
    (declare-types ("VkDevice" device) ("VkPipelineCache" "pipelineCache")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroypipelinecache device pipelinecache pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPipelineCacheData" get-pipeline-cache-data
       funcall-get-pipeline-cache-data)
      (device pipelinecache pdatasize pdata)
    (declare-types ("VkDevice" device) ("VkPipelineCache" "pipelineCache")
     (size "pDataSize") (void "pData") :return ("VkResult" return-value))
    (vkgetpipelinecachedata device pipelinecache pdatasize pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkMergePipelineCaches" merge-pipeline-caches
       funcall-merge-pipeline-caches)
      (device dstcache srccachecount psrccaches)
    (declare-types ("VkDevice" device) ("VkPipelineCache" "dstCache")
     (uint32 "srcCacheCount") ("VkPipelineCache" "pSrcCaches") :return
     ("VkResult" return-value))
    (vkmergepipelinecaches device dstcache srccachecount psrccaches))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateGraphicsPipelines" create-graphics-pipelines
       funcall-create-graphics-pipelines)
      (device pipelinecache pcreateinfos pallocator)
    (declare-types ("VkDevice" device) ("VkPipelineCache" "pipelineCache")
     ("VkGraphicsPipelineCreateInfo" "pCreateInfos")
     ("VkAllocationCallbacks" "pAllocator") :return ("VkPipeline" "pPipelines")
     ("VkResult" result))
    (let ((pipelinecache-c (or pipelinecache (cffi-sys:null-pointer)))
          (pallocator-c (or pallocator (cffi-sys:null-pointer)))
          (pcreateinfos-c
           (cffi:foreign-alloc '(:struct vkgraphicspipelinecreateinfo)
                               :initial-contents
                               (iter
                                 (for create-info in pcreateinfos)
                                 (collect
                                  (cffi:mem-ref create-info
                                                '(:struct
                                                  vkgraphicspipelinecreateinfo))))))
          (createinfocount (length pcreateinfos)))
      (cffi:with-foreign-object (ppipelines 'vkpipeline createinfocount)
        (let ((result
               (vkcreategraphicspipelines device pipelinecache-c
                createinfocount pcreateinfos-c pallocator-c ppipelines)))
          (values
           (iter
             (for i from 0 below createinfocount)
             (collect (cffi:mem-aref ppipelines 'vkpipeline i)))
           result device pallocator)))))

  (more-cffi:def-foreign-function doc-file
      ("vkCreateComputePipelines" create-compute-pipelines
       funcall-create-compute-pipelines)
      (device pipelinecache createinfocount pcreateinfos pallocator ppipelines)
    (declare-types ("VkDevice" device) ("VkPipelineCache" "pipelineCache")
     (uint32 "createInfoCount") ("VkComputePipelineCreateInfo" "pCreateInfos")
     ("VkAllocationCallbacks" "pAllocator") ("VkPipeline" "pPipelines") :return
     ("VkResult" return-value))
    (vkcreatecomputepipelines device pipelinecache createinfocount pcreateinfos
     pallocator ppipelines))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyPipeline" destroy-pipeline funcall-destroy-pipeline)
      (device pipeline pallocator)
    (declare-types ("VkDevice" device) ("VkPipeline" pipeline)
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroypipeline device pipeline pallocator-c)))

  (defun destroy-graphics-pipelines (device pipelines pallocator)
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (iter
        (for pipeline in pipelines)
        (vkdestroypipeline device pipeline pallocator-c))))

  (more-cffi:defwith doc-file with-graphics-pipelines create-graphics-pipelines
                     destroy-graphics-pipelines :destructor-arguments (2 0 3))

  (more-cffi:def-foreign-function doc-file
      ("vkCreatePipelineLayout" create-pipeline-layout
       funcall-create-pipeline-layout)
      (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device)
     ("VkPipelineLayoutCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") :return
     ("VkPipelineLayout" "pPipelineLayout") ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (ppipelinelayout 'vkpipelinelayout)
        (let ((result
               (vkcreatepipelinelayout device pcreateinfo pallocator-c
                ppipelinelayout)))
          (values (cffi:mem-ref ppipelinelayout 'vkpipelinelayout) result
                  device pallocator)))))

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyPipelineLayout" destroy-pipeline-layout
       funcall-destroy-pipeline-layout)
      (device pipelinelayout pallocator)
    (declare-types ("VkDevice" device) ("VkPipelineLayout" "pipelineLayout")
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroypipelinelayout device pipelinelayout pallocator-c)))

  (more-cffi:defwith doc-file with-pipeline-layout create-pipeline-layout
                     destroy-pipeline-layout :destructor-arguments (2 0 3))

  (more-cffi:def-foreign-function doc-file
      ("vkCreateSampler" create-sampler funcall-create-sampler)
      (device pcreateinfo pallocator psampler)
    (declare-types ("VkDevice" device) ("VkSamplerCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkSampler" "pSampler") :return
     ("VkResult" return-value))
    (vkcreatesampler device pcreateinfo pallocator psampler))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroySampler" destroy-sampler funcall-destroy-sampler)
      (device sampler pallocator)
    (declare-types ("VkDevice" device) ("VkSampler" sampler)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroysampler device sampler pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateDescriptorSetLayout" create-descriptor-set-layout
       funcall-create-descriptor-set-layout)
      (device pcreateinfo pallocator psetlayout)
    (declare-types ("VkDevice" device)
     ("VkDescriptorSetLayoutCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkDescriptorSetLayout" "pSetLayout") :return ("VkResult" return-value))
    (vkcreatedescriptorsetlayout device pcreateinfo pallocator psetlayout))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyDescriptorSetLayout" destroy-descriptor-set-layout
       funcall-destroy-descriptor-set-layout)
      (device descriptorsetlayout pallocator)
    (declare-types ("VkDevice" device)
     ("VkDescriptorSetLayout" "descriptorSetLayout")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroydescriptorsetlayout device descriptorsetlayout pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateDescriptorPool" create-descriptor-pool
       funcall-create-descriptor-pool)
      (device pcreateinfo pallocator pdescriptorpool)
    (declare-types ("VkDevice" device)
     ("VkDescriptorPoolCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkDescriptorPool" "pDescriptorPool") :return ("VkResult" return-value))
    (vkcreatedescriptorpool device pcreateinfo pallocator pdescriptorpool))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyDescriptorPool" destroy-descriptor-pool
       funcall-destroy-descriptor-pool)
      (device descriptorpool pallocator)
    (declare-types ("VkDevice" device) ("VkDescriptorPool" "descriptorPool")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroydescriptorpool device descriptorpool pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkResetDescriptorPool" reset-descriptor-pool
       funcall-reset-descriptor-pool)
      (device descriptorpool flags)
    (declare-types ("VkDevice" device) ("VkDescriptorPool" "descriptorPool")
     ("VkDescriptorPoolResetFlags" flags) :return ("VkResult" return-value))
    (vkresetdescriptorpool device descriptorpool flags))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkAllocateDescriptorSets" allocate-descriptor-sets
       funcall-allocate-descriptor-sets)
      (device pallocateinfo pdescriptorsets)
    (declare-types ("VkDevice" device)
     ("VkDescriptorSetAllocateInfo" "pAllocateInfo")
     ("VkDescriptorSet" "pDescriptorSets") :return ("VkResult" return-value))
    (vkallocatedescriptorsets device pallocateinfo pdescriptorsets))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkFreeDescriptorSets" free-descriptor-sets funcall-free-descriptor-sets)
      (device descriptorpool descriptorsetcount pdescriptorsets)
    (declare-types ("VkDevice" device) ("VkDescriptorPool" "descriptorPool")
     (uint32 "descriptorSetCount") ("VkDescriptorSet" "pDescriptorSets")
     :return ("VkResult" return-value))
    (vkfreedescriptorsets device descriptorpool descriptorsetcount
     pdescriptorsets))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkUpdateDescriptorSets" update-descriptor-sets
       funcall-update-descriptor-sets)
      (device descriptorwritecount pdescriptorwrites descriptorcopycount
       pdescriptorcopies)
    (declare-types ("VkDevice" device) (uint32 "descriptorWriteCount")
     ("VkWriteDescriptorSet" "pDescriptorWrites")
     (uint32 "descriptorCopyCount") ("VkCopyDescriptorSet" "pDescriptorCopies")
     :return ("void" return-value))
    (vkupdatedescriptorsets device descriptorwritecount pdescriptorwrites
     descriptorcopycount pdescriptorcopies))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateFramebuffer" create-framebuffer funcall-create-framebuffer)
      (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device)
     ("VkFramebufferCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") :return
     ("VkFramebuffer" "pFramebuffer") ("VkResult" result))
    (let* ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pframebuffer 'vkframebuffer)
        (let ((result
               (vkcreateframebuffer device pcreateinfo pallocator-c
                pframebuffer)))
          (values (cffi:mem-ref pframebuffer 'vkframebuffer) result device
                  pallocator)))))

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyFramebuffer" destroy-framebuffer funcall-destroy-framebuffer)
      (device framebuffer pallocator)
    (declare-types ("VkDevice" device) ("VkFramebuffer" framebuffer)
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroyframebuffer device framebuffer pallocator-c)))

  (more-cffi:defwith doc-file with-framebuffer create-framebuffer
                     destroy-framebuffer :destructor-arguments (2 0 3))

  (more-cffi:doc-note doc-file
                      "The allocator is passed to both the constructor and destructor.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateRenderPass" create-render-pass funcall-create-render-pass)
      (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkRenderPassCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") :return
     ("VkRenderPass" "pRenderPass") ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (prenderpass 'vkrenderpass)
        (let ((result
               (vkcreaterenderpass device pcreateinfo pallocator-c
                prenderpass)))
          (values (cffi:mem-ref prenderpass 'vkrenderpass) result device
                  pallocator)))))

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyRenderPass" destroy-render-pass funcall-destroy-render-pass)
      (device renderpass pallocator)
    (declare-types ("VkDevice" device) ("VkRenderPass" "renderPass")
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroyrenderpass device renderpass pallocator-c)))

  (more-cffi:defwith doc-file with-render-pass create-render-pass
                     destroy-render-pass :destructor-arguments (2 0 3))

  (more-cffi:def-foreign-function doc-file
      ("vkGetRenderAreaGranularity" get-render-area-granularity
       funcall-get-render-area-granularity)
      (device renderpass pgranularity)
    (declare-types ("VkDevice" device) ("VkRenderPass" "renderPass")
     ("VkExtent2D" "pGranularity") :return ("void" return-value))
    (vkgetrenderareagranularity device renderpass pgranularity))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateCommandPool" create-command-pool funcall-create-command-pool)
      (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device)
     ("VkCommandPoolCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") :return
     ("VkCommandPool" "pCommandPool") ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pcommandpool 'vkcommandpool)
        (let ((result
               (vkcreatecommandpool device pcreateinfo pallocator-c
                pcommandpool)))
          (values (cffi:mem-ref pcommandpool 'vkcommandpool) result device
                  pallocator)))))

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyCommandPool" destroy-command-pool funcall-destroy-command-pool)
      (device commandpool pallocator)
    (declare-types ("VkDevice" device) ("VkCommandPool" "commandPool")
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroycommandpool device commandpool pallocator-c)))

  (more-cffi:defwith doc-file with-command-pool create-command-pool
                     destroy-command-pool :destructor-arguments (2 0 3))

  (more-cffi:def-foreign-function doc-file
      ("vkResetCommandPool" reset-command-pool funcall-reset-command-pool)
      (device commandpool flags)
    (declare-types ("VkDevice" device) ("VkCommandPool" "commandPool")
     ("VkCommandPoolResetFlags" flags) :return ("VkResult" return-value))
    (vkresetcommandpool device commandpool flags))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkAllocateCommandBuffers" allocate-command-buffers
       funcall-allocate-command-buffers)
      (device pallocateinfo)
    (declare-types ("VkDevice" device)
     ("VkCommandBufferAllocateInfo" "pAllocateInfo") :return
     ((list "VkCommandBuffer") "pCommandBuffers") ("VkResult" result))
    (let ((command-buffers-count
           (command-buffer-allocate-info-commandbuffercount pallocateinfo)))
      (cffi:with-foreign-object (pcommandbuffers 'vkcommandbuffer
                                 command-buffers-count)
        (let ((result
               (vkallocatecommandbuffers device pallocateinfo pcommandbuffers)))
          (values
           (iter
             (for i from 0 below command-buffers-count)
             (collect (cffi:mem-aref pcommandbuffers 'vkcommandbuffer i)))
           result device
           (command-buffer-allocate-info-commandpool pallocateinfo))))))

  (more-cffi:def-foreign-function doc-file
      ("vkFreeCommandBuffers" free-command-buffers funcall-free-command-buffers)
      (device commandpool pcommandbuffers)
    (declare-types ("VkDevice" device) ("VkCommandPool" "commandPool")
     ((list "VkCommandBuffer") "pCommandBuffers"))
    (let ((commandbuffercount (length pcommandbuffers))
          (pcommandbuffers-c
           (cffi:foreign-alloc 'vkcommandbuffer :initial-contents
                               pcommandbuffers)))
      (vkfreecommandbuffers device commandpool commandbuffercount
       pcommandbuffers-c)
      (cffi-sys:foreign-free pcommandbuffers-c)))

  (more-cffi:defwith doc-file with-command-buffers allocate-command-buffers
                     free-command-buffers :destructor-arguments (2 3 0))

  (more-cffi:def-foreign-function doc-file
      ("vkBeginCommandBuffer" begin-command-buffer funcall-begin-command-buffer)
      (commandbuffer pbegininfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCommandBufferBeginInfo" "pBeginInfo") :return ("VkResult" result))
    (vkbegincommandbuffer commandbuffer pbegininfo))

  (more-cffi:def-foreign-function doc-file
      ("vkEndCommandBuffer" end-command-buffer funcall-end-command-buffer)
      (commandbuffer)
    (declare-types ("VkCommandBuffer" "commandBuffer") :return
     ("VkResult" return-value))
    (vkendcommandbuffer commandbuffer))

  (more-cffi:def-foreign-function doc-file
      ("vkResetCommandBuffer" reset-command-buffer funcall-reset-command-buffer)
      (commandbuffer flags)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCommandBufferResetFlags" flags) :return ("VkResult" return-value))
    (vkresetcommandbuffer commandbuffer flags))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBindPipeline" cmd-bind-pipeline funcall-cmd-bind-pipeline)
      (commandbuffer pipelinebindpoint pipeline)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineBindPoint" "pipelineBindPoint") ("VkPipeline" pipeline))
    (vkcmdbindpipeline commandbuffer pipelinebindpoint pipeline))

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetViewport" cmd-set-viewport funcall-cmd-set-viewport)
      (commandbuffer firstviewport viewportcount pviewports)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstViewport")
     (uint32 "viewportCount") ((list "VkViewport") "pViewports"))
    (let ((pviewports-c
           (cffi:foreign-alloc '(:struct vkviewport) :initial-contents
                               (iter
                                 (for viewport in
                                  (subseq pviewports firstviewport
                                          (+ firstviewport viewportcount)))
                                 (collect
                                  (cffi:mem-ref viewport
                                                '(:struct vkviewport)))))))
      (vkcmdsetviewport commandbuffer firstviewport viewportcount pviewports-c)
      (cffi-sys:foreign-free pviewports-c)))

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetScissor" cmd-set-scissor funcall-cmd-set-scissor)
      (commandbuffer firstscissor scissorcount pscissors)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstScissor")
     (uint32 "scissorCount") ("VkRect2D" "pScissors"))
    (let ((pscissors-c
           (cffi:foreign-alloc '(:struct vkrect2d) :initial-contents
                               (iter
                                 (for scissor in
                                  (subseq pscissors firstscissor
                                          (+ firstscissor scissorcount)))
                                 (collect
                                  (cffi:mem-ref scissor
                                                '(:struct vkrect2d)))))))
      (vkcmdsetscissor commandbuffer firstscissor scissorcount pscissors-c)
      (cffi-sys:foreign-free pscissors-c)))

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetLineWidth" cmd-set-line-width funcall-cmd-set-line-width)
      (commandbuffer linewidth)
    (declare-types ("VkCommandBuffer" "commandBuffer") (float "lineWidth")
     :return ("void" return-value))
    (vkcmdsetlinewidth commandbuffer linewidth))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthBias" cmd-set-depth-bias funcall-cmd-set-depth-bias)
      (commandbuffer depthbiasconstantfactor depthbiasclamp
       depthbiasslopefactor)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (float "depthBiasConstantFactor") (float "depthBiasClamp")
     (float "depthBiasSlopeFactor") :return ("void" return-value))
    (vkcmdsetdepthbias commandbuffer depthbiasconstantfactor depthbiasclamp
     depthbiasslopefactor))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetBlendConstants" cmd-set-blend-constants
       funcall-cmd-set-blend-constants)
      (commandbuffer blendconstants)
    (declare-types ("VkCommandBuffer" "commandBuffer") (float "blendConstants")
     :return ("void" return-value))
    (vkcmdsetblendconstants commandbuffer blendconstants))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthBounds" cmd-set-depth-bounds funcall-cmd-set-depth-bounds)
      (commandbuffer mindepthbounds maxdepthbounds)
    (declare-types ("VkCommandBuffer" "commandBuffer") (float "minDepthBounds")
     (float "maxDepthBounds") :return ("void" return-value))
    (vkcmdsetdepthbounds commandbuffer mindepthbounds maxdepthbounds))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetStencilCompareMask" cmd-set-stencil-compare-mask
       funcall-cmd-set-stencil-compare-mask)
      (commandbuffer facemask comparemask)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkStencilFaceFlags" "faceMask") (uint32 "compareMask") :return
     ("void" return-value))
    (vkcmdsetstencilcomparemask commandbuffer facemask comparemask))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetStencilWriteMask" cmd-set-stencil-write-mask
       funcall-cmd-set-stencil-write-mask)
      (commandbuffer facemask writemask)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkStencilFaceFlags" "faceMask") (uint32 "writeMask") :return
     ("void" return-value))
    (vkcmdsetstencilwritemask commandbuffer facemask writemask))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetStencilReference" cmd-set-stencil-reference
       funcall-cmd-set-stencil-reference)
      (commandbuffer facemask reference)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkStencilFaceFlags" "faceMask") (uint32 reference) :return
     ("void" return-value))
    (vkcmdsetstencilreference commandbuffer facemask reference))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBindDescriptorSets" cmd-bind-descriptor-sets
       funcall-cmd-bind-descriptor-sets)
      (commandbuffer pipelinebindpoint layout firstset descriptorsetcount
       pdescriptorsets dynamicoffsetcount pdynamicoffsets)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineBindPoint" "pipelineBindPoint") ("VkPipelineLayout" layout)
     (uint32 "firstSet") (uint32 "descriptorSetCount")
     ("VkDescriptorSet" "pDescriptorSets") (uint32 "dynamicOffsetCount")
     (uint32 "pDynamicOffsets") :return ("void" return-value))
    (vkcmdbinddescriptorsets commandbuffer pipelinebindpoint layout firstset
     descriptorsetcount pdescriptorsets dynamicoffsetcount pdynamicoffsets))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBindIndexBuffer" cmd-bind-index-buffer
       funcall-cmd-bind-index-buffer)
      (commandbuffer buffer offset indextype)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) ("VkIndexType" "indexType") :return
     ("void" return-value))
    (vkcmdbindindexbuffer commandbuffer buffer offset indextype))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBindVertexBuffers" cmd-bind-vertex-buffers
       funcall-cmd-bind-vertex-buffers)
      (commandbuffer firstbinding bindingcount pbuffers poffsets)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstBinding")
     (uint32 "bindingCount") ("VkBuffer" "pBuffers")
     ("VkDeviceSize" "pOffsets") :return ("void" return-value))
    (vkcmdbindvertexbuffers commandbuffer firstbinding bindingcount pbuffers
     poffsets))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDraw" cmd-draw funcall-cmd-draw)
      (commandbuffer vertexcount instancecount firstvertex firstinstance)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "vertexCount")
     (uint32 "instanceCount") (uint32 "firstVertex") (uint32 "firstInstance"))
    (vkcmddraw commandbuffer vertexcount instancecount firstvertex
     firstinstance))

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawIndexed" cmd-draw-indexed funcall-cmd-draw-indexed)
      (commandbuffer indexcount instancecount firstindex vertexoffset
       firstinstance)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "indexCount")
     (uint32 "instanceCount") (uint32 "firstIndex") (int32 "vertexOffset")
     (uint32 "firstInstance") :return ("void" return-value))
    (vkcmddrawindexed commandbuffer indexcount instancecount firstindex
     vertexoffset firstinstance))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawIndirect" cmd-draw-indirect funcall-cmd-draw-indirect)
      (commandbuffer buffer offset drawcount stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) (uint32 "drawCount") (uint32 stride) :return
     ("void" return-value))
    (vkcmddrawindirect commandbuffer buffer offset drawcount stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawIndexedIndirect" cmd-draw-indexed-indirect
       funcall-cmd-draw-indexed-indirect)
      (commandbuffer buffer offset drawcount stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) (uint32 "drawCount") (uint32 stride) :return
     ("void" return-value))
    (vkcmddrawindexedindirect commandbuffer buffer offset drawcount stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDispatch" cmd-dispatch funcall-cmd-dispatch)
      (commandbuffer groupcountx groupcounty groupcountz)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "groupCountX")
     (uint32 "groupCountY") (uint32 "groupCountZ") :return
     ("void" return-value))
    (vkcmddispatch commandbuffer groupcountx groupcounty groupcountz))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDispatchIndirect" cmd-dispatch-indirect
       funcall-cmd-dispatch-indirect)
      (commandbuffer buffer offset)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) :return ("void" return-value))
    (vkcmddispatchindirect commandbuffer buffer offset))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyBuffer" cmd-copy-buffer funcall-cmd-copy-buffer)
      (commandbuffer srcbuffer dstbuffer regioncount pregions)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" "srcBuffer")
     ("VkBuffer" "dstBuffer") (uint32 "regionCount")
     ("VkBufferCopy" "pRegions") :return ("void" return-value))
    (vkcmdcopybuffer commandbuffer srcbuffer dstbuffer regioncount pregions))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyImage" cmd-copy-image funcall-cmd-copy-image)
      (commandbuffer srcimage srcimagelayout dstimage dstimagelayout
       regioncount pregions)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkImage" "srcImage")
     ("VkImageLayout" "srcImageLayout") ("VkImage" "dstImage")
     ("VkImageLayout" "dstImageLayout") (uint32 "regionCount")
     ("VkImageCopy" "pRegions") :return ("void" return-value))
    (vkcmdcopyimage commandbuffer srcimage srcimagelayout dstimage
     dstimagelayout regioncount pregions))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBlitImage" cmd-blit-image funcall-cmd-blit-image)
      (commandbuffer srcimage srcimagelayout dstimage dstimagelayout
       regioncount pregions filter)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkImage" "srcImage")
     ("VkImageLayout" "srcImageLayout") ("VkImage" "dstImage")
     ("VkImageLayout" "dstImageLayout") (uint32 "regionCount")
     ("VkImageBlit" "pRegions") ("VkFilter" filter) :return
     ("void" return-value))
    (vkcmdblitimage commandbuffer srcimage srcimagelayout dstimage
     dstimagelayout regioncount pregions filter))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyBufferToImage" cmd-copy-buffer-to-image
       funcall-cmd-copy-buffer-to-image)
      (commandbuffer srcbuffer dstimage dstimagelayout regioncount pregions)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" "srcBuffer")
     ("VkImage" "dstImage") ("VkImageLayout" "dstImageLayout")
     (uint32 "regionCount") ("VkBufferImageCopy" "pRegions") :return
     ("void" return-value))
    (vkcmdcopybuffertoimage commandbuffer srcbuffer dstimage dstimagelayout
     regioncount pregions))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyImageToBuffer" cmd-copy-image-to-buffer
       funcall-cmd-copy-image-to-buffer)
      (commandbuffer srcimage srcimagelayout dstbuffer regioncount pregions)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkImage" "srcImage")
     ("VkImageLayout" "srcImageLayout") ("VkBuffer" "dstBuffer")
     (uint32 "regionCount") ("VkBufferImageCopy" "pRegions") :return
     ("void" return-value))
    (vkcmdcopyimagetobuffer commandbuffer srcimage srcimagelayout dstbuffer
     regioncount pregions))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdUpdateBuffer" cmd-update-buffer funcall-cmd-update-buffer)
      (commandbuffer dstbuffer dstoffset datasize pdata)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" "dstBuffer")
     ("VkDeviceSize" "dstOffset") ("VkDeviceSize" "dataSize") (void "pData")
     :return ("void" return-value))
    (vkcmdupdatebuffer commandbuffer dstbuffer dstoffset datasize pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdFillBuffer" cmd-fill-buffer funcall-cmd-fill-buffer)
      (commandbuffer dstbuffer dstoffset size data)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" "dstBuffer")
     ("VkDeviceSize" "dstOffset") ("VkDeviceSize" size) (uint32 data) :return
     ("void" return-value))
    (vkcmdfillbuffer commandbuffer dstbuffer dstoffset size data))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdClearColorImage" cmd-clear-color-image
       funcall-cmd-clear-color-image)
      (commandbuffer image imagelayout pcolor rangecount pranges)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkImage" image)
     ("VkImageLayout" "imageLayout") ("VkClearColorValue" "pColor")
     (uint32 "rangeCount") ("VkImageSubresourceRange" "pRanges") :return
     ("void" return-value))
    (vkcmdclearcolorimage commandbuffer image imagelayout pcolor rangecount
     pranges))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdClearDepthStencilImage" cmd-clear-depth-stencil-image
       funcall-cmd-clear-depth-stencil-image)
      (commandbuffer image imagelayout pdepthstencil rangecount pranges)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkImage" image)
     ("VkImageLayout" "imageLayout")
     ("VkClearDepthStencilValue" "pDepthStencil") (uint32 "rangeCount")
     ("VkImageSubresourceRange" "pRanges") :return ("void" return-value))
    (vkcmdcleardepthstencilimage commandbuffer image imagelayout pdepthstencil
     rangecount pranges))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdClearAttachments" cmd-clear-attachments
       funcall-cmd-clear-attachments)
      (commandbuffer attachmentcount pattachments rectcount prects)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "attachmentCount") ("VkClearAttachment" "pAttachments")
     (uint32 "rectCount") ("VkClearRect" "pRects") :return
     ("void" return-value))
    (vkcmdclearattachments commandbuffer attachmentcount pattachments rectcount
     prects))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdResolveImage" cmd-resolve-image funcall-cmd-resolve-image)
      (commandbuffer srcimage srcimagelayout dstimage dstimagelayout
       regioncount pregions)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkImage" "srcImage")
     ("VkImageLayout" "srcImageLayout") ("VkImage" "dstImage")
     ("VkImageLayout" "dstImageLayout") (uint32 "regionCount")
     ("VkImageResolve" "pRegions") :return ("void" return-value))
    (vkcmdresolveimage commandbuffer srcimage srcimagelayout dstimage
     dstimagelayout regioncount pregions))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetEvent" cmd-set-event funcall-cmd-set-event)
      (commandbuffer event stagemask)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkEvent" event)
     ("VkPipelineStageFlags" "stageMask") :return ("void" return-value))
    (vkcmdsetevent commandbuffer event stagemask))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdResetEvent" cmd-reset-event funcall-cmd-reset-event)
      (commandbuffer event stagemask)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkEvent" event)
     ("VkPipelineStageFlags" "stageMask") :return ("void" return-value))
    (vkcmdresetevent commandbuffer event stagemask))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdWaitEvents" cmd-wait-events funcall-cmd-wait-events)
      (commandbuffer eventcount pevents srcstagemask dststagemask
       memorybarriercount pmemorybarriers buffermemorybarriercount
       pbuffermemorybarriers imagememorybarriercount pimagememorybarriers)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "eventCount")
     ("VkEvent" "pEvents") ("VkPipelineStageFlags" "srcStageMask")
     ("VkPipelineStageFlags" "dstStageMask") (uint32 "memoryBarrierCount")
     ("VkMemoryBarrier" "pMemoryBarriers") (uint32 "bufferMemoryBarrierCount")
     ("VkBufferMemoryBarrier" "pBufferMemoryBarriers")
     (uint32 "imageMemoryBarrierCount")
     ("VkImageMemoryBarrier" "pImageMemoryBarriers") :return
     ("void" return-value))
    (vkcmdwaitevents commandbuffer eventcount pevents srcstagemask dststagemask
     memorybarriercount pmemorybarriers buffermemorybarriercount
     pbuffermemorybarriers imagememorybarriercount pimagememorybarriers))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdPipelineBarrier" cmd-pipeline-barrier funcall-cmd-pipeline-barrier)
      (commandbuffer srcstagemask dststagemask dependencyflags
       memorybarriercount pmemorybarriers buffermemorybarriercount
       pbuffermemorybarriers imagememorybarriercount pimagememorybarriers)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineStageFlags" "srcStageMask")
     ("VkPipelineStageFlags" "dstStageMask")
     ("VkDependencyFlags" "dependencyFlags") (uint32 "memoryBarrierCount")
     ("VkMemoryBarrier" "pMemoryBarriers") (uint32 "bufferMemoryBarrierCount")
     ("VkBufferMemoryBarrier" "pBufferMemoryBarriers")
     (uint32 "imageMemoryBarrierCount")
     ("VkImageMemoryBarrier" "pImageMemoryBarriers") :return
     ("void" return-value))
    (vkcmdpipelinebarrier commandbuffer srcstagemask dststagemask
     dependencyflags memorybarriercount pmemorybarriers
     buffermemorybarriercount pbuffermemorybarriers imagememorybarriercount
     pimagememorybarriers))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBeginQuery" cmd-begin-query funcall-cmd-begin-query)
      (commandbuffer querypool query flags)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkQueryPool" "queryPool") (uint32 query) ("VkQueryControlFlags" flags)
     :return ("void" return-value))
    (vkcmdbeginquery commandbuffer querypool query flags))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdEndQuery" cmd-end-query funcall-cmd-end-query)
      (commandbuffer querypool query)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkQueryPool" "queryPool") (uint32 query) :return ("void" return-value))
    (vkcmdendquery commandbuffer querypool query))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdResetQueryPool" cmd-reset-query-pool funcall-cmd-reset-query-pool)
      (commandbuffer querypool firstquery querycount)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkQueryPool" "queryPool") (uint32 "firstQuery") (uint32 "queryCount")
     :return ("void" return-value))
    (vkcmdresetquerypool commandbuffer querypool firstquery querycount))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdWriteTimestamp" cmd-write-timestamp funcall-cmd-write-timestamp)
      (commandbuffer pipelinestage querypool query)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineStageFlagBits" "pipelineStage") ("VkQueryPool" "queryPool")
     (uint32 query) :return ("void" return-value))
    (vkcmdwritetimestamp commandbuffer pipelinestage querypool query))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyQueryPoolResults" cmd-copy-query-pool-results
       funcall-cmd-copy-query-pool-results)
      (commandbuffer querypool firstquery querycount dstbuffer dstoffset stride
       flags)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkQueryPool" "queryPool") (uint32 "firstQuery") (uint32 "queryCount")
     ("VkBuffer" "dstBuffer") ("VkDeviceSize" "dstOffset")
     ("VkDeviceSize" stride) ("VkQueryResultFlags" flags) :return
     ("void" return-value))
    (vkcmdcopyquerypoolresults commandbuffer querypool firstquery querycount
     dstbuffer dstoffset stride flags))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdPushConstants" cmd-push-constants funcall-cmd-push-constants)
      (commandbuffer layout stageflags offset size pvalues)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineLayout" layout) ("VkShaderStageFlags" "stageFlags")
     (uint32 offset) (uint32 size) (void "pValues") :return
     ("void" return-value))
    (vkcmdpushconstants commandbuffer layout stageflags offset size pvalues))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBeginRenderPass" cmd-begin-render-pass
       funcall-cmd-begin-render-pass)
      (commandbuffer prenderpassbegin contents)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkRenderPassBeginInfo" "pRenderPassBegin")
     ("VkSubpassContents" contents))
    (vkcmdbeginrenderpass commandbuffer prenderpassbegin contents))

  (more-cffi:def-foreign-function doc-file
      ("vkCmdNextSubpass" cmd-next-subpass funcall-cmd-next-subpass)
      (commandbuffer contents)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkSubpassContents" contents) :return ("void" return-value))
    (vkcmdnextsubpass commandbuffer contents))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdEndRenderPass" cmd-end-render-pass funcall-cmd-end-render-pass)
      (commandbuffer)
    (declare-types ("VkCommandBuffer" "commandBuffer"))
    (vkcmdendrenderpass commandbuffer))

  (more-cffi:def-foreign-function doc-file
      ("vkCmdExecuteCommands" cmd-execute-commands funcall-cmd-execute-commands)
      (commandbuffer commandbuffercount pcommandbuffers)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "commandBufferCount") ("VkCommandBuffer" "pCommandBuffers")
     :return ("void" return-value))
    (vkcmdexecutecommands commandbuffer commandbuffercount pcommandbuffers))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkEnumerateInstanceVersion" enumerate-instance-version
       funcall-enumerate-instance-version)
      (papiversion)
    (declare-types (uint32 "pApiVersion") :return ("VkResult" return-value))
    (vkenumerateinstanceversion papiversion))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkBindBufferMemory2" bind-buffer-memory-2 funcall-bind-buffer-memory-2)
      (device bindinfocount pbindinfos)
    (declare-types ("VkDevice" device) (uint32 "bindInfoCount")
     ("VkBindBufferMemoryInfo" "pBindInfos") :return ("VkResult" return-value))
    (vkbindbuffermemory2 device bindinfocount pbindinfos))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkBindImageMemory2" bind-image-memory-2 funcall-bind-image-memory-2)
      (device bindinfocount pbindinfos)
    (declare-types ("VkDevice" device) (uint32 "bindInfoCount")
     ("VkBindImageMemoryInfo" "pBindInfos") :return ("VkResult" return-value))
    (vkbindimagememory2 device bindinfocount pbindinfos))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceGroupPeerMemoryFeatures"
       get-device-group-peer-memory-features
       funcall-get-device-group-peer-memory-features)
      (device heapindex localdeviceindex remotedeviceindex ppeermemoryfeatures)
    (declare-types ("VkDevice" device) (uint32 "heapIndex")
     (uint32 "localDeviceIndex") (uint32 "remoteDeviceIndex")
     ("VkPeerMemoryFeatureFlags" "pPeerMemoryFeatures") :return
     ("void" return-value))
    (vkgetdevicegrouppeermemoryfeatures device heapindex localdeviceindex
     remotedeviceindex ppeermemoryfeatures))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDeviceMask" cmd-set-device-mask funcall-cmd-set-device-mask)
      (commandbuffer devicemask)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "deviceMask")
     :return ("void" return-value))
    (vkcmdsetdevicemask commandbuffer devicemask))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDispatchBase" cmd-dispatch-base funcall-cmd-dispatch-base)
      (commandbuffer basegroupx basegroupy basegroupz groupcountx groupcounty
       groupcountz)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "baseGroupX")
     (uint32 "baseGroupY") (uint32 "baseGroupZ") (uint32 "groupCountX")
     (uint32 "groupCountY") (uint32 "groupCountZ") :return
     ("void" return-value))
    (vkcmddispatchbase commandbuffer basegroupx basegroupy basegroupz
     groupcountx groupcounty groupcountz))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkEnumeratePhysicalDeviceGroups" enumerate-physical-device-groups
       funcall-enumerate-physical-device-groups)
      (instance pphysicaldevicegroupcount pphysicaldevicegroupproperties)
    (declare-types ("VkInstance" instance) (uint32 "pPhysicalDeviceGroupCount")
     ("VkPhysicalDeviceGroupProperties" "pPhysicalDeviceGroupProperties")
     :return ("VkResult" return-value))
    (vkenumeratephysicaldevicegroups instance pphysicaldevicegroupcount
     pphysicaldevicegroupproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageMemoryRequirements2" get-image-memory-requirements-2
       funcall-get-image-memory-requirements-2)
      (device pinfo pmemoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkImageMemoryRequirementsInfo2" "pInfo")
     ("VkMemoryRequirements2" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetimagememoryrequirements2 device pinfo pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetBufferMemoryRequirements2" get-buffer-memory-requirements-2
       funcall-get-buffer-memory-requirements-2)
      (device pinfo pmemoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkBufferMemoryRequirementsInfo2" "pInfo")
     ("VkMemoryRequirements2" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetbuffermemoryrequirements2 device pinfo pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageSparseMemoryRequirements2"
       get-image-sparse-memory-requirements-2
       funcall-get-image-sparse-memory-requirements-2)
      (device pinfo psparsememoryrequirementcount psparsememoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkImageSparseMemoryRequirementsInfo2" "pInfo")
     (uint32 "pSparseMemoryRequirementCount")
     ("VkSparseImageMemoryRequirements2" "pSparseMemoryRequirements") :return
     ("void" return-value))
    (vkgetimagesparsememoryrequirements2 device pinfo
     psparsememoryrequirementcount psparsememoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceFeatures2" get-physical-device-features-2
       funcall-get-physical-device-features-2)
      (physicaldevice pfeatures)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceFeatures2" "pFeatures") :return ("void" return-value))
    (vkgetphysicaldevicefeatures2 physicaldevice pfeatures))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceProperties2" get-physical-device-properties-2
       funcall-get-physical-device-properties-2)
      (physicaldevice pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceProperties2" "pProperties") :return
     ("void" return-value))
    (vkgetphysicaldeviceproperties2 physicaldevice pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceFormatProperties2"
       get-physical-device-format-properties-2
       funcall-get-physical-device-format-properties-2)
      (physicaldevice format pformatproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkFormat" format)
     ("VkFormatProperties2" "pFormatProperties") :return ("void" return-value))
    (vkgetphysicaldeviceformatproperties2 physicaldevice format
     pformatproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceImageFormatProperties2"
       get-physical-device-image-format-properties-2
       funcall-get-physical-device-image-format-properties-2)
      (physicaldevice pimageformatinfo pimageformatproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceImageFormatInfo2" "pImageFormatInfo")
     ("VkImageFormatProperties2" "pImageFormatProperties") :return
     ("VkResult" return-value))
    (vkgetphysicaldeviceimageformatproperties2 physicaldevice pimageformatinfo
     pimageformatproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceQueueFamilyProperties2"
       get-physical-device-queue-family-properties-2
       funcall-get-physical-device-queue-family-properties-2)
      (physicaldevice pqueuefamilypropertycount pqueuefamilyproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pQueueFamilyPropertyCount")
     ("VkQueueFamilyProperties2" "pQueueFamilyProperties") :return
     ("void" return-value))
    (vkgetphysicaldevicequeuefamilyproperties2 physicaldevice
     pqueuefamilypropertycount pqueuefamilyproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceMemoryProperties2"
       get-physical-device-memory-properties-2
       funcall-get-physical-device-memory-properties-2)
      (physicaldevice pmemoryproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceMemoryProperties2" "pMemoryProperties") :return
     ("void" return-value))
    (vkgetphysicaldevicememoryproperties2 physicaldevice pmemoryproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSparseImageFormatProperties2"
       get-physical-device-sparse-image-format-properties-2
       funcall-get-physical-device-sparse-image-format-properties-2)
      (physicaldevice pformatinfo ppropertycount pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceSparseImageFormatInfo2" "pFormatInfo")
     (uint32 "pPropertyCount") ("VkSparseImageFormatProperties2" "pProperties")
     :return ("void" return-value))
    (vkgetphysicaldevicesparseimageformatproperties2 physicaldevice pformatinfo
     ppropertycount pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkTrimCommandPool" trim-command-pool funcall-trim-command-pool)
      (device commandpool flags)
    (declare-types ("VkDevice" device) ("VkCommandPool" "commandPool")
     ("VkCommandPoolTrimFlags" flags) :return ("void" return-value))
    (vktrimcommandpool device commandpool flags))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceQueue2" get-device-queue-2 funcall-get-device-queue-2)
      (device pqueueinfo pqueue)
    (declare-types ("VkDevice" device) ("VkDeviceQueueInfo2" "pQueueInfo")
     ("VkQueue" "pQueue") :return ("void" return-value))
    (vkgetdevicequeue2 device pqueueinfo pqueue))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateSamplerYcbcrConversion" create-sampler-ycbcr-conversion
       funcall-create-sampler-ycbcr-conversion)
      (device pcreateinfo pallocator pycbcrconversion)
    (declare-types ("VkDevice" device)
     ("VkSamplerYcbcrConversionCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkSamplerYcbcrConversion" "pYcbcrConversion") :return
     ("VkResult" return-value))
    (vkcreatesamplerycbcrconversion device pcreateinfo pallocator
     pycbcrconversion))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroySamplerYcbcrConversion" destroy-sampler-ycbcr-conversion
       funcall-destroy-sampler-ycbcr-conversion)
      (device ycbcrconversion pallocator)
    (declare-types ("VkDevice" device)
     ("VkSamplerYcbcrConversion" "ycbcrConversion")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroysamplerycbcrconversion device ycbcrconversion pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateDescriptorUpdateTemplate" create-descriptor-update-template
       funcall-create-descriptor-update-template)
      (device pcreateinfo pallocator pdescriptorupdatetemplate)
    (declare-types ("VkDevice" device)
     ("VkDescriptorUpdateTemplateCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkDescriptorUpdateTemplate" "pDescriptorUpdateTemplate") :return
     ("VkResult" return-value))
    (vkcreatedescriptorupdatetemplate device pcreateinfo pallocator
     pdescriptorupdatetemplate))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyDescriptorUpdateTemplate" destroy-descriptor-update-template
       funcall-destroy-descriptor-update-template)
      (device descriptorupdatetemplate pallocator)
    (declare-types ("VkDevice" device)
     ("VkDescriptorUpdateTemplate" "descriptorUpdateTemplate")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroydescriptorupdatetemplate device descriptorupdatetemplate
     pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkUpdateDescriptorSetWithTemplate" update-descriptor-set-with-template
       funcall-update-descriptor-set-with-template)
      (device descriptorset descriptorupdatetemplate pdata)
    (declare-types ("VkDevice" device) ("VkDescriptorSet" "descriptorSet")
     ("VkDescriptorUpdateTemplate" "descriptorUpdateTemplate") (void "pData")
     :return ("void" return-value))
    (vkupdatedescriptorsetwithtemplate device descriptorset
     descriptorupdatetemplate pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceExternalBufferProperties"
       get-physical-device-external-buffer-properties
       funcall-get-physical-device-external-buffer-properties)
      (physicaldevice pexternalbufferinfo pexternalbufferproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceExternalBufferInfo" "pExternalBufferInfo")
     ("VkExternalBufferProperties" "pExternalBufferProperties") :return
     ("void" return-value))
    (vkgetphysicaldeviceexternalbufferproperties physicaldevice
     pexternalbufferinfo pexternalbufferproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceExternalFenceProperties"
       get-physical-device-external-fence-properties
       funcall-get-physical-device-external-fence-properties)
      (physicaldevice pexternalfenceinfo pexternalfenceproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceExternalFenceInfo" "pExternalFenceInfo")
     ("VkExternalFenceProperties" "pExternalFenceProperties") :return
     ("void" return-value))
    (vkgetphysicaldeviceexternalfenceproperties physicaldevice
     pexternalfenceinfo pexternalfenceproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceExternalSemaphoreProperties"
       get-physical-device-external-semaphore-properties
       funcall-get-physical-device-external-semaphore-properties)
      (physicaldevice pexternalsemaphoreinfo pexternalsemaphoreproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceExternalSemaphoreInfo" "pExternalSemaphoreInfo")
     ("VkExternalSemaphoreProperties" "pExternalSemaphoreProperties") :return
     ("void" return-value))
    (vkgetphysicaldeviceexternalsemaphoreproperties physicaldevice
     pexternalsemaphoreinfo pexternalsemaphoreproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDescriptorSetLayoutSupport" get-descriptor-set-layout-support
       funcall-get-descriptor-set-layout-support)
      (device pcreateinfo psupport)
    (declare-types ("VkDevice" device)
     ("VkDescriptorSetLayoutCreateInfo" "pCreateInfo")
     ("VkDescriptorSetLayoutSupport" "pSupport") :return ("void" return-value))
    (vkgetdescriptorsetlayoutsupport device pcreateinfo psupport))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawIndirectCount" cmd-draw-indirect-count
       funcall-cmd-draw-indirect-count)
      (commandbuffer buffer offset countbuffer countbufferoffset maxdrawcount
       stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) ("VkBuffer" "countBuffer")
     ("VkDeviceSize" "countBufferOffset") (uint32 "maxDrawCount")
     (uint32 stride) :return ("void" return-value))
    (vkcmddrawindirectcount commandbuffer buffer offset countbuffer
     countbufferoffset maxdrawcount stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawIndexedIndirectCount" cmd-draw-indexed-indirect-count
       funcall-cmd-draw-indexed-indirect-count)
      (commandbuffer buffer offset countbuffer countbufferoffset maxdrawcount
       stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) ("VkBuffer" "countBuffer")
     ("VkDeviceSize" "countBufferOffset") (uint32 "maxDrawCount")
     (uint32 stride) :return ("void" return-value))
    (vkcmddrawindexedindirectcount commandbuffer buffer offset countbuffer
     countbufferoffset maxdrawcount stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateRenderPass2" create-render-pass-2 funcall-create-render-pass-2)
      (device pcreateinfo pallocator prenderpass)
    (declare-types ("VkDevice" device)
     ("VkRenderPassCreateInfo2" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkRenderPass" "pRenderPass")
     :return ("VkResult" return-value))
    (vkcreaterenderpass2 device pcreateinfo pallocator prenderpass))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBeginRenderPass2" cmd-begin-render-pass-2
       funcall-cmd-begin-render-pass-2)
      (commandbuffer prenderpassbegin psubpassbegininfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkRenderPassBeginInfo" "pRenderPassBegin")
     ("VkSubpassBeginInfo" "pSubpassBeginInfo") :return ("void" return-value))
    (vkcmdbeginrenderpass2 commandbuffer prenderpassbegin psubpassbegininfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdNextSubpass2" cmd-next-subpass-2 funcall-cmd-next-subpass-2)
      (commandbuffer psubpassbegininfo psubpassendinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkSubpassBeginInfo" "pSubpassBeginInfo")
     ("VkSubpassEndInfo" "pSubpassEndInfo") :return ("void" return-value))
    (vkcmdnextsubpass2 commandbuffer psubpassbegininfo psubpassendinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdEndRenderPass2" cmd-end-render-pass-2
       funcall-cmd-end-render-pass-2)
      (commandbuffer psubpassendinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkSubpassEndInfo" "pSubpassEndInfo") :return ("void" return-value))
    (vkcmdendrenderpass2 commandbuffer psubpassendinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkResetQueryPool" reset-query-pool funcall-reset-query-pool)
      (device querypool firstquery querycount)
    (declare-types ("VkDevice" device) ("VkQueryPool" "queryPool")
     (uint32 "firstQuery") (uint32 "queryCount") :return ("void" return-value))
    (vkresetquerypool device querypool firstquery querycount))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetSemaphoreCounterValue" get-semaphore-counter-value
       funcall-get-semaphore-counter-value)
      (device semaphore pvalue)
    (declare-types ("VkDevice" device) ("VkSemaphore" semaphore)
     (uint64 "pValue") :return ("VkResult" return-value))
    (vkgetsemaphorecountervalue device semaphore pvalue))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkWaitSemaphores" wait-semaphores funcall-wait-semaphores)
      (device pwaitinfo timeout)
    (declare-types ("VkDevice" device) ("VkSemaphoreWaitInfo" "pWaitInfo")
     (uint64 timeout) :return ("VkResult" return-value))
    (vkwaitsemaphores device pwaitinfo timeout))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkSignalSemaphore" signal-semaphore funcall-signal-semaphore)
      (device psignalinfo)
    (declare-types ("VkDevice" device) ("VkSemaphoreSignalInfo" "pSignalInfo")
     :return ("VkResult" return-value))
    (vksignalsemaphore device psignalinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetBufferDeviceAddress" get-buffer-device-address
       funcall-get-buffer-device-address)
      (device pinfo)
    (declare-types ("VkDevice" device) ("VkBufferDeviceAddressInfo" "pInfo")
     :return ("VkDeviceAddress" return-value))
    (vkgetbufferdeviceaddress device pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetBufferOpaqueCaptureAddress" get-buffer-opaque-capture-address
       funcall-get-buffer-opaque-capture-address)
      (device pinfo)
    (declare-types ("VkDevice" device) ("VkBufferDeviceAddressInfo" "pInfo")
     :return ("uint64_t" return-value))
    (vkgetbufferopaquecaptureaddress device pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceMemoryOpaqueCaptureAddress"
       get-device-memory-opaque-capture-address
       funcall-get-device-memory-opaque-capture-address)
      (device pinfo)
    (declare-types ("VkDevice" device)
     ("VkDeviceMemoryOpaqueCaptureAddressInfo" "pInfo") :return
     ("uint64_t" return-value))
    (vkgetdevicememoryopaquecaptureaddress device pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceToolProperties" get-physical-device-tool-properties
       funcall-get-physical-device-tool-properties)
      (physicaldevice ptoolcount ptoolproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (uint32 "pToolCount")
     ("VkPhysicalDeviceToolProperties" "pToolProperties") :return
     ("VkResult" return-value))
    (vkgetphysicaldevicetoolproperties physicaldevice ptoolcount
     ptoolproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreatePrivateDataSlot" create-private-data-slot
       funcall-create-private-data-slot)
      (device pcreateinfo pallocator pprivatedataslot)
    (declare-types ("VkDevice" device)
     ("VkPrivateDataSlotCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkPrivateDataSlot" "pPrivateDataSlot") :return ("VkResult" return-value))
    (vkcreateprivatedataslot device pcreateinfo pallocator pprivatedataslot))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyPrivateDataSlot" destroy-private-data-slot
       funcall-destroy-private-data-slot)
      (device privatedataslot pallocator)
    (declare-types ("VkDevice" device) ("VkPrivateDataSlot" "privateDataSlot")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroyprivatedataslot device privatedataslot pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkSetPrivateData" set-private-data funcall-set-private-data)
      (device objecttype objecthandle privatedataslot data)
    (declare-types ("VkDevice" device) ("VkObjectType" "objectType")
     (uint64 "objectHandle") ("VkPrivateDataSlot" "privateDataSlot")
     (uint64 data) :return ("VkResult" return-value))
    (vksetprivatedata device objecttype objecthandle privatedataslot data))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPrivateData" get-private-data funcall-get-private-data)
      (device objecttype objecthandle privatedataslot pdata)
    (declare-types ("VkDevice" device) ("VkObjectType" "objectType")
     (uint64 "objectHandle") ("VkPrivateDataSlot" "privateDataSlot")
     (uint64 "pData") :return ("void" return-value))
    (vkgetprivatedata device objecttype objecthandle privatedataslot pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetEvent2" cmd-set-event-2 funcall-cmd-set-event-2)
      (commandbuffer event pdependencyinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkEvent" event)
     ("VkDependencyInfo" "pDependencyInfo") :return ("void" return-value))
    (vkcmdsetevent2 commandbuffer event pdependencyinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdResetEvent2" cmd-reset-event-2 funcall-cmd-reset-event-2)
      (commandbuffer event stagemask)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkEvent" event)
     ("VkPipelineStageFlags2" "stageMask") :return ("void" return-value))
    (vkcmdresetevent2 commandbuffer event stagemask))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdWaitEvents2" cmd-wait-events-2 funcall-cmd-wait-events-2)
      (commandbuffer eventcount pevents pdependencyinfos)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "eventCount")
     ("VkEvent" "pEvents") ("VkDependencyInfo" "pDependencyInfos") :return
     ("void" return-value))
    (vkcmdwaitevents2 commandbuffer eventcount pevents pdependencyinfos))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdPipelineBarrier2" cmd-pipeline-barrier-2
       funcall-cmd-pipeline-barrier-2)
      (commandbuffer pdependencyinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkDependencyInfo" "pDependencyInfo") :return ("void" return-value))
    (vkcmdpipelinebarrier2 commandbuffer pdependencyinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdWriteTimestamp2" cmd-write-timestamp-2
       funcall-cmd-write-timestamp-2)
      (commandbuffer stage querypool query)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineStageFlags2" stage) ("VkQueryPool" "queryPool") (uint32 query)
     :return ("void" return-value))
    (vkcmdwritetimestamp2 commandbuffer stage querypool query))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkQueueSubmit2" queue-submit-2 funcall-queue-submit-2)
      (queue submitcount psubmits fence)
    (declare-types ("VkQueue" queue) (uint32 "submitCount")
     ("VkSubmitInfo2" "pSubmits") ("VkFence" fence) :return
     ("VkResult" return-value))
    (vkqueuesubmit2 queue submitcount psubmits fence))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyBuffer2" cmd-copy-buffer-2 funcall-cmd-copy-buffer-2)
      (commandbuffer pcopybufferinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyBufferInfo2" "pCopyBufferInfo") :return ("void" return-value))
    (vkcmdcopybuffer2 commandbuffer pcopybufferinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyImage2" cmd-copy-image-2 funcall-cmd-copy-image-2)
      (commandbuffer pcopyimageinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyImageInfo2" "pCopyImageInfo") :return ("void" return-value))
    (vkcmdcopyimage2 commandbuffer pcopyimageinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyBufferToImage2" cmd-copy-buffer-to-image-2
       funcall-cmd-copy-buffer-to-image-2)
      (commandbuffer pcopybuffertoimageinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyBufferToImageInfo2" "pCopyBufferToImageInfo") :return
     ("void" return-value))
    (vkcmdcopybuffertoimage2 commandbuffer pcopybuffertoimageinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyImageToBuffer2" cmd-copy-image-to-buffer-2
       funcall-cmd-copy-image-to-buffer-2)
      (commandbuffer pcopyimagetobufferinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyImageToBufferInfo2" "pCopyImageToBufferInfo") :return
     ("void" return-value))
    (vkcmdcopyimagetobuffer2 commandbuffer pcopyimagetobufferinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBlitImage2" cmd-blit-image-2 funcall-cmd-blit-image-2)
      (commandbuffer pblitimageinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBlitImageInfo2" "pBlitImageInfo") :return ("void" return-value))
    (vkcmdblitimage2 commandbuffer pblitimageinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdResolveImage2" cmd-resolve-image-2 funcall-cmd-resolve-image-2)
      (commandbuffer presolveimageinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkResolveImageInfo2" "pResolveImageInfo") :return ("void" return-value))
    (vkcmdresolveimage2 commandbuffer presolveimageinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBeginRendering" cmd-begin-rendering funcall-cmd-begin-rendering)
      (commandbuffer prenderinginfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkRenderingInfo" "pRenderingInfo") :return ("void" return-value))
    (vkcmdbeginrendering commandbuffer prenderinginfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdEndRendering" cmd-end-rendering funcall-cmd-end-rendering)
      (commandbuffer)
    (declare-types ("VkCommandBuffer" "commandBuffer") :return
     ("void" return-value))
    (vkcmdendrendering commandbuffer))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetCullMode" cmd-set-cull-mode funcall-cmd-set-cull-mode)
      (commandbuffer cullmode)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCullModeFlags" "cullMode") :return ("void" return-value))
    (vkcmdsetcullmode commandbuffer cullmode))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetFrontFace" cmd-set-front-face funcall-cmd-set-front-face)
      (commandbuffer frontface)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkFrontFace" "frontFace") :return ("void" return-value))
    (vkcmdsetfrontface commandbuffer frontface))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetPrimitiveTopology" cmd-set-primitive-topology
       funcall-cmd-set-primitive-topology)
      (commandbuffer primitivetopology)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPrimitiveTopology" "primitiveTopology") :return ("void" return-value))
    (vkcmdsetprimitivetopology commandbuffer primitivetopology))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetViewportWithCount" cmd-set-viewport-with-count
       funcall-cmd-set-viewport-with-count)
      (commandbuffer viewportcount pviewports)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "viewportCount")
     ("VkViewport" "pViewports") :return ("void" return-value))
    (vkcmdsetviewportwithcount commandbuffer viewportcount pviewports))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetScissorWithCount" cmd-set-scissor-with-count
       funcall-cmd-set-scissor-with-count)
      (commandbuffer scissorcount pscissors)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "scissorCount")
     ("VkRect2D" "pScissors") :return ("void" return-value))
    (vkcmdsetscissorwithcount commandbuffer scissorcount pscissors))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBindVertexBuffers2" cmd-bind-vertex-buffers-2
       funcall-cmd-bind-vertex-buffers-2)
      (commandbuffer firstbinding bindingcount pbuffers poffsets psizes
       pstrides)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstBinding")
     (uint32 "bindingCount") ("VkBuffer" "pBuffers")
     ("VkDeviceSize" "pOffsets") ("VkDeviceSize" "pSizes")
     ("VkDeviceSize" "pStrides") :return ("void" return-value))
    (vkcmdbindvertexbuffers2 commandbuffer firstbinding bindingcount pbuffers
     poffsets psizes pstrides))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthTestEnable" cmd-set-depth-test-enable
       funcall-cmd-set-depth-test-enable)
      (commandbuffer depthtestenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "depthTestEnable") :return ("void" return-value))
    (vkcmdsetdepthtestenable commandbuffer depthtestenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthWriteEnable" cmd-set-depth-write-enable
       funcall-cmd-set-depth-write-enable)
      (commandbuffer depthwriteenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "depthWriteEnable") :return ("void" return-value))
    (vkcmdsetdepthwriteenable commandbuffer depthwriteenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthCompareOp" cmd-set-depth-compare-op
       funcall-cmd-set-depth-compare-op)
      (commandbuffer depthcompareop)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCompareOp" "depthCompareOp") :return ("void" return-value))
    (vkcmdsetdepthcompareop commandbuffer depthcompareop))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthBoundsTestEnable" cmd-set-depth-bounds-test-enable
       funcall-cmd-set-depth-bounds-test-enable)
      (commandbuffer depthboundstestenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "depthBoundsTestEnable") :return ("void" return-value))
    (vkcmdsetdepthboundstestenable commandbuffer depthboundstestenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetStencilTestEnable" cmd-set-stencil-test-enable
       funcall-cmd-set-stencil-test-enable)
      (commandbuffer stenciltestenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "stencilTestEnable") :return ("void" return-value))
    (vkcmdsetstenciltestenable commandbuffer stenciltestenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetStencilOp" cmd-set-stencil-op funcall-cmd-set-stencil-op)
      (commandbuffer facemask failop passop depthfailop compareop)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkStencilFaceFlags" "faceMask") ("VkStencilOp" "failOp")
     ("VkStencilOp" "passOp") ("VkStencilOp" "depthFailOp")
     ("VkCompareOp" "compareOp") :return ("void" return-value))
    (vkcmdsetstencilop commandbuffer facemask failop passop depthfailop
     compareop))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetRasterizerDiscardEnable" cmd-set-rasterizer-discard-enable
       funcall-cmd-set-rasterizer-discard-enable)
      (commandbuffer rasterizerdiscardenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "rasterizerDiscardEnable") :return ("void" return-value))
    (vkcmdsetrasterizerdiscardenable commandbuffer rasterizerdiscardenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthBiasEnable" cmd-set-depth-bias-enable
       funcall-cmd-set-depth-bias-enable)
      (commandbuffer depthbiasenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "depthBiasEnable") :return ("void" return-value))
    (vkcmdsetdepthbiasenable commandbuffer depthbiasenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetPrimitiveRestartEnable" cmd-set-primitive-restart-enable
       funcall-cmd-set-primitive-restart-enable)
      (commandbuffer primitiverestartenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "primitiveRestartEnable") :return ("void" return-value))
    (vkcmdsetprimitiverestartenable commandbuffer primitiverestartenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceBufferMemoryRequirements"
       get-device-buffer-memory-requirements
       funcall-get-device-buffer-memory-requirements)
      (device pinfo pmemoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkDeviceBufferMemoryRequirements" "pInfo")
     ("VkMemoryRequirements2" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetdevicebuffermemoryrequirements device pinfo pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceImageMemoryRequirements"
       get-device-image-memory-requirements
       funcall-get-device-image-memory-requirements)
      (device pinfo pmemoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkDeviceImageMemoryRequirements" "pInfo")
     ("VkMemoryRequirements2" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetdeviceimagememoryrequirements device pinfo pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceImageSparseMemoryRequirements"
       get-device-image-sparse-memory-requirements
       funcall-get-device-image-sparse-memory-requirements)
      (device pinfo psparsememoryrequirementcount psparsememoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkDeviceImageMemoryRequirements" "pInfo")
     (uint32 "pSparseMemoryRequirementCount")
     ("VkSparseImageMemoryRequirements2" "pSparseMemoryRequirements") :return
     ("void" return-value))
    (vkgetdeviceimagesparsememoryrequirements device pinfo
     psparsememoryrequirementcount psparsememoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroySurfaceKHR" destroy-surface-khr funcall-destroy-surface-khr)
      (instance surface pallocator)
    (declare-types ("VkInstance" instance) ("VkSurfaceKHR" surface)
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroysurfacekhr instance surface pallocator-c)))

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSurfaceSupportKHR"
       get-physical-device-surface-support-khr
       funcall-get-physical-device-surface-support-khr)
      (physicaldevice queuefamilyindex surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "queueFamilyIndex") ("VkSurfaceKHR" surface) :return
     (boolean "pSupported") ("VkResult" result))
    (cffi:with-foreign-object (psupported 'vkbool32)
      (let ((result
             (vkgetphysicaldevicesurfacesupportkhr physicaldevice
              queuefamilyindex surface psupported))
            (supportedp (cffi:mem-ref psupported 'vkbool32)))
        (values (equal supportedp vk_true) result))))

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSurfaceCapabilitiesKHR"
       create-get-physical-device-surface-capabilities-khr
       funcall-get-physical-device-surface-capabilities-khr)
      (physicaldevice surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkSurfaceKHR" surface) :return
     ("VkSurfaceCapabilitiesKHR" "pSurfaceCapabilities") ("VkResult" result))
    (let* ((psurfacecapabilities
            (cffi:foreign-alloc '(:struct vksurfacecapabilitieskhr)))
           (result
            (vkgetphysicaldevicesurfacecapabilitieskhr physicaldevice surface
             psurfacecapabilities)))
      (values psurfacecapabilities result)))

  (more-cffi:def-foreign-function doc-file
      (nil destroy-get-physical-device-surface-capabilities-khr
       funcall-destroy-get-physical-device-surface-capabilities-khr)
      (psurfacecapabilities)
    (declare-types ("VkSurfaceCapabilitiesKHR" "pSurfaceCapabilities"))
    (cffi-sys:foreign-free psurfacecapabilities))

  (more-cffi:defwith doc-file with-get-physical-device-surface-capabilities-khr
                     create-get-physical-device-surface-capabilities
                     destroy-get-physical-device-surface-capabilities)

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSurfaceFormatsKHR"
       create-get-physical-device-surface-formats-khr
       funcall-get-physical-device-surface-formats-khr)
      (physicaldevice surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkSurfaceKHR" surface) :return ("VkSurfaceFormatKHR" "pSurfaceFormats")
     ("VkResult" result))
    (cffi:with-foreign-object (psurfaceformatcount :uint32)
      (vkgetphysicaldevicesurfaceformatskhr physicaldevice surface
       psurfaceformatcount (cffi-sys:null-pointer))
      (let* ((surface-format-count (cffi:mem-ref psurfaceformatcount :uint32))
             (psurfaceformats
              (cffi:foreign-alloc '(:struct vksurfaceformatkhr) :count
                                  surface-format-count))
             (result
              (vkgetphysicaldevicesurfaceformatskhr physicaldevice surface
               psurfaceformatcount psurfaceformats))
             (surface-formats
              (iter
                (for i from 0 below surface-format-count)
                (collect
                 (cffi:mem-aptr psurfaceformats '(:struct vksurfaceformatkhr)
                                i)))))
        (values surface-formats result))))

  (more-cffi:def-foreign-function doc-file
      (nil destroy-get-physical-device-surface-formats-khr
       funcall-destroy-get-physical-device-surface-formats-khr)
      (psurfaceformats)
    (declare-types ((list "VkSurfaceFormatKHR") "pSurfaceFormats"))
    (cffi-sys:foreign-free (car psurfaceformats)))

  (more-cffi:defwith doc-file with-get-physical-device-surface-formats-khr
                     create-get-physical-device-surface-formats
                     destroy-get-physical-device-surface-formats)

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSurfacePresentModesKHR"
       get-physical-device-surface-present-modes-khr
       funcall-get-physical-device-surface-present-modes-khr)
      (physicaldevice surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkSurfaceKHR" surface) :return ("VkPresentModeKHR" "pPresentModes")
     ("VkResult" result))
    (cffi:with-foreign-object (ppresentmodecount :uint32)
      (vkgetphysicaldevicesurfacepresentmodeskhr physicaldevice surface
       ppresentmodecount (cffi-sys:null-pointer))
      (let* ((present-mode-count (cffi:mem-ref ppresentmodecount :uint32)))
        (cffi:with-foreign-object (ppresentmodes 'vkpresentmodekhr
                                   present-mode-count)
          (let ((result
                 (vkgetphysicaldevicesurfacepresentmodeskhr physicaldevice
                  surface ppresentmodecount ppresentmodes))
                (present-modes
                 (iter
                   (for i from 0 below present-mode-count)
                   (collect
                    (cffi:mem-aref ppresentmodes 'vkpresentmodekhr i)))))
            (values present-modes result))))))

  (more-cffi:def-foreign-function doc-file
      ("vkCreateSwapchainKHR" create-swapchain-khr funcall-create-swapchain-khr)
      (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device)
     ("VkSwapchainCreateInfoKHR" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") :return
     ("VkSwapchainKHR" "pSwapchain") ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pswapchain 'vkswapchainkhr)
        (let ((result
               (vkcreateswapchainkhr device pcreateinfo pallocator-c
                pswapchain)))
          (values (cffi:mem-ref pswapchain 'vkswapchainkhr) result device
                  pallocator)))))

  (more-cffi:def-foreign-function doc-file
      ("vkDestroySwapchainKHR" destroy-swapchain-khr
       funcall-destroy-swapchain-khr)
      (device swapchain pallocator)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain)
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroyswapchainkhr device swapchain pallocator-c)))

  (more-cffi:defwith doc-file with-swapchain create-swapchain destroy-swapchain
                     :destructor-arguments (2 0 3))

  (more-cffi:def-foreign-function doc-file
      ("vkGetSwapchainImagesKHR" get-swapchain-images-khr
       funcall-get-swapchain-images-khr)
      (device swapchain)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain) :return
     ("VkImage" "pSwapchainImages") ("VkResult" result))
    (cffi:with-foreign-object (pswapchainimagecount :uint32)
      (vkgetswapchainimageskhr device swapchain pswapchainimagecount
       (cffi-sys:null-pointer))
      (let* ((swapchain-image-count
              (cffi:mem-ref pswapchainimagecount :uint32)))
        (cffi:with-foreign-object (pswapchainimages 'vkimage
                                   swapchain-image-count)
          (let ((result
                 (vkgetswapchainimageskhr device swapchain pswapchainimagecount
                  pswapchainimages))
                (swapchain-images
                 (iter
                   (for i from 0 below swapchain-image-count)
                   (collect (cffi:mem-aref pswapchainimages 'vkimage i)))))
            (values swapchain-images result))))))

  (more-cffi:def-foreign-function doc-file
      ("vkAcquireNextImageKHR" acquire-next-image-khr
       funcall-acquire-next-image-khr)
      (device swapchain timeout semaphore fence pimageindex)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain)
     (uint64 timeout) ("VkSemaphore" semaphore) ("VkFence" fence)
     (uint32 "pImageIndex") :return ("VkResult" return-value))
    (vkacquirenextimagekhr device swapchain timeout semaphore fence
     pimageindex))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkQueuePresentKHR" queue-present-khr funcall-queue-present-khr)
      (queue ppresentinfo)
    (declare-types ("VkQueue" queue) ("VkPresentInfoKHR" "pPresentInfo")
     :return ("VkResult" return-value))
    (vkqueuepresentkhr queue ppresentinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceGroupPresentCapabilitiesKHR"
       get-device-group-present-capabilities-khr
       funcall-get-device-group-present-capabilities-khr)
      (device pdevicegrouppresentcapabilities)
    (declare-types ("VkDevice" device)
     ("VkDeviceGroupPresentCapabilitiesKHR" "pDeviceGroupPresentCapabilities")
     :return ("VkResult" return-value))
    (vkgetdevicegrouppresentcapabilitieskhr device
     pdevicegrouppresentcapabilities))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceGroupSurfacePresentModesKHR"
       get-device-group-surface-present-modes-khr
       funcall-get-device-group-surface-present-modes-khr)
      (device surface pmodes)
    (declare-types ("VkDevice" device) ("VkSurfaceKHR" surface)
     ("VkDeviceGroupPresentModeFlagsKHR" "pModes") :return
     ("VkResult" return-value))
    (vkgetdevicegroupsurfacepresentmodeskhr device surface pmodes))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDevicePresentRectanglesKHR"
       get-physical-device-present-rectangles-khr
       funcall-get-physical-device-present-rectangles-khr)
      (physicaldevice surface prectcount prects)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkSurfaceKHR" surface) (uint32 "pRectCount") ("VkRect2D" "pRects")
     :return ("VkResult" return-value))
    (vkgetphysicaldevicepresentrectangleskhr physicaldevice surface prectcount
     prects))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkAcquireNextImage2KHR" acquire-next-image-2-khr
       funcall-acquire-next-image-2-khr)
      (device pacquireinfo pimageindex)
    (declare-types ("VkDevice" device)
     ("VkAcquireNextImageInfoKHR" "pAcquireInfo") (uint32 "pImageIndex")
     :return ("VkResult" return-value))
    (vkacquirenextimage2khr device pacquireinfo pimageindex))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceDisplayPropertiesKHR"
       get-physical-device-display-properties-khr
       funcall-get-physical-device-display-properties-khr)
      (physicaldevice ppropertycount pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pPropertyCount") ("VkDisplayPropertiesKHR" "pProperties") :return
     ("VkResult" return-value))
    (vkgetphysicaldevicedisplaypropertieskhr physicaldevice ppropertycount
     pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceDisplayPlanePropertiesKHR"
       get-physical-device-display-plane-properties-khr
       funcall-get-physical-device-display-plane-properties-khr)
      (physicaldevice ppropertycount pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pPropertyCount") ("VkDisplayPlanePropertiesKHR" "pProperties")
     :return ("VkResult" return-value))
    (vkgetphysicaldevicedisplayplanepropertieskhr physicaldevice ppropertycount
     pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDisplayPlaneSupportedDisplaysKHR"
       get-display-plane-supported-displays-khr
       funcall-get-display-plane-supported-displays-khr)
      (physicaldevice planeindex pdisplaycount pdisplays)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (uint32 "planeIndex")
     (uint32 "pDisplayCount") ("VkDisplayKHR" "pDisplays") :return
     ("VkResult" return-value))
    (vkgetdisplayplanesupporteddisplayskhr physicaldevice planeindex
     pdisplaycount pdisplays))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDisplayModePropertiesKHR" get-display-mode-properties-khr
       funcall-get-display-mode-properties-khr)
      (physicaldevice display ppropertycount pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkDisplayKHR" display) (uint32 "pPropertyCount")
     ("VkDisplayModePropertiesKHR" "pProperties") :return
     ("VkResult" return-value))
    (vkgetdisplaymodepropertieskhr physicaldevice display ppropertycount
     pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateDisplayModeKHR" create-display-mode-khr
       funcall-create-display-mode-khr)
      (physicaldevice display pcreateinfo pallocator pmode)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkDisplayKHR" display) ("VkDisplayModeCreateInfoKHR" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkDisplayModeKHR" "pMode")
     :return ("VkResult" return-value))
    (vkcreatedisplaymodekhr physicaldevice display pcreateinfo pallocator
     pmode))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDisplayPlaneCapabilitiesKHR" get-display-plane-capabilities-khr
       funcall-get-display-plane-capabilities-khr)
      (physicaldevice mode planeindex pcapabilities)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkDisplayModeKHR" mode) (uint32 "planeIndex")
     ("VkDisplayPlaneCapabilitiesKHR" "pCapabilities") :return
     ("VkResult" return-value))
    (vkgetdisplayplanecapabilitieskhr physicaldevice mode planeindex
     pcapabilities))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateDisplayPlaneSurfaceKHR" create-display-plane-surface-khr
       funcall-create-display-plane-surface-khr)
      (instance pcreateinfo pallocator psurface)
    (declare-types ("VkInstance" instance)
     ("VkDisplaySurfaceCreateInfoKHR" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkSurfaceKHR" "pSurface") :return
     ("VkResult" return-value))
    (vkcreatedisplayplanesurfacekhr instance pcreateinfo pallocator psurface))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateSharedSwapchainsKHR" create-shared-swapchains-khr
       funcall-create-shared-swapchains-khr)
      (device swapchaincount pcreateinfos pallocator pswapchains)
    (declare-types ("VkDevice" device) (uint32 "swapchainCount")
     ("VkSwapchainCreateInfoKHR" "pCreateInfos")
     ("VkAllocationCallbacks" "pAllocator") ("VkSwapchainKHR" "pSwapchains")
     :return ("VkResult" return-value))
    (vkcreatesharedswapchainskhr device swapchaincount pcreateinfos pallocator
     pswapchains))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBeginRenderingKHR" cmd-begin-rendering-khr
       funcall-cmd-begin-rendering-khr)
      (commandbuffer prenderinginfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkRenderingInfo" "pRenderingInfo") :return ("void" return-value))
    (vkcmdbeginrenderingkhr commandbuffer prenderinginfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdEndRenderingKHR" cmd-end-rendering-khr
       funcall-cmd-end-rendering-khr)
      (commandbuffer)
    (declare-types ("VkCommandBuffer" "commandBuffer") :return
     ("void" return-value))
    (vkcmdendrenderingkhr commandbuffer))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceFeatures2KHR" get-physical-device-features-2-khr
       funcall-get-physical-device-features-2-khr)
      (physicaldevice pfeatures)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceFeatures2" "pFeatures") :return ("void" return-value))
    (vkgetphysicaldevicefeatures2khr physicaldevice pfeatures))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceProperties2KHR" get-physical-device-properties-2-khr
       funcall-get-physical-device-properties-2-khr)
      (physicaldevice pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceProperties2" "pProperties") :return
     ("void" return-value))
    (vkgetphysicaldeviceproperties2khr physicaldevice pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceFormatProperties2KHR"
       get-physical-device-format-properties-2-khr
       funcall-get-physical-device-format-properties-2-khr)
      (physicaldevice format pformatproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkFormat" format)
     ("VkFormatProperties2" "pFormatProperties") :return ("void" return-value))
    (vkgetphysicaldeviceformatproperties2khr physicaldevice format
     pformatproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceImageFormatProperties2KHR"
       get-physical-device-image-format-properties-2-khr
       funcall-get-physical-device-image-format-properties-2-khr)
      (physicaldevice pimageformatinfo pimageformatproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceImageFormatInfo2" "pImageFormatInfo")
     ("VkImageFormatProperties2" "pImageFormatProperties") :return
     ("VkResult" return-value))
    (vkgetphysicaldeviceimageformatproperties2khr physicaldevice
     pimageformatinfo pimageformatproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceQueueFamilyProperties2KHR"
       get-physical-device-queue-family-properties-2-khr
       funcall-get-physical-device-queue-family-properties-2-khr)
      (physicaldevice pqueuefamilypropertycount pqueuefamilyproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pQueueFamilyPropertyCount")
     ("VkQueueFamilyProperties2" "pQueueFamilyProperties") :return
     ("void" return-value))
    (vkgetphysicaldevicequeuefamilyproperties2khr physicaldevice
     pqueuefamilypropertycount pqueuefamilyproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceMemoryProperties2KHR"
       get-physical-device-memory-properties-2-khr
       funcall-get-physical-device-memory-properties-2-khr)
      (physicaldevice pmemoryproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceMemoryProperties2" "pMemoryProperties") :return
     ("void" return-value))
    (vkgetphysicaldevicememoryproperties2khr physicaldevice pmemoryproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSparseImageFormatProperties2KHR"
       get-physical-device-sparse-image-format-properties-2-khr
       funcall-get-physical-device-sparse-image-format-properties-2-khr)
      (physicaldevice pformatinfo ppropertycount pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceSparseImageFormatInfo2" "pFormatInfo")
     (uint32 "pPropertyCount") ("VkSparseImageFormatProperties2" "pProperties")
     :return ("void" return-value))
    (vkgetphysicaldevicesparseimageformatproperties2khr physicaldevice
     pformatinfo ppropertycount pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceGroupPeerMemoryFeaturesKHR"
       get-device-group-peer-memory-features-khr
       funcall-get-device-group-peer-memory-features-khr)
      (device heapindex localdeviceindex remotedeviceindex ppeermemoryfeatures)
    (declare-types ("VkDevice" device) (uint32 "heapIndex")
     (uint32 "localDeviceIndex") (uint32 "remoteDeviceIndex")
     ("VkPeerMemoryFeatureFlags" "pPeerMemoryFeatures") :return
     ("void" return-value))
    (vkgetdevicegrouppeermemoryfeatureskhr device heapindex localdeviceindex
     remotedeviceindex ppeermemoryfeatures))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDeviceMaskKHR" cmd-set-device-mask-khr
       funcall-cmd-set-device-mask-khr)
      (commandbuffer devicemask)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "deviceMask")
     :return ("void" return-value))
    (vkcmdsetdevicemaskkhr commandbuffer devicemask))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDispatchBaseKHR" cmd-dispatch-base-khr
       funcall-cmd-dispatch-base-khr)
      (commandbuffer basegroupx basegroupy basegroupz groupcountx groupcounty
       groupcountz)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "baseGroupX")
     (uint32 "baseGroupY") (uint32 "baseGroupZ") (uint32 "groupCountX")
     (uint32 "groupCountY") (uint32 "groupCountZ") :return
     ("void" return-value))
    (vkcmddispatchbasekhr commandbuffer basegroupx basegroupy basegroupz
     groupcountx groupcounty groupcountz))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkTrimCommandPoolKHR" trim-command-pool-khr
       funcall-trim-command-pool-khr)
      (device commandpool flags)
    (declare-types ("VkDevice" device) ("VkCommandPool" "commandPool")
     ("VkCommandPoolTrimFlags" flags) :return ("void" return-value))
    (vktrimcommandpoolkhr device commandpool flags))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkEnumeratePhysicalDeviceGroupsKHR"
       enumerate-physical-device-groups-khr
       funcall-enumerate-physical-device-groups-khr)
      (instance pphysicaldevicegroupcount pphysicaldevicegroupproperties)
    (declare-types ("VkInstance" instance) (uint32 "pPhysicalDeviceGroupCount")
     ("VkPhysicalDeviceGroupProperties" "pPhysicalDeviceGroupProperties")
     :return ("VkResult" return-value))
    (vkenumeratephysicaldevicegroupskhr instance pphysicaldevicegroupcount
     pphysicaldevicegroupproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceExternalBufferPropertiesKHR"
       get-physical-device-external-buffer-properties-khr
       funcall-get-physical-device-external-buffer-properties-khr)
      (physicaldevice pexternalbufferinfo pexternalbufferproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceExternalBufferInfo" "pExternalBufferInfo")
     ("VkExternalBufferProperties" "pExternalBufferProperties") :return
     ("void" return-value))
    (vkgetphysicaldeviceexternalbufferpropertieskhr physicaldevice
     pexternalbufferinfo pexternalbufferproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetMemoryFdKHR" get-memory-fd-khr funcall-get-memory-fd-khr)
      (device pgetfdinfo pfd)
    (declare-types ("VkDevice" device) ("VkMemoryGetFdInfoKHR" "pGetFdInfo")
     (int "pFd") :return ("VkResult" return-value))
    (vkgetmemoryfdkhr device pgetfdinfo pfd))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetMemoryFdPropertiesKHR" get-memory-fd-properties-khr
       funcall-get-memory-fd-properties-khr)
      (device handletype fd pmemoryfdproperties)
    (declare-types ("VkDevice" device)
     ("VkExternalMemoryHandleTypeFlagBits" "handleType") (int fd)
     ("VkMemoryFdPropertiesKHR" "pMemoryFdProperties") :return
     ("VkResult" return-value))
    (vkgetmemoryfdpropertieskhr device handletype fd pmemoryfdproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceExternalSemaphorePropertiesKHR"
       get-physical-device-external-semaphore-properties-khr
       funcall-get-physical-device-external-semaphore-properties-khr)
      (physicaldevice pexternalsemaphoreinfo pexternalsemaphoreproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceExternalSemaphoreInfo" "pExternalSemaphoreInfo")
     ("VkExternalSemaphoreProperties" "pExternalSemaphoreProperties") :return
     ("void" return-value))
    (vkgetphysicaldeviceexternalsemaphorepropertieskhr physicaldevice
     pexternalsemaphoreinfo pexternalsemaphoreproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkImportSemaphoreFdKHR" import-semaphore-fd-khr
       funcall-import-semaphore-fd-khr)
      (device pimportsemaphorefdinfo)
    (declare-types ("VkDevice" device)
     ("VkImportSemaphoreFdInfoKHR" "pImportSemaphoreFdInfo") :return
     ("VkResult" return-value))
    (vkimportsemaphorefdkhr device pimportsemaphorefdinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetSemaphoreFdKHR" get-semaphore-fd-khr funcall-get-semaphore-fd-khr)
      (device pgetfdinfo pfd)
    (declare-types ("VkDevice" device) ("VkSemaphoreGetFdInfoKHR" "pGetFdInfo")
     (int "pFd") :return ("VkResult" return-value))
    (vkgetsemaphorefdkhr device pgetfdinfo pfd))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdPushDescriptorSetKHR" cmd-push-descriptor-set-khr
       funcall-cmd-push-descriptor-set-khr)
      (commandbuffer pipelinebindpoint layout set descriptorwritecount
       pdescriptorwrites)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineBindPoint" "pipelineBindPoint") ("VkPipelineLayout" layout)
     (uint32 set) (uint32 "descriptorWriteCount")
     ("VkWriteDescriptorSet" "pDescriptorWrites") :return ("void" return-value))
    (vkcmdpushdescriptorsetkhr commandbuffer pipelinebindpoint layout set
     descriptorwritecount pdescriptorwrites))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdPushDescriptorSetWithTemplateKHR"
       cmd-push-descriptor-set-with-template-khr
       funcall-cmd-push-descriptor-set-with-template-khr)
      (commandbuffer descriptorupdatetemplate layout set pdata)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkDescriptorUpdateTemplate" "descriptorUpdateTemplate")
     ("VkPipelineLayout" layout) (uint32 set) (void "pData") :return
     ("void" return-value))
    (vkcmdpushdescriptorsetwithtemplatekhr commandbuffer
     descriptorupdatetemplate layout set pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateDescriptorUpdateTemplateKHR"
       create-descriptor-update-template-khr
       funcall-create-descriptor-update-template-khr)
      (device pcreateinfo pallocator pdescriptorupdatetemplate)
    (declare-types ("VkDevice" device)
     ("VkDescriptorUpdateTemplateCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkDescriptorUpdateTemplate" "pDescriptorUpdateTemplate") :return
     ("VkResult" return-value))
    (vkcreatedescriptorupdatetemplatekhr device pcreateinfo pallocator
     pdescriptorupdatetemplate))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyDescriptorUpdateTemplateKHR"
       destroy-descriptor-update-template-khr
       funcall-destroy-descriptor-update-template-khr)
      (device descriptorupdatetemplate pallocator)
    (declare-types ("VkDevice" device)
     ("VkDescriptorUpdateTemplate" "descriptorUpdateTemplate")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroydescriptorupdatetemplatekhr device descriptorupdatetemplate
     pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkUpdateDescriptorSetWithTemplateKHR"
       update-descriptor-set-with-template-khr
       funcall-update-descriptor-set-with-template-khr)
      (device descriptorset descriptorupdatetemplate pdata)
    (declare-types ("VkDevice" device) ("VkDescriptorSet" "descriptorSet")
     ("VkDescriptorUpdateTemplate" "descriptorUpdateTemplate") (void "pData")
     :return ("void" return-value))
    (vkupdatedescriptorsetwithtemplatekhr device descriptorset
     descriptorupdatetemplate pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateRenderPass2KHR" create-render-pass-2-khr
       funcall-create-render-pass-2-khr)
      (device pcreateinfo pallocator prenderpass)
    (declare-types ("VkDevice" device)
     ("VkRenderPassCreateInfo2" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkRenderPass" "pRenderPass")
     :return ("VkResult" return-value))
    (vkcreaterenderpass2khr device pcreateinfo pallocator prenderpass))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBeginRenderPass2KHR" cmd-begin-render-pass-2-khr
       funcall-cmd-begin-render-pass-2-khr)
      (commandbuffer prenderpassbegin psubpassbegininfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkRenderPassBeginInfo" "pRenderPassBegin")
     ("VkSubpassBeginInfo" "pSubpassBeginInfo") :return ("void" return-value))
    (vkcmdbeginrenderpass2khr commandbuffer prenderpassbegin psubpassbegininfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdNextSubpass2KHR" cmd-next-subpass-2-khr
       funcall-cmd-next-subpass-2-khr)
      (commandbuffer psubpassbegininfo psubpassendinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkSubpassBeginInfo" "pSubpassBeginInfo")
     ("VkSubpassEndInfo" "pSubpassEndInfo") :return ("void" return-value))
    (vkcmdnextsubpass2khr commandbuffer psubpassbegininfo psubpassendinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdEndRenderPass2KHR" cmd-end-render-pass-2-khr
       funcall-cmd-end-render-pass-2-khr)
      (commandbuffer psubpassendinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkSubpassEndInfo" "pSubpassEndInfo") :return ("void" return-value))
    (vkcmdendrenderpass2khr commandbuffer psubpassendinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetSwapchainStatusKHR" get-swapchain-status-khr
       funcall-get-swapchain-status-khr)
      (device swapchain)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain) :return
     ("VkResult" return-value))
    (vkgetswapchainstatuskhr device swapchain))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceExternalFencePropertiesKHR"
       get-physical-device-external-fence-properties-khr
       funcall-get-physical-device-external-fence-properties-khr)
      (physicaldevice pexternalfenceinfo pexternalfenceproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceExternalFenceInfo" "pExternalFenceInfo")
     ("VkExternalFenceProperties" "pExternalFenceProperties") :return
     ("void" return-value))
    (vkgetphysicaldeviceexternalfencepropertieskhr physicaldevice
     pexternalfenceinfo pexternalfenceproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkImportFenceFdKHR" import-fence-fd-khr funcall-import-fence-fd-khr)
      (device pimportfencefdinfo)
    (declare-types ("VkDevice" device)
     ("VkImportFenceFdInfoKHR" "pImportFenceFdInfo") :return
     ("VkResult" return-value))
    (vkimportfencefdkhr device pimportfencefdinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetFenceFdKHR" get-fence-fd-khr funcall-get-fence-fd-khr)
      (device pgetfdinfo pfd)
    (declare-types ("VkDevice" device) ("VkFenceGetFdInfoKHR" "pGetFdInfo")
     (int "pFd") :return ("VkResult" return-value))
    (vkgetfencefdkhr device pgetfdinfo pfd))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR"
       enumerate-physical-device-queue-family-performance-query-counters-khr
       funcall-enumerate-physical-device-queue-family-performance-query-counters-khr)
      (physicaldevice queuefamilyindex pcountercount pcounters
       pcounterdescriptions)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "queueFamilyIndex") (uint32 "pCounterCount")
     ("VkPerformanceCounterKHR" "pCounters")
     ("VkPerformanceCounterDescriptionKHR" "pCounterDescriptions") :return
     ("VkResult" return-value))
    (vkenumeratephysicaldevicequeuefamilyperformancequerycounterskhr
     physicaldevice queuefamilyindex pcountercount pcounters
     pcounterdescriptions))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR"
       get-physical-device-queue-family-performance-query-passes-khr
       funcall-get-physical-device-queue-family-performance-query-passes-khr)
      (physicaldevice pperformancequerycreateinfo pnumpasses)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkQueryPoolPerformanceCreateInfoKHR" "pPerformanceQueryCreateInfo")
     (uint32 "pNumPasses") :return ("void" return-value))
    (vkgetphysicaldevicequeuefamilyperformancequerypasseskhr physicaldevice
     pperformancequerycreateinfo pnumpasses))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkAcquireProfilingLockKHR" acquire-profiling-lock-khr
       funcall-acquire-profiling-lock-khr)
      (device pinfo)
    (declare-types ("VkDevice" device)
     ("VkAcquireProfilingLockInfoKHR" "pInfo") :return
     ("VkResult" return-value))
    (vkacquireprofilinglockkhr device pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkReleaseProfilingLockKHR" release-profiling-lock-khr
       funcall-release-profiling-lock-khr)
      (device)
    (declare-types ("VkDevice" device) :return ("void" return-value))
    (vkreleaseprofilinglockkhr device))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSurfaceCapabilities2KHR"
       get-physical-device-surface-capabilities-2-khr
       funcall-get-physical-device-surface-capabilities-2-khr)
      (physicaldevice psurfaceinfo psurfacecapabilities)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceSurfaceInfo2KHR" "pSurfaceInfo")
     ("VkSurfaceCapabilities2KHR" "pSurfaceCapabilities") :return
     ("VkResult" return-value))
    (vkgetphysicaldevicesurfacecapabilities2khr physicaldevice psurfaceinfo
     psurfacecapabilities))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSurfaceFormats2KHR"
       get-physical-device-surface-formats-2-khr
       funcall-get-physical-device-surface-formats-2-khr)
      (physicaldevice psurfaceinfo psurfaceformatcount psurfaceformats)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkPhysicalDeviceSurfaceInfo2KHR" "pSurfaceInfo")
     (uint32 "pSurfaceFormatCount") ("VkSurfaceFormat2KHR" "pSurfaceFormats")
     :return ("VkResult" return-value))
    (vkgetphysicaldevicesurfaceformats2khr physicaldevice psurfaceinfo
     psurfaceformatcount psurfaceformats))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceDisplayProperties2KHR"
       get-physical-device-display-properties-2-khr
       funcall-get-physical-device-display-properties-2-khr)
      (physicaldevice ppropertycount pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pPropertyCount") ("VkDisplayProperties2KHR" "pProperties")
     :return ("VkResult" return-value))
    (vkgetphysicaldevicedisplayproperties2khr physicaldevice ppropertycount
     pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceDisplayPlaneProperties2KHR"
       get-physical-device-display-plane-properties-2-khr
       funcall-get-physical-device-display-plane-properties-2-khr)
      (physicaldevice ppropertycount pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pPropertyCount") ("VkDisplayPlaneProperties2KHR" "pProperties")
     :return ("VkResult" return-value))
    (vkgetphysicaldevicedisplayplaneproperties2khr physicaldevice
     ppropertycount pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDisplayModeProperties2KHR" get-display-mode-properties-2-khr
       funcall-get-display-mode-properties-2-khr)
      (physicaldevice display ppropertycount pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkDisplayKHR" display) (uint32 "pPropertyCount")
     ("VkDisplayModeProperties2KHR" "pProperties") :return
     ("VkResult" return-value))
    (vkgetdisplaymodeproperties2khr physicaldevice display ppropertycount
     pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDisplayPlaneCapabilities2KHR" get-display-plane-capabilities-2-khr
       funcall-get-display-plane-capabilities-2-khr)
      (physicaldevice pdisplayplaneinfo pcapabilities)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkDisplayPlaneInfo2KHR" "pDisplayPlaneInfo")
     ("VkDisplayPlaneCapabilities2KHR" "pCapabilities") :return
     ("VkResult" return-value))
    (vkgetdisplayplanecapabilities2khr physicaldevice pdisplayplaneinfo
     pcapabilities))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageMemoryRequirements2KHR" get-image-memory-requirements-2-khr
       funcall-get-image-memory-requirements-2-khr)
      (device pinfo pmemoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkImageMemoryRequirementsInfo2" "pInfo")
     ("VkMemoryRequirements2" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetimagememoryrequirements2khr device pinfo pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetBufferMemoryRequirements2KHR" get-buffer-memory-requirements-2-khr
       funcall-get-buffer-memory-requirements-2-khr)
      (device pinfo pmemoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkBufferMemoryRequirementsInfo2" "pInfo")
     ("VkMemoryRequirements2" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetbuffermemoryrequirements2khr device pinfo pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageSparseMemoryRequirements2KHR"
       get-image-sparse-memory-requirements-2-khr
       funcall-get-image-sparse-memory-requirements-2-khr)
      (device pinfo psparsememoryrequirementcount psparsememoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkImageSparseMemoryRequirementsInfo2" "pInfo")
     (uint32 "pSparseMemoryRequirementCount")
     ("VkSparseImageMemoryRequirements2" "pSparseMemoryRequirements") :return
     ("void" return-value))
    (vkgetimagesparsememoryrequirements2khr device pinfo
     psparsememoryrequirementcount psparsememoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateSamplerYcbcrConversionKHR" create-sampler-ycbcr-conversion-khr
       funcall-create-sampler-ycbcr-conversion-khr)
      (device pcreateinfo pallocator pycbcrconversion)
    (declare-types ("VkDevice" device)
     ("VkSamplerYcbcrConversionCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkSamplerYcbcrConversion" "pYcbcrConversion") :return
     ("VkResult" return-value))
    (vkcreatesamplerycbcrconversionkhr device pcreateinfo pallocator
     pycbcrconversion))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroySamplerYcbcrConversionKHR"
       destroy-sampler-ycbcr-conversion-khr
       funcall-destroy-sampler-ycbcr-conversion-khr)
      (device ycbcrconversion pallocator)
    (declare-types ("VkDevice" device)
     ("VkSamplerYcbcrConversion" "ycbcrConversion")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroysamplerycbcrconversionkhr device ycbcrconversion pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkBindBufferMemory2KHR" bind-buffer-memory-2-khr
       funcall-bind-buffer-memory-2-khr)
      (device bindinfocount pbindinfos)
    (declare-types ("VkDevice" device) (uint32 "bindInfoCount")
     ("VkBindBufferMemoryInfo" "pBindInfos") :return ("VkResult" return-value))
    (vkbindbuffermemory2khr device bindinfocount pbindinfos))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkBindImageMemory2KHR" bind-image-memory-2-khr
       funcall-bind-image-memory-2-khr)
      (device bindinfocount pbindinfos)
    (declare-types ("VkDevice" device) (uint32 "bindInfoCount")
     ("VkBindImageMemoryInfo" "pBindInfos") :return ("VkResult" return-value))
    (vkbindimagememory2khr device bindinfocount pbindinfos))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDescriptorSetLayoutSupportKHR"
       get-descriptor-set-layout-support-khr
       funcall-get-descriptor-set-layout-support-khr)
      (device pcreateinfo psupport)
    (declare-types ("VkDevice" device)
     ("VkDescriptorSetLayoutCreateInfo" "pCreateInfo")
     ("VkDescriptorSetLayoutSupport" "pSupport") :return ("void" return-value))
    (vkgetdescriptorsetlayoutsupportkhr device pcreateinfo psupport))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawIndirectCountKHR" cmd-draw-indirect-count-khr
       funcall-cmd-draw-indirect-count-khr)
      (commandbuffer buffer offset countbuffer countbufferoffset maxdrawcount
       stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) ("VkBuffer" "countBuffer")
     ("VkDeviceSize" "countBufferOffset") (uint32 "maxDrawCount")
     (uint32 stride) :return ("void" return-value))
    (vkcmddrawindirectcountkhr commandbuffer buffer offset countbuffer
     countbufferoffset maxdrawcount stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawIndexedIndirectCountKHR" cmd-draw-indexed-indirect-count-khr
       funcall-cmd-draw-indexed-indirect-count-khr)
      (commandbuffer buffer offset countbuffer countbufferoffset maxdrawcount
       stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) ("VkBuffer" "countBuffer")
     ("VkDeviceSize" "countBufferOffset") (uint32 "maxDrawCount")
     (uint32 stride) :return ("void" return-value))
    (vkcmddrawindexedindirectcountkhr commandbuffer buffer offset countbuffer
     countbufferoffset maxdrawcount stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetSemaphoreCounterValueKHR" get-semaphore-counter-value-khr
       funcall-get-semaphore-counter-value-khr)
      (device semaphore pvalue)
    (declare-types ("VkDevice" device) ("VkSemaphore" semaphore)
     (uint64 "pValue") :return ("VkResult" return-value))
    (vkgetsemaphorecountervaluekhr device semaphore pvalue))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkWaitSemaphoresKHR" wait-semaphores-khr funcall-wait-semaphores-khr)
      (device pwaitinfo timeout)
    (declare-types ("VkDevice" device) ("VkSemaphoreWaitInfo" "pWaitInfo")
     (uint64 timeout) :return ("VkResult" return-value))
    (vkwaitsemaphoreskhr device pwaitinfo timeout))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkSignalSemaphoreKHR" signal-semaphore-khr funcall-signal-semaphore-khr)
      (device psignalinfo)
    (declare-types ("VkDevice" device) ("VkSemaphoreSignalInfo" "pSignalInfo")
     :return ("VkResult" return-value))
    (vksignalsemaphorekhr device psignalinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceFragmentShadingRatesKHR"
       get-physical-device-fragment-shading-rates-khr
       funcall-get-physical-device-fragment-shading-rates-khr)
      (physicaldevice pfragmentshadingratecount pfragmentshadingrates)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pFragmentShadingRateCount")
     ("VkPhysicalDeviceFragmentShadingRateKHR" "pFragmentShadingRates") :return
     ("VkResult" return-value))
    (vkgetphysicaldevicefragmentshadingrateskhr physicaldevice
     pfragmentshadingratecount pfragmentshadingrates))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetFragmentShadingRateKHR" cmd-set-fragment-shading-rate-khr
       funcall-cmd-set-fragment-shading-rate-khr)
      (commandbuffer pfragmentsize combinerops)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkExtent2D" "pFragmentSize")
     ("VkFragmentShadingRateCombinerOpKHR" "combinerOps") :return
     ("void" return-value))
    (vkcmdsetfragmentshadingratekhr commandbuffer pfragmentsize combinerops))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkWaitForPresentKHR" wait-for-present-khr funcall-wait-for-present-khr)
      (device swapchain presentid timeout)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain)
     (uint64 "presentId") (uint64 timeout) :return ("VkResult" return-value))
    (vkwaitforpresentkhr device swapchain presentid timeout))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetBufferDeviceAddressKHR" get-buffer-device-address-khr
       funcall-get-buffer-device-address-khr)
      (device pinfo)
    (declare-types ("VkDevice" device) ("VkBufferDeviceAddressInfo" "pInfo")
     :return ("VkDeviceAddress" return-value))
    (vkgetbufferdeviceaddresskhr device pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetBufferOpaqueCaptureAddressKHR"
       get-buffer-opaque-capture-address-khr
       funcall-get-buffer-opaque-capture-address-khr)
      (device pinfo)
    (declare-types ("VkDevice" device) ("VkBufferDeviceAddressInfo" "pInfo")
     :return ("uint64_t" return-value))
    (vkgetbufferopaquecaptureaddresskhr device pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceMemoryOpaqueCaptureAddressKHR"
       get-device-memory-opaque-capture-address-khr
       funcall-get-device-memory-opaque-capture-address-khr)
      (device pinfo)
    (declare-types ("VkDevice" device)
     ("VkDeviceMemoryOpaqueCaptureAddressInfo" "pInfo") :return
     ("uint64_t" return-value))
    (vkgetdevicememoryopaquecaptureaddresskhr device pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateDeferredOperationKHR" create-deferred-operation-khr
       funcall-create-deferred-operation-khr)
      (device pallocator pdeferredoperation)
    (declare-types ("VkDevice" device) ("VkAllocationCallbacks" "pAllocator")
     ("VkDeferredOperationKHR" "pDeferredOperation") :return
     ("VkResult" return-value))
    (vkcreatedeferredoperationkhr device pallocator pdeferredoperation))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyDeferredOperationKHR" destroy-deferred-operation-khr
       funcall-destroy-deferred-operation-khr)
      (device operation pallocator)
    (declare-types ("VkDevice" device) ("VkDeferredOperationKHR" operation)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroydeferredoperationkhr device operation pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeferredOperationMaxConcurrencyKHR"
       get-deferred-operation-max-concurrency-khr
       funcall-get-deferred-operation-max-concurrency-khr)
      (device operation)
    (declare-types ("VkDevice" device) ("VkDeferredOperationKHR" operation)
     :return ("uint32_t" return-value))
    (vkgetdeferredoperationmaxconcurrencykhr device operation))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeferredOperationResultKHR" get-deferred-operation-result-khr
       funcall-get-deferred-operation-result-khr)
      (device operation)
    (declare-types ("VkDevice" device) ("VkDeferredOperationKHR" operation)
     :return ("VkResult" return-value))
    (vkgetdeferredoperationresultkhr device operation))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDeferredOperationJoinKHR" deferred-operation-join-khr
       funcall-deferred-operation-join-khr)
      (device operation)
    (declare-types ("VkDevice" device) ("VkDeferredOperationKHR" operation)
     :return ("VkResult" return-value))
    (vkdeferredoperationjoinkhr device operation))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPipelineExecutablePropertiesKHR"
       get-pipeline-executable-properties-khr
       funcall-get-pipeline-executable-properties-khr)
      (device ppipelineinfo pexecutablecount pproperties)
    (declare-types ("VkDevice" device) ("VkPipelineInfoKHR" "pPipelineInfo")
     (uint32 "pExecutableCount")
     ("VkPipelineExecutablePropertiesKHR" "pProperties") :return
     ("VkResult" return-value))
    (vkgetpipelineexecutablepropertieskhr device ppipelineinfo pexecutablecount
     pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPipelineExecutableStatisticsKHR"
       get-pipeline-executable-statistics-khr
       funcall-get-pipeline-executable-statistics-khr)
      (device pexecutableinfo pstatisticcount pstatistics)
    (declare-types ("VkDevice" device)
     ("VkPipelineExecutableInfoKHR" "pExecutableInfo")
     (uint32 "pStatisticCount")
     ("VkPipelineExecutableStatisticKHR" "pStatistics") :return
     ("VkResult" return-value))
    (vkgetpipelineexecutablestatisticskhr device pexecutableinfo
     pstatisticcount pstatistics))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPipelineExecutableInternalRepresentationsKHR"
       get-pipeline-executable-internal-representations-khr
       funcall-get-pipeline-executable-internal-representations-khr)
      (device pexecutableinfo pinternalrepresentationcount
       pinternalrepresentations)
    (declare-types ("VkDevice" device)
     ("VkPipelineExecutableInfoKHR" "pExecutableInfo")
     (uint32 "pInternalRepresentationCount")
     ("VkPipelineExecutableInternalRepresentationKHR"
      "pInternalRepresentations")
     :return ("VkResult" return-value))
    (vkgetpipelineexecutableinternalrepresentationskhr device pexecutableinfo
     pinternalrepresentationcount pinternalrepresentations))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetEvent2KHR" cmd-set-event-2-khr funcall-cmd-set-event-2-khr)
      (commandbuffer event pdependencyinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkEvent" event)
     ("VkDependencyInfo" "pDependencyInfo") :return ("void" return-value))
    (vkcmdsetevent2khr commandbuffer event pdependencyinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdResetEvent2KHR" cmd-reset-event-2-khr
       funcall-cmd-reset-event-2-khr)
      (commandbuffer event stagemask)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkEvent" event)
     ("VkPipelineStageFlags2" "stageMask") :return ("void" return-value))
    (vkcmdresetevent2khr commandbuffer event stagemask))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdWaitEvents2KHR" cmd-wait-events-2-khr
       funcall-cmd-wait-events-2-khr)
      (commandbuffer eventcount pevents pdependencyinfos)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "eventCount")
     ("VkEvent" "pEvents") ("VkDependencyInfo" "pDependencyInfos") :return
     ("void" return-value))
    (vkcmdwaitevents2khr commandbuffer eventcount pevents pdependencyinfos))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdPipelineBarrier2KHR" cmd-pipeline-barrier-2-khr
       funcall-cmd-pipeline-barrier-2-khr)
      (commandbuffer pdependencyinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkDependencyInfo" "pDependencyInfo") :return ("void" return-value))
    (vkcmdpipelinebarrier2khr commandbuffer pdependencyinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdWriteTimestamp2KHR" cmd-write-timestamp-2-khr
       funcall-cmd-write-timestamp-2-khr)
      (commandbuffer stage querypool query)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineStageFlags2" stage) ("VkQueryPool" "queryPool") (uint32 query)
     :return ("void" return-value))
    (vkcmdwritetimestamp2khr commandbuffer stage querypool query))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkQueueSubmit2KHR" queue-submit-2-khr funcall-queue-submit-2-khr)
      (queue submitcount psubmits fence)
    (declare-types ("VkQueue" queue) (uint32 "submitCount")
     ("VkSubmitInfo2" "pSubmits") ("VkFence" fence) :return
     ("VkResult" return-value))
    (vkqueuesubmit2khr queue submitcount psubmits fence))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdWriteBufferMarker2AMD" cmd-write-buffer-marker-2-amd
       funcall-cmd-write-buffer-marker-2-amd)
      (commandbuffer stage dstbuffer dstoffset marker)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineStageFlags2" stage) ("VkBuffer" "dstBuffer")
     ("VkDeviceSize" "dstOffset") (uint32 marker) :return ("void" return-value))
    (vkcmdwritebuffermarker2amd commandbuffer stage dstbuffer dstoffset marker))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetQueueCheckpointData2NV" get-queue-checkpoint-data-2-nv
       funcall-get-queue-checkpoint-data-2-nv)
      (queue pcheckpointdatacount pcheckpointdata)
    (declare-types ("VkQueue" queue) (uint32 "pCheckpointDataCount")
     ("VkCheckpointData2NV" "pCheckpointData") :return ("void" return-value))
    (vkgetqueuecheckpointdata2nv queue pcheckpointdatacount pcheckpointdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyBuffer2KHR" cmd-copy-buffer-2-khr
       funcall-cmd-copy-buffer-2-khr)
      (commandbuffer pcopybufferinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyBufferInfo2" "pCopyBufferInfo") :return ("void" return-value))
    (vkcmdcopybuffer2khr commandbuffer pcopybufferinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyImage2KHR" cmd-copy-image-2-khr funcall-cmd-copy-image-2-khr)
      (commandbuffer pcopyimageinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyImageInfo2" "pCopyImageInfo") :return ("void" return-value))
    (vkcmdcopyimage2khr commandbuffer pcopyimageinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyBufferToImage2KHR" cmd-copy-buffer-to-image-2-khr
       funcall-cmd-copy-buffer-to-image-2-khr)
      (commandbuffer pcopybuffertoimageinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyBufferToImageInfo2" "pCopyBufferToImageInfo") :return
     ("void" return-value))
    (vkcmdcopybuffertoimage2khr commandbuffer pcopybuffertoimageinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyImageToBuffer2KHR" cmd-copy-image-to-buffer-2-khr
       funcall-cmd-copy-image-to-buffer-2-khr)
      (commandbuffer pcopyimagetobufferinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyImageToBufferInfo2" "pCopyImageToBufferInfo") :return
     ("void" return-value))
    (vkcmdcopyimagetobuffer2khr commandbuffer pcopyimagetobufferinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBlitImage2KHR" cmd-blit-image-2-khr funcall-cmd-blit-image-2-khr)
      (commandbuffer pblitimageinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBlitImageInfo2" "pBlitImageInfo") :return ("void" return-value))
    (vkcmdblitimage2khr commandbuffer pblitimageinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdResolveImage2KHR" cmd-resolve-image-2-khr
       funcall-cmd-resolve-image-2-khr)
      (commandbuffer presolveimageinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkResolveImageInfo2" "pResolveImageInfo") :return ("void" return-value))
    (vkcmdresolveimage2khr commandbuffer presolveimageinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdTraceRaysIndirect2KHR" cmd-trace-rays-indirect-2-khr
       funcall-cmd-trace-rays-indirect-2-khr)
      (commandbuffer indirectdeviceaddress)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkDeviceAddress" "indirectDeviceAddress") :return ("void" return-value))
    (vkcmdtraceraysindirect2khr commandbuffer indirectdeviceaddress))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceBufferMemoryRequirementsKHR"
       get-device-buffer-memory-requirements-khr
       funcall-get-device-buffer-memory-requirements-khr)
      (device pinfo pmemoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkDeviceBufferMemoryRequirements" "pInfo")
     ("VkMemoryRequirements2" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetdevicebuffermemoryrequirementskhr device pinfo pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceImageMemoryRequirementsKHR"
       get-device-image-memory-requirements-khr
       funcall-get-device-image-memory-requirements-khr)
      (device pinfo pmemoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkDeviceImageMemoryRequirements" "pInfo")
     ("VkMemoryRequirements2" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetdeviceimagememoryrequirementskhr device pinfo pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceImageSparseMemoryRequirementsKHR"
       get-device-image-sparse-memory-requirements-khr
       funcall-get-device-image-sparse-memory-requirements-khr)
      (device pinfo psparsememoryrequirementcount psparsememoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkDeviceImageMemoryRequirements" "pInfo")
     (uint32 "pSparseMemoryRequirementCount")
     ("VkSparseImageMemoryRequirements2" "pSparseMemoryRequirements") :return
     ("void" return-value))
    (vkgetdeviceimagesparsememoryrequirementskhr device pinfo
     psparsememoryrequirementcount psparsememoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateDebugReportCallbackEXT" create-debug-report-callback-ext
       funcall-create-debug-report-callback-ext)
      (instance pcreateinfo pallocator pcallback)
    (declare-types ("VkInstance" instance)
     ("VkDebugReportCallbackCreateInfoEXT" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkDebugReportCallbackEXT" "pCallback") :return ("VkResult" return-value))
    (vkcreatedebugreportcallbackext instance pcreateinfo pallocator pcallback))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyDebugReportCallbackEXT" destroy-debug-report-callback-ext
       funcall-destroy-debug-report-callback-ext)
      (instance callback pallocator)
    (declare-types ("VkInstance" instance)
     ("VkDebugReportCallbackEXT" callback)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroydebugreportcallbackext instance callback pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDebugReportMessageEXT" debug-report-message-ext
       funcall-debug-report-message-ext)
      (instance flags objecttype object location messagecode playerprefix
       pmessage)
    (declare-types ("VkInstance" instance) ("VkDebugReportFlagsEXT" flags)
     ("VkDebugReportObjectTypeEXT" "objectType") (uint64 object)
     (size location) (int32 "messageCode") (char "pLayerPrefix")
     (char "pMessage") :return ("void" return-value))
    (vkdebugreportmessageext instance flags objecttype object location
     messagecode playerprefix pmessage))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDebugMarkerSetObjectTagEXT" debug-marker-set-object-tag-ext
       funcall-debug-marker-set-object-tag-ext)
      (device ptaginfo)
    (declare-types ("VkDevice" device)
     ("VkDebugMarkerObjectTagInfoEXT" "pTagInfo") :return
     ("VkResult" return-value))
    (vkdebugmarkersetobjecttagext device ptaginfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDebugMarkerSetObjectNameEXT" debug-marker-set-object-name-ext
       funcall-debug-marker-set-object-name-ext)
      (device pnameinfo)
    (declare-types ("VkDevice" device)
     ("VkDebugMarkerObjectNameInfoEXT" "pNameInfo") :return
     ("VkResult" return-value))
    (vkdebugmarkersetobjectnameext device pnameinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDebugMarkerBeginEXT" cmd-debug-marker-begin-ext
       funcall-cmd-debug-marker-begin-ext)
      (commandbuffer pmarkerinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkDebugMarkerMarkerInfoEXT" "pMarkerInfo") :return ("void" return-value))
    (vkcmddebugmarkerbeginext commandbuffer pmarkerinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDebugMarkerEndEXT" cmd-debug-marker-end-ext
       funcall-cmd-debug-marker-end-ext)
      (commandbuffer)
    (declare-types ("VkCommandBuffer" "commandBuffer") :return
     ("void" return-value))
    (vkcmddebugmarkerendext commandbuffer))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDebugMarkerInsertEXT" cmd-debug-marker-insert-ext
       funcall-cmd-debug-marker-insert-ext)
      (commandbuffer pmarkerinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkDebugMarkerMarkerInfoEXT" "pMarkerInfo") :return ("void" return-value))
    (vkcmddebugmarkerinsertext commandbuffer pmarkerinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBindTransformFeedbackBuffersEXT"
       cmd-bind-transform-feedback-buffers-ext
       funcall-cmd-bind-transform-feedback-buffers-ext)
      (commandbuffer firstbinding bindingcount pbuffers poffsets psizes)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstBinding")
     (uint32 "bindingCount") ("VkBuffer" "pBuffers")
     ("VkDeviceSize" "pOffsets") ("VkDeviceSize" "pSizes") :return
     ("void" return-value))
    (vkcmdbindtransformfeedbackbuffersext commandbuffer firstbinding
     bindingcount pbuffers poffsets psizes))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBeginTransformFeedbackEXT" cmd-begin-transform-feedback-ext
       funcall-cmd-begin-transform-feedback-ext)
      (commandbuffer firstcounterbuffer counterbuffercount pcounterbuffers
       pcounterbufferoffsets)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "firstCounterBuffer") (uint32 "counterBufferCount")
     ("VkBuffer" "pCounterBuffers") ("VkDeviceSize" "pCounterBufferOffsets")
     :return ("void" return-value))
    (vkcmdbegintransformfeedbackext commandbuffer firstcounterbuffer
     counterbuffercount pcounterbuffers pcounterbufferoffsets))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdEndTransformFeedbackEXT" cmd-end-transform-feedback-ext
       funcall-cmd-end-transform-feedback-ext)
      (commandbuffer firstcounterbuffer counterbuffercount pcounterbuffers
       pcounterbufferoffsets)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "firstCounterBuffer") (uint32 "counterBufferCount")
     ("VkBuffer" "pCounterBuffers") ("VkDeviceSize" "pCounterBufferOffsets")
     :return ("void" return-value))
    (vkcmdendtransformfeedbackext commandbuffer firstcounterbuffer
     counterbuffercount pcounterbuffers pcounterbufferoffsets))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBeginQueryIndexedEXT" cmd-begin-query-indexed-ext
       funcall-cmd-begin-query-indexed-ext)
      (commandbuffer querypool query flags index)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkQueryPool" "queryPool") (uint32 query) ("VkQueryControlFlags" flags)
     (uint32 index) :return ("void" return-value))
    (vkcmdbeginqueryindexedext commandbuffer querypool query flags index))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdEndQueryIndexedEXT" cmd-end-query-indexed-ext
       funcall-cmd-end-query-indexed-ext)
      (commandbuffer querypool query index)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkQueryPool" "queryPool") (uint32 query) (uint32 index) :return
     ("void" return-value))
    (vkcmdendqueryindexedext commandbuffer querypool query index))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawIndirectByteCountEXT" cmd-draw-indirect-byte-count-ext
       funcall-cmd-draw-indirect-byte-count-ext)
      (commandbuffer instancecount firstinstance counterbuffer
       counterbufferoffset counteroffset vertexstride)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "instanceCount")
     (uint32 "firstInstance") ("VkBuffer" "counterBuffer")
     ("VkDeviceSize" "counterBufferOffset") (uint32 "counterOffset")
     (uint32 "vertexStride") :return ("void" return-value))
    (vkcmddrawindirectbytecountext commandbuffer instancecount firstinstance
     counterbuffer counterbufferoffset counteroffset vertexstride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateCuModuleNVX" create-cu-module-nvx funcall-create-cu-module-nvx)
      (device pcreateinfo pallocator pmodule)
    (declare-types ("VkDevice" device)
     ("VkCuModuleCreateInfoNVX" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkCuModuleNVX" "pModule") :return
     ("VkResult" return-value))
    (vkcreatecumodulenvx device pcreateinfo pallocator pmodule))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateCuFunctionNVX" create-cu-function-nvx
       funcall-create-cu-function-nvx)
      (device pcreateinfo pallocator pfunction)
    (declare-types ("VkDevice" device)
     ("VkCuFunctionCreateInfoNVX" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkCuFunctionNVX" "pFunction")
     :return ("VkResult" return-value))
    (vkcreatecufunctionnvx device pcreateinfo pallocator pfunction))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyCuModuleNVX" destroy-cu-module-nvx
       funcall-destroy-cu-module-nvx)
      (device module pallocator)
    (declare-types ("VkDevice" device) ("VkCuModuleNVX" module)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroycumodulenvx device module pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyCuFunctionNVX" destroy-cu-function-nvx
       funcall-destroy-cu-function-nvx)
      (device function pallocator)
    (declare-types ("VkDevice" device) ("VkCuFunctionNVX" function)
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroycufunctionnvx device function pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCuLaunchKernelNVX" cmd-cu-launch-kernel-nvx
       funcall-cmd-cu-launch-kernel-nvx)
      (commandbuffer plaunchinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCuLaunchInfoNVX" "pLaunchInfo") :return ("void" return-value))
    (vkcmdculaunchkernelnvx commandbuffer plaunchinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageViewHandleNVX" get-image-view-handle-nvx
       funcall-get-image-view-handle-nvx)
      (device pinfo)
    (declare-types ("VkDevice" device) ("VkImageViewHandleInfoNVX" "pInfo")
     :return ("uint32_t" return-value))
    (vkgetimageviewhandlenvx device pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageViewAddressNVX" get-image-view-address-nvx
       funcall-get-image-view-address-nvx)
      (device imageview pproperties)
    (declare-types ("VkDevice" device) ("VkImageView" "imageView")
     ("VkImageViewAddressPropertiesNVX" "pProperties") :return
     ("VkResult" return-value))
    (vkgetimageviewaddressnvx device imageview pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawIndirectCountAMD" cmd-draw-indirect-count-amd
       funcall-cmd-draw-indirect-count-amd)
      (commandbuffer buffer offset countbuffer countbufferoffset maxdrawcount
       stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) ("VkBuffer" "countBuffer")
     ("VkDeviceSize" "countBufferOffset") (uint32 "maxDrawCount")
     (uint32 stride) :return ("void" return-value))
    (vkcmddrawindirectcountamd commandbuffer buffer offset countbuffer
     countbufferoffset maxdrawcount stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawIndexedIndirectCountAMD" cmd-draw-indexed-indirect-count-amd
       funcall-cmd-draw-indexed-indirect-count-amd)
      (commandbuffer buffer offset countbuffer countbufferoffset maxdrawcount
       stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) ("VkBuffer" "countBuffer")
     ("VkDeviceSize" "countBufferOffset") (uint32 "maxDrawCount")
     (uint32 stride) :return ("void" return-value))
    (vkcmddrawindexedindirectcountamd commandbuffer buffer offset countbuffer
     countbufferoffset maxdrawcount stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetShaderInfoAMD" get-shader-info-amd funcall-get-shader-info-amd)
      (device pipeline shaderstage infotype pinfosize pinfo)
    (declare-types ("VkDevice" device) ("VkPipeline" pipeline)
     ("VkShaderStageFlagBits" "shaderStage") ("VkShaderInfoTypeAMD" "infoType")
     (size "pInfoSize") (void "pInfo") :return ("VkResult" return-value))
    (vkgetshaderinfoamd device pipeline shaderstage infotype pinfosize pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceExternalImageFormatPropertiesNV"
       get-physical-device-external-image-format-properties-nv
       funcall-get-physical-device-external-image-format-properties-nv)
      (physicaldevice format type tiling usage flags externalhandletype
       pexternalimageformatproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkFormat" format)
     ("VkImageType" type) ("VkImageTiling" tiling) ("VkImageUsageFlags" usage)
     ("VkImageCreateFlags" flags)
     ("VkExternalMemoryHandleTypeFlagsNV" "externalHandleType")
     ("VkExternalImageFormatPropertiesNV" "pExternalImageFormatProperties")
     :return ("VkResult" return-value))
    (vkgetphysicaldeviceexternalimageformatpropertiesnv physicaldevice format
     type tiling usage flags externalhandletype pexternalimageformatproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBeginConditionalRenderingEXT" cmd-begin-conditional-rendering-ext
       funcall-cmd-begin-conditional-rendering-ext)
      (commandbuffer pconditionalrenderingbegin)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkConditionalRenderingBeginInfoEXT" "pConditionalRenderingBegin")
     :return ("void" return-value))
    (vkcmdbeginconditionalrenderingext commandbuffer
     pconditionalrenderingbegin))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdEndConditionalRenderingEXT" cmd-end-conditional-rendering-ext
       funcall-cmd-end-conditional-rendering-ext)
      (commandbuffer)
    (declare-types ("VkCommandBuffer" "commandBuffer") :return
     ("void" return-value))
    (vkcmdendconditionalrenderingext commandbuffer))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetViewportWScalingNV" cmd-set-viewport-w-scaling-nv
       funcall-cmd-set-viewport-w-scaling-nv)
      (commandbuffer firstviewport viewportcount pviewportwscalings)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstViewport")
     (uint32 "viewportCount") ("VkViewportWScalingNV" "pViewportWScalings")
     :return ("void" return-value))
    (vkcmdsetviewportwscalingnv commandbuffer firstviewport viewportcount
     pviewportwscalings))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkReleaseDisplayEXT" release-display-ext funcall-release-display-ext)
      (physicaldevice display)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkDisplayKHR" display) :return ("VkResult" return-value))
    (vkreleasedisplayext physicaldevice display))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSurfaceCapabilities2EXT"
       get-physical-device-surface-capabilities-2-ext
       funcall-get-physical-device-surface-capabilities-2-ext)
      (physicaldevice surface psurfacecapabilities)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkSurfaceKHR" surface)
     ("VkSurfaceCapabilities2EXT" "pSurfaceCapabilities") :return
     ("VkResult" return-value))
    (vkgetphysicaldevicesurfacecapabilities2ext physicaldevice surface
     psurfacecapabilities))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDisplayPowerControlEXT" display-power-control-ext
       funcall-display-power-control-ext)
      (device display pdisplaypowerinfo)
    (declare-types ("VkDevice" device) ("VkDisplayKHR" display)
     ("VkDisplayPowerInfoEXT" "pDisplayPowerInfo") :return
     ("VkResult" return-value))
    (vkdisplaypowercontrolext device display pdisplaypowerinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkRegisterDeviceEventEXT" register-device-event-ext
       funcall-register-device-event-ext)
      (device pdeviceeventinfo pallocator pfence)
    (declare-types ("VkDevice" device)
     ("VkDeviceEventInfoEXT" "pDeviceEventInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkFence" "pFence") :return
     ("VkResult" return-value))
    (vkregisterdeviceeventext device pdeviceeventinfo pallocator pfence))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkRegisterDisplayEventEXT" register-display-event-ext
       funcall-register-display-event-ext)
      (device display pdisplayeventinfo pallocator pfence)
    (declare-types ("VkDevice" device) ("VkDisplayKHR" display)
     ("VkDisplayEventInfoEXT" "pDisplayEventInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkFence" "pFence") :return
     ("VkResult" return-value))
    (vkregisterdisplayeventext device display pdisplayeventinfo pallocator
     pfence))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetSwapchainCounterEXT" get-swapchain-counter-ext
       funcall-get-swapchain-counter-ext)
      (device swapchain counter pcountervalue)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain)
     ("VkSurfaceCounterFlagBitsEXT" counter) (uint64 "pCounterValue") :return
     ("VkResult" return-value))
    (vkgetswapchaincounterext device swapchain counter pcountervalue))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetRefreshCycleDurationGOOGLE" get-refresh-cycle-duration-google
       funcall-get-refresh-cycle-duration-google)
      (device swapchain pdisplaytimingproperties)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain)
     ("VkRefreshCycleDurationGOOGLE" "pDisplayTimingProperties") :return
     ("VkResult" return-value))
    (vkgetrefreshcycledurationgoogle device swapchain pdisplaytimingproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPastPresentationTimingGOOGLE" get-past-presentation-timing-google
       funcall-get-past-presentation-timing-google)
      (device swapchain ppresentationtimingcount ppresentationtimings)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain)
     (uint32 "pPresentationTimingCount")
     ("VkPastPresentationTimingGOOGLE" "pPresentationTimings") :return
     ("VkResult" return-value))
    (vkgetpastpresentationtiminggoogle device swapchain
     ppresentationtimingcount ppresentationtimings))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDiscardRectangleEXT" cmd-set-discard-rectangle-ext
       funcall-cmd-set-discard-rectangle-ext)
      (commandbuffer firstdiscardrectangle discardrectanglecount
       pdiscardrectangles)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "firstDiscardRectangle") (uint32 "discardRectangleCount")
     ("VkRect2D" "pDiscardRectangles") :return ("void" return-value))
    (vkcmdsetdiscardrectangleext commandbuffer firstdiscardrectangle
     discardrectanglecount pdiscardrectangles))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkSetHdrMetadataEXT" set-hdr-metadata-ext funcall-set-hdr-metadata-ext)
      (device swapchaincount pswapchains pmetadata)
    (declare-types ("VkDevice" device) (uint32 "swapchainCount")
     ("VkSwapchainKHR" "pSwapchains") ("VkHdrMetadataEXT" "pMetadata") :return
     ("void" return-value))
    (vksethdrmetadataext device swapchaincount pswapchains pmetadata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkSetDebugUtilsObjectNameEXT" set-debug-utils-object-name-ext
       funcall-set-debug-utils-object-name-ext)
      (device pnameinfo)
    (declare-types ("VkDevice" device)
     ("VkDebugUtilsObjectNameInfoEXT" "pNameInfo") :return
     ("VkResult" return-value))
    (vksetdebugutilsobjectnameext device pnameinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkSetDebugUtilsObjectTagEXT" set-debug-utils-object-tag-ext
       funcall-set-debug-utils-object-tag-ext)
      (device ptaginfo)
    (declare-types ("VkDevice" device)
     ("VkDebugUtilsObjectTagInfoEXT" "pTagInfo") :return
     ("VkResult" return-value))
    (vksetdebugutilsobjecttagext device ptaginfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkQueueBeginDebugUtilsLabelEXT" queue-begin-debug-utils-label-ext
       funcall-queue-begin-debug-utils-label-ext)
      (queue plabelinfo)
    (declare-types ("VkQueue" queue) ("VkDebugUtilsLabelEXT" "pLabelInfo")
     :return ("void" return-value))
    (vkqueuebegindebugutilslabelext queue plabelinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkQueueEndDebugUtilsLabelEXT" queue-end-debug-utils-label-ext
       funcall-queue-end-debug-utils-label-ext)
      (queue)
    (declare-types ("VkQueue" queue) :return ("void" return-value))
    (vkqueueenddebugutilslabelext queue))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkQueueInsertDebugUtilsLabelEXT" queue-insert-debug-utils-label-ext
       funcall-queue-insert-debug-utils-label-ext)
      (queue plabelinfo)
    (declare-types ("VkQueue" queue) ("VkDebugUtilsLabelEXT" "pLabelInfo")
     :return ("void" return-value))
    (vkqueueinsertdebugutilslabelext queue plabelinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBeginDebugUtilsLabelEXT" cmd-begin-debug-utils-label-ext
       funcall-cmd-begin-debug-utils-label-ext)
      (commandbuffer plabelinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkDebugUtilsLabelEXT" "pLabelInfo") :return ("void" return-value))
    (vkcmdbegindebugutilslabelext commandbuffer plabelinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdEndDebugUtilsLabelEXT" cmd-end-debug-utils-label-ext
       funcall-cmd-end-debug-utils-label-ext)
      (commandbuffer)
    (declare-types ("VkCommandBuffer" "commandBuffer") :return
     ("void" return-value))
    (vkcmdenddebugutilslabelext commandbuffer))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdInsertDebugUtilsLabelEXT" cmd-insert-debug-utils-label-ext
       funcall-cmd-insert-debug-utils-label-ext)
      (commandbuffer plabelinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkDebugUtilsLabelEXT" "pLabelInfo") :return ("void" return-value))
    (vkcmdinsertdebugutilslabelext commandbuffer plabelinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateDebugUtilsMessengerEXT" create-debug-utils-messenger-ext
       funcall-create-debug-utils-messenger-ext)
      (instance pcreateinfo pallocator)
    (declare-types ("VkInstance" instance)
     ("VkDebugUtilsMessengerCreateInfoEXT" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") :return
     ("VkDebugUtilsMessengerEXT" "pMessenger") ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pdebugmessenger 'vkdebugutilsmessengerext)
        (let ((result
               (vkcreatedebugutilsmessengerext instance pcreateinfo
                pallocator-c pdebugmessenger)))
          (values (cffi:mem-ref pdebugmessenger 'vkdebugutilsmessengerext)
                  result instance pallocator)))))

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyDebugUtilsMessengerEXT" destroy-debug-utils-messenger-ext
       funcall-destroy-debug-utils-messenger-ext)
      (instance messenger pallocator)
    (declare-types ("VkInstance" instance)
     ("VkDebugUtilsMessengerEXT" messenger)
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroydebugutilsmessengerext instance messenger pallocator-c)))

  (more-cffi:defwith doc-file with-debug-utils-messenger-ext
                     create-debug-utils-messenger-ext
                     destroy-debug-utils-messenger-ext :destructor-arguments
                     (2 0 3))

  (more-cffi:def-foreign-function doc-file
      ("vkSubmitDebugUtilsMessageEXT" submit-debug-utils-message-ext
       funcall-submit-debug-utils-message-ext)
      (instance messageseverity messagetypes pcallbackdata)
    (declare-types ("VkInstance" instance)
     ("VkDebugUtilsMessageSeverityFlagBitsEXT" "messageSeverity")
     ("VkDebugUtilsMessageTypeFlagsEXT" "messageTypes")
     ("VkDebugUtilsMessengerCallbackDataEXT" "pCallbackData") :return
     ("void" return-value))
    (vksubmitdebugutilsmessageext instance messageseverity messagetypes
     pcallbackdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetSampleLocationsEXT" cmd-set-sample-locations-ext
       funcall-cmd-set-sample-locations-ext)
      (commandbuffer psamplelocationsinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkSampleLocationsInfoEXT" "pSampleLocationsInfo") :return
     ("void" return-value))
    (vkcmdsetsamplelocationsext commandbuffer psamplelocationsinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceMultisamplePropertiesEXT"
       get-physical-device-multisample-properties-ext
       funcall-get-physical-device-multisample-properties-ext)
      (physicaldevice samples pmultisampleproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkSampleCountFlagBits" samples)
     ("VkMultisamplePropertiesEXT" "pMultisampleProperties") :return
     ("void" return-value))
    (vkgetphysicaldevicemultisamplepropertiesext physicaldevice samples
     pmultisampleproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageDrmFormatModifierPropertiesEXT"
       get-image-drm-format-modifier-properties-ext
       funcall-get-image-drm-format-modifier-properties-ext)
      (device image pproperties)
    (declare-types ("VkDevice" device) ("VkImage" image)
     ("VkImageDrmFormatModifierPropertiesEXT" "pProperties") :return
     ("VkResult" return-value))
    (vkgetimagedrmformatmodifierpropertiesext device image pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateValidationCacheEXT" create-validation-cache-ext
       funcall-create-validation-cache-ext)
      (device pcreateinfo pallocator pvalidationcache)
    (declare-types ("VkDevice" device)
     ("VkValidationCacheCreateInfoEXT" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkValidationCacheEXT" "pValidationCache") :return
     ("VkResult" return-value))
    (vkcreatevalidationcacheext device pcreateinfo pallocator pvalidationcache))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyValidationCacheEXT" destroy-validation-cache-ext
       funcall-destroy-validation-cache-ext)
      (device validationcache pallocator)
    (declare-types ("VkDevice" device)
     ("VkValidationCacheEXT" "validationCache")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroyvalidationcacheext device validationcache pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkMergeValidationCachesEXT" merge-validation-caches-ext
       funcall-merge-validation-caches-ext)
      (device dstcache srccachecount psrccaches)
    (declare-types ("VkDevice" device) ("VkValidationCacheEXT" "dstCache")
     (uint32 "srcCacheCount") ("VkValidationCacheEXT" "pSrcCaches") :return
     ("VkResult" return-value))
    (vkmergevalidationcachesext device dstcache srccachecount psrccaches))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetValidationCacheDataEXT" get-validation-cache-data-ext
       funcall-get-validation-cache-data-ext)
      (device validationcache pdatasize pdata)
    (declare-types ("VkDevice" device)
     ("VkValidationCacheEXT" "validationCache") (size "pDataSize")
     (void "pData") :return ("VkResult" return-value))
    (vkgetvalidationcachedataext device validationcache pdatasize pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBindShadingRateImageNV" cmd-bind-shading-rate-image-nv
       funcall-cmd-bind-shading-rate-image-nv)
      (commandbuffer imageview imagelayout)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkImageView" "imageView") ("VkImageLayout" "imageLayout") :return
     ("void" return-value))
    (vkcmdbindshadingrateimagenv commandbuffer imageview imagelayout))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetViewportShadingRatePaletteNV"
       cmd-set-viewport-shading-rate-palette-nv
       funcall-cmd-set-viewport-shading-rate-palette-nv)
      (commandbuffer firstviewport viewportcount pshadingratepalettes)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstViewport")
     (uint32 "viewportCount") ("VkShadingRatePaletteNV" "pShadingRatePalettes")
     :return ("void" return-value))
    (vkcmdsetviewportshadingratepalettenv commandbuffer firstviewport
     viewportcount pshadingratepalettes))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetCoarseSampleOrderNV" cmd-set-coarse-sample-order-nv
       funcall-cmd-set-coarse-sample-order-nv)
      (commandbuffer sampleordertype customsampleordercount pcustomsampleorders)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCoarseSampleOrderTypeNV" "sampleOrderType")
     (uint32 "customSampleOrderCount")
     ("VkCoarseSampleOrderCustomNV" "pCustomSampleOrders") :return
     ("void" return-value))
    (vkcmdsetcoarsesampleordernv commandbuffer sampleordertype
     customsampleordercount pcustomsampleorders))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateAccelerationStructureNV" create-acceleration-structure-nv
       funcall-create-acceleration-structure-nv)
      (device pcreateinfo pallocator paccelerationstructure)
    (declare-types ("VkDevice" device)
     ("VkAccelerationStructureCreateInfoNV" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkAccelerationStructureNV" "pAccelerationStructure") :return
     ("VkResult" return-value))
    (vkcreateaccelerationstructurenv device pcreateinfo pallocator
     paccelerationstructure))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyAccelerationStructureNV" destroy-acceleration-structure-nv
       funcall-destroy-acceleration-structure-nv)
      (device accelerationstructure pallocator)
    (declare-types ("VkDevice" device)
     ("VkAccelerationStructureNV" "accelerationStructure")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroyaccelerationstructurenv device accelerationstructure pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetAccelerationStructureMemoryRequirementsNV"
       get-acceleration-structure-memory-requirements-nv
       funcall-get-acceleration-structure-memory-requirements-nv)
      (device pinfo pmemoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkAccelerationStructureMemoryRequirementsInfoNV" "pInfo")
     ("VkMemoryRequirements2KHR" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetaccelerationstructurememoryrequirementsnv device pinfo
     pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkBindAccelerationStructureMemoryNV"
       bind-acceleration-structure-memory-nv
       funcall-bind-acceleration-structure-memory-nv)
      (device bindinfocount pbindinfos)
    (declare-types ("VkDevice" device) (uint32 "bindInfoCount")
     ("VkBindAccelerationStructureMemoryInfoNV" "pBindInfos") :return
     ("VkResult" return-value))
    (vkbindaccelerationstructurememorynv device bindinfocount pbindinfos))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBuildAccelerationStructureNV" cmd-build-acceleration-structure-nv
       funcall-cmd-build-acceleration-structure-nv)
      (commandbuffer pinfo instancedata instanceoffset update dst src scratch
       scratchoffset)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkAccelerationStructureInfoNV" "pInfo") ("VkBuffer" "instanceData")
     ("VkDeviceSize" "instanceOffset") ("VkBool32" update)
     ("VkAccelerationStructureNV" dst) ("VkAccelerationStructureNV" src)
     ("VkBuffer" scratch) ("VkDeviceSize" "scratchOffset") :return
     ("void" return-value))
    (vkcmdbuildaccelerationstructurenv commandbuffer pinfo instancedata
     instanceoffset update dst src scratch scratchoffset))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyAccelerationStructureNV" cmd-copy-acceleration-structure-nv
       funcall-cmd-copy-acceleration-structure-nv)
      (commandbuffer dst src mode)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkAccelerationStructureNV" dst) ("VkAccelerationStructureNV" src)
     ("VkCopyAccelerationStructureModeKHR" mode) :return ("void" return-value))
    (vkcmdcopyaccelerationstructurenv commandbuffer dst src mode))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdTraceRaysNV" cmd-trace-rays-nv funcall-cmd-trace-rays-nv)
      (commandbuffer raygenshaderbindingtablebuffer raygenshaderbindingoffset
       missshaderbindingtablebuffer missshaderbindingoffset
       missshaderbindingstride hitshaderbindingtablebuffer
       hitshaderbindingoffset hitshaderbindingstride
       callableshaderbindingtablebuffer callableshaderbindingoffset
       callableshaderbindingstride width height depth)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBuffer" "raygenShaderBindingTableBuffer")
     ("VkDeviceSize" "raygenShaderBindingOffset")
     ("VkBuffer" "missShaderBindingTableBuffer")
     ("VkDeviceSize" "missShaderBindingOffset")
     ("VkDeviceSize" "missShaderBindingStride")
     ("VkBuffer" "hitShaderBindingTableBuffer")
     ("VkDeviceSize" "hitShaderBindingOffset")
     ("VkDeviceSize" "hitShaderBindingStride")
     ("VkBuffer" "callableShaderBindingTableBuffer")
     ("VkDeviceSize" "callableShaderBindingOffset")
     ("VkDeviceSize" "callableShaderBindingStride") (uint32 width)
     (uint32 height) (uint32 depth) :return ("void" return-value))
    (vkcmdtraceraysnv commandbuffer raygenshaderbindingtablebuffer
     raygenshaderbindingoffset missshaderbindingtablebuffer
     missshaderbindingoffset missshaderbindingstride
     hitshaderbindingtablebuffer hitshaderbindingoffset hitshaderbindingstride
     callableshaderbindingtablebuffer callableshaderbindingoffset
     callableshaderbindingstride width height depth))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateRayTracingPipelinesNV" create-ray-tracing-pipelines-nv
       funcall-create-ray-tracing-pipelines-nv)
      (device pipelinecache createinfocount pcreateinfos pallocator ppipelines)
    (declare-types ("VkDevice" device) ("VkPipelineCache" "pipelineCache")
     (uint32 "createInfoCount")
     ("VkRayTracingPipelineCreateInfoNV" "pCreateInfos")
     ("VkAllocationCallbacks" "pAllocator") ("VkPipeline" "pPipelines") :return
     ("VkResult" return-value))
    (vkcreateraytracingpipelinesnv device pipelinecache createinfocount
     pcreateinfos pallocator ppipelines))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetRayTracingShaderGroupHandlesKHR"
       get-ray-tracing-shader-group-handles-khr
       funcall-get-ray-tracing-shader-group-handles-khr)
      (device pipeline firstgroup groupcount datasize pdata)
    (declare-types ("VkDevice" device) ("VkPipeline" pipeline)
     (uint32 "firstGroup") (uint32 "groupCount") (size "dataSize")
     (void "pData") :return ("VkResult" return-value))
    (vkgetraytracingshadergrouphandleskhr device pipeline firstgroup groupcount
     datasize pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetRayTracingShaderGroupHandlesNV"
       get-ray-tracing-shader-group-handles-nv
       funcall-get-ray-tracing-shader-group-handles-nv)
      (device pipeline firstgroup groupcount datasize pdata)
    (declare-types ("VkDevice" device) ("VkPipeline" pipeline)
     (uint32 "firstGroup") (uint32 "groupCount") (size "dataSize")
     (void "pData") :return ("VkResult" return-value))
    (vkgetraytracingshadergrouphandlesnv device pipeline firstgroup groupcount
     datasize pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetAccelerationStructureHandleNV"
       get-acceleration-structure-handle-nv
       funcall-get-acceleration-structure-handle-nv)
      (device accelerationstructure datasize pdata)
    (declare-types ("VkDevice" device)
     ("VkAccelerationStructureNV" "accelerationStructure") (size "dataSize")
     (void "pData") :return ("VkResult" return-value))
    (vkgetaccelerationstructurehandlenv device accelerationstructure datasize
     pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdWriteAccelerationStructuresPropertiesNV"
       cmd-write-acceleration-structures-properties-nv
       funcall-cmd-write-acceleration-structures-properties-nv)
      (commandbuffer accelerationstructurecount paccelerationstructures
       querytype querypool firstquery)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "accelerationStructureCount")
     ("VkAccelerationStructureNV" "pAccelerationStructures")
     ("VkQueryType" "queryType") ("VkQueryPool" "queryPool")
     (uint32 "firstQuery") :return ("void" return-value))
    (vkcmdwriteaccelerationstructurespropertiesnv commandbuffer
     accelerationstructurecount paccelerationstructures querytype querypool
     firstquery))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCompileDeferredNV" compile-deferred-nv funcall-compile-deferred-nv)
      (device pipeline shader)
    (declare-types ("VkDevice" device) ("VkPipeline" pipeline) (uint32 shader)
     :return ("VkResult" return-value))
    (vkcompiledeferrednv device pipeline shader))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetMemoryHostPointerPropertiesEXT"
       get-memory-host-pointer-properties-ext
       funcall-get-memory-host-pointer-properties-ext)
      (device handletype phostpointer pmemoryhostpointerproperties)
    (declare-types ("VkDevice" device)
     ("VkExternalMemoryHandleTypeFlagBits" "handleType") (void "pHostPointer")
     ("VkMemoryHostPointerPropertiesEXT" "pMemoryHostPointerProperties")
     :return ("VkResult" return-value))
    (vkgetmemoryhostpointerpropertiesext device handletype phostpointer
     pmemoryhostpointerproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdWriteBufferMarkerAMD" cmd-write-buffer-marker-amd
       funcall-cmd-write-buffer-marker-amd)
      (commandbuffer pipelinestage dstbuffer dstoffset marker)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineStageFlagBits" "pipelineStage") ("VkBuffer" "dstBuffer")
     ("VkDeviceSize" "dstOffset") (uint32 marker) :return ("void" return-value))
    (vkcmdwritebuffermarkeramd commandbuffer pipelinestage dstbuffer dstoffset
     marker))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceCalibrateableTimeDomainsEXT"
       get-physical-device-calibrateable-time-domains-ext
       funcall-get-physical-device-calibrateable-time-domains-ext)
      (physicaldevice ptimedomaincount ptimedomains)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pTimeDomainCount") ("VkTimeDomainEXT" "pTimeDomains") :return
     ("VkResult" return-value))
    (vkgetphysicaldevicecalibrateabletimedomainsext physicaldevice
     ptimedomaincount ptimedomains))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetCalibratedTimestampsEXT" get-calibrated-timestamps-ext
       funcall-get-calibrated-timestamps-ext)
      (device timestampcount ptimestampinfos ptimestamps pmaxdeviation)
    (declare-types ("VkDevice" device) (uint32 "timestampCount")
     ("VkCalibratedTimestampInfoEXT" "pTimestampInfos") (uint64 "pTimestamps")
     (uint64 "pMaxDeviation") :return ("VkResult" return-value))
    (vkgetcalibratedtimestampsext device timestampcount ptimestampinfos
     ptimestamps pmaxdeviation))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawMeshTasksNV" cmd-draw-mesh-tasks-nv
       funcall-cmd-draw-mesh-tasks-nv)
      (commandbuffer taskcount firsttask)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "taskCount")
     (uint32 "firstTask") :return ("void" return-value))
    (vkcmddrawmeshtasksnv commandbuffer taskcount firsttask))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawMeshTasksIndirectNV" cmd-draw-mesh-tasks-indirect-nv
       funcall-cmd-draw-mesh-tasks-indirect-nv)
      (commandbuffer buffer offset drawcount stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) (uint32 "drawCount") (uint32 stride) :return
     ("void" return-value))
    (vkcmddrawmeshtasksindirectnv commandbuffer buffer offset drawcount stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawMeshTasksIndirectCountNV"
       cmd-draw-mesh-tasks-indirect-count-nv
       funcall-cmd-draw-mesh-tasks-indirect-count-nv)
      (commandbuffer buffer offset countbuffer countbufferoffset maxdrawcount
       stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkBuffer" buffer)
     ("VkDeviceSize" offset) ("VkBuffer" "countBuffer")
     ("VkDeviceSize" "countBufferOffset") (uint32 "maxDrawCount")
     (uint32 stride) :return ("void" return-value))
    (vkcmddrawmeshtasksindirectcountnv commandbuffer buffer offset countbuffer
     countbufferoffset maxdrawcount stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetExclusiveScissorNV" cmd-set-exclusive-scissor-nv
       funcall-cmd-set-exclusive-scissor-nv)
      (commandbuffer firstexclusivescissor exclusivescissorcount
       pexclusivescissors)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "firstExclusiveScissor") (uint32 "exclusiveScissorCount")
     ("VkRect2D" "pExclusiveScissors") :return ("void" return-value))
    (vkcmdsetexclusivescissornv commandbuffer firstexclusivescissor
     exclusivescissorcount pexclusivescissors))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetCheckpointNV" cmd-set-checkpoint-nv
       funcall-cmd-set-checkpoint-nv)
      (commandbuffer pcheckpointmarker)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (void "pCheckpointMarker") :return ("void" return-value))
    (vkcmdsetcheckpointnv commandbuffer pcheckpointmarker))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetQueueCheckpointDataNV" get-queue-checkpoint-data-nv
       funcall-get-queue-checkpoint-data-nv)
      (queue pcheckpointdatacount pcheckpointdata)
    (declare-types ("VkQueue" queue) (uint32 "pCheckpointDataCount")
     ("VkCheckpointDataNV" "pCheckpointData") :return ("void" return-value))
    (vkgetqueuecheckpointdatanv queue pcheckpointdatacount pcheckpointdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkInitializePerformanceApiINTEL" initialize-performance-api-intel
       funcall-initialize-performance-api-intel)
      (device pinitializeinfo)
    (declare-types ("VkDevice" device)
     ("VkInitializePerformanceApiInfoINTEL" "pInitializeInfo") :return
     ("VkResult" return-value))
    (vkinitializeperformanceapiintel device pinitializeinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkUninitializePerformanceApiINTEL" uninitialize-performance-api-intel
       funcall-uninitialize-performance-api-intel)
      (device)
    (declare-types ("VkDevice" device) :return ("void" return-value))
    (vkuninitializeperformanceapiintel device))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetPerformanceMarkerINTEL" cmd-set-performance-marker-intel
       funcall-cmd-set-performance-marker-intel)
      (commandbuffer pmarkerinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPerformanceMarkerInfoINTEL" "pMarkerInfo") :return
     ("VkResult" return-value))
    (vkcmdsetperformancemarkerintel commandbuffer pmarkerinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetPerformanceStreamMarkerINTEL"
       cmd-set-performance-stream-marker-intel
       funcall-cmd-set-performance-stream-marker-intel)
      (commandbuffer pmarkerinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPerformanceStreamMarkerInfoINTEL" "pMarkerInfo") :return
     ("VkResult" return-value))
    (vkcmdsetperformancestreammarkerintel commandbuffer pmarkerinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetPerformanceOverrideINTEL" cmd-set-performance-override-intel
       funcall-cmd-set-performance-override-intel)
      (commandbuffer poverrideinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPerformanceOverrideInfoINTEL" "pOverrideInfo") :return
     ("VkResult" return-value))
    (vkcmdsetperformanceoverrideintel commandbuffer poverrideinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkAcquirePerformanceConfigurationINTEL"
       acquire-performance-configuration-intel
       funcall-acquire-performance-configuration-intel)
      (device pacquireinfo pconfiguration)
    (declare-types ("VkDevice" device)
     ("VkPerformanceConfigurationAcquireInfoINTEL" "pAcquireInfo")
     ("VkPerformanceConfigurationINTEL" "pConfiguration") :return
     ("VkResult" return-value))
    (vkacquireperformanceconfigurationintel device pacquireinfo pconfiguration))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkReleasePerformanceConfigurationINTEL"
       release-performance-configuration-intel
       funcall-release-performance-configuration-intel)
      (device configuration)
    (declare-types ("VkDevice" device)
     ("VkPerformanceConfigurationINTEL" configuration) :return
     ("VkResult" return-value))
    (vkreleaseperformanceconfigurationintel device configuration))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkQueueSetPerformanceConfigurationINTEL"
       queue-set-performance-configuration-intel
       funcall-queue-set-performance-configuration-intel)
      (queue configuration)
    (declare-types ("VkQueue" queue)
     ("VkPerformanceConfigurationINTEL" configuration) :return
     ("VkResult" return-value))
    (vkqueuesetperformanceconfigurationintel queue configuration))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPerformanceParameterINTEL" get-performance-parameter-intel
       funcall-get-performance-parameter-intel)
      (device parameter pvalue)
    (declare-types ("VkDevice" device)
     ("VkPerformanceParameterTypeINTEL" parameter)
     ("VkPerformanceValueINTEL" "pValue") :return ("VkResult" return-value))
    (vkgetperformanceparameterintel device parameter pvalue))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkSetLocalDimmingAMD" set-local-dimming-amd
       funcall-set-local-dimming-amd)
      (device swapchain localdimmingenable)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" "swapChain")
     ("VkBool32" "localDimmingEnable") :return ("void" return-value))
    (vksetlocaldimmingamd device swapchain localdimmingenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetBufferDeviceAddressEXT" get-buffer-device-address-ext
       funcall-get-buffer-device-address-ext)
      (device pinfo)
    (declare-types ("VkDevice" device) ("VkBufferDeviceAddressInfo" "pInfo")
     :return ("VkDeviceAddress" return-value))
    (vkgetbufferdeviceaddressext device pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceToolPropertiesEXT"
       get-physical-device-tool-properties-ext
       funcall-get-physical-device-tool-properties-ext)
      (physicaldevice ptoolcount ptoolproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (uint32 "pToolCount")
     ("VkPhysicalDeviceToolProperties" "pToolProperties") :return
     ("VkResult" return-value))
    (vkgetphysicaldevicetoolpropertiesext physicaldevice ptoolcount
     ptoolproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV"
       get-physical-device-cooperative-matrix-properties-nv
       funcall-get-physical-device-cooperative-matrix-properties-nv)
      (physicaldevice ppropertycount pproperties)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pPropertyCount")
     ("VkCooperativeMatrixPropertiesNV" "pProperties") :return
     ("VkResult" return-value))
    (vkgetphysicaldevicecooperativematrixpropertiesnv physicaldevice
     ppropertycount pproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV"
       get-physical-device-supported-framebuffer-mixed-samples-combinations-nv
       funcall-get-physical-device-supported-framebuffer-mixed-samples-combinations-nv)
      (physicaldevice pcombinationcount pcombinations)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "pCombinationCount")
     ("VkFramebufferMixedSamplesCombinationNV" "pCombinations") :return
     ("VkResult" return-value))
    (vkgetphysicaldevicesupportedframebuffermixedsamplescombinationsnv
     physicaldevice pcombinationcount pcombinations))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateHeadlessSurfaceEXT" create-headless-surface-ext
       funcall-create-headless-surface-ext)
      (instance pcreateinfo pallocator psurface)
    (declare-types ("VkInstance" instance)
     ("VkHeadlessSurfaceCreateInfoEXT" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator") ("VkSurfaceKHR" "pSurface") :return
     ("VkResult" return-value))
    (vkcreateheadlesssurfaceext instance pcreateinfo pallocator psurface))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetLineStippleEXT" cmd-set-line-stipple-ext
       funcall-cmd-set-line-stipple-ext)
      (commandbuffer linestipplefactor linestipplepattern)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "lineStippleFactor") (uint16 "lineStipplePattern") :return
     ("void" return-value))
    (vkcmdsetlinestippleext commandbuffer linestipplefactor linestipplepattern))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkResetQueryPoolEXT" reset-query-pool-ext funcall-reset-query-pool-ext)
      (device querypool firstquery querycount)
    (declare-types ("VkDevice" device) ("VkQueryPool" "queryPool")
     (uint32 "firstQuery") (uint32 "queryCount") :return ("void" return-value))
    (vkresetquerypoolext device querypool firstquery querycount))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetCullModeEXT" cmd-set-cull-mode-ext
       funcall-cmd-set-cull-mode-ext)
      (commandbuffer cullmode)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCullModeFlags" "cullMode") :return ("void" return-value))
    (vkcmdsetcullmodeext commandbuffer cullmode))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetFrontFaceEXT" cmd-set-front-face-ext
       funcall-cmd-set-front-face-ext)
      (commandbuffer frontface)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkFrontFace" "frontFace") :return ("void" return-value))
    (vkcmdsetfrontfaceext commandbuffer frontface))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetPrimitiveTopologyEXT" cmd-set-primitive-topology-ext
       funcall-cmd-set-primitive-topology-ext)
      (commandbuffer primitivetopology)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPrimitiveTopology" "primitiveTopology") :return ("void" return-value))
    (vkcmdsetprimitivetopologyext commandbuffer primitivetopology))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetViewportWithCountEXT" cmd-set-viewport-with-count-ext
       funcall-cmd-set-viewport-with-count-ext)
      (commandbuffer viewportcount pviewports)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "viewportCount")
     ("VkViewport" "pViewports") :return ("void" return-value))
    (vkcmdsetviewportwithcountext commandbuffer viewportcount pviewports))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetScissorWithCountEXT" cmd-set-scissor-with-count-ext
       funcall-cmd-set-scissor-with-count-ext)
      (commandbuffer scissorcount pscissors)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "scissorCount")
     ("VkRect2D" "pScissors") :return ("void" return-value))
    (vkcmdsetscissorwithcountext commandbuffer scissorcount pscissors))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBindVertexBuffers2EXT" cmd-bind-vertex-buffers-2-ext
       funcall-cmd-bind-vertex-buffers-2-ext)
      (commandbuffer firstbinding bindingcount pbuffers poffsets psizes
       pstrides)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstBinding")
     (uint32 "bindingCount") ("VkBuffer" "pBuffers")
     ("VkDeviceSize" "pOffsets") ("VkDeviceSize" "pSizes")
     ("VkDeviceSize" "pStrides") :return ("void" return-value))
    (vkcmdbindvertexbuffers2ext commandbuffer firstbinding bindingcount
     pbuffers poffsets psizes pstrides))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthTestEnableEXT" cmd-set-depth-test-enable-ext
       funcall-cmd-set-depth-test-enable-ext)
      (commandbuffer depthtestenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "depthTestEnable") :return ("void" return-value))
    (vkcmdsetdepthtestenableext commandbuffer depthtestenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthWriteEnableEXT" cmd-set-depth-write-enable-ext
       funcall-cmd-set-depth-write-enable-ext)
      (commandbuffer depthwriteenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "depthWriteEnable") :return ("void" return-value))
    (vkcmdsetdepthwriteenableext commandbuffer depthwriteenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthCompareOpEXT" cmd-set-depth-compare-op-ext
       funcall-cmd-set-depth-compare-op-ext)
      (commandbuffer depthcompareop)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCompareOp" "depthCompareOp") :return ("void" return-value))
    (vkcmdsetdepthcompareopext commandbuffer depthcompareop))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthBoundsTestEnableEXT" cmd-set-depth-bounds-test-enable-ext
       funcall-cmd-set-depth-bounds-test-enable-ext)
      (commandbuffer depthboundstestenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "depthBoundsTestEnable") :return ("void" return-value))
    (vkcmdsetdepthboundstestenableext commandbuffer depthboundstestenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetStencilTestEnableEXT" cmd-set-stencil-test-enable-ext
       funcall-cmd-set-stencil-test-enable-ext)
      (commandbuffer stenciltestenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "stencilTestEnable") :return ("void" return-value))
    (vkcmdsetstenciltestenableext commandbuffer stenciltestenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetStencilOpEXT" cmd-set-stencil-op-ext
       funcall-cmd-set-stencil-op-ext)
      (commandbuffer facemask failop passop depthfailop compareop)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkStencilFaceFlags" "faceMask") ("VkStencilOp" "failOp")
     ("VkStencilOp" "passOp") ("VkStencilOp" "depthFailOp")
     ("VkCompareOp" "compareOp") :return ("void" return-value))
    (vkcmdsetstencilopext commandbuffer facemask failop passop depthfailop
     compareop))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetGeneratedCommandsMemoryRequirementsNV"
       get-generated-commands-memory-requirements-nv
       funcall-get-generated-commands-memory-requirements-nv)
      (device pinfo pmemoryrequirements)
    (declare-types ("VkDevice" device)
     ("VkGeneratedCommandsMemoryRequirementsInfoNV" "pInfo")
     ("VkMemoryRequirements2" "pMemoryRequirements") :return
     ("void" return-value))
    (vkgetgeneratedcommandsmemoryrequirementsnv device pinfo
     pmemoryrequirements))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdPreprocessGeneratedCommandsNV"
       cmd-preprocess-generated-commands-nv
       funcall-cmd-preprocess-generated-commands-nv)
      (commandbuffer pgeneratedcommandsinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkGeneratedCommandsInfoNV" "pGeneratedCommandsInfo") :return
     ("void" return-value))
    (vkcmdpreprocessgeneratedcommandsnv commandbuffer pgeneratedcommandsinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdExecuteGeneratedCommandsNV" cmd-execute-generated-commands-nv
       funcall-cmd-execute-generated-commands-nv)
      (commandbuffer ispreprocessed pgeneratedcommandsinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "isPreprocessed")
     ("VkGeneratedCommandsInfoNV" "pGeneratedCommandsInfo") :return
     ("void" return-value))
    (vkcmdexecutegeneratedcommandsnv commandbuffer ispreprocessed
     pgeneratedcommandsinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBindPipelineShaderGroupNV" cmd-bind-pipeline-shader-group-nv
       funcall-cmd-bind-pipeline-shader-group-nv)
      (commandbuffer pipelinebindpoint pipeline groupindex)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkPipelineBindPoint" "pipelineBindPoint") ("VkPipeline" pipeline)
     (uint32 "groupIndex") :return ("void" return-value))
    (vkcmdbindpipelineshadergroupnv commandbuffer pipelinebindpoint pipeline
     groupindex))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateIndirectCommandsLayoutNV" create-indirect-commands-layout-nv
       funcall-create-indirect-commands-layout-nv)
      (device pcreateinfo pallocator pindirectcommandslayout)
    (declare-types ("VkDevice" device)
     ("VkIndirectCommandsLayoutCreateInfoNV" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkIndirectCommandsLayoutNV" "pIndirectCommandsLayout") :return
     ("VkResult" return-value))
    (vkcreateindirectcommandslayoutnv device pcreateinfo pallocator
     pindirectcommandslayout))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyIndirectCommandsLayoutNV" destroy-indirect-commands-layout-nv
       funcall-destroy-indirect-commands-layout-nv)
      (device indirectcommandslayout pallocator)
    (declare-types ("VkDevice" device)
     ("VkIndirectCommandsLayoutNV" "indirectCommandsLayout")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroyindirectcommandslayoutnv device indirectcommandslayout
     pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkAcquireDrmDisplayEXT" acquire-drm-display-ext
       funcall-acquire-drm-display-ext)
      (physicaldevice drmfd display)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (int32 "drmFd")
     ("VkDisplayKHR" display) :return ("VkResult" return-value))
    (vkacquiredrmdisplayext physicaldevice drmfd display))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDrmDisplayEXT" get-drm-display-ext funcall-get-drm-display-ext)
      (physicaldevice drmfd connectorid display)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (int32 "drmFd")
     (uint32 "connectorId") ("VkDisplayKHR" display) :return
     ("VkResult" return-value))
    (vkgetdrmdisplayext physicaldevice drmfd connectorid display))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreatePrivateDataSlotEXT" create-private-data-slot-ext
       funcall-create-private-data-slot-ext)
      (device pcreateinfo pallocator pprivatedataslot)
    (declare-types ("VkDevice" device)
     ("VkPrivateDataSlotCreateInfo" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkPrivateDataSlot" "pPrivateDataSlot") :return ("VkResult" return-value))
    (vkcreateprivatedataslotext device pcreateinfo pallocator pprivatedataslot))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyPrivateDataSlotEXT" destroy-private-data-slot-ext
       funcall-destroy-private-data-slot-ext)
      (device privatedataslot pallocator)
    (declare-types ("VkDevice" device) ("VkPrivateDataSlot" "privateDataSlot")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroyprivatedataslotext device privatedataslot pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkSetPrivateDataEXT" set-private-data-ext funcall-set-private-data-ext)
      (device objecttype objecthandle privatedataslot data)
    (declare-types ("VkDevice" device) ("VkObjectType" "objectType")
     (uint64 "objectHandle") ("VkPrivateDataSlot" "privateDataSlot")
     (uint64 data) :return ("VkResult" return-value))
    (vksetprivatedataext device objecttype objecthandle privatedataslot data))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPrivateDataEXT" get-private-data-ext funcall-get-private-data-ext)
      (device objecttype objecthandle privatedataslot pdata)
    (declare-types ("VkDevice" device) ("VkObjectType" "objectType")
     (uint64 "objectHandle") ("VkPrivateDataSlot" "privateDataSlot")
     (uint64 "pData") :return ("void" return-value))
    (vkgetprivatedataext device objecttype objecthandle privatedataslot pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetFragmentShadingRateEnumNV"
       cmd-set-fragment-shading-rate-enum-nv
       funcall-cmd-set-fragment-shading-rate-enum-nv)
      (commandbuffer shadingrate combinerops)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkFragmentShadingRateNV" "shadingRate")
     ("VkFragmentShadingRateCombinerOpKHR" "combinerOps") :return
     ("void" return-value))
    (vkcmdsetfragmentshadingrateenumnv commandbuffer shadingrate combinerops))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetImageSubresourceLayout2EXT" get-image-subresource-layout-2-ext
       funcall-get-image-subresource-layout-2-ext)
      (device image psubresource playout)
    (declare-types ("VkDevice" device) ("VkImage" image)
     ("VkImageSubresource2EXT" "pSubresource")
     ("VkSubresourceLayout2EXT" "pLayout") :return ("void" return-value))
    (vkgetimagesubresourcelayout2ext device image psubresource playout))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkAcquireWinrtDisplayNV" acquire-winrt-display-nv
       funcall-acquire-winrt-display-nv)
      (physicaldevice display)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     ("VkDisplayKHR" display) :return ("VkResult" return-value))
    (vkacquirewinrtdisplaynv physicaldevice display))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetWinrtDisplayNV" get-winrt-display-nv funcall-get-winrt-display-nv)
      (physicaldevice devicerelativeid pdisplay)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
     (uint32 "deviceRelativeId") ("VkDisplayKHR" "pDisplay") :return
     ("VkResult" return-value))
    (vkgetwinrtdisplaynv physicaldevice devicerelativeid pdisplay))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetVertexInputEXT" cmd-set-vertex-input-ext
       funcall-cmd-set-vertex-input-ext)
      (commandbuffer vertexbindingdescriptioncount pvertexbindingdescriptions
       vertexattributedescriptioncount pvertexattributedescriptions)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "vertexBindingDescriptionCount")
     ("VkVertexInputBindingDescription2EXT" "pVertexBindingDescriptions")
     (uint32 "vertexAttributeDescriptionCount")
     ("VkVertexInputAttributeDescription2EXT" "pVertexAttributeDescriptions")
     :return ("void" return-value))
    (vkcmdsetvertexinputext commandbuffer vertexbindingdescriptioncount
     pvertexbindingdescriptions vertexattributedescriptioncount
     pvertexattributedescriptions))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI"
       get-device-subpass-shading-max-workgroup-size-huawei
       funcall-get-device-subpass-shading-max-workgroup-size-huawei)
      (device renderpass pmaxworkgroupsize)
    (declare-types ("VkDevice" device) ("VkRenderPass" renderpass)
     ("VkExtent2D" "pMaxWorkgroupSize") :return ("VkResult" return-value))
    (vkgetdevicesubpassshadingmaxworkgroupsizehuawei device renderpass
     pmaxworkgroupsize))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSubpassShadingHUAWEI" cmd-subpass-shading-huawei
       funcall-cmd-subpass-shading-huawei)
      (commandbuffer)
    (declare-types ("VkCommandBuffer" "commandBuffer") :return
     ("void" return-value))
    (vkcmdsubpassshadinghuawei commandbuffer))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBindInvocationMaskHUAWEI" cmd-bind-invocation-mask-huawei
       funcall-cmd-bind-invocation-mask-huawei)
      (commandbuffer imageview imagelayout)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkImageView" "imageView") ("VkImageLayout" "imageLayout") :return
     ("void" return-value))
    (vkcmdbindinvocationmaskhuawei commandbuffer imageview imagelayout))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetMemoryRemoteAddressNV" get-memory-remote-address-nv
       funcall-get-memory-remote-address-nv)
      (device pmemorygetremoteaddressinfo paddress)
    (declare-types ("VkDevice" device)
     ("VkMemoryGetRemoteAddressInfoNV" "pMemoryGetRemoteAddressInfo")
     ("VkRemoteAddressNV" "pAddress") :return ("VkResult" return-value))
    (vkgetmemoryremoteaddressnv device pmemorygetremoteaddressinfo paddress))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetPipelinePropertiesEXT" get-pipeline-properties-ext
       funcall-get-pipeline-properties-ext)
      (device ppipelineinfo ppipelineproperties)
    (declare-types ("VkDevice" device) ("VkPipelineInfoEXT" "pPipelineInfo")
     ("VkBaseOutStructure" "pPipelineProperties") :return
     ("VkResult" return-value))
    (vkgetpipelinepropertiesext device ppipelineinfo ppipelineproperties))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetPatchControlPointsEXT" cmd-set-patch-control-points-ext
       funcall-cmd-set-patch-control-points-ext)
      (commandbuffer patchcontrolpoints)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "patchControlPoints") :return ("void" return-value))
    (vkcmdsetpatchcontrolpointsext commandbuffer patchcontrolpoints))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetRasterizerDiscardEnableEXT"
       cmd-set-rasterizer-discard-enable-ext
       funcall-cmd-set-rasterizer-discard-enable-ext)
      (commandbuffer rasterizerdiscardenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "rasterizerDiscardEnable") :return ("void" return-value))
    (vkcmdsetrasterizerdiscardenableext commandbuffer rasterizerdiscardenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetDepthBiasEnableEXT" cmd-set-depth-bias-enable-ext
       funcall-cmd-set-depth-bias-enable-ext)
      (commandbuffer depthbiasenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "depthBiasEnable") :return ("void" return-value))
    (vkcmdsetdepthbiasenableext commandbuffer depthbiasenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetLogicOpEXT" cmd-set-logic-op-ext funcall-cmd-set-logic-op-ext)
      (commandbuffer logicop)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkLogicOp" "logicOp")
     :return ("void" return-value))
    (vkcmdsetlogicopext commandbuffer logicop))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetPrimitiveRestartEnableEXT" cmd-set-primitive-restart-enable-ext
       funcall-cmd-set-primitive-restart-enable-ext)
      (commandbuffer primitiverestartenable)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkBool32" "primitiveRestartEnable") :return ("void" return-value))
    (vkcmdsetprimitiverestartenableext commandbuffer primitiverestartenable))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetColorWriteEnableEXT" cmd-set-color-write-enable-ext
       funcall-cmd-set-color-write-enable-ext)
      (commandbuffer attachmentcount pcolorwriteenables)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "attachmentCount") ("VkBool32" "pColorWriteEnables") :return
     ("void" return-value))
    (vkcmdsetcolorwriteenableext commandbuffer attachmentcount
     pcolorwriteenables))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawMultiEXT" cmd-draw-multi-ext funcall-cmd-draw-multi-ext)
      (commandbuffer drawcount pvertexinfo instancecount firstinstance stride)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "drawCount")
     ("VkMultiDrawInfoEXT" "pVertexInfo") (uint32 "instanceCount")
     (uint32 "firstInstance") (uint32 stride) :return ("void" return-value))
    (vkcmddrawmultiext commandbuffer drawcount pvertexinfo instancecount
     firstinstance stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdDrawMultiIndexedEXT" cmd-draw-multi-indexed-ext
       funcall-cmd-draw-multi-indexed-ext)
      (commandbuffer drawcount pindexinfo instancecount firstinstance stride
       pvertexoffset)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "drawCount")
     ("VkMultiDrawIndexedInfoEXT" "pIndexInfo") (uint32 "instanceCount")
     (uint32 "firstInstance") (uint32 stride) (int32 "pVertexOffset") :return
     ("void" return-value))
    (vkcmddrawmultiindexedext commandbuffer drawcount pindexinfo instancecount
     firstinstance stride pvertexoffset))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkSetDeviceMemoryPriorityEXT" set-device-memory-priority-ext
       funcall-set-device-memory-priority-ext)
      (device memory priority)
    (declare-types ("VkDevice" device) ("VkDeviceMemory" memory)
     (float priority) :return ("void" return-value))
    (vksetdevicememorypriorityext device memory priority))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDescriptorSetLayoutHostMappingInfoVALVE"
       get-descriptor-set-layout-host-mapping-info-valve
       funcall-get-descriptor-set-layout-host-mapping-info-valve)
      (device pbindingreference phostmapping)
    (declare-types ("VkDevice" device)
     ("VkDescriptorSetBindingReferenceVALVE" "pBindingReference")
     ("VkDescriptorSetLayoutHostMappingInfoVALVE" "pHostMapping") :return
     ("void" return-value))
    (vkgetdescriptorsetlayouthostmappinginfovalve device pbindingreference
     phostmapping))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDescriptorSetHostMappingVALVE"
       get-descriptor-set-host-mapping-valve
       funcall-get-descriptor-set-host-mapping-valve)
      (device descriptorset ppdata)
    (declare-types ("VkDevice" device) ("VkDescriptorSet" "descriptorSet")
     (void "ppData") :return ("void" return-value))
    (vkgetdescriptorsethostmappingvalve device descriptorset ppdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateAccelerationStructureKHR" create-acceleration-structure-khr
       funcall-create-acceleration-structure-khr)
      (device pcreateinfo pallocator paccelerationstructure)
    (declare-types ("VkDevice" device)
     ("VkAccelerationStructureCreateInfoKHR" "pCreateInfo")
     ("VkAllocationCallbacks" "pAllocator")
     ("VkAccelerationStructureKHR" "pAccelerationStructure") :return
     ("VkResult" return-value))
    (vkcreateaccelerationstructurekhr device pcreateinfo pallocator
     paccelerationstructure))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkDestroyAccelerationStructureKHR" destroy-acceleration-structure-khr
       funcall-destroy-acceleration-structure-khr)
      (device accelerationstructure pallocator)
    (declare-types ("VkDevice" device)
     ("VkAccelerationStructureKHR" "accelerationStructure")
     ("VkAllocationCallbacks" "pAllocator") :return ("void" return-value))
    (vkdestroyaccelerationstructurekhr device accelerationstructure pallocator))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBuildAccelerationStructuresKHR"
       cmd-build-acceleration-structures-khr
       funcall-cmd-build-acceleration-structures-khr)
      (commandbuffer infocount pinfos ppbuildrangeinfos)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "infoCount")
     ("VkAccelerationStructureBuildGeometryInfoKHR" "pInfos")
     ("VkAccelerationStructureBuildRangeInfoKHR" "ppBuildRangeInfos") :return
     ("void" return-value))
    (vkcmdbuildaccelerationstructureskhr commandbuffer infocount pinfos
     ppbuildrangeinfos))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdBuildAccelerationStructuresIndirectKHR"
       cmd-build-acceleration-structures-indirect-khr
       funcall-cmd-build-acceleration-structures-indirect-khr)
      (commandbuffer infocount pinfos pindirectdeviceaddresses pindirectstrides
       ppmaxprimitivecounts)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "infoCount")
     ("VkAccelerationStructureBuildGeometryInfoKHR" "pInfos")
     ("VkDeviceAddress" "pIndirectDeviceAddresses") (uint32 "pIndirectStrides")
     (uint32 "ppMaxPrimitiveCounts") :return ("void" return-value))
    (vkcmdbuildaccelerationstructuresindirectkhr commandbuffer infocount pinfos
     pindirectdeviceaddresses pindirectstrides ppmaxprimitivecounts))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkBuildAccelerationStructuresKHR" build-acceleration-structures-khr
       funcall-build-acceleration-structures-khr)
      (device deferredoperation infocount pinfos ppbuildrangeinfos)
    (declare-types ("VkDevice" device)
     ("VkDeferredOperationKHR" "deferredOperation") (uint32 "infoCount")
     ("VkAccelerationStructureBuildGeometryInfoKHR" "pInfos")
     ("VkAccelerationStructureBuildRangeInfoKHR" "ppBuildRangeInfos") :return
     ("VkResult" return-value))
    (vkbuildaccelerationstructureskhr device deferredoperation infocount pinfos
     ppbuildrangeinfos))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCopyAccelerationStructureKHR" copy-acceleration-structure-khr
       funcall-copy-acceleration-structure-khr)
      (device deferredoperation pinfo)
    (declare-types ("VkDevice" device)
     ("VkDeferredOperationKHR" "deferredOperation")
     ("VkCopyAccelerationStructureInfoKHR" "pInfo") :return
     ("VkResult" return-value))
    (vkcopyaccelerationstructurekhr device deferredoperation pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCopyAccelerationStructureToMemoryKHR"
       copy-acceleration-structure-to-memory-khr
       funcall-copy-acceleration-structure-to-memory-khr)
      (device deferredoperation pinfo)
    (declare-types ("VkDevice" device)
     ("VkDeferredOperationKHR" "deferredOperation")
     ("VkCopyAccelerationStructureToMemoryInfoKHR" "pInfo") :return
     ("VkResult" return-value))
    (vkcopyaccelerationstructuretomemorykhr device deferredoperation pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCopyMemoryToAccelerationStructureKHR"
       copy-memory-to-acceleration-structure-khr
       funcall-copy-memory-to-acceleration-structure-khr)
      (device deferredoperation pinfo)
    (declare-types ("VkDevice" device)
     ("VkDeferredOperationKHR" "deferredOperation")
     ("VkCopyMemoryToAccelerationStructureInfoKHR" "pInfo") :return
     ("VkResult" return-value))
    (vkcopymemorytoaccelerationstructurekhr device deferredoperation pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkWriteAccelerationStructuresPropertiesKHR"
       write-acceleration-structures-properties-khr
       funcall-write-acceleration-structures-properties-khr)
      (device accelerationstructurecount paccelerationstructures querytype
       datasize pdata stride)
    (declare-types ("VkDevice" device) (uint32 "accelerationStructureCount")
     ("VkAccelerationStructureKHR" "pAccelerationStructures")
     ("VkQueryType" "queryType") (size "dataSize") (void "pData") (size stride)
     :return ("VkResult" return-value))
    (vkwriteaccelerationstructurespropertieskhr device
     accelerationstructurecount paccelerationstructures querytype datasize
     pdata stride))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyAccelerationStructureKHR" cmd-copy-acceleration-structure-khr
       funcall-cmd-copy-acceleration-structure-khr)
      (commandbuffer pinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyAccelerationStructureInfoKHR" "pInfo") :return
     ("void" return-value))
    (vkcmdcopyaccelerationstructurekhr commandbuffer pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyAccelerationStructureToMemoryKHR"
       cmd-copy-acceleration-structure-to-memory-khr
       funcall-cmd-copy-acceleration-structure-to-memory-khr)
      (commandbuffer pinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyAccelerationStructureToMemoryInfoKHR" "pInfo") :return
     ("void" return-value))
    (vkcmdcopyaccelerationstructuretomemorykhr commandbuffer pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdCopyMemoryToAccelerationStructureKHR"
       cmd-copy-memory-to-acceleration-structure-khr
       funcall-cmd-copy-memory-to-acceleration-structure-khr)
      (commandbuffer pinfo)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkCopyMemoryToAccelerationStructureInfoKHR" "pInfo") :return
     ("void" return-value))
    (vkcmdcopymemorytoaccelerationstructurekhr commandbuffer pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetAccelerationStructureDeviceAddressKHR"
       get-acceleration-structure-device-address-khr
       funcall-get-acceleration-structure-device-address-khr)
      (device pinfo)
    (declare-types ("VkDevice" device)
     ("VkAccelerationStructureDeviceAddressInfoKHR" "pInfo") :return
     ("VkDeviceAddress" return-value))
    (vkgetaccelerationstructuredeviceaddresskhr device pinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdWriteAccelerationStructuresPropertiesKHR"
       cmd-write-acceleration-structures-properties-khr
       funcall-cmd-write-acceleration-structures-properties-khr)
      (commandbuffer accelerationstructurecount paccelerationstructures
       querytype querypool firstquery)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "accelerationStructureCount")
     ("VkAccelerationStructureKHR" "pAccelerationStructures")
     ("VkQueryType" "queryType") ("VkQueryPool" "queryPool")
     (uint32 "firstQuery") :return ("void" return-value))
    (vkcmdwriteaccelerationstructurespropertieskhr commandbuffer
     accelerationstructurecount paccelerationstructures querytype querypool
     firstquery))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetDeviceAccelerationStructureCompatibilityKHR"
       get-device-acceleration-structure-compatibility-khr
       funcall-get-device-acceleration-structure-compatibility-khr)
      (device pversioninfo pcompatibility)
    (declare-types ("VkDevice" device)
     ("VkAccelerationStructureVersionInfoKHR" "pVersionInfo")
     ("VkAccelerationStructureCompatibilityKHR" "pCompatibility") :return
     ("void" return-value))
    (vkgetdeviceaccelerationstructurecompatibilitykhr device pversioninfo
     pcompatibility))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetAccelerationStructureBuildSizesKHR"
       get-acceleration-structure-build-sizes-khr
       funcall-get-acceleration-structure-build-sizes-khr)
      (device buildtype pbuildinfo pmaxprimitivecounts psizeinfo)
    (declare-types ("VkDevice" device)
     ("VkAccelerationStructureBuildTypeKHR" "buildType")
     ("VkAccelerationStructureBuildGeometryInfoKHR" "pBuildInfo")
     (uint32 "pMaxPrimitiveCounts")
     ("VkAccelerationStructureBuildSizesInfoKHR" "pSizeInfo") :return
     ("void" return-value))
    (vkgetaccelerationstructurebuildsizeskhr device buildtype pbuildinfo
     pmaxprimitivecounts psizeinfo))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdTraceRaysKHR" cmd-trace-rays-khr funcall-cmd-trace-rays-khr)
      (commandbuffer praygenshaderbindingtable pmissshaderbindingtable
       phitshaderbindingtable pcallableshaderbindingtable width height depth)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkStridedDeviceAddressRegionKHR" "pRaygenShaderBindingTable")
     ("VkStridedDeviceAddressRegionKHR" "pMissShaderBindingTable")
     ("VkStridedDeviceAddressRegionKHR" "pHitShaderBindingTable")
     ("VkStridedDeviceAddressRegionKHR" "pCallableShaderBindingTable")
     (uint32 width) (uint32 height) (uint32 depth) :return
     ("void" return-value))
    (vkcmdtracerayskhr commandbuffer praygenshaderbindingtable
     pmissshaderbindingtable phitshaderbindingtable pcallableshaderbindingtable
     width height depth))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCreateRayTracingPipelinesKHR" create-ray-tracing-pipelines-khr
       funcall-create-ray-tracing-pipelines-khr)
      (device deferredoperation pipelinecache createinfocount pcreateinfos
       pallocator ppipelines)
    (declare-types ("VkDevice" device)
     ("VkDeferredOperationKHR" "deferredOperation")
     ("VkPipelineCache" "pipelineCache") (uint32 "createInfoCount")
     ("VkRayTracingPipelineCreateInfoKHR" "pCreateInfos")
     ("VkAllocationCallbacks" "pAllocator") ("VkPipeline" "pPipelines") :return
     ("VkResult" return-value))
    (vkcreateraytracingpipelineskhr device deferredoperation pipelinecache
     createinfocount pcreateinfos pallocator ppipelines))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR"
       get-ray-tracing-capture-replay-shader-group-handles-khr
       funcall-get-ray-tracing-capture-replay-shader-group-handles-khr)
      (device pipeline firstgroup groupcount datasize pdata)
    (declare-types ("VkDevice" device) ("VkPipeline" pipeline)
     (uint32 "firstGroup") (uint32 "groupCount") (size "dataSize")
     (void "pData") :return ("VkResult" return-value))
    (vkgetraytracingcapturereplayshadergrouphandleskhr device pipeline
     firstgroup groupcount datasize pdata))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdTraceRaysIndirectKHR" cmd-trace-rays-indirect-khr
       funcall-cmd-trace-rays-indirect-khr)
      (commandbuffer praygenshaderbindingtable pmissshaderbindingtable
       phitshaderbindingtable pcallableshaderbindingtable indirectdeviceaddress)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     ("VkStridedDeviceAddressRegionKHR" "pRaygenShaderBindingTable")
     ("VkStridedDeviceAddressRegionKHR" "pMissShaderBindingTable")
     ("VkStridedDeviceAddressRegionKHR" "pHitShaderBindingTable")
     ("VkStridedDeviceAddressRegionKHR" "pCallableShaderBindingTable")
     ("VkDeviceAddress" "indirectDeviceAddress") :return ("void" return-value))
    (vkcmdtraceraysindirectkhr commandbuffer praygenshaderbindingtable
     pmissshaderbindingtable phitshaderbindingtable pcallableshaderbindingtable
     indirectdeviceaddress))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkGetRayTracingShaderGroupStackSizeKHR"
       get-ray-tracing-shader-group-stack-size-khr
       funcall-get-ray-tracing-shader-group-stack-size-khr)
      (device pipeline group groupshader)
    (declare-types ("VkDevice" device) ("VkPipeline" pipeline) (uint32 group)
     ("VkShaderGroupShaderKHR" "groupShader") :return
     ("VkDeviceSize" return-value))
    (vkgetraytracingshadergroupstacksizekhr device pipeline group groupshader))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it.")

  (more-cffi:def-foreign-function doc-file
      ("vkCmdSetRayTracingPipelineStackSizeKHR"
       cmd-set-ray-tracing-pipeline-stack-size-khr
       funcall-cmd-set-ray-tracing-pipeline-stack-size-khr)
      (commandbuffer pipelinestacksize)
    (declare-types ("VkCommandBuffer" "commandBuffer")
     (uint32 "pipelineStackSize") :return ("void" return-value))
    (vkcmdsetraytracingpipelinestacksizekhr commandbuffer pipelinestacksize))

  (more-cffi:doc-note doc-file
                      "This function needs to be revised. Please, post an issue to request it."))