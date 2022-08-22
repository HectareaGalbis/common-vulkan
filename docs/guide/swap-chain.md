
# Swap chain

## Checking for swap chain support

First create a function that returns a list of required device extensions.

```lisp
(defun get-device-extensions ()
  (list cvk:VK_KHR_SWAPCHAIN_EXTENSION_NAME))
```

Next, create a new function `check-device-extension-support` that is called from `is-device-suitable`.

```lisp
(defun check-device-extension-support (app device)
  t)

(defun is-device-suitable (app device)
  (let* ((indices (find-queue-families app device))
	 (extension-supported (check-device-extension-support app device)))
    (and (is-queue-family-indices-complete indices)
	 extension-supported)))
```

Modify the body of the function to enumerate the extensions and check if all of the required extensions are amongst them.

```lisp
(defun check-device-extension-support (app device)
  (declare (ignore app))
  (cvk:with-enumerate-device-extension-properties available-extensions (device nil)
    (let ((required-extensions (get-device-extensions)))
      (loop for required-extension in required-extensions
	    always (member required-extension available-extensions
	                                      :key #'cvk:extension-properties-extensionName
	                                      :test #'string=)))))
```

## Enabling device extensions

We need to enable the swapchain extension. Just do a small change in the logical device creation.

```lisp
(cvk:with-device-create-info create-info (...
					  :enabledExtensionCount (length (get-device-extensions))
					  :ppEnabledExtensionNames (get-device-extensions)
					  ...)
  ...
  )
```

## Querying details of swap chain support

We will use the next struct to store some properties related with the swapchain.

```lisp
(defstruct swap-chain-support-details
  (capabilities nil)
  (formats nil)
  (present-modes nil))
```

Now we create a new function `create-query-swap-chain-support` to populate this struct. We will use some `create-` functions, so we need to create also a `destroy-query-swap-chain-support` where we will call to the respectively `destroy-` functions.

```lisp
(defun create-query-swap-chain-support (app device)
  ...
  )

(defun destroy-query-swap-chain-support (query-details)
  ...
  )
```

We start with the surface capabilities.

```lisp
(defun create-query-swap-chain-support (app device)
  (let ((capabilities (cvk:create-get-physical-device-surface-capabilities-khr device (surface app)))
    )))
```

Next, the surface formats.

```lisp
(defun create-query-swap-chain-support (app device)
  (let ((capabilities (cvk:create-get-physical-device-surface-capabilities-khr device (surface app)))
	(formats (cvk:create-get-physical-device-surface-formats-khr device (surface app)))
    )))
```

And finally, the presentation modes.

```lisp
(defun create-query-swap-chain-support (app device)
  (let ((capabilities (cvk:create-get-physical-device-surface-capabilities device (surface app)))
	(formats (cvk:create-get-physical-device-surface-formats device (surface app)))
	(present-modes (cvk:get-physical-device-surface-present-modes-khr device (surface app))))
    ))
```

Now we can create `swap-chain-support-details` object.

```lisp
(defun create-query-swap-chain-support (app device)
  (let ((capabilities (cvk:create-get-physical-device-surface-capabilities-khr device (surface app)))
	(formats (cvk:create-get-physical-device-surface-formats-khr device (surface app)))
	(present-modes (cvk:get-physical-device-surface-present-modes-khr device (surface app))))
    (make-swap-chain-support-details :capabilities capabilities
				     :formats formats
				     :present-modes present-modes)))
```

Note that we have used two `create-` functions. Fill the `destroy-query-swap-chain-support` function with the next two calls.

```lisp
(defun destroy-query-swap-chain-support (query-details)
  (cvk:destroy-get-physical-device-surface-capabilities-khr (swap-chain-support-details-capabilities query-details))
  (cvk:destroy-get-physical-device-surface-formats-khr (swap-chain-support-details-formats query-details)))
```

All the details are in the struct. We can use them in the `is-device-suitable` function.

```lisp
(defun is-device-suitable (app device)
  (let* (...
	 (swap-chain-support (create-query-swap-chain-support app device))
	 (swap-chain-adequate (and (not (null (swap-chain-support-details-formats swap-chain-support)))
				   (not (null (swap-chain-support-details-present-modes swap-chain-support))))))
    (destroy-query-swap-chain-support swap-chain-support) ; <- Destroy swap-chain-support before exit!
    ...
    ))
```

The last check made in the function changes to:

```lisp
(and (is-queue-family-indices-complete indices)
     extension-supported
     swap-chain-adequate)
```

## Choosing the right settings for the swap chain

### Surface format

This function receives a list of formats from which it will choose one.

```lisp
(defun choose-swap-surface-format (app available-formats)
  (declare (ignore app))
  ...
  )
```

Let's loop over the list and see if the preferred combination is available. If the search fails, we return the first format in the list.

