
# Physical device

## get-physical-device

```lisp
(get-physical-device instance &key (surface nil) (device-type VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU)
                                   (extensions (list "VK_KHR_swapchain"))
                                   (queue-flags (logior VK_QUEUE_GRAPHICS_BIT VK_QUEUE_TRANSFER_BIT))
                                   (features nil))
```

Retrieve from the system a device which verifies some requirements.

* If `surface` is not `nil`, the device must support presentation with the given surface.
* If `device-type` is supplied, the device must be of that type. The possible values are given by [VkPhysicalDeviceType](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkPhysicalDeviceType.html) enum.
* If `extensions` are supplied, the device must support each extension in the list. Possible extensions are listed in the [spec](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/html/vkspec.html#extension-appendices-list).
* If `queue-flags` is supplied, the device must have a several queues that together supports every functionality described by the flags. Possible flags are given by [VkQueueFlagBits](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkQueueFlagBits.html) enum.
* If `features` is not `nil`, the device must support every feature in the list. Possible values are given by [VkPhysicalDeviceFeatures](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkPhysicalDeviceFeatures.html) struct. Example: `'(tesselationShader shaderStorageImageMultisample geometryShader)`.

## with-physical-device

```lisp
(with-physical-device (var instance &key (surface nil) (device-type VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU)
                                         (extensions (list "VK_KHR_swapchain"))
                                         (queue-flags (logior VK_QUEUE_GRAPHICS_BIT VK_QUEUE_TRANSFER_BIT))
                                         (features nil))
  &body body)
```

Wraps the `body` expression with the retrieval of a physical device.

* **Note**: Since there is no destruction operation, `with-physical-device` only use `get-physical-device` and no special operations are made afterwards. That is to say, this macro is created just for completeness. 
