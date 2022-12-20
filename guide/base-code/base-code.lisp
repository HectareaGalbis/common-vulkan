
(in-package :cvg)

(adp:header "Base code" base-code-header)


(adp:subheader "General structure")

(adp:text "We are going to start with the following code in our " @c("main.lisp") " file.")

(adp:code-block (general-structure-tag)
  general-structure-tag)


(adp:subheader "Resource management")

(adp:text "Like in C, we still need to allocate and deallocate the objects we will create using GLFW or Vulkan. 
The " @c("common-vulkan") " library provides " @c("with-") " macros to avoid calling the destructor every time. You can find them in the " @h(cvk::api-reference-header) ".")


(adp:subheader "Integrating GLFW")

(adp:text "Here I'm using GLFW but you don't to use it if you don't want to.")

(adp:text "We are going to add a " @c("init-window") " function inside our " @c("run") " function. Inside " @c("init-window") " we must call " @c("glfw:init") " to initialize the GLFW system, " @c("glfw:window-hint") " to not create an OpenGL context and disable window resizing, and finally " @c("glfw:create-window") " to create a window.")

(adp:code-block (integrating-glfw-tag)
  integrating-glfw-tag)

(adp:text "Now define the " @c("+width+") " and " @c("+height+") " constants and create a " @c("window") " member in our class.")

(adp:code-block (integrating-glfw-tag-2)
  integrating-glfw-tag-2)

(adp:text "You should now have a " @c("init-window") "that looks like this:")

(adp:code-block (integrating-glfw-tag-3)
  integrating-glfw-tag-3)

(adp:text "Next, we fill the " @c("main-loop") " function:")

(adp:code-block (integrating-glfw-tag-4)
  integrating-glfw-tag-4)

(adp:text "And lastly, we need to clean up the resources.")

(adp:code-block (integrating-glfw-tag-5)
  integrating-glfw-tag-5)

(adp:text "When you load the `run.lisp` file you should see a window titled " @c("Vulkan") ". After closing the window, the resources will be cleaned up and the function will end.")

(adp:itemize (adp:item @h(base-code-source-header)))

(next-previous instance-header introduction-header)
