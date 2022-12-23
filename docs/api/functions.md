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
(defmacro WITH-INSTANCE (VAR1430 ARGS1431 &BODY BODY1432)
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
(defmacro WITH-GET-PHYSICAL-DEVICE-FEATURES (VAR1440 ARGS1441 &BODY BODY1442)
  ...)
```

````
Binds the results of create-get-physical-device-features and evaluates the body forms. At the end, 
destroy-get-physical-device-features is called with the device features structure.
````

<h3 id="header:ADP:HEADERTAG9">vkGetPhysicalDeviceFormatProperties</h3>

<h4 id="function:COMMON-VULKAN:CREATE-GET-PHYSICAL-DEVICE-FORMAT-PROPERTIES">Function: CREATE-GET-PHYSICAL-DEVICE-FORMAT-PROPERTIES</h4>

```Lisp
(defun CREATE-GET-PHYSICAL-DEVICE-FORMAT-PROPERTIES (PHYSICALDEVICE FORMAT)
  ...)
```

````
Lists physical device's format capabilities.
````

<h4 id="function:COMMON-VULKAN:DESTROY-GET-PHYSICAL-DEVICE-FORMAT-PROPERTIES">Function: DESTROY-GET-PHYSICAL-DEVICE-FORMAT-PROPERTIES</h4>

```Lisp
(defun DESTROY-GET-PHYSICAL-DEVICE-FORMAT-PROPERTIES (PFORMATPROPERTIES)
  ...)
```

````
Destroys a VkFormatProperties structure returned by create-get-physical-device-format-properties.
````

<h4 id="function:COMMON-VULKAN:WITH-GET-PHYSICAL-DEVICE-FORMAT-PROPERTIES">Macro: WITH-GET-PHYSICAL-DEVICE-FORMAT-PROPERTIES</h4>

```Lisp
(defmacro WITH-GET-PHYSICAL-DEVICE-FORMAT-PROPERTIES (VAR1448 ARGS1449 &BODY
                                                      BODY1450)
  ...)
```

````
Binds the results of create-get-physical-device-format-properties and evaluates the body forms. At the end,
destroy-get-physical-device-format-properties is called with the format properties structure.
````

<h3 id="header:ADP:HEADERTAG10">vkGetPhysicalDeviceImageFormatProperties</h3>

<h4 id="function:COMMON-VULKAN:CREATE-GET-PHYSICAL-DEVICE-IMAGE-FORMAT-PROPERTIES">Function: CREATE-GET-PHYSICAL-DEVICE-IMAGE-FORMAT-PROPERTIES</h4>

```Lisp
(defun CREATE-GET-PHYSICAL-DEVICE-IMAGE-FORMAT-PROPERTIES (PHYSICALDEVICE
                                                           FORMAT TYPE TILING
                                                           USAGE FLAGS)
  ...)
```

````
Lists physical device's image format capabilities.
````

<h4 id="function:COMMON-VULKAN:DESTROY-GET-PHYSICAL-DEVICE-IMAGE-FORMAT-PROPERTIES">Function: DESTROY-GET-PHYSICAL-DEVICE-IMAGE-FORMAT-PROPERTIES</h4>

```Lisp
(defun DESTROY-GET-PHYSICAL-DEVICE-IMAGE-FORMAT-PROPERTIES (PIMAGEFORMATPROPERTIES)
  ...)
```

````
Destroys the VkImageFormatProperties structure returned by create-get-physical-device-image-format-properties.
````

<h4 id="function:COMMON-VULKAN:WITH-GET-PHYSICAL-DEVICE-IMAGE-FORMAT-PROPERTIES">Macro: WITH-GET-PHYSICAL-DEVICE-IMAGE-FORMAT-PROPERTIES</h4>

```Lisp
(defmacro WITH-GET-PHYSICAL-DEVICE-IMAGE-FORMAT-PROPERTIES (VAR1456 ARGS1457
                                                            &BODY BODY1458)
  ...)
```

````
Binds the results of create-get-physical-device-image-format-properties and evaluates the body forms. At the
end, destroy-get-physical-device-image-format-properties is called with the image format properties structure.
````

<h3 id="header:ADP:HEADERTAG11">vkGetPhysicalDeviceProperties</h3>

<h4 id="function:COMMON-VULKAN:CREATE-GET-PHYSICAL-DEVICE-PROPERTIES">Function: CREATE-GET-PHYSICAL-DEVICE-PROPERTIES</h4>

```Lisp
(defun CREATE-GET-PHYSICAL-DEVICE-PROPERTIES (PHYSICALDEVICE)
  ...)
```

````
Returns properties of a physical device.
````

<h4 id="function:COMMON-VULKAN:DESTROY-GET-PHYSICAL-DEVICE-PROPERTIES">Function: DESTROY-GET-PHYSICAL-DEVICE-PROPERTIES</h4>

```Lisp
(defun DESTROY-GET-PHYSICAL-DEVICE-PROPERTIES (PPROPERTIES)
  ...)
```

````
Destroys a VkPhysicalDeviceProperties returned by create-get-physical-device-properties.
````

<h4 id="function:COMMON-VULKAN:WITH-GET-PHYSICAL-DEVICE-PROPERTIES">Macro: WITH-GET-PHYSICAL-DEVICE-PROPERTIES</h4>

```Lisp
(defmacro WITH-GET-PHYSICAL-DEVICE-PROPERTIES (VAR1464 ARGS1465 &BODY BODY1466)
  ...)
```

````
Binds the results of create-get-physical-device-properties and evaluates the body forms. At the
end, destroy-get-physical-device-properties is called with the physical device properties structure.
````

<h3 id="header:ADP:HEADERTAG12">vkGetPhysicalDeviceQueueFamilyProperties</h3>

<h4 id="function:COMMON-VULKAN:CREATE-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES">Function: CREATE-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES</h4>

```Lisp
(defun CREATE-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES (PHYSICALDEVICE)
  ...)
```

````
Reports properties of the queues of the specified physical device.
````

<h4 id="function:COMMON-VULKAN:DESTROY-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES">Function: DESTROY-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES</h4>

```Lisp
(defun DESTROY-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES (PQUEUEFAMILYPROPERTIES)
  ...)
```

````
Destroy the list of VkQueueFamilyProperties structures returned by create-get-phsyical-device-queue-family-properties.
````

<h4 id="function:COMMON-VULKAN:WITH-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES">Macro: WITH-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES</h4>

```Lisp
(defmacro WITH-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES (VAR1472 ARGS1473
                                                            &BODY BODY1474)
  ...)
```

````
Binds the results of create-get-phsyical-device-queue-family-properties and evaluates the body forms. At the
end, destroy-get-phsyical-device-queue-family-properties is called with the queue family properties structures.
````

<h3 id="header:ADP:HEADERTAG13">vkGetPhysicalDeviceMemoryProperties</h3>

<h4 id="function:COMMON-VULKAN:CREATE-GET-PHYSICAL-DEVICE-MEMORY-PROPERTIES">Function: CREATE-GET-PHYSICAL-DEVICE-MEMORY-PROPERTIES</h4>

```Lisp
(defun CREATE-GET-PHYSICAL-DEVICE-MEMORY-PROPERTIES (PHYSICALDEVICE)
  ...)
```

````
Reports memory information for the specified physical device.
````

<h4 id="function:COMMON-VULKAN:DESTROY-GET-PHYSICAL-DEVICE-MEMORY-PROPERTIES">Function: DESTROY-GET-PHYSICAL-DEVICE-MEMORY-PROPERTIES</h4>

```Lisp
(defun DESTROY-GET-PHYSICAL-DEVICE-MEMORY-PROPERTIES (PMEMORYPROPERTIES)
  ...)
```

````
Destroys a VkPhysicalDeviceMemoryProperties structure returned by create-get-physical-device-memory-properties.
````

<h4 id="function:COMMON-VULKAN:WITH-GET-PHYSICAL-DEVICE-MEMORY-PROPERTIES">Macro: WITH-GET-PHYSICAL-DEVICE-MEMORY-PROPERTIES</h4>

```Lisp
(defmacro WITH-GET-PHYSICAL-DEVICE-MEMORY-PROPERTIES (VAR1480 ARGS1481 &BODY
                                                      BODY1482)
  ...)
```

````
Binds the results of create-get-physical-device-memory-properties and evaluates the body forms. At the
end, destroy-get-physical-device-memory-properties is called with the memory properties structure.
````

