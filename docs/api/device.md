# Device

## Structs

### VkDeviceQueueCreateInfo

**Members**
* *sType*: `VkStrutureType`
* *pNext*: `pointer`
* *flags*: `VkDeviceQueueCreateFlags`
* *queueFamilyIndex*: `uint32`
* *queueCount*: `uint32`
* *pQueuePriorities*: `(list float)`

**create-device-queue-create-info**
```lisp
(create-device-queue-create-info &key
                                   (sType VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO)
                                   (pNext NIL)
                                   (flags 0)
                                   (queueFamilyIndex 0)
                                   (queueCount 0)
                                   (pQueuePriorities 0))
```

**destroy-device-queue-create-info**
```lisp
(destroy-device-queue-create-info obj)
```

**with-device-queue-create-info**
```lisp
(with-device-queue-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-device-queue-create-info` and `destroy-device-queue-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(device-queue-create-info-sType obj) ; setf-able
(device-queue-create-info-pNext obj) ; setf-able
(device-queue-create-info-flags obj) ; setf-able
(device-queue-create-info-queueFamilyIndex obj) ; setf-able
(device-queue-create-info-queueCount obj) ; setf-able
(device-queue-create-info-pQueuePriorities obj &optional (index nil)) ; setf-able
```

### VkDeviceCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkDeviceCreateFlags`
* *queueCreateInfoCount*: `uint32`
* *pQueueCreateInfos*: `(list VkDeviceQueueCreateInfo)`
* *enabledLayerCount*: `uint32`
* *ppEnabledLayerNames*: `(list string)`
* *enabledExtensionCount*: `uint32`
* *ppEnabledExtensionNames*: `(list string)`
* *pEnabledFeatures*: `VkPhysicalDeviceFeatures`

**create-device-create-info**
```lisp
(create-device-create-info &key
                             (sType VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO)
                             (pNext NIL)
                             (flags 0)
                             (queueCreateInfoCount 0)
                             (pQueueCreateInfos NIL)
                             (enabledLayerCount 0)
                             (ppEnabledLayerNames NIL)
                             (enabledExtensionCount 0)
                             (ppEnabledExtensionNames NIL)
                             (pEnabledFeatures NIL))
```

**destroy-device-create-info**
```lisp
(destroy-device-create-info obj)
```

**with-device-create-info**
```lisp
(with-device-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-device-create-info` and `destroy-device-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(device-create-info-sType obj) ; setf-able
(device-create-info-pNext obj) ; setf-able
(device-create-info-flags obj) ; setf-able
(device-create-info-queueCreateInfoCount obj) ; setf-able
(device-create-info-pQueueCreateInfos obj &optional (index nil)) ; setf-able
(device-create-info-enabledLayerCount obj) ; setf-able
(device-create-info-ppEnabledLayerNames obj &optional (index nil)) ; setf-able
(device-create-info-enabledExtensionCount obj) ; setf-able
(device-create-info-ppEnabledExtensionNames obj &optional (index nil)) ; setf-able
(device-create-info-pEnabledFeatures obj) ; setf-able
```

## Functions

### vkCreateDevice

**create-device**
```lisp
(create-device physicalDevice pCreateInfo pAllocator) => (values device result)
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pCreateInfo*: `VkDeviceCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *device*: `VkDevice`
  * *result*: `VkResult`

### vkDestroyDevice

**destroy-device**
```lisp
(destroy-device device pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pAllocator*: `VkAllocationCallbacks`

### with-device

**with-device**
```lisp
(with-device var (&rest args)
  &body body)
```
Wrap the body expressions with `create-device` and `destroy-device`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

### vkGetDeviceQueue

**get-device-queue**
```lisp
(get-device-queue device queueFamilyIndex queueIndex) => queue
```

* *Parameters*:
  * *device*: `VkDevice`
  * *queueFamilyIndex*: `uint32`
  * *queueIndex*: `uint32`

* *Return:*
  * *queue*: `VkQueue`

