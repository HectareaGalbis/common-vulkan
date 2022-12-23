<h1 id="header:COMMON-VULKAN:FUNCTIONS-HEADER">Functions</h1>

<h3 id="header:ADP:HEADERTAG0">vkCreateInstance</h3>

<h4 id="function:COMMON-VULKAN:CREATE-INSTANCE">Function: CREATE-INSTANCE</h4>

```Lisp
(defun CREATE-INSTANCE (PCREATEINFO PALLOCATOR)
  ...)
```

````
Create a new Vulkan instance
````

<h3 id="header:ADP:HEADERTAG1">vkDestroyInstance</h3>

<h4 id="function:COMMON-VULKAN:DESTROY-INSTANCE">Function: DESTROY-INSTANCE</h4>

```Lisp
(defun DESTROY-INSTANCE (INSTANCE PALLOCATOR)
  ...)
```

````
Destroy an instance of Vulkan
````

<h2 id="header:ADP:HEADERTAG2">with-instance</h2>

<h4 id="function:COMMON-VULKAN:WITH-INSTANCE">Macro: WITH-INSTANCE</h4>

```Lisp
(defmacro WITH-INSTANCE (VAR1333 ARGS1334 &BODY BODY1335)
  ...)
```

* <strong><em>Note</em></strong>\: The allocator is received by both the constructor and the destructor\.

