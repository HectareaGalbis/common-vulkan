# Swapchain

## Structs

---

### VkSwapchainCreateInfoKHR

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkSwapchainCreateFlagsKHR`
* *surface*: `VkSurfaceKHR`
* *minImageCount*: `uint32`
* *imageFormat*: `VkFormat`
* *imageColorSpace*: `VkColorSpaceKHR`
* *imageExtent*: `VkExtent2D`
* *imageArrayLayers*: `uint32`
* *imageUsage*: `VkImageUsageFlags`
* *imageSharingMode*: `VkSharingMode`
* *queueFamilyIndexCount*: `uint32`
* *pQueueFamilyIndices*: `(list uint32)`
* *preTransform*: `VkSurfaceTransformFlagBitsKHR`
* *compositeAlpha*: `VkCompositeAlphaFlagBitsKHR`
* *presentMode*: `VkPresentModeKHR`
* *clipped*: `VkBool32`
* *oldSwapchain*: `VkSwapchainKHR`

**create-swapchain-create-info**
```lisp
(create-swapchain-create-info &key
                                (sType VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR)
                                (pNext NIL)
                                (flags 0)
                                (surface 0)
                                (minImageCount 0)
                                (imageFormat 0)
                                (imageColorSpace 0)
                                (imageExtent NIL)
                                (imageArrayLayers 0)
                                (imageUsage 0)
                                (imageSharingMode 0)
                                (queueFamilyIndexCount 0)
                                (pQueueFamilyIndices NIL)
                                (preTransform 0)
                                (compositeAlpha 0)
                                (presentMode 0)
                                (clipped 0)
                                (oldSwapchain 0))
```

**destroy-swapchain-create-info**
```lisp
(destroy-swapchain-create-info obj)
```

**with-swapchain-create-info**
```lisp
(with-swapchain-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-swapchain-create-info` and `destroy-swapchain-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(swapchain-create-info-sType obj) ; setf-able
(swapchain-create-info-pNext obj) ; setf-able
(swapchain-create-info-flags obj) ; setf-able
(swapchain-create-info-surface obj) ; setf-able
(swapchain-create-info-minImageCount obj) ; setf-able
(swapchain-create-info-imageFormat obj) ; setf-able
(swapchain-create-info-imageColorSpace obj) ; setf-able
(swapchain-create-info-imageExtent obj) ; setf-able
(swapchain-create-info-imageArrayLayers obj) ; setf-able
(swapchain-create-info-imageUsage obj) ; setf-able
(swapchain-create-info-imageSharingMode obj) ; setf-able
(swapchain-create-info-queueFamilyIndexCount obj) ; setf-able
(swapchain-create-info-pQueueFamilyIndices obj &optional (index nil)) ; setf-able
(swapchain-create-info-preTransform obj) ; setf-able
(swapchain-create-info-compositeAlpha obj) ; setf-able
(swapchain-create-info-presentMode obj) ; setf-able
(swapchain-create-info-clipped obj) ; setf-able
(swapchain-create-info-oldSwapchain obj) ; setf-able
```

## Functions

---

### vkCreateSwapchainKHR

**create-swapchain**
```lisp
(create-swapchain device pCreateInfo pAllocator) => (values pSwapchain result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkSwapchainCreateInfoKHR`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pSwapchain*: `VkSwapchainKHR`
  * *result*: `VkResult`

---

### vkDestroySwapchainKHR

**destroy-swapchain**
```lisp
(destroy-swapchain device swapchain pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchain*: `VkSwapchainKHR`
  * *pAllocator*: `VkAllocationCallbacks`

---

### with-swapchain

**with-swapchain**
```lisp
(with-swapchain var (&rest args)
  &body body)
```
Wrap the body expressions with `create-swapchain` and `destroy-swapchain`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

---

### vkGetSwapchainImagesKHR

**get-swapchain-images**
```lisp
(get-swapchain-images device swapchain) => pswapchainimages
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchain*: `VkSwapchainKHR`

* *Return:*
  * *pswapchainimages*: `(list VkImage)`

