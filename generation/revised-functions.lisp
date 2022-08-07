
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
		   :return ((list "VkPhysicalDevice") "pPhysicalDevices") ("VkResult" result))
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
    destroy-get-physical-device-features)


  (more-cffi:def-foreign-function doc-file "vkGetPhysicalDeviceQueueFamilyProperties" get-physical-device-queue-family-properties (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return ((list "VkQueueFamilyProperties") "pQueueFamilyProperties"))
    (cffi:with-foreign-object (pQueueFamilyPropertyCount :uint32)
      (vkGetPhysicalDeviceQueueFamilyProperties physicalDevice pQueueFamilyPropertyCount (cffi:null-pointer))
      (let* ((queue-family-property-count (cffi:mem-ref pQueueFamilyPropertyCount :uint32))
	     (pQueueFamilyProperties (cffi:foreign-alloc '(:struct VKQueueFamilyProperties)
							 :count queue-family-property-count))) 
	(vkGetPhysicalDeviceQueueFamilyProperties physicalDevice pQueueFamilyPropertyCount pQueueFamilyProperties)
	(loop for i from 0 below queue-family-property-count
              collect (cffi:mem-aptr pQueueFamilyProperties '(:struct VKQueueFamilyProperties) i)))))

  (mcffi:def-foreign-function doc-file nil destroy-get-physical-device-queue-family-properties (pQueueFamilyProperties)
    (declare-types ((list "VkQueueFamilyProperties") pQueueFamilyProperties))
    (cffi:foreign-free (car pQueueFamilyProperties)))

  
  (mcffi:defwith doc-file with-get-physical-device-queue-family-properties 
    create-get-physical-device-queue-family-properties
    destroy-get-physical-device-queue-family-properties)


  (more-cffi:def-foreign-function doc-file "vkGetPhysicalDeviceSurfaceSupportKHR" get-physical-device-surface-support-khr (physicaldevice queuefamilyindex surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (uint32 "queueFamilyIndex") ("VkSurfaceKHR" surface)
		   :return (boolean "pSupported") ("VkResult" result))
    (cffi:with-foreign-object (pSupported 'VkBool32)
      (let ((result (vkGetPhysicalDeviceSurfaceSupportKHR physicalDevice queueFamilyIndex surface pSupported))
	    (supportedp (cffi:mem-ref pSupported 'VkBool32)))
	(values (equal supportedp VK_TRUE) result))))


  (more-cffi:def-foreign-function doc-file "vkEnumerateDeviceExtensionProperties" enumerate-device-extension-properties (physicaldevice playername)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (string "pLayerName")
		   :return ("VkExtensionProperties" "pProperties") ("VkResult" result))
    (let ((pLayerName-c (or pLayerName (cffi:null-pointer))))
      (cffi:with-foreign-object (pPropertyCount :uint32)
	(vkEnumerateDeviceExtensionProperties physicalDevice pLayerName-c pPropertyCount (cffi:null-pointer))
	(let* ((property-count (cffi:mem-ref pPropertyCount :uint32))
	       (pProperties (cffi:foreign-alloc '(:struct VkExtensionProperties) :count property-count)))
	  (let ((result (vkEnumerateDeviceExtensionProperties physicalDevice pLayerName-c pPropertyCount pProperties))
		(properties (iter (for i from 0 below property-count)
				  (collect (cffi:mem-aptr pProperties '(:struct VkExtensionProperties) i)))))
	    (values properties result))))))

  (mcffi:def-foreign-function doc-file nil destroy-enumerate-device-extension-properties (pProperties)
    (declare-types ((list "VkExtensionProperties") "pProperties"))
    (cffi:foreign-free (car pProperties)))

  
  (mcffi:defwith doc-file with-enumerate-device-extension-properties
    create-enumerate-device-extension-properties
    destroy-enumerate-device-extension-properties)


  (more-cffi:def-foreign-function doc-file "vkGetPhysicalDeviceSurfaceCapabilitiesKHR" get-physical-device-surface-capabilities-khr (physicaldevice surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkSurfaceKHR" surface)
		   :return ("VkSurfaceCapabilitiesKHR" "pSurfaceCapabilities") ("VkResult" result))
    (let* ((pSurfaceCapabilities (cffi:foreign-alloc '(:struct VkSurfaceCapabilitiesKHR)))
	   (result (vkGetPhysicalDeviceSurfaceCapabilitiesKHR physicalDevice surface pSurfaceCapabilities)))
      (values pSurfaceCapabilities result)))

  (mcffi:def-foreign-function doc-file nil destroy-get-physical-device-surface-capabilities (pSurfaceCapabilities)
    (declare-types ("VkSurfaceCapabilitiesKHR" "pSurfaceCapabilities"))
    (cffi:foreign-free pSurfaceCapabilities))

  
  (mcffi:defwith doc-file with-get-physical-device-surface-capabilities
    create-get-physical-device-surface-capabilities
    destroy-get-physical-device-surface-capabilities)


  (more-cffi:def-foreign-function doc-file "vkGetPhysicalDeviceSurfaceFormatsKHR" get-physical-device-surface-formats-khr (physicaldevice surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkSurfaceKHR" surface)
		   :return ("VkSurfaceFormatKHR" "pSurfaceFormats") ("VkResult" result))
    (cffi:with-foreign-object (pSurfaceFormatCount :uint32)
      (vkGetPhysicalDeviceSurfaceFormatsKHR physicalDevice surface pSurfaceFormatCount (cffi:null-pointer))
      (let* ((surface-format-count (cffi:mem-ref pSurfaceFormatCount :uint32))
	     (pSurfaceFormats (cffi:foreign-alloc '(:struct VkSurfaceFormatKHR) :count surface-format-count))
	     (result (vkGetPhysicalDeviceSurfaceFormatsKHR physicalDevice surface pSurfaceFormatCount pSurfaceFormats))
	     (surface-formats (iter (for i from 0 below surface-format-count)
				    (collect (cffi:mem-aptr pSurfaceFormats '(:struct VkSurfaceFormatKHR) i)))))
	(values surface-formats result))))

  (mcffi:def-foreign-function doc-file nil destroy-get-physical-device-surface-formats (pSurfaceFormats)
    (declare-types ((list "VkSurfaceFormatKHR") "pSurfaceFormats"))
    (cffi:foreign-free (car pSurfaceFormats)))

  
  (mcffi:defwith doc-file with-get-physical-device-surface-formats 
    create-get-physical-device-surface-formats
    destroy-get-physical-device-surface-formats)


  (more-cffi:def-foreign-function doc-file "vkGetPhysicalDeviceSurfacePresentModesKHR" get-physical-device-surface-present-modes-khr (physicaldevice surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkSurfaceKHR" surface)
		   :return ("VkPresentModeKHR" "pPresentModes") ("VkResult" result))
    (cffi:with-foreign-object (pPresentModeCount :uint32)
      (vkGetPhysicalDeviceSurfacePresentModesKHR physicalDevice surface pPresentModeCount (cffi:null-pointer))
      (let* ((present-mode-count (cffi:mem-ref pPresentModeCount :uint32)))
	(cffi:with-foreign-object (pPresentModes 'VkPresentModeKHR present-mode-count)
	  (let ((result (vkGetPhysicalDeviceSurfacePresentModesKHR physicalDevice surface pPresentModeCount pPresentModes))
		(present-modes (iter (for i from 0 below present-mode-count)
				     (collect (cffi:mem-aref pPresentModes 'VkPresentModeKHR i)))))
	    (values present-modes result))))))


  (more-cffi:def-foreign-function doc-file "vkCreateDevice" create-device (physicaldevice pcreateinfo pallocator)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkDeviceCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkDevice" "pDevice") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pDevice 'VkDevice)
	(let ((result (vkCreateDevice physicalDevice pCreateInfo pAllocator-c pDevice)))
	  (values (cffi:mem-ref pDevice 'VkDevice) result (if pAllocator pAllocator-c nil))))))


  (more-cffi:def-foreign-function doc-file "vkDestroyDevice" destroy-device (device pallocator)
    (declare-types ("VkDevice" device) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyDevice device pAllocator-c)))


  (mcffi:defwith doc-file with-device
    create-device
    destroy-device
    :destructor-arguments (0 2))


  (more-cffi:def-foreign-function doc-file "vkGetDeviceQueue" get-device-queue (device queuefamilyindex queueindex)
    (declare-types ("VkDevice" device) (uint32 "queueFamilyIndex") (uint32 "queueIndex")
		   :return ("VkQueue" "pQueue"))
    (cffi:with-foreign-object (pQueue 'VkQueue)
      (vkGetDeviceQueue device queueFamilyIndex queueIndex pQueue)
      (cffi:mem-ref pQueue 'VkQueue)))


  (more-cffi:def-foreign-function doc-file "vkDestroySurfaceKHR" destroy-surface-khr (instance surface pallocator)
    (declare-types ("VkInstance" instance) ("VkSurfaceKHR" surface) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroySurfaceKHR instance surface pAllocator-c)))


  (more-cffi:def-foreign-function doc-file "vkCreateShaderModule" create-shader-module (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkShaderModuleCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator") :return ("VkShaderModule" "pShaderModule") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pShaderModule 'VkShaderModule)
	(let ((result (vkCreateShaderModule device pCreateInfo pAllocator-c pShaderModule)))
	  (values (cffi:mem-ref pShaderModule 'VkShaderModule) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file "vkDestroyShaderModule" destroy-shader-module (device shadermodule pallocator)
    (declare-types ("VkDevice" device) ("VkShaderModule" "shaderModule") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyShaderModule device shaderModule pAllocator-c)))


  (mcffi:defwith doc-file with-shader-module 
    create-shader-module
    destroy-shader-module
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file "vkCreateImageView" create-image-view (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkImageViewCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkImageView" "pView") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pView 'VkImageView)
	(let ((result (vkCreateImageView device pCreateInfo pAllocator-c pView)))
	  (values (cffi:mem-ref pView 'VkImageView) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file "vkDestroyImageView" destroy-image-view (device imageview pallocator)
    (declare-types ("VkDevice" device) ("VkImageView" "imageView") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyImageView device imageView pAllocator-c)))


  (mcffi:defwith doc-file with-image-view
    create-image-view
    destroy-image-view
    :destructor-arguments (2 0 3)))
