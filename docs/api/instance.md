# Instance

## Structs

### VkApplicationInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *pApplicationName*: `string`
* *applicationVersion*: `uint32`
* *pEngineName*: `string`
* *engineVersion*: `uint32`
* *apiVersion*: `uint32`

**create-application-info**
```lisp
(create-application-info &key
                           (sType VK_STRUCTURE_TYPE_APPLICATION_INFO)
                           (pNext NIL)
                           (pApplicationName NIL)
                           (applicationVersion 0)
                           (pEngineName NIL)
                           (engineVersion 0)
                           (apiVersion 0)
)
```

**destroy-application-info**
```lisp
(destroy-application-info obj)
```

**with-application-info**
```lisp
(with-application-info var-or-vars (&rest args)
  &body body)
```
Wrap the body expressions with `create-application-info` and `destroy-application-info`. The new object(s) is(are) bound to var. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(application-info-sType obj) ; setf-able
(application-info-pNext obj) ; setf-able
(application-info-pApplicationName obj) ; setf-able
(application-info-applicationVersion obj) ; setf-able
(application-info-pEngineName obj) ; setf-able
(application-info-engineVersion obj) ; setf-able
(application-info-apiVersion obj) ; setf-able
```

### VkInstanceCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkInstanceCreateFlags`
* *pApplicationInfo*: `string`
* *enabledLayerCount*: `uint32`
* *ppEnabledLayerNames*: `(list string)`
* *enabledExtensionCount*: `uint32`
* *ppEnabledExtensionNames*: `(list string)`

**create-instance-create-info**
```lisp
(create-instance-create-info &key
                               (sType VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO)
                               (pNext NIL)
                               (flags 0)
                               (pApplicationInfo NIL)
                               (enabledLayerCount 0)
                               (ppEnabledLayerNames NIL)
                               (enabledExtensionCount 0)
                               (ppEnabledExtensionNames NIL)
)
```

**destroy-instance-create-info**
```lisp
(destroy-instance-create-info obj)
```

**with-instance-create-info**
```lisp
(with-instance-create-info var-or-vars (&rest args)
  &body body)
```
Wrap the body expressions with `create-instance-create-info` and `destroy-instance-create-info`. The new object(s) is(are) bound to var. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(instance-create-info-sType obj) ; setf-able
(instance-create-info-pNext obj) ; setf-able
(instance-create-info-flags obj) ; setf-able
(instance-create-info-pApplicationInfo obj) ; setf-able
(instance-create-info-enabledLayerCount obj) ; setf-able
(instance-create-info-ppEnabledLayerNames obj &OPTIONAL (INDEX NIL)) ; setf-able
(instance-create-info-enabledExtensionCount obj) ; setf-able
(instance-create-info-ppEnabledExtensionNames obj &OPTIONAL (INDEX NIL)) ; setf-able
```

### VkExtensionProperties

**Members**
* *specVersion*: `uint32`
* *extensionName*: `string`

**Accessors**
```lisp
(extension-properties-extensionName obj)
(extension-properties-specVersion obj)
```

### VkLayerProperties

**Members**
* *description*: `string`
* *implementationVersion*: `uint32`
* *specVersion*: `uint32`
* *layerName*: `string`

**Accessors**
```lisp
(layer-properties-layerName obj)
(layer-properties-specVersion obj)
(layer-properties-implementationVersion obj)
(layer-properties-description obj)
```

## Functions

### vkCreateInstance

**create-instance**
```lisp
(create-instance pCreateInfo pAllocator) => instance
```

* *Parameters*:
  * *pCreateInfo*: `VkInstanceCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *instance*: `VkInstance`
### vkDestroyInstance

**destroy-instance**
```lisp
(destroy-instance instance pAllocator)
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *pAllocator*: `VkAllocationCallbacks`

### with-instance

**with-instance**
```lisp
(with-instance var-or-vars (&rest args)
  &body body)
```
Wrap the body expressions with `create-instance` and `destroy-instance`. The new object(s) is(are) bound to var. The arguments `args` are passed to the constructor.

* **Note**: The allocator is passed to both constructor and destructor.

### vkEnumerateInstanceExtensionProperties

* **Note**: This function requires an allocation for retrieving the information. For that reason 
this function is splitted up in two creation and destruction functions.

**create-enumerate-instance-extension-properties**
```lisp
(create-enumerate-instance-extension-properties pLayerName) => extension-props
```

* *Parameters*:
  * *pLayerName*: `string`

* *Return:*
  * *extension-props*: `(list VkExtensionProperties)`
**destroy-enumerate-instance-extension-properties**
```lisp
(destroy-enumerate-instance-extension-properties extension-props)
```

* *Parameters*:
  * *extension-props*: `(list VkExtensionProperties)`

**with-enumerate-instance-extension-properties**
```lisp
(with-enumerate-instance-extension-properties var-or-vars (&rest args)
  &body body)
```
Wrap the body expressions with `create-enumerate-instance-extension-properties` and `destroy-enumerate-instance-extension-properties`. The new object(s) is(are) bound to var. The arguments `args` are passed to the constructor.

### vkEnumerateInstanceLayerProperties

* **Note**: This function requires an allocation for retrieving the information. For that reason 
this function is splitted up in two creation and destruction functions.

**create-enumerate-instance-layer-properties**
```lisp
(create-enumerate-instance-layer-properties) => layer-props
```

* *Return:*
  * *layer-props*: `(list VkLayerProperties)`
**destroy-enumerate-instance-layer-properties**
```lisp
(destroy-enumerate-instance-layer-properties layer-props)
```

* *Parameters*:
  * *layer-props*: `(list VkLayerProperties)`

**with-enumerate-instance-layer-properties**
```lisp
(with-enumerate-instance-layer-properties var-or-vars (&rest args)
  &body body)
```
Wrap the body expressions with `create-enumerate-instance-layer-properties` and `destroy-enumerate-instance-layer-properties`. The new object(s) is(are) bound to var. The arguments `args` are passed to the constructor.

### vkGetInstanceProcAddr

**get-instance-proc-addr**
```lisp
(get-instance-proc-addr instance pName) => proc
```

* *Parameters*:
  * *instance*: `VkInstance`
  * *pName*: `string`

* *Return:*
  * *proc*: `function`
