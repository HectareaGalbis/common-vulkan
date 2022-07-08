# Image view

## Structs

---

### VkImageViewCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkImageViewCreateFlags`
* *image*: `VkImage`
* *viewType*: `VkImageViewType`
* *format*: `VkFormat`
* *components*: `VkComponentSwizzle`
* *subresourceRange*: `VkImageSubresourceRange`

**create-image-view-create-info**
```lisp
(create-image-view-create-info &key
                                 (sType VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO)
                                 (pNext NIL)
                                 (flags 0)
                                 (image 0)
                                 (viewType 0)
                                 (format 0)
                                 (components 0)
                                 (subresourceRange 0))
```

**destroy-image-view-create-info**
```lisp
(destroy-image-view-create-info obj)
```

**with-image-view-create-info**
```lisp
(with-image-view-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-image-view-create-info` and `destroy-image-view-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(image-view-create-info-sType obj) ; setf-able
(image-view-create-info-pNext obj) ; setf-able
(image-view-create-info-flags obj) ; setf-able
(image-view-create-info-image obj) ; setf-able
(image-view-create-info-viewType obj) ; setf-able
(image-view-create-info-format obj) ; setf-able
(image-view-create-info-components obj) ; setf-able
(image-view-create-info-subresourceRange obj) ; setf-able
```

## Functions

---

### vkCreateImageView

**create-image-view**
```lisp
(create-image-view device pCreateInfo pAllocator) => pView
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkImageViewCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pView*: `VkImageView`

---

### vkDestroyImageView

**destroy-image-view**
```lisp
(destroy-image-view device imageView pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *imageView*: `VkImageView`
  * *pAllocator*: `VkAllocationCallbacks`

---

### with-image-view

**with-image-view**
```lisp
(with-image-view var (&rest args)
  &body body)
```
Wrap the body expressions with `create-image-view` and `destroy-image-view`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

