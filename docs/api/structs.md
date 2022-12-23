<h1 id="header:COMMON-VULKAN:STRUCTS-HEADER">Structs</h1>

<h3 id="header:ADP:HEADERTAG0">VkExtent2D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-EXTENT-2D">Function: CREATE-EXTENT-2D</h4>

```Lisp
(defun CREATE-EXTENT-2D (&KEY ((:WIDTH G1339) 0) ((:HEIGHT G1340) 0))
  ...)
```

````
Constructor of EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-EXTENT-2D">Function: DESTROY-EXTENT-2D</h4>

```Lisp
(defun DESTROY-EXTENT-2D (ARG1342)
  ...)
```

````
Destructor of EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-EXTENT-2D">Macro: WITH-EXTENT-2D</h4>

```Lisp
(defmacro WITH-EXTENT-2D (VAR1349 ARGS1350 &BODY BODY1351)
  ...)
```

````
Wrap the body forms with CREATE-EXTENT-2D and DESTROY-EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:EXTENT-2D-WIDTH">Function: EXTENT-2D-WIDTH</h4>

```Lisp
(defun EXTENT-2D-WIDTH (G1343)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-2D-HEIGHT">Function: EXTENT-2D-HEIGHT</h4>

```Lisp
(defun EXTENT-2D-HEIGHT (G1344)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-2D-WIDTH)</h4>

```Lisp
(defun (SETF EXTENT-2D-WIDTH) (G1346 G1345)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-2D-HEIGHT)</h4>

```Lisp
(defun (SETF EXTENT-2D-HEIGHT) (G1348 G1347)
  ...)
```

<h3 id="header:ADP:HEADERTAG1">VkExtent3D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-EXTENT-3D">Function: CREATE-EXTENT-3D</h4>

```Lisp
(defun CREATE-EXTENT-3D (&KEY ((:WIDTH G1355) 0) ((:HEIGHT G1356) 0)
                         ((:DEPTH G1357) 0))
  ...)
```

````
Constructor of EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-EXTENT-3D">Function: DESTROY-EXTENT-3D</h4>

```Lisp
(defun DESTROY-EXTENT-3D (ARG1359)
  ...)
```

````
Destructor of EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:WITH-EXTENT-3D">Macro: WITH-EXTENT-3D</h4>

```Lisp
(defmacro WITH-EXTENT-3D (VAR1369 ARGS1370 &BODY BODY1371)
  ...)
```

````
Wrap the body forms with CREATE-EXTENT-3D and DESTROY-EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:EXTENT-3D-WIDTH">Function: EXTENT-3D-WIDTH</h4>

```Lisp
(defun EXTENT-3D-WIDTH (G1360)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-3D-HEIGHT">Function: EXTENT-3D-HEIGHT</h4>

```Lisp
(defun EXTENT-3D-HEIGHT (G1361)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-3D-DEPTH">Function: EXTENT-3D-DEPTH</h4>

```Lisp
(defun EXTENT-3D-DEPTH (G1362)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-WIDTH)</h4>

```Lisp
(defun (SETF EXTENT-3D-WIDTH) (G1364 G1363)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-HEIGHT)</h4>

```Lisp
(defun (SETF EXTENT-3D-HEIGHT) (G1366 G1365)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-DEPTH)</h4>

```Lisp
(defun (SETF EXTENT-3D-DEPTH) (G1368 G1367)
  ...)
```

<h3 id="header:ADP:HEADERTAG2">VkOffset2D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-OFFSET-2D">Function: CREATE-OFFSET-2D</h4>

```Lisp
(defun CREATE-OFFSET-2D (&KEY ((:X G1375) 0) ((:Y G1376) 0))
  ...)
```

````
Constructor of OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-OFFSET-2D">Function: DESTROY-OFFSET-2D</h4>

```Lisp
(defun DESTROY-OFFSET-2D (ARG1378)
  ...)
```

````
Destructor of OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-OFFSET-2D">Macro: WITH-OFFSET-2D</h4>

```Lisp
(defmacro WITH-OFFSET-2D (VAR1385 ARGS1386 &BODY BODY1387)
  ...)
```

````
Wrap the body forms with CREATE-OFFSET-2D and DESTROY-OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:OFFSET-2D-X">Function: OFFSET-2D-X</h4>

```Lisp
(defun OFFSET-2D-X (G1379)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-2D-Y">Function: OFFSET-2D-Y</h4>

```Lisp
(defun OFFSET-2D-Y (G1380)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-2D-X)</h4>

```Lisp
(defun (SETF OFFSET-2D-X) (G1382 G1381)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-2D-Y)</h4>

```Lisp
(defun (SETF OFFSET-2D-Y) (G1384 G1383)
  ...)
```

<h3 id="header:ADP:HEADERTAG3">VkOffset3D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-OFFSET-3D">Function: CREATE-OFFSET-3D</h4>

```Lisp
(defun CREATE-OFFSET-3D (&KEY ((:X G1391) 0) ((:Y G1392) 0) ((:Z G1393) 0))
  ...)
```

````
Constructor of OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-OFFSET-3D">Function: DESTROY-OFFSET-3D</h4>

```Lisp
(defun DESTROY-OFFSET-3D (ARG1395)
  ...)
```

````
Destructor of OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:WITH-OFFSET-3D">Macro: WITH-OFFSET-3D</h4>

```Lisp
(defmacro WITH-OFFSET-3D (VAR1405 ARGS1406 &BODY BODY1407)
  ...)
```

````
Wrap the body forms with CREATE-OFFSET-3D and DESTROY-OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:OFFSET-3D-X">Function: OFFSET-3D-X</h4>

```Lisp
(defun OFFSET-3D-X (G1396)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-3D-Y">Function: OFFSET-3D-Y</h4>

```Lisp
(defun OFFSET-3D-Y (G1397)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-3D-Z">Function: OFFSET-3D-Z</h4>

```Lisp
(defun OFFSET-3D-Z (G1398)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-X)</h4>

```Lisp
(defun (SETF OFFSET-3D-X) (G1400 G1399)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-Y)</h4>

```Lisp
(defun (SETF OFFSET-3D-Y) (G1402 G1401)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-Z)</h4>

```Lisp
(defun (SETF OFFSET-3D-Z) (G1404 G1403)
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
(defun DESTROY-RECT-2D (ARG1412)
  ...)
```

````
Destructor of RECT-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-RECT-2D">Macro: WITH-RECT-2D</h4>

```Lisp
(defmacro WITH-RECT-2D (VAR1417 ARGS1418 &BODY BODY1419)
  ...)
```

````
Wrap the body forms with CREATE-RECT-2D and DESTROY-RECT-2D.
````

<h4 id="function:COMMON-VULKAN:RECT-2D-OFFSET">Function: RECT-2D-OFFSET</h4>

```Lisp
(defun RECT-2D-OFFSET (G1413)
  ...)
```

<h4 id="function:COMMON-VULKAN:RECT-2D-EXTENT">Function: RECT-2D-EXTENT</h4>

```Lisp
(defun RECT-2D-EXTENT (G1414)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF RECT-2D-OFFSET)</h4>

```Lisp
(defun (SETF RECT-2D-OFFSET) (OFFSET-ARG G1415)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF RECT-2D-EXTENT)</h4>

```Lisp
(defun (SETF RECT-2D-EXTENT) (EXTENT-ARG G1416)
  ...)
```

