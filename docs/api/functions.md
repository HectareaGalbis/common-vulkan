<h1 id="header:COMMON-VULKAN:FUNCTIONS-HEADER">Functions</h1>

<h3 id="header:ADP:HEADERTAG12">vkCreateInstance</h3>

<h4 id="function:COMMON-VULKAN:CREATE-INSTANCE">Function: CREATE-INSTANCE</h4>

```Lisp
(defun CREATE-INSTANCE (PCREATEINFO PALLOCATOR)
  ...)
```

````
Create a new Vulkan instance
````

<h3 id="header:ADP:HEADERTAG13">vkDestroyInstance</h3>

<h4 id="function:COMMON-VULKAN:DESTROY-INSTANCE">Function: DESTROY-INSTANCE</h4>

```Lisp
(defun DESTROY-INSTANCE (INSTANCE PALLOCATOR)
  ...)
```

````
Destroy an instance of Vulkan
````

<h2 id="header:ADP:HEADERTAG14">with-instance</h2>

<h4 id="function:COMMON-VULKAN:WITH-INSTANCE">Macro: WITH-INSTANCE</h4>

```Lisp
(defmacro WITH-INSTANCE (VAR1595 ARGS1596 &BODY BODY1597)
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

<h3 id="header:ADP:HEADERTAG15">vkGetPhysicalDeviceFeatures</h3>

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
(defmacro WITH-GET-PHYSICAL-DEVICE-FEATURES (VAR1605 ARGS1606 &BODY BODY1607)
  ...)
```

````
Binds the results of create-get-physical-device-features and evaluates the body forms. At the end, 
destroy-get-physical-device-features is called with the device features structure.
````

<h3 id="header:ADP:HEADERTAG16">vkGetPhysicalDeviceFormatProperties</h3>

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
(defmacro WITH-GET-PHYSICAL-DEVICE-FORMAT-PROPERTIES (VAR1613 ARGS1614 &BODY
                                                      BODY1615)
  ...)
```

````
Binds the results of create-get-physical-device-format-properties and evaluates the body forms. At the end,
destroy-get-physical-device-format-properties is called with the format properties structure.
````

<h3 id="header:ADP:HEADERTAG17">vkGetPhysicalDeviceImageFormatProperties</h3>

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
(defmacro WITH-GET-PHYSICAL-DEVICE-IMAGE-FORMAT-PROPERTIES (VAR1621 ARGS1622
                                                            &BODY BODY1623)
  ...)
```

````
Binds the results of create-get-physical-device-image-format-properties and evaluates the body forms. At the
end, destroy-get-physical-device-image-format-properties is called with the image format properties structure.
````

<h3 id="header:ADP:HEADERTAG18">vkGetPhysicalDeviceProperties</h3>

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
(defmacro WITH-GET-PHYSICAL-DEVICE-PROPERTIES (VAR1629 ARGS1630 &BODY BODY1631)
  ...)
```

````
Binds the results of create-get-physical-device-properties and evaluates the body forms. At the
end, destroy-get-physical-device-properties is called with the physical device properties structure.
````

<h3 id="header:ADP:HEADERTAG19">vkGetPhysicalDeviceQueueFamilyProperties</h3>

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
(defun DESTROY-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES (QUEUE-FAMILY-PROPERTIES)
  ...)
```

````
Destroy the vector of VkQueueFamilyProperties structures returned by create-get-phsyical-device-queue-family-properties.
````

<h4 id="function:COMMON-VULKAN:WITH-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES">Macro: WITH-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES</h4>

```Lisp
(defmacro WITH-GET-PHSYICAL-DEVICE-QUEUE-FAMILY-PROPERTIES (VAR1637 ARGS1638
                                                            &BODY BODY1639)
  ...)
```

````
Binds the results of create-get-phsyical-device-queue-family-properties and evaluates the body forms. At the
end, destroy-get-phsyical-device-queue-family-properties is called with the queue family properties structures.
````

