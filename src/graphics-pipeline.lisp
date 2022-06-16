
(in-package :cvk)



;;; -------------------------
;;; --- Private functions ---
;;; -------------------------



;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a vertex input binding description structure
(defun create-vertex-input-binding-description (_binding _stride input-rate)
  (let ((bind-description-ptr (alloc-vulkan-object '(:struct VkVertexInputBindingDescription))))
    (cffi:with-foreign-slots ((binding stride inputRate)
			      bind-description-ptr (:struct VkVertexInputBindingDescription))
      (setf binding   _binding
	    stride    _stride
	    inputRate input-rate))
    (values bind-description-ptr)))

;; Destroys a vertex input binding description structure
(defun destroy-vertex-input-binding-description (bind-description-ptr)
  (free-vulkan-object bind-description-ptr))

;; With vertex input binding description macro
(defwith with-vertex-input-binding-description
  create-vertex-input-bind-description
  destroy-vertex-input-binding-description)


;; Creates a vertex input attribute description structure
(defun create-vertex-input-attribute-description (_location _binding _format _offset)
  (let ((attr-description-ptr (alloc-vulkan-object '(:struct VkVertexInputAttributeDescription))))
    (cffi:with-foreign-slots ((location binding format offset)
			      attr-description-ptr (:struct VkVertexInputAttributeDescription))
      (setf location _location
	    binding  _binding
	    format   _format
	    offset   _offset))
    (values attr-description-ptr)))

;; Destroys a vertex input attribute description structure
(defun destroy-vertex-input-attribute-description (attr-description-ptr)
  (free-vulkan-object attr-description-ptr))

;; With vertex input attribute description macro
(defwith with-vertex-input-attribute-description
  create-vertex-input-attribute-description
  destroy-vertex-input-attribute-description)


;; Creates a pipeline vertex input state create info structure
(defun create-pipeline-vertex-input-state-create-info (vertex-binding-descriptions
						       vertex-attribute-descriptions)
  (let ((state-create-info-ptr (alloc-vulkan-object '(:struct VkPipelineVertexInputStateCreateInfo)))
	(bind-descriptions-ptr (if vertex-binding-descriptions
				   (cffi:foreign-alloc
				     '(:struct VkVertexInputBindingDescription)
				     :initial-contents
				     (mapcar (lambda (x)
				               (cffi:mem-ref x '(:struct VkVertexInputBindingDescription)))
					     vertex-binding-descriptions))
				     (cffi:null-pointer)))
	(attr-descriptions-ptr (if vertex-attribute-descriptions
				   (cffi:foreign-alloc
				    '(:struct VkVertexInputAttributeDescription)
				    :initial-contents
				    (mapcar (lambda (x)
					      (cffi:mem-ref x '(:struct VkVertexInputAttributeDescription)))))
				   (cffi:null-pointer))))
    (cffi:with-foreign-slots ((sType vertexBindingDescriptionCount pVertexBindingDescriptions
			             vertexAttributeDescriptionCount pVertexAttributeDescriptions)
			      state-create-info-ptr (:struct VkPipelineVertexInputStateCreateInfo))
      (setf sType                           VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO
	    vertexBindingDescriptionCount   (length vertex-binding-descriptions)
	    pVertexBindingDescriptions      bind-descriptions-ptr
	    vertexAttributeDescriptionCount (length vertex-attribute-descriptions)
	    pVertexAttributeDescriptions    attr-descriptions-ptr))
    (values state-create-info-ptr)))

;; Destroys a pipeline vertex input state create info structure
(defun destroy-pipeline-vertex-input-state-create-info (state-create-info-ptr)
  (cffi:with-foreign-slots ((pVertexBindingDescriptions pVertexAttributeDescriptions)
			    state-create-info-ptr (:struct VkPipelineVertexInputStateCreateInfo))
    (cffi:foreign-free pVertexBindingDescriptions)
    (cffi:foreign-free pVertexAttributeDescriptions))
  (free-vulkan-object state-create-info-ptr))

;; With pipeline vertex input state create info macro
(defwith with-pipeline-vertex-input-state-create-info
  create-pipeline-vertex-input-state-create-info
  destroy-pipeline-vertex-input-state-create-info)


;; Creates a pipeline input assembly create info structure
(defun create-pipeline-input-assembly-state-create-info (_topology primitive-restart-p)
  (let ((assembly-state-info-ptr (alloc-vulkan-object '(:struct VkPipelineInputAssemblyStateCreateInfo))))
    (cffi:with-foreign-slots ((sType topology primitiveRestartEnable)
			      assembly-state-info-ptr (:struct VkPipelineInputAssemblyStateCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO
	    totpology _topology
	    primitiveRestartEnable (if primitive-restart-p VK_TRUE VK_FALSE)))
    (values assembly-state-info-ptr)))

;; Destroys a pipeline input assembly state create info structure
(defun destroy-pipeline-input-assembly-state-create-info (assembly-state-info-ptr)
  (free-vulkan-object assembly-state-info-ptr))

;; With pipeline input assembly state create info macro
(defwith with-pipeline-input-assembly-state-create-info
  create-pipeline-input-assembly-state-create-info
  destroy-pipeline-input-assembly-state-create-info)


;; Creates a viewport structure
(defun create-viewport (_x _y _width _height min-depth max-depth)
  (let ((viewport-ptr (alloc-vulkan-object '(:struct VkViewport))))
    (cffi:with-foreign-slots ((x y width height minDepth maxDepth)
			      viewport-ptr (:struct VkViewport))
      (setf x        _x
	    y        _y
	    width    _width
	    height   _height
	    minDepth min-depth
	    maxDepth max-depth))
    (values viewport-ptr)))

;; Destroys a viewport structure
(defun destroy-viewport (viewport-ptr)
  (free-vulkan-object viewport-ptr))

;; With viewport macro
(defwith with-viewport
  create-viewport
  destroy-viewport)


;; Creates a scissor structure 
(defun create-scissor (x-offset y-offset _width _height)
  (let ((scissor-ptr (alloc-vulkan-object '(:struct VkRect2D))))
    (cffi:with-foreign-slots (((offset :pointer) (extent :pointer)) scissor-ptr (:struct VkRect2D))
      (cffi:with-foreign-slots ((x y) offset (:struct VkOffset2D))
	(setf x x-offset
	      y y-offset))
      (cffi:with-foreign-slots ((width height) extente (:struct VkExtent2D))
	(setf width  _width
	      height _height)))
    (values scissor-ptr)))

;; Destroys a scissor structure
(defun destroy-scissor (scissor-ptr)
  (free-vulkan-object scissor-ptr))


;; With scissor macro
(defwith with-scissor
  create-scissor
  destroy-scissor)


;; Creates a pipeline viewport create info structure
(defun create-pipeline-viewport-state-create-info (viewports scissors)
  (let ((viewport-state-ptr (alloc-vulkan-object '(:struct VkPipelineViewportStateCreateInfo)))
	(viewports-ptr (cffi:foreign-alloc '(:struct VkViewport)
					   :initial-contents
					   (mapcar (lambda (x)
						     (cffi:mem-ref x '(:struct VkViewport)))
						   viewports)))
	(scissors-ptr (cffi:foreign-alloc '(:struct VkRect2D)
					  :initial-contents
					  (mapcar (lambda (x)
						    (cffi:mem-ref x '(:struct VkRect2D)))
						  scissors))))
    (cffi:with-foreign-slots ((sType viewportCount pViewports scissorCount pScissors)
			      viewport-state-ptr (:struct VkPipelineViewportStateCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO
	    viewportCount (length viewports)
	    pViewports    viewports-ptr
	    scissorCount  (length scissors)
	    pScissors     scissors-ptr))
    (values viewport-state-ptr)))

;; Destroys a pipeline viewport state create info structure
(defun destroy-pipeline-viewport-state-create-info (viewport-state-ptr)
  (cffi:with-foreign-slots ((pViewports pScissors)
			    viewport-state-ptr (:struct VkPipelineViewportStateCreateInfo))
    (cffi:foreign-free pViewports)
    (cffi:foreign-free pScissors))
  (free-vulkan-object viewport-state-ptr))

;; With pipeline viewport state create info macro
(defwith with-pipeline-viewport-state-create-info
  create-pipeline-viewport-state-create-info
  destroy-pipeline-viewport-state-create-info)


;; Create a pipeline rasterization state create info structure
(defun create-pipeline-rasterization-state-create-info (depth-clamp-p rasterizer-discard-p polygon-mode
							cull-mode front-face depth-bias-p
							depth-bias-constant-factor depth-bias-clamp
							depth-bias-slope-factor line-width)
  (let ((rasterization-info-ptr (alloc-vulkan-object '(:struct VkPipelineRasterizationStateCreateInfo))))
    (cffi:with-foreign-slots ((sType depthClampEnable rasterizerDiscardEnable polygonMode cullMode
				     frontFace depthBiasEnable depthBiasConstantFactor depthBiasClamp
				     depthBiasSlopeFactor lineWidth)
			      rasterization-info-ptr (:struct VkPipelineRasterizationStateCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO
	    depthClampEnable        (if depth-clamp-p VK_TRUE VK_FALSE)
	    rasterizerDiscardEnable (if rasterizer-discard-p VK_TRUE VK_FALSE)
	    polygonMode             polygon-mode
	    cullMode                cull-mode
	    frontFace               front-face
	    depthBiasEnable         (if depth-bias-p VK_TRUE VK_FALSE)
	    depthBiasConstantFactor depth-bias-constant-factor
	    depthBiasClamp          depth-bias-clamp
	    depthBiasSlopeFactor    depth-bias-slope-factor
	    lineWidth               line-width))
    (values rasterization-info-ptr)))

;; Destroys a pipeline rasterization state create info structure
(defun destroy-pipeline-rasterization-state-create-info (rasterization-info-ptr)
  (free-vulkan-object rasterization-info-ptr))

;; With pipeline rasterization state create info macro
(defwith with-pipeline-rasterization-state-create-info
  create-pipeline-rasterization-state-create-info
  destroy-pipeline-rasterization-state-create-info)


;; Creates a multisample state create info structure
(defun create-multisample-state-create-info (rasterization-samples sample-shading-p min-sample-shading
					     sample-mask alpha-to-coverage-p alpha-to-one-p)
  (let ((multisample-info-ptr (alloc-vulkan-object '(:struct VkPipelineMultisampleStateCreateInfo)))
	(sample-mask-ptr (cffi:foreign-alloc :uint32 :initial-contents sample-mask)))
    (cffi:with-foreign-slots ((sType rasterizationSamples sampleShadingEnable minSampleShading
				     pSampleMask alphaToCoverageEnable alphaToOneEnable)
			      multisample-info-ptr (:struct VkPipelineMultisampleStateCreateInfo))
      (setf sType                 VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO
	    rasterizationSamples  rasterization-samples
	    sampleShadingEnable   (if sample-shading-p VK_TRUE VK_FALSE)
	    minSampleShading      min-sample-shading
	    pSampleMask           sample-mask-ptr
	    alphaToCoverageEnable (if alpha-to-coverage-p VK_TRUE VK_FALSE)
	    alphaToOneEnable      (if alpha-to-one-p VK_TRUE VK_FALSE)))
    (values multisample-info-ptr)))

;; Destroys a multisample state create info structure
(defun destroy-multisample-state-create-info (multisample-info-ptr)
  (cffi:with-foreign-slots ((pSampleMask) multisample-info-ptr (:struct VkPipelineMultisampleStateCreateInfo))
    (cffi:foreign-free pSampleMask))
  (free-vulkan-object multisample-info-ptr))

;; With multisample state create info macro
(defwith with-multisample-state-create-info
  create-multisample-state-create-info
  destroy-multisample-state-create-info)


;; Aqui iria create-pipeline-depth-stencil-create-info



;; Creates a pipeline color blend attachment state structure
(defun create-pipeline-color-blend-attachment-state (blend-p src-color-blend-factor dst-color-blend-factor
						     color-blend-op src-alpha-blend-factor
						     dst-alpha-blend-factor alpha-blend-op color-write-mask)
  (let ((blend-state-ptr (alloc-vulkan-object '(:struct VkPipelineColorBlendAttachmentState))))
    (cffi:with-foreign-slots ((blendEnable srcColorBlendFactor dstColorBlendFactor colorBlendOp
					   srcAlphaBlendFactor dstAlphaBlendFactor alphaBlendOp
					   colorWrite Mask)
			      blend-state-ptr (:struct VkPipelineColorBlendAttachmentState))
      (setf blendEnable (if blend-p VK_TRUE VK_FALSE)
	    srcColorBlendFactor src-color-blend-factor
	    dstColorBlendFactor dst-color-blend-factor
	    colorBlendOp color-blend-op
	    srcAlphaBlendFactor src-alpha-blend-factor
	    dstAlphaBlendFactor dst-alpha-blend-factor
	    alphaBlendOp alpha-blend-op
	    colorWriteMask color-write-mask))
    (values blend-state-ptr)))

;; Destroys a pipeline color blend attachment state structure
(defun destroy-pipeline-color-blend-attachment-state (blend-state-ptr)
  (free-vulkan-object blend-state-ptr))

;; With pipeline color blend attachment state macro
(defwith with-pipeline-color-blend-attachment-state
  create-pipeline-color-blend-attachment-state
  destroy-pipeline-color-blend-attachment-state)


;; Creates a pipeline color blend state create info structure
(defun create-pipeline-color-blend-state-create-info (logic-op-p logic-op attachments blend-constants)
  (let ((blend-info-ptr (alloc-vulkan-object '(:struct VkPipelineColorBlendStateCreateInfo)))
	(attachments-ptr (cffi:foreign-alloc '(:struct VkPipelineColorBlendAttachmentState)
					     :initial-contents
					     (mapcar
					      (lambda (x)
						(cffi:mem-ref x
							      '(:struct VkPipelineColorBlendAttachmentState)))
					      attachments))))
    (cffi:with-foreign-slots ((sType logicOpEnable logicOp attachmentCount pAttachments
				     (blendConstants :pointer))
			      blend-info-ptr '(:struct VkPipelineColorBlendStateCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO
	    logicOpEnable (if logic-op-p VK_TRUE VK_FALSE)
	    logicOp logic-op
	    attachmentCount (length attachments)
	    pAttachments attachments-ptr)
      (loop for i from 0 below 4
	    for blend-constant in blend-constants
	    do (setf (cffi:mem-aref blendConstants :float i) blend-constant)))
    (values blend-info-ptr)))

;; Destroys a pipeline color blend state create info structure
(defun destroy-pipeline-color-blend-state-create-info (blend-info-ptr)
  (cffi:with-foreign-slots ((pAttachments) blend-info-ptr (:struct VkPipelineColorBlendStateCreateInfo))
    (cffi:foreign-free pAttachments))
  (free-vulkan-object blend-info-ptr))

;; With pipeline color blend state create info macro 
(defwith with-pipeline-color-blend-state-create-info
  create-pipeline-color-blend-state-create-info
  destroy-pipeline-color-blend-state-create-info)


;; Creates a pipeline dynamic state create info structure
(defun create-pipeline-dynamic-state-create-info (dynamic-states)
  (let ((dynamic-info-ptr (alloc-vulkan-object '(:struct VkPipelineDynamicStateCreateInfo)))
	(dynamic-states-ptr (if dynamic-states
				(cffi:foreign-alloc 'VkDynamicState :initial-contents dynamic-states)
				(cffi:null-pointer))))
    (cffi:with-foreign-slots ((sType dynamicStateCount pDynamicStates)
			      dynamic-info-ptr '(:struct VkPipelineDynamicStateCreateInfo))
      (setf sType             VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO
	    dynamicStateCount (length dynamic-states)
	    pDynamicStates    dynamic-states-ptr))
    (values dynamic-info-ptr)))

;; Destroys a pipeline dynamic state create info structure
(defun destroy-pipeline-dynamic-state-create-info (dynamic-info-ptr)
  (cffi:with-foreign-slots ((pDynamicStates) dynamic-info-ptr (:struct VkPipelineDynamicStateCreateInfo))
    (cffi:foreign-free pDynamicStates))
  (free-vulkan-object dynamic-info-ptr))

;; With pipeline dynamic state create info macro
(defwith with-pipeline-dynamic-state-create-info
  create-pipeline-dynamic-state-create-info
  destroy-pipeline-dynamic-state-create-info)


;; Creates a pipeline layout create info structure
(defun create-pipeline-layout-create-info (set-layouts push-constant-ranges)
  (let ((layout-info-ptr (alloc-vulkan-object '(:struct VkPipelineLayoutCreateInfo)))
	(set-layouts-ptr (if set-layouts
			     (cffi:foreign-alloc 'VkDescriptorSetLayot :initial-contents set-layouts)
			     (cffi:null-pointer)))
	(push-constant-ranges-ptr (if push-constant-ranges
				      (cffi:foreign-alloc '(:struct VkPushConstantRange)
						          :initial-contents
						          (mapcar
						           (lambda (x)
							     (cffi:mem-ref x '(:struct VkPushConstantRange)))
						           push-constant-ranges))
				      (cffi:null-pointer))))
    (cffi:with-foreign-slots ((sType setLayoutCount pSetLayouts pushConstantRangeCount pPushConstantRanges)
			      layout-info-ptr '(:struct VkPipelineLayoutCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO
	    setLayoutCount (length set-layouts)
	    pSetLayout set-layouts-ptr
	    pushConstantRangeCount (length push-constant-ranges)
	    pPushConstantRanges push-constant-ranges-ptr))
    (values layout-info-ptr)))

;; Destroys a pipeline layout create info structure
(defun destroy-pipeline-layout-create-info (layout-info-ptr)
  (cffi:with-foreign-slots ((pSetLayouts pPushConstantRanges)
			    layout-info-ptr '(:struct VkPipelineLayoutCreateInfo))
    (cffi:foreign-free pSetLayouts)
    (cffi:foreign-free pPushConstantRanges))
  (free-vulkan-object layout-info-ptr))

;; With pipeline layout create info macro
(defwith with-pipeline-layout-create-info
  create-pipeline-layout-create-info
  destroy-pipeline-layout-create-info)


;; Creates a pipeline layout
(defun create-pipeline-layout (device set-layouts push-constant-ranges)
  (with-pipeline-layout-create-info layout-info-ptr (set-layouts push-constant-ranges)
    (let ((pipeline-layout-ptr (cffi:foreign-alloc 'VkPipelineLayout)))
      (check-vk-result (vkCreatePipelineLayout device layout-info-ptr (cffi:null-pointer)
					       pipeline-layout-ptr))
      (values (cffi:mem-ref pipeline-layout-ptr 'VkPipelineLayout) device))))

;; Destroys a pipeline layout
(defun destroy-pipeline-layout (pipeline-layout device)
  (vkDestroyPipelineLayout device pipeline-layout (cffi:null-pointer)))

;; With pipeline layout macro
(defwith with-pipeline-layout
  create-pipeline-layout
  destroy-pipeline-layout
  :destructor-arity 2)


(defun create-graphics-pipeline-create-info )
