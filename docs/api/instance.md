
# Instance

## Structs

### VkApplicationInfo

**create-application-info**
```lisp
(create-application-info &key (sType              VK_STRUCTURE_TYPE_APPLICATION_INFO)
                              (pNext              nil)
                              (pApplicationName   nil)
                              (applicationVersion 0)
                              (pEngineName        nil)
                              (engineVersion      0)
                              (apiVersion         0))
```
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *pApplicationName*: `string`
* *applicationVersion*: `uint32`
* *pEngineName*: `string`
* *engineVersion*: `uint32`
* *apiVersion*: `uint32`

**destroy-application-info**
```lisp
(destroy-application-info app-info)
```
* *app-info*: `VkApplicationInfo`

**with-application-info**
```lisp
(with-application-info var (&key (sType              VK_STRUCTURE_TYPE_APPLICATION_INFO)
                                 (pNext              nil)
                                 (pApplicationName   nil)
                                 (applicationVersion 0)
                                 (pEngineName        nil)
                                 (engineVersion      0)
                                 (apiVersion         0))
  &body body)
```
Wraps the `body` expressions with the creation and destruction of a `VkApplicationInfo` structure. The new structure is bound to `var`. The arguments are passed to the constructor `create-application-info`.

**accessors**
```lisp
(application-info-sType app-info)
(application-info-pNext app-info)
(application-info-pApplicationName app-info)
(application-info-applicationVersion app-info)
(application-info-pEngineName app-info)
(application-info-engineVersion app-info)
(application-info-apiVersion app-info)
```
* *app-info*: `VkApplicationInfo`

* **Note**: All these functions are setf-able.

### VkInstanceCreateInfo

**create-instance-create-info**
```lisp
(create-instance-create-info &key (sType                   VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO)
                                  (pNext                   nil)
                                  (flags                   0)
                                  (pApplicationInfo        nil)
                                  (enabledLayerCount       0)
                                  (ppEnabledLayerNames     nil)
                                  (enabledExtensionCount   0)
                                  (ppEnabledExtensionNames nil))
```
* *sType*: `VkStructureType`
* *pNext*: `pointer`
* *flags*: `VkInstanceCreateFlags`
* *pApplicationInfo*: `VkApplicationInfo`
* *enabledLayerCount*: `uint32`
* *ppEnabledLayerNames*: `(list string)`
* *enabledExtensionCount*: `uint32`
* *ppEnabledExtensionNames*: `(list string)`

**destroy-instance-create-info**
```lisp
(destroy-instance-create-info instance-info)
```
* *instance-info*: `VkInstanceCreateInfo`

**with-instace-create-info**
```lisp
(with-instance-create-info var (&key (sType                   VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO)
                                     (pNext                   nil)
                                     (flags                   0)
                                     (pApplicationInfo        nil)
                                     (enabledLayerCount       0)
                                     (ppEnabledLayerNames     nil)
                                     (enabledExtensionCount   0)
                                     (ppEnabledExtensionNames nil))
  &body body)
```
Wraps the `body` expressions with the creation and destruction of a `VkInstanceCreateInfo` structure. The new structure is bound to `var`. The arguments are passed to the constructor.

**accessors**
```lisp
(instance-create-info-sType instance-info)
(instance-create-info-pNext instance-info)
(instance-create-info-flags instance-info)
(instance-create-info-pApplicationInfo instance-info)
(instance-create-info-enabledLayerCount instance-info)
(instance-create-info-ppEnabledLayerNames instance-info)
(instance-create-info-enabledExtensionCount instance-info)
(instance-create-info-ppEnabledExtensionNames instance-info)
```
* *instance-info*: `VkInstanceCreateInfo`

* **Note**: All these functions are setf-able.

* **Note**: `ppEnabledLayerNames` and `ppEnabledExtensionNames` depend on `enabledLayerCount` and `enabledExtensionCount` respectively. If they are not `nil` and you are going to update their contents make sure to update `ppEnabledLayerNames` and `ppEnabledExtensionNames` before `enabledLayerCount` and `enabledExtensionCount` respectively.

### VkExtensionProperties

**accessors**
```lisp
(extension-properties-extensionName extension-props)
(extension-properties-specVersion extension-props)
```
* *extension-props*: `VkExtensionProperties
* *extensionName*: `string`
* *specVersion*: `uint32`

## Functions

## vkCreateInstance

**create-instance**
```
(create-instance create-info allocator) => (values instance result)
```
* *Parameters:*
  * *create-info*: `VkInstanceCreateInfo`
  * *allocator*: `VkAllocationCallbacks`
  
* *Returns*:
  * *instance*: `VkInstance`
  * *result*: `VkResult`

## vkDestroyInstance

**destroy-instance**
```
(destroy-instance instance allocator)
```
* *Parameters*:
  * *instance*: `VkInstance`
  * *allocator*: `VkAllocationCallbacks`


## with-instance

```
(with-instance var (instance allocator) &body body)
```
Wraps the body expressions with the creation and destruction of an instance. The `var` is bound to the created instance. The arguments are passed to the constructor `create-instance`.

* **Note**: The allocator used in this macro is passed to both the constructor and the destructor.

## vkEnumerateInstanceExtensionProperties

**create-enumerate-instance-extension-properties**
```
(create-enumerate-instance-extension-properties layer-name) => extension-props
```
* *Parameters*:
  * *layer-name*: `string`

* *Returns*:
  * *extension-props*: `(list VkExtensionProperties)`

**destroy-enumerate-instance-extension-properties**
```lisp
(destroy-enumerate-instance-extension-properties extension-props)
```
* *Parameters*:
  * *extension-props*: `(list VkExtensionProperties)`

**with-enumerate-instance-extension-properties**
```lisp
(with-enumerate-instance-extension-properties var (layer-name)
  &body body)
```
Wraps the `body` expressions with the construction and destruction of a list of extension properties. The new list is bound to `var`. The arguments are passed to the constructor `create-enumerate-instance-extension-properties`.

## vkEnumerateInstanceLayerProperties

**create-enumerate-instance-layer-properties**
```
(create-enumerate-instance-layer-properties) => layer-props
```
* *Returns*:
  * *layer-props*: `(list VkLayerProperties)`

**destroy-enumerate-instance-layer-properties**
```lisp
(destroy-enumerate-instance-layer-properties layer-props)
```
* *Parameters*:
  *layer-props*: `(list VkLayerProperties)`

**with-enumerate-instance-layer-properties**
```lisp
(with-enumerate-instance-layer-properties var ()
  &body body)
```
Wraps the `body` expressions with the creation and destruction of a list of layer properties. The new list is bound to `var`.

## vkGetInstanceProcAddr

**get-instance-proc-addr**
```lisp
(get-instance-proc-addr instance name) => proc
```
* *Parameters*:
  * *instance*: `VkInstance`
  * *name*: `string`

* *Returns*:
  * *proc*: `function`

* **Note**: The available functions so far are the following: `vkCreateDebugUtilsMessengerEXT`, `vkDestroyDebugUtilsMessengerEXT`.
