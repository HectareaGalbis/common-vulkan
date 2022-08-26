
# Frames in flight

Start by adding a constant at the top of the program:

```lisp
(defconstant MAX_FRAMES_IN_FLIGHT 2)
```

Rename the command buffer, semaphores and fence members:

```lisp
(defclass hello-triangle-application ()
  (...
   (command-buffers :accessor command-buffers :initform nil)
   (image-available-semaphores :accessor image-available-semaphores :initform nil)
   (render-finished-semaphores :accessor render-finished-semaphores :initform nil)
   (in-flight-fences :accessor in-flight-fences :initform nil)))
```

We need to create multiple command buffers. Rename `create-command-buffer` to `create-command-buffers` and change the number command buffers to allocate:

```lisp
(defun create-command-buffers (app)
  (cvk:with-command-buffer-allocate-info alloc-info (:sType cvk:VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO
						     :commandPool (command-pool app)
						     :level cvk:VK_COMMAND_BUFFER_LEVEL_PRIMARY
						     :commandBufferCount MAX_FRAMES_IN_FLIGHT)
    (multiple-value-bind (command-buffers result) (cvk:allocate-command-buffers (device app) alloc-info)
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to allocate command buffers!"))
      (setf (command-buffers app) command-buffers))))
```

The `create-sync-objects` function should be changed to create all of the objects:

```lisp
(defun create-sync-objects (app)
  (cvk:with-semaphore-create-info semaphore-info (:sType cvk:VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO)
    (cvk:with-fence-create-info fence-info (:sType cvk:VK_STRUCTURE_TYPE_FENCE_CREATE_INFO
					    :flags cvk:VK_FENCE_CREATE_SIGNALED_BIT)
      (loop repeat MAX_FRAMES_IN_FLIGHT
	    collect (multiple-value-bind (image-available-sem result) (cvk:create-semaphore (device app) semaphore-info nil)
		      (when (not (equal result cvk:VK_SUCCESS))
			(error "failed to create semaphores for a frame!"))
		      image-available-sem)
	      into image-available-sems
	    collect (multiple-value-bind (render-finished-sem result2) (cvk:create-semaphore (device app) semaphore-info nil)
		      (when (not (equal result2 cvk:VK_SUCCESS))
			(error "failed to create semaphores for a frame!"))
		      render-finished-sem)
	      into render-finished-sems
	    collect (multiple-value-bind (in-flight-fence result3) (cvk:create-fence (device app) fence-info nil)
		      (when (not (equal result3 cvk:VK_SUCCESS))
			(error "failed to create fences for a frame!"))
		      in-flight-fence)
	      into in-flight-fences
	    finally (setf (image-available-semaphores app) image-available-sems
			  (render-finished-semaphores app) render-finished-sems
			  (in-flight-fences app) in-flight-fences)))))
```

Similarly, they should also all be cleaned up:

```lisp
(defun cleanup (app)
  (loop for image-available-sem in (image-available-semaphores app)
	for render-finished-sem in (render-finished-semaphores app)
	for in-flight-fence in (in-flight-fences app)
	do (cvk:destroy-semaphore (device app) image-available-sem nil)
	   (cvk:destroy-semaphore (device app) render-finished-sem nil)
	   (cvk:destroy-fence (device app) in-flight-fence nil))
  ...
  )
```

To use the right objects every frame, we will use a frame index:

```lisp
(defparameter current-frame 0)
```

The `draw-frame` function can now be modified to use the right objects:

```lisp
(defun draw-frame (app)
  (cvk:wait-for-fences (device app) (list (nth current-frame (in-flight-fences app))) cvk:VK_TRUE cvk:UINT64_MAX)
  (cvk:reset-fences (device app) (list (nth current-frame (in-flight-fences app))))
  (let ((image-index (cvk:acquire-next-image-khr (device app) (swap-chain app) cvk:UINT64_MAX (nth current-frame (image-available-semaphores app)) cvk:VK_NULL_HANDLE)))
    (cvk:reset-command-buffer (nth current-frame (command-buffers app)) 0)
    (record-command-buffer app (nth current-frame (command-buffers app)) image-index)
    (let ((wait-semaphores (list (nth current-frame (image-available-semaphores app))))
	  (wait-stages (list cvk:VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT))
	  (signal-semaphores (list (nth current-frame (render-finished-semaphores app)))))
      (cvk:with-submit-info submit-info (:sType cvk:VK_STRUCTURE_TYPE_SUBMIT_INFO
					 :waitSemaphoreCount 1
					 :pWaitSemaphores wait-semaphores
					 :pWaitDstStageMask wait-stages
					 :commandBufferCount 1
					 :pCommandBuffers (list (nth current-frame (command-buffers app)))
					 :signalSemaphoreCount 1
					 :pSignalSemaphores signal-semaphores)
	(let ((result (cvk:queue-submit (graphics-queue app) (list submit-info) (nth current-frame (in-flight-fences app)))))
	  ...))
      ...))
  ...)
```

Also, we need to advance to the next frame every time:

```lisp
(defun draw-frame (app)
  ...
  (setf current-frame (mod (1+ current-frame) MAX_FRAMES_IN_FLIGHT)))
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/frames-in-flight.lisp)

* **Next**: [Swap chain recreation](https://hectarea1996.github.io/common-vulkan/guide/swap-chain-recreation.html)
* **Previous**: [Rendering and presentation](https://hectarea1996.github.io/common-vulkan/guide/rendering.html)
