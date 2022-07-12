
# Render passes

## Setup

Create a new function named `create-render-pass` and call it from `init-vulkan` before the `create-graphics-pipeline` function.

```lisp
(defun create-render-pass (app)
  ...
  )

...

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (create-surface app)
  (pick-physical-device app)
  (create-logical-device app)
  (create-swap-chain app)
  (create-image-views app)
  (create-render-pass app)
  (create-graphics-pipeline app))
```

## Attachment description

We will have just a single color buffer attachment.

```lisp
(defun create-render-pass (app)
  (cvk:with-attachment-description color-attachment (:format (swap-chain-image-format app)
						     :samples cvk:VK_SAMPLE_COUNT_1_BIT
						     :loadOp cvk:VK_ATTACHMENT_LOAD_OP_CLEAR
						     :storeOp cvk:VK_ATTACHMENT_STORE_OP_STORE
						     :stencilLoadOp cvk:VK_ATTACHMENT_LOAD_OP_DONT_CARE
						     :stencilStoreOp cvk:VK_ATTACHMENT_STORE_OP_DONT_CARE
						     :initialLayout cvk:VK_IMAGE_LAYOUT_UNDEFINED
						     :finalLayout cvk:VK_IMAGE_LAYOUT_PRESENT_SRC_KHR)
    ...
    ))
```

## Subpasses and attachment references

Every subpass can use one or more attachments. In this case we will use only one, so we need just a single attachment reference.

```lisp
(cvk:with-attachment-reference color-attachment-ref (:attachment 0
						     :layout cvk:VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL)
  )
```

The subpass is described using a `VkSubpassDescription`:

```lisp
(cvk:with-attachment-reference color-attachment-ref (:attachment 0
 						     :layout cvk:VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL)
  (cvk:with-subpass-description subpass (:pipelineBindPoint cvk:VK_PIPELINE_BIND_POINT_GRAPHICS
					 :colorAttachmentCount 1
					 :pColorAttachments (list color-attachment-ref))
    ...
    ))
```

## Render pass

Add a class member to store the render pass.

```lisp
(defclass hello-triangle-application ()
  (...
   (render-pass :accessor render-pass :initform nil)
   (pipeline-layout :accessor pipeline-layout :initform nil)))
```

Now we can create the render pass

```lisp
(cvk:with-render-pass-create-info render-pass-info (:sType cvk:VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO
						    :attachmentCount 1
						    :pAttachments (list color-attachment)
						    :subpassCount 1
						    :pSubpasses (list subpass))
  (multiple-value-bind (render-pass result) (cvk:create-render-pass (device app) render-pass-info nil)
    (when (not (equal result cvk:VK_SUCCESS))
      (error "failed to create render pass!"))
    (setf (render-pass app) render-pass)))
```

Remember to destroy the render pass in the `creanup` function after the pipeline layout is destroyed.

```lisp
(defun cleanup (app)
  (cvk:destroy-pipeline-layout (device app) (pipeline-layout app) nil)
  (cvk:destroy-render-pass (device app) (render-pass app) nil)
  ...
  )
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/render-passes.lisp)

* **Next**: [Conclusion](https://hectarea1996.github.io/common-vulkan/guide/conclusion.html)
* **Previous**: [Fixed functions](https://hectarea1996.github.io/common-vulkan/guide/fixed-functions.html)
