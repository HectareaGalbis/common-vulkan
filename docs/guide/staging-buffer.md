
# Staging buffer

## Abstracting buffer creation

Create a new function `create-buffer` and move the code in `create-vertex-buffer` (except mapping) to it.

```Lisp
(defun create-buffer (app size usage properties)
  (cvk:with-buffer-create-info buffer-info (:sType cvk:VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
                                            :size size
					                        :usage usage
					                        :sharingMode cvk:VK_SHARING_MODE_EXCLUSIVE)
    (multiple-value-bind (buffer result) (cvk:create-buffer (device app) buffer-info nil)
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to create vertex buffer!"))
      (cvk:with-get-buffer-memory-requirements mem-requirements ((device app) buffer)
	(cvk:with-memory-allocate-info alloc-info (:sType cvk:VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO
						                       :allocationSize (cvk:memory-requirements-size mem-requirements)
						                       :memoryTypeIndex (find-memory-type app
										                                          (cvk:memory-requirements-memoryTypeBits mem-requirements)
										                                          properties))
	  (multiple-value-bind (buffer-memory result) (cvk:allocate-memory (device app) alloc-info nil)
	    (when (not (equal result cvk:VK_SUCCESS))
	      (error "failed to allocate vertex buffer memory!"))
	    (cvk:bind-buffer-memory (device app) buffer buffer-memory 0)
	    (values buffer buffer-memory)))))))
```

You can now remove the buffer creation and memory allocation code from `create-vertex-buffer` and just call `create-buffer` instead:

```Lisp
(defun create-vertex-buffer (app)
  (let ((buffer-size (* (cvk:sizeof 'vertex) (length vertices))))
    (multiple-value-bind (vertex-buffer vertex-buffer-memory) (create-buffer app buffer-size
									                                         (logior cvk:VK_BUFFER_USAGE_TRANSFER_DST_BIT
										                                             cvk:VK_BUFFER_USAGE_VERTEX_BUFFER_BIT)
									                                         cvk:VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT)
	(setf (vertex-buffer app) vertex-buffer
	      (vertex-buffer-memory app) vertex-buffer-memory)
	(cvk:with-mapped-memory data ((device app) vertex-buffer-memory 0 buffer-size 0)
	  (cvk:memcpy data :pointer vertices 'vertex)))))
```

Run your program to make sure that the vertex buffer still works properly.

## Using a staging buffer

We are now going to change `create-vertex-buffer` to only use a host visible buffer as temporary buffer and use a device local one as actual vertex buffer.

```Lisp
(defun create-vertex-buffer (app)
  (let ((buffer-size (* (cvk:sizeof 'vertex) (length vertices))))
    (multiple-value-bind (staging-buffer staging-buffer-memory) (create-buffer app buffer-size
									                                           cvk:VK_BUFFER_USAGE_TRANSFER_SRC_BIT
									                                           (logior cvk:VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT
										                                               cvk:VK_MEMORY_PROPERTY_HOST_COHERENT_BIT))
      (cvk:with-mapped-memory data ((device app) staging-buffer-memory 0 buffer-size 0)
	    (cvk:memcpy data :pointer vertices 'vertex))
      (multiple-value-bind (vertex-buffer vertex-buffer-memory) (create-buffer app buffer-size
									                                           (logior cvk:VK_BUFFER_USAGE_TRANSFER_DST_BIT
										                                               cvk:VK_BUFFER_USAGE_VERTEX_BUFFER_BIT)
									                                           cvk:VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT)
	    ...))))
```

We are now going to write a function to copy the contents from one buffer to another, called `copy-buffer`:

```Lisp
(defun copy-buffer (app src-buffer dst-buffer size)
  ...)
```

We need first to allocate a command buffer:

```Lisp
(defun copy-buffer (app src-buffer dst-buffer size)
  (cvk:with-command-buffer-allocate-info alloc-info (:sType cvk:VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO
						                             :level cvk:VK_COMMAND_BUFFER_LEVEL_PRIMARY
						                             :commandPool (command-pool app)
						                             :commandBufferCount 1)
    (cvk:with-command-buffers command-buffers ((device app) alloc-info)
      (let ((command-buffer (car command-buffers)))
	    ...))))
```

And now we can start recording the command buffer:

```Lisp
(defun copy-buffer (app src-buffer dst-buffer size)
  (cvk:with-command-buffer-allocate-info alloc-info ...
    (cvk:with-command-buffers command-buffers ...
      (let ((command-buffer (car command-buffers)))
        (cvk:with-command-buffer-begin-info begin-info (:sType cvk:VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO
	    						                        :flags cvk:VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT)
	      (cvk:begin-command-buffer command-buffer begin-info))
	    (cvk:with-buffer-copy copy-region (:srcOffset 0
	    				                   :dstOffset 0
	    				                   :size size)
	      (cvk:cmd-copy-buffer command-buffer src-buffer dst-buffer (list copy-region)))
	    (cvk:end-command-buffer command-buffer)
	    ...))))
```

Finally execute the command buffer to complete the transfer:

```Lisp
(defun copy-buffer (app src-buffer dst-buffer size)
  (cvk:with-command-buffer-allocate-info alloc-info ...
    (cvk:with-command-buffers command-buffers ...
      (let ((command-buffer (car command-buffers)))
	    (cvk:with-command-buffer-begin-info begin-info ...
	      (cvk:begin-command-buffer command-buffer begin-info))
	    ...
	    (cvk:with-submit-info submit-info (:sType cvk:VK_STRUCTURE_TYPE_SUBMIT_INFO
	    				                   :commandBufferCount 1
	    				                   :pCommandBuffers command-buffers)
	      (cvk:queue-submit (graphics-queue app) (list submit-info) cvk:VK_NULL_HANDLE))
	    (cvk:queue-wait-idle (graphics-queue app))))))
```

We can now call `copy-buffer` from the `create-vertex-buffer` function to move the vertex data to the device local buffer:

```Lisp
(defun create-vertex-buffer (app)
  (let ((buffer-size (* (cvk:sizeof 'vertex) (length vertices))))
    (multiple-value-bind (staging-buffer staging-buffer-memory) ...
      ...
      (multiple-value-bind (vertex-buffer vertex-buffer-memory) ...
	    (setf (vertex-buffer app) vertex-buffer
	          (vertex-buffer-memory app) vertex-buffer-memory)
	    (copy-buffer app staging-buffer vertex-buffer buffer-size)
	    ...))))
```

After copying the data from the staging buffer to the device buffer, we should clean it up:

```Lisp
(defun create-vertex-buffer (app)
  (let ((buffer-size (* (cvk:sizeof 'vertex) (length vertices))))
    (multiple-value-bind (staging-buffer staging-buffer-memory) ...
      ...
      (multiple-value-bind (vertex-buffer vertex-buffer-memory) ...
	    ...
	    (copy-buffer app staging-buffer vertex-buffer buffer-size)
	    (cvk:destroy-buffer (device app) staging-buffer nil)
	    (cvk:free-memory (device app) staging-buffer-memory nil)))))
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/staging-buffer.lisp)

* **Next**: [Index buffer](https://hectarea1996.github.io/common-vulkan/guide/index-buffer.html)
* **Previous**: [Vertex buffer description](https://hectarea1996.github.io/common-vulkan/guide/vertex-buffer.html)
