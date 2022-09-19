
# Vertex buffer creation

## Buffer creation

Create a new function `create-vertex-buffer` and call it from `init-vulkan` right before `create-command-buffers`:

```Lisp
(defun create-vertex-buffer (app)
  ...)
		  
...

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (create-surface app)
  (pick-physical-device app)
  (create-logical-device app)
  (create-swap-chain app)
  (create-image-views app)
  (create-render-pass app)
  (create-graphics-pipeline app)
  (create-framebuffers app)
  (create-command-pool app)
  (create-vertex-buffer app)
  (create-command-buffers app)
  (create-sync-objects app))
```

First we need to fill a `VkBufferCreateInfo` structure:

```Lisp
(defun create-vertex-buffer (app)
  (cvk:with-buffer-create-info buffer-info (:sType cvk:VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
					                        :size (* (cvk:sizeof 'vertex) (length vertices))
					                        :usage cvk:VK_BUFFER_USAGE_VERTEX_BUFFER_BIT
					                        :sharingMode cvk:VK_SHARING_MODE_EXCLUSIVE)
    ...))
```

Define a class member to store the buffer we will create:

```Lisp
(defclass hello-triangle-application ()
  (...
   (vertex-buffer :accessor vertex-buffer :initform nil)))
```

And now we can create the buffer:

```Lisp
(defun create-vertex-buffer (app)
  (cvk:with-buffer-create-info buffer-info (:sType cvk:VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
					                        :size (* (cvk:sizeof 'vertex) (length vertices))
					                        :usage cvk:VK_BUFFER_USAGE_VERTEX_BUFFER_BIT
					                        :sharingMode cvk:VK_SHARING_MODE_EXCLUSIVE)
    (multiple-value-bind (vertex-buffer result) (cvk:create-buffer (device app) buffer-info nil)
      (when (not (equal result cvk:VK_SUCCESS))
	    (error "failed to create vertex buffer!"))
      (setf (vertex-buffer app) vertex-buffer)
      ...)))
```

The buffer must be cleaned up in the `cleanup` function:

```Lisp
(defun cleanup (app)
  (cleanup-swap-chain app)
  (cvk:destroy-buffer (device app) (vertex-buffer app) nil)
  ...)
```

## Memory requirements

The buffer needs some memory assigned to it. In order to allocate the memory we need first to know the buffer's memory requirements:

```Lisp
(defun create-vertex-buffer (app)
  (cvk:with-buffer-create-info buffer-info ...
    (multiple-value-bind (vertex-buffer result) ...
      ...
      (cvk:with-get-buffer-memory-requirements mem-requirements ((device app) vertex-buffer)
	    ...))))
```

The `mem-requirements` struct has some memory types we can use and we need to select one of them. Create a function named `find-memory-type` to do that:

```Lisp
(defun find-memory-type (app type-filter properties)
  (cvk:with-get-physical-device-memory-properties mem-properties ((physical-device app))
    (loop for i from 0 below (cvk:physical-device-memory-properties-memoryTypeCount mem-properties)
	      for mem-type in (cvk:physical-device-memory-properties-memoryTypes mem-properties)
	      if (and (logand type-filter (ash 1 i))
		          (equal (logand (cvk:memory-type-propertyFlags mem-type) properties)
			             properties))
	        do (return-from find-memory-type i))
    (error "failed to find suitable memory type!")))
```

## Memory allocation

We can now allocate the memory with a right type. First we need to fill a `VkMemoryAllocateInfo` structure:

```Lisp
(defun create-vertex-buffer (app)
  (cvk:with-buffer-create-info buffer-info ...
    (multiple-value-bind (vertex-buffer result) ...
      ...
      (cvk:with-get-buffer-memory-requirements mem-requirements ...
	    (cvk:with-memory-allocate-info alloc-info (:sType cvk:VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO
						                           :allocationSize (cvk:memory-requirements-size mem-requirements)
						                           :memoryTypeIndex (find-memory-type app
										                                             (cvk:memory-requirements-memoryTypeBits mem-requirements)
										                                             (logior cvk:VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT
											                                                 cvk:VK_MEMORY_PROPERTY_HOST_COHERENT_BIT)))
	      ...)))))
```

Before allocating the memory create a member class to store that memory:

```Lisp
(defclass hello-triangle-application ()
  (...
   (vertex-buffer-memory :accessor vertex-buffer-memory :initform nil)))
```

