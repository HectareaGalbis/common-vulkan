
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/swapchain.md"))


  (mcffi:doc-header "Swapchain" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)


  (mcffi:def-foreign-struct "VkSwapchainCreateInfoKHR" swapchain-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR)
    (pNext :name "pNext" :type pointer :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkSwapchainCreateFlagsKHR")
    (surface :type "VkSurfaceKHR")
    (minImageCount :name "minImageCount" :type uint32)
    (imageFormat :name "imageFormat" :type "VkFormat")
    (imageColorSpace :name "imageColorSpace" :type "VkColorSpaceKHR")
    (imageExtent :pointer t :name "imageExtent" :type "VkExtent2D" :init-form nil
		 :create ((imageExtent-arg)
			  (setf (extent-2d-width imageExtent) (if imageExtent-arg
								  (extent-2d-width imageExtent-arg)
								  0))
			  (setf (extent-2d-height imageExtent) (if imageExtent-arg
								   (extent-2d-height imageExtent-arg)
								   0)))
		 :set ((new-value)
		       (setf (extent-2d-width imageExtent) (extent-2d-width new-value))
		       (setf (extent-2d-height imageExtent) (extent-2d-height new-value))))
    (imageArrayLayers :name "imageArrayLayers" :type uint32)
    (imageUsage :name "imageUsage" :type "VkImageUsageFlags")
    (imageSharingMode :name "imageSharingMode" :type "VkSharingMode")
    (queueFamilyIndexCount :name "queueFamilyIndexCount" :type uint32)
    (pQueueFamilyIndices :name "pQueueFamilyIndices" :type (list uint32) :init-form nil
			 :create ((pQueueFamilyIndices-arg)
				  (if pQueueFamilyIndices-arg
				      (setf pQueueFamilyIndices (cffi:foreign-alloc :uint32 :initial-contents pQueueFamilyIndices-arg))
				      (setf pQueueFamilyIndices (cffi:null-pointer))))
			 :destroy (cffi:foreign-free pQueueFamilyIndices)
			 :get ((&optional (index nil))
			       (if index
				   (cffi:mem-aref pQueueFamilyIndices :uint32 index)
				   (iter (for i from 0 below queueFamilyIndexCount)
				     (collect (cffi:mem-aref pQueueFamilyIndices :uint32 i)))))
			 :set ((new-value &optional (index nil))
			       (if index
				   (setf (cffi:mem-aref pQueueFamilyIndices :uint32 index) new-value)
				   (progn
				     (cffi:foreign-free pQueueFamilyIndices)
				     (setf pQueueFamilyIndices (cffi:foreign-alloc :uint32 :initial-contents new-value))))))
    (preTransform :name "preTransform" :type "VkSurfaceTransformFlagBitsKHR")
    (compositeAlpha :name "compositeAlpha" :type "VkCompositeAlphaFlagBitsKHR")
    (presentMode :name "presentMode" :type "VkPresentModeKHR")
    (clipped :type "VkBool32")
    (oldSwapchain :name "oldSwapchain" :type "VkSwapchainKHR" :init-form nil
		  :create ((oldSwapchain-arg)
			   (setf oldSwapchain (or oldSwapchain-arg (cffi:null-pointer))))
		  :get (() (if (cffi:null-pointer-p oldSwapchain)
			       nil
			       oldSwapchain))
		  :set ((new-value)
			(setf oldSwapchain (or new-value (cffi:null-pointer))))))



  (mcffi:doc-subheader "Functions" doc-file)


  (mcffi:doc-subsubheader "vkCreateSwapchainKHR" doc-file)

  (mcffi:def-foreign-function create-swapchain doc-file (device pCreateInfo pAllocator)
    (declare-types ("VkDevice" device) ("VkSwapchainCreateInfoKHR" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkSwapchainKHR" "pSwapchain") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pSwapchain 'VkSwapchainKHR)
	(let ((result (vkCreateSwapchainKHR device pCreateInfo pAllocator-c pSwapchain)))
	  (values (cffi:mem-ref pSwapchain 'VkSwapchainKHR) result device pAllocator)))))



  (mcffi:doc-subsubheader "vkDestroySwapchainKHR" doc-file)

  (mcffi:def-foreign-function destroy-swapchain doc-file (device swapchain pAllocator)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroySwapchainKHR device swapchain pAllocator-c)))



  (mcffi:doc-subsubheader "with-swapchain" doc-file)

  (mcffi:defwith with-swapchain doc-file
    create-swapchain
    destroy-swapchain
    :destructor-arguments (2 0 3))

  

  (mcffi:doc-subsubheader "vkGetSwapchainImagesKHR" doc-file)

  (mcffi:def-foreign-function get-swapchain-images doc-file (device swapchain)
    (declare-types ("VkDevice" device) ("VkSwapchainKHR" swapchain)
		   :return ((list "VkImage") pSwapchainImages))
    (cffi:with-foreign-object (pSwapchainImageCount :uint32)
      (vkGetSwapchainImagesKHR device swapchain pSwapchainImageCount (cffi:null-pointer))
      (let* ((swapchain-image-count (cffi:mem-ref pSwapchainImageCount :uint32)))
	(cffi:with-foreign-object (pSwapchainImages 'VkImage swapchain-image-count)
	  (let ((result (vkGetSwapchainImagesKHR device swapchain pSwapchainImageCount pSwapchainImages))
		(swapchain-images (iter (for i from 0 below swapchain-image-count)
				    (collect (cffi:mem-aref pSwapchainImages 'VkImage i)))))
	    (values swapchain-images result)))))))
