
# Base code

## General structure

We are going to start with the following code in our `main.lisp` file.

```lisp
;;; main.lisp

(in-package :cvg)


(defclass hello-triangle-application ()
  ((window :accessor window :initform nil)))

(defgeneric init-vulkan (obj))
(defgeneric main-loop (obj))
(defgeneric cleanup (obj))
(defgeneric run (obj))


(defmethod init-vulkan ((obj hello-triangle-application)))

(defmethod main-loop ((obj hello-triangle-application)))

(defmethod cleanup ((obj hello-triangle-application)))

(defmethod run ((obj hello-triangle-application))
  (init-vulkan obj)
  (main-loop obj)
  (cleanup obj))


(defun main ()
  (let ((app (make-instance 'hello-triangle-application)))
    (run app)))
```

## Resource management

Like in C, we still need to allocate and deallocate the objects we will create using GLFW or Vulkan. 
The `common-vulkan` library provides `with-` macros to avoid calling the destructor every time. You can
find them in the [Api Reference](https://hectarea1996.github.io/common-vulkan/api/index.html).

## Integrating GLFW

You don't need to use GLFW if you don't want to. But I like it and the tutorial uses it. 

We are going to add a `init-window` function inside our `run` function.

```lisp
(defmethod run ((obj hello-triangle-application))
  (init-window obj)
  (init-vulkan obj)
  (main-loop obj)
  (cleanup obj))
```

Inside `init-window` we must call `glfw:init` to initialize the GLFW system, `glfw:window-hint` to not create an OpenGL context and disable window resizing, and finally `glfw:create-window` to create a window. Also, we define the `width` and `height` constants and create a `window` member in out class.

```lisp
;;; main.lisp at the top

(in-package :cvg)

(defconstant width 800)
(defconstant height 600)

(defclass hello-triangle-application ()
  ((window :accessor window :initform nil)))
```

```lisp
;;; main.lisp

(defun init-window ()
  (glfw:init)
  
  (glfw:window-hint glfw:GLFW_CLIENT_API glfw:GLFW_NO_API)
  (glfw:window-hint glfw:GLFW_RESIZABLE glfw:GLFW_FALSE))
  
  (setf (window obj) (glfw:create-window width height "Vulkan" nil nil)))
```

We fill the `main-loop` function:

```lisp
(defmethod main-loop ((obj hello-triangle-application))
  (loop while (not (glfw:window-should-close (window obj)))
	      do (glfw:poll-events)))
```

And lastly, we need to clean up the resources.

```lisp
(defmethod cleanup ((obj hello-triangle-application))
  (glfw:destroy-window (window obj))
  
  (glfw:terminate))
```

When you load the `run.lisp` file you should see a window titled `Vulkan`. After closing the window, the resources will clean up and the function will end.

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/base-code.lisp)

* **Next**: [Instance](https://hectarea1996.github.io/common-vulkan/guide/instance.html)
* **Previous**: [Base code](https://hectarea1996.github.io/common-vulkan/guide/introduction.html)
