
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/miscellanea.md"))


  (mcffi:doc-header "Miscellanea" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)



  (mcffi:def-foreign-struct "VkOffset2D" offset-2d doc-file
      (:default-create :default-get :default-set)
    (x :type int32)
    (y :type int32))

  

  (mcffi:def-foreign-struct "VkExtent2D" extent-2d doc-file
      (:default-create :default-get :default-set)
    (width :type uint32)
    (height :type uint32))



  (mcffi:def-foreign-struct "VkRect2D" rect-2d doc-file
      (:default-create :default-get :default-set)
    (offset :pointer t :type "VkOffset2D"
	    :create ((offset-arg)
		     (setf (offset-2d-x offset) (offset-2d-x offset-arg)
			   (offset-2d-y offset) (offset-2d-y offset-arg)))
	    :set ((new-value)
		  (setf (offset-2d-x offset) (offset-2d-x new-value)
			(offset-2d-y offset) (offset-2d-y new-value))))
    (extent :pointer t :type "VkExtent2D"
	    :create ((extent-arg)
		     (setf (extent-2d-width extent) (extent-2d-width extent-arg)
			   (extent-2d-height extent) (extent-2d-height extent-arg)))
	    :set ((new-value)
		  (setf (extent-2d-width extent) (extent-2d-width new-value)
			(extent-2d-height extent) (extent-2d-height new-value)))))
  


  (mcffi:def-foreign-struct "VkComponentMapping" component-mapping doc-file
      (:default-create :default-get :default-set)
    (r :type "VkComponentSwizzle")
    (g :type "VkComponentSwizzle")
    (b :type "VkComponentSwizzle")
    (a :type "VkComponentSwizzle"))



  (mcffi:def-foreign-struct "VkImageSubresourceRange" image-subresource-range doc-file
      (:default-create :default-get :default-set)
    (aspectMask :name "aspectMask" :type "VkImageAspectFlags")
    (baseMipLevel :name "baseMipLevel" :type uint32)
    (levelCount :name "levelCount" :type uint32)
    (baseArrayLayer :name "baseArrayLayer" :type uint32)
    (layerCount :name "layerCount" :type uint32))



  (mcffi:def-foreign-struct "VkSpecializationMapEntry" specialization-map-entry doc-file
      (:default-create :default-get :default-set)
    (constantID :name "constantID" :type uint32)
    (offset :type uint32)
    (size :type size))
  
  

  (mcffi:def-foreign-struct "VkSpecializationInfo" specialization-info doc-file
      (:default-create :default-get :default-set)
    (mapEntryCount :name "mapEntryCount" :type uint32)
    (pMapEntries :name "pMapEntries" :type "VkSpecializationMapEntry" :init-form nil
		 :create ((pMapEntries-arg)
			  (setf pMapEntries (or pMapEntries-arg (cffi:null-pointer))))
		 :get (() (if (cffi:null-pointer-p pMapEntries)
			      nil
			      pMapEntries))
		 :set ((new-value)
		       (setf pMapEntries (or new-value (cffi:null-pointer)))))
    (dataSize :name "dataSize" :type size)
    (pData :name "pData" :type void*)) ; Sin tratar de momento



  (mcffi:def-foreign-struct "VkViewport" viewport doc-file
      (:default-create :default-get :default-set)
    (x :type float)
    (y :type float)
    (width :type float
	   :create ((width-arg)
		    (setf width (float width-arg)))
	   :set ((new-value)
		 (setf width (float new-value))))
    (height :type float)
    (minDepth :name "minDepth" :type float)
    (maxDepth :name "maxDepth" :type float))



  (mcffi:def-foreign-struct "VkPushConstantRange" push-constant-range doc-file
      (:default-create :default-get :default-set)
    (stageFlags :name "stageFlags" :type "VkShaderStageFlags")
    (offset :type uint32)
    (size :type uint32))



  (mcffi:def-foreign-struct "VkAttachmentDescription" attachment-description doc-file
      (:default-create :default-get :default-set)
    (flags :type "VkAttachmentDescriptionFlags")
    (format :type "VkFormat")
    (samples :type "VkSampleCountFlagBits")
    (loadOp :name "loadOp" :type "VkAttachmentLoadOp")
    (storeOp :name "storeOp" :type "VkAttachmentStoreOp")
    (stencilLoadOp :name "stencilLoadOp" :type "VkAttachmentLoadOp")
    (stencilStoreOp :name "stencilStoreOp" :type "VkAttachmentStoreOp")
    (initialLayout :name "initialLayout" :type "VkImageLayout")
    (finalLayout :name "finalLayout" :type "VkImageLayout"))



  (mcffi:def-foreign-struct "VkAttachmentReference" attachment-reference doc-file
      (:default-create :default-get :default-set)
    (attachment :type uint32)
    (layout :type "VkImageLayout"))



  (mcffi:def-foreign-struct "VkSubpassDescription" subpass-description doc-file
      (:default-create :default-get :default-set)
    (flags :type "VkSubpassDescriptionFlags")
    (pipelineBindPoint :name "pipelineBindPoint" :type "VkPipelineBindPoint")
    (inputAttachmentCount :name "inputAttachmentCount" :type uint32)
    (pInputAttachments :name "pInputAttachments" :type (list "VkAttachmentReference") :init-form nil
		       :create ((pInputAttachments-arg)
				(setf pInputAttachments (if pInputAttachments-arg
							    (cffi:foreign-alloc '(:struct VkAttachmentReference)
										:initial-contents
										(iter (for attachment in pInputAttachments-arg)
										  (collect (cffi:mem-ref attachment '(:struct VkAttachmentReference)))))
							    (cffi:null-pointer))))
		       :destroy (when (not (cffi:null-pointer-p pInputAttachments))
				  (cffi:foreign-free pInputAttachments))
		       :get ((&optional (index nil))
			     (if index
				 (cffi:mem-aref pInputAttachments '(:struct VkAttachmentReference) index)
				 (if (not (cffi:null-pointer-p pInputAttachments))
				     (iter (for i from 0 below inputAttachmentCount)
				       (collect (cffi:mem-aref pInputAttachments '(:struct VkAttachmentReference) i)))
				     nil)))
		       :set ((new-value)
			     (when (not (cffi:null-pointer-p pInputAttachments))
			       (cffi:foreign-free pInputAttachments))
			     (setf pInputAttachments (if new-value
							 (cffi:foreign-alloc '(:struct VkAttachmentReference)
									     :initial-contents
									     (iter (for attachment in new-value)
									       (collect (cffi:mem-ref attachment '(:struct VkAttachmentReference)))))
							 (cffi:null-pointer)))))
    (colorAttachmentCount :name "colorAttachmentCount" :type uint32)
    (pColorAttachments :name "pColorAttachments" :type (list "VkAttachmentReference") :init-form nil
		       :create ((pColorAttachments-arg)
				(setf pColorAttachments (if pColorAttachments-arg
							    (cffi:foreign-alloc '(:struct VkAttachmentReference)
										:initial-contents
										(iter (for attachment in pColorAttachments-arg)
										  (collect (cffi:mem-ref attachment '(:struct VkAttachmentReference)))))
							    (cffi:null-pointer))))
		       :destroy (when (not (cffi:null-pointer-p pColorAttachments))
				  (cffi:foreign-free pColorAttachments))
		       :get ((&optional (index nil))
			     (if index
				 (cffi:mem-aref pColorAttachments '(:struct VkAttachmentReference) index)
				 (if (not (cffi:null-pointer-p pColorAttachments))
				     (iter (for i from 0 below colorAttachmentCount)
				       (collect (cffi:mem-aref pColorAttachments '(:struct VkAttachmentReference) i)))
				     nil)))
		       :set ((new-value)
			     (when (not (cffi:null-pointer-p pColorAttachments))
			       (cffi:foreign-free pColorAttachments))
			     (setf pColorAttachments (if new-value
							 (cffi:foreign-alloc '(:struct VkAttachmentReference)
									     :initial-contents
									     (iter (for attachment in new-value)
									       (collect (cffi:mem-ref attachment '(:struct VkAttachmentReference)))))
							 (cffi:null-pointer)))))
    (pResolveAttachments :name "pResolveAttachments" :type (list "VkAttachmentReference") :init-form nil
			 :create ((pResolveAttachments-arg)
				  (setf pResolveAttachments (if pResolveAttachments-arg
								(cffi:foreign-alloc '(:struct VkAttachmentReference)
										    :initial-contents
										    (iter (for attachment in pResolveAttachments-arg)
										      (collect (cffi:mem-ref attachment '(:struct VkAttachmentReference)))))
								(cffi:null-pointer))))
			 :destroy (when (not (cffi:null-pointer-p pResolveAttachments))
				    (cffi:foreign-free pResolveAttachments))
			 :get ((&optional (index nil))
			       (if index
				   (cffi:mem-aref pResolveAttachments '(:struct VkAttachmentReference) index)
				   (if (not (cffi:null-pointer-p pResolveAttachments))
				       (iter (for i from 0 below colorAttachmentCount)
					 (collect (cffi:mem-aref pResolveAttachments '(:struct VkAttachmentReference) i)))
				       nil)))
			 :set ((new-value)
			       (when (not (cffi:null-pointer-p pResolveAttachments))
				 (cffi:foreign-free pResolveAttachments))
			       (setf pResolveAttachments (if new-value
							     (cffi:foreign-alloc '(:struct VkAttachmentReference)
										 :initial-contents
										 (iter (for attachment in new-value)
										   (collect (cffi:mem-ref attachment '(:struct VkAttachmentReference)))))
							     (cffi:null-pointer)))))
    (pDepthStencilAttachment :name pDepthStencilAttachment :type "VkAttachmentReference" :init-form nil
			     :create ((pDepthStencilAttachment-arg)
				      (setf pDepthStencilAttachment (or pDepthStencilAttachment-arg (cffi:null-pointer))))
			     :get (() (if (cffi:null-pointer-p pDepthStencilAttachment)
					  nil
					  pDepthStencilAttachment))
			     :set ((new-value)
				   (setf pDepthStencilAttachment (or new-value (cffi:null-pointer)))))
    (preserveAttachmentCount :name "preserveAttachmentCount" :type uint32)
    (pPreserveAttachments :name "pPreserveAttachments" :type (list "VkAttachmentReference") :init-form nil
			  :create ((pPreserveAttachments-arg)
				   (setf pPreserveAttachments (if pPreserveAttachments-arg
								  (cffi:foreign-alloc '(:struct VkAttachmentReference)
										      :initial-contents
										      (iter (for attachment in pPreserveAttachments-arg)
											(collect (cffi:mem-ref attachment '(:struct VkAttachmentReference)))))
								  (cffi:null-pointer))))
			  :destroy (when (not (cffi:null-pointer-p pPreserveAttachments))
				     (cffi:foreign-free pPreserveAttachments))
			  :get ((&optional (index nil))
				(if index
				    (cffi:mem-aref pPreserveAttachments '(:struct VkAttachmentReference) index)
				    (if (not (cffi:null-pointer-p pPreserveAttachments))
					(iter (for i from 0 below preserveAttachmentCount)
					  (collect (cffi:mem-aref pPreserveAttachments '(:struct VkAttachmentReference) i)))
					nil)))
			  :set ((new-value)
				(when (not (cffi:null-pointer-p pPreserveAttachments))
				  (cffi:foreign-free pPreserveAttachments))
				(setf pPreserveAttachments (if new-value
							       (cffi:foreign-alloc '(:struct VkAttachmentReference)
										   :initial-contents
										   (iter (for attachment in new-value)
										     (collect (cffi:mem-ref attachment '(:struct VkAttachmentReference)))))
							       (cffi:null-pointer))))))



  (mcffi:def-foreign-struct "VkSubpassDependency" subpass-dependency doc-file
      (:default-create :default-get :default-set)
    (srcSubpass :name "srcSubpass" :type uint32)
    (dstSubpass :name "dstSubpass" :type uint32)
    (srcStageMask :name "srcStageMask" :type "VkPipelineStageFlags")
    (dstStageMask :name "dstStageMask" :type "VkPipelineStageFlags")
    (srcAccessMask :name "srcAccessMask" :type "VkAccessFlags")
    (dstAccessMask :name "dstAccessMask" :type "VkAccessFlags")
    (dependencyFlags :name "dependencyFlags" :type "VkDependencyFlags"))



  (mcffi:doc-subheader "Functions" doc-file)


  (mcffi:doc-subsubheader "create-spv-code" doc-file)

  (mcffi:def-foreign-function create-spv-code doc-file (file)
    (declare-types ("pathname designator" file) :return ("spv code" code) ("uint" size))
    (with-open-file (stream file :direction :input :element-type '(unsigned-byte 8))
      (let ((buffer (make-array 1024 :element-type '(unsigned-byte 8) :fill-pointer 0 :adjustable t)))
	(loop for byte = (read-byte stream nil)
	      while byte
	      do (vector-push-extend byte buffer))
	(let ((code (cffi:foreign-alloc :uint8 :initial-contents buffer)))
	  (values code (fill-pointer buffer))))))



  (mcffi:doc-subsubheader "destroy-spv-code" doc-file)
  
  (mcffi:def-foreign-function destroy-spv-code doc-file (code)
    (declare-types ("spv code" code))
    (cffi:foreign-free code))



  (mcffi:doc-subsubheader "with-spv-code" doc-file)

  (mcffi:defwith with-spv-code doc-file
    create-spv-code
    destroy-spv-code)) 
