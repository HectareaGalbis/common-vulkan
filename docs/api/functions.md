<h1 id="header:COMMON-VULKAN:FUNCTIONS-HEADER">Functions</h1>

<h3 id="header:ADP:HEADERTAG5">vkCreateInstance</h3>

<h4 id="function:COMMON-VULKAN:CREATE-INSTANCE">Function: CREATE-INSTANCE</h4>

```Lisp
(defun CREATE-INSTANCE (PCREATEINFO PALLOCATOR)
  ...)
```

````
Create a new Vulkan instance
````

<h3 id="header:ADP:HEADERTAG6">vkDestroyInstance</h3>

<h4 id="function:COMMON-VULKAN:DESTROY-INSTANCE">Function: DESTROY-INSTANCE</h4>

```Lisp
(defun DESTROY-INSTANCE (INSTANCE PALLOCATOR)
  ...)
```

````
Destroy an instance of Vulkan
````

<h2 id="header:ADP:HEADERTAG7">with-instance</h2>

<h4 id="function:COMMON-VULKAN:WITH-INSTANCE">Macro: WITH-INSTANCE</h4>

```Lisp
(defmacro WITH-INSTANCE (VAR2109 ARGS2110 &BODY BODY2111)
  ...)
```

````
Binds the results of create-instance and evaluates the body forms. At the end, destroy-instance is called
with the instance and the allocator.
````

<h4 id="function:COMMON-VULKAN:ENUMERATE-PHYSICAL-DEVICES">Function: ENUMERATE-PHYSICAL-DEVICES</h4>

```Lisp
(defun ENUMERATE-PHYSICAL-DEVICES (INSTANCE)
  ...)
```

````
Enumerates the physical devices accessible to a Vulkan instance
````

<h3 id="header:ADP:HEADERTAG8">vkGetPhysicalDeviceFeatures</h3>

<h4 id="function:COMMON-VULKAN:CREATE-GET-PHYSICAL-DEVICE-FEATURES">Function: CREATE-GET-PHYSICAL-DEVICE-FEATURES</h4>

```Lisp
(defun CREATE-GET-PHYSICAL-DEVICE-FEATURES (PHYSICALDEVICE)
  ...)
```

````
Reports capabilities of a physical device
````

<h4 id="function:COMMON-VULKAN:DESTROY-GET-PHYSICAL-DEVICE-FEATURES">Function: DESTROY-GET-PHYSICAL-DEVICE-FEATURES</h4>

```Lisp
(defun DESTROY-GET-PHYSICAL-DEVICE-FEATURES (PFEATURES)
  ...)
```

````
Destroy the structure returned by create-get-physical-device-features
````

<h4 id="function:COMMON-VULKAN:WITH-GET-PHYSICAL-DEVICE-FEATURES">Macro: WITH-GET-PHYSICAL-DEVICE-FEATURES</h4>

```Lisp
(defmacro WITH-GET-PHYSICAL-DEVICE-FEATURES (VAR2119 ARGS2120 &BODY BODY2121)
  ...)
```

````
Binds the results of create-get-physical-device-features and evaluates the body forms. At the end, 
destroy-get-physical-device-features is called with the device features structure.
````

