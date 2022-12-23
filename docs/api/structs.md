<h1 id="header:COMMON-VULKAN:STRUCTS-HEADER">Structs</h1>

<h3 id="header:ADP:HEADERTAG0">VkExtent2D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-EXTENT-2D">Function: CREATE-EXTENT-2D</h4>

```Lisp
(defun CREATE-EXTENT-2D (&KEY ((:WIDTH G1336) 0) ((:HEIGHT G1337) 0))
  ...)
```

````
Constructor of EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-EXTENT-2D">Function: DESTROY-EXTENT-2D</h4>

```Lisp
(defun DESTROY-EXTENT-2D (ARG1339)
  ...)
```

````
Destructor of EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-EXTENT-2D">Macro: WITH-EXTENT-2D</h4>

```Lisp
(defmacro WITH-EXTENT-2D (VAR1346 ARGS1347 &BODY BODY1348)
  ...)
```

````
Wrap the body forms with CREATE-EXTENT-2D and DESTROY-EXTENT-2D.
````

<h4 id="function:COMMON-VULKAN:EXTENT-2D-WIDTH">Function: EXTENT-2D-WIDTH</h4>

```Lisp
(defun EXTENT-2D-WIDTH (G1340)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-2D-HEIGHT">Function: EXTENT-2D-HEIGHT</h4>

```Lisp
(defun EXTENT-2D-HEIGHT (G1341)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-2D-WIDTH)</h4>

```Lisp
(defun (SETF EXTENT-2D-WIDTH) (G1343 G1342)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-2D-HEIGHT)</h4>

```Lisp
(defun (SETF EXTENT-2D-HEIGHT) (G1345 G1344)
  ...)
```

<h3 id="header:ADP:HEADERTAG1">VkExtent3D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-EXTENT-3D">Function: CREATE-EXTENT-3D</h4>

```Lisp
(defun CREATE-EXTENT-3D (&KEY ((:WIDTH G1352) 0) ((:HEIGHT G1353) 0)
                         ((:DEPTH G1354) 0))
  ...)
```

````
Constructor of EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-EXTENT-3D">Function: DESTROY-EXTENT-3D</h4>

```Lisp
(defun DESTROY-EXTENT-3D (ARG1356)
  ...)
```

````
Destructor of EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:WITH-EXTENT-3D">Macro: WITH-EXTENT-3D</h4>

```Lisp
(defmacro WITH-EXTENT-3D (VAR1366 ARGS1367 &BODY BODY1368)
  ...)
