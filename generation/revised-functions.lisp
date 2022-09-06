
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/functions.md"))


  (more-cffi:def-foreign-function doc-file ("vkGetInstanceProcAddr" get-instance-proc-addr funcall-get-instance-proc-addr) (instance pname)
    (declare-types ("VkInstance" instance) (string "pName") :return (function result))
    (let ((instance-c (or instance (cffi:null-pointer))))
      (cffi:with-foreign-string (pname-c pname)
	(let ((func-pointer (vkgetinstanceprocaddr instance-c pname-c)))
	  (if (cffi:null-pointer-p func-pointer)
	      nil
	      (let* ((lisp-function-name (subseq (string (cffi:translate-camelcase-name pname
											:special-words
											'("2D" "3D" "KHR" "EXT" "VALVE" "GOOGLE" "AMD" "INTEL" "NVX" "NV" "HUAWEI")))
						 3))
		     (funcall-function (intern (concatenate 'string "FUNCALL-" lisp-function-name) :cvk)))
		(lambda (&rest args)
		  (apply funcall-function func-pointer args))))))))
  
  
  (mcffi:def-foreign-function doc-file ("vkCreateInstance" create-instance funcall-create-instance) (pcreateinfo pallocator)
    (declare-types ("VkInstanceCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkInstance" instance) ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pinstance 'vkinstance)
        (let ((result (vkcreateinstance pcreateinfo pallocator-c pinstance)))
          (values (cffi:mem-ref pinstance 'vkinstance) result (if pallocator
								  pallocator-c
								  nil))))))

  
  (mcffi:def-foreign-function doc-file ("vkDestroyInstance" destroy-instance funcall-destroy-instance)  (instance pAllocator)
    (declare-types ("VkInstance" instance) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyInstance instance pAllocator-c)))


  (mcffi:defwith doc-file with-instance 
    create-instance
    destroy-instance
    :destructor-arguments (0 2))

  (mcffi:doc-note doc-file "The allocator is passed to both constructor and destructor.")


  (mcffi:def-foreign-function doc-file ("vkEnumerateInstanceExtensionProperties" create-enumerate-instance-extension-properties funcall-enumerate-instance-extension-properties) (pLayerName)
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

  (mcffi:def-lisp-function doc-file destroy-enumerate-instance-extension-properties (extension-props)
    (declare-types ("(list VkExtensionProperties)" extension-props))
    (cffi:foreign-free (car extension-props)))

  
  (mcffi:defwith doc-file with-enumerate-instance-extension-properties
    create-enumerate-instance-extension-properties
    destroy-enumerate-instance-extension-properties)


  (mcffi:def-foreign-function doc-file ("vkEnumerateInstanceLayerProperties" create-enumerate-instance-layer-properties funcall-enumerate-instance-layer-properties) ()
    (declare-types :return ((list "VkLayerProperties") layer-props))
    (cffi:with-foreign-object (pPropertyCount :uint32)
      (vkEnumerateInstanceLayerProperties pPropertyCount (cffi:null-pointer))
      (let* ((property-count (cffi:mem-ref pPropertyCount :uint32))
	     (pProperties (cffi:foreign-alloc '(:struct VkLayerProperties) :count property-count)))
	(vkEnumerateInstanceLayerProperties pPropertyCount pProperties)
	(iter (for i from 0 below property-count)
	  (collect (cffi:mem-aptr pProperties '(:struct VkLayerProperties) i))))))

  (mcffi:def-lisp-function doc-file destroy-enumerate-instance-layer-properties (layer-props)
    (declare-types ((list "VkLayerProperties") layer-props))
    (cffi:foreign-free (car layer-props)))


  (mcffi:defwith doc-file with-enumerate-instance-layer-properties 
    create-enumerate-instance-layer-properties
    destroy-enumerate-instance-layer-properties)


  (more-cffi:def-foreign-function doc-file ("vkCreateDebugUtilsMessengerEXT" create-debug-utils-messenger-ext funcall-create-debug-utils-messenger-ext) (instance pcreateinfo pallocator)
    (declare-types ("VkInstance" instance) ("VkDebugUtilsMessengerCreateInfoEXT" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkDebugUtilsMessengerEXT" "pMessenger") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pDebugMessenger 'VkDebugUtilsMessengerEXT)
	(let ((result (vkCreateDebugUtilsMessengerEXT instance pCreateInfo pAllocator-c pDebugMessenger)))
	  (values (cffi:mem-ref pDebugMessenger 'VkDebugUtilsMessengerEXT) result instance pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyDebugUtilsMessengerEXT" destroy-debug-utils-messenger-ext funcall-destroy-debug-utils-messenger-ext) (instance messenger pallocator)
    (declare-types ("VkInstance" instance) ("VkDebugUtilsMessengerEXT" messenger) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyDebugUtilsMessengerEXT instance messenger pAllocator-c)))


  (mcffi:defwith doc-file with-debug-utils-messenger-ext
    create-debug-utils-messenger-ext
    destroy-debug-utils-messenger-ext
    :destructor-arguments (2 0 3))
  
  
  (more-cffi:def-foreign-function doc-file ("vkEnumeratePhysicalDevices" enumerate-physical-devices funcall-enumerate-physical-devices) (instance)
    (declare-types ("VkInstance" instance)
		   :return ((list "VkPhysicalDevice") "pPhysicalDevices") ("VkResult" result))
    (cffi:with-foreign-object (pPhysicalDeviceCount :uint32)
      (vkEnumeratePhysicalDevices instance pPhysicalDeviceCount (cffi:null-pointer))
      (let ((physical-device-count (cffi:mem-ref pPhysicalDeviceCount :uint32)))
	(cffi:with-foreign-object (pPhysicalDevices 'VKPhysicalDevice physical-device-count) 
	  (vkEnumeratePhysicalDevices instance pPhysicalDeviceCount pPhysicalDevices)
	  (loop for i from 0 below physical-device-count
		collect (cffi:mem-aref pPhysicalDevices 'VKPhysicalDevice i))))))


  (more-cffi:def-foreign-function doc-file ("vkGetPhysicalDeviceProperties" create-get-physical-device-properties funcall-get-physical-device-properties) (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
		   :return ("VkPhysicalDeviceProperties" "pProperties"))
    (let ((pProperties (cffi:foreign-alloc '(:struct VkPhysicalDeviceProperties))))
      (vkGetPhysicalDeviceProperties physicalDevice pProperties)
      (values pProperties)))

  (mcffi:def-lisp-function doc-file destroy-get-physical-device-properties (pProperties)
    (declare-types ("VkPhysicalDeviceProperties" "pProperties"))
    (cffi:foreign-free pProperties))

  
  (mcffi:defwith doc-file with-get-physical-device-properties 
    create-get-physical-device-properties
    destroy-get-physical-device-properties)


  (more-cffi:def-foreign-function doc-file ("vkGetPhysicalDeviceFeatures" create-get-physical-device-features funcall-get-physical-device-features) (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return ("VkPhysicalDeviceFeatures" pFeatures))
    (let ((pFeatures (cffi:foreign-alloc '(:struct VkPhysicalDeviceFeatures))))
      (vkGetPhysicalDeviceFeatures physicalDevice pFeatures)
      (values pFeatures)))

  (mcffi:def-lisp-function doc-file destroy-get-physical-device-features (pFeatures)
    (declare-types ("VkPhysicalDeviceFeatures" "pFeatures"))
    (cffi:foreign-free pFeatures))

  
  (mcffi:defwith doc-file with-get-physical-device-features 
    create-get-physical-device-features
    destroy-get-physical-device-features)


  (more-cffi:def-foreign-function doc-file ("vkGetPhysicalDeviceQueueFamilyProperties" create-get-physical-device-queue-family-properties funcall-get-physical-device-queue-family-properties) (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice") :return ((list "VkQueueFamilyProperties") "pQueueFamilyProperties"))
    (cffi:with-foreign-object (pQueueFamilyPropertyCount :uint32)
      (vkGetPhysicalDeviceQueueFamilyProperties physicalDevice pQueueFamilyPropertyCount (cffi:null-pointer))
      (let* ((queue-family-property-count (cffi:mem-ref pQueueFamilyPropertyCount :uint32))
	     (pQueueFamilyProperties (cffi:foreign-alloc '(:struct VKQueueFamilyProperties)
							 :count queue-family-property-count))) 
	(vkGetPhysicalDeviceQueueFamilyProperties physicalDevice pQueueFamilyPropertyCount pQueueFamilyProperties)
	(loop for i from 0 below queue-family-property-count
              collect (cffi:mem-aptr pQueueFamilyProperties '(:struct VKQueueFamilyProperties) i)))))

  (mcffi:def-lisp-function doc-file destroy-get-physical-device-queue-family-properties (pQueueFamilyProperties)
    (declare-types ((list "VkQueueFamilyProperties") pQueueFamilyProperties))
    (cffi:foreign-free (car pQueueFamilyProperties)))

  
  (mcffi:defwith doc-file with-get-physical-device-queue-family-properties 
    create-get-physical-device-queue-family-properties
    destroy-get-physical-device-queue-family-properties)


  (more-cffi:def-foreign-function doc-file ("vkGetPhysicalDeviceSurfaceSupportKHR" get-physical-device-surface-support-khr funcall-get-physical-device-surface-support-khr) (physicaldevice queuefamilyindex surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (uint32 "queueFamilyIndex") ("VkSurfaceKHR" surface)
		   :return (boolean "pSupported") ("VkResult" result))
    (cffi:with-foreign-object (pSupported 'VkBool32)
      (let ((result (vkGetPhysicalDeviceSurfaceSupportKHR physicalDevice queueFamilyIndex surface pSupported))
	    (supportedp (cffi:mem-ref pSupported 'VkBool32)))
	(values (equal supportedp VK_TRUE) result))))


  (more-cffi:def-foreign-function doc-file ("vkEnumerateDeviceExtensionProperties" create-enumerate-device-extension-properties funcall-enumerate-device-extension-properties) (physicaldevice playername)
    (declare-types ("VkPhysicalDevice" "physicalDevice") (string "pLayerName")
		   :return ((list "VkExtensionProperties") "pProperties") ("VkResult" result))
    (let ((pLayerName-c (or pLayerName (cffi:null-pointer))))
      (cffi:with-foreign-object (pPropertyCount :uint32)
	(vkEnumerateDeviceExtensionProperties physicalDevice pLayerName-c pPropertyCount (cffi:null-pointer))
	(let* ((property-count (cffi:mem-ref pPropertyCount :uint32))
	       (pProperties (cffi:foreign-alloc '(:struct VkExtensionProperties) :count property-count)))
	  (let ((result (vkEnumerateDeviceExtensionProperties physicalDevice pLayerName-c pPropertyCount pProperties))
		(properties (iter (for i from 0 below property-count)
			      (collect (cffi:mem-aptr pProperties '(:struct VkExtensionProperties) i)))))
	    (values properties result))))))

  (mcffi:def-lisp-function doc-file destroy-enumerate-device-extension-properties (pProperties)
    (declare-types ((list "VkExtensionProperties") "pProperties"))
    (cffi:foreign-free (car pProperties)))

  
  (mcffi:defwith doc-file with-enumerate-device-extension-properties
    create-enumerate-device-extension-properties
    destroy-enumerate-device-extension-properties)


  (more-cffi:def-foreign-function doc-file ("vkGetPhysicalDeviceSurfaceCapabilitiesKHR" create-get-physical-device-surface-capabilities-khr funcall-get-physical-device-surface-capabilities-khr) (physicaldevice surface)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkSurfaceKHR" surface)
		   :return ("VkSurfaceCapabilitiesKHR" "pSurfaceCapabilities") ("VkResult" result))
    (let* ((pSurfaceCapabilities (cffi:foreign-alloc '(:struct VkSurfaceCapabilitiesKHR)))
	   (result (vkGetPhysicalDeviceSurfaceCapabilitiesKHR physicalDevice surface pSurfaceCapabilities)))
      (values pSurfaceCapabilities result)))

  (mcffi:def-lisp-function doc-file destroy-get-physical-device-surface-capabilities-khr (pSurfaceCapabilities)
    (declare-types ("VkSurfaceCapabilitiesKHR" "pSurfaceCapabilities"))
    (cffi:foreign-free pSurfaceCapabilities))

  
  (mcffi:defwith doc-file with-get-physical-device-surface-capabilities-khr
    create-get-physical-device-surface-capabilities
    destroy-get-physical-device-surface-capabilities)


  (more-cffi:def-foreign-function doc-file ("vkGetPhysicalDeviceSurfaceFormatsKHR" create-get-physical-device-surface-formats-khr funcall-get-physical-device-surface-formats-khr) (physicaldevice surface)
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

  (mcffi:def-lisp-function doc-file destroy-get-physical-device-surface-formats-khr (pSurfaceFormats)
    (declare-types ((list "VkSurfaceFormatKHR") "pSurfaceFormats"))
    (cffi:foreign-free (car pSurfaceFormats)))

  
  (mcffi:defwith doc-file with-get-physical-device-surface-formats-khr 
    create-get-physical-device-surface-formats
    destroy-get-physical-device-surface-formats)


  (more-cffi:def-foreign-function doc-file ("vkGetPhysicalDeviceSurfacePresentModesKHR" get-physical-device-surface-present-modes-khr funcall-get-physical-device-surface-present-modes-khr) (physicaldevice surface)
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


  (more-cffi:def-foreign-function doc-file ("vkCreateDevice" create-device funcall-create-device) (physicaldevice pcreateinfo pallocator)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkDeviceCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkDevice" "pDevice") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pDevice 'VkDevice)
	(let ((result (vkCreateDevice physicalDevice pCreateInfo pAllocator-c pDevice)))
	  (values (cffi:mem-ref pDevice 'VkDevice) result (if pAllocator pAllocator-c nil))))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyDevice" destroy-device funcall-destroy-device) (device pallocator)
    (declare-types ("VkDevice" device) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyDevice device pAllocator-c)))


  (mcffi:defwith doc-file with-device
    create-device
    destroy-device
    :destructor-arguments (0 2))


  (more-cffi:def-foreign-function doc-file ("vkGetDeviceQueue" get-device-queue funcall-get-device-queue) (device queuefamilyindex queueindex)
    (declare-types ("VkDevice" device) (uint32 "queueFamilyIndex") (uint32 "queueIndex")
		   :return ("VkQueue" "pQueue"))
    (cffi:with-foreign-object (pQueue 'VkQueue)
      (vkGetDeviceQueue device queueFamilyIndex queueIndex pQueue)
      (cffi:mem-ref pQueue 'VkQueue)))


  (more-cffi:def-foreign-function doc-file ("vkDestroySurfaceKHR" destroy-surface-khr funcall-destroy-surface-khr) (instance surface pallocator)
    (declare-types ("VkInstance" instance) ("VkSurfaceKHR" surface) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroySurfaceKHR instance surface pAllocator-c)))


  (more-cffi:def-foreign-function doc-file ("vkCreateShaderModule" create-shader-module funcall-create-shader-module) (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkShaderModuleCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator") :return ("VkShaderModule" "pShaderModule") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pShaderModule 'VkShaderModule)
	(let ((result (vkCreateShaderModule device pCreateInfo pAllocator-c pShaderModule)))
	  (values (cffi:mem-ref pShaderModule 'VkShaderModule) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyShaderModule" destroy-shader-module funcall-destroy-shader-module) (device shadermodule pallocator)
    (declare-types ("VkDevice" device) ("VkShaderModule" "shaderModule") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyShaderModule device shaderModule pAllocator-c)))


  (mcffi:defwith doc-file with-shader-module 
    create-shader-module
    destroy-shader-module
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file ("vkCreateImageView" create-image-view funcall-create-image-view) (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkImageViewCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkImageView" "pView") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pView 'VkImageView)
	(let ((result (vkCreateImageView device pCreateInfo pAllocator-c pView)))
	  (values (cffi:mem-ref pView 'VkImageView) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyImageView" destroy-image-view funcall-destroy-image-view) (device imageview pallocator)
    (declare-types ("VkDevice" device) ("VkImageView" "imageView") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyImageView device imageView pAllocator-c)))


  (mcffi:defwith doc-file with-image-view
    create-image-view
    destroy-image-view
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file ("vkCreateSwapchainKHR" create-swapchain-khr funcall-create-swapchain-khr) (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkSwapchainCreateInfoKHR" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkSwapchainKHR" "pSwapchain") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pSwapchain 'VkSwapchainKHR)
	(let ((result (vkCreateSwapchainKHR device pCreateInfo pAllocator-c pSwapchain)))
	  (values (cffi:mem-ref pSwapchain 'VkSwapchainKHR) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroySwapchainKHR" destroy-swapchain-khr funcall-destroy-swapchain-khr) (device swapchain pallocator)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroySwapchainKHR device swapchain pAllocator-c)))


  (mcffi:defwith doc-file with-swapchain 
    create-swapchain
    destroy-swapchain
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file ("vkGetSwapchainImagesKHR" get-swapchain-images-khr funcall-get-swapchain-images-khr) (device swapchain)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain)
		   :return ("VkImage" "pSwapchainImages") ("VkResult" result))
    (cffi:with-foreign-object (pSwapchainImageCount :uint32)
      (vkGetSwapchainImagesKHR device swapchain pSwapchainImageCount (cffi:null-pointer))
      (let* ((swapchain-image-count (cffi:mem-ref pSwapchainImageCount :uint32)))
	(cffi:with-foreign-object (pSwapchainImages 'VkImage swapchain-image-count)
	  (let ((result (vkGetSwapchainImagesKHR device swapchain pSwapchainImageCount pSwapchainImages))
		(swapchain-images (iter (for i from 0 below swapchain-image-count)
				    (collect (cffi:mem-aref pSwapchainImages 'VkImage i)))))
	    (values swapchain-images result))))))


  (more-cffi:def-foreign-function doc-file ("vkCreateRenderPass" create-render-pass funcall-create-render-pass) (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkRenderPassCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator") 
		   :return ("VkRenderPass" "pRenderPass") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pRenderPass 'VkRenderPass)
	(let ((result (vkCreateRenderPass device pCreateInfo pAllocator-c pRenderPass)))
	  (values (cffi:mem-ref pRenderPass 'VkRenderPass) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyRenderPass" destroy-render-pass funcall-destroy-render-pass) (device renderpass pallocator)
    (declare-types ("VkDevice" device) ("VkRenderPass" "renderPass") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyRenderPass device renderPass pAllocator-c)))


  (mcffi:defwith doc-file with-render-pass 
    create-render-pass
    destroy-render-pass
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file ("vkCreatePipelineLayout" create-pipeline-layout funcall-create-pipeline-layout) (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkPipelineLayoutCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkPipelineLayout" "pPipelineLayout") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pPipelineLayout 'VkPipelineLayout)
	(let ((result (vkCreatePipelineLayout device pCreateInfo pAllocator-c pPipelineLayout)))
	  (values (cffi:mem-ref pPipelineLayout 'VkPipelineLayout) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyPipelineLayout" destroy-pipeline-layout funcall-destroy-pipeline-layout) (device pipelinelayout pallocator)
    (declare-types ("VkDevice" device) ("VkPipelineLayout" "pipelineLayout") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyPipelineLayout device pipelineLayout pAllocator-c)))


  (mcffi:defwith doc-file with-pipeline-layout 
    create-pipeline-layout
    destroy-pipeline-layout
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file ("vkCreateGraphicsPipelines" create-graphics-pipelines funcall-create-graphics-pipelines) (device pipelinecache pcreateinfos pallocator)
    (declare-types ("VkDevice" device) ("VkPipelineCache" "pipelineCache") ("VkGraphicsPipelineCreateInfo" "pCreateInfos") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkPipeline" "pPipelines") ("VkResult" result))
    (let ((pipelineCache-c (or pipelineCache (cffi:null-pointer)))
	  (pAllocator-c (or pAllocator (cffi:null-pointer)))
	  (pCreateInfos-c (cffi:foreign-alloc '(:struct VkGraphicsPipelineCreateInfo) :initial-contents
					      (iter (for create-info in pCreateInfos)
						(collect (cffi:mem-ref create-info '(:struct VkGraphicsPipelineCreateInfo))))))
	  (createInfoCount (length pCreateInfos)))
      (cffi:with-foreign-object (pPipelines 'VkPipeline createInfoCount)
	(let ((result (vkCreateGraphicsPipelines device pipelineCache-c createInfoCount pCreateInfos-c pAllocator-c pPipelines)))
	  (values (iter (for i from 0 below createInfoCount)
		    (collect (cffi:mem-aref pPipelines 'VkPipeline i)))
		  result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyPipeline" destroy-pipeline funcall-destroy-pipeline) (device pipeline pallocator)
    (declare-types ("VkDevice" device) ("VkPipeline" pipeline) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyPipeline device pipeline pAllocator-c)))

  
  (defun destroy-graphics-pipelines (device pipelines pAllocator)
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (iter (for pipeline in pipelines)
	(vkDestroyPipeline device pipeline pALlocator-c))))

  (mcffi:defwith doc-file with-graphics-pipelines
    create-graphics-pipelines
    destroy-graphics-pipelines
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file ("vkCreateFramebuffer" create-framebuffer funcall-create-framebuffer) (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkFramebufferCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkFramebuffer" "pFramebuffer") ("VkResult" result))
    (let* ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pFramebuffer 'VkFramebuffer)
	(let ((result (vkcreateframebuffer device pcreateinfo pallocator-c pframebuffer)))
	  (values (cffi:mem-ref pFramebuffer 'VkFramebuffer) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyFramebuffer" destroy-framebuffer funcall-destroy-framebuffer) (device framebuffer pallocator)
    (declare-types ("VkDevice" device) ("VkFramebuffer" framebuffer) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkdestroyframebuffer device framebuffer pallocator-c)))


  (mcffi:defwith doc-file with-framebuffer
    create-framebuffer
    destroy-framebuffer
    :destructor-arguments (2 0 3))

  (mcffi:doc-note doc-file "The allocator is passed to both the constructor and destructor.")


  (more-cffi:def-foreign-function doc-file ("vkCreateCommandPool" create-command-pool funcall-create-command-pool) (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkCommandPoolCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkCommandPool" "pCommandPool") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pCommandPool 'VkCommandPool)
	(let ((result (vkcreatecommandpool device pcreateinfo pAllocator-c pCommandPool)))
	  (values (cffi:mem-ref pCommandPool 'VkCommandPool) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyCommandPool" destroy-command-pool funcall-destroy-command-pool) (device commandpool pallocator)
    (declare-types ("VkDevice" device) ("VkCommandPool" "commandPool") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkdestroycommandpool device commandpool pallocator-c)))


  (mcffi:defwith doc-file with-command-pool
    create-command-pool
    destroy-command-pool
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file ("vkAllocateCommandBuffers" allocate-command-buffers funcall-allocate-command-buffers) (device pallocateinfo)
    (declare-types ("VkDevice" device) ("VkCommandBufferAllocateInfo" "pAllocateInfo")
		   :return ((list "VkCommandBuffer") "pCommandBuffers") ("VkResult" result))
    (let ((command-buffers-count (command-buffer-allocate-info-commandBufferCount pAllocateInfo)))
      (cffi:with-foreign-object (pCommandBuffers 'VkCommandBuffer command-buffers-count)
	(let ((result (vkallocatecommandbuffers device pallocateinfo pCommandBuffers)))
	  (values (iter (for i from 0 below command-buffers-count)
		    (collect (cffi:mem-aref pCommandBuffers 'VkCommandBuffer i)))
		  result
		  device
		  (command-buffer-allocate-info-commandPool pAllocateInfo))))))


  (more-cffi:def-foreign-function doc-file ("vkFreeCommandBuffers" free-command-buffers funcall-free-command-buffers) (device commandpool pcommandbuffers)
    (declare-types ("VkDevice" device) ("VkCommandPool" "commandPool") ((list "VkCommandBuffer") "pCommandBuffers"))
    (let ((commandBufferCount (length pCommandBuffers))
	  (pCommandBuffers-c (cffi:foreign-alloc 'VkCommandBuffer :initial-contents pCommandBuffers)))
      (vkfreecommandbuffers device commandpool commandBufferCount pCommandBuffers-c)
      (cffi:foreign-free pCommandBuffers-c)))


  (mcffi:defwith doc-file with-command-buffers
    allocate-command-buffers
    free-command-buffers
    :destructor-arguments (2 3 0))


  (more-cffi:def-foreign-function doc-file ("vkBeginCommandBuffer" begin-command-buffer funcall-begin-command-buffer) (commandbuffer pbegininfo)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkCommandBufferBeginInfo" "pBeginInfo")
		   :return ("VkResult" result))
    (vkbegincommandbuffer commandbuffer pbegininfo))


  (more-cffi:def-foreign-function doc-file ("vkEndCommandBuffer" end-command-buffer funcall-end-command-buffer) (commandbuffer)
    (declare-types ("VkCommandBuffer" "commandBuffer")
		   :return ("VkResult" return-value))
    (vkendcommandbuffer commandbuffer))


  (more-cffi:def-foreign-function doc-file ("vkResetCommandBuffer" reset-command-buffer funcall-reset-command-buffer) (commandbuffer flags)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkCommandBufferResetFlags" flags)
		   :return ("VkResult" result))
    (vkresetcommandbuffer commandbuffer flags))


  (more-cffi:def-foreign-function doc-file ("vkCmdBeginRenderPass" cmd-begin-render-pass funcall-cmd-begin-render-pass) (commandbuffer prenderpassbegin contents)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkRenderPassBeginInfo" "pRenderPassBegin") ("VkSubpassContents" contents))
    (vkcmdbeginrenderpass commandbuffer prenderpassbegin contents))


  (more-cffi:def-foreign-function doc-file ("vkCmdEndRenderPass" cmd-end-render-pass funcall-cmd-end-render-pass) (commandbuffer)
    (declare-types ("VkCommandBuffer" "commandBuffer"))
    (vkcmdendrenderpass commandbuffer))


  (more-cffi:def-foreign-function doc-file ("vkCmdBindPipeline" cmd-bind-pipeline funcall-cmd-bind-pipeline) (commandbuffer pipelinebindpoint pipeline)
    (declare-types ("VkCommandBuffer" "commandBuffer") ("VkPipelineBindPoint" "pipelineBindPoint") ("VkPipeline" pipeline))
    (vkcmdbindpipeline commandbuffer pipelinebindpoint pipeline))


  (more-cffi:def-foreign-function doc-file ("vkCmdSetViewport" cmd-set-viewport funcall-cmd-set-viewport) (commandbuffer firstviewport viewportcount pviewports)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstViewport") (uint32 "viewportCount") ((list "VkViewport") "pViewports"))
    (let ((pViewports-c (cffi:foreign-alloc '(:struct VkViewport)
					    :initial-contents
					    (iter (for viewport in (subseq pViewports firstViewport (+ firstViewport viewportCount)))
										      (collect (cffi:mem-ref viewport '(:struct VkViewport)))))))
      (vkcmdsetviewport commandbuffer firstviewport viewportcount pviewports-c)
      (cffi:foreign-free pViewports-c)))


  (more-cffi:def-foreign-function doc-file ("vkCmdSetScissor" cmd-set-scissor funcall-cmd-set-scissor) (commandbuffer firstscissor scissorcount pscissors)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstScissor") (uint32 "scissorCount") ("VkRect2D" "pScissors"))
  (let ((pScissors-c (cffi:foreign-alloc '(:struct VkRect2D)
					    :initial-contents
					    (iter (for scissor in (subseq pScissors firstScissor (+ firstScissor scissorCount)))
										      (collect (cffi:mem-ref scissor '(:struct VkRect2D)))))))
      (vkcmdsetscissor commandbuffer firstscissor scissorcount pscissors-c)
    (cffi:foreign-free pScissors-c)))


  (more-cffi:def-foreign-function doc-file ("vkCmdDraw" cmd-draw funcall-cmd-draw) (commandbuffer vertexcount instancecount firstvertex firstinstance)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "vertexCount") (uint32 "instanceCount") (uint32 "firstVertex") (uint32 "firstInstance"))
    (vkcmddraw commandbuffer vertexcount instancecount firstvertex firstinstance))


  (more-cffi:def-foreign-function doc-file ("vkCmdBindVertexBuffers" cmd-bind-vertex-buffers funcall-cmd-bind-vertex-buffers) (commandbuffer firstbinding pbuffers poffsets)
    (declare-types ("VkCommandBuffer" "commandBuffer") (uint32 "firstBinding") ((list "VkBuffer") "pBuffers") ((list "VkDeviceSize") "pOffsets"))
    (let ((bindingCount (min (length pBuffers) (length pOffsets)))
	  (pBuffers-c (cffi:foreign-alloc 'VkBuffer :initial-contents (mapcar (lambda (buffer) (if buffer buffer VK_NULL_HANDLE)) pBuffers)))
	  (pOffsets-c (cffi:foreign-alloc 'VkDeviceSize :initial-contents pOffsets)))
      (vkcmdbindvertexbuffers commandbuffer firstbinding bindingcount pbuffers-c poffsets-c)
      (cffi:foreign-free pBuffers-c)
      (cffi:foreign-free pOffsets-c)))
  

  (more-cffi:def-foreign-function doc-file ("vkCreateSemaphore" create-semaphore funcall-create-semaphore) (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkSemaphoreCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkSemaphore" "pSemaphore") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pSemaphore 'VkSemaphore)
	(let ((result (vkcreatesemaphore device pcreateinfo pallocator-c pSemaphore)))
	  (values (cffi:mem-ref pSemaphore 'VkSemaphore) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroySemaphore" destroy-semaphore funcall-destroy-semaphore) (device semaphore pallocator)
    (declare-types ("VkDevice" device) ("VkSemaphore" semaphore) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkdestroysemaphore device semaphore pallocator-c)))


  (mcffi:defwith doc-file with-semaphore
    create-semaphore
    destroy-semaphore
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file ("vkCreateFence" create-fence funcall-create-fence) (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkFenceCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkFence" "pFence") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pFence 'VkFence)
	(let ((result (vkcreatefence device pcreateinfo pallocator-c pfence)))
	  (values (cffi:mem-ref pFence 'VkFence) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyFence" destroy-fence funcall-destroy-fence) (device fence pallocator)
    (declare-types ("VkDevice" device) ("VkFence" fence) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkdestroyfence device fence pallocator-c)))


  (mcffi:defwith doc-file with-fence
    create-fence
    destroy-fence
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file ("vkWaitForFences" wait-for-fences funcall-wait-for-fences) (device pfences waitall timeout)
    (declare-types ("VkDevice" device) ((list "VkFence") "pFences") ("VkBool32" "waitAll") (uint64 timeout)
		   :return ("VkResult" result))
    (let ((fenceCount (length pFences))
	  (pFences-c (cffi:foreign-alloc 'VkFence :initial-contents pFences)))
      (let ((result (vkwaitforfences device fenceCount pFences-c waitall timeout)))
	(cffi:foreign-free pFences-c)
	(values result))))


  (more-cffi:def-foreign-function doc-file ("vkResetFences" reset-fences funcall-reset-fences) (device pfences)
    (declare-types ("VkDevice" device) ((list "VkFence") "pFences")
		   :return ("VkResult" result))
    (let ((fenceCount (length pFences))
	  (pFences-c (cffi:foreign-alloc 'VkFence :initial-contents pFences)))
      (let ((result (vkresetfences device fencecount pfences-c)))
	(cffi:foreign-free pFences-c)
	(values result))))


  (more-cffi:def-foreign-function doc-file ("vkAcquireNextImageKHR" acquire-next-image-khr funcall-acquire-next-image-khr) (device swapchain timeout semaphore fence)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain) (uint64 timeout) ("VkSemaphore" semaphore) ("VkFence" fence) :return (uint32 "pImageIndex") ("VkResult" return-value))
    (cffi:with-foreign-object (pImageIndex :uint32)
      (let ((result (vkacquirenextimagekhr device swapchain timeout semaphore fence pImageIndex)))
	(values (cffi:mem-ref pImageIndex :uint32) result))))


  (more-cffi:def-foreign-function doc-file ("vkQueueSubmit" queue-submit funcall-queue-submit) (queue psubmits fence)
    (declare-types ("VkQueue" queue) ("VkSubmitInfo" "pSubmits") ("VkFence" fence)
		   :return ("VkResult" result))
    (let ((submitCount (length pSubmits))
	  (pSubmits-c (cffi:foreign-alloc '(:struct VkSubmitInfo) :initial-contents (iter (for submit in pSubmits)
										      (collect (cffi:mem-ref submit '(:struct VkSubmitInfo)))))))
      (let ((result (vkqueuesubmit queue submitCount pSubmits-c fence)))
	(cffi:foreign-free pSubmits-c)
	(values result))))


  (more-cffi:def-foreign-function doc-file ("vkQueuePresentKHR" queue-present-khr funcall-queue-present-khr) (queue ppresentinfo)
    (declare-types ("VkQueue" queue) ("VkPresentInfoKHR" "pPresentInfo")
		   :return ("VkResult" result))
    (vkqueuepresentkhr queue ppresentinfo))


  (more-cffi:def-foreign-function doc-file ("vkCreateBuffer" create-buffer funcall-create-buffer) (device pcreateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkBufferCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkBuffer" "pBuffer") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pBuffer 'VkBuffer)
	(let ((result (vkcreatebuffer device pcreateinfo pallocator-c pbuffer)))
	  (values (cffi:mem-ref pBuffer 'VkBuffer) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkDestroyBuffer" destroy-buffer funcall-destroy-buffer) (device buffer pallocator)
    (declare-types ("VkDevice" device) ("VkBuffer" buffer) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkdestroybuffer device buffer pallocator-c)))


  (mcffi:defwith doc-file with-buffer
    create-buffer
    destroy-buffer
    :destructor-arguments (2 0 3))


  (more-cffi:def-foreign-function doc-file ("vkGetBufferMemoryRequirements" create-get-buffer-memory-requirements funcall-get-buffer-memory-requirements) (device buffer)
    (declare-types ("VkDevice" device) ("VkBuffer" buffer)
		   :return ("VkMemoryRequirements" "pMemoryRequirements"))
    (let ((pMemoryRequirements (cffi:foreign-alloc '(:struct VkMemoryRequirements))))
      (vkgetbuffermemoryrequirements device buffer pmemoryrequirements)
      (values pMemoryRequirements)))

  (more-cffi:def-lisp-function doc-file destroy-get-buffer-memory-requirements (pMemoryRequirements)
    (declare-types ("VkMemoryRequirements" "pMemoryRequirements"))
    (cffi:foreign-free pMemoryRequirements))

  (mcffi:defwith doc-file with-get-buffer-memory-requirements
    create-get-buffer-memory-requirements
    destroy-get-buffer-memory-requirements)


  (more-cffi:def-foreign-function doc-file ("vkGetPhysicalDeviceMemoryProperties" create-get-physical-device-memory-properties funcall-get-physical-device-memory-properties) (physicaldevice)
    (declare-types ("VkPhysicalDevice" "physicalDevice")
		   :return ("VkPhysicalDeviceMemoryProperties" "pMemoryProperties"))
    (let ((pMemoryProperties (cffi:foreign-alloc '(:struct VkPhysicalDeviceMemoryProperties))))
      (vkgetphysicaldevicememoryproperties physicaldevice pmemoryproperties)
      (values pMemoryProperties)))

  (mcffi:def-lisp-function doc-file destroy-get-physical-device-memory-properties (pMemoryProperties)
    (declare-types ("VkPhysicalDeviceMemoryProperties" "pMemoryProperties"))
    (cffi:foreign-free pMemoryProperties))

  (mcffi:defwith doc-file with-get-physical-device-memory-properties
    create-get-physical-device-memory-properties
    destroy-get-physical-device-memory-properties)


  (more-cffi:def-foreign-function doc-file ("vkAllocateMemory" allocate-memory funcall-allocate-memory) (device pallocateinfo pallocator)
    (declare-types ("VkDevice" device) ("VkMemoryAllocateInfo" "pAllocateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkDeviceMemory" "pMemory") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pMemory 'VkDeviceMemory)
	(let ((result (vkallocatememory device pallocateinfo pallocator-c pmemory)))
	  (values (cffi:mem-ref pMemory 'VkDeviceMemory) result device pAllocator)))))


  (more-cffi:def-foreign-function doc-file ("vkFreeMemory" free-memory funcall-free-memory) (device memory pallocator)
    (declare-types ("VkDevice" device) ("VkDeviceMemory" memory) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkfreememory device memory pallocator-c)))


  (mcffi:defwith doc-file with-allocated-memory
    allocate-memory
    free-memory)


  (more-cffi:def-foreign-function doc-file ("vkBindBufferMemory" bind-buffer-memory funcall-bind-buffer-memory) (device buffer memory memoryoffset)
    (declare-types ("VkDevice" device) ("VkBuffer" buffer) ("VkDeviceMemory" memory) ("VkDeviceSize" "memoryOffset")
		   :return ("VkResult" result))
    (vkbindbuffermemory device buffer memory memoryoffset))


  (more-cffi:def-foreign-function doc-file ("vkMapMemory" map-memory funcall-map-memory) (device memory offset size flags)
    (declare-types ("VkDevice" device) ("VkDeviceMemory" memory) ("VkDeviceSize" offset) ("VkDeviceSize" size) ("VkMemoryMapFlags" flags)
		   :return ("Data pointer" "ppData") ("VkResult" result))
    (cffi:with-foreign-object (ppData :pointer)
      (let ((result (vkmapmemory device memory offset size flags ppdata)))
	(values (cffi:mem-ref ppData :pointer) result device memory))))


  (more-cffi:def-foreign-function doc-file ("vkUnmapMemory" unmap-memory funcall-unmap-memory) (device memory)
    (declare-types ("VkDevice" device) ("VkDeviceMemory" memory))
    (vkunmapmemory device memory))


  (mcffi:defwith doc-file with-mapped-memory
    map-memory
    unmap-memory
    :destructor-arguments (2 3)))
