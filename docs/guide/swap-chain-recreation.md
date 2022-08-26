
# Swap chain recreation

## Recreating the swap chain

Create a new `recreate-swap-chain`:

```lisp
(defun recreate-swap-chain (app)
  (cvk:device-wait-idle (device app))
  
  (create-swap-chain app)
  (create-image-views app)
  (create-framebuffers app))
```

We need also a `cleanup-swap-chain` function that will be called from `recreate-swap-chain`:

```lisp
(defun cleanup-swap-chain (app)
  ...
  )


(defun recreate-swap-chain (app)
  (cvk:device-wait-idle (device app))
  
  (cleanup-swap-chain app)
  
  (create-swap-chain app)
  (create-image-views app)
  (create-framebuffers app))
```

All objects that depends on the swapchain will be moved from `cleanup` to `cleanup-swap-chain`:

```lisp
(defun cleanup-swap-chain (app)
  (loop for framebuffer in (swap-chain-framebuffers app)
	do (cvk:destroy-framebuffer (device app) framebuffer nil))
  (loop for image-view in (swap-chain-image-views app)
	do (cvk:destroy-image-view (device app) image-view nil))
  (cvk:destroy-swapchain-khr (device app) (swap-chain app) nil)
  (destroy-choose-swap-extent app (swap-chain-extent app)))

...

(defun cleanup (app)
  (cleanup-swap-chain app)
  (cvk:destroy-pipeline (device app) (graphics-pipeline app) nil)
  (cvk:destroy-pipeline-layout (device app) (pipeline-layout app) nil)
  (cvk:destroy-render-pass (device app) (render-pass app) nil)
  (loop for image-available-sem in (image-available-semaphores app)
	for render-finished-sem in (render-finished-semaphores app)
	for in-flight-fence in (in-flight-fences app)
	do (cvk:destroy-semaphore (device app) image-available-sem nil)
	   (cvk:destroy-semaphore (device app) render-finished-sem nil)
	   (cvk:destroy-fence (device app) in-flight-fence nil))
  (cvk:destroy-command-pool (device app) (command-pool app) nil)
  (cvk:destroy-device (device app) nil)
  (if *enable-validation-layers*
      (destroy-debug-utils-messenger (instance app) (debug-messenger app) nil))
  (cvk:destroy-surface-khr (instance app) (surface app) nil)
  (cvk:destroy-instance (instance app) nil)
  (glfw:destroy-window (window app))
  (glfw:terminate))
```

## Suboptimal or out-of-date swap chain

Modify the `draw-frame` function to check if we need to recreate the swap chain:

```lisp
(defun draw-frame (app)
  ...
  (multiple-value-bind (image-index result) (cvk:acquire-next-image-khr (device app) (swap-chain app) cvk:UINT64_MAX (nth current-frame (image-available-semaphores app)) cvk:VK_NULL_HANDLE)
    (cond
      ((equal result cvk:VK_ERROR_OUT_OF_DATE_KHR)
       (recreate-swap-chain app)
       (return-from draw-frame))
      ((and (not (equal result cvk:VK_SUCCESS))
	    (not (equal result cvk:VK_SUBOPTIMAL_KHR)))
       (error "failed to acquire swap chain image!")))
    ...
    (let ...
      (cvk:with-present-info-khr present-info ...
	(let ((result (cvk:queue-present-khr (present-queue app) present-info)))
	  (cond
	    ((or (equal result cvk:VK_ERROR_OUT_OF_DATE_KHR)
		 (equal result cvk:VK_SUBOPTIMAL_KHR))
	     (recreate-swap-chain app))
	    ((not (equal result cvk:VK_SUCCESS))
	     (error "failed to present swap chain image!")))))))
  (setf current-frame (mod (1+ current-frame) MAX_FRAMES_IN_FLIGHT)))
```

## Fixing a deadlock

The beginning of `draw-frame` should now look like this:

