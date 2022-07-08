# Miscellanea

## Structs

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

