
# Rendering and presentation

We're going to write the `draw-frame` function that will be called from `main-loop`:

```lisp
(defun draw-frame (app)
  ...
  )

(defun main-loop (app)
  (loop while (not (glfw:window-should-close (window app)))
	do (glfw:poll-events)
	   (draw-frame app)))
```

## Creating the synchronization objects

Create three members to store the synchronization objects:

```lisp
(defclass hello-triangle-application ()
  (...
   (image-available-semaphore :accessor image-available-semaphore :initform nil)
   (render-finished-semaphore :accessor render-finished-semaphore :initform nil)
   (in-flight-fence :accessor in-flight-fence :initform nil)))
```

To create these objects, we'll add the `create-sync-objects` function:

```lisp
(defun create-sync-objects (app)
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
  (create-command-buffer app)
  (create-sync-objects app))
```

We use `VkSemaphoreCreateInfo` and `VkFenceCreateInfo` to create the sync objects:

```lisp
(defun create-sync-objects (app)
  (cvk:with-semaphore-create-info semaphore-info (:sType cvk:VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO)
    (cvk:with-fence-create-info fence-info (:sType cvk:VK_STRUCTURE_TYPE_FENCE_CREATE_INFO)
      (multiple-value-bind (image-available-sem result) (cvk:create-semaphore (device app) semaphore-info nil)
	(multiple-value-bind (render-finished-sem result2) (cvk:create-semaphore (device app) semaphore-info nil)
	  (multiple-value-bind (in-flight-fence result3) (cvk:create-fence (device app) fence-info nil)
	    (when (not (and (equal result cvk:VK_SUCCESS)
			    (equal result2 cvk:VK_SUCCESS)
			    (equal result3 cvk:VK_SUCCESS)))
	      (error "failed to create semaphores!"))
	    (setf (image-available-semaphore app) image-available-sem
		  (render-finished-semaphore app) render-finished-sem
		  (in-flight-fence app) in-flight-fence)))))))
```

These objects need to be destroyed at the end:

```lisp
(defun cleanup (app)
  (cvk:destroy-semaphore (device app) (image-available-semaphore app) nil)
  (cvk:destroy-semaphore (device app) (render-finished-semaphore app) nil)
  (cvk:destroy-fence (device app) (in-flight-fence app) nil)
  ...
  )
```

## Waiting for the previous frame

Now we'll fill the `draw-frame` function. First, we need to wait until the previous frame has finished:

```lisp
(defun draw-frame (app)
  (cvk:wait-for-fences (device app) (list (in-flight-fence app)) cvk:VK_TRUE cvk:UINT64_MAX)
  ...
  )
```

After waiting, we need to reset the fence:

```lisp
(defun draw-frame (app)
  (cvk:wait-for-fences (device app) (list (in-flight-fence app)) cvk:VK_TRUE cvk:UINT64_MAX)
  (cvk:reset-fences (device app) (list (in-flight-fence app)))
  ...
  )
```

Before we can proceed, we need to add the `VK_FENCE_CREATE_SIGNALED_BIT` flag to the `VkFenceCreateInfo`:

```lisp
(defun create-sync-objects (app)
  (cvk:with-semaphore-create-info semaphore-info (:sType cvk:VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO)
    (cvk:with-fence-create-info fence-info (:sType cvk:VK_STRUCTURE_TYPE_FENCE_CREATE_INFO
					    :flags cvk:VK_FENCE_CREATE_SIGNALED_BIT)
      ...
      )))
```

## Acquiring an image from the swap chain

The next thing is acquire an image from the swap chain:

```lisp
(defun draw-frame (app)
  ...
  (let ((image-index (cvk:acquire-next-image-khr (device app) (swap-chain app) cvk:UINT64_MAX (image-available-semaphore app) cvk:VK_NULL_HANDLE)))
    ...
    ))
```

## Recording the command buffer

We can now record the command buffer. We call `reset-command-buffer` on the command buffer to make sure it is able to be recorded:

```lisp
(defun draw-frame (app)
  ...
  (let ((image-index (cvk:acquire-next-image-khr (device app) (swap-chain app) cvk:UINT64_MAX (image-available-semaphore app) cvk:VK_NULL_HANDLE)))
    (cvk:reset-command-buffer (command-buffer app) 0)
    (record-command-buffer app (command-buffer app) image-index)
    ...
    ))
```

