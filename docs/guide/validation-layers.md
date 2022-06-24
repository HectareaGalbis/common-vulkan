
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

Like the creation of every object Vulkan, we need first to fill a create info structure:

```lisp
```
