# Debug utils extension

## Structs

### VkDebugUtilsMessengerCreateInfoEXT

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkDebugUtilsMessengerCreateFlagsEXT`
* *messageSeverity*: `VkDebugUtilsMessageSeverityFlagsEXT`
* *messageType*: `VkDebugUtilsMessageTypeFlagsEXT`
* *pfnUserCallback*: `symbol`
* *pUserData*: `t`

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

**accessors**
```lisp
(debug-utils-messenger-create-info-sType messenger-info)
(debug-utils-messenger-create-info-pNext messenger-info)
(debug-utils-messenger-create-info-flags messenger-info)
(debug-utils-messenger-create-info-messageSeverity messenger-info)
(debug-utils-messenger-create-info-messageType messenger-info)
(debug-utils-messenger-create-info-pfnUserCallback messenger-info)
(debug-utils-messenger-create-info-pUserData messenger-info)
```
* *messenger-info*: `VkDebugUtilsMessengerCreateInfoEXT`

* **Note**: All these functions are setf-able.

### VkDebugUtilsMessengerCallbackDataEXT

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkDebugUtilsMessengerCallbackDataFlagsEXT`
* *pMessageIdName*: `string`
* *messageIdNumber*: `int32`
* *pMessage*: `string`
* *queueLabelCount*: `uint32`
* *pQueueLabels*: `(list VkDebugUtilsLabelEXT)`
* *cmdBufLabelCount*: `uint32`
* *pCmdBufLabels*: `(list VkDebugUtilsLabelEXT)`
* *objectCount*: `uint32`
* *pObjects*: `(list VkDebugUtilsObjectNameInfoEXT)`

**accessors**
```lisp
(debug-utils-messenger-callback-data-sType callback-data)
(debug-utils-messenger-callback-data-pNext callback-data)
(debug-utils-messenger-callback-data-flags callback-data)
(debug-utils-messenger-callback-data-pMessageIdName callback-data)
(debug-utils-messenger-callback-data-messageIdNumber callback-data)
(debug-utils-messenger-callback-data-pMessage callback-data)
(debug-utils-messenger-callback-data-queueLabelCount callback-data)
(debug-utils-messenger-callback-data-pQueueLabels callback-data &optional index)
(debug-utils-messenger-callback-data-cmdBufLabelCount callback-data)
(debug-utils-messenger-callback-data-pCmdBufLabels callback-data &optional index)
(debug-utils-messenger-callback-data-objectCount callback-data)
(debug-utils-messenger-callback-data-pObjects callback-data &optional index)
```
* *callback-data*: `VkDebugUtilsMessengerCallbackDataEXT`

* **Note**: If you use the additional `index` parameter in functions `debug-utils-messenger-callback-data-pQueueLabels`, `debug-utils-messenger-callback-data-pCmdBufLabels` and `debug-utils-messenger-callback-data-pObjects`, they will only return the element at `index` position.

### VkDebugUtilsLabelEXT

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *pLabelName*: `string`
* *color*: `(list float)`

**accessors**
```lisp
(debug-utils-label-sType label)
(debug-utils-label-pNext label)
(debug-utils-label-pLabelName label)
(debug-utils-label-color label &optional index)
```
* *label*: `VkDebugUtilsLabelEXT`

* **Note**: If you use the additional `index` parameter in function `debug-utils-label-color`, it will only return the element at `index` position.

### VkDebugUtilsObjectNameInfoEXT

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *objectType*: `VkObjectType`
* *objectHandle*: `uint64`
* *pObjectName*: `string`

**accessors**
```lisp
(debug-utils-object-name-info-sType object-info)
(debug-utils-object-name-info-pNext object-info)
(debug-utils-object-name-info-objectType object-info)
(debug-utils-object-name-info-objectHandle object-info)
(debug-utils-object-name-info-pObjectName object-info)
```

## Functions