<h3 id="header:ADP:HEADERTAG20">vkGetPhysicalDeviceMemoryProperties</h3>

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
(defmacro WITH-GET-PHYSICAL-DEVICE-MEMORY-PROPERTIES (VAR1645 ARGS1646 &BODY
                                                      BODY1647)
  ...)
```

````
Binds the results of create-get-physical-device-memory-properties and evaluates the body forms. At the
end, destroy-get-physical-device-memory-properties is called with the memory properties structure.
````

<h3 id="header:ADP:HEADERTAG21">vkGetInstanceProcAddr</h3>

<h4 id="function:COMMON-VULKAN:GET-INSTANCE-PROC-ADDR">Function: GET-INSTANCE-PROC-ADDR</h4>

```Lisp
(defun GET-INSTANCE-PROC-ADDR (INSTANCE PNAME)
  ...)
```

````
Return a function pointer for a command.
````

<h3 id="header:ADP:HEADERTAG22">vkGetDeviceProcAddr</h3>

<h4 id="function:COMMON-VULKAN:GET-DEVICE-PROC-ADDR">Function: GET-DEVICE-PROC-ADDR</h4>

```Lisp
(defun GET-DEVICE-PROC-ADDR (DEVICE PNAME)
  ...)
```

````
Return a function pointer for a command
````

<h3 id="header:ADP:HEADERTAG23">vkCreateDevice</h3>

<h4 id="function:COMMON-VULKAN:CREATE-DEVICE">Function: CREATE-DEVICE</h4>

```Lisp
(defun CREATE-DEVICE (PHYSICALDEVICE PCREATEINFO PALLOCATOR)
  ...)
```

````
Create a new device instance.
````

<h3 id="header:ADP:HEADERTAG24">vkDestroyDevice</h3>

<h4 id="function:COMMON-VULKAN:DESTROY-DEVICE">Function: DESTROY-DEVICE</h4>

```Lisp
(defun DESTROY-DEVICE (DEVICE PALLOCATOR)
  ...)
```

<h3 id="header:ADP:HEADERTAG25">with-device</h3>

<h4 id="function:COMMON-VULKAN:WITH-DEVICE">Macro: WITH-DEVICE</h4>

```Lisp
(defmacro WITH-DEVICE (VAR1663 ARGS1664 &BODY BODY1665)
  ...)
```

````
Binds the results of create-device and evaluates the body forms. At the end, destroy-device is called with
the device and allocator.
````

<h3 id="header:ADP:HEADERTAG26">vkEnumerateInstanceExtensionProperties</h3>

<h4 id="function:COMMON-VULKAN:CREATE-ENUMERATE-INSTANCE-EXTENSION-PROPERTIES">Function: CREATE-ENUMERATE-INSTANCE-EXTENSION-PROPERTIES</h4>

```Lisp
(defun CREATE-ENUMERATE-INSTANCE-EXTENSION-PROPERTIES (PLAYERNAME)
  ...)
```

````
Returns up to requested number of global extension properties.
````

<h4 id="function:COMMON-VULKAN:DESTROY-ENUMERATE-INSTANCE-EXTENSION-PROPERTIES">Function: DESTROY-ENUMERATE-INSTANCE-EXTENSION-PROPERTIES</h4>

```Lisp
(defun DESTROY-ENUMERATE-INSTANCE-EXTENSION-PROPERTIES (PROPERTIES)
  ...)
```

````
Destroys the vector of extension properties returned by create-enumerate-instance-extension-properties.
````

<h4 id="function:COMMON-VULKAN:WITH-ENUMERATE-INSTANCE-EXTENSION-PROPERTIES">Macro: WITH-ENUMERATE-INSTANCE-EXTENSION-PROPERTIES</h4>

```Lisp
(defmacro WITH-ENUMERATE-INSTANCE-EXTENSION-PROPERTIES (VAR1671 ARGS1672 &BODY
                                                        BODY1673)
  ...)
```

````
Binds the results of create-enumerate-instance-extension-properties and evaluates the body forms. At the end
, destroy-enumerate-instance-extension-properties is called with the extension properties structures.
````

