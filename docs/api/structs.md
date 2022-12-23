<h1 id="header:COMMON-VULKAN:STRUCTS-HEADER">Structs</h1>

<h3 id="header:ADP:HEADERTAG0">VkExtent2D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-EXTENT-2D">Function: CREATE-EXTENT-2D</h4>

```Lisp
(defun CREATE-EXTENT-2D (&KEY ((:WIDTH G2018) 0) ((:HEIGHT G2019) 0))
  ...)
```

````
Constructor of EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-EXTENT-2D">Function: DESTROY-EXTENT-2D</h4>

```Lisp
(defun DESTROY-EXTENT-2D (ARG2021)
  ...)
```

````
Destructor of EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-EXTENT-2D">Macro: WITH-EXTENT-2D</h4>

```Lisp
(defmacro WITH-EXTENT-2D (VAR2028 ARGS2029 &BODY BODY2030)
  ...)
```

````
Wrap the body forms with CREATE-EXTENT-2D and DESTROY-EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:EXTENT-2D-WIDTH">Function: EXTENT-2D-WIDTH</h4>

```Lisp
(defun EXTENT-2D-WIDTH (G2022)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-2D-HEIGHT">Function: EXTENT-2D-HEIGHT</h4>

```Lisp
(defun EXTENT-2D-HEIGHT (G2023)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-2D-WIDTH)</h4>

```Lisp
(defun (SETF EXTENT-2D-WIDTH) (G2025 G2024)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-2D-HEIGHT)</h4>

```Lisp
(defun (SETF EXTENT-2D-HEIGHT) (G2027 G2026)
  ...)
```

<h3 id="header:ADP:HEADERTAG1">VkExtent3D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-EXTENT-3D">Function: CREATE-EXTENT-3D</h4>

```Lisp
(defun CREATE-EXTENT-3D (&KEY ((:WIDTH G2034) 0) ((:HEIGHT G2035) 0)
                         ((:DEPTH G2036) 0))
  ...)
```

````
Constructor of EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-EXTENT-3D">Function: DESTROY-EXTENT-3D</h4>

```Lisp
(defun DESTROY-EXTENT-3D (ARG2038)
  ...)
```

````
Destructor of EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:WITH-EXTENT-3D">Macro: WITH-EXTENT-3D</h4>

```Lisp
(defmacro WITH-EXTENT-3D (VAR2048 ARGS2049 &BODY BODY2050)
  ...)
