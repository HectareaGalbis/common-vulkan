## vkCreateInstance

**create-instance**
```lisp
(create-instance pCreateInfo pAllocator) => (values instance result)
```

* *Parameters*:
  * *pCreateInfo*: `VkInstanceCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *instance*: `VkInstance`
  * *result*: `VkResult`

## vkDestroyInstance

**destroy-instance**
```lisp
(destroy-instance instance pAllocator)
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *pAllocator*: `VkAllocationCallbacks`

**with-instance**
```lisp
(with-instance var (&rest args)
  &body body)
```
Wrap the body expressions with `create-instance` and `destroy-instance`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

* **Note**: The allocator is passed to both constructor and destructor.

## vkEnumeratePhysicalDevices

**enumerate-physical-devices**
```lisp
(enumerate-physical-devices instance) => (values pPhysicalDevices result)
```

* *Parameters*:
  * *instance*: `VkInstance`

* *Return:*
  * *pPhysicalDevices*: `(list VkPhysicalDevice)`
  * *result*: `VkResult`

## vkGetPhysicalDeviceFeatures

**create-get-physical-device-features**
```lisp
(create-get-physical-device-features physicalDevice) => pfeatures
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`

* *Return:*
  * *pfeatures*: `VkPhysicalDeviceFeatures`

## destroy-get-physical-device-features

**destroy-get-physical-device-features**
```lisp
(destroy-get-physical-device-features pFeatures)
```

* *Parameters*:
  * *pFeatures*: `VkPhysicalDeviceFeatures`

**with-get-physical-device-features**
```lisp
(with-get-physical-device-features var (&rest args)
  &body body)
```
Wrap the body expressions with `create-get-physical-device-features` and `destroy-get-physical-device-features`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkGetPhysicalDeviceFormatProperties

**get-physical-device-format-properties**
```lisp
(get-physical-device-format-properties physicalDevice format pFormatProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *format*: `VkFormat`
  * *pFormatProperties*: `VkFormatProperties`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceImageFormatProperties

**get-physical-device-image-format-properties**
```lisp
(get-physical-device-image-format-properties physicalDevice format type tiling usage flags pImageFormatProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *format*: `VkFormat`
  * *type*: `VkImageType`
  * *tiling*: `VkImageTiling`
  * *usage*: `VkImageUsageFlags`
  * *flags*: `VkImageCreateFlags`
  * *pImageFormatProperties*: `VkImageFormatProperties`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceProperties

**create-get-physical-device-properties**
```lisp
(create-get-physical-device-properties physicalDevice) => pProperties
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`

* *Return:*
  * *pProperties*: `VkPhysicalDeviceProperties`

## destroy-get-physical-device-properties

**destroy-get-physical-device-properties**
```lisp
(destroy-get-physical-device-properties pProperties)
```

* *Parameters*:
  * *pProperties*: `VkPhysicalDeviceProperties`

**with-get-physical-device-properties**
```lisp
(with-get-physical-device-properties var (&rest args)
  &body body)
```
Wrap the body expressions with `create-get-physical-device-properties` and `destroy-get-physical-device-properties`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkGetPhysicalDeviceQueueFamilyProperties

**create-get-physical-device-queue-family-properties**
```lisp
(create-get-physical-device-queue-family-properties physicalDevice) => pQueueFamilyProperties
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`

* *Return:*
  * *pQueueFamilyProperties*: `(list VkQueueFamilyProperties)`

## destroy-get-physical-device-queue-family-properties

**destroy-get-physical-device-queue-family-properties**
```lisp
(destroy-get-physical-device-queue-family-properties pqueuefamilyproperties)
```

* *Parameters*:
  * *pqueuefamilyproperties*: `(list VkQueueFamilyProperties)`

**with-get-physical-device-queue-family-properties**
```lisp
(with-get-physical-device-queue-family-properties var (&rest args)
  &body body)
```
Wrap the body expressions with `create-get-physical-device-queue-family-properties` and `destroy-get-physical-device-queue-family-properties`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkGetPhysicalDeviceMemoryProperties

**create-get-physical-device-memory-properties**
```lisp
(create-get-physical-device-memory-properties physicalDevice) => pMemoryProperties
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`

* *Return:*
  * *pMemoryProperties*: `VkPhysicalDeviceMemoryProperties`

## destroy-get-physical-device-memory-properties

**destroy-get-physical-device-memory-properties**
```lisp
(destroy-get-physical-device-memory-properties pMemoryProperties)
```

* *Parameters*:
  * *pMemoryProperties*: `VkPhysicalDeviceMemoryProperties`

**with-get-physical-device-memory-properties**
```lisp
(with-get-physical-device-memory-properties var (&rest args)
  &body body)
```
Wrap the body expressions with `create-get-physical-device-memory-properties` and `destroy-get-physical-device-memory-properties`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkGetInstanceProcAddr

**get-instance-proc-addr**
```lisp
(get-instance-proc-addr instance pName) => result
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *pName*: `string`

* *Return:*
  * *result*: `function`

## vkGetDeviceProcAddr

**get-device-proc-addr**
```lisp
(get-device-proc-addr device pName) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pName*: `char`

* *Return:*
  * *return-value*: `PFN_vkVoidFunction`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateDevice

**create-device**
```lisp
(create-device physicalDevice pCreateInfo pAllocator) => (values pDevice result)
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pCreateInfo*: `VkDeviceCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pDevice*: `VkDevice`
  * *result*: `VkResult`

## vkDestroyDevice

**destroy-device**
```lisp
(destroy-device device pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pAllocator*: `VkAllocationCallbacks`

**with-device**
```lisp
(with-device var (&rest args)
  &body body)
```
Wrap the body expressions with `create-device` and `destroy-device`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkEnumerateInstanceExtensionProperties

**create-enumerate-instance-extension-properties**
```lisp
(create-enumerate-instance-extension-properties pLayerName) => extension-props
```

* *Parameters*:
  * *pLayerName*: `string`

* *Return:*
  * *extension-props*: `(list VkExtensionProperties)`

## destroy-enumerate-instance-extension-properties

**destroy-enumerate-instance-extension-properties**
```lisp
(destroy-enumerate-instance-extension-properties extension-props)
```

* *Parameters*:
  * *extension-props*: `(list VkExtensionProperties)`

**with-enumerate-instance-extension-properties**
```lisp
(with-enumerate-instance-extension-properties var (&rest args)
  &body body)
```
Wrap the body expressions with `create-enumerate-instance-extension-properties` and `destroy-enumerate-instance-extension-properties`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkEnumerateDeviceExtensionProperties

**create-enumerate-device-extension-properties**
```lisp
(create-enumerate-device-extension-properties physicalDevice pLayerName) => (values pProperties result)
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pLayerName*: `string`

* *Return:*
  * *pProperties*: `(list VkExtensionProperties)`
  * *result*: `VkResult`

## destroy-enumerate-device-extension-properties

**destroy-enumerate-device-extension-properties**
```lisp
(destroy-enumerate-device-extension-properties pProperties)
```

* *Parameters*:
  * *pProperties*: `(list VkExtensionProperties)`

**with-enumerate-device-extension-properties**
```lisp
(with-enumerate-device-extension-properties var (&rest args)
  &body body)
```
Wrap the body expressions with `create-enumerate-device-extension-properties` and `destroy-enumerate-device-extension-properties`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkEnumerateInstanceLayerProperties

**create-enumerate-instance-layer-properties**
```lisp
(create-enumerate-instance-layer-properties) => layer-props
```

* *Return:*
  * *layer-props*: `(list VkLayerProperties)`

## destroy-enumerate-instance-layer-properties

**destroy-enumerate-instance-layer-properties**
```lisp
(destroy-enumerate-instance-layer-properties layer-props)
```

* *Parameters*:
  * *layer-props*: `(list VkLayerProperties)`

**with-enumerate-instance-layer-properties**
```lisp
(with-enumerate-instance-layer-properties var (&rest args)
  &body body)
```
Wrap the body expressions with `create-enumerate-instance-layer-properties` and `destroy-enumerate-instance-layer-properties`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkEnumerateDeviceLayerProperties

**enumerate-device-layer-properties**
```lisp
(enumerate-device-layer-properties physicalDevice pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkLayerProperties`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceQueue

**get-device-queue**
```lisp
(get-device-queue device queueFamilyIndex queueIndex) => pQueue
```

* *Parameters*:
  * *device*: `VkDevice`
  * *queueFamilyIndex*: `uint32`
  * *queueIndex*: `uint32`

* *Return:*
  * *pQueue*: `VkQueue`

## vkQueueSubmit

**queue-submit**
```lisp
(queue-submit queue pSubmits fence) => result
```

* *Parameters*:
  * *queue*: `VkQueue`
  * *pSubmits*: `VkSubmitInfo`
  * *fence*: `VkFence`

* *Return:*
  * *result*: `VkResult`

## vkQueueWaitIdle

**queue-wait-idle**
```lisp
(queue-wait-idle queue) => return-value
```

* *Parameters*:
  * *queue*: `VkQueue`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDeviceWaitIdle

**device-wait-idle**
```lisp
(device-wait-idle device) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkAllocateMemory

**allocate-memory**
```lisp
(allocate-memory device pAllocateInfo pAllocator) => (values pMemory result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pAllocateInfo*: `VkMemoryAllocateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pMemory*: `VkDeviceMemory`
  * *result*: `VkResult`

## vkFreeMemory

**free-memory**
```lisp
(free-memory device memory pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *memory*: `VkDeviceMemory`
  * *pAllocator*: `VkAllocationCallbacks`

**with-allocated-memory**
```lisp
(with-allocated-memory var (&rest args)
  &body body)
```
Wrap the body expressions with `allocate-memory` and `free-memory`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkMapMemory

**map-memory**
```lisp
(map-memory device memory offset size flags) => (values ppData result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *memory*: `VkDeviceMemory`
  * *offset*: `VkDeviceSize`
  * *size*: `VkDeviceSize`
  * *flags*: `VkMemoryMapFlags`

* *Return:*
  * *ppData*: `Data pointer`
  * *result*: `VkResult`

## vkUnmapMemory

**unmap-memory**
```lisp
(unmap-memory device memory)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *memory*: `VkDeviceMemory`

**with-mapped-memory**
```lisp
(with-mapped-memory var (&rest args)
  &body body)
```
Wrap the body expressions with `map-memory` and `unmap-memory`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkFlushMappedMemoryRanges

**flush-mapped-memory-ranges**
```lisp
(flush-mapped-memory-ranges device memoryRangeCount pMemoryRanges) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *memoryRangeCount*: `uint32`
  * *pMemoryRanges*: `VkMappedMemoryRange`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkInvalidateMappedMemoryRanges

**invalidate-mapped-memory-ranges**
```lisp
(invalidate-mapped-memory-ranges device memoryRangeCount pMemoryRanges) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *memoryRangeCount*: `uint32`
  * *pMemoryRanges*: `VkMappedMemoryRange`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceMemoryCommitment

**get-device-memory-commitment**
```lisp
(get-device-memory-commitment device memory pCommittedMemoryInBytes) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *memory*: `VkDeviceMemory`
  * *pCommittedMemoryInBytes*: `VkDeviceSize`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkBindBufferMemory

**bind-buffer-memory**
```lisp
(bind-buffer-memory device buffer memory memoryOffset) => result
```

* *Parameters*:
  * *device*: `VkDevice`
  * *buffer*: `VkBuffer`
  * *memory*: `VkDeviceMemory`
  * *memoryOffset*: `VkDeviceSize`

* *Return:*
  * *result*: `VkResult`

## vkBindImageMemory

**bind-image-memory**
```lisp
(bind-image-memory device image memory memoryOffset) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *image*: `VkImage`
  * *memory*: `VkDeviceMemory`
  * *memoryOffset*: `VkDeviceSize`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetBufferMemoryRequirements

**create-get-buffer-memory-requirements**
```lisp
(create-get-buffer-memory-requirements device buffer) => pMemoryRequirements
```

* *Parameters*:
  * *device*: `VkDevice`
  * *buffer*: `VkBuffer`

* *Return:*
  * *pMemoryRequirements*: `VkMemoryRequirements`

## destroy-get-buffer-memory-requirements

**destroy-get-buffer-memory-requirements**
```lisp
(destroy-get-buffer-memory-requirements pMemoryRequirements)
```

* *Parameters*:
  * *pMemoryRequirements*: `VkMemoryRequirements`

**with-get-buffer-memory-requirements**
```lisp
(with-get-buffer-memory-requirements var (&rest args)
  &body body)
```
Wrap the body expressions with `create-get-buffer-memory-requirements` and `destroy-get-buffer-memory-requirements`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkGetImageMemoryRequirements

**get-image-memory-requirements**
```lisp
(get-image-memory-requirements device image pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *image*: `VkImage`
  * *pMemoryRequirements*: `VkMemoryRequirements`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetImageSparseMemoryRequirements

**get-image-sparse-memory-requirements**
```lisp
(get-image-sparse-memory-requirements device image pSparseMemoryRequirementCount pSparseMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *image*: `VkImage`
  * *pSparseMemoryRequirementCount*: `uint32`
  * *pSparseMemoryRequirements*: `VkSparseImageMemoryRequirements`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceSparseImageFormatProperties

**get-physical-device-sparse-image-format-properties**
```lisp
(get-physical-device-sparse-image-format-properties physicalDevice format type samples usage tiling pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *format*: `VkFormat`
  * *type*: `VkImageType`
  * *samples*: `VkSampleCountFlagBits`
  * *usage*: `VkImageUsageFlags`
  * *tiling*: `VkImageTiling`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkSparseImageFormatProperties`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkQueueBindSparse

**queue-bind-sparse**
```lisp
(queue-bind-sparse queue bindInfoCount pBindInfo fence) => return-value
```

* *Parameters*:
  * *queue*: `VkQueue`
  * *bindInfoCount*: `uint32`
  * *pBindInfo*: `VkBindSparseInfo`
  * *fence*: `VkFence`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateFence

**create-fence**
```lisp
(create-fence device pCreateInfo pAllocator) => (values pFence result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkFenceCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pFence*: `VkFence`
  * *result*: `VkResult`

## vkDestroyFence

**destroy-fence**
```lisp
(destroy-fence device fence pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *fence*: `VkFence`
  * *pAllocator*: `VkAllocationCallbacks`

**with-fence**
```lisp
(with-fence var (&rest args)
  &body body)
```
Wrap the body expressions with `create-fence` and `destroy-fence`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkResetFences

**reset-fences**
```lisp
(reset-fences device pFences) => result
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pFences*: `(list VkFence)`

* *Return:*
  * *result*: `VkResult`

## vkGetFenceStatus

**get-fence-status**
```lisp
(get-fence-status device fence) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *fence*: `VkFence`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkWaitForFences

**wait-for-fences**
```lisp
(wait-for-fences device pFences waitAll timeout) => result
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pFences*: `(list VkFence)`
  * *waitAll*: `VkBool32`
  * *timeout*: `uint64`

* *Return:*
  * *result*: `VkResult`

## vkCreateSemaphore

**create-semaphore**
```lisp
(create-semaphore device pCreateInfo pAllocator) => (values pSemaphore result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkSemaphoreCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pSemaphore*: `VkSemaphore`
  * *result*: `VkResult`

## vkDestroySemaphore

**destroy-semaphore**
```lisp
(destroy-semaphore device semaphore pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *semaphore*: `VkSemaphore`
  * *pAllocator*: `VkAllocationCallbacks`

**with-semaphore**
```lisp
(with-semaphore var (&rest args)
  &body body)
```
Wrap the body expressions with `create-semaphore` and `destroy-semaphore`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkCreateEvent

**create-event**
```lisp
(create-event device pCreateInfo pAllocator pEvent) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkEventCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pEvent*: `VkEvent`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyEvent

**destroy-event**
```lisp
(destroy-event device event pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *event*: `VkEvent`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetEventStatus

**get-event-status**
```lisp
(get-event-status device event) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *event*: `VkEvent`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkSetEvent

**set-event**
```lisp
(set-event device event) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *event*: `VkEvent`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkResetEvent

**reset-event**
```lisp
(reset-event device event) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *event*: `VkEvent`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateQueryPool

**create-query-pool**
```lisp
(create-query-pool device pCreateInfo pAllocator pQueryPool) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkQueryPoolCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pQueryPool*: `VkQueryPool`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyQueryPool

**destroy-query-pool**
```lisp
(destroy-query-pool device queryPool pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *queryPool*: `VkQueryPool`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetQueryPoolResults

**get-query-pool-results**
```lisp
(get-query-pool-results device queryPool firstQuery queryCount dataSize pData stride flags) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *queryPool*: `VkQueryPool`
  * *firstQuery*: `uint32`
  * *queryCount*: `uint32`
  * *dataSize*: `size`
  * *pData*: `void`
  * *stride*: `VkDeviceSize`
  * *flags*: `VkQueryResultFlags`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateBuffer

**create-buffer**
```lisp
(create-buffer device pCreateInfo pAllocator) => (values pBuffer result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkBufferCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pBuffer*: `VkBuffer`
  * *result*: `VkResult`

## vkDestroyBuffer

**destroy-buffer**
```lisp
(destroy-buffer device buffer pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *buffer*: `VkBuffer`
  * *pAllocator*: `VkAllocationCallbacks`

**with-buffer**
```lisp
(with-buffer var (&rest args)
  &body body)
```
Wrap the body expressions with `create-buffer` and `destroy-buffer`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkCreateBufferView

**create-buffer-view**
```lisp
(create-buffer-view device pCreateInfo pAllocator pView) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkBufferViewCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pView*: `VkBufferView`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyBufferView

**destroy-buffer-view**
```lisp
(destroy-buffer-view device bufferView pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *bufferView*: `VkBufferView`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateImage

**create-image**
```lisp
(create-image device pCreateInfo pAllocator pImage) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkImageCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pImage*: `VkImage`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyImage

**destroy-image**
```lisp
(destroy-image device image pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *image*: `VkImage`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetImageSubresourceLayout

**get-image-subresource-layout**
```lisp
(get-image-subresource-layout device image pSubresource pLayout) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *image*: `VkImage`
  * *pSubresource*: `VkImageSubresource`
  * *pLayout*: `VkSubresourceLayout`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateImageView

**create-image-view**
```lisp
(create-image-view device pCreateInfo pAllocator) => (values pView result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkImageViewCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pView*: `VkImageView`
  * *result*: `VkResult`

## vkDestroyImageView

**destroy-image-view**
```lisp
(destroy-image-view device imageView pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *imageView*: `VkImageView`
  * *pAllocator*: `VkAllocationCallbacks`

**with-image-view**
```lisp
(with-image-view var (&rest args)
  &body body)
```
Wrap the body expressions with `create-image-view` and `destroy-image-view`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkCreateShaderModule

**create-shader-module**
```lisp
(create-shader-module device pCreateInfo pAllocator) => (values pShaderModule result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkShaderModuleCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pShaderModule*: `VkShaderModule`
  * *result*: `VkResult`

## vkDestroyShaderModule

**destroy-shader-module**
```lisp
(destroy-shader-module device shaderModule pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *shaderModule*: `VkShaderModule`
  * *pAllocator*: `VkAllocationCallbacks`

**with-shader-module**
```lisp
(with-shader-module var (&rest args)
  &body body)
```
Wrap the body expressions with `create-shader-module` and `destroy-shader-module`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkCreatePipelineCache

**create-pipeline-cache**
```lisp
(create-pipeline-cache device pCreateInfo pAllocator pPipelineCache) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkPipelineCacheCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pPipelineCache*: `VkPipelineCache`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyPipelineCache

**destroy-pipeline-cache**
```lisp
(destroy-pipeline-cache device pipelineCache pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipelineCache*: `VkPipelineCache`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPipelineCacheData

**get-pipeline-cache-data**
```lisp
(get-pipeline-cache-data device pipelineCache pDataSize pData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipelineCache*: `VkPipelineCache`
  * *pDataSize*: `size`
  * *pData*: `void`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkMergePipelineCaches

**merge-pipeline-caches**
```lisp
(merge-pipeline-caches device dstCache srcCacheCount pSrcCaches) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *dstCache*: `VkPipelineCache`
  * *srcCacheCount*: `uint32`
  * *pSrcCaches*: `VkPipelineCache`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateGraphicsPipelines

**create-graphics-pipelines**
```lisp
(create-graphics-pipelines device pipelineCache pCreateInfos pAllocator) => (values pPipelines result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipelineCache*: `VkPipelineCache`
  * *pCreateInfos*: `VkGraphicsPipelineCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pPipelines*: `VkPipeline`
  * *result*: `VkResult`

## vkCreateComputePipelines

**create-compute-pipelines**
```lisp
(create-compute-pipelines device pipelineCache createInfoCount pCreateInfos pAllocator pPipelines) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipelineCache*: `VkPipelineCache`
  * *createInfoCount*: `uint32`
  * *pCreateInfos*: `VkComputePipelineCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pPipelines*: `VkPipeline`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyPipeline

**destroy-pipeline**
```lisp
(destroy-pipeline device pipeline pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipeline*: `VkPipeline`
  * *pAllocator*: `VkAllocationCallbacks`

**with-graphics-pipelines**
```lisp
(with-graphics-pipelines var (&rest args)
  &body body)
```
Wrap the body expressions with `create-graphics-pipelines` and `destroy-graphics-pipelines`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkCreatePipelineLayout

**create-pipeline-layout**
```lisp
(create-pipeline-layout device pCreateInfo pAllocator) => (values pPipelineLayout result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkPipelineLayoutCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pPipelineLayout*: `VkPipelineLayout`
  * *result*: `VkResult`

## vkDestroyPipelineLayout

**destroy-pipeline-layout**
```lisp
(destroy-pipeline-layout device pipelineLayout pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipelineLayout*: `VkPipelineLayout`
  * *pAllocator*: `VkAllocationCallbacks`

**with-pipeline-layout**
```lisp
(with-pipeline-layout var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-layout` and `destroy-pipeline-layout`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkCreateSampler

**create-sampler**
```lisp
(create-sampler device pCreateInfo pAllocator pSampler) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkSamplerCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pSampler*: `VkSampler`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroySampler

**destroy-sampler**
```lisp
(destroy-sampler device sampler pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *sampler*: `VkSampler`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateDescriptorSetLayout

**create-descriptor-set-layout**
```lisp
(create-descriptor-set-layout device pCreateInfo pAllocator pSetLayout) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkDescriptorSetLayoutCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pSetLayout*: `VkDescriptorSetLayout`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyDescriptorSetLayout

**destroy-descriptor-set-layout**
```lisp
(destroy-descriptor-set-layout device descriptorSetLayout pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *descriptorSetLayout*: `VkDescriptorSetLayout`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateDescriptorPool

**create-descriptor-pool**
```lisp
(create-descriptor-pool device pCreateInfo pAllocator pDescriptorPool) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkDescriptorPoolCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pDescriptorPool*: `VkDescriptorPool`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyDescriptorPool

**destroy-descriptor-pool**
```lisp
(destroy-descriptor-pool device descriptorPool pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *descriptorPool*: `VkDescriptorPool`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkResetDescriptorPool

**reset-descriptor-pool**
```lisp
(reset-descriptor-pool device descriptorPool flags) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *descriptorPool*: `VkDescriptorPool`
  * *flags*: `VkDescriptorPoolResetFlags`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkAllocateDescriptorSets

**allocate-descriptor-sets**
```lisp
(allocate-descriptor-sets device pAllocateInfo pDescriptorSets) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pAllocateInfo*: `VkDescriptorSetAllocateInfo`
  * *pDescriptorSets*: `VkDescriptorSet`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkFreeDescriptorSets

**free-descriptor-sets**
```lisp
(free-descriptor-sets device descriptorPool descriptorSetCount pDescriptorSets) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *descriptorPool*: `VkDescriptorPool`
  * *descriptorSetCount*: `uint32`
  * *pDescriptorSets*: `VkDescriptorSet`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkUpdateDescriptorSets

**update-descriptor-sets**
```lisp
(update-descriptor-sets device descriptorWriteCount pDescriptorWrites descriptorCopyCount pDescriptorCopies) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *descriptorWriteCount*: `uint32`
  * *pDescriptorWrites*: `VkWriteDescriptorSet`
  * *descriptorCopyCount*: `uint32`
  * *pDescriptorCopies*: `VkCopyDescriptorSet`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateFramebuffer

**create-framebuffer**
```lisp
(create-framebuffer device pCreateInfo pAllocator) => (values pFramebuffer result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkFramebufferCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pFramebuffer*: `VkFramebuffer`
  * *result*: `VkResult`

## vkDestroyFramebuffer

**destroy-framebuffer**
```lisp
(destroy-framebuffer device framebuffer pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *framebuffer*: `VkFramebuffer`
  * *pAllocator*: `VkAllocationCallbacks`

**with-framebuffer**
```lisp
(with-framebuffer var (&rest args)
  &body body)
```
Wrap the body expressions with `create-framebuffer` and `destroy-framebuffer`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

* **Note**: The allocator is passed to both the constructor and destructor.

## vkCreateRenderPass

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

## vkDestroyRenderPass

**destroy-render-pass**
```lisp
(destroy-render-pass device renderPass pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *renderPass*: `VkRenderPass`
  * *pAllocator*: `VkAllocationCallbacks`

**with-render-pass**
```lisp
(with-render-pass var (&rest args)
  &body body)
```
Wrap the body expressions with `create-render-pass` and `destroy-render-pass`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkGetRenderAreaGranularity

**get-render-area-granularity**
```lisp
(get-render-area-granularity device renderPass pGranularity) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *renderPass*: `VkRenderPass`
  * *pGranularity*: `VkExtent2D`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateCommandPool

**create-command-pool**
```lisp
(create-command-pool device pCreateInfo pAllocator) => (values pCommandPool result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkCommandPoolCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pCommandPool*: `VkCommandPool`
  * *result*: `VkResult`

## vkDestroyCommandPool

**destroy-command-pool**
```lisp
(destroy-command-pool device commandPool pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *commandPool*: `VkCommandPool`
  * *pAllocator*: `VkAllocationCallbacks`

**with-command-pool**
```lisp
(with-command-pool var (&rest args)
  &body body)
```
Wrap the body expressions with `create-command-pool` and `destroy-command-pool`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkResetCommandPool

**reset-command-pool**
```lisp
(reset-command-pool device commandPool flags) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *commandPool*: `VkCommandPool`
  * *flags*: `VkCommandPoolResetFlags`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkAllocateCommandBuffers

**allocate-command-buffers**
```lisp
(allocate-command-buffers device pAllocateInfo) => (values pCommandBuffers result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pAllocateInfo*: `VkCommandBufferAllocateInfo`

* *Return:*
  * *pCommandBuffers*: `(list VkCommandBuffer)`
  * *result*: `VkResult`

## vkFreeCommandBuffers

**free-command-buffers**
```lisp
(free-command-buffers device commandPool pCommandBuffers)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *commandPool*: `VkCommandPool`
  * *pCommandBuffers*: `(list VkCommandBuffer)`

**with-command-buffers**
```lisp
(with-command-buffers var (&rest args)
  &body body)
```
Wrap the body expressions with `allocate-command-buffers` and `free-command-buffers`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkBeginCommandBuffer

**begin-command-buffer**
```lisp
(begin-command-buffer commandBuffer pBeginInfo) => result
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pBeginInfo*: `VkCommandBufferBeginInfo`

* *Return:*
  * *result*: `VkResult`

## vkEndCommandBuffer

**end-command-buffer**
```lisp
(end-command-buffer commandBuffer) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`

* *Return:*
  * *return-value*: `VkResult`

## vkResetCommandBuffer

**reset-command-buffer**
```lisp
(reset-command-buffer commandBuffer flags) => result
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *flags*: `VkCommandBufferResetFlags`

* *Return:*
  * *result*: `VkResult`

## vkCmdBindPipeline

**cmd-bind-pipeline**
```lisp
(cmd-bind-pipeline commandBuffer pipelineBindPoint pipeline)
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pipelineBindPoint*: `VkPipelineBindPoint`
  * *pipeline*: `VkPipeline`

## vkCmdSetViewport

**cmd-set-viewport**
```lisp
(cmd-set-viewport commandBuffer firstViewport viewportCount pViewports)
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstViewport*: `uint32`
  * *viewportCount*: `uint32`
  * *pViewports*: `(list VkViewport)`

## vkCmdSetScissor

**cmd-set-scissor**
```lisp
(cmd-set-scissor commandBuffer firstScissor scissorCount pScissors)
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstScissor*: `uint32`
  * *scissorCount*: `uint32`
  * *pScissors*: `VkRect2D`

## vkCmdSetLineWidth

**cmd-set-line-width**
```lisp
(cmd-set-line-width commandBuffer lineWidth) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *lineWidth*: `float`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthBias

**cmd-set-depth-bias**
```lisp
(cmd-set-depth-bias commandBuffer depthBiasConstantFactor depthBiasClamp depthBiasSlopeFactor) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthBiasConstantFactor*: `float`
  * *depthBiasClamp*: `float`
  * *depthBiasSlopeFactor*: `float`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetBlendConstants

**cmd-set-blend-constants**
```lisp
(cmd-set-blend-constants commandBuffer blendConstants) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *blendConstants*: `float`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthBounds

**cmd-set-depth-bounds**
```lisp
(cmd-set-depth-bounds commandBuffer minDepthBounds maxDepthBounds) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *minDepthBounds*: `float`
  * *maxDepthBounds*: `float`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetStencilCompareMask

**cmd-set-stencil-compare-mask**
```lisp
(cmd-set-stencil-compare-mask commandBuffer faceMask compareMask) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *faceMask*: `VkStencilFaceFlags`
  * *compareMask*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetStencilWriteMask

**cmd-set-stencil-write-mask**
```lisp
(cmd-set-stencil-write-mask commandBuffer faceMask writeMask) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *faceMask*: `VkStencilFaceFlags`
  * *writeMask*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetStencilReference

**cmd-set-stencil-reference**
```lisp
(cmd-set-stencil-reference commandBuffer faceMask reference) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *faceMask*: `VkStencilFaceFlags`
  * *reference*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBindDescriptorSets

**cmd-bind-descriptor-sets**
```lisp
(cmd-bind-descriptor-sets commandBuffer pipelineBindPoint layout firstSet descriptorSetCount pDescriptorSets dynamicOffsetCount pDynamicOffsets) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pipelineBindPoint*: `VkPipelineBindPoint`
  * *layout*: `VkPipelineLayout`
  * *firstSet*: `uint32`
  * *descriptorSetCount*: `uint32`
  * *pDescriptorSets*: `VkDescriptorSet`
  * *dynamicOffsetCount*: `uint32`
  * *pDynamicOffsets*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBindIndexBuffer

**cmd-bind-index-buffer**
```lisp
(cmd-bind-index-buffer commandBuffer buffer offset indexType) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *indexType*: `VkIndexType`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBindVertexBuffers

**cmd-bind-vertex-buffers**
```lisp
(cmd-bind-vertex-buffers commandBuffer firstBinding pBuffers pOffsets)
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstBinding*: `uint32`
  * *pBuffers*: `(list VkBuffer)`
  * *pOffsets*: `(list VkDeviceSize)`

## vkCmdDraw

**cmd-draw**
```lisp
(cmd-draw commandBuffer vertexCount instanceCount firstVertex firstInstance)
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *vertexCount*: `uint32`
  * *instanceCount*: `uint32`
  * *firstVertex*: `uint32`
  * *firstInstance*: `uint32`

## vkCmdDrawIndexed

**cmd-draw-indexed**
```lisp
(cmd-draw-indexed commandBuffer indexCount instanceCount firstIndex vertexOffset firstInstance) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *indexCount*: `uint32`
  * *instanceCount*: `uint32`
  * *firstIndex*: `uint32`
  * *vertexOffset*: `int32`
  * *firstInstance*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawIndirect

**cmd-draw-indirect**
```lisp
(cmd-draw-indirect commandBuffer buffer offset drawCount stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *drawCount*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawIndexedIndirect

**cmd-draw-indexed-indirect**
```lisp
(cmd-draw-indexed-indirect commandBuffer buffer offset drawCount stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *drawCount*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDispatch

**cmd-dispatch**
```lisp
(cmd-dispatch commandBuffer groupCountX groupCountY groupCountZ) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *groupCountX*: `uint32`
  * *groupCountY*: `uint32`
  * *groupCountZ*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDispatchIndirect

**cmd-dispatch-indirect**
```lisp
(cmd-dispatch-indirect commandBuffer buffer offset) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyBuffer

**cmd-copy-buffer**
```lisp
(cmd-copy-buffer commandBuffer srcBuffer dstBuffer regionCount pRegions) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *srcBuffer*: `VkBuffer`
  * *dstBuffer*: `VkBuffer`
  * *regionCount*: `uint32`
  * *pRegions*: `VkBufferCopy`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyImage

**cmd-copy-image**
```lisp
(cmd-copy-image commandBuffer srcImage srcImageLayout dstImage dstImageLayout regionCount pRegions) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *srcImage*: `VkImage`
  * *srcImageLayout*: `VkImageLayout`
  * *dstImage*: `VkImage`
  * *dstImageLayout*: `VkImageLayout`
  * *regionCount*: `uint32`
  * *pRegions*: `VkImageCopy`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBlitImage

**cmd-blit-image**
```lisp
(cmd-blit-image commandBuffer srcImage srcImageLayout dstImage dstImageLayout regionCount pRegions filter) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *srcImage*: `VkImage`
  * *srcImageLayout*: `VkImageLayout`
  * *dstImage*: `VkImage`
  * *dstImageLayout*: `VkImageLayout`
  * *regionCount*: `uint32`
  * *pRegions*: `VkImageBlit`
  * *filter*: `VkFilter`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyBufferToImage

**cmd-copy-buffer-to-image**
```lisp
(cmd-copy-buffer-to-image commandBuffer srcBuffer dstImage dstImageLayout regionCount pRegions) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *srcBuffer*: `VkBuffer`
  * *dstImage*: `VkImage`
  * *dstImageLayout*: `VkImageLayout`
  * *regionCount*: `uint32`
  * *pRegions*: `VkBufferImageCopy`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyImageToBuffer

**cmd-copy-image-to-buffer**
```lisp
(cmd-copy-image-to-buffer commandBuffer srcImage srcImageLayout dstBuffer regionCount pRegions) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *srcImage*: `VkImage`
  * *srcImageLayout*: `VkImageLayout`
  * *dstBuffer*: `VkBuffer`
  * *regionCount*: `uint32`
  * *pRegions*: `VkBufferImageCopy`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdUpdateBuffer

**cmd-update-buffer**
```lisp
(cmd-update-buffer commandBuffer dstBuffer dstOffset dataSize pData) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *dstBuffer*: `VkBuffer`
  * *dstOffset*: `VkDeviceSize`
  * *dataSize*: `VkDeviceSize`
  * *pData*: `void`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdFillBuffer

**cmd-fill-buffer**
```lisp
(cmd-fill-buffer commandBuffer dstBuffer dstOffset size data) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *dstBuffer*: `VkBuffer`
  * *dstOffset*: `VkDeviceSize`
  * *size*: `VkDeviceSize`
  * *data*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdClearColorImage

**cmd-clear-color-image**
```lisp
(cmd-clear-color-image commandBuffer image imageLayout pColor rangeCount pRanges) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *image*: `VkImage`
  * *imageLayout*: `VkImageLayout`
  * *pColor*: `VkClearColorValue`
  * *rangeCount*: `uint32`
  * *pRanges*: `VkImageSubresourceRange`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdClearDepthStencilImage

**cmd-clear-depth-stencil-image**
```lisp
(cmd-clear-depth-stencil-image commandBuffer image imageLayout pDepthStencil rangeCount pRanges) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *image*: `VkImage`
  * *imageLayout*: `VkImageLayout`
  * *pDepthStencil*: `VkClearDepthStencilValue`
  * *rangeCount*: `uint32`
  * *pRanges*: `VkImageSubresourceRange`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdClearAttachments

**cmd-clear-attachments**
```lisp
(cmd-clear-attachments commandBuffer attachmentCount pAttachments rectCount pRects) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *attachmentCount*: `uint32`
  * *pAttachments*: `VkClearAttachment`
  * *rectCount*: `uint32`
  * *pRects*: `VkClearRect`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdResolveImage

**cmd-resolve-image**
```lisp
(cmd-resolve-image commandBuffer srcImage srcImageLayout dstImage dstImageLayout regionCount pRegions) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *srcImage*: `VkImage`
  * *srcImageLayout*: `VkImageLayout`
  * *dstImage*: `VkImage`
  * *dstImageLayout*: `VkImageLayout`
  * *regionCount*: `uint32`
  * *pRegions*: `VkImageResolve`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetEvent

**cmd-set-event**
```lisp
(cmd-set-event commandBuffer event stageMask) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *event*: `VkEvent`
  * *stageMask*: `VkPipelineStageFlags`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdResetEvent

**cmd-reset-event**
```lisp
(cmd-reset-event commandBuffer event stageMask) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *event*: `VkEvent`
  * *stageMask*: `VkPipelineStageFlags`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdWaitEvents

**cmd-wait-events**
```lisp
(cmd-wait-events commandBuffer eventCount pEvents srcStageMask dstStageMask memoryBarrierCount pMemoryBarriers bufferMemoryBarrierCount pBufferMemoryBarriers imageMemoryBarrierCount pImageMemoryBarriers) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *eventCount*: `uint32`
  * *pEvents*: `VkEvent`
  * *srcStageMask*: `VkPipelineStageFlags`
  * *dstStageMask*: `VkPipelineStageFlags`
  * *memoryBarrierCount*: `uint32`
  * *pMemoryBarriers*: `VkMemoryBarrier`
  * *bufferMemoryBarrierCount*: `uint32`
  * *pBufferMemoryBarriers*: `VkBufferMemoryBarrier`
  * *imageMemoryBarrierCount*: `uint32`
  * *pImageMemoryBarriers*: `VkImageMemoryBarrier`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdPipelineBarrier

**cmd-pipeline-barrier**
```lisp
(cmd-pipeline-barrier commandBuffer srcStageMask dstStageMask dependencyFlags memoryBarrierCount pMemoryBarriers bufferMemoryBarrierCount pBufferMemoryBarriers imageMemoryBarrierCount pImageMemoryBarriers) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *srcStageMask*: `VkPipelineStageFlags`
  * *dstStageMask*: `VkPipelineStageFlags`
  * *dependencyFlags*: `VkDependencyFlags`
  * *memoryBarrierCount*: `uint32`
  * *pMemoryBarriers*: `VkMemoryBarrier`
  * *bufferMemoryBarrierCount*: `uint32`
  * *pBufferMemoryBarriers*: `VkBufferMemoryBarrier`
  * *imageMemoryBarrierCount*: `uint32`
  * *pImageMemoryBarriers*: `VkImageMemoryBarrier`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBeginQuery

**cmd-begin-query**
```lisp
(cmd-begin-query commandBuffer queryPool query flags) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *queryPool*: `VkQueryPool`
  * *query*: `uint32`
  * *flags*: `VkQueryControlFlags`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdEndQuery

**cmd-end-query**
```lisp
(cmd-end-query commandBuffer queryPool query) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *queryPool*: `VkQueryPool`
  * *query*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdResetQueryPool

**cmd-reset-query-pool**
```lisp
(cmd-reset-query-pool commandBuffer queryPool firstQuery queryCount) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *queryPool*: `VkQueryPool`
  * *firstQuery*: `uint32`
  * *queryCount*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdWriteTimestamp

**cmd-write-timestamp**
```lisp
(cmd-write-timestamp commandBuffer pipelineStage queryPool query) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pipelineStage*: `VkPipelineStageFlagBits`
  * *queryPool*: `VkQueryPool`
  * *query*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyQueryPoolResults

**cmd-copy-query-pool-results**
```lisp
(cmd-copy-query-pool-results commandBuffer queryPool firstQuery queryCount dstBuffer dstOffset stride flags) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *queryPool*: `VkQueryPool`
  * *firstQuery*: `uint32`
  * *queryCount*: `uint32`
  * *dstBuffer*: `VkBuffer`
  * *dstOffset*: `VkDeviceSize`
  * *stride*: `VkDeviceSize`
  * *flags*: `VkQueryResultFlags`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdPushConstants

**cmd-push-constants**
```lisp
(cmd-push-constants commandBuffer layout stageFlags offset size pValues) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *layout*: `VkPipelineLayout`
  * *stageFlags*: `VkShaderStageFlags`
  * *offset*: `uint32`
  * *size*: `uint32`
  * *pValues*: `void`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBeginRenderPass

**cmd-begin-render-pass**
```lisp
(cmd-begin-render-pass commandBuffer pRenderPassBegin contents)
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pRenderPassBegin*: `VkRenderPassBeginInfo`
  * *contents*: `VkSubpassContents`

## vkCmdNextSubpass

**cmd-next-subpass**
```lisp
(cmd-next-subpass commandBuffer contents) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *contents*: `VkSubpassContents`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdEndRenderPass

**cmd-end-render-pass**
```lisp
(cmd-end-render-pass commandBuffer)
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`

## vkCmdExecuteCommands

**cmd-execute-commands**
```lisp
(cmd-execute-commands commandBuffer commandBufferCount pCommandBuffers) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *commandBufferCount*: `uint32`
  * *pCommandBuffers*: `VkCommandBuffer`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkEnumerateInstanceVersion

**enumerate-instance-version**
```lisp
(enumerate-instance-version pApiVersion) => return-value
```

* *Parameters*:
  * *pApiVersion*: `uint32`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkBindBufferMemory2

**bind-buffer-memory-2**
```lisp
(bind-buffer-memory-2 device bindInfoCount pBindInfos) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *bindInfoCount*: `uint32`
  * *pBindInfos*: `VkBindBufferMemoryInfo`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkBindImageMemory2

**bind-image-memory-2**
```lisp
(bind-image-memory-2 device bindInfoCount pBindInfos) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *bindInfoCount*: `uint32`
  * *pBindInfos*: `VkBindImageMemoryInfo`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceGroupPeerMemoryFeatures

**get-device-group-peer-memory-features**
```lisp
(get-device-group-peer-memory-features device heapIndex localDeviceIndex remoteDeviceIndex pPeerMemoryFeatures) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *heapIndex*: `uint32`
  * *localDeviceIndex*: `uint32`
  * *remoteDeviceIndex*: `uint32`
  * *pPeerMemoryFeatures*: `VkPeerMemoryFeatureFlags`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDeviceMask

**cmd-set-device-mask**
```lisp
(cmd-set-device-mask commandBuffer deviceMask) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *deviceMask*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDispatchBase

**cmd-dispatch-base**
```lisp
(cmd-dispatch-base commandBuffer baseGroupX baseGroupY baseGroupZ groupCountX groupCountY groupCountZ) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *baseGroupX*: `uint32`
  * *baseGroupY*: `uint32`
  * *baseGroupZ*: `uint32`
  * *groupCountX*: `uint32`
  * *groupCountY*: `uint32`
  * *groupCountZ*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkEnumeratePhysicalDeviceGroups

**enumerate-physical-device-groups**
```lisp
(enumerate-physical-device-groups instance pPhysicalDeviceGroupCount pPhysicalDeviceGroupProperties) => return-value
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *pPhysicalDeviceGroupCount*: `uint32`
  * *pPhysicalDeviceGroupProperties*: `VkPhysicalDeviceGroupProperties`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetImageMemoryRequirements2

**get-image-memory-requirements-2**
```lisp
(get-image-memory-requirements-2 device pInfo pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkImageMemoryRequirementsInfo2`
  * *pMemoryRequirements*: `VkMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetBufferMemoryRequirements2

**get-buffer-memory-requirements-2**
```lisp
(get-buffer-memory-requirements-2 device pInfo pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkBufferMemoryRequirementsInfo2`
  * *pMemoryRequirements*: `VkMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetImageSparseMemoryRequirements2

**get-image-sparse-memory-requirements-2**
```lisp
(get-image-sparse-memory-requirements-2 device pInfo pSparseMemoryRequirementCount pSparseMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkImageSparseMemoryRequirementsInfo2`
  * *pSparseMemoryRequirementCount*: `uint32`
  * *pSparseMemoryRequirements*: `VkSparseImageMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceFeatures2

**get-physical-device-features-2**
```lisp
(get-physical-device-features-2 physicalDevice pFeatures) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pFeatures*: `VkPhysicalDeviceFeatures2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceProperties2

**get-physical-device-properties-2**
```lisp
(get-physical-device-properties-2 physicalDevice pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pProperties*: `VkPhysicalDeviceProperties2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceFormatProperties2

**get-physical-device-format-properties-2**
```lisp
(get-physical-device-format-properties-2 physicalDevice format pFormatProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *format*: `VkFormat`
  * *pFormatProperties*: `VkFormatProperties2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceImageFormatProperties2

**get-physical-device-image-format-properties-2**
```lisp
(get-physical-device-image-format-properties-2 physicalDevice pImageFormatInfo pImageFormatProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pImageFormatInfo*: `VkPhysicalDeviceImageFormatInfo2`
  * *pImageFormatProperties*: `VkImageFormatProperties2`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceQueueFamilyProperties2

**get-physical-device-queue-family-properties-2**
```lisp
(get-physical-device-queue-family-properties-2 physicalDevice pQueueFamilyPropertyCount pQueueFamilyProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pQueueFamilyPropertyCount*: `uint32`
  * *pQueueFamilyProperties*: `VkQueueFamilyProperties2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceMemoryProperties2

**get-physical-device-memory-properties-2**
```lisp
(get-physical-device-memory-properties-2 physicalDevice pMemoryProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pMemoryProperties*: `VkPhysicalDeviceMemoryProperties2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceSparseImageFormatProperties2

**get-physical-device-sparse-image-format-properties-2**
```lisp
(get-physical-device-sparse-image-format-properties-2 physicalDevice pFormatInfo pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pFormatInfo*: `VkPhysicalDeviceSparseImageFormatInfo2`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkSparseImageFormatProperties2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkTrimCommandPool

**trim-command-pool**
```lisp
(trim-command-pool device commandPool flags) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *commandPool*: `VkCommandPool`
  * *flags*: `VkCommandPoolTrimFlags`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceQueue2

**get-device-queue-2**
```lisp
(get-device-queue-2 device pQueueInfo pQueue) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pQueueInfo*: `VkDeviceQueueInfo2`
  * *pQueue*: `VkQueue`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateSamplerYcbcrConversion

**create-sampler-ycbcr-conversion**
```lisp
(create-sampler-ycbcr-conversion device pCreateInfo pAllocator pYcbcrConversion) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkSamplerYcbcrConversionCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pYcbcrConversion*: `VkSamplerYcbcrConversion`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroySamplerYcbcrConversion

**destroy-sampler-ycbcr-conversion**
```lisp
(destroy-sampler-ycbcr-conversion device ycbcrConversion pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *ycbcrConversion*: `VkSamplerYcbcrConversion`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateDescriptorUpdateTemplate

**create-descriptor-update-template**
```lisp
(create-descriptor-update-template device pCreateInfo pAllocator pDescriptorUpdateTemplate) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkDescriptorUpdateTemplateCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pDescriptorUpdateTemplate*: `VkDescriptorUpdateTemplate`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyDescriptorUpdateTemplate

**destroy-descriptor-update-template**
```lisp
(destroy-descriptor-update-template device descriptorUpdateTemplate pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *descriptorUpdateTemplate*: `VkDescriptorUpdateTemplate`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkUpdateDescriptorSetWithTemplate

**update-descriptor-set-with-template**
```lisp
(update-descriptor-set-with-template device descriptorSet descriptorUpdateTemplate pData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *descriptorSet*: `VkDescriptorSet`
  * *descriptorUpdateTemplate*: `VkDescriptorUpdateTemplate`
  * *pData*: `void`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceExternalBufferProperties

**get-physical-device-external-buffer-properties**
```lisp
(get-physical-device-external-buffer-properties physicalDevice pExternalBufferInfo pExternalBufferProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pExternalBufferInfo*: `VkPhysicalDeviceExternalBufferInfo`
  * *pExternalBufferProperties*: `VkExternalBufferProperties`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceExternalFenceProperties

**get-physical-device-external-fence-properties**
```lisp
(get-physical-device-external-fence-properties physicalDevice pExternalFenceInfo pExternalFenceProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pExternalFenceInfo*: `VkPhysicalDeviceExternalFenceInfo`
  * *pExternalFenceProperties*: `VkExternalFenceProperties`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceExternalSemaphoreProperties

**get-physical-device-external-semaphore-properties**
```lisp
(get-physical-device-external-semaphore-properties physicalDevice pExternalSemaphoreInfo pExternalSemaphoreProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pExternalSemaphoreInfo*: `VkPhysicalDeviceExternalSemaphoreInfo`
  * *pExternalSemaphoreProperties*: `VkExternalSemaphoreProperties`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDescriptorSetLayoutSupport

**get-descriptor-set-layout-support**
```lisp
(get-descriptor-set-layout-support device pCreateInfo pSupport) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkDescriptorSetLayoutCreateInfo`
  * *pSupport*: `VkDescriptorSetLayoutSupport`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawIndirectCount

**cmd-draw-indirect-count**
```lisp
(cmd-draw-indirect-count commandBuffer buffer offset countBuffer countBufferOffset maxDrawCount stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *countBuffer*: `VkBuffer`
  * *countBufferOffset*: `VkDeviceSize`
  * *maxDrawCount*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawIndexedIndirectCount

**cmd-draw-indexed-indirect-count**
```lisp
(cmd-draw-indexed-indirect-count commandBuffer buffer offset countBuffer countBufferOffset maxDrawCount stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *countBuffer*: `VkBuffer`
  * *countBufferOffset*: `VkDeviceSize`
  * *maxDrawCount*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateRenderPass2

**create-render-pass-2**
```lisp
(create-render-pass-2 device pCreateInfo pAllocator pRenderPass) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkRenderPassCreateInfo2`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pRenderPass*: `VkRenderPass`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBeginRenderPass2

**cmd-begin-render-pass-2**
```lisp
(cmd-begin-render-pass-2 commandBuffer pRenderPassBegin pSubpassBeginInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pRenderPassBegin*: `VkRenderPassBeginInfo`
  * *pSubpassBeginInfo*: `VkSubpassBeginInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdNextSubpass2

**cmd-next-subpass-2**
```lisp
(cmd-next-subpass-2 commandBuffer pSubpassBeginInfo pSubpassEndInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pSubpassBeginInfo*: `VkSubpassBeginInfo`
  * *pSubpassEndInfo*: `VkSubpassEndInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdEndRenderPass2

**cmd-end-render-pass-2**
```lisp
(cmd-end-render-pass-2 commandBuffer pSubpassEndInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pSubpassEndInfo*: `VkSubpassEndInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkResetQueryPool

**reset-query-pool**
```lisp
(reset-query-pool device queryPool firstQuery queryCount) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *queryPool*: `VkQueryPool`
  * *firstQuery*: `uint32`
  * *queryCount*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetSemaphoreCounterValue

**get-semaphore-counter-value**
```lisp
(get-semaphore-counter-value device semaphore pValue) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *semaphore*: `VkSemaphore`
  * *pValue*: `uint64`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkWaitSemaphores

**wait-semaphores**
```lisp
(wait-semaphores device pWaitInfo timeout) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pWaitInfo*: `VkSemaphoreWaitInfo`
  * *timeout*: `uint64`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkSignalSemaphore

**signal-semaphore**
```lisp
(signal-semaphore device pSignalInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pSignalInfo*: `VkSemaphoreSignalInfo`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetBufferDeviceAddress

**get-buffer-device-address**
```lisp
(get-buffer-device-address device pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkBufferDeviceAddressInfo`

* *Return:*
  * *return-value*: `VkDeviceAddress`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetBufferOpaqueCaptureAddress

**get-buffer-opaque-capture-address**
```lisp
(get-buffer-opaque-capture-address device pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkBufferDeviceAddressInfo`

* *Return:*
  * *return-value*: `uint64_t`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceMemoryOpaqueCaptureAddress

**get-device-memory-opaque-capture-address**
```lisp
(get-device-memory-opaque-capture-address device pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkDeviceMemoryOpaqueCaptureAddressInfo`

* *Return:*
  * *return-value*: `uint64_t`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceToolProperties

**get-physical-device-tool-properties**
```lisp
(get-physical-device-tool-properties physicalDevice pToolCount pToolProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pToolCount*: `uint32`
  * *pToolProperties*: `VkPhysicalDeviceToolProperties`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreatePrivateDataSlot

**create-private-data-slot**
```lisp
(create-private-data-slot device pCreateInfo pAllocator pPrivateDataSlot) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkPrivateDataSlotCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pPrivateDataSlot*: `VkPrivateDataSlot`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyPrivateDataSlot

**destroy-private-data-slot**
```lisp
(destroy-private-data-slot device privateDataSlot pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *privateDataSlot*: `VkPrivateDataSlot`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkSetPrivateData

**set-private-data**
```lisp
(set-private-data device objectType objectHandle privateDataSlot data) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *objectType*: `VkObjectType`
  * *objectHandle*: `uint64`
  * *privateDataSlot*: `VkPrivateDataSlot`
  * *data*: `uint64`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPrivateData

**get-private-data**
```lisp
(get-private-data device objectType objectHandle privateDataSlot pData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *objectType*: `VkObjectType`
  * *objectHandle*: `uint64`
  * *privateDataSlot*: `VkPrivateDataSlot`
  * *pData*: `uint64`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetEvent2

**cmd-set-event-2**
```lisp
(cmd-set-event-2 commandBuffer event pDependencyInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *event*: `VkEvent`
  * *pDependencyInfo*: `VkDependencyInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdResetEvent2

**cmd-reset-event-2**
```lisp
(cmd-reset-event-2 commandBuffer event stageMask) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *event*: `VkEvent`
  * *stageMask*: `VkPipelineStageFlags2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdWaitEvents2

**cmd-wait-events-2**
```lisp
(cmd-wait-events-2 commandBuffer eventCount pEvents pDependencyInfos) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *eventCount*: `uint32`
  * *pEvents*: `VkEvent`
  * *pDependencyInfos*: `VkDependencyInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdPipelineBarrier2

**cmd-pipeline-barrier-2**
```lisp
(cmd-pipeline-barrier-2 commandBuffer pDependencyInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pDependencyInfo*: `VkDependencyInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdWriteTimestamp2

**cmd-write-timestamp-2**
```lisp
(cmd-write-timestamp-2 commandBuffer stage queryPool query) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *stage*: `VkPipelineStageFlags2`
  * *queryPool*: `VkQueryPool`
  * *query*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkQueueSubmit2

**queue-submit-2**
```lisp
(queue-submit-2 queue submitCount pSubmits fence) => return-value
```

* *Parameters*:
  * *queue*: `VkQueue`
  * *submitCount*: `uint32`
  * *pSubmits*: `VkSubmitInfo2`
  * *fence*: `VkFence`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyBuffer2

**cmd-copy-buffer-2**
```lisp
(cmd-copy-buffer-2 commandBuffer pCopyBufferInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pCopyBufferInfo*: `VkCopyBufferInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyImage2

**cmd-copy-image-2**
```lisp
(cmd-copy-image-2 commandBuffer pCopyImageInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pCopyImageInfo*: `VkCopyImageInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyBufferToImage2

**cmd-copy-buffer-to-image-2**
```lisp
(cmd-copy-buffer-to-image-2 commandBuffer pCopyBufferToImageInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pCopyBufferToImageInfo*: `VkCopyBufferToImageInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyImageToBuffer2

**cmd-copy-image-to-buffer-2**
```lisp
(cmd-copy-image-to-buffer-2 commandBuffer pCopyImageToBufferInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pCopyImageToBufferInfo*: `VkCopyImageToBufferInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBlitImage2

**cmd-blit-image-2**
```lisp
(cmd-blit-image-2 commandBuffer pBlitImageInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pBlitImageInfo*: `VkBlitImageInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdResolveImage2

**cmd-resolve-image-2**
```lisp
(cmd-resolve-image-2 commandBuffer pResolveImageInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pResolveImageInfo*: `VkResolveImageInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBeginRendering

**cmd-begin-rendering**
```lisp
(cmd-begin-rendering commandBuffer pRenderingInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pRenderingInfo*: `VkRenderingInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdEndRendering

**cmd-end-rendering**
```lisp
(cmd-end-rendering commandBuffer) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetCullMode

**cmd-set-cull-mode**
```lisp
(cmd-set-cull-mode commandBuffer cullMode) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *cullMode*: `VkCullModeFlags`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetFrontFace

**cmd-set-front-face**
```lisp
(cmd-set-front-face commandBuffer frontFace) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *frontFace*: `VkFrontFace`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetPrimitiveTopology

**cmd-set-primitive-topology**
```lisp
(cmd-set-primitive-topology commandBuffer primitiveTopology) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *primitiveTopology*: `VkPrimitiveTopology`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetViewportWithCount

**cmd-set-viewport-with-count**
```lisp
(cmd-set-viewport-with-count commandBuffer viewportCount pViewports) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *viewportCount*: `uint32`
  * *pViewports*: `VkViewport`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetScissorWithCount

**cmd-set-scissor-with-count**
```lisp
(cmd-set-scissor-with-count commandBuffer scissorCount pScissors) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *scissorCount*: `uint32`
  * *pScissors*: `VkRect2D`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBindVertexBuffers2

**cmd-bind-vertex-buffers-2**
```lisp
(cmd-bind-vertex-buffers-2 commandBuffer firstBinding bindingCount pBuffers pOffsets pSizes pStrides) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstBinding*: `uint32`
  * *bindingCount*: `uint32`
  * *pBuffers*: `VkBuffer`
  * *pOffsets*: `VkDeviceSize`
  * *pSizes*: `VkDeviceSize`
  * *pStrides*: `VkDeviceSize`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthTestEnable

**cmd-set-depth-test-enable**
```lisp
(cmd-set-depth-test-enable commandBuffer depthTestEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthTestEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthWriteEnable

**cmd-set-depth-write-enable**
```lisp
(cmd-set-depth-write-enable commandBuffer depthWriteEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthWriteEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthCompareOp

**cmd-set-depth-compare-op**
```lisp
(cmd-set-depth-compare-op commandBuffer depthCompareOp) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthCompareOp*: `VkCompareOp`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthBoundsTestEnable

**cmd-set-depth-bounds-test-enable**
```lisp
(cmd-set-depth-bounds-test-enable commandBuffer depthBoundsTestEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthBoundsTestEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetStencilTestEnable

**cmd-set-stencil-test-enable**
```lisp
(cmd-set-stencil-test-enable commandBuffer stencilTestEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *stencilTestEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetStencilOp

**cmd-set-stencil-op**
```lisp
(cmd-set-stencil-op commandBuffer faceMask failOp passOp depthFailOp compareOp) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *faceMask*: `VkStencilFaceFlags`
  * *failOp*: `VkStencilOp`
  * *passOp*: `VkStencilOp`
  * *depthFailOp*: `VkStencilOp`
  * *compareOp*: `VkCompareOp`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetRasterizerDiscardEnable

**cmd-set-rasterizer-discard-enable**
```lisp
(cmd-set-rasterizer-discard-enable commandBuffer rasterizerDiscardEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *rasterizerDiscardEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthBiasEnable

**cmd-set-depth-bias-enable**
```lisp
(cmd-set-depth-bias-enable commandBuffer depthBiasEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthBiasEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetPrimitiveRestartEnable

**cmd-set-primitive-restart-enable**
```lisp
(cmd-set-primitive-restart-enable commandBuffer primitiveRestartEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *primitiveRestartEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceBufferMemoryRequirements

**get-device-buffer-memory-requirements**
```lisp
(get-device-buffer-memory-requirements device pInfo pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkDeviceBufferMemoryRequirements`
  * *pMemoryRequirements*: `VkMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceImageMemoryRequirements

**get-device-image-memory-requirements**
```lisp
(get-device-image-memory-requirements device pInfo pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkDeviceImageMemoryRequirements`
  * *pMemoryRequirements*: `VkMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceImageSparseMemoryRequirements

**get-device-image-sparse-memory-requirements**
```lisp
(get-device-image-sparse-memory-requirements device pInfo pSparseMemoryRequirementCount pSparseMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkDeviceImageMemoryRequirements`
  * *pSparseMemoryRequirementCount*: `uint32`
  * *pSparseMemoryRequirements*: `VkSparseImageMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroySurfaceKHR

**destroy-surface-khr**
```lisp
(destroy-surface-khr instance surface pAllocator)
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *surface*: `VkSurfaceKHR`
  * *pAllocator*: `VkAllocationCallbacks`

## vkGetPhysicalDeviceSurfaceSupportKHR

**get-physical-device-surface-support-khr**
```lisp
(get-physical-device-surface-support-khr physicalDevice queueFamilyIndex surface) => (values pSupported result)
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *queueFamilyIndex*: `uint32`
  * *surface*: `VkSurfaceKHR`

* *Return:*
  * *pSupported*: `boolean`
  * *result*: `VkResult`

## vkGetPhysicalDeviceSurfaceCapabilitiesKHR

**create-get-physical-device-surface-capabilities-khr**
```lisp
(create-get-physical-device-surface-capabilities-khr physicalDevice surface) => (values pSurfaceCapabilities result)
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *surface*: `VkSurfaceKHR`

* *Return:*
  * *pSurfaceCapabilities*: `VkSurfaceCapabilitiesKHR`
  * *result*: `VkResult`

## destroy-get-physical-device-surface-capabilities-khr

**destroy-get-physical-device-surface-capabilities-khr**
```lisp
(destroy-get-physical-device-surface-capabilities-khr pSurfaceCapabilities)
```

* *Parameters*:
  * *pSurfaceCapabilities*: `VkSurfaceCapabilitiesKHR`

**with-get-physical-device-surface-capabilities-khr**
```lisp
(with-get-physical-device-surface-capabilities-khr var (&rest args)
  &body body)
```
Wrap the body expressions with `create-get-physical-device-surface-capabilities` and `destroy-get-physical-device-surface-capabilities`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkGetPhysicalDeviceSurfaceFormatsKHR

**create-get-physical-device-surface-formats-khr**
```lisp
(create-get-physical-device-surface-formats-khr physicalDevice surface) => (values pSurfaceFormats result)
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *surface*: `VkSurfaceKHR`

* *Return:*
  * *pSurfaceFormats*: `VkSurfaceFormatKHR`
  * *result*: `VkResult`

## destroy-get-physical-device-surface-formats-khr

**destroy-get-physical-device-surface-formats-khr**
```lisp
(destroy-get-physical-device-surface-formats-khr pSurfaceFormats)
```

* *Parameters*:
  * *pSurfaceFormats*: `(list VkSurfaceFormatKHR)`

**with-get-physical-device-surface-formats-khr**
```lisp
(with-get-physical-device-surface-formats-khr var (&rest args)
  &body body)
```
Wrap the body expressions with `create-get-physical-device-surface-formats` and `destroy-get-physical-device-surface-formats`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkGetPhysicalDeviceSurfacePresentModesKHR

**get-physical-device-surface-present-modes-khr**
```lisp
(get-physical-device-surface-present-modes-khr physicalDevice surface) => (values pPresentModes result)
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *surface*: `VkSurfaceKHR`

* *Return:*
  * *pPresentModes*: `VkPresentModeKHR`
  * *result*: `VkResult`

## vkCreateSwapchainKHR

**create-swapchain-khr**
```lisp
(create-swapchain-khr device pCreateInfo pAllocator) => (values pSwapchain result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkSwapchainCreateInfoKHR`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pSwapchain*: `VkSwapchainKHR`
  * *result*: `VkResult`

## vkDestroySwapchainKHR

**destroy-swapchain-khr**
```lisp
(destroy-swapchain-khr device swapchain pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchain*: `VkSwapchainKHR`
  * *pAllocator*: `VkAllocationCallbacks`

**with-swapchain**
```lisp
(with-swapchain var (&rest args)
  &body body)
```
Wrap the body expressions with `create-swapchain` and `destroy-swapchain`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkGetSwapchainImagesKHR

**get-swapchain-images-khr**
```lisp
(get-swapchain-images-khr device swapchain) => (values pSwapchainImages result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchain*: `VkSwapchainKHR`

* *Return:*
  * *pSwapchainImages*: `VkImage`
  * *result*: `VkResult`

## vkAcquireNextImageKHR

**acquire-next-image-khr**
```lisp
(acquire-next-image-khr device swapchain timeout semaphore fence) => (values pImageIndex return-value)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchain*: `VkSwapchainKHR`
  * *timeout*: `uint64`
  * *semaphore*: `VkSemaphore`
  * *fence*: `VkFence`

* *Return:*
  * *pImageIndex*: `uint32`
  * *return-value*: `VkResult`

## vkQueuePresentKHR

**queue-present-khr**
```lisp
(queue-present-khr queue pPresentInfo) => result
```

* *Parameters*:
  * *queue*: `VkQueue`
  * *pPresentInfo*: `VkPresentInfoKHR`

* *Return:*
  * *result*: `VkResult`

## vkGetDeviceGroupPresentCapabilitiesKHR

**get-device-group-present-capabilities-khr**
```lisp
(get-device-group-present-capabilities-khr device pDeviceGroupPresentCapabilities) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pDeviceGroupPresentCapabilities*: `VkDeviceGroupPresentCapabilitiesKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceGroupSurfacePresentModesKHR

**get-device-group-surface-present-modes-khr**
```lisp
(get-device-group-surface-present-modes-khr device surface pModes) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *surface*: `VkSurfaceKHR`
  * *pModes*: `VkDeviceGroupPresentModeFlagsKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDevicePresentRectanglesKHR

**get-physical-device-present-rectangles-khr**
```lisp
(get-physical-device-present-rectangles-khr physicalDevice surface pRectCount pRects) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *surface*: `VkSurfaceKHR`
  * *pRectCount*: `uint32`
  * *pRects*: `VkRect2D`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkAcquireNextImage2KHR

**acquire-next-image-2-khr**
```lisp
(acquire-next-image-2-khr device pAcquireInfo pImageIndex) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pAcquireInfo*: `VkAcquireNextImageInfoKHR`
  * *pImageIndex*: `uint32`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceDisplayPropertiesKHR

**get-physical-device-display-properties-khr**
```lisp
(get-physical-device-display-properties-khr physicalDevice pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkDisplayPropertiesKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceDisplayPlanePropertiesKHR

**get-physical-device-display-plane-properties-khr**
```lisp
(get-physical-device-display-plane-properties-khr physicalDevice pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkDisplayPlanePropertiesKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDisplayPlaneSupportedDisplaysKHR

**get-display-plane-supported-displays-khr**
```lisp
(get-display-plane-supported-displays-khr physicalDevice planeIndex pDisplayCount pDisplays) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *planeIndex*: `uint32`
  * *pDisplayCount*: `uint32`
  * *pDisplays*: `VkDisplayKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDisplayModePropertiesKHR

**get-display-mode-properties-khr**
```lisp
(get-display-mode-properties-khr physicalDevice display pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *display*: `VkDisplayKHR`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkDisplayModePropertiesKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateDisplayModeKHR

**create-display-mode-khr**
```lisp
(create-display-mode-khr physicalDevice display pCreateInfo pAllocator pMode) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *display*: `VkDisplayKHR`
  * *pCreateInfo*: `VkDisplayModeCreateInfoKHR`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pMode*: `VkDisplayModeKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDisplayPlaneCapabilitiesKHR

**get-display-plane-capabilities-khr**
```lisp
(get-display-plane-capabilities-khr physicalDevice mode planeIndex pCapabilities) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *mode*: `VkDisplayModeKHR`
  * *planeIndex*: `uint32`
  * *pCapabilities*: `VkDisplayPlaneCapabilitiesKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateDisplayPlaneSurfaceKHR

**create-display-plane-surface-khr**
```lisp
(create-display-plane-surface-khr instance pCreateInfo pAllocator pSurface) => return-value
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *pCreateInfo*: `VkDisplaySurfaceCreateInfoKHR`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pSurface*: `VkSurfaceKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateSharedSwapchainsKHR

**create-shared-swapchains-khr**
```lisp
(create-shared-swapchains-khr device swapchainCount pCreateInfos pAllocator pSwapchains) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchainCount*: `uint32`
  * *pCreateInfos*: `VkSwapchainCreateInfoKHR`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pSwapchains*: `VkSwapchainKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBeginRenderingKHR

**cmd-begin-rendering-khr**
```lisp
(cmd-begin-rendering-khr commandBuffer pRenderingInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pRenderingInfo*: `VkRenderingInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdEndRenderingKHR

**cmd-end-rendering-khr**
```lisp
(cmd-end-rendering-khr commandBuffer) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceFeatures2KHR

**get-physical-device-features-2-khr**
```lisp
(get-physical-device-features-2-khr physicalDevice pFeatures) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pFeatures*: `VkPhysicalDeviceFeatures2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceProperties2KHR

**get-physical-device-properties-2-khr**
```lisp
(get-physical-device-properties-2-khr physicalDevice pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pProperties*: `VkPhysicalDeviceProperties2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceFormatProperties2KHR

**get-physical-device-format-properties-2-khr**
```lisp
(get-physical-device-format-properties-2-khr physicalDevice format pFormatProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *format*: `VkFormat`
  * *pFormatProperties*: `VkFormatProperties2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceImageFormatProperties2KHR

**get-physical-device-image-format-properties-2-khr**
```lisp
(get-physical-device-image-format-properties-2-khr physicalDevice pImageFormatInfo pImageFormatProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pImageFormatInfo*: `VkPhysicalDeviceImageFormatInfo2`
  * *pImageFormatProperties*: `VkImageFormatProperties2`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceQueueFamilyProperties2KHR

**get-physical-device-queue-family-properties-2-khr**
```lisp
(get-physical-device-queue-family-properties-2-khr physicalDevice pQueueFamilyPropertyCount pQueueFamilyProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pQueueFamilyPropertyCount*: `uint32`
  * *pQueueFamilyProperties*: `VkQueueFamilyProperties2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceMemoryProperties2KHR

**get-physical-device-memory-properties-2-khr**
```lisp
(get-physical-device-memory-properties-2-khr physicalDevice pMemoryProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pMemoryProperties*: `VkPhysicalDeviceMemoryProperties2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceSparseImageFormatProperties2KHR

**get-physical-device-sparse-image-format-properties-2-khr**
```lisp
(get-physical-device-sparse-image-format-properties-2-khr physicalDevice pFormatInfo pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pFormatInfo*: `VkPhysicalDeviceSparseImageFormatInfo2`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkSparseImageFormatProperties2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceGroupPeerMemoryFeaturesKHR

**get-device-group-peer-memory-features-khr**
```lisp
(get-device-group-peer-memory-features-khr device heapIndex localDeviceIndex remoteDeviceIndex pPeerMemoryFeatures) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *heapIndex*: `uint32`
  * *localDeviceIndex*: `uint32`
  * *remoteDeviceIndex*: `uint32`
  * *pPeerMemoryFeatures*: `VkPeerMemoryFeatureFlags`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDeviceMaskKHR

**cmd-set-device-mask-khr**
```lisp
(cmd-set-device-mask-khr commandBuffer deviceMask) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *deviceMask*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDispatchBaseKHR

**cmd-dispatch-base-khr**
```lisp
(cmd-dispatch-base-khr commandBuffer baseGroupX baseGroupY baseGroupZ groupCountX groupCountY groupCountZ) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *baseGroupX*: `uint32`
  * *baseGroupY*: `uint32`
  * *baseGroupZ*: `uint32`
  * *groupCountX*: `uint32`
  * *groupCountY*: `uint32`
  * *groupCountZ*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkTrimCommandPoolKHR

**trim-command-pool-khr**
```lisp
(trim-command-pool-khr device commandPool flags) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *commandPool*: `VkCommandPool`
  * *flags*: `VkCommandPoolTrimFlags`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkEnumeratePhysicalDeviceGroupsKHR

**enumerate-physical-device-groups-khr**
```lisp
(enumerate-physical-device-groups-khr instance pPhysicalDeviceGroupCount pPhysicalDeviceGroupProperties) => return-value
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *pPhysicalDeviceGroupCount*: `uint32`
  * *pPhysicalDeviceGroupProperties*: `VkPhysicalDeviceGroupProperties`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceExternalBufferPropertiesKHR

**get-physical-device-external-buffer-properties-khr**
```lisp
(get-physical-device-external-buffer-properties-khr physicalDevice pExternalBufferInfo pExternalBufferProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pExternalBufferInfo*: `VkPhysicalDeviceExternalBufferInfo`
  * *pExternalBufferProperties*: `VkExternalBufferProperties`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetMemoryFdKHR

**get-memory-fd-khr**
```lisp
(get-memory-fd-khr device pGetFdInfo pFd) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pGetFdInfo*: `VkMemoryGetFdInfoKHR`
  * *pFd*: `int`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetMemoryFdPropertiesKHR

**get-memory-fd-properties-khr**
```lisp
(get-memory-fd-properties-khr device handleType fd pMemoryFdProperties) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *handleType*: `VkExternalMemoryHandleTypeFlagBits`
  * *fd*: `int`
  * *pMemoryFdProperties*: `VkMemoryFdPropertiesKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceExternalSemaphorePropertiesKHR

**get-physical-device-external-semaphore-properties-khr**
```lisp
(get-physical-device-external-semaphore-properties-khr physicalDevice pExternalSemaphoreInfo pExternalSemaphoreProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pExternalSemaphoreInfo*: `VkPhysicalDeviceExternalSemaphoreInfo`
  * *pExternalSemaphoreProperties*: `VkExternalSemaphoreProperties`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkImportSemaphoreFdKHR

**import-semaphore-fd-khr**
```lisp
(import-semaphore-fd-khr device pImportSemaphoreFdInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pImportSemaphoreFdInfo*: `VkImportSemaphoreFdInfoKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetSemaphoreFdKHR

**get-semaphore-fd-khr**
```lisp
(get-semaphore-fd-khr device pGetFdInfo pFd) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pGetFdInfo*: `VkSemaphoreGetFdInfoKHR`
  * *pFd*: `int`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdPushDescriptorSetKHR

**cmd-push-descriptor-set-khr**
```lisp
(cmd-push-descriptor-set-khr commandBuffer pipelineBindPoint layout set descriptorWriteCount pDescriptorWrites) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pipelineBindPoint*: `VkPipelineBindPoint`
  * *layout*: `VkPipelineLayout`
  * *set*: `uint32`
  * *descriptorWriteCount*: `uint32`
  * *pDescriptorWrites*: `VkWriteDescriptorSet`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdPushDescriptorSetWithTemplateKHR

**cmd-push-descriptor-set-with-template-khr**
```lisp
(cmd-push-descriptor-set-with-template-khr commandBuffer descriptorUpdateTemplate layout set pData) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *descriptorUpdateTemplate*: `VkDescriptorUpdateTemplate`
  * *layout*: `VkPipelineLayout`
  * *set*: `uint32`
  * *pData*: `void`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateDescriptorUpdateTemplateKHR

**create-descriptor-update-template-khr**
```lisp
(create-descriptor-update-template-khr device pCreateInfo pAllocator pDescriptorUpdateTemplate) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkDescriptorUpdateTemplateCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pDescriptorUpdateTemplate*: `VkDescriptorUpdateTemplate`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyDescriptorUpdateTemplateKHR

**destroy-descriptor-update-template-khr**
```lisp
(destroy-descriptor-update-template-khr device descriptorUpdateTemplate pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *descriptorUpdateTemplate*: `VkDescriptorUpdateTemplate`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkUpdateDescriptorSetWithTemplateKHR

**update-descriptor-set-with-template-khr**
```lisp
(update-descriptor-set-with-template-khr device descriptorSet descriptorUpdateTemplate pData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *descriptorSet*: `VkDescriptorSet`
  * *descriptorUpdateTemplate*: `VkDescriptorUpdateTemplate`
  * *pData*: `void`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateRenderPass2KHR

**create-render-pass-2-khr**
```lisp
(create-render-pass-2-khr device pCreateInfo pAllocator pRenderPass) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkRenderPassCreateInfo2`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pRenderPass*: `VkRenderPass`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBeginRenderPass2KHR

**cmd-begin-render-pass-2-khr**
```lisp
(cmd-begin-render-pass-2-khr commandBuffer pRenderPassBegin pSubpassBeginInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pRenderPassBegin*: `VkRenderPassBeginInfo`
  * *pSubpassBeginInfo*: `VkSubpassBeginInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdNextSubpass2KHR

**cmd-next-subpass-2-khr**
```lisp
(cmd-next-subpass-2-khr commandBuffer pSubpassBeginInfo pSubpassEndInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pSubpassBeginInfo*: `VkSubpassBeginInfo`
  * *pSubpassEndInfo*: `VkSubpassEndInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdEndRenderPass2KHR

**cmd-end-render-pass-2-khr**
```lisp
(cmd-end-render-pass-2-khr commandBuffer pSubpassEndInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pSubpassEndInfo*: `VkSubpassEndInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetSwapchainStatusKHR

**get-swapchain-status-khr**
```lisp
(get-swapchain-status-khr device swapchain) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchain*: `VkSwapchainKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceExternalFencePropertiesKHR

**get-physical-device-external-fence-properties-khr**
```lisp
(get-physical-device-external-fence-properties-khr physicalDevice pExternalFenceInfo pExternalFenceProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pExternalFenceInfo*: `VkPhysicalDeviceExternalFenceInfo`
  * *pExternalFenceProperties*: `VkExternalFenceProperties`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkImportFenceFdKHR

**import-fence-fd-khr**
```lisp
(import-fence-fd-khr device pImportFenceFdInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pImportFenceFdInfo*: `VkImportFenceFdInfoKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetFenceFdKHR

**get-fence-fd-khr**
```lisp
(get-fence-fd-khr device pGetFdInfo pFd) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pGetFdInfo*: `VkFenceGetFdInfoKHR`
  * *pFd*: `int`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR

**enumerate-physical-device-queue-family-performance-query-counters-khr**
```lisp
(enumerate-physical-device-queue-family-performance-query-counters-khr physicalDevice queueFamilyIndex pCounterCount pCounters pCounterDescriptions) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *queueFamilyIndex*: `uint32`
  * *pCounterCount*: `uint32`
  * *pCounters*: `VkPerformanceCounterKHR`
  * *pCounterDescriptions*: `VkPerformanceCounterDescriptionKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR

**get-physical-device-queue-family-performance-query-passes-khr**
```lisp
(get-physical-device-queue-family-performance-query-passes-khr physicalDevice pPerformanceQueryCreateInfo pNumPasses) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pPerformanceQueryCreateInfo*: `VkQueryPoolPerformanceCreateInfoKHR`
  * *pNumPasses*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkAcquireProfilingLockKHR

**acquire-profiling-lock-khr**
```lisp
(acquire-profiling-lock-khr device pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkAcquireProfilingLockInfoKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkReleaseProfilingLockKHR

**release-profiling-lock-khr**
```lisp
(release-profiling-lock-khr device) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceSurfaceCapabilities2KHR

**get-physical-device-surface-capabilities-2-khr**
```lisp
(get-physical-device-surface-capabilities-2-khr physicalDevice pSurfaceInfo pSurfaceCapabilities) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pSurfaceInfo*: `VkPhysicalDeviceSurfaceInfo2KHR`
  * *pSurfaceCapabilities*: `VkSurfaceCapabilities2KHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceSurfaceFormats2KHR

**get-physical-device-surface-formats-2-khr**
```lisp
(get-physical-device-surface-formats-2-khr physicalDevice pSurfaceInfo pSurfaceFormatCount pSurfaceFormats) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pSurfaceInfo*: `VkPhysicalDeviceSurfaceInfo2KHR`
  * *pSurfaceFormatCount*: `uint32`
  * *pSurfaceFormats*: `VkSurfaceFormat2KHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceDisplayProperties2KHR

**get-physical-device-display-properties-2-khr**
```lisp
(get-physical-device-display-properties-2-khr physicalDevice pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkDisplayProperties2KHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceDisplayPlaneProperties2KHR

**get-physical-device-display-plane-properties-2-khr**
```lisp
(get-physical-device-display-plane-properties-2-khr physicalDevice pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkDisplayPlaneProperties2KHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDisplayModeProperties2KHR

**get-display-mode-properties-2-khr**
```lisp
(get-display-mode-properties-2-khr physicalDevice display pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *display*: `VkDisplayKHR`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkDisplayModeProperties2KHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDisplayPlaneCapabilities2KHR

**get-display-plane-capabilities-2-khr**
```lisp
(get-display-plane-capabilities-2-khr physicalDevice pDisplayPlaneInfo pCapabilities) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pDisplayPlaneInfo*: `VkDisplayPlaneInfo2KHR`
  * *pCapabilities*: `VkDisplayPlaneCapabilities2KHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetImageMemoryRequirements2KHR

**get-image-memory-requirements-2-khr**
```lisp
(get-image-memory-requirements-2-khr device pInfo pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkImageMemoryRequirementsInfo2`
  * *pMemoryRequirements*: `VkMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetBufferMemoryRequirements2KHR

**get-buffer-memory-requirements-2-khr**
```lisp
(get-buffer-memory-requirements-2-khr device pInfo pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkBufferMemoryRequirementsInfo2`
  * *pMemoryRequirements*: `VkMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetImageSparseMemoryRequirements2KHR

**get-image-sparse-memory-requirements-2-khr**
```lisp
(get-image-sparse-memory-requirements-2-khr device pInfo pSparseMemoryRequirementCount pSparseMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkImageSparseMemoryRequirementsInfo2`
  * *pSparseMemoryRequirementCount*: `uint32`
  * *pSparseMemoryRequirements*: `VkSparseImageMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateSamplerYcbcrConversionKHR

**create-sampler-ycbcr-conversion-khr**
```lisp
(create-sampler-ycbcr-conversion-khr device pCreateInfo pAllocator pYcbcrConversion) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkSamplerYcbcrConversionCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pYcbcrConversion*: `VkSamplerYcbcrConversion`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroySamplerYcbcrConversionKHR

**destroy-sampler-ycbcr-conversion-khr**
```lisp
(destroy-sampler-ycbcr-conversion-khr device ycbcrConversion pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *ycbcrConversion*: `VkSamplerYcbcrConversion`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkBindBufferMemory2KHR

**bind-buffer-memory-2-khr**
```lisp
(bind-buffer-memory-2-khr device bindInfoCount pBindInfos) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *bindInfoCount*: `uint32`
  * *pBindInfos*: `VkBindBufferMemoryInfo`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkBindImageMemory2KHR

**bind-image-memory-2-khr**
```lisp
(bind-image-memory-2-khr device bindInfoCount pBindInfos) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *bindInfoCount*: `uint32`
  * *pBindInfos*: `VkBindImageMemoryInfo`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDescriptorSetLayoutSupportKHR

**get-descriptor-set-layout-support-khr**
```lisp
(get-descriptor-set-layout-support-khr device pCreateInfo pSupport) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkDescriptorSetLayoutCreateInfo`
  * *pSupport*: `VkDescriptorSetLayoutSupport`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawIndirectCountKHR

**cmd-draw-indirect-count-khr**
```lisp
(cmd-draw-indirect-count-khr commandBuffer buffer offset countBuffer countBufferOffset maxDrawCount stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *countBuffer*: `VkBuffer`
  * *countBufferOffset*: `VkDeviceSize`
  * *maxDrawCount*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawIndexedIndirectCountKHR

**cmd-draw-indexed-indirect-count-khr**
```lisp
(cmd-draw-indexed-indirect-count-khr commandBuffer buffer offset countBuffer countBufferOffset maxDrawCount stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *countBuffer*: `VkBuffer`
  * *countBufferOffset*: `VkDeviceSize`
  * *maxDrawCount*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetSemaphoreCounterValueKHR

**get-semaphore-counter-value-khr**
```lisp
(get-semaphore-counter-value-khr device semaphore pValue) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *semaphore*: `VkSemaphore`
  * *pValue*: `uint64`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkWaitSemaphoresKHR

**wait-semaphores-khr**
```lisp
(wait-semaphores-khr device pWaitInfo timeout) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pWaitInfo*: `VkSemaphoreWaitInfo`
  * *timeout*: `uint64`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkSignalSemaphoreKHR

**signal-semaphore-khr**
```lisp
(signal-semaphore-khr device pSignalInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pSignalInfo*: `VkSemaphoreSignalInfo`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceFragmentShadingRatesKHR

**get-physical-device-fragment-shading-rates-khr**
```lisp
(get-physical-device-fragment-shading-rates-khr physicalDevice pFragmentShadingRateCount pFragmentShadingRates) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pFragmentShadingRateCount*: `uint32`
  * *pFragmentShadingRates*: `VkPhysicalDeviceFragmentShadingRateKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetFragmentShadingRateKHR

**cmd-set-fragment-shading-rate-khr**
```lisp
(cmd-set-fragment-shading-rate-khr commandBuffer pFragmentSize combinerOps) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pFragmentSize*: `VkExtent2D`
  * *combinerOps*: `VkFragmentShadingRateCombinerOpKHR`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkWaitForPresentKHR

**wait-for-present-khr**
```lisp
(wait-for-present-khr device swapchain presentId timeout) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchain*: `VkSwapchainKHR`
  * *presentId*: `uint64`
  * *timeout*: `uint64`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetBufferDeviceAddressKHR

**get-buffer-device-address-khr**
```lisp
(get-buffer-device-address-khr device pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkBufferDeviceAddressInfo`

* *Return:*
  * *return-value*: `VkDeviceAddress`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetBufferOpaqueCaptureAddressKHR

**get-buffer-opaque-capture-address-khr**
```lisp
(get-buffer-opaque-capture-address-khr device pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkBufferDeviceAddressInfo`

* *Return:*
  * *return-value*: `uint64_t`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceMemoryOpaqueCaptureAddressKHR

**get-device-memory-opaque-capture-address-khr**
```lisp
(get-device-memory-opaque-capture-address-khr device pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkDeviceMemoryOpaqueCaptureAddressInfo`

* *Return:*
  * *return-value*: `uint64_t`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateDeferredOperationKHR

**create-deferred-operation-khr**
```lisp
(create-deferred-operation-khr device pAllocator pDeferredOperation) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pDeferredOperation*: `VkDeferredOperationKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyDeferredOperationKHR

**destroy-deferred-operation-khr**
```lisp
(destroy-deferred-operation-khr device operation pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *operation*: `VkDeferredOperationKHR`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeferredOperationMaxConcurrencyKHR

**get-deferred-operation-max-concurrency-khr**
```lisp
(get-deferred-operation-max-concurrency-khr device operation) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *operation*: `VkDeferredOperationKHR`

* *Return:*
  * *return-value*: `uint32_t`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeferredOperationResultKHR

**get-deferred-operation-result-khr**
```lisp
(get-deferred-operation-result-khr device operation) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *operation*: `VkDeferredOperationKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDeferredOperationJoinKHR

**deferred-operation-join-khr**
```lisp
(deferred-operation-join-khr device operation) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *operation*: `VkDeferredOperationKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPipelineExecutablePropertiesKHR

**get-pipeline-executable-properties-khr**
```lisp
(get-pipeline-executable-properties-khr device pPipelineInfo pExecutableCount pProperties) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pPipelineInfo*: `VkPipelineInfoKHR`
  * *pExecutableCount*: `uint32`
  * *pProperties*: `VkPipelineExecutablePropertiesKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPipelineExecutableStatisticsKHR

**get-pipeline-executable-statistics-khr**
```lisp
(get-pipeline-executable-statistics-khr device pExecutableInfo pStatisticCount pStatistics) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pExecutableInfo*: `VkPipelineExecutableInfoKHR`
  * *pStatisticCount*: `uint32`
  * *pStatistics*: `VkPipelineExecutableStatisticKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPipelineExecutableInternalRepresentationsKHR

**get-pipeline-executable-internal-representations-khr**
```lisp
(get-pipeline-executable-internal-representations-khr device pExecutableInfo pInternalRepresentationCount pInternalRepresentations) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pExecutableInfo*: `VkPipelineExecutableInfoKHR`
  * *pInternalRepresentationCount*: `uint32`
  * *pInternalRepresentations*: `VkPipelineExecutableInternalRepresentationKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetEvent2KHR

**cmd-set-event-2-khr**
```lisp
(cmd-set-event-2-khr commandBuffer event pDependencyInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *event*: `VkEvent`
  * *pDependencyInfo*: `VkDependencyInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdResetEvent2KHR

**cmd-reset-event-2-khr**
```lisp
(cmd-reset-event-2-khr commandBuffer event stageMask) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *event*: `VkEvent`
  * *stageMask*: `VkPipelineStageFlags2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdWaitEvents2KHR

**cmd-wait-events-2-khr**
```lisp
(cmd-wait-events-2-khr commandBuffer eventCount pEvents pDependencyInfos) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *eventCount*: `uint32`
  * *pEvents*: `VkEvent`
  * *pDependencyInfos*: `VkDependencyInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdPipelineBarrier2KHR

**cmd-pipeline-barrier-2-khr**
```lisp
(cmd-pipeline-barrier-2-khr commandBuffer pDependencyInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pDependencyInfo*: `VkDependencyInfo`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdWriteTimestamp2KHR

**cmd-write-timestamp-2-khr**
```lisp
(cmd-write-timestamp-2-khr commandBuffer stage queryPool query) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *stage*: `VkPipelineStageFlags2`
  * *queryPool*: `VkQueryPool`
  * *query*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkQueueSubmit2KHR

**queue-submit-2-khr**
```lisp
(queue-submit-2-khr queue submitCount pSubmits fence) => return-value
```

* *Parameters*:
  * *queue*: `VkQueue`
  * *submitCount*: `uint32`
  * *pSubmits*: `VkSubmitInfo2`
  * *fence*: `VkFence`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdWriteBufferMarker2AMD

**cmd-write-buffer-marker-2-amd**
```lisp
(cmd-write-buffer-marker-2-amd commandBuffer stage dstBuffer dstOffset marker) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *stage*: `VkPipelineStageFlags2`
  * *dstBuffer*: `VkBuffer`
  * *dstOffset*: `VkDeviceSize`
  * *marker*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetQueueCheckpointData2NV

**get-queue-checkpoint-data-2-nv**
```lisp
(get-queue-checkpoint-data-2-nv queue pCheckpointDataCount pCheckpointData) => return-value
```

* *Parameters*:
  * *queue*: `VkQueue`
  * *pCheckpointDataCount*: `uint32`
  * *pCheckpointData*: `VkCheckpointData2NV`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyBuffer2KHR

**cmd-copy-buffer-2-khr**
```lisp
(cmd-copy-buffer-2-khr commandBuffer pCopyBufferInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pCopyBufferInfo*: `VkCopyBufferInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyImage2KHR

**cmd-copy-image-2-khr**
```lisp
(cmd-copy-image-2-khr commandBuffer pCopyImageInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pCopyImageInfo*: `VkCopyImageInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyBufferToImage2KHR

**cmd-copy-buffer-to-image-2-khr**
```lisp
(cmd-copy-buffer-to-image-2-khr commandBuffer pCopyBufferToImageInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pCopyBufferToImageInfo*: `VkCopyBufferToImageInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyImageToBuffer2KHR

**cmd-copy-image-to-buffer-2-khr**
```lisp
(cmd-copy-image-to-buffer-2-khr commandBuffer pCopyImageToBufferInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pCopyImageToBufferInfo*: `VkCopyImageToBufferInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBlitImage2KHR

**cmd-blit-image-2-khr**
```lisp
(cmd-blit-image-2-khr commandBuffer pBlitImageInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pBlitImageInfo*: `VkBlitImageInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdResolveImage2KHR

**cmd-resolve-image-2-khr**
```lisp
(cmd-resolve-image-2-khr commandBuffer pResolveImageInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pResolveImageInfo*: `VkResolveImageInfo2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdTraceRaysIndirect2KHR

**cmd-trace-rays-indirect-2-khr**
```lisp
(cmd-trace-rays-indirect-2-khr commandBuffer indirectDeviceAddress) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *indirectDeviceAddress*: `VkDeviceAddress`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceBufferMemoryRequirementsKHR

**get-device-buffer-memory-requirements-khr**
```lisp
(get-device-buffer-memory-requirements-khr device pInfo pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkDeviceBufferMemoryRequirements`
  * *pMemoryRequirements*: `VkMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceImageMemoryRequirementsKHR

**get-device-image-memory-requirements-khr**
```lisp
(get-device-image-memory-requirements-khr device pInfo pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkDeviceImageMemoryRequirements`
  * *pMemoryRequirements*: `VkMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceImageSparseMemoryRequirementsKHR

**get-device-image-sparse-memory-requirements-khr**
```lisp
(get-device-image-sparse-memory-requirements-khr device pInfo pSparseMemoryRequirementCount pSparseMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkDeviceImageMemoryRequirements`
  * *pSparseMemoryRequirementCount*: `uint32`
  * *pSparseMemoryRequirements*: `VkSparseImageMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateDebugReportCallbackEXT

**create-debug-report-callback-ext**
```lisp
(create-debug-report-callback-ext instance pCreateInfo pAllocator pCallback) => return-value
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *pCreateInfo*: `VkDebugReportCallbackCreateInfoEXT`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pCallback*: `VkDebugReportCallbackEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyDebugReportCallbackEXT

**destroy-debug-report-callback-ext**
```lisp
(destroy-debug-report-callback-ext instance callback pAllocator) => return-value
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *callback*: `VkDebugReportCallbackEXT`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDebugReportMessageEXT

**debug-report-message-ext**
```lisp
(debug-report-message-ext instance flags objectType object location messageCode pLayerPrefix pMessage) => return-value
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *flags*: `VkDebugReportFlagsEXT`
  * *objectType*: `VkDebugReportObjectTypeEXT`
  * *object*: `uint64`
  * *location*: `size`
  * *messageCode*: `int32`
  * *pLayerPrefix*: `char`
  * *pMessage*: `char`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDebugMarkerSetObjectTagEXT

**debug-marker-set-object-tag-ext**
```lisp
(debug-marker-set-object-tag-ext device pTagInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pTagInfo*: `VkDebugMarkerObjectTagInfoEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDebugMarkerSetObjectNameEXT

**debug-marker-set-object-name-ext**
```lisp
(debug-marker-set-object-name-ext device pNameInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pNameInfo*: `VkDebugMarkerObjectNameInfoEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDebugMarkerBeginEXT

**cmd-debug-marker-begin-ext**
```lisp
(cmd-debug-marker-begin-ext commandBuffer pMarkerInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pMarkerInfo*: `VkDebugMarkerMarkerInfoEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDebugMarkerEndEXT

**cmd-debug-marker-end-ext**
```lisp
(cmd-debug-marker-end-ext commandBuffer) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDebugMarkerInsertEXT

**cmd-debug-marker-insert-ext**
```lisp
(cmd-debug-marker-insert-ext commandBuffer pMarkerInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pMarkerInfo*: `VkDebugMarkerMarkerInfoEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBindTransformFeedbackBuffersEXT

**cmd-bind-transform-feedback-buffers-ext**
```lisp
(cmd-bind-transform-feedback-buffers-ext commandBuffer firstBinding bindingCount pBuffers pOffsets pSizes) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstBinding*: `uint32`
  * *bindingCount*: `uint32`
  * *pBuffers*: `VkBuffer`
  * *pOffsets*: `VkDeviceSize`
  * *pSizes*: `VkDeviceSize`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBeginTransformFeedbackEXT

**cmd-begin-transform-feedback-ext**
```lisp
(cmd-begin-transform-feedback-ext commandBuffer firstCounterBuffer counterBufferCount pCounterBuffers pCounterBufferOffsets) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstCounterBuffer*: `uint32`
  * *counterBufferCount*: `uint32`
  * *pCounterBuffers*: `VkBuffer`
  * *pCounterBufferOffsets*: `VkDeviceSize`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdEndTransformFeedbackEXT

**cmd-end-transform-feedback-ext**
```lisp
(cmd-end-transform-feedback-ext commandBuffer firstCounterBuffer counterBufferCount pCounterBuffers pCounterBufferOffsets) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstCounterBuffer*: `uint32`
  * *counterBufferCount*: `uint32`
  * *pCounterBuffers*: `VkBuffer`
  * *pCounterBufferOffsets*: `VkDeviceSize`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBeginQueryIndexedEXT

**cmd-begin-query-indexed-ext**
```lisp
(cmd-begin-query-indexed-ext commandBuffer queryPool query flags index) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *queryPool*: `VkQueryPool`
  * *query*: `uint32`
  * *flags*: `VkQueryControlFlags`
  * *index*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdEndQueryIndexedEXT

**cmd-end-query-indexed-ext**
```lisp
(cmd-end-query-indexed-ext commandBuffer queryPool query index) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *queryPool*: `VkQueryPool`
  * *query*: `uint32`
  * *index*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawIndirectByteCountEXT

**cmd-draw-indirect-byte-count-ext**
```lisp
(cmd-draw-indirect-byte-count-ext commandBuffer instanceCount firstInstance counterBuffer counterBufferOffset counterOffset vertexStride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *instanceCount*: `uint32`
  * *firstInstance*: `uint32`
  * *counterBuffer*: `VkBuffer`
  * *counterBufferOffset*: `VkDeviceSize`
  * *counterOffset*: `uint32`
  * *vertexStride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateCuModuleNVX

**create-cu-module-nvx**
```lisp
(create-cu-module-nvx device pCreateInfo pAllocator pModule) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkCuModuleCreateInfoNVX`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pModule*: `VkCuModuleNVX`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateCuFunctionNVX

**create-cu-function-nvx**
```lisp
(create-cu-function-nvx device pCreateInfo pAllocator pFunction) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkCuFunctionCreateInfoNVX`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pFunction*: `VkCuFunctionNVX`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyCuModuleNVX

**destroy-cu-module-nvx**
```lisp
(destroy-cu-module-nvx device module pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *module*: `VkCuModuleNVX`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyCuFunctionNVX

**destroy-cu-function-nvx**
```lisp
(destroy-cu-function-nvx device function pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *function*: `VkCuFunctionNVX`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCuLaunchKernelNVX

**cmd-cu-launch-kernel-nvx**
```lisp
(cmd-cu-launch-kernel-nvx commandBuffer pLaunchInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pLaunchInfo*: `VkCuLaunchInfoNVX`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetImageViewHandleNVX

**get-image-view-handle-nvx**
```lisp
(get-image-view-handle-nvx device pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkImageViewHandleInfoNVX`

* *Return:*
  * *return-value*: `uint32_t`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetImageViewAddressNVX

**get-image-view-address-nvx**
```lisp
(get-image-view-address-nvx device imageView pProperties) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *imageView*: `VkImageView`
  * *pProperties*: `VkImageViewAddressPropertiesNVX`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawIndirectCountAMD

**cmd-draw-indirect-count-amd**
```lisp
(cmd-draw-indirect-count-amd commandBuffer buffer offset countBuffer countBufferOffset maxDrawCount stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *countBuffer*: `VkBuffer`
  * *countBufferOffset*: `VkDeviceSize`
  * *maxDrawCount*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawIndexedIndirectCountAMD

**cmd-draw-indexed-indirect-count-amd**
```lisp
(cmd-draw-indexed-indirect-count-amd commandBuffer buffer offset countBuffer countBufferOffset maxDrawCount stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *countBuffer*: `VkBuffer`
  * *countBufferOffset*: `VkDeviceSize`
  * *maxDrawCount*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetShaderInfoAMD

**get-shader-info-amd**
```lisp
(get-shader-info-amd device pipeline shaderStage infoType pInfoSize pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipeline*: `VkPipeline`
  * *shaderStage*: `VkShaderStageFlagBits`
  * *infoType*: `VkShaderInfoTypeAMD`
  * *pInfoSize*: `size`
  * *pInfo*: `void`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceExternalImageFormatPropertiesNV

**get-physical-device-external-image-format-properties-nv**
```lisp
(get-physical-device-external-image-format-properties-nv physicalDevice format type tiling usage flags externalHandleType pExternalImageFormatProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *format*: `VkFormat`
  * *type*: `VkImageType`
  * *tiling*: `VkImageTiling`
  * *usage*: `VkImageUsageFlags`
  * *flags*: `VkImageCreateFlags`
  * *externalHandleType*: `VkExternalMemoryHandleTypeFlagsNV`
  * *pExternalImageFormatProperties*: `VkExternalImageFormatPropertiesNV`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBeginConditionalRenderingEXT

**cmd-begin-conditional-rendering-ext**
```lisp
(cmd-begin-conditional-rendering-ext commandBuffer pConditionalRenderingBegin) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pConditionalRenderingBegin*: `VkConditionalRenderingBeginInfoEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdEndConditionalRenderingEXT

**cmd-end-conditional-rendering-ext**
```lisp
(cmd-end-conditional-rendering-ext commandBuffer) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetViewportWScalingNV

**cmd-set-viewport-w-scaling-nv**
```lisp
(cmd-set-viewport-w-scaling-nv commandBuffer firstViewport viewportCount pViewportWScalings) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstViewport*: `uint32`
  * *viewportCount*: `uint32`
  * *pViewportWScalings*: `VkViewportWScalingNV`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkReleaseDisplayEXT

**release-display-ext**
```lisp
(release-display-ext physicalDevice display) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *display*: `VkDisplayKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceSurfaceCapabilities2EXT

**get-physical-device-surface-capabilities-2-ext**
```lisp
(get-physical-device-surface-capabilities-2-ext physicalDevice surface pSurfaceCapabilities) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *surface*: `VkSurfaceKHR`
  * *pSurfaceCapabilities*: `VkSurfaceCapabilities2EXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDisplayPowerControlEXT

**display-power-control-ext**
```lisp
(display-power-control-ext device display pDisplayPowerInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *display*: `VkDisplayKHR`
  * *pDisplayPowerInfo*: `VkDisplayPowerInfoEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkRegisterDeviceEventEXT

**register-device-event-ext**
```lisp
(register-device-event-ext device pDeviceEventInfo pAllocator pFence) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pDeviceEventInfo*: `VkDeviceEventInfoEXT`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pFence*: `VkFence`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkRegisterDisplayEventEXT

**register-display-event-ext**
```lisp
(register-display-event-ext device display pDisplayEventInfo pAllocator pFence) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *display*: `VkDisplayKHR`
  * *pDisplayEventInfo*: `VkDisplayEventInfoEXT`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pFence*: `VkFence`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetSwapchainCounterEXT

**get-swapchain-counter-ext**
```lisp
(get-swapchain-counter-ext device swapchain counter pCounterValue) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchain*: `VkSwapchainKHR`
  * *counter*: `VkSurfaceCounterFlagBitsEXT`
  * *pCounterValue*: `uint64`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetRefreshCycleDurationGOOGLE

**get-refresh-cycle-duration-google**
```lisp
(get-refresh-cycle-duration-google device swapchain pDisplayTimingProperties) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchain*: `VkSwapchainKHR`
  * *pDisplayTimingProperties*: `VkRefreshCycleDurationGOOGLE`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPastPresentationTimingGOOGLE

**get-past-presentation-timing-google**
```lisp
(get-past-presentation-timing-google device swapchain pPresentationTimingCount pPresentationTimings) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchain*: `VkSwapchainKHR`
  * *pPresentationTimingCount*: `uint32`
  * *pPresentationTimings*: `VkPastPresentationTimingGOOGLE`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDiscardRectangleEXT

**cmd-set-discard-rectangle-ext**
```lisp
(cmd-set-discard-rectangle-ext commandBuffer firstDiscardRectangle discardRectangleCount pDiscardRectangles) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstDiscardRectangle*: `uint32`
  * *discardRectangleCount*: `uint32`
  * *pDiscardRectangles*: `VkRect2D`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkSetHdrMetadataEXT

**set-hdr-metadata-ext**
```lisp
(set-hdr-metadata-ext device swapchainCount pSwapchains pMetadata) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapchainCount*: `uint32`
  * *pSwapchains*: `VkSwapchainKHR`
  * *pMetadata*: `VkHdrMetadataEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkSetDebugUtilsObjectNameEXT

**set-debug-utils-object-name-ext**
```lisp
(set-debug-utils-object-name-ext device pNameInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pNameInfo*: `VkDebugUtilsObjectNameInfoEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkSetDebugUtilsObjectTagEXT

**set-debug-utils-object-tag-ext**
```lisp
(set-debug-utils-object-tag-ext device pTagInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pTagInfo*: `VkDebugUtilsObjectTagInfoEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkQueueBeginDebugUtilsLabelEXT

**queue-begin-debug-utils-label-ext**
```lisp
(queue-begin-debug-utils-label-ext queue pLabelInfo) => return-value
```

* *Parameters*:
  * *queue*: `VkQueue`
  * *pLabelInfo*: `VkDebugUtilsLabelEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkQueueEndDebugUtilsLabelEXT

**queue-end-debug-utils-label-ext**
```lisp
(queue-end-debug-utils-label-ext queue) => return-value
```

* *Parameters*:
  * *queue*: `VkQueue`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkQueueInsertDebugUtilsLabelEXT

**queue-insert-debug-utils-label-ext**
```lisp
(queue-insert-debug-utils-label-ext queue pLabelInfo) => return-value
```

* *Parameters*:
  * *queue*: `VkQueue`
  * *pLabelInfo*: `VkDebugUtilsLabelEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBeginDebugUtilsLabelEXT

**cmd-begin-debug-utils-label-ext**
```lisp
(cmd-begin-debug-utils-label-ext commandBuffer pLabelInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pLabelInfo*: `VkDebugUtilsLabelEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdEndDebugUtilsLabelEXT

**cmd-end-debug-utils-label-ext**
```lisp
(cmd-end-debug-utils-label-ext commandBuffer) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdInsertDebugUtilsLabelEXT

**cmd-insert-debug-utils-label-ext**
```lisp
(cmd-insert-debug-utils-label-ext commandBuffer pLabelInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pLabelInfo*: `VkDebugUtilsLabelEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateDebugUtilsMessengerEXT

**create-debug-utils-messenger-ext**
```lisp
(create-debug-utils-messenger-ext instance pCreateInfo pAllocator) => (values pMessenger result)
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *pCreateInfo*: `VkDebugUtilsMessengerCreateInfoEXT`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pMessenger*: `VkDebugUtilsMessengerEXT`
  * *result*: `VkResult`

## vkDestroyDebugUtilsMessengerEXT

**destroy-debug-utils-messenger-ext**
```lisp
(destroy-debug-utils-messenger-ext instance messenger pAllocator)
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *messenger*: `VkDebugUtilsMessengerEXT`
  * *pAllocator*: `VkAllocationCallbacks`

**with-debug-utils-messenger-ext**
```lisp
(with-debug-utils-messenger-ext var (&rest args)
  &body body)
```
Wrap the body expressions with `create-debug-utils-messenger-ext` and `destroy-debug-utils-messenger-ext`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## vkSubmitDebugUtilsMessageEXT

**submit-debug-utils-message-ext**
```lisp
(submit-debug-utils-message-ext instance messageSeverity messageTypes pCallbackData) => return-value
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *messageSeverity*: `VkDebugUtilsMessageSeverityFlagBitsEXT`
  * *messageTypes*: `VkDebugUtilsMessageTypeFlagsEXT`
  * *pCallbackData*: `VkDebugUtilsMessengerCallbackDataEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetSampleLocationsEXT

**cmd-set-sample-locations-ext**
```lisp
(cmd-set-sample-locations-ext commandBuffer pSampleLocationsInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pSampleLocationsInfo*: `VkSampleLocationsInfoEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceMultisamplePropertiesEXT

**get-physical-device-multisample-properties-ext**
```lisp
(get-physical-device-multisample-properties-ext physicalDevice samples pMultisampleProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *samples*: `VkSampleCountFlagBits`
  * *pMultisampleProperties*: `VkMultisamplePropertiesEXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetImageDrmFormatModifierPropertiesEXT

**get-image-drm-format-modifier-properties-ext**
```lisp
(get-image-drm-format-modifier-properties-ext device image pProperties) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *image*: `VkImage`
  * *pProperties*: `VkImageDrmFormatModifierPropertiesEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateValidationCacheEXT

**create-validation-cache-ext**
```lisp
(create-validation-cache-ext device pCreateInfo pAllocator pValidationCache) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkValidationCacheCreateInfoEXT`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pValidationCache*: `VkValidationCacheEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyValidationCacheEXT

**destroy-validation-cache-ext**
```lisp
(destroy-validation-cache-ext device validationCache pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *validationCache*: `VkValidationCacheEXT`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkMergeValidationCachesEXT

**merge-validation-caches-ext**
```lisp
(merge-validation-caches-ext device dstCache srcCacheCount pSrcCaches) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *dstCache*: `VkValidationCacheEXT`
  * *srcCacheCount*: `uint32`
  * *pSrcCaches*: `VkValidationCacheEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetValidationCacheDataEXT

**get-validation-cache-data-ext**
```lisp
(get-validation-cache-data-ext device validationCache pDataSize pData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *validationCache*: `VkValidationCacheEXT`
  * *pDataSize*: `size`
  * *pData*: `void`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBindShadingRateImageNV

**cmd-bind-shading-rate-image-nv**
```lisp
(cmd-bind-shading-rate-image-nv commandBuffer imageView imageLayout) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *imageView*: `VkImageView`
  * *imageLayout*: `VkImageLayout`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetViewportShadingRatePaletteNV

**cmd-set-viewport-shading-rate-palette-nv**
```lisp
(cmd-set-viewport-shading-rate-palette-nv commandBuffer firstViewport viewportCount pShadingRatePalettes) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstViewport*: `uint32`
  * *viewportCount*: `uint32`
  * *pShadingRatePalettes*: `VkShadingRatePaletteNV`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetCoarseSampleOrderNV

**cmd-set-coarse-sample-order-nv**
```lisp
(cmd-set-coarse-sample-order-nv commandBuffer sampleOrderType customSampleOrderCount pCustomSampleOrders) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *sampleOrderType*: `VkCoarseSampleOrderTypeNV`
  * *customSampleOrderCount*: `uint32`
  * *pCustomSampleOrders*: `VkCoarseSampleOrderCustomNV`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateAccelerationStructureNV

**create-acceleration-structure-nv**
```lisp
(create-acceleration-structure-nv device pCreateInfo pAllocator pAccelerationStructure) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkAccelerationStructureCreateInfoNV`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pAccelerationStructure*: `VkAccelerationStructureNV`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyAccelerationStructureNV

**destroy-acceleration-structure-nv**
```lisp
(destroy-acceleration-structure-nv device accelerationStructure pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *accelerationStructure*: `VkAccelerationStructureNV`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetAccelerationStructureMemoryRequirementsNV

**get-acceleration-structure-memory-requirements-nv**
```lisp
(get-acceleration-structure-memory-requirements-nv device pInfo pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkAccelerationStructureMemoryRequirementsInfoNV`
  * *pMemoryRequirements*: `VkMemoryRequirements2KHR`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkBindAccelerationStructureMemoryNV

**bind-acceleration-structure-memory-nv**
```lisp
(bind-acceleration-structure-memory-nv device bindInfoCount pBindInfos) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *bindInfoCount*: `uint32`
  * *pBindInfos*: `VkBindAccelerationStructureMemoryInfoNV`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBuildAccelerationStructureNV

**cmd-build-acceleration-structure-nv**
```lisp
(cmd-build-acceleration-structure-nv commandBuffer pInfo instanceData instanceOffset update dst src scratch scratchOffset) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pInfo*: `VkAccelerationStructureInfoNV`
  * *instanceData*: `VkBuffer`
  * *instanceOffset*: `VkDeviceSize`
  * *update*: `VkBool32`
  * *dst*: `VkAccelerationStructureNV`
  * *src*: `VkAccelerationStructureNV`
  * *scratch*: `VkBuffer`
  * *scratchOffset*: `VkDeviceSize`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyAccelerationStructureNV

**cmd-copy-acceleration-structure-nv**
```lisp
(cmd-copy-acceleration-structure-nv commandBuffer dst src mode) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *dst*: `VkAccelerationStructureNV`
  * *src*: `VkAccelerationStructureNV`
  * *mode*: `VkCopyAccelerationStructureModeKHR`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdTraceRaysNV

**cmd-trace-rays-nv**
```lisp
(cmd-trace-rays-nv commandBuffer raygenShaderBindingTableBuffer raygenShaderBindingOffset missShaderBindingTableBuffer missShaderBindingOffset missShaderBindingStride hitShaderBindingTableBuffer hitShaderBindingOffset hitShaderBindingStride callableShaderBindingTableBuffer callableShaderBindingOffset callableShaderBindingStride width height depth) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *raygenShaderBindingTableBuffer*: `VkBuffer`
  * *raygenShaderBindingOffset*: `VkDeviceSize`
  * *missShaderBindingTableBuffer*: `VkBuffer`
  * *missShaderBindingOffset*: `VkDeviceSize`
  * *missShaderBindingStride*: `VkDeviceSize`
  * *hitShaderBindingTableBuffer*: `VkBuffer`
  * *hitShaderBindingOffset*: `VkDeviceSize`
  * *hitShaderBindingStride*: `VkDeviceSize`
  * *callableShaderBindingTableBuffer*: `VkBuffer`
  * *callableShaderBindingOffset*: `VkDeviceSize`
  * *callableShaderBindingStride*: `VkDeviceSize`
  * *width*: `uint32`
  * *height*: `uint32`
  * *depth*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateRayTracingPipelinesNV

**create-ray-tracing-pipelines-nv**
```lisp
(create-ray-tracing-pipelines-nv device pipelineCache createInfoCount pCreateInfos pAllocator pPipelines) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipelineCache*: `VkPipelineCache`
  * *createInfoCount*: `uint32`
  * *pCreateInfos*: `VkRayTracingPipelineCreateInfoNV`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pPipelines*: `VkPipeline`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetRayTracingShaderGroupHandlesKHR

**get-ray-tracing-shader-group-handles-khr**
```lisp
(get-ray-tracing-shader-group-handles-khr device pipeline firstGroup groupCount dataSize pData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipeline*: `VkPipeline`
  * *firstGroup*: `uint32`
  * *groupCount*: `uint32`
  * *dataSize*: `size`
  * *pData*: `void`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetRayTracingShaderGroupHandlesNV

**get-ray-tracing-shader-group-handles-nv**
```lisp
(get-ray-tracing-shader-group-handles-nv device pipeline firstGroup groupCount dataSize pData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipeline*: `VkPipeline`
  * *firstGroup*: `uint32`
  * *groupCount*: `uint32`
  * *dataSize*: `size`
  * *pData*: `void`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetAccelerationStructureHandleNV

**get-acceleration-structure-handle-nv**
```lisp
(get-acceleration-structure-handle-nv device accelerationStructure dataSize pData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *accelerationStructure*: `VkAccelerationStructureNV`
  * *dataSize*: `size`
  * *pData*: `void`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdWriteAccelerationStructuresPropertiesNV

**cmd-write-acceleration-structures-properties-nv**
```lisp
(cmd-write-acceleration-structures-properties-nv commandBuffer accelerationStructureCount pAccelerationStructures queryType queryPool firstQuery) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *accelerationStructureCount*: `uint32`
  * *pAccelerationStructures*: `VkAccelerationStructureNV`
  * *queryType*: `VkQueryType`
  * *queryPool*: `VkQueryPool`
  * *firstQuery*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCompileDeferredNV

**compile-deferred-nv**
```lisp
(compile-deferred-nv device pipeline shader) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipeline*: `VkPipeline`
  * *shader*: `uint32`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetMemoryHostPointerPropertiesEXT

**get-memory-host-pointer-properties-ext**
```lisp
(get-memory-host-pointer-properties-ext device handleType pHostPointer pMemoryHostPointerProperties) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *handleType*: `VkExternalMemoryHandleTypeFlagBits`
  * *pHostPointer*: `void`
  * *pMemoryHostPointerProperties*: `VkMemoryHostPointerPropertiesEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdWriteBufferMarkerAMD

**cmd-write-buffer-marker-amd**
```lisp
(cmd-write-buffer-marker-amd commandBuffer pipelineStage dstBuffer dstOffset marker) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pipelineStage*: `VkPipelineStageFlagBits`
  * *dstBuffer*: `VkBuffer`
  * *dstOffset*: `VkDeviceSize`
  * *marker*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceCalibrateableTimeDomainsEXT

**get-physical-device-calibrateable-time-domains-ext**
```lisp
(get-physical-device-calibrateable-time-domains-ext physicalDevice pTimeDomainCount pTimeDomains) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pTimeDomainCount*: `uint32`
  * *pTimeDomains*: `VkTimeDomainEXT`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetCalibratedTimestampsEXT

**get-calibrated-timestamps-ext**
```lisp
(get-calibrated-timestamps-ext device timestampCount pTimestampInfos pTimestamps pMaxDeviation) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *timestampCount*: `uint32`
  * *pTimestampInfos*: `VkCalibratedTimestampInfoEXT`
  * *pTimestamps*: `uint64`
  * *pMaxDeviation*: `uint64`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawMeshTasksNV

**cmd-draw-mesh-tasks-nv**
```lisp
(cmd-draw-mesh-tasks-nv commandBuffer taskCount firstTask) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *taskCount*: `uint32`
  * *firstTask*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawMeshTasksIndirectNV

**cmd-draw-mesh-tasks-indirect-nv**
```lisp
(cmd-draw-mesh-tasks-indirect-nv commandBuffer buffer offset drawCount stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *drawCount*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawMeshTasksIndirectCountNV

**cmd-draw-mesh-tasks-indirect-count-nv**
```lisp
(cmd-draw-mesh-tasks-indirect-count-nv commandBuffer buffer offset countBuffer countBufferOffset maxDrawCount stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *buffer*: `VkBuffer`
  * *offset*: `VkDeviceSize`
  * *countBuffer*: `VkBuffer`
  * *countBufferOffset*: `VkDeviceSize`
  * *maxDrawCount*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetExclusiveScissorNV

**cmd-set-exclusive-scissor-nv**
```lisp
(cmd-set-exclusive-scissor-nv commandBuffer firstExclusiveScissor exclusiveScissorCount pExclusiveScissors) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstExclusiveScissor*: `uint32`
  * *exclusiveScissorCount*: `uint32`
  * *pExclusiveScissors*: `VkRect2D`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetCheckpointNV

**cmd-set-checkpoint-nv**
```lisp
(cmd-set-checkpoint-nv commandBuffer pCheckpointMarker) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pCheckpointMarker*: `void`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetQueueCheckpointDataNV

**get-queue-checkpoint-data-nv**
```lisp
(get-queue-checkpoint-data-nv queue pCheckpointDataCount pCheckpointData) => return-value
```

* *Parameters*:
  * *queue*: `VkQueue`
  * *pCheckpointDataCount*: `uint32`
  * *pCheckpointData*: `VkCheckpointDataNV`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkInitializePerformanceApiINTEL

**initialize-performance-api-intel**
```lisp
(initialize-performance-api-intel device pInitializeInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInitializeInfo*: `VkInitializePerformanceApiInfoINTEL`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkUninitializePerformanceApiINTEL

**uninitialize-performance-api-intel**
```lisp
(uninitialize-performance-api-intel device) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetPerformanceMarkerINTEL

**cmd-set-performance-marker-intel**
```lisp
(cmd-set-performance-marker-intel commandBuffer pMarkerInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pMarkerInfo*: `VkPerformanceMarkerInfoINTEL`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetPerformanceStreamMarkerINTEL

**cmd-set-performance-stream-marker-intel**
```lisp
(cmd-set-performance-stream-marker-intel commandBuffer pMarkerInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pMarkerInfo*: `VkPerformanceStreamMarkerInfoINTEL`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetPerformanceOverrideINTEL

**cmd-set-performance-override-intel**
```lisp
(cmd-set-performance-override-intel commandBuffer pOverrideInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pOverrideInfo*: `VkPerformanceOverrideInfoINTEL`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkAcquirePerformanceConfigurationINTEL

**acquire-performance-configuration-intel**
```lisp
(acquire-performance-configuration-intel device pAcquireInfo pConfiguration) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pAcquireInfo*: `VkPerformanceConfigurationAcquireInfoINTEL`
  * *pConfiguration*: `VkPerformanceConfigurationINTEL`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkReleasePerformanceConfigurationINTEL

**release-performance-configuration-intel**
```lisp
(release-performance-configuration-intel device configuration) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *configuration*: `VkPerformanceConfigurationINTEL`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkQueueSetPerformanceConfigurationINTEL

**queue-set-performance-configuration-intel**
```lisp
(queue-set-performance-configuration-intel queue configuration) => return-value
```

* *Parameters*:
  * *queue*: `VkQueue`
  * *configuration*: `VkPerformanceConfigurationINTEL`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPerformanceParameterINTEL

**get-performance-parameter-intel**
```lisp
(get-performance-parameter-intel device parameter pValue) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *parameter*: `VkPerformanceParameterTypeINTEL`
  * *pValue*: `VkPerformanceValueINTEL`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkSetLocalDimmingAMD

**set-local-dimming-amd**
```lisp
(set-local-dimming-amd device swapChain localDimmingEnable) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *swapChain*: `VkSwapchainKHR`
  * *localDimmingEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetBufferDeviceAddressEXT

**get-buffer-device-address-ext**
```lisp
(get-buffer-device-address-ext device pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkBufferDeviceAddressInfo`

* *Return:*
  * *return-value*: `VkDeviceAddress`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceToolPropertiesEXT

**get-physical-device-tool-properties-ext**
```lisp
(get-physical-device-tool-properties-ext physicalDevice pToolCount pToolProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pToolCount*: `uint32`
  * *pToolProperties*: `VkPhysicalDeviceToolProperties`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceCooperativeMatrixPropertiesNV

**get-physical-device-cooperative-matrix-properties-nv**
```lisp
(get-physical-device-cooperative-matrix-properties-nv physicalDevice pPropertyCount pProperties) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pPropertyCount*: `uint32`
  * *pProperties*: `VkCooperativeMatrixPropertiesNV`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV

**get-physical-device-supported-framebuffer-mixed-samples-combinations-nv**
```lisp
(get-physical-device-supported-framebuffer-mixed-samples-combinations-nv physicalDevice pCombinationCount pCombinations) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *pCombinationCount*: `uint32`
  * *pCombinations*: `VkFramebufferMixedSamplesCombinationNV`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateHeadlessSurfaceEXT

**create-headless-surface-ext**
```lisp
(create-headless-surface-ext instance pCreateInfo pAllocator pSurface) => return-value
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *pCreateInfo*: `VkHeadlessSurfaceCreateInfoEXT`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pSurface*: `VkSurfaceKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetLineStippleEXT

**cmd-set-line-stipple-ext**
```lisp
(cmd-set-line-stipple-ext commandBuffer lineStippleFactor lineStipplePattern) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *lineStippleFactor*: `uint32`
  * *lineStipplePattern*: `uint16`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkResetQueryPoolEXT

**reset-query-pool-ext**
```lisp
(reset-query-pool-ext device queryPool firstQuery queryCount) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *queryPool*: `VkQueryPool`
  * *firstQuery*: `uint32`
  * *queryCount*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetCullModeEXT

**cmd-set-cull-mode-ext**
```lisp
(cmd-set-cull-mode-ext commandBuffer cullMode) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *cullMode*: `VkCullModeFlags`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetFrontFaceEXT

**cmd-set-front-face-ext**
```lisp
(cmd-set-front-face-ext commandBuffer frontFace) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *frontFace*: `VkFrontFace`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetPrimitiveTopologyEXT

**cmd-set-primitive-topology-ext**
```lisp
(cmd-set-primitive-topology-ext commandBuffer primitiveTopology) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *primitiveTopology*: `VkPrimitiveTopology`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetViewportWithCountEXT

**cmd-set-viewport-with-count-ext**
```lisp
(cmd-set-viewport-with-count-ext commandBuffer viewportCount pViewports) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *viewportCount*: `uint32`
  * *pViewports*: `VkViewport`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetScissorWithCountEXT

**cmd-set-scissor-with-count-ext**
```lisp
(cmd-set-scissor-with-count-ext commandBuffer scissorCount pScissors) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *scissorCount*: `uint32`
  * *pScissors*: `VkRect2D`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBindVertexBuffers2EXT

**cmd-bind-vertex-buffers-2-ext**
```lisp
(cmd-bind-vertex-buffers-2-ext commandBuffer firstBinding bindingCount pBuffers pOffsets pSizes pStrides) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *firstBinding*: `uint32`
  * *bindingCount*: `uint32`
  * *pBuffers*: `VkBuffer`
  * *pOffsets*: `VkDeviceSize`
  * *pSizes*: `VkDeviceSize`
  * *pStrides*: `VkDeviceSize`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthTestEnableEXT

**cmd-set-depth-test-enable-ext**
```lisp
(cmd-set-depth-test-enable-ext commandBuffer depthTestEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthTestEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthWriteEnableEXT

**cmd-set-depth-write-enable-ext**
```lisp
(cmd-set-depth-write-enable-ext commandBuffer depthWriteEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthWriteEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthCompareOpEXT

**cmd-set-depth-compare-op-ext**
```lisp
(cmd-set-depth-compare-op-ext commandBuffer depthCompareOp) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthCompareOp*: `VkCompareOp`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthBoundsTestEnableEXT

**cmd-set-depth-bounds-test-enable-ext**
```lisp
(cmd-set-depth-bounds-test-enable-ext commandBuffer depthBoundsTestEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthBoundsTestEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetStencilTestEnableEXT

**cmd-set-stencil-test-enable-ext**
```lisp
(cmd-set-stencil-test-enable-ext commandBuffer stencilTestEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *stencilTestEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetStencilOpEXT

**cmd-set-stencil-op-ext**
```lisp
(cmd-set-stencil-op-ext commandBuffer faceMask failOp passOp depthFailOp compareOp) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *faceMask*: `VkStencilFaceFlags`
  * *failOp*: `VkStencilOp`
  * *passOp*: `VkStencilOp`
  * *depthFailOp*: `VkStencilOp`
  * *compareOp*: `VkCompareOp`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetGeneratedCommandsMemoryRequirementsNV

**get-generated-commands-memory-requirements-nv**
```lisp
(get-generated-commands-memory-requirements-nv device pInfo pMemoryRequirements) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkGeneratedCommandsMemoryRequirementsInfoNV`
  * *pMemoryRequirements*: `VkMemoryRequirements2`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdPreprocessGeneratedCommandsNV

**cmd-preprocess-generated-commands-nv**
```lisp
(cmd-preprocess-generated-commands-nv commandBuffer pGeneratedCommandsInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pGeneratedCommandsInfo*: `VkGeneratedCommandsInfoNV`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdExecuteGeneratedCommandsNV

**cmd-execute-generated-commands-nv**
```lisp
(cmd-execute-generated-commands-nv commandBuffer isPreprocessed pGeneratedCommandsInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *isPreprocessed*: `VkBool32`
  * *pGeneratedCommandsInfo*: `VkGeneratedCommandsInfoNV`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBindPipelineShaderGroupNV

**cmd-bind-pipeline-shader-group-nv**
```lisp
(cmd-bind-pipeline-shader-group-nv commandBuffer pipelineBindPoint pipeline groupIndex) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pipelineBindPoint*: `VkPipelineBindPoint`
  * *pipeline*: `VkPipeline`
  * *groupIndex*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateIndirectCommandsLayoutNV

**create-indirect-commands-layout-nv**
```lisp
(create-indirect-commands-layout-nv device pCreateInfo pAllocator pIndirectCommandsLayout) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkIndirectCommandsLayoutCreateInfoNV`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pIndirectCommandsLayout*: `VkIndirectCommandsLayoutNV`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyIndirectCommandsLayoutNV

**destroy-indirect-commands-layout-nv**
```lisp
(destroy-indirect-commands-layout-nv device indirectCommandsLayout pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *indirectCommandsLayout*: `VkIndirectCommandsLayoutNV`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkAcquireDrmDisplayEXT

**acquire-drm-display-ext**
```lisp
(acquire-drm-display-ext physicalDevice drmFd display) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *drmFd*: `int32`
  * *display*: `VkDisplayKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDrmDisplayEXT

**get-drm-display-ext**
```lisp
(get-drm-display-ext physicalDevice drmFd connectorId display) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *drmFd*: `int32`
  * *connectorId*: `uint32`
  * *display*: `VkDisplayKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreatePrivateDataSlotEXT

**create-private-data-slot-ext**
```lisp
(create-private-data-slot-ext device pCreateInfo pAllocator pPrivateDataSlot) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkPrivateDataSlotCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pPrivateDataSlot*: `VkPrivateDataSlot`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyPrivateDataSlotEXT

**destroy-private-data-slot-ext**
```lisp
(destroy-private-data-slot-ext device privateDataSlot pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *privateDataSlot*: `VkPrivateDataSlot`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkSetPrivateDataEXT

**set-private-data-ext**
```lisp
(set-private-data-ext device objectType objectHandle privateDataSlot data) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *objectType*: `VkObjectType`
  * *objectHandle*: `uint64`
  * *privateDataSlot*: `VkPrivateDataSlot`
  * *data*: `uint64`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPrivateDataEXT

**get-private-data-ext**
```lisp
(get-private-data-ext device objectType objectHandle privateDataSlot pData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *objectType*: `VkObjectType`
  * *objectHandle*: `uint64`
  * *privateDataSlot*: `VkPrivateDataSlot`
  * *pData*: `uint64`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetFragmentShadingRateEnumNV

**cmd-set-fragment-shading-rate-enum-nv**
```lisp
(cmd-set-fragment-shading-rate-enum-nv commandBuffer shadingRate combinerOps) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *shadingRate*: `VkFragmentShadingRateNV`
  * *combinerOps*: `VkFragmentShadingRateCombinerOpKHR`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetImageSubresourceLayout2EXT

**get-image-subresource-layout-2-ext**
```lisp
(get-image-subresource-layout-2-ext device image pSubresource pLayout) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *image*: `VkImage`
  * *pSubresource*: `VkImageSubresource2EXT`
  * *pLayout*: `VkSubresourceLayout2EXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkAcquireWinrtDisplayNV

**acquire-winrt-display-nv**
```lisp
(acquire-winrt-display-nv physicalDevice display) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *display*: `VkDisplayKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetWinrtDisplayNV

**get-winrt-display-nv**
```lisp
(get-winrt-display-nv physicalDevice deviceRelativeId pDisplay) => return-value
```

* *Parameters*:
  * *physicalDevice*: `VkPhysicalDevice`
  * *deviceRelativeId*: `uint32`
  * *pDisplay*: `VkDisplayKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetVertexInputEXT

**cmd-set-vertex-input-ext**
```lisp
(cmd-set-vertex-input-ext commandBuffer vertexBindingDescriptionCount pVertexBindingDescriptions vertexAttributeDescriptionCount pVertexAttributeDescriptions) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *vertexBindingDescriptionCount*: `uint32`
  * *pVertexBindingDescriptions*: `VkVertexInputBindingDescription2EXT`
  * *vertexAttributeDescriptionCount*: `uint32`
  * *pVertexAttributeDescriptions*: `VkVertexInputAttributeDescription2EXT`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI

**get-device-subpass-shading-max-workgroup-size-huawei**
```lisp
(get-device-subpass-shading-max-workgroup-size-huawei device renderpass pMaxWorkgroupSize) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *renderpass*: `VkRenderPass`
  * *pMaxWorkgroupSize*: `VkExtent2D`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSubpassShadingHUAWEI

**cmd-subpass-shading-huawei**
```lisp
(cmd-subpass-shading-huawei commandBuffer) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBindInvocationMaskHUAWEI

**cmd-bind-invocation-mask-huawei**
```lisp
(cmd-bind-invocation-mask-huawei commandBuffer imageView imageLayout) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *imageView*: `VkImageView`
  * *imageLayout*: `VkImageLayout`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetMemoryRemoteAddressNV

**get-memory-remote-address-nv**
```lisp
(get-memory-remote-address-nv device pMemoryGetRemoteAddressInfo pAddress) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pMemoryGetRemoteAddressInfo*: `VkMemoryGetRemoteAddressInfoNV`
  * *pAddress*: `VkRemoteAddressNV`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetPipelinePropertiesEXT

**get-pipeline-properties-ext**
```lisp
(get-pipeline-properties-ext device pPipelineInfo pPipelineProperties) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pPipelineInfo*: `VkPipelineInfoEXT`
  * *pPipelineProperties*: `VkBaseOutStructure`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetPatchControlPointsEXT

**cmd-set-patch-control-points-ext**
```lisp
(cmd-set-patch-control-points-ext commandBuffer patchControlPoints) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *patchControlPoints*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetRasterizerDiscardEnableEXT

**cmd-set-rasterizer-discard-enable-ext**
```lisp
(cmd-set-rasterizer-discard-enable-ext commandBuffer rasterizerDiscardEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *rasterizerDiscardEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetDepthBiasEnableEXT

**cmd-set-depth-bias-enable-ext**
```lisp
(cmd-set-depth-bias-enable-ext commandBuffer depthBiasEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *depthBiasEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetLogicOpEXT

**cmd-set-logic-op-ext**
```lisp
(cmd-set-logic-op-ext commandBuffer logicOp) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *logicOp*: `VkLogicOp`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetPrimitiveRestartEnableEXT

**cmd-set-primitive-restart-enable-ext**
```lisp
(cmd-set-primitive-restart-enable-ext commandBuffer primitiveRestartEnable) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *primitiveRestartEnable*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetColorWriteEnableEXT

**cmd-set-color-write-enable-ext**
```lisp
(cmd-set-color-write-enable-ext commandBuffer attachmentCount pColorWriteEnables) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *attachmentCount*: `uint32`
  * *pColorWriteEnables*: `VkBool32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawMultiEXT

**cmd-draw-multi-ext**
```lisp
(cmd-draw-multi-ext commandBuffer drawCount pVertexInfo instanceCount firstInstance stride) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *drawCount*: `uint32`
  * *pVertexInfo*: `VkMultiDrawInfoEXT`
  * *instanceCount*: `uint32`
  * *firstInstance*: `uint32`
  * *stride*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdDrawMultiIndexedEXT

**cmd-draw-multi-indexed-ext**
```lisp
(cmd-draw-multi-indexed-ext commandBuffer drawCount pIndexInfo instanceCount firstInstance stride pVertexOffset) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *drawCount*: `uint32`
  * *pIndexInfo*: `VkMultiDrawIndexedInfoEXT`
  * *instanceCount*: `uint32`
  * *firstInstance*: `uint32`
  * *stride*: `uint32`
  * *pVertexOffset*: `int32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkSetDeviceMemoryPriorityEXT

**set-device-memory-priority-ext**
```lisp
(set-device-memory-priority-ext device memory priority) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *memory*: `VkDeviceMemory`
  * *priority*: `float`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDescriptorSetLayoutHostMappingInfoVALVE

**get-descriptor-set-layout-host-mapping-info-valve**
```lisp
(get-descriptor-set-layout-host-mapping-info-valve device pBindingReference pHostMapping) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pBindingReference*: `VkDescriptorSetBindingReferenceVALVE`
  * *pHostMapping*: `VkDescriptorSetLayoutHostMappingInfoVALVE`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDescriptorSetHostMappingVALVE

**get-descriptor-set-host-mapping-valve**
```lisp
(get-descriptor-set-host-mapping-valve device descriptorSet ppData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *descriptorSet*: `VkDescriptorSet`
  * *ppData*: `void`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateAccelerationStructureKHR

**create-acceleration-structure-khr**
```lisp
(create-acceleration-structure-khr device pCreateInfo pAllocator pAccelerationStructure) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkAccelerationStructureCreateInfoKHR`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pAccelerationStructure*: `VkAccelerationStructureKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkDestroyAccelerationStructureKHR

**destroy-acceleration-structure-khr**
```lisp
(destroy-acceleration-structure-khr device accelerationStructure pAllocator) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *accelerationStructure*: `VkAccelerationStructureKHR`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBuildAccelerationStructuresKHR

**cmd-build-acceleration-structures-khr**
```lisp
(cmd-build-acceleration-structures-khr commandBuffer infoCount pInfos ppBuildRangeInfos) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *infoCount*: `uint32`
  * *pInfos*: `VkAccelerationStructureBuildGeometryInfoKHR`
  * *ppBuildRangeInfos*: `VkAccelerationStructureBuildRangeInfoKHR`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdBuildAccelerationStructuresIndirectKHR

**cmd-build-acceleration-structures-indirect-khr**
```lisp
(cmd-build-acceleration-structures-indirect-khr commandBuffer infoCount pInfos pIndirectDeviceAddresses pIndirectStrides ppMaxPrimitiveCounts) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *infoCount*: `uint32`
  * *pInfos*: `VkAccelerationStructureBuildGeometryInfoKHR`
  * *pIndirectDeviceAddresses*: `VkDeviceAddress`
  * *pIndirectStrides*: `uint32`
  * *ppMaxPrimitiveCounts*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkBuildAccelerationStructuresKHR

**build-acceleration-structures-khr**
```lisp
(build-acceleration-structures-khr device deferredOperation infoCount pInfos ppBuildRangeInfos) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *deferredOperation*: `VkDeferredOperationKHR`
  * *infoCount*: `uint32`
  * *pInfos*: `VkAccelerationStructureBuildGeometryInfoKHR`
  * *ppBuildRangeInfos*: `VkAccelerationStructureBuildRangeInfoKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCopyAccelerationStructureKHR

**copy-acceleration-structure-khr**
```lisp
(copy-acceleration-structure-khr device deferredOperation pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *deferredOperation*: `VkDeferredOperationKHR`
  * *pInfo*: `VkCopyAccelerationStructureInfoKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCopyAccelerationStructureToMemoryKHR

**copy-acceleration-structure-to-memory-khr**
```lisp
(copy-acceleration-structure-to-memory-khr device deferredOperation pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *deferredOperation*: `VkDeferredOperationKHR`
  * *pInfo*: `VkCopyAccelerationStructureToMemoryInfoKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCopyMemoryToAccelerationStructureKHR

**copy-memory-to-acceleration-structure-khr**
```lisp
(copy-memory-to-acceleration-structure-khr device deferredOperation pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *deferredOperation*: `VkDeferredOperationKHR`
  * *pInfo*: `VkCopyMemoryToAccelerationStructureInfoKHR`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkWriteAccelerationStructuresPropertiesKHR

**write-acceleration-structures-properties-khr**
```lisp
(write-acceleration-structures-properties-khr device accelerationStructureCount pAccelerationStructures queryType dataSize pData stride) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *accelerationStructureCount*: `uint32`
  * *pAccelerationStructures*: `VkAccelerationStructureKHR`
  * *queryType*: `VkQueryType`
  * *dataSize*: `size`
  * *pData*: `void`
  * *stride*: `size`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyAccelerationStructureKHR

**cmd-copy-acceleration-structure-khr**
```lisp
(cmd-copy-acceleration-structure-khr commandBuffer pInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pInfo*: `VkCopyAccelerationStructureInfoKHR`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyAccelerationStructureToMemoryKHR

**cmd-copy-acceleration-structure-to-memory-khr**
```lisp
(cmd-copy-acceleration-structure-to-memory-khr commandBuffer pInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pInfo*: `VkCopyAccelerationStructureToMemoryInfoKHR`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdCopyMemoryToAccelerationStructureKHR

**cmd-copy-memory-to-acceleration-structure-khr**
```lisp
(cmd-copy-memory-to-acceleration-structure-khr commandBuffer pInfo) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pInfo*: `VkCopyMemoryToAccelerationStructureInfoKHR`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetAccelerationStructureDeviceAddressKHR

**get-acceleration-structure-device-address-khr**
```lisp
(get-acceleration-structure-device-address-khr device pInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pInfo*: `VkAccelerationStructureDeviceAddressInfoKHR`

* *Return:*
  * *return-value*: `VkDeviceAddress`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdWriteAccelerationStructuresPropertiesKHR

**cmd-write-acceleration-structures-properties-khr**
```lisp
(cmd-write-acceleration-structures-properties-khr commandBuffer accelerationStructureCount pAccelerationStructures queryType queryPool firstQuery) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *accelerationStructureCount*: `uint32`
  * *pAccelerationStructures*: `VkAccelerationStructureKHR`
  * *queryType*: `VkQueryType`
  * *queryPool*: `VkQueryPool`
  * *firstQuery*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetDeviceAccelerationStructureCompatibilityKHR

**get-device-acceleration-structure-compatibility-khr**
```lisp
(get-device-acceleration-structure-compatibility-khr device pVersionInfo pCompatibility) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pVersionInfo*: `VkAccelerationStructureVersionInfoKHR`
  * *pCompatibility*: `VkAccelerationStructureCompatibilityKHR`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetAccelerationStructureBuildSizesKHR

**get-acceleration-structure-build-sizes-khr**
```lisp
(get-acceleration-structure-build-sizes-khr device buildType pBuildInfo pMaxPrimitiveCounts pSizeInfo) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *buildType*: `VkAccelerationStructureBuildTypeKHR`
  * *pBuildInfo*: `VkAccelerationStructureBuildGeometryInfoKHR`
  * *pMaxPrimitiveCounts*: `uint32`
  * *pSizeInfo*: `VkAccelerationStructureBuildSizesInfoKHR`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdTraceRaysKHR

**cmd-trace-rays-khr**
```lisp
(cmd-trace-rays-khr commandBuffer pRaygenShaderBindingTable pMissShaderBindingTable pHitShaderBindingTable pCallableShaderBindingTable width height depth) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pRaygenShaderBindingTable*: `VkStridedDeviceAddressRegionKHR`
  * *pMissShaderBindingTable*: `VkStridedDeviceAddressRegionKHR`
  * *pHitShaderBindingTable*: `VkStridedDeviceAddressRegionKHR`
  * *pCallableShaderBindingTable*: `VkStridedDeviceAddressRegionKHR`
  * *width*: `uint32`
  * *height*: `uint32`
  * *depth*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCreateRayTracingPipelinesKHR

**create-ray-tracing-pipelines-khr**
```lisp
(create-ray-tracing-pipelines-khr device deferredOperation pipelineCache createInfoCount pCreateInfos pAllocator pPipelines) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *deferredOperation*: `VkDeferredOperationKHR`
  * *pipelineCache*: `VkPipelineCache`
  * *createInfoCount*: `uint32`
  * *pCreateInfos*: `VkRayTracingPipelineCreateInfoKHR`
  * *pAllocator*: `VkAllocationCallbacks`
  * *pPipelines*: `VkPipeline`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetRayTracingCaptureReplayShaderGroupHandlesKHR

**get-ray-tracing-capture-replay-shader-group-handles-khr**
```lisp
(get-ray-tracing-capture-replay-shader-group-handles-khr device pipeline firstGroup groupCount dataSize pData) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipeline*: `VkPipeline`
  * *firstGroup*: `uint32`
  * *groupCount*: `uint32`
  * *dataSize*: `size`
  * *pData*: `void`

* *Return:*
  * *return-value*: `VkResult`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdTraceRaysIndirectKHR

**cmd-trace-rays-indirect-khr**
```lisp
(cmd-trace-rays-indirect-khr commandBuffer pRaygenShaderBindingTable pMissShaderBindingTable pHitShaderBindingTable pCallableShaderBindingTable indirectDeviceAddress) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pRaygenShaderBindingTable*: `VkStridedDeviceAddressRegionKHR`
  * *pMissShaderBindingTable*: `VkStridedDeviceAddressRegionKHR`
  * *pHitShaderBindingTable*: `VkStridedDeviceAddressRegionKHR`
  * *pCallableShaderBindingTable*: `VkStridedDeviceAddressRegionKHR`
  * *indirectDeviceAddress*: `VkDeviceAddress`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkGetRayTracingShaderGroupStackSizeKHR

**get-ray-tracing-shader-group-stack-size-khr**
```lisp
(get-ray-tracing-shader-group-stack-size-khr device pipeline group groupShader) => return-value
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipeline*: `VkPipeline`
  * *group*: `uint32`
  * *groupShader*: `VkShaderGroupShaderKHR`

* *Return:*
  * *return-value*: `VkDeviceSize`

* **Note**: This function needs to be revised. Please, post an issue to request it.

## vkCmdSetRayTracingPipelineStackSizeKHR

**cmd-set-ray-tracing-pipeline-stack-size-khr**
```lisp
(cmd-set-ray-tracing-pipeline-stack-size-khr commandBuffer pipelineStackSize) => return-value
```

* *Parameters*:
  * *commandBuffer*: `VkCommandBuffer`
  * *pipelineStackSize*: `uint32`

* *Return:*
  * *return-value*: `void`

* **Note**: This function needs to be revised. Please, post an issue to request it.

