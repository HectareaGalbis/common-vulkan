
# Index buffer

## Index buffer creation

Modify the vertex data to represent four corners:

```Lisp
(defparameter vertices (list (create-vertex :pos '(-0.5 -0.5)
				            	            :color '(1.0 0.0 0.0))
			                 (create-vertex :pos '(0.5 -0.5)
				            	            :color '(0.0 1.0 0.0))
			                 (create-vertex :pos '(0.5 0.5)
				            	            :color '(0.0 0.0 1.0))
			                 (create-vertex :pos '(-0.5 0.5)
				            	            :color '(1.0 1.0 1.0))))
```

We'll add a new array `indices` to represent the contents of the index buffer:

```Lisp
(defparameter indices (list 0 1 2 2 3 0))
```

Define two new class members to store the buffer where the indices will be stored in:

```Lisp
(defclass hello-triangle-application ()
  (...
   (vertex-buffer :accessor vertex-buffer :initform nil)
   (vertex-buffer-memory :accessor vertex-buffer-memory :initform nil)
   (index-buffer :accessor index-buffer :initform nil)
   (index-buffer-memory :accessor index-buffer-memory :initform nil)))
```

The `create-index-buffer` function that we'll add now is almost identical to `create-vertex-buffer`:

```Lisp
(defun create-index-buffer (app)
  (let ((buffer-size (* (cvk:sizeof :uint16) (length indices))))
    (multiple-value-bind (staging-buffer staging-buffer-memory) (create-buffer app buffer-size
									                                           cvk:VK_BUFFER_USAGE_TRANSFER_SRC_BIT
									                                           (logior cvk:VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT
										                                               cvk:VK_MEMORY_PROPERTY_HOST_COHERENT_BIT))
      (cvk:with-mapped-memory data ((device app) staging-buffer-memory 0 buffer-size 0)
	    (cvk:memcpy data :pointer indices :uint16))
      (multiple-value-bind (index-buffer index-buffer-memory) (create-buffer app buffer-size
									                                         (logior cvk:VK_BUFFER_USAGE_TRANSFER_DST_BIT
										                                             cvk:VK_BUFFER_USAGE_INDEX_BUFFER_BIT)
									                                         cvk:VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT)
	    (setf (index-buffer app) index-buffer
	          (index-buffer-memory app) index-buffer-memory)
	    (copy-buffer app staging-buffer index-buffer buffer-size))
      (cvk:destroy-buffer (device app) staging-buffer nil)
      (cvk:free-memory (device app) staging-buffer-memory nil))))

...

(defun init-vulkan (app)
  ...
  (create-vertex-buffer app)
  (create-index-buffer app)
  ...)
```

The index buffer should be cleaned up at the end of the program, just like the vertex buffer:

```Lisp
(defun cleanup (app)
  (cleanup-swap-chain app)
  (cvk:destroy-buffer (device app) (vertex-buffer app) nil)
  (cvk:free-memory (device app) (vertex-buffer-memory app) nil)
  (cvk:destroy-buffer (device app) (index-buffer app) nil)
  (cvk:free-memory (device app) (index-buffer-memory app) nil)
  ...)
```

## Using an index buffer

Using an index buffer for drawing involves two changes to `record-command-buffer`:

```Lisp
(defun record-command-buffer (app command-buffer image-index)
  ...
  (let ((vertex-buffers (list (vertex-buffer app)))
	(offsets (list 0)))
    (cvk:cmd-bind-vertex-buffers command-buffer 0 vertex-buffers offsets))
  (cvk:cmd-bind-index-buffer command-buffer (index-buffer app) 0 cvk:VK_INDEX_TYPE_UINT16)
  ...)
```

We also need to change the drawing command. Replace `cmd-draw` with `cmd-draw-indexed`:

```Lisp
(defun record-command-buffer (app command-buffer image-index)
  ...
  (cvk:cmd-draw-indexed command-buffer (length indices) 1 0 0 0)
  (cvk:cmd-end-render-pass command-buffer)
  ...)
```

Now run your program and you should see the following:

![alt text](https://github.com/Hectarea1996/common-vulkan/blob/main/docs/guide/images/rectangle.png?raw=true)

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/index-buffer.lisp)

* **Next**: [Descriptor layout and buffer](https://hectarea1996.github.io/common-vulkan/guide/descriptor-layout.html)
* **Previous**: [Staging buffer](https://hectarea1996.github.io/common-vulkan/guide/staging-buffer.html)
