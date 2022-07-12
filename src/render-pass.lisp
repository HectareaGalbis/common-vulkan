
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/render-pass.md"))


  (mcffi:doc-header "Render pass" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)


  (mcffi:def-foreign-struct "VkRenderPassCreateInfo" render-pass-create-info doc-file
      (:default-create :default-get :default-set)
    (sType              :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO)
    (pNext              :name "pNext" :type "pointer" :init-form nil
	                :create ((pNext-arg)
				 (setf pNext (or pNext-arg (cffi:null-pointer))))
			:get (() (if (cffi:null-pointer-p pNext)
				     nil
				     pNext))
			:set ((new-value)
			      (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkRenderPassCreateFlags")
    (attachmentCount :name "attachmentCount" :type uint32)
    (pAttachments :name "pAttachments" :type (list "VkAttachmentDescription") :init-form nil
		  :create ((pAttachments-arg)
			   (setf pAttachments (if pAttachments-arg
						  (cffi:foreign-alloc '(:struct VkAttachmentDescription)
								      :initial-contents
								      (iter (for attachment in pAttachments-arg)
									(collect (cffi:mem-ref attachment '(:struct VkAttachmentDescription)))))
						  (cffi:null-pointer))))
		  :destroy (when (not (cffi:null-pointer-p pAttachments))
			     (cffi:foreign-free pAttachments))
		  :get ((&optional (index nil))
			(if index
			    (cffi:mem-aref pAttachments '(:struct VkAttachmentDescription) index)
			    (if (not (cffi:null-pointer-p pAttachments))
				(iter (for i from 0 below attachmentCount)
				  (collect (cffi:mem-aref pAttachments '(:struct VkAttachmentDescription) i)))
				nil)))
		  :set ((new-value)
			(when (not (cffi:null-pointer-p pAttachments))
			  (cffi:foreign-free pAttachments))
			(setf pAttachments (if new-value
					       (cffi:foreign-alloc '(:struct VkAttachmentDescription)
								   :initial-contents
								   (iter (for attachment in new-value)
								     (collect (cffi:mem-ref attachment '(:struct VkAttachmentDescription)))))
					       (cffi:null-pointer)))))
    (subpassCount :name "subpassCount" :type uint32)
    (pSubpasses :name "pSubpasses" :type (list "VkSubpassDescription") :init-form nil
		:create ((pSubpasses-arg)
			 (setf pSubpasses (if pSubpasses-arg
					      (cffi:foreign-alloc '(:struct VkSubpassDescription)
								  :initial-contents
								  (iter (for attachment in pSubpasses-arg)
								    (collect (cffi:mem-ref attachment '(:struct VkSubpassDescription)))))
					      (cffi:null-pointer))))
		:destroy (when (not (cffi:null-pointer-p pSubpasses))
			   (cffi:foreign-free pSubpasses))
		:get ((&optional (index nil))
		      (if index
			  (cffi:mem-aref pSubpasses '(:struct VkSubpassDescription) index)
			  (if (not (cffi:null-pointer-p pSubpasses))
			      (iter (for i from 0 below subpassCount)
				(collect (cffi:mem-aref pSubpasses '(:struct VkSubpassDescription) i)))
			      nil)))
		:set ((new-value)
		      (when (not (cffi:null-pointer-p pSubpasses))
			(cffi:foreign-free pSubpasses))
		      (setf pSubpasses (if new-value
					   (cffi:foreign-alloc '(:struct VkSubpassDescription)
							       :initial-contents
							       (iter (for attachment in new-value)
								 (collect (cffi:mem-ref attachment '(:struct VkSubpassDescription)))))
					   (cffi:null-pointer)))))
    (dependencyCount :name "dependencyCount" :type uint32)
    (pDependencies :name "pDependencies" :type (list "VkSubpassDependency") :init-form nil
		   :create ((pDependencies-arg)
			    (setf pDependencies (if pDependencies-arg
						    (cffi:foreign-alloc '(:struct VkSubpassDependency)
									:initial-contents
									(iter (for attachment in pDependencies-arg)
									  (collect (cffi:mem-ref attachment '(:struct VkSubpassDependency)))))
						    (cffi:null-pointer))))
		   :destroy (when (not (cffi:null-pointer-p pDependencies))
			      (cffi:foreign-free pDependencies))
		   :get ((&optional (index nil))
			 (if index
			     (cffi:mem-aref pDependencies '(:struct VkSubpassDependency) index)
			     (if (not (cffi:null-pointer-p pDependencies))
				 (iter (for i from 0 below dependencyCount)
				   (collect (cffi:mem-aref pDependencies '(:struct VkSubpassDependency) i)))
				 nil)))
		   :set ((new-value)
			 (when (not (cffi:null-pointer-p pDependencies))
			   (cffi:foreign-free pDependencies))
			 (setf pDependencies (if new-value
						 (cffi:foreign-alloc '(:struct VkSubpassDependency)
								     :initial-contents
								     (iter (for attachment in new-value)
								       (collect (cffi:mem-ref attachment '(:struct VkSubpassDependency)))))
						 (cffi:null-pointer))))))



  (mcffi:doc-subheader "Functions" doc-file)


  (mcffi:doc-subsubheader "vkCreateRenderPass" doc-file)

  (mcffi:def-foreign-function "create-render-pass" doc-file (device pCreateInfo pAllocator)
    (declare-types ("VkDevice" device) ("VkRenderPassCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkRenderPass" "pRenderPass") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pRenderPass 'VkRenderPass)
	(let ((result (vkCreateRenderPass device pCreateInfo pAllocator-c pRenderPass)))
	  (values (cffi:mem-ref pRenderPass 'VkRenderPass) result device pAllocator)))))



  (mcffi:doc-subsubheader "vkDestroyRenderPass" doc-file)

  (mcffi:def-foreign-function "destroy-render-pass" doc-file (device renderPass pAllocator)
    (declare-types ("VkDevice" device) ("VkRenderPass" "renderPass") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyRenderPass device renderPass pAllocator-c)))



  (mcffi:doc-subsubheader "with-render-pass" doc-file)

  (mcffi:defwith with-render-pass doc-file
    create-render-pass
    destroy-render-pass
    :destructor-arguments (2 0 3)))
