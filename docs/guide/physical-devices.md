
# Physical devices and queue families

## Selecting a physical device

We'll add a function `pick-physical-device` and add a call to it in the `init-vulkan` function.

```lisp
(defun pick-physical-device (app)

  )

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (pick-physical-device app))
```

We are going to select a graphics card and store it in a new member class.

```lisp
(defclass hello-triangle-application ()
  ((window :accessor window :initform nil)
   (instance :accessor instance :initform nil)
   (debug-messenger :accessor debug-messenger :initform nil)
   (physical-device :accessor physical-device :initform nil)))
```

We can get all the physical devices with `enumerate-physical-devices`.

```lisp
(defun pick-physical-device (app)
  (let ((devices (cvk:enumerate-physical-devices (instance app))))

  ))
```

If there are 0 devices with Vulkan support then we can't continue.

```lisp
(defun pick-physical-device (app)
  (let ((devices (cvk:enumerate-physical-devices (instance app))))
    (if (null devices)
	(error "failed to find GPUs with Vulkan support!"))

    ))
```

In order to evaluate each device, we'll create a new function:

```lisp
(defun is-device-suitable (app device)
  t)
```

And we'll check if any of the devices meet the requirements that we will add to that function:

```lisp
(defun pick-physical-device (app)
  (let ((devices (cvk:enumerate-physical-devices (instance app))))
    (if (null devices)
	(error "failed to find GPUs with Vulkan support!"))
    (loop for device in devices
	  if (is-device-suitable device)
	    do (setf (physical-device app) device)
	    and return nil)
    (if (not (physical-device app))
	(error "failed to find a suitable GPU!"))))
```

## Base device suitability checks

We can check the suitability of a device in very different ways. We show 2 examples.

We can check basic device properties. In the next example we check if the device is a discrete gpu and if it supports geometry shaders.

```lisp
(defun is-device-suitable (app device)
  (cvk:with-get-physical-device-properties properties (device)
    (cvk:with-get-physical-device-features features (device)
      (and (equal (cvk:physical-device-properties-deviceType properties)
                  cvk:VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU)
           (equal (cvk:physical-device-features-geometryShader features)
	          cvk:VK_TRUE)))))
```

We can also give each device a score and pick the highest one.

```lisp
(defun rate-device-suitability (app device)

  ...

  (if (not (cvk:physical-device-features-geometryShader features))
      0
      (+ (if (equal (cvk:physical-device-properties-deviceType properties)
                    cvk:VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU)
	     1000
	     0)
	 (cvk:physical-device-limits-maxImageDimension2D (cvk:physica-device-properties-limits properties)))))

(defun pick-physical-device (app)

  ...

  (loop for device in devices
        for score = (rate-device-suitability app device)
        for (max-score best-device) = '(0 nil) then (if (> score max-score)
	                                                (list score device)
							(list max-score best-device))
	finally (if (> max-score 0)
	            best-device
	            (error "failed to find a suitable GPU!"))))
```

We will use another aproach.

## Queue families

Add a function to find the queue families. We will ignore the app argument for now.

```lisp
(defun find-queue-families (app device)
  (declare (ignore app))
  )
```

We will use a struct to store the available queue families.

```lisp
(defstruct queue-family-indices
  (graphics-family nil))

(defun find-queue-families (app device)
  (declare (ignore app))
  (let ((indices (make-queue-family-indices)))

    ; Logic to find queue family indicesto populate struct with

    indices))
```

We'll use `with-get-physical-device-queue-family-properties` to retrieve the list of queue families.

```lisp
(cvk:with-get-physical-device-queue-family-properties queue-families (device)
  (loop for queue-family in queue-families
	for i from 0
	if (not (zerop (logand (cvk:queue-family-properties-queueFlags queue-family)
	   		       cvk:VK_QUEUE_GRAPHICS_BIT)))
	  do (setf (queue-family-indices-graphics-family indices) i)))
```

Now we can use that lookup function as a check in the `is-device-suitable` function to ensure that the device the commands we want to use:

```lisp
(defun is-device-suitable (app device)
  (let ((indices (find-queue-families app device)))
    (queue-family-indices-graphics-family indices)))
```

To make this a little more convenient, we'll add a generic check:

```lisp
(defun is-queue-family-indices-complete (indices)
  (queue-family-indices-graphics-family indices))

...

(defun is-device-suitable (app device)
  (let ((indices (find-queue-families app device)))
    (is-queue-family-indices-complete indices)))
```

We can now also use this for an early exit from `find-queue-families`:

```lisp
(loop for queue-family in queue-families
      for i from 0
      if (not (zerop (logand (cvk:queue-family-properties-queueFlags queue-family)
			     cvk:VK_QUEUE_GRAPHICS_BIT)))
	do (setf (queue-family-indices-graphics-family indices) i)
      if (is-queue-family-indices-complete indices)
	return nil)
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/physical-devices.lisp)

* **Next**: [Logical device and queues](https://hectarea1996.github.io/common-vulkan/guide/logical-device.html)
* **Previous**: [Validation layers](https://hectarea1996.github.io/common-vulkan/guide/validation-layers.html)