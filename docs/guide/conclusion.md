
# Conclusion

Now we can combine all of the structures from the previous chapters to create the graphics pipeline. Create a `VkGraphicsPipelineCreateInfo` at the end of the `create-graphics-pipeline` function, but before the calls to `destroy-shader-module`.

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (multiple-value-bind (pipeline-layout result) (cvk:create-pipeline-layout (device app) pipeline-layout-info nil))
    (progn
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to create pipeline layout!"))
      (setf (pipeline-layout app) pipeline-layout))
    (cvk:with-graphics-pipeline-create-info pipeline-info (:sType cvk:VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO
							   :stageCount 2
							   :pStages shader-stages
							   :pVertexInputState vertex-input-info
							   :pInputAssemblyState input-assembly
							   :pViewportState viewport-state
							   :pRasterizationState rasterizer
							   :pMultisampleState multisampling
							   :pDepthStencilState nil
							   :pColorBlendState color-blending
							   :pDynamicState dynamic-state
							   :layout pipeline-layout
							   :renderPass (render-pass app)
							   :subpass 0
							   :basePipelineHandle nil
							   :basePipelineIndex -1))
    (progn
      (cvk:destroy-shader-module (device app) frag-shader-module nil)
      (cvk:destroy-shader-module (device app) vert-shader-module nil))))
```

Add a class member to store the graphics pipeline.

```lisp
(defclass hello-triangle-application ()
  (...
   (graphics-pipeline :accessor graphics-pipeline :initform nil)))
```

And finally create the graphics pipeline:

```lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
    ...
    (cvk:with-graphics-pipeline-create-info pipeline-info (:sType cvk:VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO
							   :stageCount 2
							   :pStages shader-stages
							   :pVertexInputState vertex-input-info
							   :pInputAssemblyState input-assembly
							   :pViewportState viewport-state
							   :pRasterizationState rasterizer
							   :pMultisampleState multisampling
							   :pDepthStencilState nil
							   :pColorBlendState color-blending
							   :pDynamicState dynamic-state
							   :layout pipeline-layout
							   :renderPass (render-pass app)
							   :subpass 0
							   :basePipelineHandle nil
							   :basePipelineIndex -1))
    (multiple-value-bind (graphics-pipelines result) (cvk:create-graphics-pipelines (device app) nil (list pipeline-info) nil))
    (progn
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to create graphics pipeline!"))
      (setf (graphics-pipeline app) (car graphics-pipelines))
      (cvk:destroy-shader-module (device app) frag-shader-module nil)
      (cvk:destroy-shader-module (device app) vert-shader-module nil))))
```

Destroy the graphics pipeline in the `cleanup` function.

```lisp
(defun cleanup (app)
  (cvk:destroy-pipeline (device app) (graphics-pipeline app) nil)
  ...
  )
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/conclusion.lisp)

* **Next**: [Framebuffers](https://hectarea1996.github.io/common-vulkan/guide/framebuffers.html)
* **Previous**: [Render passes](https://hectarea1996.github.io/common-vulkan/guide/render-passes.html)
