
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
