
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
  )
```
