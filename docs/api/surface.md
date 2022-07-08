# Surface

## Structs

---

### VkSurfaceCapabilitiesKHR

**Members**
* *minImageCount*: `uint32`
* *maxImageCount*: `uint32_t`
* *currentExtent*: `vkextent2d`
* *minImageExtent*: `vkextent2d`
* *maxImageExtent*: `vkextent2d`
* *maxImageArrayLayers*: `uint32_t`
* *supportedTransforms*: `vksurfacetransformflagskhr`
* *currentTransform*: `vksurfacetransformflagbitskhr`
* *supportedCompositeAlpha*: `vkcompositealphaflagskhr`
* *supportedUsageFlags*: `vkimageusageflags`

**Accessors**
```lisp
(surface-capabilities-minImageCount obj)
(surface-capabilities-maxImageCount obj)
(surface-capabilities-currentExtent obj)
(surface-capabilities-minImageExtent obj)
(surface-capabilities-maxImageExtent obj)
(surface-capabilities-maxImageArrayLayers obj)
(surface-capabilities-supportedTransforms obj)
(surface-capabilities-currentTransform obj)
(surface-capabilities-supportedCompositeAlpha obj)
(surface-capabilities-supportedUsageFlags obj)
```

---

### VkSurfaceFormatKHR

**Members**
* *format*: `VkFormat`
* *colorSpace*: `VkColorSpaceKHR`

**Accessors**
```lisp
(surface-format-format obj)
(surface-format-colorSpace obj)
```

## Functions

---

### vkDestroySurfaceKHR

**destroy-surface**
```lisp
(destroy-surface instance surface pAllocator)
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *surface*: `VkSurfaceKHR`
  * *pAllocator*: `VkAllocationCallbacks`

