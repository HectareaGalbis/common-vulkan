
# Physical device

## get-physical-device

```lisp
(get-physical-device instance &key (surface nil) (device-type VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU)
                                   (extensions (list "VK_KHR_swapchain"))
                                   (queue-flags (logior VK_QUEUE_GRAPHICS_BIT VK_QUEUE_TRANSFER_BIT VK_QUEUE_COMPUTE_BIT))
                                   (features nil))
```
