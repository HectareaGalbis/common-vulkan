
# Render pass

## create-attachment-description

```lisp
(create-attachment-description img-format img-samples load-op store-op stencil-load-op stencil-store-op initial-layout final-layout)
```

Creates an attachment description structure.

* **img-format**: It is a [VkFormat](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkFormat.html) value specifying the format of the image view that will be used for the attachment.
* **img-samples**: It is a [VkSampleCountFlagBits](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkSampleCountFlagBits.html) value specifying the number of samples of the image.
* **load-op**: It is a [VkAttachmentLoadOp](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkAttachmentLoadOp.html) value specifying how the contents of color and depth components of the attachment are treated at the beginning of the subpass where it is first used.
* **store-op**: It is a [VkAttachmentStoreOp](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkAttachmentStoreOp.html) value specifying how the contents of color and depth components of the attachment are treated at the end of the subpass where it is last used.
* **stencil-load-op**: It is a [VkAttachmentLoadOp](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkAttachmentLoadOp.html) value specifying how the contents of stencil components of the attachment are treated at the beginning of the subpass where it is first used.
* **stencil-store-op**: is a [VkAttachmentStoreOp](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkAttachmentStoreOp.html) value specifying how the contents of stencil components of the attachment are treated at the end of the last subpass where it is used.
* **initial-layout**: It is the layout the attachment image subresource will be in when a render pass instance begins.
* **final-layout**: It is the layout the attachment image subresource will be transitioned to when a render pass instance ends.

## destroy-attachment-description

```lisp
(destroy-attachment-description description)
```

Destroys an attachment description.

* **description**: An attachment description.

## with-attachment-description

```lisp
(with-attachment-description var (img-format img-samples load-op store-op stencil-load-op stencil-store-op initial-layout final-layout)
  &body body)
```

Wraps the `body` expressions with the creation and destruction of an attachment description. The new attachment description is bound to `var`. The arguments are passed to the constructor `create-attachment-description`.

## create-attachment-reference

```lisp
(create-attachment-reference attachment layout)
```

Creates an attachment reference.

* **attachment**: It is either an integer value identifying an attachment at the corresponding index in [VkRenderPassCreateInfo](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkRenderPassCreateInfo.html)::pAttachments, or VK_ATTACHMENT_UNUSED to signify that this attachment is not used.
* **layout**: It is a [VkImageLayout](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkImageLayout.html) value specifying the layout the attachment uses during the subpass.

## destroy-attachment-reference

```lisp
(destroy-attachment-reference attachment-ref)
```

Destroys an attachment reference.

* **attachment-ref**: An attachment reference.

## with-attachment-reference

```lisp
(with-attachment-reference var (attachment layout)
 &body body)
```

Wraps the body extression with the creation and destruction of an attachment reference. The new attachment reference is bound to `var` and the arguments are passed to the constructor `create-attachment-reference`.

## create-subpass-description

```lisp
(create-subpass-description pipeline-bind-point &key (input-attachments nil) (color-attachments nil) (resolve-attachments nil) (depth-stencil-attachment nil) (preserve-attachments nil))
```

Creates a subpass description.

* **pipeline-bind-point**: It is a [VkPipelineBindPoint](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkPipelineBindPoint.html) value specifying the pipeline type supported for this subpass.
* **input-attachments**: It is a list of attachment reference structures defining the input attachments for this subpass and their layouts.
* **color-attachments**: It is a list of attachment reference structures defining the color attachments for this subpass and their layouts.
* **resolve-attachments**: It is a list of attachment reference structures defining the resolve attachments for this subpass and their layouts.
* **depth-stencil-attachment**: It is an attachment reference structure specifying the depth/stencil attachment for this subpass and its layout.
* **preserve-attachments**: It is a list of attachment description indices identifying attachments that are not used by this subpass, but whose contents must be preserved throughout the subpass.

## destroy-subpass-description

```lisp
(destroy-subpass-description subpass-description)
```

Destroys a subpass description.

* **subpass-description**: A subpass description.

## with-subpass-description

```lisp
(with-subpass-description var (pipeline-bind-point &key (input-attachments nil) (color-attachments nil) (resolve-attachments nil) (depth-stencil-attachment nil) (preserve-attachments nil)
 &body body)
```

Wraps the body expression with the creation and destruction of a subpass description. The new subpass description is passed to `var` and the arguments are passed to the constructor `create-subpass-description`.

## create-subpass-dependency

```lisp
(create-subpass-dependency src-subpass dst-subpass src-stage-mask dst-stage-mask src-access-mask dst-access-mask dependency-flags)
```

Creates a subpass dependency structure.

* **src-subpass**: It is the subpass index of the first subpass in the dependency, or VK_SUBPASS_EXTERNAL.
* **dst-subpass**: It is the subpass index of the second subpass in the dependency, or VK_SUBPASS_EXTERNAL.
* **src-stage-mask**: It is a bitmask of [VkPipelineStageFlagBits](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkPipelineStageFlagBits.html) specifying the source stage mask.
* **dst-stage-mask**: It is a bitmask of [VkPipelineStageFlagBits](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkPipelineStageFlagBits.html) specifying the destination stage mask.
* **src-access-mask**: It is a bitmask of [VkAccessFlagBits](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkAccessFlagBits.html) specifying a source access mask.
* **dst-access-mask**: It is a bitmask of [VkAccessFlagBits](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkAccessFlagBits.html) specifying a destination access mask.
* **dependency-flags**: It is a bitmask of [VkDependencyFlagBits](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkDependencyFlagBits.html).

## destroy-subpass-dependency

```lisp
(destroy-subpass-dependency subpass-dependency)
```

Destroys a subpass dependency.

* **subpass-dependency**: A subpass dependency.

## with-subpass-dependency

```lisp
(with-subpass-dependency var (src-subpass dst-subpass src-stage-mask dst-stage-mask src-access-mask dst-access-mask dependency-flags)
  &body body)
```

Wraps the `body` expressions with the creation and destruction of a subpass dependency. The new subpass dependency is bound to `var`. The arguments are passed to the constructor `create-subpass-dependency`.

## create-render-pass

```lisp
(create-render-pass device attachments subpasses &optional (dependencies nil))
```

Creates a render pass.

* **device**: It is the logical device that creates the render pass.
* **attachments**: It is a list of attachment description structures describing the attachments used by the render pass.
* **subpasses**: It is a list of subpass description structures describing each subpass.
* **dependencies**: It is a list of subpass dependency structures describing dependencies between pairs of subpasses.

## destroy-render-pass

```lisp
(destroy-render-pass render-pass device)
```

Destroys a render pass.

* **render-pass**: The render pass to destroy.
* **device**: It is the logical device that destroys the render pass. 

## with-render-pass

```lisp
(with-render-pass var (device attachments subpasses &optional (dependencies nil))
  &body body)
```

Wraps the `body` expressions with the creation and destruction of a render pass. The new render pass is bound to `var`. The arguments are passed to the constructor `create-render-pass`.





