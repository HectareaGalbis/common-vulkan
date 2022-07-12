# Miscellanea

## Structs

---

### VkOffset2D

**Members**
* *x*: `int32`
* *y*: `int32`

**create-offset-2d**
```lisp
(create-offset-2d &key
                    (x 0)
                    (y 0))
```

**destroy-offset-2d**
```lisp
(destroy-offset-2d obj)
```

**with-offset-2d**
```lisp
(with-offset-2d var (&rest args)
  &body body)
```
Wrap the body expressions with `create-offset-2d` and `destroy-offset-2d`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(offset-2d-x obj) ; setf-able
(offset-2d-y obj) ; setf-able
```

---

### VkExtent2D

**Members**
* *width*: `uint32`
* *height*: `uint32`

**create-extent-2d**
```lisp
(create-extent-2d &key
                    (width 0)
                    (height 0))
```

**destroy-extent-2d**
```lisp
(destroy-extent-2d obj)
```

**with-extent-2d**
```lisp
(with-extent-2d var (&rest args)
  &body body)
```
Wrap the body expressions with `create-extent-2d` and `destroy-extent-2d`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(extent-2d-width obj) ; setf-able
(extent-2d-height obj) ; setf-able
```

---

### VkRect2D

**Members**
* *offset*: `VkOffset2D`
* *extent*: `VkExtent2D`

**create-rect-2d**
```lisp
(create-rect-2d &key
                  (offset 0)
                  (extent 0))
```

**destroy-rect-2d**
```lisp
(destroy-rect-2d obj)
```

**with-rect-2d**
```lisp
(with-rect-2d var (&rest args)
  &body body)
```
Wrap the body expressions with `create-rect-2d` and `destroy-rect-2d`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(rect-2d-offset obj) ; setf-able
(rect-2d-extent obj) ; setf-able
```

---

### VkComponentMapping

**Members**
* *r*: `VkComponentSwizzle`
* *g*: `VkComponentSwizzle`
* *b*: `VkComponentSwizzle`
* *a*: `VkComponentSwizzle`

**create-component-mapping**
```lisp
(create-component-mapping &key
                            (r 0)
                            (g 0)
                            (b 0)
                            (a 0))
```

**destroy-component-mapping**
```lisp
(destroy-component-mapping obj)
```

**with-component-mapping**
```lisp
(with-component-mapping var (&rest args)
  &body body)
```
Wrap the body expressions with `create-component-mapping` and `destroy-component-mapping`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(component-mapping-r obj) ; setf-able
(component-mapping-g obj) ; setf-able
(component-mapping-b obj) ; setf-able
(component-mapping-a obj) ; setf-able
```

---

### VkImageSubresourceRange

**Members**
* *aspectMask*: `VkImageAspectFlags`
* *baseMipLevel*: `uint32`
* *levelCount*: `uint32`
* *baseArrayLayer*: `uint32`
* *layerCount*: `uint32`

**create-image-subresource-range**
```lisp
(create-image-subresource-range &key
                                  (aspectMask 0)
                                  (baseMipLevel 0)
                                  (levelCount 0)
                                  (baseArrayLayer 0)
                                  (layerCount 0))
```

**destroy-image-subresource-range**
```lisp
(destroy-image-subresource-range obj)
```

**with-image-subresource-range**
```lisp
(with-image-subresource-range var (&rest args)
  &body body)
```
Wrap the body expressions with `create-image-subresource-range` and `destroy-image-subresource-range`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(image-subresource-range-aspectMask obj) ; setf-able
(image-subresource-range-baseMipLevel obj) ; setf-able
(image-subresource-range-levelCount obj) ; setf-able
(image-subresource-range-baseArrayLayer obj) ; setf-able
(image-subresource-range-layerCount obj) ; setf-able
```

---

### VkSpecializationMapEntry

**Members**
* *constantID*: `uint32`
* *offset*: `uint32`
* *size*: `size`

**create-specialization-map-entry**
```lisp
(create-specialization-map-entry &key
                                   (constantID 0)
                                   (offset 0)
                                   (size 0))
```

**destroy-specialization-map-entry**
```lisp
(destroy-specialization-map-entry obj)
```

**with-specialization-map-entry**
```lisp
(with-specialization-map-entry var (&rest args)
  &body body)
```
Wrap the body expressions with `create-specialization-map-entry` and `destroy-specialization-map-entry`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(specialization-map-entry-constantID obj) ; setf-able
(specialization-map-entry-offset obj) ; setf-able
(specialization-map-entry-size obj) ; setf-able
```

