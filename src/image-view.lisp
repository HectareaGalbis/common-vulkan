
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/image-view.md"))


  (mcffi:doc-header "Image view" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)


  (mcffi:def-foreign-struct "VkImageViewCreateInfo" image-view-create-info doc-file
      (:default-create :default-get :default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO)
    (pNext :name "pNext" :type pointer :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkImageViewCreateFlags")
    (image :type "VkImage")
    (viewType :name "viewType" :type "VkImageViewType")
    (format :type "VkFormat")
    (components :pointer t :type "VkComponentSwizzle"
		:create ((components-arg)
			 (setf (component-mapping-r components) (component-mapping-r components-arg))
			 (setf (component-mapping-g components) (component-mapping-g components-arg))
			 (setf (component-mapping-b components) (component-mapping-b components-arg))
			 (setf (component-mapping-a components) (component-mapping-a components-arg)))
		:set ((new-value)
		      (setf (component-mapping-r components) (component-mapping-r new-value))
		      (setf (component-mapping-g components) (component-mapping-g new-value))
		      (setf (component-mapping-b components) (component-mapping-b new-value))
		      (setf (component-mapping-a components) (component-mapping-a new-value))))
    (subresourceRange :pointer t :name "subresourceRange" :type "VkImageSubresourceRange"
		      :create ((subresourceRange-arg)
			       (setf (image-subresource-range-aspectMask subresourceRange) (image-subresource-range-aspectMask subresourceRange-arg))
			       (setf (image-subresource-range-baseMipLevel subresourceRange) (image-subresource-range-baseMipLevel subresourceRange-arg))
			       (setf (image-subresource-range-levelCount subresourceRange) (image-subresource-range-levelCount subresourceRange-arg))
			       (setf (image-subresource-range-baseArrayLayer subresourceRange) (image-subresource-range-baseArrayLayer subresourceRange-arg))
			       (setf (image-subresource-range-layerCount subresourceRange) (image-subresource-range-layerCount subresourceRange-arg)))
		      :set ((new-value)
			    (setf (image-subresource-range-aspectMask subresourceRange) (image-subresource-range-aspectMask new-value))
			    (setf (image-subresource-range-baseMipLevel subresourceRange) (image-subresource-range-baseMipLevel new-value))
			    (setf (image-subresource-range-levelCount subresourceRange) (image-subresource-range-levelCount new-value))
			    (setf (image-subresource-range-baseArrayLayer subresourceRange) (image-subresource-range-baseArrayLayer new-value))
			    (setf (image-subresource-range-layerCount subresourceRange) (image-subresource-range-layerCount new-value)))))



  (mcffi:doc-subheader "Functions" doc-file)


  (mcffi:doc-subsubheader "vkCreateImageView" doc-file)

  (mcffi:def-foreign-function create-image-view doc-file (device pCreateInfo pAllocator)
    (declare-types ("VkDevice" device) ("VkImageViewCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkImageView" "pView"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pView 'VkImageView)
	(let ((result (vkCreateImageView device pCreateInfo pAllocator-c pView)))
	  (values (cffi:mem-ref pView 'VkImageView) result device pAllocator)))))



  (mcffi:doc-subsubheader "vkDestroyImageView" doc-file)

  (mcffi:def-foreign-function destroy-image-view doc-file (device imageView pAllocator)
    (declare-types ("VkDevice" device) ("VkImageView" "imageView") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyImageView device imageView pAllocator-c)))



  (mcffi:doc-subsubheader "with-image-view" doc-file)

  (mcffi:defwith with-image-view doc-file
    create-image-view
    destroy-image-view
    :destructor-arguments (2 0 3)))
