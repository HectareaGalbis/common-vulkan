
# Instance

## Structs

### VkApplicationInfo

**create-application-info**
```lisp
(create-application-info &key (sType VK_STRUCTURE_TYPE_APPLICATION_INFO)
                              (pNext nil)
                              (pApplicationName nil)
                              (applicationVersion 0)
                              (pEngineName nil)
                              (engineVersion 0)
                              (apiVersion 0))
```
Creates a `VkApplicationInfo` structure.

**destroy-application-info**
```lisp
(destroy-application-info app-info)
```
Destroys a `VkApplicationInfo` structure.

**with-application-info**
```lisp
(with-application-info var (&key (sType VK_STRUCTURE_TYPE_APPLICATION_INFO)
                                 (pNext nil)
                                 (pApplicationName nil)
                                 (applicationVersion 0)
                                 (pEngineName nil)
                                 (engineVersion 0)
                                 (apiVersion 0))
  &body body)
```
Wraps the body expressions with the creation and destruction of a `VkApplicationInfo` structure. The new structure is bound to `var`. The arguments are passed to the constructor.

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



## Functions

## create-instance

```
(create-instance &optional (validation t))
```

Creates a vulkan instance.

* **validation**: `t` if validation layer must be enabled.

## destroy-instance

```
(destroy-instance instance)
```

Destroys an instance.

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