---

### VkSpecializationInfo

**Members**
* *mapEntryCount*: `uint32`
* *pMapEntries*: `VkSpecializationMapEntry`
* *dataSize*: `size`
* *pData*: `void*`

**create-specialization-info**
```lisp
(create-specialization-info &key
                              (mapEntryCount 0)
                              (pMapEntries NIL)
                              (dataSize 0)
                              (pData 0))
```

**destroy-specialization-info**
```lisp
(destroy-specialization-info obj)
```

**with-specialization-info**
```lisp
(with-specialization-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-specialization-info` and `destroy-specialization-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(specialization-info-mapEntryCount obj) ; setf-able
(specialization-info-pMapEntries obj) ; setf-able
(specialization-info-dataSize obj) ; setf-able
(specialization-info-pData obj) ; setf-able
```

---

### VkViewport

**Members**
* *x*: `float`
* *y*: `float`
* *width*: `float`
* *height*: `float`
* *minDepth*: `float`
* *maxDepth*: `float`

**create-viewport**
```lisp
(create-viewport &key
                   (x 0)
                   (y 0)
                   (width 0)
                   (height 0)
                   (minDepth 0)
                   (maxDepth 0))
```

**destroy-viewport**
```lisp
(destroy-viewport obj)
```

**with-viewport**
```lisp
(with-viewport var (&rest args)
  &body body)
```
Wrap the body expressions with `create-viewport` and `destroy-viewport`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(viewport-x obj) ; setf-able
(viewport-y obj) ; setf-able
(viewport-width obj) ; setf-able
(viewport-height obj) ; setf-able
(viewport-minDepth obj) ; setf-able
(viewport-maxDepth obj) ; setf-able
```

---

### VkPushConstantRange

**Members**
* *stageFlags*: `VkShaderStageFlags`
* *offset*: `uint32`
* *size*: `uint32`

**create-push-constant-range**
```lisp
(create-push-constant-range &key
                              (stageFlags 0)
                              (offset 0)
                              (size 0))
```

**destroy-push-constant-range**
```lisp
(destroy-push-constant-range obj)
```

**with-push-constant-range**
```lisp
(with-push-constant-range var (&rest args)
  &body body)
```
Wrap the body expressions with `create-push-constant-range` and `destroy-push-constant-range`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(push-constant-range-stageFlags obj) ; setf-able
(push-constant-range-offset obj) ; setf-able
(push-constant-range-size obj) ; setf-able
```

---

### VkAttachmentDescription

**Members**
* *flags*: `VkAttachmentDescriptionFlags`
* *format*: `VkFormat`
* *samples*: `VkSampleCountFlagBits`
* *loadOp*: `VkAttachmentLoadOp`
* *storeOp*: `VkAttachmentStoreOp`
* *stencilLoadOp*: `VkAttachmentLoadOp`
* *stencilStoreOp*: `VkAttachmentStoreOp`
* *initialLayout*: `VkImageLayout`
* *finalLayout*: `VkImageLayout`

**create-attachment-description**
```lisp
(create-attachment-description &key
                                 (flags 0)
                                 (format 0)
                                 (samples 0)
                                 (loadOp 0)
                                 (storeOp 0)
                                 (stencilLoadOp 0)
                                 (stencilStoreOp 0)
                                 (initialLayout 0)
                                 (finalLayout 0))
```

**destroy-attachment-description**
```lisp
(destroy-attachment-description obj)
```

**with-attachment-description**
```lisp
(with-attachment-description var (&rest args)
  &body body)
```
Wrap the body expressions with `create-attachment-description` and `destroy-attachment-description`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(attachment-description-flags obj) ; setf-able
(attachment-description-format obj) ; setf-able
(attachment-description-samples obj) ; setf-able
(attachment-description-loadOp obj) ; setf-able
(attachment-description-storeOp obj) ; setf-able
(attachment-description-stencilLoadOp obj) ; setf-able
(attachment-description-stencilStoreOp obj) ; setf-able
(attachment-description-initialLayout obj) ; setf-able
(attachment-description-finalLayout obj) ; setf-able
```

---

### VkAttachmentReference

**Members**
* *attachment*: `uint32`
* *layout*: `VkImageLayout`

**create-attachment-reference**
```lisp
(create-attachment-reference &key
                               (attachment 0)
                               (layout 0))
