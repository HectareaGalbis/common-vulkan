### VkDebugUtilsMessengerCreateInfoEXT

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkDebugUtilsMessengerCreateFlagsEXT`
* *messageSeverity*: `VkDebugUtilsMessageSeverityFlagsEXT`
* *messageType*: `VkDebugUtilsMessageTypeFlagsEXT`
* *pfnUserCallback*: `PFN_vkDebugUtilsMessengerCallbackEXT`
* *pUserData*: `t`

**create-debug-utils-messenger-create-info**
```lisp
(create-debug-utils-messenger-create-info &key
                                            (sType VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT)
                                            (pNext NIL)
                                            (flags 0)
                                            (messageSeverity 0)
                                            (messageType 0)
                                            (pfnUserCallback NIL)
                                            (pUserData NIL))
```

**destroy-debug-utils-messenger-create-info**
```lisp
(destroy-debug-utils-messenger-create-info obj)
```

**with-debug-utils-messenger-create-info**
```lisp
(with-debug-utils-messenger-create-info var-or-vars (&rest args)
  &body body)
```
Wrap the body expressions with `create-debug-utils-messenger-create-info` and `destroy-debug-utils-messenger-create-info`. The new object(s) is(are) bound to var. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(debug-utils-messenger-create-info-sType obj) ; setf-able
(debug-utils-messenger-create-info-pNext obj) ; setf-able
(debug-utils-messenger-create-info-flags obj) ; setf-able
(debug-utils-messenger-create-info-messageSeverity obj) ; setf-able
(debug-utils-messenger-create-info-messageType obj) ; setf-able
(debug-utils-messenger-create-info-pfnUserCallback obj) ; setf-able
(debug-utils-messenger-create-info-pUserData obj) ; setf-able
```

### PFN_vkDebugUtilsMessengerCallbackEXT

**def-debug-utils-messenger-callback**
```lisp
(def-debug-utils-messenger-callback (messageSeverity messageTypes pCallbackData pUserData)
 &body body) => result
```
Define a callback function.

* *Parameters:*
  * *messageSeverity*: `VkDebugUtilsMessageSeverityFlagBitsEXT`
  * *messageTypes*: `vkdebugutilsmessagetypeflagsext`
  * *pCallbackData*: `VkDebugUtilsMessengerCallbackDataEXT`
  * *pUserData*: `t`

* *Return:*
  * *result*: `boolean`

### VkDebugUtilsMessengerCallbackDataEXT

**Members**
* *pObjects*: `(list VkDebugUtilsObjectNameInfoEXT)`
* *objectCount*: `uint32`
* *pCmdBufLabels*: `(list VkDebugUtilsLabelEXT)`
* *cmdBufLabelCount*: `uint32`
* *pQueueLabels*: `(list VkDebugUtilsLabelEXT)`
* *queueLabelCount*: `uint32`
* *pMessage*: `string`
* *messageIdNumber*: `int32`
* *pMessageIdName*: `string`
* *flags*: `VkDebugUtilsMessengerCallbackDataFlagsEXT`
* *pNext*: `pointer`
* *sType*: `VkStructureType`

**Accessors**
```lisp
(debug-utils-messenger-callback-data-sType obj)
(debug-utils-messenger-callback-data-pNext obj)
(debug-utils-messenger-callback-data-flags obj)
(debug-utils-messenger-callback-data-pMessageIdName obj)
(debug-utils-messenger-callback-data-messageIdNumber obj)
(debug-utils-messenger-callback-data-pMessage obj)
(debug-utils-messenger-callback-data-queueLabelCount obj)
(debug-utils-messenger-callback-data-pQueueLabels obj &OPTIONAL (INDEX NIL))
(debug-utils-messenger-callback-data-cmdBufLabelCount obj)
(debug-utils-messenger-callback-data-pCmdBufLabels obj &OPTIONAL (INDEX NIL))
(debug-utils-messenger-callback-data-objectCount obj)
(debug-utils-messenger-callback-data-pObjects obj &OPTIONAL (INDEX NIL))
```

### VkDebugUtilsLabelEXT

**Members**
* *color*: `float`
* *pLabelName*: `string`
* *pNext*: `pointer`
* *sType*: `VkStructureType`

**Accessors**
```lisp
(debug-utils-label-sType obj)
(debug-utils-label-pNext obj)
(debug-utils-label-pLabelName obj)
(debug-utils-label-color obj &OPTIONAL (INDEX NIL))
```

### VkDebugUtilsObjectNameInfoEXT

**Members**
* *pObjectName*: `string`
* *objectHandle*: `uint64`
* *objectType*: `VkObjectType`
* *pNext*: `pointer`
* *sType*: `VkStructureType`

**Accessors**
```lisp
(debug-utils-object-name-info-sType obj)
(debug-utils-object-name-info-pNext obj)
(debug-utils-object-name-info-objectType obj)
(debug-utils-object-name-info-objectHandle obj)
(debug-utils-object-name-info-pObjectName obj)
```

