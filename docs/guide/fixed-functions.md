
# Fixed functions

Get ready because there are a lot of structures in this chapter.

## The nest macro

Due to the great amount of structures we will create in this function using `with-` macros, the indentation can be a pain. To keep the code nesting and indentation under control, we are going to use the `nest` macro from the uiop package.

Change the currently `create-graphics-pipeline` function to the next one:

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    (cvk:with-spv-code (vert-shader-code vert-size) ((asdf:system-relative-pathname "common-vulkan-guide" "shaders/vert.spv")))
    (cvk:with-spv-code (frag-shader-code frag-size) ((asdf:system-relative-pathname "common-vulkan-guide" "shaders/frag.spv")))
    (let ((vert-shader-module (create-shader-module app vert-shader-code vert-size))
	  (frag-shader-module (create-shader-module app frag-shader-code frag-size))))
    (cvk:with-pipeline-shader-stage-create-info vert-shader-stage-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO
									:stage cvk:VK_SHADER_STAGE_VERTEX_BIT
									:module vert-shader-module
									:pName "main"))
    (cvk:with-pipeline-shader-stage-create-info frag-shader-stage-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO
									:stage cvk:VK_SHADER_STAGE_FRAGMENT_BIT
									:module frag-shader-module
									:pName "main"))
    (let ((shader-stages (list vert-shader-stage-info frag-shader-stage-info))))
    (progn
      (cvk:destroy-shader-module (device app) frag-shader-module nil)
      (cvk:destroy-shader-module (device app) vert-shader-module nil))))
```

This code is exactly the same as the one we had. But now the indentation is controlled. Let's start creating structures!

## Dynamic state

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (let ((shader-stages (list vert-shader-stage-info frag-shader-stage-info)))
          ((dynamic-states (list cvk:VK_DYNAMIC_STATE_VIEWPORT cvk:VK_DYNAMIC_STATE_SCISSOR))))
    (cvk:with-pipeline-dynamic-state-create-info dynamic-state (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO
								:dynamicStateCount (length dynamic-states)
								:pDynamicStates dynamic-states))
    ...
    ))
```

## Vertex input

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (cvk:with-pipeline-vertex-input-state-create-info vertex-input-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO
									 :vertexBindingDescriptionCount 0
									 :pVertexBindingDescriptions nil
									 :vertexAttributeDescriptionCount 0
									 :pVertexAttributeDescriptions nil))
    ...
    ))
```

## Input assembly

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (cvk:with-pipeline-input-assembly-state-create-info input-assembly (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO
									:topology cvk:VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST
									:primitiveRestartEnable cvk:VK_FALSE))
    ...
    ))
```

## Viewports and scissors

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (cvk:with-viewport viewport (:x 0.0
				 :y 0.0
				 :width (float (cvk:extent-2d-width (swap-chain-extent app)))
				 :height (float (cvk:extent-2d-height (swap-chain-extent app)))
				 :minDepth 0.0
				 :maxDepth 1.0))
    (cvk:with-offset-2d scissor-offset (:x 0
					:y 0))
    (cvk:with-rect-2d scissor (:offset scissor-offset
			       :extent (swap-chain-extent app)))
    (cvk:with-pipeline-viewport-state-create-info viewport-state (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO
								  :viewportCount 1
								  :pViewports (list viewport)
								  :scissorCount 1
								  :pScissors (list scissor)))
    ...
    ))
```

## Rasterizer

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (cvk:with-pipeline-rasterization-state-create-info rasterizer (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO
								   :depthClampEnable cvk:VK_FALSE
								   :rasterizerDiscardEnable cvk:VK_FALSE
								   :polygonMode cvk:VK_POLYGON_MODE_FILL
								   :lineWidth 1.0
								   :cullMode cvk:VK_CULL_MODE_BACK_BIT
								   :frontFace cvk:VK_FRONT_FACE_CLOCKWISE
								   :depthBiasEnable cvk:VK_FALSE
								   :depthBiasConstantFactor 0.0
								   :depthBiasClamp 0.0
								   :depthBiasSlopeFactor 0.0))
    ...
    ))
```

## Multisampling

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (cvk:with-pipeline-multisample-state-create-info multisampling (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO
								    :sampleShadingEnable cvk:VK_FALSE
								    :rasterizationSamples cvk:VK_SAMPLE_COUNT_1_BIT
								    :minSampleShading 1.0
								    :pSampleMask nil
								    :alphaToCoverageEnable cvk:VK_FALSE
								    :alphaToOneEnable cvk:VK_FALSE))
    ...
    ))
```

## Color blending

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (cvk:with-pipeline-color-blend-attachment-state color-blend-attachment (:colorWriteMask (logior cvk:VK_COLOR_COMPONENT_R_BIT
												    cvk:VK_COLOR_COMPONENT_G_BIT
												    cvk:VK_COLOR_COMPONENT_B_BIT
												    cvk:VK_COLOR_COMPONENT_A_BIT)
									    :blendEnable cvk:VK_FALSE
									    :srcColorBlendFactor cvk:VK_BLEND_FACTOR_ONE
									    :dstColorBlendFactor cvk:VK_BLEND_FACTOR_ZERO
									    :colorBlendOp cvk:VK_BLEND_OP_ADD
									    :srcAlphaBlendFactor cvk:VK_BLEND_FACTOR_ONE
									    :dstAlphaBlendFactor cvk:VK_BLEND_FACTOR_ZERO
									    :alphaBlendOp cvk:VK_BLEND_OP_ADD))
    (cvk:with-pipeline-color-blend-state-create-info color-blending (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO
								     :logicOpEnable cvk:VK_FALSE
								     :logicOp cvk:VK_LOGIC_OP_COPY
								     :attachmentCount 1
								     :pAttachments (list color-blend-attachment)
								     :blendConstants (list 0.0 0.0 0.0 0.0)))
    ...
    ))
```

## Pipeline layout

First add a class member to store the pipeline layout.

```lisp
(defclass hello-triangle-application ()
  (...
   (pipeline-layout :accessor pipeline-layout :initform nil)))
```

Create the object using `create-pipeline-layout`.

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (cvk:with-pipeline-layout-create-info pipeline-layout-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO
								:setLayoutCount 0
								:pSetLayouts nil
								:pushConstantRangeCount 0
								:pPushConstantRanges nil))
    (multiple-value-bind (pipeline-layout result) (cvk:create-pipeline-layout (device app) pipeline-layout-info nil))
    (progn
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to create pipeline layout!"))
      (setf (pipeline-layout app) pipeline-layout))
    (progn
      (cvk:destroy-shader-module (device app) frag-shader-module nil)
      (cvk:destroy-shader-module (device app) vert-shader-module nil))))
```

We can combine the last two `progn`s.

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (progn
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to create pipeline layout!"))
      (setf (pipeline-layout app) pipeline-layout))
      (cvk:destroy-shader-module (device app) frag-shader-module nil)
      (cvk:destroy-shader-module (device app) vert-shader-module nil)))
```

Finally, destroy the pipeline layout in the `cleanup` function.

```lisp
(defun cleanup (app)
  (cvk:destroy-pipeline-layout (device app) (pipeline-layout app) nil)
  ...
  )
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/fixed-functions.lisp)

* **Next**: [Render passes](https://hectarea1996.github.io/common-vulkan/guide/render-passes.html)
* **Previous**: [Shader modules](https://hectarea1996.github.io/common-vulkan/guide/shader-modules.html)