```

**destroy-attachment-reference**
```lisp
(destroy-attachment-reference obj)
```

**with-attachment-reference**
```lisp
(with-attachment-reference var (&rest args)
  &body body)
```
Wrap the body expressions with `create-attachment-reference` and `destroy-attachment-reference`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(attachment-reference-attachment obj) ; setf-able
(attachment-reference-layout obj) ; setf-able
```

---

### VkSubpassDescription

**Members**
* *flags*: `VkSubpassDescriptionFlags`
* *pipelineBindPoint*: `VkPipelineBindPoint`
* *inputAttachmentCount*: `uint32`
* *pInputAttachments*: `(list VkAttachmentReference)`
* *colorAttachmentCount*: `uint32`
* *pColorAttachments*: `(list VkAttachmentReference)`
* *pResolveAttachments*: `(list VkAttachmentReference)`
* *pdepthstencilattachment*: `VkAttachmentReference`
* *preserveAttachmentCount*: `uint32`
* *pPreserveAttachments*: `(list VkAttachmentReference)`

**create-subpass-description**
```lisp
(create-subpass-description &key
                              (flags 0)
                              (pipelineBindPoint 0)
                              (inputAttachmentCount 0)
                              (pInputAttachments NIL)
                              (colorAttachmentCount 0)
                              (pColorAttachments NIL)
                              (pResolveAttachments NIL)
                              (pdepthstencilattachment NIL)
                              (preserveAttachmentCount 0)
                              (pPreserveAttachments NIL))
```

**destroy-subpass-description**
```lisp
(destroy-subpass-description obj)
```

**with-subpass-description**
```lisp
(with-subpass-description var (&rest args)
  &body body)
```
Wrap the body expressions with `create-subpass-description` and `destroy-subpass-description`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(subpass-description-flags obj) ; setf-able
(subpass-description-pipelineBindPoint obj) ; setf-able
(subpass-description-inputAttachmentCount obj) ; setf-able
(subpass-description-pInputAttachments obj &optional (index nil)) ; setf-able
(subpass-description-colorAttachmentCount obj) ; setf-able
(subpass-description-pColorAttachments obj &optional (index nil)) ; setf-able
(subpass-description-pResolveAttachments obj &optional (index nil)) ; setf-able
(subpass-description-pdepthstencilattachment obj) ; setf-able
(subpass-description-preserveAttachmentCount obj) ; setf-able
(subpass-description-pPreserveAttachments obj &optional (index nil)) ; setf-able
```

---

### VkSubpassDependency

**Members**
* *srcSubpass*: `uint32`
* *dstSubpass*: `uint32`
* *srcStageMask*: `VkPipelineStageFlags`
* *dstStageMask*: `VkPipelineStageFlags`
* *srcAccessMask*: `VkAccessFlags`
* *dstAccessMask*: `VkAccessFlags`
* *dependencyFlags*: `VkDependencyFlags`

**create-subpass-dependency**
```lisp
(create-subpass-dependency &key
                             (srcSubpass 0)
                             (dstSubpass 0)
                             (srcStageMask 0)
                             (dstStageMask 0)
                             (srcAccessMask 0)
                             (dstAccessMask 0)
                             (dependencyFlags 0))
```

**destroy-subpass-dependency**
```lisp
(destroy-subpass-dependency obj)
```

**with-subpass-dependency**
```lisp
(with-subpass-dependency var (&rest args)
  &body body)
```
Wrap the body expressions with `create-subpass-dependency` and `destroy-subpass-dependency`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(subpass-dependency-srcSubpass obj) ; setf-able
(subpass-dependency-dstSubpass obj) ; setf-able
(subpass-dependency-srcStageMask obj) ; setf-able
(subpass-dependency-dstStageMask obj) ; setf-able
(subpass-dependency-srcAccessMask obj) ; setf-able
(subpass-dependency-dstAccessMask obj) ; setf-able
(subpass-dependency-dependencyFlags obj) ; setf-able
```

## Functions

---

### create-spv-code

**create-spv-code**
```lisp
(create-spv-code file) => (values code size)
```

* *Parameters*:
  * *file*: `pathname designator`

* *Return:*
  * *code*: `spv code`
  * *size*: `uint`

---

### destroy-spv-code

**destroy-spv-code**
```lisp
(destroy-spv-code code)
```

* *Parameters*:
  * *code*: `spv code`

---

### with-spv-code

**with-spv-code**
```lisp
(with-spv-code var (&rest args)
  &body body)
```
Wrap the body expressions with `create-spv-code` and `destroy-spv-code`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

