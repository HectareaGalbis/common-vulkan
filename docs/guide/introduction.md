
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
`quicklisp/local-projects/` folder. You should have something like this: `quicklisp/local-projects/name-of-my-project`. Now, inside this folder we are going to create the next file named `cl-vulkan-guide`:

```lisp

```
