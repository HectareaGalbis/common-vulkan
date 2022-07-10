
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/pipeline.md"))


  (mcffi:doc-header "Pipeline" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)


  (mcffi:def-foreign-struct "VkPipelineShaderStageCreateInfo" pipeline-shader-stage-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO)
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkPipelineShaderStageCreateFlags")
    (stage :type VkShaderStageFlagBits)
    (module :type "VkShaderModule" :init-form nil
	    :create ((module-arg)
		     (setf module (or module-arg (cffi:null-pointer))))
	    :get (() (if (cffi:null-pointer-p module)
			 nil
			 module))
	    :set ((new-value)
		  (setf module (or new-value (cffi:null-pointer)))))
    (pName :name "pName" :type string :init-form nil
	   :create ((pName-arg)
		    (setf pName (if pName-arg (cffi:foreign-string-alloc pName-arg) (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pName)
			nil
			(cffi:foreign-string-to-lisp pName)))
	   :set ((new-value)
		 (when (not (cffi:null-pointer-p pName))
		   (cffi:foreign-string-free pName))
		 (setf pName (if new-value (cffi:foreign-string-alloc new-value) (cffi:null-pointer)))))
    (pSpecializationInfo :name "pSpecializationInfo" :type "VkSpecializationInfo" :init-form nil
			 :create ((pSpecializationInfo-arg)
				  (setf pSpecializationInfo (or pSpecializationInfo-arg (cffi:null-pointer))))
			 :get (() (if (cffi:null-pointer-p pSpecializationInfo)
				      nil
				      pSpecializationInfo))
			 :set ((new-value)
			       (setf pSpecializationInfo (or new-value (cffi:null-pointer))))))



  (mcffi:def-foreign-struct "VkPipelineDynamicStateCreateInfo" pipeline-dynamic-state-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO)
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type VkPipelineDynamicStateCreateFlags)
    (dynamicStateCount :name "dynamicStateCount" :type uint32)
    (pDynamicStates :name "pDynamicStates" :type (list "VkDynamicState") :init-form nil
		    :create ((pDynamicStates-arg)
			     (setf pDynamicStates (if pDynamicStates-arg
						      (cffi:foreign-alloc 'VkDynamicState :initial-contents pDynamicStates-arg)
						      (cffi:null-pointer))))
		    :destroy (when (not (cffi:null-pointer-p pDynamicStates))
			       (cffi:foreign-free pDynamicStates))
		    :get ((&optional (index nil))
			  (if index
			      (cffi:mem-aref pDynamicStates 'VkDynamicState index)
			      (if (cffi:null-pointer-p pDynamicStates)
				  nil
				  (iter (for i from 0 below dynamicStateCount)
				    (collect (cffi:mem-aref pDynamicStates 'VkDynamicState i))))))
		    :set ((new-value &optional (index nil))
			  (if index
			      (setf (cffi:mem-aref pDynamicStates 'VkDynamicState index) new-value)
			      (progn
				(when (not (cffi:null-pointer-p pDynamicStates))
				  (cffi:foreign-free pDynamicStates))
				(setf pDynamicStates (if new-value
							 (cffi:foreign-alloc 'VkDynamicState :initial-contents new-value)
							 (cffi:null-pointer))))))))



  (mcffi:def-foreign-struct "VkVertexInputBindingDescription" vertex-input-binding-description doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (binding :type uint32)
    (stride :type uint32)
    (inputRate :name "inputRate" :type "VkVertexInputRate"))



  (mcffi:def-foreign-struct "VkVertexInputAttributeDescription" vertex-input-attribute-description doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (location :type uint32)
    (binding :type uint32)
    (format :type "VkFormat")
    (offset :type uint32))



  (mcffi:def-foreign-struct "VkPipelineVertexInputStateCreateInfo" pipeline-vertex-input-state-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO)
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkPipelineVertexInputStateCreateFlags")
    (vertexBindingDescriptionCount :name "vertexBindingDescriptionCount" :type uint32)
    (pVertexBindingDescriptions :name "pVertexBindingDescriptions" :type (list "VkVertexInputBindingDescription") :init-form nil
				:create ((pVertexBindingDescriptions-arg)
					 (setf pVertexBindingDescriptions
					       (if pVertexBindingDescriptions-arg
						   (cffi:foreign-alloc '(:struct VkVertexInputBindingDescription)
								       :initial-contents
								       (iter (for description in pVertexBindingDescriptions-arg)
									 (collect (cffi:mem-ref description
												'(:struct VkVertexInputBindingDescription)))))
						   (cffi:null-pointer))))
				:destroy (when (not (cffi:null-pointer-p pVertexBindingDescriptions))
					   (cffi:foreign-free pVertexBindingDescriptions))
				:get ((&optional (index nil))
				      (if index
					  (cffi:mem-aptr pVertexBindingDescriptions '(:struct VkVertexInputBindingDescription) index)
					  (iter (for i from 0 below vertexBindingDescriptionCount)
					    (collect (cffi:mem-aptr pVertexBindingDescriptions '(:struct VkVertexInputBindingDescription) i)))))
				:set ((new-value)
				      (when (not (cffi:null-pointer-p pVertexBindingDescriptions))
					(cffi:foreign-free pVertexBindingDescriptions))
				      (if new-value
					  (cffi:foreign-alloc '(:struct VkVertexInputBindingDescription)
							      :initial-contents
							      (iter (for description in new-value)
								(collect (cffi:mem-ref description
										       '(:struct VkVertexInputBindingDescription)))))
					  (cffi:null-pointer))))
    (vertexAttributeDescriptionCount :name "vertexAttributeDescriptionCount" :type uint32)
    (pVertexAttributeDescriptions :name "pVertexAttributeDescriptions" :type (list "VkVertexInputAttributeDescription") :init-form nil
				  :create ((pVertexAttributeDescriptions-arg)
					   (setf pVertexAttributeDescriptions
						 (if pVertexAttributeDescriptions-arg
						     (cffi:foreign-alloc '(:struct VkVertexInputAttributeDescription)
									 :initial-contents
									 (iter (for description in pVertexAttributeDescriptions-arg)
									   (collect (cffi:mem-ref description
												  '(:struct VkVertexInputAttributeDescription)))))
						     (cffi:null-pointer))))
				  :destroy (when (not (cffi:null-pointer-p pVertexAttributeDescriptions))
					     (cffi:foreign-free pVertexAttributeDescriptions))
				  :get ((&optional (index nil))
					(if index
					    (cffi:mem-aptr pVertexAttributeDescriptions '(:struct VkVertexInputAttributeDescription) index)
					    (iter (for i from 0 below vertexAttributeDescriptionCount)
					      (collect (cffi:mem-aptr pVertexAttributeDescriptions '(:struct VkVertexInputAttributeDescription) i)))))
				  :set ((new-value)
					(when (not (cffi:null-pointer-p pVertexAttributeDescriptions))
					  (cffi:foreign-free pVertexAttributeDescriptions))
					(if new-value
					    (cffi:foreign-alloc '(:struct VkVertexInputAttributeDescription)
								:initial-contents
								(iter (for description in new-value)
								  (collect (cffi:mem-ref description
											 '(:struct VkVertexInputAttributeDescription)))))
					    (cffi:null-pointer)))))



  (mcffi:def-foreign-struct "VkPipelineInputAssemblyStateCreateInfo" pipeline-input-assembly-state-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO)
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkPipelineInputAssemblyStateCreateFlags")
    (topology :type "VkPrimitiveTopology")
    (primitiveRestartEnable :name "primitiveRestartEnable" :type "VkBool32"))



  (mcffi:def-foreign-struct "VkPipelineViewportStateCreateInfo" pipeline-viewport-state-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO)
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkPipelineViewportStateCreateFlags")
    (viewportCount :name "viewportCount" :type uint32)
    (pViewports :name "pViewports" :type (list "VkViewport") :init-form nil
		:create ((pViewports-arg)
			 (setf pViewports (if pViewports-arg
					      (cffi:foreign-alloc '(:struct VkViewport)
								  :initial-contents (iter (for viewport in pViewports-arg)
										      (collect (cffi:mem-ref viewport '(:struct VkViewport)))))
					      (cffi:null-pointer))))
		:destroy (when (not (cffi:null-pointer-p pViewports))
			   (cffi:foreign-free pViewports))
		:get ((&optional (index nil))
		      (if index
			  (cffi:mem-aptr pViewports '(:struct VkViewport) index)
			  (iter (for i from 0 below viewportCount)
			    (collect (cffi:mem-aptr pViewports '(:struct VkViewport) i)))))
		:set ((new-value)
		      (when (not (cffi:null-pointer-p pViewports))
			(cffi:foreign-free pViewports))
		      (setf pViewports (if new-value
					   (cffi:foreign-alloc '(:struct VkViewport)
							       :initial-contents (iter (for viewport in new-value)
										   (collect (cffi:mem-ref viewport '(:struct VkViewport)))))
					   (cffi:null-pointer)))))
    (scissorCount :name "scissorCount" :type uint32)
    (pScissors :name "pScissors" :type (list "VkRect2D") :init-form nil
	       :create ((pScissors-arg)
			(setf pScissors (if pScissors-arg
					     (cffi:foreign-alloc '(:struct VkRect2D)
								 :initial-contents (iter (for viewport in pViewports-arg)
										     (collect (cffi:mem-ref viewport '(:struct VkRect2D)))))
					     (cffi:null-pointer))))
	       :destroy (when (not (cffi:null-pointer-p pScissors))
			  (cffi:foreign-free pScissors))
	       :get ((&optional (index nil))
		     (if index
			 (cffi:mem-aptr pScissors '(:struct VkRect2D) index)
			 (iter (for i from 0 below scissorCount)
			   (collect (cffi:mem-aptr pScissors '(:struct VkRect2D) i)))))
	       :set ((new-value)
		     (when (not (cffi:null-pointer-p pScissors))
		       (cffi:foreign-free pScissors))
		     (setf pScissors (if new-value
					  (cffi:foreign-alloc '(:struct VkRect2D)
							      :initial-contents (iter (for scissor in new-value)
										  (collect (cffi:mem-ref scissor '(:struct VkRect2D)))))
					  (cffi:null-pointer))))))



  (mcffi:def-foreign-struct "VkPipelineRasterizationStateCreateInfo" pipeline-rasterization-state-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO)
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :name "flags" :type "VkPipelineRasterizationStateCreateFlags")
    (depthClampEnable :name "depthClampEnable" :type "VkBool32")
    (rasterizerDiscardEnable :name "rasterizerDiscardEnable" :type "VkBool32")
    (polygonMode :name "polygonMode" :type "VkPolygonMode")
    (cullMode :name "cullMode" :type "VkCullModeFlags")
    (frontFace :name "frontFace" :type "VkFrontFace")
    (depthBiasEnable :name "depthBiasEnable" :type "VkBool32")
    (depthBiasConstantFactor :name "depthBiasConstantFactor" :type float)
    (depthBiasClamp :name "depthBiasClamp" :type float)
    (depthBiasSlopeFactor :name "depthBiasSlopeFactor" :type float)
    (lineWidth :name "lineWidth" :type float))



  (mcffi:def-foreign-struct "VkPipelineMultisampleStateCreateInfo" pipeline-multisample-state-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO)
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :name flags :type "VkPipelineMultisampleStateCreateFlags")
    (rasterizationSamples :name "rasterizationSamples" :type "VkSampleCountFlagBits")
    (sampleShadingEnable :name "sampleShadingEnable" :type "VkBool32")
    (minSampleShading :name "minSampleShading" :type "float")
    (pSampleMask :name "pSampleMask" :type (list "VkSampleMask") :init-form nil
		 :create ((pSampleMask-arg)
			  (setf pSampleMask (if pSampleMask-arg
						(cffi:foreign-alloc 'VkSampleMask :initial-contents pSampleMask-arg)
						(cffi:null-pointer))))
		 :destroy (when (not (cffi:null-pointer-p pSampleMask))
			    (cffi:foreign-free pSampleMask))
		 :get ((&optional (index nil))
		       (if index
			   (cffi:mem-aref pSampleMask 'VkSampleMask index)
			   (iter (for i from 0 below (ceiling rasterizationSamples 32))
			     (collect (cffi:mem-aref pSampleMask 'VkSampleMask i)))))
		 :set ((new-value &optional (index nil))
		       (if index
			   (setf (cffi:mem-aref pSampleMask 'VkSampleMask index) new-value)
			   (progn
			     (when (not (cffi:null-pointer-p pSampleMask))
			       (cffi:foreign-free pSampleMask))
			     (setf pSampleMask (if new-value
						   (cffi:foreign-alloc 'VkSampleMask :initial-contents new-value)
						   (cffi:null-pointer)))))))
    (alphaToCoverageEnable :name "alphaToCoverageEnable" :type "VkBool32")
    (alphaToOneEnable :name "alphaToOneEnable" :type "VkBool32"))



  (mcffi:def-foreign-struct "VkPipelineColorBlendAttachmentState" pipeline-color-blend-attachment-state doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (blendEnable :name "blendEnable" :type "VkBool32")
    (srcColorBlendFactor :name "srcColorBlendFactor" :type "VkBlendFactor")
    (dstColorBlendFactor :name "dstColorBlendFactor" :type "VkBlendFactor")
    (colorBlendOp :name "colorBlendOp" :type "VkBlendOp")
    (srcAlphaBlendFactor :name "srcAlphaBlendFactor" :type "VkBlendFactor")
    (dstAlphaBlendFactor :name "dstAlphaBlendFactor" :type "VkBlendFactor")
    (alphaBlendOp :name "alphaBlendOp" :type "VkBlendOp")
    (colorWriteMask :name "colorWriteMask" :type "VkColorComponentFlags"))



  (mcffi:def-foreign-struct "VkPipelineColorBlendStateCreateInfo" pipeline-color-blend-state-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO)
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :name flags :type "VkPipelineColorBlendStateCreateFlags")
    (logicOpEnable :name "logicOpEnable" :type "VkBool32")
    (logicOp :name "logicOp" :type "VkLogicOp")
    (attachmentCount :name "attachmentCount" :type "uint32")
    (pAttachments :name "pAttachments" :type (list "VkPipelineColorBlendAttachmentState") :init-form nil
		  :create ((pAttachments-arg)
			  (setf pAttachments (if pAttachments-arg
						 (cffi:foreign-alloc '(:struct VkPipelineColorBlendAttachmentState)
								     :initial-contents pAttachments-arg)
						(cffi:null-pointer))))
		 :destroy (when (not (cffi:null-pointer-p pAttachments))
			    (cffi:foreign-free pAttachments))
		 :get ((&optional (index nil))
		       (if index
			   (cffi:mem-aptr pAttachments '(:struct VkPipelineColorBlendAttachmentState) index)
			   (iter (for i from 0 below attachmentCount)
			     (collect (cffi:mem-aptr pAttachments '(:struct VkPipelineColorBlendAttachmentState) i)))))
		 :set ((new-value)
		       (when (not (cffi:null-pointer-p pAttachments))
			 (cffi:foreign-free pAttachments))
		       (setf pAttachments (if new-value
					      (cffi:foreign-alloc '(:struct VkPipelineColorBlendAttachmentState)
								  :initial-contents new-value)
					      (cffi:null-pointer)))))
    (blendConstants :name "blendConstants" :type (list float)
		    :create ((blendConstants-arg)
			     (iter (for i from 0 below 4)
			       (for constant in blendConstants-arg)
			       (setf (cffi:mem-aref blendConstants :float i) constant)))
		    :get ((&optional (index nil))
			  (if index
			      (cffi:mem-aref blendConstants :float index)
			      (iter (for i from 0 below 4)
				(collect (cffi:mem-aref blendConstants :float i)))))
		    :set ((new-value &optional (index nil))
			  (if index
			      (setf (cffi:mem-aref blendConstants :float index) new-value)
			      (iter (for i from 0 below 4)
				(for constant in new-value)
				(setf (cffi:mem-aref blendConstants :float i) constant))))))



  (mcffi:def-foreign-struct "VkPipelineLayoutCreateInfo" pipeline-layout-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO)
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkPipelineLayoutCreateFlags")
    (setLayoutCount :name "setLayoutCount" :type uint32)
    (pSetLayouts :name "pSetLayouts" :type (list "VkDescriptorSetLayout")
		 :create ((pSetLayouts-arg)
			  (setf pSetLayouts (if pSetLayouts-arg
						(cffi:foreign-alloc 'VkDescriptorSetLayout
								    :initial-contents pSetLayouts-arg)
						(cffi:null-pointer))))
		 :destroy (when (not (cffi:null-pointer-p pSetLayouts))
			    (cffi:foreign-free pSetLayouts))
		 :get ((&optional (index nil))
		       (if index
			   (cffi:mem-aref pSetLayouts 'VkDescriptorSetLayout index)
			   (iter (for i from 0 below setLayoutCount)
			     (collect (cffi:mem-aref pSetLayouts 'VkDescriptorSetLayout i)))))
		 :set ((new-value &optional (index nil))
		       (if index
			   (setf (cffi:mem-aref pSetLayouts 'VkDescriptorSetLayout index) new-value)
			   (progn
			     (when (not (cffi:null-pointer-p pSetLayouts))
			       (cffi:foreign-free pSetLayouts))
			     (setf pSetLayouts (if new-value
						   (cffi:foreign-alloc 'VkDescriptorSetLayout
								       :initial-contents new-value)
						   (cffi:null-pointer)))))))
    (pushConstantRangeCount :name "pushConstantRangeCount" :type uint32)
    (pPushConstantRanges :name "pPushConstantRanges" :type (list "VkDescriptorSetLayout")
			 :create ((pPushConstantRanges-arg)
				  (setf pPushConstantRanges (if pPushConstantRanges-arg
								(cffi:foreign-alloc '(:struct VkPushConstantRange)
										    :initial-contents pPushConstantRanges-arg)
								(cffi:null-pointer))))
			 :destroy (when (not (cffi:null-pointer-p pPushConstantRanges))
				    (cffi:foreign-free pPushConstantRanges))
			 :get ((&optional (index nil))
			       (if index
				   (cffi:mem-aptr pPushConstantRanges '(:struct VkPushConstantRange) index)
				   (iter (for i from 0 below pushConstantRangeCount)
				     (collect (cffi:mem-aptr pPushConstantRanges '(:struct VkPushConstantRange) i)))))
			 :set ((new-value)
			       (when (not (cffi:null-pointer-p pPushConstantRanges))
				 (cffi:foreign-free pPushConstantRanges))
			       (setf pPushConstantRanges (if new-value
							     (cffi:foreign-alloc '(:struct VkPushConstantRange)
										 :initial-contents new-value)
							     (cffi:null-pointer))))))



  (mcffi:doc-subheader "Functions" doc-file)


  (mcffi:doc-subsubheader "vkCreatePipelineLayout" doc-file)

  (mcffi:def-foreign-function create-pipeline-layout doc-file (device pCreateInfo pAllocator)
    (declare-types ("VkDevice" device) ("VkPipelineLayoutCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkPipelineLayout" "pPipelineLayout") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pPipelineLayout 'VkPipelineLayout)
	(let ((result (vkCreatePipelineLayout device pCreateInfo pAllocator-c pPipelineLayout)))
	  (values (cffi:mem-ref pPipelineLayout 'VkPipelineLayout) result device pAllocator)))))



  (mcffi:doc-subsubheader "vkDestroyPipelineLayout" doc-file)

  (mcffi:def-foreign-function destroy-pipeline-layout doc-file (device pipelineLayout pAllocator)
    (declare-types ("VkDevice" device) ("VkPipelineLayout" "pipelineLayout") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyPipelineLayout device pipelineLayout pAllocator-c)))



  (mcffi:doc-subsubheader "with-pipeline-layout" doc-file)

  (mcffi:defwith with-pipeline-layout doc-file
    create-pipeline-layout
    destroy-pipeline-layout
    :destructor-arguments (2 0 3)))
