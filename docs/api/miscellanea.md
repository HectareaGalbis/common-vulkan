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

