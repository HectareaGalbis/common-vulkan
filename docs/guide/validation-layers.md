
# Validation layers

## Using validation layers

The official tutorial creates a global variable. You do that too, but I prefer a function to retrieve the validation layers. To enable o disable the validation layers we do use a special global variable.

```lisp
(defconstant width 800)
(defconstant height 600)

(defun get-validation-layers ()
  (list "VK_LAYER_KHRONOS_validation"))

(defvar *enable-validation-layers* t)
```

Now we add the function `check-validation-layer-support` that checks if the layers are available.

```lisp
(defun check-validation-layer-support ()
  (cvk:with-enumerate-instance-layer-properties available-layers ()
    
    ))
```

Like in the preovious chapter with extension properties, we can't use `enumerate-instance-layer-properties` directly because of the memory allocation it does. We use `with-enumeration-instance-layer-properties` that manage that memory for us. Now, we need check if all of the layers in `(get-validation-layers)` exist in `available-layers`.

```lisp
(defun check-validation-layer-support ()
  (cvk:with-enumerate-instance-layer-properties available-layers ()
    (loop for layer-name in (get-validation-layers)
	        always (loop for layer-properties in available-layers
			                 thereis (string= layer-name (cvk:layer-properties-layerName layer-properties))))))

```

We can now use this function in `create-instance`:

```lisp
(defun create-instance (app)
  (if (and *enable-validation-layers* (not (check-validation-layer-support)))
      (error "validation layers requested, but not available!"))
      
  ...
  )
```

Finally, we modify the `VkInstanceCreateInfo` struct to include the validation layer names.

```lisp
(let ((glfw-extensions (glfw:get-required-instance-extensions))
      (validation-layers (if *enable-validation-layers*
		             (get-validation-layers)
			     nil)))
	
  (cvk:with-instance-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
  					      :pNext debug-info
					      :pApplicationInfo app-info
					      :enabledExtensionCount (length glfw-extensions)
					      :ppEnabledExtensionNames glfw-extensions
					      :enabledLayerCount (length validation-layers)
					      :ppEnabledLayerNames validation-layers)
    
    ...
    ))
```

## Message callback

We need to use the `Vk_EXT_debug_utils` extension to set up a callback to handle validation layer messages.

First, we are going to create the function `get-required-extensions` that will return the required extensions.

```lisp
(defun get-required-extensions ()
  (let* ((glfw-extensions (glfw:get-required-instance-extensions))
	 (extensions (if *enable-validation-layers*
			 (cons cvk:VK_EXT_DEBUG_UTILS_EXTENSION_NAME glfw-extensions)
			 glfw-extensions)))
    extensions))
```

We can now use this function in `create-instance`:

```lisp
(let ((extensions (get-required-extensions))
      (validation-layers (if *enable-validation-layers*
			     (get-validation-layers)
			     nil)))
	
  (cvk:with-instance-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
  					      :pNext debug-info
					      :pApplicationInfo app-info
					      :enabledExtensionCount (length extensions)
					      :ppEnabledExtensionNames extensions
					      :enabledLayerCount (length validation-layers)
					      :ppEnabledLayerNames validation-layers)
    
    ...
    ))
```

We define now a debug callback. Unlike in C or C++, we need here specific macros for doing this. In this case we use `def-debug-utils-messenger-callback`.

```lisp
(cvk:def-debug-utils-messenger-callback debug-callback (message-severity message-type callback-data user-data)
  (declare (ignore message-severity message-type user-data))
  (warn "validation layer: ~S" (cvk:debug-utils-messenger-callback-data-pMessage callback-data))

  cvk:VK_FALSE)
```

The first parameter of this macro is the name of the callback we are defining, which in this case is `debug-callback`. The rest of parameters are the arguments that the callback receives. You can name theses parameters whatever you want.

You can check if a message is important enough to be showed.

```lisp
(if (>= message-severity cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT)
  ; Do something
  )
```

The last thing we have to do is to create the debug messenger that handles the callback.

Add a function `setup-debug-messenger` in `init-vulkan` after `create-instance`:

```lisp
(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app))
  
(defun setup-debug-messenger ()
  (if *enable-validation-layers*
    ...
    ))
```

Like the creation of every object in Vulkan, we need first to fill a create info structure:

```lisp
(defun setup-debug-messenger (app)
  (if *enable-validation-layers*
      
      (cvk:with-debug-utils-messenger-create-info create-info
	(:sType cvk:VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT
	 :messageSeverity (logior cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT
				  cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT
				  cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT)
	 :messageType (logior cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT
			      cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT
			      cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT)
	 :pfnUserCallback 'debug-callback
	 :pUserData nil)
  ...
  ))
```

Before we finish this function, we need the function that creates the debug messenger. However, this function belongs to an extension, so it is not directly available. We need to use `get-instance-proc-addr`. We use it in a function that gets the required function and calls it.

```lisp
(defun create-debug-utils-messenger (instance create-info allocator)
  (let ((func (cvk:get-instance-proc-addr instance "vkCreateDebugUtilsMessengerEXT")))
    (if func
	(funcall func instance create-info allocator)
	(values nil cvk:VK_ERROR_EXTENSION_NOT_PRESENT))))
```

Now we can finish our `setup-debug-messenger` function.

```lisp
(multiple-value-bind (messenger result) (create-debug-utils-messenger (instance app) create-info nil)
  (if (not (equal result cvk:VK_SUCCESS))
      (error "failed to set up debug messenger! ~S" result))
  (setf (debug-messenger app) messenger))
```

To destroy de debug messenger we need to do a similar thing. First create `destroy-debug-utils-messenger`.

```lisp
(defun destroy-debug-utils-messenger (instance debug-messenger allocator)
  (let ((func (cvk:get-instance-proc-addr instance "vkDestroyDebugUtilsMessengerEXT")))
    (if func
	(funcall func instance debug-messenger allocator)
	(values nil cvk:VK_ERROR_EXTENSION_NOT_PRESENT))))

```

And use it in the `cleanup` function:

```lisp
(defun cleanup (app)
  (if *enable-validation-layers*
      (destroy-debug-utils-messenger (instance app) (debug-messenger app) nil))
  
  (cvk:destroy-instance (instance app) nil)
  
  (glfw:destroy-window (window app))
  
  (glfw:terminate))
```

## Debugging instance creation and destruction

To debug the creation and destruction of the vulkan instance we need to pass to the `pNext` member of `VkInstanceCreateInfo` a `VkDebugUtilsMessengerCreateInfoEXT` structure. We create a messenger create info in `create-instance`:

```lisp
(let ((extensions (get-required-extensions))
      (validation-layers (if *enable-validation-layers*
		             (get-validation-layers)
			     nil)))

  (cvk:with-debug-utils-messenger-create-info debug-info
      (:sType cvk:VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT
       :messageSeverity (logior cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT
				cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT
				cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT)
       :messageType (logior cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT
		            cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT
			    cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT)
       :pfnUserCallback 'debug-callback
       :pUserData nil)
	
    (cvk:with-instance-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
						:pNext debug-info
						:pApplicationInfo app-info
						:enabledExtensionCount (length extensions)
						:ppEnabledExtensionNames extensions
						:enabledLayerCount (length validation-layers)
						:ppEnabledLayerNames validation-layers)

      ...
      )))
```

We are done with the instance for now!

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/validation-layers.lisp)

* **Next**: [Physical devices and queue families](https://hectarea1996.github.io/common-vulkan/guide/physical-devices.html)
* **Previous**: [Instance](https://hectarea1996.github.io/common-vulkan/guide/instance.html)
