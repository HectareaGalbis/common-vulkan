(in-package :cvk)

(more-cffi:with-doc-file (doc-file
                          (asdf/system:system-relative-pathname "common-vulkan"
                                                                "docs/api/functions.md"))

  (more-cffi:def-foreign-function doc-file
      "vkCreateInstance"
      create-instance
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

  (more-cffi:doc-note doc-file
                      "The C code has been changed since last update. Please, post an issue to make the maintainer revise this function.")

  (more-cffi:def-foreign-function doc-file
      "vkDestroyInstance"
      destroy-instance
      (instance pallocator)
    (declare-types ("VkInstance" instance)
     ("VkAllocationCallbacks" "pAllocator"))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (vkdestroyinstance instance pallocator-c)))

  (more-cffi:doc-note doc-file
                      "The C code has been changed since last update. Please, post an issue to make the maintainer revise this function.")

  (more-cffi:defwith doc-file with-instance create-instance destroy-instance
                     :destructor-arguments (0 2))

  (more-cffi:doc-note doc-file
                      "The C code has been changed since last update. Please, post an issue to make the maintainer revise this function.")

  (more-cffi:doc-note
   "The allocator is passed to both constructor and destructor." doc-file)

  (more-cffi:def-foreign-function doc-file
      "vkEnumeratePhysicalDevices"
      enumerate-physical-devices
      (instance pphysicaldevicecount)
    (declare-types ("VkInstance" instance) (uint32 "pPhysicalDeviceCount")
     :return ((list "VkPhysicalDevice") "pPhysicalDevices") ("VkResult" result))
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

  (more-cffi:doc-note doc-file
                      "The C code has been changed since last update. Please, post an issue to make the maintainer revise this function.")

  (more-cffi:def-foreign-function doc-file
      "vkGetPhysicalDeviceFeatures"
      get-physical-device-features
      (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return
     ("VkPhysicalDeviceFeatures" pfeatures))
    (let ((pfeatures (cffi:foreign-alloc '(:struct vkphysicaldevicefeatures))))
      (vkgetphysicaldevicefeatures physicaldevice pfeatures)
      (values pfeatures)))

  (more-cffi:doc-note doc-file
                      "The C code has been changed since last update. Please, post an issue to make the maintainer revise this function.")

  (more-cffi:def-foreign-function doc-file
      nil
      destroy-get-physical-device-features
      (pfeatures)
    (declare-types ("VkPhysicalDeviceFeatures" "pFeatures"))
    (cffi-sys:foreign-free pfeatures))

  (more-cffi:doc-note doc-file
                      "The C code has been changed since last update. Please, post an issue to make the maintainer revise this function.")

  (more-cffi:defwith doc-file with-get-physical-device-features
     