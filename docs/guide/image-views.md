
# Image views

Add a class member to store the image views in.

```lisp
(defclass hello-triangle-application ()
  (...
   (swap-chain-images :accessor swap-chain-images :initform nil)
   (swap-chain-image-views :accessor swap-chain-image-views :initform nil)
   ...))
```

Create the `create-image-views` function and call it from `init-vulkan`.

```lisp
(defun create-image-views (app)
  ...
  )

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (create-surface app)
  (pick-physical-device app)
  (create-logical-device app)
  (create-swap-chain app)
  (create-image-views app))
```

We will create an image view for each swap chain image and we will store them in the `image-views` list. Then, we can store the image views in our class.

```lisp
(defun create-image-views (app)
  (loop for image in (swap-chain-images app)
	collect ...
	  into image-views
	finally (setf (swap-chain-image-views app) image-views)))
```

Inside the `collect` statement, first create a `VkComponentMapping` and a `VkImageSubresourceRange` structures.

```lisp
(cvk:with-component-mapping component (:r cvk:VK_COMPONENT_SWIZZLE_IDENTITY
				       :g cvk:VK_COMPONENT_SWIZZLE_IDENTITY
				       :b cvk:VK_COMPONENT_SWIZZLE_IDENTITY
				       :a cvk:VK_COMPONENT_SWIZZLE_IDENTITY)
  (cvk:with-image-subresource-range subresource (:aspectMask cvk:VK_IMAGE_ASPECT_COLOR_BIT
						 :baseMipLevel 0
						 :levelCount 1
						 :baseArrayLayer 0
						 :layerCount 1)
    ...
    ))
```

Now we can fill the `VkImageViewCreateInfo` structure.

```lisp
(cvk:with-image-view-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO
  					      :image image
					      :viewType cvk:VK_IMAGE_VIEW_TYPE_2D
					      :format (swap-chain-image-format app)
					      :components component
					      :subresourceRange subresource)
  ...
  )
```

And finally we create each image view using `create-image-view`. We return the image-view to collect it.

```lisp
(multiple-value-bind (image-view result) (cvk:create-image-view (device app) create-info nil)
  (when (not (equal result cvk:VK_SUCCESS))
    (error "failed to create image views!"))
  image-view)
```

We need another loop inside `cleanup` to destroy each image view.

```lisp
(defun cleanup (app)
  (loop for image-view in (swap-chain-image-views app)
	do (cvk:destroy-image-view (device app) image-view nil))
  ...
  )
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/image-views.lisp)

* **Next**: [Shader modules](https://hectarea1996.github.io/common-vulkan/guide/shader-modules.html)
* **Previous**: [Swap chain](https://hectarea1996.github.io/common-vulkan/guide/swap-chain.html)
