# Render pass

## Structs

---

### VkRenderPassCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkRenderPassCreateFlags`
* *attachmentCount*: `uint32`
* *pAttachments*: `(list VkAttachmentDescription)`
* *subpassCount*: `uint32`
* *pSubpasses*: `(list VkSubpassDescription)`
* *dependencyCount*: `uint32`
* *pDependencies*: `(list VkSubpassDependency)`

**create-render-pass-create-info**
```lisp
(create-render-pass-create-info &key
                                  (sType VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO)
                                  (pNext NIL)
                                  (flags 0)
                                  (attachmentCount 0)
                                  (pAttachments NIL)
                                  (subpassCount 0)
                                  (pSubpasses NIL)
                                  (dependencyCount 0)
                                  (pDependencies NIL))
```

**destroy-render-pass-create-info**
```lisp
(destroy-render-pass-create-info obj)
```

**with-render-pass-create-info**
```lisp
(with-render-pass-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-render-pass-create-info` and `destroy-render-pass-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(render-pass-create-info-sType obj) ; setf-able
(render-pass-create-info-pNext obj) ; setf-able
(render-pass-create-info-flags obj) ; setf-able
(render-pass-create-info-attachmentCount obj) ; setf-able
(render-pass-create-info-pAttachments obj &optional (index nil)) ; setf-able
(render-pass-create-info-subpassCount obj) ; setf-able
(render-pass-create-info-pSubpasses obj &optional (index nil)) ; setf-able
(render-pass-create-info-dependencyCount obj) ; setf-able
(render-pass-create-info-pDependencies obj &optional (index nil)) ; setf-able
```

## Functions

---

### vkCreateRenderPass

**create-render-pass**
```lisp
(create-render-pass device pCreateInfo pAllocator) => (values pRenderPass result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkRenderPassCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pRenderPass*: `VkRenderPass`
  * *result*: `VkResult`

---

### vkDestroyRenderPass

**destroy-render-pass**
```lisp
(destroy-render-pass device renderPass pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *renderPass*: `VkRenderPass`
  * *pAllocator*: `VkAllocationCallbacks`

---

### with-render-pass

**with-render-pass**
```lisp
(with-render-pass var (&rest args)
  &body body)
```
Wrap the body expressions with `create-render-pass` and `destroy-render-pass`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