We use `allocate-memory` to allocate the memory:

```Lisp
(defun create-vertex-buffer (app)
  (cvk:with-buffer-create-info buffer-info ...
    (multiple-value-bind (vertex-buffer result) ...
      ...
      (cvk:with-get-buffer-memory-requirements mem-requirements ...
	    (cvk:with-memory-allocate-info alloc-info ...
	      (multiple-value-bind (vertex-buffer-memory result) (cvk:allocate-memory (device app) alloc-info nil)
	        (when (not (equal result cvk:VK_SUCCESS))
	          (error "failed to allocate vertex buffer memory!"))
	        (setf (vertex-buffer-memory app) vertex-buffer-memory)
	        ...))))))
```

If allocation was successful we can associate this memory with the buffer using `bind-buffer-memory`:

```Lisp
(defun create-vertex-buffer (app)
  (cvk:with-buffer-create-info buffer-info ...
    (multiple-value-bind (vertex-buffer result) ...
      ...
      (cvk:with-get-buffer-memory-requirements mem-requirements ...
	    (cvk:with-memory-allocate-info alloc-info ...
	      (multiple-value-bind (vertex-buffer-memory result) ...
	        ...
	        (cvk:bind-buffer-memory (device app) vertex-buffer vertex-buffer-memory 0)
	        ...))))))
```

The memory must be freed in the `cleanup` function:

```Lisp
(defun cleanup (app)
  (cleanup-swap-chain app)
  (cvk:destroy-buffer (device app) (vertex-buffer app) nil)
  (cvk:free-memory (device app) (vertex-buffer-memory app) nil)
  ...)
```

## Filling the vertex buffer

It is time to copy the vertex data to the buffer, We need to use `map-memory` and `unmap-memory`. But actually we will use `with-map-memory`. To copy the data we use the helper function `memcpy`:

```Lisp
(defun create-vertex-buffer (app)
  (cvk:with-buffer-create-info buffer-info ...
    (multiple-value-bind (vertex-buffer result) ...
      ...
      (cvk:with-get-buffer-memory-requirements mem-requirements ((device app) vertex-buffer)
	    (cvk:with-memory-allocate-info alloc-info ...
	      (multiple-value-bind (vertex-buffer-memory result) ...
	        ...
	        (cvk:with-mapped-memory data ((device app) vertex-buffer-memory 0 (cvk:buffer-create-info-size buffer-info) 0)
	          (cvk:memcpy data :pointer vertices 'vertex))))))))
```

Here `data` is just a pointer to the memory so we specify that data is of type `:pointer`. `vertices` is a list of elements of type `vertex` so we indicate it with the symbol `'vertex`.

## Binding the vertex buffer

We are going to modify the `record-command-buffer` function to bind the vertex buffer:

```Lisp
(defun record-command-buffer (app command-buffer image-index)
  ...
  (cvk:cmd-bind-pipeline command-buffer cvk:VK_PIPELINE_BIND_POINT_GRAPHICS (graphics-pipeline app))
  (let ((vertex-buffers (list (vertex-buffer app)))
	    (offsets (list 0)))
    (cvk:cmd-bind-vertex-buffers command-buffer 0 vertex-buffers offsets))
  ...
  (cvk:cmd-draw command-buffer (length vertices) 1 0 0)
  ...)
```
Now run the program and yoy should see the familiar triangle again:

![alt text](https://github.com/Hectarea1996/common-vulkan/blob/main/docs/guide/images/triangle2.png?raw=true)

Try changing the color of the top vertex to white by modifying the `vertices` array:

```Lisp
(defparameter vertices (list (create-vertex :pos '(0.0 -0.5)
				                    	    :color '(1.0 1.0 1.0))
	                         (create-vertex :pos '(0.5 0.5)
				                    	    :color '(0.0 1.0 0.0))
			                 (create-vertex :pos '(-0.5 0.5)
				                    	    :color '(0.0 0.0 1.0))))
```

![alt text](https://github.com/Hectarea1996/common-vulkan/blob/main/docs/guide/images/triangle3.png?raw=true)

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/vertex-buffer.lisp)

* **Next**: [Staging buffer](https://hectarea1996.github.io/common-vulkan/guide/staging-buffer.html)
* **Previous**: [Vertex input description](https://hectarea1996.github.io/common-vulkan/guide/vertex-input.html)
