
# Introduction

## Installing GLFW and Vulkan

The first we need is to install the GLFW library and the Vulkan SDK.

In the [GLFW main page] you will see how to install its library in your computer. 

The same goes to Vulkan. Go to its [main page] and install the SDK in your computer.

## Installing some Common Lisp libraries

The `common-vulkan` bindings depends on another libary named [more-cffi](https://github.com/Hectarea1996/more-cffi). Just clone it to your
`quicklisp/local-projects/` folder.

GLFW also need foreign bindings, but we can encounter them in the [cl-glfw](https://github.com/Hectarea1996/cl-glfw) library. Just clone it to your
`quicklisp/local-projects/` folder.

Finally, clone the [common-vulkan](https://github.com/Hectarea1996/common-vulkan) (if you didn't do that already) into your `quicklisp/local-projects/` 
folder.

## Our own project

We have already all we need to start coding. You should create a new project that depends on the previous ones (cl-glfw and common-vulkan). 

You can place your project where you want, but I prefer to create them in the same folder as the rest. In order to do this, create a folder into your
`quicklisp/local-projects/` folder named `common-vulkan-guide`. You should have something like this: `quicklisp/local-projects/common-vulkan-guide`. 
Now, inside this folder we are going to create some files to generate our project.  

First, create a `common-vulkan-guide.asd` file to create a system. It will have the following content.
```lisp
;;; common-vulkan-guide.asd

(asdf:defsystem "common-vulkan-guide"
  :depends-on ("cl-glfw" "common-vulkan")
  :components ((:file "package")
	             (:file "main")))
```

Next, we are going to create the `package.lisp` file. It is always a good idea to put your projects into a different namespace to avoid name conflicts.

```lisp
;;; package.lisp

(defpackage "common-vulkan-guide"
  (:use :cl)
  (:nicknames :cvg)
  (:export #:main))
```
