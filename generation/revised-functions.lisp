
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/functions.md"))

  
  (mcffi:def-foreign-function doc-file "vkCreateInstance" create-instance (pcreateinfo pallocator)
    (declare-types ("VkInstanceCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkInstance" instance) ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pinstance 'vkinstance)
        (let ((result (vkcreateinstance pcreateinfo pallocator-c pinstance)))
          (values (cffi:mem-ref pinstance 'vkinstance) result (if pallocator
								  pallocator-c
								  nil))))))

  
  (mcffi:def-foreign-function doc-file "vkDestroyInstance" destroy-instance  (instance pAllocator)
    (declare-types ("VkInstance" instance) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyInstance instance pAllocator-c)))


  (mcffi:defwith doc-file with-instance 
    create-instance
    destroy-instance
    :destructor-arguments (0 2))

  (mcffi:doc-note "The allocator is passed to both constructor and destructor." doc-file)


  (mcffi:def-foreign-function doc-file "vkEnumerateInstanceExtensionProperties" create-enumerate-instance-extension-properties (pLayerName)
    (declare-types (string "pLayerName") :return ((list "VkExtensionProperties") extension-props))
    (let ((pLayerName-c (if pLayerName
			    (cffi:foreign-string-alloc pLayerName)
			    (cffi:null-pointer))))
      (cffi:with-foreign-object (pPropertyCount :uint32)
	(vkEnumerateInstanceExtensionProperties pLayerName-c pPropertyCount (cffi:null-pointer))
	(let* ((property-count (cffi:mem-ref pPropertyCount :uint32))
	       (pProperties (cffi:foreign-alloc '(:struct VkExtensionProperties) :count property-count)))
	  (vkEnumerateInstanceExtensionProperties pLayerName-c pPropertyCount pProperties)
	  (iter (for i from 0 below property-count)
	    (collect (cffi:mem-aptr pProperties '(:struct VkExtensionProperties) i)))))))

  (mcffi:def-foreign-function doc-file nil destroy-enumerate-instance-extension-properties (extension-props)
    (declare-types ("(list VkExtensionProperties)" extension-props))
    (cffi:foreign-free (car extension-props)))

  
  (mcffi:defwith doc-file with-enumerate-instance-extension-properties
    create-enumerate-instance-extension-properties
    destroy-enumerate-instance-extension-properties)


  (mcffi:def-foreign-function doc-file "vkEnumerateInstanceLayerProperties" create-enumerate-instance-layer-properties ()
    (declare-types :return ((list "VkLayerProperties") layer-props))
    (cffi:with-foreign-object (pPropertyCount :uint32)
      (vkEnumerateInstanceLayerProperties pPropertyCount (cffi:null-pointer))
      (let* ((property-count (cffi:mem-ref pPropertyCount :uint32))
	     (pProperties (cffi:foreign-alloc '(:struct VkLayerProperties) :count property-count)))
	(vkEnumerateInstanceLayerProperties pPropertyCount pProperties)
	(iter (for i from 0 below property-count)
	  (collect (cffi:mem-aptr pProperties '(:struct VkLayerProperties) i))))))

  (mcffi:def-foreign-function doc-file nil destroy-enumerate-instance-layer-properties (layer-props)
    (declare-types ((list "VkLayerProperties") layer-props))
    (cffi:foreign-free (car layer-props)))


  (mcffi:defwith doc-file with-enumerate-instance-layer-properties 
    create-enumerate-instance-layer-properties
    destroy-enumerate-instance-layer-properties)

  
  (more-cffi:def-foreign-function doc-file "vkEnumeratePhysicalDevices" enumerate-physical-devices (instance pphysicaldevicecount)
    (declare-types ("VkInstance" instance) (uint32 "pPhysicalDeviceCount")
		   :return ((list "VkPhysicalDevice") "pPhysicalDevices") ("VkResult" return-value))
    (cffi:with-foreign-object (pPhysicalDeviceCount :uint32)
      (vkEnumeratePhysicalDevices instance pPhysicalDeviceCount (cffi:null-pointer))
      (let ((physical-device-count (cffi:mem-ref pPhysicalDeviceCount :uint32)))
	(cffi:with-foreign-object (pPhysicalDevices 'VKPhysicalDevice physical-device-count) 
	  (vkEnumeratePhysicalDevices instance pPhysicalDeviceCount pPhysicalDevices)
	  (loop for i from 0 below physical-device-count
		collect (cffi:mem-aref pPhysicalDevices 'VKPhysicalDevice i))))))


  (more-cffi:def-foreign-function doc-file "vkGetPhysicalDeviceProperties" get-physical-device-properties (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
		   :return ("VkPhysicalDeviceProperties" "pProperties"))
    (let ((pProperties (cffi:foreign-alloc '(:struct VkPhysicalDeviceProperties))))
      (vkGetPhysicalDeviceProperties physicalDevice pProperties)
      (values pProperties)))

  (mcffi:def-foreign-function doc-file nil destroy-get-physical-device-properties (pProperties)
    (declare-types ("VkPhysicalDeviceProperties" "pProperties"))
    (cffi:foreign-free pProperties))

  
  (mcffi:defwith doc-file with-get-physical-device-properties 
    create-get-physical-device-properties
    destroy-get-physical-device-properties)


  (more-cffi:def-foreign-function doc-file "vkGetPhysicalDeviceFeatures" get-physical-device-features (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return ("VkPhysicalDeviceFeatures" pFeatures))
    (let ((pFeatures (cffi:foreign-alloc '(:struct VkPhysicalDeviceFeatures))))
      (vkGetPhysicalDeviceFeatures physicalDevice pFeatures)
      (values pFeatures)))

  (mcffi:def-foreign-function doc-file nil destroy-get-physical-device-features (pFeatures)
    (declare-types ("VkPhysicalDeviceFeatures" "pFeatures"))
    (cffi:foreign-free pFeatures))

  
  (mcffi:defwith doc-file with-get-physical-device-features 
    create-get-physical-device-features
    destroy-get-physical-device-features))
