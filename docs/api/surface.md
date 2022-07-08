# Surface

## Structs

---

### VkSurfaceCapabilitiesKHR

**Members**
* *minImageCount*: `uint32`
* *maxImageCount*: `uint32`
* *currentExtent*: `VkExtent2D`
* *minImageExtent*: `VkExtent2D`
* *maxImageExtent*: `VkExtent2D`
* *maxImageArrayLayers*: `uint32`
* *supportedTransforms*: `VkSurfaceTransformFlagsKHR`
* *currentTransform*: `VkSurfaceTransformFlagBitsKHR`
* *supportedCompositeAlpha*: `VkCompositeAlphaFlagsKHR`
* *supportedUsageFlags*: `VkImageUsageFlags`

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