```

````
Wrap the body forms with CREATE-EXTENT-3D and DESTROY-EXTENT-3D.
````

<h4 id="function:COMMON-VULKAN:EXTENT-3D-WIDTH">Function: EXTENT-3D-WIDTH</h4>

```Lisp
(defun EXTENT-3D-WIDTH (G1357)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-3D-HEIGHT">Function: EXTENT-3D-HEIGHT</h4>

```Lisp
(defun EXTENT-3D-HEIGHT (G1358)
  ...)
```

<h4 id="function:COMMON-VULKAN:EXTENT-3D-DEPTH">Function: EXTENT-3D-DEPTH</h4>

```Lisp
(defun EXTENT-3D-DEPTH (G1359)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-WIDTH)</h4>

```Lisp
(defun (SETF EXTENT-3D-WIDTH) (G1361 G1360)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-HEIGHT)</h4>

```Lisp
(defun (SETF EXTENT-3D-HEIGHT) (G1363 G1362)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF EXTENT-3D-DEPTH)</h4>

```Lisp
(defun (SETF EXTENT-3D-DEPTH) (G1365 G1364)
  ...)
```

<h3 id="header:ADP:HEADERTAG2">VkOffset2D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-OFFSET-2D">Function: CREATE-OFFSET-2D</h4>

```Lisp
(defun CREATE-OFFSET-2D (&KEY ((:X G1372) 0) ((:Y G1373) 0))
  ...)
```

````
Constructor of OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-OFFSET-2D">Function: DESTROY-OFFSET-2D</h4>

```Lisp
(defun DESTROY-OFFSET-2D (ARG1375)
  ...)
```

````
Destructor of OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-OFFSET-2D">Macro: WITH-OFFSET-2D</h4>

```Lisp
(defmacro WITH-OFFSET-2D (VAR1382 ARGS1383 &BODY BODY1384)
  ...)
```

````
Wrap the body forms with CREATE-OFFSET-2D and DESTROY-OFFSET-2D.
````

<h4 id="function:COMMON-VULKAN:OFFSET-2D-X">Function: OFFSET-2D-X</h4>

```Lisp
(defun OFFSET-2D-X (G1376)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-2D-Y">Function: OFFSET-2D-Y</h4>

```Lisp
(defun OFFSET-2D-Y (G1377)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-2D-X)</h4>

```Lisp
(defun (SETF OFFSET-2D-X) (G1379 G1378)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-2D-Y)</h4>

```Lisp
(defun (SETF OFFSET-2D-Y) (G1381 G1380)
  ...)
```

<h3 id="header:ADP:HEADERTAG3">VkOffset3D</h3>

<h4 id="function:COMMON-VULKAN:CREATE-OFFSET-3D">Function: CREATE-OFFSET-3D</h4>

```Lisp
(defun CREATE-OFFSET-3D (&KEY ((:X G1388) 0) ((:Y G1389) 0) ((:Z G1390) 0))
  ...)
```

````
Constructor of OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:DESTROY-OFFSET-3D">Function: DESTROY-OFFSET-3D</h4>

```Lisp
(defun DESTROY-OFFSET-3D (ARG1392)
  ...)
```

````
Destructor of OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:WITH-OFFSET-3D">Macro: WITH-OFFSET-3D</h4>

```Lisp
(defmacro WITH-OFFSET-3D (VAR1402 ARGS1403 &BODY BODY1404)
  ...)
```

````
Wrap the body forms with CREATE-OFFSET-3D and DESTROY-OFFSET-3D.
````

<h4 id="function:COMMON-VULKAN:OFFSET-3D-X">Function: OFFSET-3D-X</h4>

```Lisp
(defun OFFSET-3D-X (G1393)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-3D-Y">Function: OFFSET-3D-Y</h4>

```Lisp
(defun OFFSET-3D-Y (G1394)
  ...)
```

<h4 id="function:COMMON-VULKAN:OFFSET-3D-Z">Function: OFFSET-3D-Z</h4>

```Lisp
(defun OFFSET-3D-Z (G1395)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-X)</h4>

```Lisp
(defun (SETF OFFSET-3D-X) (G1397 G1396)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-Y)</h4>

```Lisp
(defun (SETF OFFSET-3D-Y) (G1399 G1398)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF OFFSET-3D-Z)</h4>

```Lisp
(defun (SETF OFFSET-3D-Z) (G1401 G1400)
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
(defun DESTROY-RECT-2D (ARG1409)
  ...)
```

````
Destructor of RECT-2D.
````

<h4 id="function:COMMON-VULKAN:WITH-RECT-2D">Macro: WITH-RECT-2D</h4>

```Lisp
(defmacro WITH-RECT-2D (VAR1414 ARGS1415 &BODY BODY1416)
  ...)
```

````
Wrap the body forms with CREATE-RECT-2D and DESTROY-RECT-2D.
````

<h4 id="function:COMMON-VULKAN:RECT-2D-OFFSET">Function: RECT-2D-OFFSET</h4>

```Lisp
(defun RECT-2D-OFFSET (G1410)
  ...)
```

<h4 id="function:COMMON-VULKAN:RECT-2D-EXTENT">Function: RECT-2D-EXTENT</h4>

```Lisp
(defun RECT-2D-EXTENT (G1411)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF RECT-2D-OFFSET)</h4>

```Lisp
(defun (SETF RECT-2D-OFFSET) (OFFSET-ARG G1412)
  ...)
```

<h4 id="function:COMMON-LISP:NIL">Function: (SETF RECT-2D-EXTENT)</h4>

```Lisp
(defun (SETF RECT-2D-EXTENT) (EXTENT-ARG G1413)
  ...)
```

