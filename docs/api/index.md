
# Common Vulkan Reference

Welcome the Common Vulkan Api Reference! 

## What is this?

I have to advise you that this reference will not teach you what the Vulkan functions do. Here you will see how the functions are in Common Lisp and the types of the arguments and returned values. Like the Vulkan Guide, this is complementary material. Your main source of information should be the official Vulkan Specifications. 

## How the names work?

Vulkan names have a common structure. They all start with the *vk* prefix followed by words in *Camel case*. Also, some of them end with a suffix like *KHR* or *EXT*. Depending on what we are deling with, the names are obtained in a different way.

### Function names

To turn a vulkan function name into a common lisp name you need to remove the prefix and its suffix (if it has), separate the words by hyphens and make the words lowercase. Examples: `vkCreateSwapchainKHR` -> `create-swapchain`, `vkEnumerateInstanceExtensionProperties` -> `enumerate-instance-extension-properties`.

### Structures

In common lisp we don't need types, but we need a way to create and destroy the structures, and also a way to access its members. How we obtain these names are similar to how we did with function names. Remove any prefix or suffix from the structure type, separate words by hyphens and make the words lowercase. Now, depending on what we add to this name we get a function or another. Adding the prefixes `create-` or `destroy-` we get the functions to create and destroy the structure. If we add the name of a slot member as a suffix, get a getter. Example: `VkInstanceCreateInfo` -> `create-instance-create-info`, `destroy-create-info`, `with-instance-create-info` (with macro), `instance-create-info-sType`, `instance-create-info-pNext`, `instance-create-info-ppEnabledLayerNames`, etc.

## The reference sections

1. [Instance](https://hectarea1996.github.io/common-vulkan/api/instance.html)
2. [Debug utils](https://hectarea1996.github.io/common-vulkan/api/debug-utils.html)
3. [Phsysical device](https://hectarea1996.github.io/common-vulkan/api/physical-device.html)
4. [Window](https://hectarea1996.github.io/common-vulkan/api/window.html)(WIP)
5. [Surface](https://hectarea1996.github.io/common-vulkan/api/surface.html)(WIP)
6. [Queue families](https://hectarea1996.github.io/common-vulkan/api/queue-family.html)(WIP)
7. [Device](https://hectarea1996.github.io/common-vulkan/api/device.html)(WIP)
8. [Semaphore](https://hectarea1996.github.io/common-vulkan/api/semaphore.html)(WIP)
9. [Fence](https://hectarea1996.github.io/common-vulkan/api/fence.html)(WIP)
10. [Queue](https://hectarea1996.github.io/common-vulkan/api/queue.html)(WIP)
11. [Command pool](https://hectarea1996.github.io/common-vulkan/api/command-pool.html)(WIP)
12. [Command buffer](https://hectarea1996.github.io/common-vulkan/api/command-buffer.html)(WIP)
13. [Swapchain](https://hectarea1996.github.io/common-vulkan/api/swapchain.html)(WIP)
