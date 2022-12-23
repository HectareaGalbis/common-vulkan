<h1 id="header:COMMON-VULKAN:STRUCTS-HEADER">Structs</h1>

<h3 id="header:ADP:HEADERTAG0">VkExtent2D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-EXTENT-2D">Function: CREATE-EXTENT-2D</h4>

```Lisp
(defun CREATE-EXTENT-2D (&KEY ((:WIDTH G1384) 0) ((:HEIGHT G1385) 0))
  ...)
```

````
Constructor of EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-EXTENT-2D">Function: DESTROY-EXTENT-2D</h4>

```Lisp
(defun DESTROY-EXTENT-2D (ARG1387)
  ...)
```

````
Destructor of EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-EXTENT-2D">Macro: WITH-EXTENT-2D</h4>

```Lisp
(defmacro WITH-EXTENT-2D (VAR1394 ARGS1395 &BODY BODY1396)
  ...)
```

````
Wrap the body forms with CREATE-EXTENT-2D and DESTROY-EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:EXTENT-2D-WIDTH">Function: EXTENT-2D-WIDTH</h4>

```Lisp
(defun EXTENT-2D-WIDTH (G1388)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-2D-HEIGHT">Function: EXTENT-2D-HEIGHT</h4>

```Lisp
(defun EXTENT-2D-HEIGHT (G1389)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-2D-WIDTH)</h4>

```Lisp
(defun (SETF EXTENT-2D-WIDTH) (G1391 G1390)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-2D-HEIGHT)</h4>

```Lisp
(defun (SETF EXTENT-2D-HEIGHT) (G1393 G1392)
  ...)
```

<h3 id="header:ADP:HEADERTAG1">VkExtent3D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-EXTENT-3D">Function: CREATE-EXTENT-3D</h4>

```Lisp
(defun CREATE-EXTENT-3D (&KEY ((:WIDTH G1400) 0) ((:HEIGHT G1401) 0)
                         ((:DEPTH G1402) 0))
  ...)
```

````
Constructor of EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-EXTENT-3D">Function: DESTROY-EXTENT-3D</h4>

```Lisp
(defun DESTROY-EXTENT-3D (ARG1404)
  ...)
```

````
Destructor of EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:WITH-EXTENT-3D">Macro: WITH-EXTENT-3D</h4>

```Lisp
(defmacro WITH-EXTENT-3D (VAR1414 ARGS1415 &BODY BODY1416)
  ...)
```

````
Wrap the body forms with CREATE-EXTENT-3D and DESTROY-EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:EXTENT-3D-WIDTH">Function: EXTENT-3D-WIDTH</h4>

```Lisp
(defun EXTENT-3D-WIDTH (G1405)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-3D-HEIGHT">Function: EXTENT-3D-HEIGHT</h4>

```Lisp
(defun EXTENT-3D-HEIGHT (G1406)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-3D-DEPTH">Function: EXTENT-3D-DEPTH</h4>

```Lisp
(defun EXTENT-3D-DEPTH (G1407)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-WIDTH)</h4>

```Lisp
(defun (SETF EXTENT-3D-WIDTH) (G1409 G1408)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-HEIGHT)</h4>

```Lisp
(defun (SETF EXTENT-3D-HEIGHT) (G1411 G1410)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-DEPTH)</h4>

```Lisp
(defun (SETF EXTENT-3D-DEPTH) (G1413 G1412)
  ...)
```

<h3 id="header:ADP:HEADERTAG2">VkOffset2D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-OFFSET-2D">Function: CREATE-OFFSET-2D</h4>

```Lisp
(defun CREATE-OFFSET-2D (&KEY ((:X G1420) 0) ((:Y G1421) 0))
  ...)
```

````
Constructor of OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-OFFSET-2D">Function: DESTROY-OFFSET-2D</h4>

```Lisp
(defun DESTROY-OFFSET-2D (ARG1423)
  ...)
```

````
Destructor of OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-OFFSET-2D">Macro: WITH-OFFSET-2D</h4>

```Lisp
(defmacro WITH-OFFSET-2D (VAR1430 ARGS1431 &BODY BODY1432)
  ...)
```

````
Wrap the body forms with CREATE-OFFSET-2D and DESTROY-OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:OFFSET-2D-X">Function: OFFSET-2D-X</h4>

```Lisp
(defun OFFSET-2D-X (G1424)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-2D-Y">Function: OFFSET-2D-Y</h4>

```Lisp
(defun OFFSET-2D-Y (G1425)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-2D-X)</h4>

```Lisp
(defun (SETF OFFSET-2D-X) (G1427 G1426)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-2D-Y)</h4>

```Lisp
(defun (SETF OFFSET-2D-Y) (G1429 G1428)
  ...)
```

<h3 id="header:ADP:HEADERTAG3">VkOffset3D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-OFFSET-3D">Function: CREATE-OFFSET-3D</h4>

```Lisp
(defun CREATE-OFFSET-3D (&KEY ((:X G1436) 0) ((:Y G1437) 0) ((:Z G1438) 0))
  ...)
```

````
Constructor of OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-OFFSET-3D">Function: DESTROY-OFFSET-3D</h4>

```Lisp
(defun DESTROY-OFFSET-3D (ARG1440)
  ...)
```

````
Destructor of OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:WITH-OFFSET-3D">Macro: WITH-OFFSET-3D</h4>

```Lisp
(defmacro WITH-OFFSET-3D (VAR1450 ARGS1451 &BODY BODY1452)
  ...)
```

````
Wrap the body forms with CREATE-OFFSET-3D and DESTROY-OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:OFFSET-3D-X">Function: OFFSET-3D-X</h4>

```Lisp
(defun OFFSET-3D-X (G1441)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-3D-Y">Function: OFFSET-3D-Y</h4>

```Lisp
(defun OFFSET-3D-Y (G1442)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-3D-Z">Function: OFFSET-3D-Z</h4>

```Lisp
(defun OFFSET-3D-Z (G1443)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-X)</h4>

```Lisp
(defun (SETF OFFSET-3D-X) (G1445 G1444)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-Y)</h4>

```Lisp
(defun (SETF OFFSET-3D-Y) (G1447 G1446)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-Z)</h4>

```Lisp
(defun (SETF OFFSET-3D-Z) (G1449 G1448)
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
(defun DESTROY-RECT-2D (ARG1457)
  ...)
```

````
Destructor of RECT-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-RECT-2D">Macro: WITH-RECT-2D</h4>

```Lisp
(defmacro WITH-RECT-2D (VAR1462 ARGS1463 &BODY BODY1464)
  ...)
```

````
Wrap the body forms with CREATE-RECT-2D and DESTROY-RECT-2D.
````

<h4 id="function:COMMON-VULKAN:RECT-2D-OFFSET">Function: RECT-2D-OFFSET</h4>

```Lisp
(defun RECT-2D-OFFSET (G1458)
  ...)
```

<h4 id="function:COMMON-VULKAN:RECT-2D-EXTENT">Function: RECT-2D-EXTENT</h4>

```Lisp
(defun RECT-2D-EXTENT (G1459)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF RECT-2D-OFFSET)</h4>

```Lisp
(defun (SETF RECT-2D-OFFSET) (OFFSET-ARG G1460)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF RECT-2D-EXTENT)</h4>

```Lisp
(defun (SETF RECT-2D-EXTENT) (EXTENT-ARG G1461)
  ...)
```

