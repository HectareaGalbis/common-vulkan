
# Device

## VkDeviceQueueCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkDeviceQueueCreateFlags`
* *queueFamilyIndex*: `uint32`
* *queueCount*: `uint32`
* *pQueuePriorities*: `(list float)`

**create-device-queue-create-info**
```lisp
(create-device-queue-create-info &key (sType VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO)
                                      (pNext nil)
                                      (flags 0)
                                      (queueFamilyIndex 0)
                                      (queueCount 0)
                                      (pQueuePriorities nil))
```

**destroy-device-queue-create-info**
```lisp
(destroy-device-queue-create-info device-queue-info)
```
* *device-queue-info*: `VkDeviceQueueCreateInfo`

**with-device-queue-create-info**
```lisp
(with-device-queue-create-info var (&key (sType VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO)
                                         (pNext nil)
                                         (flags 0)
                                         (queueFamilyIndex 0)
                                         (queueCount 0)
                                         (pQueuePriorities nil))
  &body body)
```
Wraps the `body` expressions with the creation and destruction of a VkDeviceQueueCreateInfo structure. The new structure is bound to `var`. The arguments are passed to the constructor `create-device-queue-create-info`.

**Accessors**


## create-vk-device

```lisp
(create-vk-device physical-device queue-families &key (extensions nil) (features nil))
```

Creates a logical device from `physical-device`. Also creates the queues from `queue-families`. Lastly, it enables the `extensions` and `features`.

* **physical-device**: The physical device which the device is created from.
* **queue-families**: The queue families to create in the device.
* **extensions**: The extensions to be enabled.
* **features**: The features to be enabled. 

## destroy-vk-device

```lisp
(destroy-vk-device device)
```

Destroys a logical device.

* **device**: The device to be destroyed.

## with-vk-device

```lisp
(with-vk-device (var physical-device queue-families &key (extensions nil) (features nil)) 
  &body body)
```

Wraps the body expressions with the creation and destruction of a logical device. `var` is bound to the created device and the arguments are supplied to the constructor.
