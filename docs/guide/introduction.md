<h1 id="header:CVG:INTRODUCTION-HEADER">Introduction</h1>

<h2 id="header:ADP:HEADERTAG3">Installing GLFW and Vulkan</h2>

First we need to install the GLFW library and the Vulkan SDK\.

In the [GLFW main page](https://www.glfw.org/) you will see how to install its library in your computer\.

The same goes to Vulkan\. Go to its [main page](https://vulkan.lunarg.com/) and install the SDK in your computer\.

<h2 id="header:ADP:HEADERTAG4">Installing some Common Lisp libraries</h2>

This guide will use the project [cl\-glfw](https://github.com/Hectarea1996/cl-glfw)\. It is available on Quicklisp\, so just eval in your REPL ``` (ql:quickload :cl-glfw) ```\.

Our own project

We have already all we need to start coding\. You should create a new project that depends on the previous ones \(cl\-glfw and common\-vulkan\)\.

You can place your project where you want\, but I prefer to create them in the ``` quicklisp/local-projects/ ``` folder\. Create a new folder named common\-vulkan\-guide\. Now\, inside this folder we are going to create some files to generate our project\.

First\, create a ``` common-vulkan-guide.asd ``` file to create a system\. It will have the following content\.

`````Lisp
(ASDF/DEFSYSTEM:DEFSYSTEM "common-vulkan-guide"
  :DEPENDS-ON
  ("cl-glfw" "common-vulkan")
  :COMPONENTS
  ((:FILE "package") (:FILE "main")))
`````

Next\, we are going to create the ``` package.lisp ``` file\. It is always a good idea to put your projects into a different namespace to avoid name conflicts\.

`````Lisp
(DEFPACKAGE "common-vulkan-guide"
  (:USE :CL)
  (:NICKNAMES :CVG)
  (:EXPORT MAIN))
`````

Now\, create a ``` main.lisp ``` file where we will put the main code\. For now\, put inside the next code\.

`````Lisp
(IN-PACKAGE :CVG)

(DEFUN MAIN () (PRINT "Hello world"))
`````

As you can see\, it is a simple <em>Hello world</em> program\.

Now\, we have a project that can be loaded\. But first\, we need to make sure ASDF can find our new system\. We can do that evaluating in the REPL ``` (ql:register-local-projects) ```\. After that\, just eval ``` (asdf:load-system :common-vulkan-guide) ```\. If you see again the package we created before\, the ``` main ``` function is exported\. If you eval ``` (cvg:main) ``` you will see the awesome ``` Hello world ``` sentence\.

And that\'s all\. As the official tutorial says\, you are now set for the real thing\.

* <strong>Next</strong>\: <a href="/docs/guide/base-code/main.md#header:CVG:BASE-CODE-HEADER">Base code</a>
* <strong>Previous</strong>\: <a href="/docs/guide/common-vulkan-guide.md#header:CVG:COMMON-VULKAN-GUIDE-HEADER">Common Vulkan Guide</a>