## Submitting the command buffer

Queue submission is reached through `VkSubmitInfo` and `queue-submit`:

```lisp
(defun draw-frame (app)
  ...
  (let ((image-index (cvk:acquire-next-image-khr (device app) (swap-chain app) cvk:UINT64_MAX (image-available-semaphore app) cvk:VK_NULL_HANDLE)))
    ...
    (let ((wait-semaphores (list (image-available-semaphore app)))
	  (wait-stages (list cvk:VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT))
	  (signal-semaphores (list (render-finished-semaphore app))))
      (cvk:with-submit-info submit-info (:sType cvk:VK_STRUCTURE_TYPE_SUBMIT_INFO
					 :waitSemaphoreCount 1
					 :pWaitSemaphores wait-semaphores
					 :pWaitDstStageMask wait-stages
					 :commandBufferCount 1
					 :pCommandBuffers (list (command-buffer app))
					 :signalSemaphoreCount 1
					 :pSignalSemaphores signal-semaphores)
	(let ((result (cvk:queue-submit (graphics-queue app) (list submit-info) (in-flight-fence app))))
	  (when (not (equal result cvk:VK_SUCCESS))
	    (print result)
	    (error "failed to submit draw command buffer!"))))
      ...
      )))
```

## Subpass dependencies

Subpass dependencies are specified in `VkSubpassDependency` structs. Go to `create-render-pass` and add one:

```lisp
(defun create-render-pass (app)
  (cvk:with-attachment-description color-attachment ...
    (cvk:with-attachment-reference color-attachment-ref ...
      (cvk:with-subpass-description subpass ...
	(cvk:with-subpass-dependency dependency (:srcSubpass cvk:VK_SUBPASS_EXTERNAL
						 :dstSubpass 0
						 :srcStageMask cvk:VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT
						 :srcAccessMask 0
						 :dstStageMask cvk:VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT
						 :dstAccessMask cvk:VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT)
	  (cvk:with-render-pass-create-info render-pass-info (:sType cvk:VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO
							      :attachmentCount 1
							      :pAttachments (list color-attachment)
							      :subpassCount 1
							      :pSubpasses (list subpass)
							      :dependencyCount 1
							      :pDependencies (list dependency))
	    ...
	    ))))))
```

## Presentation

Go back to the `draw-frame` function. We need `VkPresentInfoKHR` and `vkQueuePresentKHR` in order to do the presentation:

```lisp
(defun draw-frame (app)
  ...
  (let ((image-index (cvk:acquire-next-image-khr (device app) (swap-chain app) cvk:UINT64_MAX (image-available-semaphore app) cvk:VK_NULL_HANDLE)))
    ...
    (let ((wait-semaphores (list (image-available-semaphore app)))
	  (wait-stages (list cvk:VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT))
	  (signal-semaphores (list (render-finished-semaphore app))))
      ...
      (cvk:with-present-info-khr present-info (:sType cvk:VK_STRUCTURE_TYPE_PRESENT_INFO_KHR
					       :waitSemaphoreCount 1
					       :pWaitSemaphores signal-semaphores
					       :swapchainCount 1
					       :pSwapchains (list (swap-chain app))
					       :pImageIndices (list image-index)
					       :pResults nil)
	(cvk:queue-present-khr (present-queue app) present-info)))))
```

If you run the `main` function, you should see something like this:

![alt text](https://github.com/Hectarea1996/common-vulkan/blob/main/docs/guide/images/triangle.png?raw=true)

Unfortunately, you'll see some validation errors. To fix them, add `device-wait-idle` at the end of the `main-loop` function:

```lisp
(defun main-loop (app)
  (loop while (not (glfw:window-should-close (window app)))
	do (glfw:poll-events)
	   (draw-frame app))
  (cvk:device-wait-idle (device app)))
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/rendering.lisp)

* **Next**: [Frames in flight](https://hectarea1996.github.io/common-vulkan/guide/frames-in-flight.html)
* **Previous**: [Command buffers](https://hectarea1996.github.io/common-vulkan/guide/command-buffers.html)
