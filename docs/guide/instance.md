
# Instance

## Creating an instance

The first we need to do is create a Vulkan instance. Add a `create-instance` function and call it in the `init-vulkan`function.

```lisp
(defun init-vulkan (app)
  (create-instance app))
```

Also add an instance member tou application class.

```lisp
(defclass hello-triangle-application ()
  ((window :accessor window :initform nil)
   (instance :accessor instance :initform nil)))
```

Now, we need some info structures like an `VkApplicationInfo` and `VkInstanceCreateInfo`. First, we create the former. Remember that every structure we create must be destroyed. A way to not deal with destructors is using `with-` macros. For each structure we have a `with-` macro. The name of these macros are easy to obtain. Look at the `VkApplicationInfo` name. Delete de `Vk` prefix (`ApplicationInfo`), separate with hyphen the different words (each word starts with a capital letter, so `Application-Info`), put all the words in lowercase (`application-info`) and add the prefix `with-` (`with-application-info`). The same occurs with the constructors (adding `create-`, so it should be `create-application-info`) and destructors (`destroy-application-info`).

```lisp
(defun create-instance (app)
  (cvk:with-application-info app-info (:sType cvk:VK_STRUCTURE_TYPE_APPLICATION_INFO
				                               :pApplicationName "Hello triangle"
				                               :applicationVersion (cvk:make-version 1 0 0)
				                               :pEngineName "No Engine"
				                               :engineVersion (cvk:make-version 1 0 0)
				                               :apiVersion (cvk:make-version 1 0 0)))
                                 
    )
```

See how we use the keywords to initialize every member of the struct. Also, the new application info structure is bound to `app-info`.

To create the next struture we need some extra information. Use the `get-required-instance-extensions` from GLFW to get the extensions we need to enable in the vulkan instance.

```lisp
(cvk:with-application-info app-info (:sType ...)
                                      
  (let ((glfw-extensions (glfw:get-required-instance-extensions)))
    
    ))                     
```

And now we can create the `VkInstanceCreateInfo` structure.

```lisp
(let ((glfw-extensions (glfw:get-required-instance-extensions)))
  (cvk:with-instance-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
						                                  :pApplicationInfo app-info
						                                  :enabledExtensionCount (length glfw-extensions)
						                                  :ppEnabledExtensionNames glfw-extensions)
    ))
```

In the official tutorial you can see that the create info structure is created before getting the glfw-extensions. We can do it the same way using only the first two keywords (`:sType` and `:pApplicationInfo`) and then using `setf` with the getters (`application-info-enabledExtensionCount` and `application-info-ppEnabledExtensionNames`). However, initializing every member at the beginning is more efficient. 

Finally we can create the instance.

```lisp
(cvk:with-instance-create-info create-info (:sType ...)
  (multiple-value-bind (instance result) (cvk:create-instance create-info nil)
	  
	  (if (not (equal result cvk:VK_SUCCESS))
	      (error "Failed to create instance"))

	  (setf (instance app) instance)))
```

There is a `with-instance` macro that works exactly the same way that the others. But, we are going to follow the steps of the official tutorial. 

## Checking for extension support

You can add the following code to see what extensions are present.

```lisp
(format t "available extensions:~%")
  (loop for extension-prop in (cvk:enumerate-instance-extension-properties nil)
	      do (format t "  ~S~%" (cvk:extension-properties-extensionName extension-prop)))
```

## Cleaning up

We need to destroy the instance before the program exits. 

```lisp
(defun cleanup (app)
  (cvk:destroy-instance (instance app) nil)
  
  (glfw:destroy-window (window app))
  
  (glfw:terminate))
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/instance.lisp)

* **Next**: [Validation layers]()
* **Previous**: [Base code]()
