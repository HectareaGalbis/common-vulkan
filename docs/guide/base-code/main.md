<h1 id="header:CVG:BASE-CODE-SOURCE-HEADER">Base code source</h1>

`````Lisp
(IN-PACKAGE :CVG)

(DEFCONSTANT +WIDTH+ 800)

(DEFUN INIT-WINDOW (APP)
  (GLFW:INIT)
  (GLFW:WINDOW-HINT GLFW:GLFW_CLIENT_API GLFW:GLFW_NO_API)
  (GLFW:WINDOW-HINT GLFW:GLFW_RESIZABLE NIL)
  (SETF (TRIANGLE-APP-WINDOW APP)
          (GLFW:CREATE-WINDOW 800 600 "Vulkan" NIL NIL))
  (SETF (TRIANGLE-APP-WINDOW APP)
          (GLFW:CREATE-WINDOW +WIDTH+ +HEIGHT+ "Vulkan" NIL NIL)))

(DEFUN INIT-VULKAN (APP))
`````

<h1 id="header:CVG:BASE-CODE-HEADER">Base code</h1>

<h2 id="header:ADP:HEADERTAG5">General structure</h2>

We are going to start with the following code in our ``` main.lisp ``` file\.

`````Lisp
(DEFSTRUCT TRIANGLE-APP)

(DEFUN INIT-VULKAN (APP))

(DEFUN MAIN-LOOP (APP))

(DEFUN CLEANUP (APP))

(DEFUN RUN (APP) (INIT-VULKAN APP) (MAIN-LOOP APP) (CLEANUP APP))

(DEFUN MAIN ()
  (LET ((APP (MAKE-TRIANGLE-APP)))
    (RUN APP)))
`````

<h2 id="header:ADP:HEADERTAG6">Resource management</h2>

Like in C\, we still need to allocate and deallocate the objects we will create using GLFW or Vulkan\. 
The ``` common-vulkan ``` library provides ``` with- ``` macros to avoid calling the destructor every time\. You can find them in the <a href="/docs/reference/reference.md#header:COMMON-VULKAN:API-REFERENCE-HEADER">Common Vulkan Reference</a>\.

<h2 id="header:ADP:HEADERTAG7">Integrating GLFW</h2>

Here I\'m using GLFW but you don\'t to use it if you don\'t want to\.

We are going to add a ``` init-window ``` function inside our ``` run ``` function\. Inside ``` init-window ``` we must call ``` glfw:init ``` to initialize the GLFW system\, ``` glfw:window-hint ``` to not create an OpenGL context and disable window resizing\, and finally ``` glfw:create-window ``` to create a window\.

`````Lisp
(DEFUN INIT-WINDOW (APP)
  (GLFW:INIT)
  (GLFW:WINDOW-HINT GLFW:GLFW_CLIENT_API GLFW:GLFW_NO_API)
  (GLFW:WINDOW-HINT GLFW:GLFW_RESIZABLE NIL)
  (SETF (TRIANGLE-APP-WINDOW APP)
          (GLFW:CREATE-WINDOW 800 600 "Vulkan" NIL NIL)))

(DEFUN RUN (APP)
  (INIT-WINDOW APP)
  (INIT-VULKAN APP)
  (MAIN-LOOP APP)
  (CLEANUP APP))
`````

Now define the ``` +width+ ``` and ``` +height+ ``` constants and create a ``` window ``` member in our class\.

`````Lisp
(DEFCONSTANT +WIDTH+ 800)

(DEFCONSTANT +HEIGHT+ 600)

(DEFSTRUCT TRIANGLE-APP WINDOW)
`````

You should now have a ``` init-window ```that looks like this\:

`````Lisp
(DEFUN INIT-WINDOW (APP)
  (GLFW:INIT)
  (GLFW:WINDOW-HINT GLFW:GLFW_CLIENT_API GLFW:GLFW_NO_API)
  (GLFW:WINDOW-HINT GLFW:GLFW_RESIZABLE NIL)
  (SETF (TRIANGLE-APP-WINDOW APP)
          (GLFW:CREATE-WINDOW +WIDTH+ +HEIGHT+ "Vulkan" NIL NIL)))
`````

Next\, we fill the ``` main-loop ``` function\:

`````Lisp
(DEFUN MAIN-LOOP (APP)
  (LOOP WHILE (NOT (GLFW:WINDOW-SHOULD-CLOSE (TRIANGLE-APP-WINDOW APP)))
        DO (GLFW:POLL-EVENTS)))
`````

And lastly\, we need to clean up the resources\.

`````Lisp
(DEFUN CLEANUP (APP)
  (GLFW:DESTROY-WINDOW (TRIANGLE-APP-WINDOW APP))
  (GLFW:TERMINATE))
`````

When you load the \`run\.lisp\` file you should see a window titled ``` Vulkan ```\. After closing the window\, the resources will be cleaned up and the function will end\.

* <a href="/docs/guide/base-code/main.md#header:CVG:BASE-CODE-SOURCE-HEADER">Base code source</a>

* <strong>Next</strong>\: <a href="/docs/guide/instance/instance.md#header:CVG:INSTANCE-HEADER">Instance</a>
* <strong>Previous</strong>\: <a href="/docs/guide/introduction.md#header:CVG:INTRODUCTION-HEADER">Introduction</a>

