
# Window surface

## Window surface creation

Add a `surface` class member.

```lisp
(defclass hello-triangle-application ()
  (...
   (surface :accessor surface :initform nil)
   ...
   ))
```

Add a function name `create-surface` to be called from `init-vulkan`.

```lisp
(defun create-surface (app)
  ...
  )

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (create-surface app)
  (pick-physical-device app)
  (create-logical-device app))
```

We use `create-window-surface` from GLFW to create the surface.

```lisp
(multiple-value-bind (surface result) (glfw:create-window-surface (instance app) (window app) nil)
  (when (not (equal result cvk:VK_SUCCESS))
    (error "failed to create widnow surface!"))
  (setf (surface app) surface))
```

Make sure that the surface is destroyed before the instance.

```lisp
(defun cleanup (app)
  ...
  (cvk:destroy-surface (instance app) (surface app) nil)
  (cvk:destroy-instance (instance app) nil)
  ...
```

## Quering for presentation support

We are going to modify the `queue-family-indices` structure to store a presentation family.

```lisp
(defstruct queue-family-indices
  (graphics-family nil)
  (present-family nil))

(defun is-queue-family-indices-complete (indices)
  (and (queue-family-indices-graphics-family indices)
       (queue-family-indices-present-family indices)))
```

Now modify the `find-queue-families` function to look for a queue family with presentation support.

```lisp
(loop for queue-family in queue-families
      for i from 0
      ...
      if (cvk:get-physical-device-surface-support device i (surface app))
        do (setf (queue-family-indices-present-family indices) i)
      if (is-queue-family-indices-complete indices)
        return nil)
```

## Creating the presentation queue

Add another member class to store the presentation queue.

```lisp
(defclass hello-triangle-application ()
  (...
   (present-queue :accessor present-queue :initform nil)))
```

Back to `create-logical-device`, we need to create multiple `VkDeviceQueueCreateInfo` structures. We are going to substitute `with-device-queue-create-info` with `create-device-queue-create-info` inside a `loop`. Also, we can use `remove-duplicates` to create a list with all the unique queue families that are necessary for the required queues.

```lisp
(defun create-logical-device (app)
  (let* ((indices (find-queue-families app (physical-device app)))
	 (unique-queue-families (remove-duplicates (list (queue-family-indices-graphics-family indices)
							 (queue-family-indices-present-family indices))))
	 (queue-create-infos (loop for queue-family in unique-queue-families
				   collect (cvk:create-device-queue-create-info
					    :sType cvk:VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
					    :queueFamilyIndex queue-family
					    :queueCount 1
					    :pQueuePriorities (list 1.0)))))
    ...
    ))
```

And modify the arguments of `with-device-create info`.

```lisp
(cvk:with-device-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
						    :pQueueCreateInfos queue-create-infos
						    :queueCreateInfoCount (length queue-create-infos)
						    :pEnabledFeatures device-features
						    :enabledExtensionCount 0
						    :enabledLayerCount (length enabled-layer-names)
						    :ppEnabledLayerNames enabled-layer-names)
  ...
  )
```

Note that we have used `create-device-queue-create-info`, then we must use `destroy-device-queue-create-info`. Add the necessary calls at the end of the function.

```lisp
(defun create-logical-device (app)
  (let* ((indices (find-queue-families app (physical-device app)))
	 (unique-queue-families (remove-duplicates (list (queue-family-indices-graphics-family indices)
							 (queue-family-indices-present-family indices))))
	 (queue-create-infos (loop for queue-family in unique-queue-families
				   collect (cvk:create-device-queue-create-info
					    :sType cvk:VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
					    :queueFamilyIndex queue-family
					    :queueCount 1
					    :pQueuePriorities (list 1.0)))))
    ...
    (loop for queue-create-info in queue-create-infos
	  do (cvk:destroy-device-queue-create-info queue-create-info))))
```

Finally, retrieve the presentation queue after the device creation.

```lisp
(multiple-value-bind (device result) (cvk:create-device (physical-device app) create-info nil)
  (when (not (equal result cvk:VK_SUCCESS))
    (error "failed to create logical device!"))
  (setf (device app) device)
  (setf (graphics-queue app) (cvk:get-device-queue device (queue-family-indices-graphics-family indices) 0))
  (setf (present-queue app) (cvk:get-device-queue device (queue-family-indices-present-family indices) 0)))   
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/window-surface.lisp)

* **Next**: [Swap chain](https://hectarea1996.github.io/common-vulkan/guide/swap-chain.html)
* **Previous**: [Logical device](https://hectarea1996.github.io/common-vulkan/guide/logical-device.html)
