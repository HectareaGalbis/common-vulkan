
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
Creates a `VkApplicationInfo` structure.

**destroy-application-info**
```lisp
(destroy-application-info app-info)
```
Destroys a `VkApplicationInfo` structure.

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
Wraps the `body` expressions with the creation and destruction of a `VkApplicationInfo` structure. The new structure is bound to `var`. The arguments are passed to the constructor.

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
Getters of the `VkApplicationInfo` structure. They all are **setf-able**.

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
Creates a `VkInstanceCreateInfo`. `ppEnabledLayerNames` and `ppEnabledExtensionNames` must be lists of strings.

**destroy-instance-create-info**
```lisp
(destroy-instance-create-info instance-info)
```
Destroys a `VkInstanceCreateInfo` structure.

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
Getters of the `VkInstanceCreateInfo` structure. They all are **setf-able**.

### VkExtensionProperties

**accessors**
```lisp
(extension-properties-extensionName extension-props)
(extension-properties-specVersion extension-props)
```
Getters of the `VkExtensionProperties` structure. They are **NOT setf-able**.

## Functions

## create-instance

```
(create-instance create-info allocator) => (values instance result)
```
Creates a vulkan instance.

* *Parameters:*
  * *create-info*: A `VkInstanceCreateInfo` structure.
  * *allocator*: A `VkAllocationCallbacks` structure.
  
* *Returns*:
  * *instance*: The created vulkan instance.
  * *result*: A `VkResult` value.

* **validation**: `t` if validation layer must be enabled.

## destroy-instance

```
(destroy-instance instance allocator)
```
Destroys an instance.

* *Parameters*:
  * *instance*: The instance to destroy.
  * *allocator*: A `VkAllocationCallbacks` structure.

* **instance**: The instance to be destroyed.

## with-instance (macro)

```
(with-instance (var &optional (validation t)) &body body)
```

Wraps the body expressions with the creation and destruction of an instance. The `var` is bound to the created instance.

## get-vulkan-instance-enabled-layers

```
(get-instance-enabled-layers instance)
```

Retrieves the enabled layers from `instance`.

* **instance**: The instance the layers are retrieved from.

## get-vulkan-instance-enabled-extensions

```
(get-instance-extensions instance)
```

Retrieves the enabled extensions from `instance`.

* **instance**: The instance that the extensions are retrieved from.