```lisp
(let ((chosen-format (loop for available-format in available-formats
			   if (and (equal (cvk:surface-format-khr-format available-format)
			                  cvk:VK_FORMAT_B8G8R8A8_SRGB)
				   (equal (cvk:surface-format-khr-colorSpace available-format)
				          cvk:VK_COLOR_SPACE_SRGB_NONLINEAR_KHR))
			     return available-format)))
  (or chosen-format (car available-formats)))
```

### Presentation mode

Similarly, we are going to search for the best presentation mode. If it is not available, we return `VK_PRESENT_MODE_FIFO_KHR`.

```lisp
(defun choose-swap-present-mode (app available-present-modes)
  (declare (ignore app))
  (let ((chosen-present-mode (loop for available-present-mode in available-present-modes
				   if (equal available-present-mode cvk:VK_PRESENT_MODE_MAILBOX_KHR)
				     return available-present-mode)))
    (or chosen-present-mode cvk:VK_PRESENT_MODE_FIFO_KHR)))
```

### Swap extent

The last property is the extent. We will add one last function. This function will use some `create-` functions. So we will create also the `destroy-choose-swap-extent` function.

```lisp
(defun create-choose-swap-extent (app capabilities)
  (if (not (equal (cvk:extent-2d-width (cvk:surface-capabilities-khr-currentExtent capabilities)) UINT32_MAX))
      (let ((current-extent (cvk:surface-capabilities-khr-currentExtent capabilities)))
	(cvk:create-extent-2d :width (cvk:extent-2d-width current-extent)
			      :height (cvk:extent-2d-height current-extent)))
      (multiple-value-bind (frame-width frame-height) (glfw:get-framebuffer-size (window app))
	(let* ((min-image-extent (cvk:surface-capabilities-khr-minImageExtent capabilities))
	       (max-image-extent (cvk:surface-capabilities-khr-maxImageExtent capabilities))
	       (min-width (cvk:extent-2d-width min-image-extent))
	       (min-height (cvk:extent-2d-height min-image-extent))
	       (max-width (cvk:extent-2d-width max-image-extent))
	       (max-height (cvk:extent-2d-height max-image-extent)))
	  (cvk:create-extent-2d :width (cond
					 ((> frame-width max-width) max-width)
					 ((< frame-width min-width) min-width)
					 (t frame-width))
				:height (cond
					  ((> frame-height max-height) max-height)
					  ((< frame-height min-height) min-height)
					  (t frame-height)))))))
```

In the `destroy-choose-swap-extent` function we only need to destroy the extent created in the previous function.

```lisp
(defun destroy-choose-swap-extent (app extent)
  (declare (ignore app))
  (cvk:destroy-extent-2d extent))
´´´

## Creating the swap chain

Create a new `create-swap-chain` function and make sure to call it from `init-vulkan` after logical device creation.

```lisp
(defun create-swap-chain (app)
  (let* ((swap-chain-support (create-query-swap-chain-support app (physical-device app)))
	 (surface-format (choose-swap-surface-format app (swap-chain-support-details-formats swap-chain-support)))
	 (present-mode (choose-swap-present-mode app (swap-chain-support-details-present-modes swap-chain-support)))
	 (extent (create-choose-swap-extent app (swap-chain-support-details-capabilities swap-chain-support)))
  ...
  )))

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (create-surface app)
  (pick-physical-device app)
  (create-logical-device app)
  (create-swap-chain app))
```

We need to indicate the number of images we want in the swap chain.

```lisp
(defun create-swap-chain (app)
  (let* (...
         (image-count (if (and (> (cvk:surface-capabilities-khr-maxImageCount (swap-chain-support-details-capabilities swap-chain-support)) 0)
			       (> (1+ (cvk:surface-capabilities-khr-minImageCount (swap-chain-support-details-capabilities swap-chain-support)))
				  (cvk:surface-capabilities-khr-maxImageCount (swap-chain-support-details-capabilities swap-chain-support))))
			  (cvk:surface-capabilities-khr-maxImageCount (swap-chain-support-details-capabilities swap-chain-support))
			  (1+ (cvk:surface-capabilities-khr-minImageCount (swap-chain-support-details-capabilities swap-chain-support)))))
  ...
  )))
```

We will need the queue family indices too.

```lisp
(defun create-swap-chain (app)
  (let* (...
         (indices (find-queue-families app (physical-device app)))
	 (family-indices-list (list (queue-family-indices-graphics-family indices)
				    (queue-family-indices-present-family indices)))
  ...
  )))
