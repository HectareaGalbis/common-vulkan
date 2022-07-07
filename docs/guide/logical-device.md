
# Logical device and queues

## Introduction

We need now to set up a logical device to interface with the physical device. Add a new member class to store de logical device.

```lisp
(defclass hello-triangle-application ()
  (...
   (physical-device :accessor physical-device :initform nil)
   (device :accessor device :initform nil)))
```

Next, add a `create-logical-device` function that is called from `init-vulkan`.

```lisp
(defun create-logical-device (app)
  )

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (pick-physical-device app)
  (create-logical-device app))
```

## Specifying the queues to be created

In order to create the device, first we need a `VkDeviceQueueCreateInfo`.

```lisp
(defun create-logical-device (app)
  (let ((indices (find-queue-families (physical-device app))))
    (cvk:with-device-queue-create-info queue-create-info (:sType cvk:VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
							  :queueFamilyIndex (queue-family-indices-graphics-family indices)
							  :queueCount 1
							  :pQueuePriorities (list 1.0))
      ...
      )))
```

## Specifying used device features

We have to indicate what features we want to enable in our device. To do that, we use a `VkPhysicalDeviceFeatures` structure. We can leave its members to VK_FALSE.

```lisp
(defun create-logical-device (app)
  (let ((indices (find-queue-families (physical-device app))))
    (cvk:with-device-queue-create-info queue-create-info (:sType cvk:VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
							  :queueFamilyIndex (queue-family-indices-graphics-family indices)
							  :queueCount 1
							  :pQueuePriorities (list 1.0))
      (cvk:with-physical-device-features device-features ()
        ...
        ))))
```

## Creating the logical device

Now we can start filling the `VkDeviceCreateInfo` structure.

```lisp
(cvk:with-device-create-info (:sType cvk:VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
			      :pQueueCreateInfos (list queue-create-info)
			      :queueCreateInfoCount 1
			      :pEnabledFeatures device-features
			      :enabledExtensionCount 0)
  ...
  )
```

If we want to be compatible with older implementations we should add the same layers as the vulkan instance ones.

```lisp
(let ((enabled-layer-names (if *enable-validation-layers*
			       (get-validation-layers)
			       nil)))
  (cvk:with-device-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
				            :pQueueCreateInfos (list queue-create-info)
				            :queueCreateInfoCount 1
				            :pEnabledFeatures device-features
				            :enabledExtensionCount 0
				            :enabledLayerCount (length enabled-layer-names)
				            :ppEnabledLayerNames enabled-layer-names)
    ...
    ))
```

And, finally, we are ready to create the logical device.

```lisp
(multiple-value-bind (device result) (cvk:create-device (physical-device app) create-info nil)
  (when (not (equal result cvk:VK_SUCCESS))
    (error "failed to create logical device!"))
  (setf (device app) device))
```

We must destroy the device in `clenup` with `destroy-device`.

```lisp
(defun cleanup (app)
  (cvk:destroy-device (device app) nil)
  ...
  )
```

## Retrieving queue handles

Add a class member to store the graphics queue.

```lisp
(defclass hello-triangle-application ()
  (...
   (device :accessor device :initform nil)
   (graphics-queue :accessor graphics-queue :initform nil)))
```

Right after the device creation, use `get-device-queue` to retrieve the queue handle.

```lisp
(multiple-value-bind (device result) (cvk:create-device (physical-device app) create-info nil)
  (when (not (equal result cvk:VK_SUCCESS))
    (error "failed to create logical device!"))
      (setf (device app) device)
      (setf (graphics-queue app) (cvk:get-device-queue device (queue-family-indices-graphics-family indices) 0)))
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/logical-device.lisp)

* **Next**: [Window surface](https://hectarea1996.github.io/common-vulkan/guide/window-surface.html)
* **Previous**: [Physical devices and queues](https://hectarea1996.github.io/common-vulkan/guide/physical-devices.html)