```

````
Wrap the body forms with CREATE-EXTENT-3D and DESTROY-EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:EXTENT-3D-WIDTH">Function: EXTENT-3D-WIDTH</h4>

```Lisp
(defun EXTENT-3D-WIDTH (G2039)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-3D-HEIGHT">Function: EXTENT-3D-HEIGHT</h4>

```Lisp
(defun EXTENT-3D-HEIGHT (G2040)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-3D-DEPTH">Function: EXTENT-3D-DEPTH</h4>

```Lisp
(defun EXTENT-3D-DEPTH (G2041)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-WIDTH)</h4>

```Lisp
(defun (SETF EXTENT-3D-WIDTH) (G2043 G2042)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-HEIGHT)</h4>

```Lisp
(defun (SETF EXTENT-3D-HEIGHT) (G2045 G2044)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-DEPTH)</h4>

```Lisp
(defun (SETF EXTENT-3D-DEPTH) (G2047 G2046)
  ...)
```

<h3 id="header:ADP:HEADERTAG2">VkOffset2D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-OFFSET-2D">Function: CREATE-OFFSET-2D</h4>

```Lisp
(defun CREATE-OFFSET-2D (&KEY ((:X G2054) 0) ((:Y G2055) 0))
  ...)
```

````
Constructor of OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-OFFSET-2D">Function: DESTROY-OFFSET-2D</h4>

```Lisp
(defun DESTROY-OFFSET-2D (ARG2057)
  ...)
```

````
Destructor of OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-OFFSET-2D">Macro: WITH-OFFSET-2D</h4>

```Lisp
(defmacro WITH-OFFSET-2D (VAR2064 ARGS2065 &BODY BODY2066)
  ...)
```

````
Wrap the body forms with CREATE-OFFSET-2D and DESTROY-OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:OFFSET-2D-X">Function: OFFSET-2D-X</h4>

```Lisp
(defun OFFSET-2D-X (G2058)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-2D-Y">Function: OFFSET-2D-Y</h4>

```Lisp
(defun OFFSET-2D-Y (G2059)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-2D-X)</h4>

```Lisp
(defun (SETF OFFSET-2D-X) (G2061 G2060)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-2D-Y)</h4>

```Lisp
(defun (SETF OFFSET-2D-Y) (G2063 G2062)
  ...)
```

<h3 id="header:ADP:HEADERTAG3">VkOffset3D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-OFFSET-3D">Function: CREATE-OFFSET-3D</h4>

```Lisp
(defun CREATE-OFFSET-3D (&KEY ((:X G2070) 0) ((:Y G2071) 0) ((:Z G2072) 0))
  ...)
```

````
Constructor of OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-OFFSET-3D">Function: DESTROY-OFFSET-3D</h4>

```Lisp
(defun DESTROY-OFFSET-3D (ARG2074)
  ...)
```

````
Destructor of OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:WITH-OFFSET-3D">Macro: WITH-OFFSET-3D</h4>

```Lisp
(defmacro WITH-OFFSET-3D (VAR2084 ARGS2085 &BODY BODY2086)
  ...)
```

````
Wrap the body forms with CREATE-OFFSET-3D and DESTROY-OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:OFFSET-3D-X">Function: OFFSET-3D-X</h4>

```Lisp
(defun OFFSET-3D-X (G2075)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-3D-Y">Function: OFFSET-3D-Y</h4>

```Lisp
(defun OFFSET-3D-Y (G2076)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-3D-Z">Function: OFFSET-3D-Z</h4>

```Lisp
(defun OFFSET-3D-Z (G2077)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-X)</h4>

```Lisp
(defun (SETF OFFSET-3D-X) (G2079 G2078)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-Y)</h4>

```Lisp
(defun (SETF OFFSET-3D-Y) (G2081 G2080)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-Z)</h4>

```Lisp
(defun (SETF OFFSET-3D-Z) (G2083 G2082)
  ...)
```

<h3 id="header:ADP:HEADERTAG4">VkRect2D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-RECT-2D">Function: CREATE-RECT-2D</h4>

```Lisp
(defun CREATE-RECT-2D (&KEY ((:OFFSET OFFSET-ARG) 0) ((:EXTENT EXTENT-ARG) 0))
  ...)
```

````
Constructor of RECT-2D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-RECT-2D">Function: DESTROY-RECT-2D</h4>

```Lisp
(defun DESTROY-RECT-2D (ARG2091)
  ...)
```

````
Destructor of RECT-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-RECT-2D">Macro: WITH-RECT-2D</h4>

```Lisp
(defmacro WITH-RECT-2D (VAR2096 ARGS2097 &BODY BODY2098)
  ...)
```

````
Wrap the body forms with CREATE-RECT-2D and DESTROY-RECT-2D.
````

<h4 id="function:COMMON-VULKAN:RECT-2D-OFFSET">Function: RECT-2D-OFFSET</h4>

```Lisp
(defun RECT-2D-OFFSET (G2092)
  ...)
```

<h4 id="function:COMMON-VULKAN:RECT-2D-EXTENT">Function: RECT-2D-EXTENT</h4>

```Lisp
(defun RECT-2D-EXTENT (G2093)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF RECT-2D-OFFSET)</h4>

```Lisp
(defun (SETF RECT-2D-OFFSET) (OFFSET-ARG G2094)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF RECT-2D-EXTENT)</h4>

```Lisp
(defun (SETF RECT-2D-EXTENT) (EXTENT-ARG G2095)
  ...)
```