```

Depending on the values of graphics family and present family we will use different settings.

```lisp
(defun create-swap-chain (app)
  (let* (...
         (equal-families-p (equal (queue-family-indices-graphics-family indices)
				  (queue-family-indices-present-family indices)))
	 (sharing-mode (if (not equal-families-p)
			   cvk:VK_SHARING_MODE_CONCURRENT
			   cvk:VK_SHARING_MODE_EXCLUSIVE))
	 (queue-family-index-count (if (not equal-families-p) 2 0))
	 (family-indices (if (not equal-families-p) family-indices-list nil))
  ...
  )))
```

We specify that we want the current transformation.

```lisp
(defun create-swap-chain (app)
  (let* (...
         (pre-transform (cvk:surface-capabilities-khr-currentTransform (swap-chain-support-details-capabilities swap-chain-support)))
  ...
  )))
```

There are more values we need to use in the creation of the swap chain, but we can supply them directly. Let's create now the `VkSwapchainCreateInfoKHR` structure.

```lisp
(defun create-swap-chain (app)
  (let* (...)
    (cvk:with-swapchain-create-info-khr create-info (:sType cvk:VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR
    						     :surface (surface app)
						     :minImageCount image-count
						     :imageFormat (cvk:surface-format-format surface-format)
						     :imageColorSpace (cvk:surface-format-colorSpace surface-format)
						     :imageExtent extent
						     :imageArrayLayers 1
						     :imageUsage cvk:VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT
						     :imageSharingMode sharing-mode
						     :queueFamilyIndexCount queue-family-index-count
						     :pQueueFamilyIndices family-indices
						     :preTransform pre-transform
						     :compositeAlpha cvk:VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR
						     :presentMode present-mode
						     :clipped cvk:VK_TRUE
						     :oldSwapchain nil)
      ...
      )))
```

Add a new member class to store the swap chain.

```lisp
(defclass hello-triangle-application ()
  (...
   (swap-chain :accessor swap-chain :initform nil)))
```

Back to `create-swap-chain`, create the swapchain using the `create-swapchain` function.

```lisp
(cvk:with-swapchain-create-info-khr create-info (...)
  (when (not (equal result cvk:VK_SUCCESS))
    (error "failed to create swap chain!"))
  (setf (swap-chain app) swap-chain)
  (destroy-query-swap-chain-support swap-chain-support)))
```

We have destroyed the swap-chain-support that we created before.

Remember to destroy the swap chain in the `cleanup` function.

```lisp
(defun cleanup (app)
  (cvk:destroy-swapchain-khr (device app) (swap-chain app) nil)
  ...
  )
```

## Retrieving the swap chain images

Add a class member to store the swap chain images.

```lisp
(defclass hello-triangle-application ()
  (...
   (swap-chain :accessor swap-chain :initform nil)
   (swap-chain-images :accessor swap-chain-images :initform nil)))
```

After creating the swap chain, we can retrieve its images using `get-swapchain-images`.

```lisp
(defun create-swap-chain (app)
  (let* (...)
    (cvk:with-swapchain-create-info-khr create-info (...)
      (multiple-value-bind (swap-chain result) (cvk:create-swapchain-khr (device app) create-info nil)
	...
	(setf (swap-chain app) swap-chain)
	(setf (swap-chain-images app) (cvk:get-swapchain-images-khr (device app) (swap-chain app)))
	(destroy-query-swap-chain-support swap-chain-support)))))
```

One last thing, store the format and extent we have chosen for the swap chain images.

```lisp
(defclass hello-triangle-application ()
  (...
   (swap-chain :accessor swap-chain :initform nil)
   (swap-chain-images :accessor swap-chain-images :initform nil)
   (swap-chain-image-format :accessor swap-chain-image-format :initform nil)
   (swap-chain-extent :accessor swap-chain-extent :initform nil)))
...

(defun create-swap-chain (app)
  (let* (...)
    (cvk:with-swapchain-create-info create-info (...)
      (multiple-value-bind (swap-chain result) (cvk:create-swapchain (device app) create-info nil)
	...
	(setf (swap-chain app) swap-chain)
	(setf (swap-chain-images app) (cvk:get-swapchain-images-khr (device app) (swap-chain app)))
        (setf (swap-chain-image-format app) (cvk:surface-format-khr-format surface-format))
        (setf (swap-chain-extent app) extent)
	(destroy-query-swap-chain-support swap-chain-support)))))
```

Remember that the extent was created with the `create-choose-swap-extent` function. Destroy the extent in the `cleanup` function.

```lisp
(defun cleanup (app)
  (cvk:destroy-swapchain-khr (device app) (swap-chain app) nil)
  (destroy-choose-swap-extent app (swap-chain-extent app))
  ...
  )
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/swap-chain.lisp)

* **Next**: [Image views](https://hectarea1996.github.io/common-vulkan/guide/image-views.html)
* **Previous**: [Window surface](https://hectarea1996.github.io/common-vulkan/guide/window-surface.html)
