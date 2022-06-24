# Debug utils extension

## Structs

### VkDebugUtilsMessengerCreateInfoEXT

**create-debug-utils-messenger-create-info**
```lisp
(create-debug-utils-messenger-create-info &key (sType VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT)
                                               (pNext nil)
                                               (flags 0)
                                               (messageSeverity 0)
                                               (messageType 0)
                                               (pfnUserCallback nil)
                                               (pUserData nil))
```
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkDebugUtilsMessengerCreateFlagsEXT`
* *messageSeverity*: `VkDebugUtilsMessageSeverityFlagsEXT`
* *messageType*: `VkDebugUtilsMessageTypeFlagsEXT`
* *pfnUserCallback*: `symbol`
* *pUserData*: `t`

**destroy-debug-utils-messenger-create-info**
```lisp
(destroy-debug-utils-messenger-create-info messenger-info)
```
* *messenger-info*: `VkDebugUtilsMessengerCreateInfoEXT`

**with-debug-utils-messenger-create-info**
```lisp
(with-debug-utils-messenger-create-info var (&key (sType VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT)
                                                  (pNext nil)
                                                  (flags 0)
                                                  (messageSeverity 0)
                                                  (messageType 0)
                                                  (pfnUserCallback nil)
                                                  (pUserData nil))
  &body body)
```
Wraps the body expressions with the creation and destruction of a `VkDebugUtilsMessengerCreateInfoEXT` structure. The new structure is bound to `var`. The arguments are passed to the constructor `create-debug-utils-messenger-create-info`.

## Functions
