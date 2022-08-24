
# Command buffers

## Command pools

Add a new class member to store a command pool.

```lisp
(defclass hello-triangle-application ()
  (...
   (command-pool :accessor command-pool :initform nil)))
```

Then create a new function `create-command-pool` and call it from `init-vulkan`:

```lisp
(defun create-command-pool (app)
  ...)

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
  (create-command-pool app))
```

We only need the logical device and a command pool info structure:

```lisp
(defun create-command-pool (app)
  (let ((queue-family-indices (find-queue-families app (physical-device app))))
    (cvk:with-command-pool-create-info pool-info (:sType cvk:VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO
						  :flags cvk:VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT
						  :queueFamilyIndex (queue-family-indices-graphics-family queue-family-indices))
      ...
      )))
```

And we create the command pool:

```lisp
(defun create-command-pool (app)
  (let ((queue-family-indices (find-queue-families app (physical-device app))))
    (cvk:with-command-pool-create-info pool-info (:sType cvk:VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO
						  :flags cvk:VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT
						  :queueFamilyIndex (queue-family-indices-graphics-family queue-family-indices))
      (multiple-value-bind (command-pool result) (cvk:create-command-pool (device app) pool-info nil)
	(when (not (equal result cvk:VK_SUCCESS))
	  (error "failed to create command pool!"))
	(setf (command-pool app) command-pool)))))
```

The command pool should be destroyed at the end:

```lisp
(defun cleanup (app)
  (cvk:destroy-command-pool (device app) (command-pool app) nil)
  ...
  )
```

## Command buffer allocation

Now we can start allocating command buffers. Create a member class to store a command buffer.

```lisp
(defclass hello-triangle-application ()
  (...
   (command-buffer :accessor command-buffer :initform nil)))
```

Also, create a function `create-command-buffer` to allocate a single command buffer from the command pool:

```lisp
(defun create-command-buffer (app)
  ...
  )

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
  (create-command-buffer app))
```

To allocate a command buffer we need the function `allocate-command-buffers`:

```lisp
(defun create-command-buffer (app)
  (cvk:with-command-buffer-allocate-info alloc-info (:sType cvk:VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO
						     :commandPool (command-pool app)
						     :level cvk:VK_COMMAND_BUFFER_LEVEL_PRIMARY
						     :commandBufferCount 1)
    (multiple-value-bind (command-buffers result) (cvk:allocate-command-buffers (device app) alloc-info)
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to allocate command buffers!"))
      (setf (command-buffer app) (car command-buffers)))))
```

Command buffers are automatically freed when their command pool is destroyed.

## Command buffer recording

We'll create the function `record-command-buffer` that writes the commands into a command buffer. We use `begin-command-buffer` to start recording these.

```lisp
(defun record-command-buffer (app command-buffer image-index)
  (cvk:with-command-buffer-begin-info begin-info (:sType cvk:VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO
						  :flags 0
						  :pInheritanceInfo nil)
    (let ((result (cvk:begin-command-buffer command-buffer begin-info)))
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to begin recording command buffer!"))))
  ...
  )
```

## Starting a render pass

While recording the commands, first we need to begin the render pass with `cmd-begin-render-pass`:

```lisp
(defun record-command-buffer (app command-buffer image-index)
  ...
  (cvk:with-offset-2d offset (:x 0
			      :y 0)
    (cvk:with-rect-2d render-area (:offset offset
				   :extent (swap-chain-extent app))
      (cvk:with-clear-color-value clear-color-value (:float32 '(0.0 0.0 0.0 0.0))
	(cvk:with-clear-depth-stencil-value depth-stencil (:depth 0
							   :stencil 0)
	  (cvk:with-clear-value clear-value (:color clear-color-value
					     :depthStencil depth-stencil)
	    (cvk:with-render-pass-begin-info render-pass-info (:sType cvk:VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO
							       :renderPass (render-pass app)
							       :framebuffer (nth image-index (swap-chain-framebuffers app))
							       :renderArea render-area
							       :clearValueCount 1
							       :pClearValues clear-value)
	      (cvk:cmd-begin-render-pass command-buffer render-pass-info cvk:VK_SUBPASS_CONTENTS_INLINE)))))))
  ...
  )
```

## Basic drawing commands

We can now bind the graphics pipeline:

```lisp
(defun record-command-buffer (app command-buffer image-index)
  ...
  (cvk:cmd-bind-pipeline command-buffer cvk:VK_PIPELINE_BIND_POINT_GRAPHICS (graphics-pipeline app))
  ...
  )
```

The viewport and scissor are dynamic, so we need to set them in the command buffer before issuing our draw command:

```lisp
(defun record-command-buffer (app command-buffer image-index)
  ...
  (cvk:with-viewport viewport (:x 0.0
			       :y 0.0
			       :width (float (cvk:extent-2d-width (swap-chain-extent app)))
			       :height (float (cvk:extent-2d-height (swap-chain-extent app)))
			       :minDepth 0.0
			       :maxDepth 1.0)
    (cvk:cmd-set-viewport command-buffer 0 1 (list viewport)))
  (cvk:with-offset-2d offset (:x 0.0
			      :y 0.0)
    (cvk:with-rect-2d scissor (:offset offset
			       :extent (swap-chain-extent app))
      (cvk:cmd-set-scissor command-buffer 0 1 (list scissor))))
  ...
  )
```

Now we are ready to issue the draw command for the triangle:

```lisp
(defun record-command-buffer (app command-buffer image-index)
  ...
  (cvk:cmd-draw command-buffer 3 1 0 0)
  ...
  )
```

## Finishing up

We can now end the render pass and the command buffer:

```lisp
(defun record-command-buffer (app command-buffer image-index)
  ...
  (cvk:cmd-end-render-pass command-buffer)
  (let ((result (cvk:end-command-buffer command-buffer)))
    (when (not (equal result cvk:VK_SUCCESS))
      (error "failed to record command buffer!"))))
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/command-buffers.lisp)

* **Next**: [Rendering and presentation](https://hectarea1996.github.io/common-vulkan/guide/rendering.html)
* **Previous**: [Framebuffers](https://hectarea1996.github.io/common-vulkan/guide/framebuffers.html)