```lisp
(defun draw-frame (app)
  (cvk:wait-for-fences (device app) (list (nth current-frame (in-flight-fences app))) cvk:VK_TRUE cvk:UINT64_MAX)
  (multiple-value-bind (image-index result) (cvk:acquire-next-image-khr (device app) (swap-chain app) cvk:UINT64_MAX (nth current-frame (image-available-semaphores app)) cvk:VK_NULL_HANDLE)
    (cond
      ((equal result cvk:VK_ERROR_OUT_OF_DATE_KHR)
       (recreate-swap-chain app)
       (return-from draw-frame))
      ((and (not (equal result cvk:VK_SUCCESS))
	    (not (equal result cvk:VK_SUBOPTIMAL_KHR)))
       (error "failed to acquire swap chain image!")))
    ;; Only reset the fence if we are submitting work
    (cvk:reset-fences (device app) (list (nth current-frame (in-flight-fences app))))
    ...)
  ...)
```

## Handling resizes explicitly

Add a new member that flags that a resize has happened:

```lisp
(defclass hello-triangle-application ()
  (...
   (framebuffer-resized :accessor framebuffer-resized :initform nil)))
```

The `draw-frame` function should then modified to also check for this flag:

```lisp
(defun draw-frame (app)
  (cvk:wait-for-fences (device app) (list (nth current-frame (in-flight-fences app))) cvk:VK_TRUE cvk:UINT64_MAX)
  (multiple-value-bind ...
    (let ...
      (cvk:with-present-info-khr ...
	(let ((result (cvk:queue-present-khr (present-queue app) present-info)))
	  (cond
	    ((or (equal result cvk:VK_ERROR_OUT_OF_DATE_KHR)
		 (equal result cvk:VK_SUBOPTIMAL_KHR)
		 (framebuffer-resized app))
	     (setf (framebuffer-resized app) nil)
	     (recreate-swap-chain app))
	    ...)))))
  ...)
```

Now to actually detect resizes we can use the `set-framebuffer-size-callback` function in the GLFW framework to set up a callback:

```lisp
(glfw:def-framebuffer-size-callback framebuffer-resize-callback (window frame-width frame-height)
  ...
  )

(defun init-window (app)
  (glfw:init)
  
  (glfw:window-hint glfw:GLFW_CLIENT_API glfw:GLFW_NO_API)

  (setf (window app) (glfw:create-window width height "Vulkan" nil nil))
  (glfw:set-framebuffer-size-callback (window app) 'framebuffer-resize-callback))
```

We need to store the `app` variable inside the window:

```lisp
(defun init-window (app)
  ...
  (setf (window app) (glfw:create-window width height "Vulkan" nil nil))
  (glfw:set-window-user-pointer (window app) app)
  (glfw:set-framebuffer-size-callback (window app) 'framebuffer-resize-callback))
```

That value can now be retrieved from within the callback with `get-window-user-pointer` to properly set the flag:

```lisp
(glfw:def-framebuffer-size-callback framebuffer-resize-callback (window frame-width frame-height)
  (declare (ignore frame-width frame-height))
  (let ((app (glfw:get-window-user-pointer window)))
    (setf (framebuffer-resized app) t)))
```

## Handling minimization

We will handle minimization by pausing until the window is in the foreground again by extending the `recreate-swap-chain` function:

```lisp
(defun recreate-swap-chain (app)
  (loop for (frame-width frame-height) integer = (multiple-value-list (glfw:get-framebuffer-size (window app)))
	while (or (zerop frame-width)
		  (zerop frame-height))
	do (glfw:wait-events))
  (cvk:device-wait-idle (device app))
  ...)
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/swap-chain-recreation.lisp)

* **Next**: [Vetex input description](https://hectarea1996.github.io/common-vulkan/guide/vertex-input.html)
* **Previous**: [Frames in flight](https://hectarea1996.github.io/common-vulkan/guide/frames-in-flight.html)
