
(in-package :cvg)

(adp:in-file #P"docs/guide/introduction")

(adp:header "Introduction" introduction-header)


(adp:subheader "Installing GLFW and Vulkan")

(adp:text "First we need to install the GLFW library and the Vulkan SDK.")

(adp:text "In the " @w("GLFW main page" "https://www.glfw.org/") " you will see how to install its library in your computer.")

(adp:text "The same goes to Vulkan. Go to its " @w("main page" "https://vulkan.lunarg.com/") " and install the SDK in your computer.")


(adp:subheader "Installing some Common Lisp libraries")

(adp:text "This guide will use the project " @w("cl-glfw" "https://github.com/Hectarea1996/cl-glfw") ". It is available on Quicklisp, so just eval in your REPL " @c("(ql:quickload :cl-glfw)") ".")


(adp:text "Our own project")

(adp:text "We have already all we need to start coding. You should create a new project that depends on the previous ones (cl-glfw and common-vulkan).")

(adp:text "You can place your project where you want, but I prefer to create them in the " @c("quicklisp/local-projects/") " folder. Create a new folder named common-vulkan-guide. Now, inside this folder we are going to create some files to generate our project.")

(adp:text "First, create a " @c("common-vulkan-guide.asd") " file to create a system. It will have the following content.")

(adp:code-block ()
  (asdf:defsystem "common-vulkan-guide"
    :depends-on ("cl-glfw" "common-vulkan")
    :components ((:file "package")
	         (:file "main"))))

(adp:text "Next, we are going to create the " @c("package.lisp") " file. It is always a good idea to put your projects into a different namespace to avoid name conflicts.")

(adp:code-block ()
  (defpackage "common-vulkan-guide"
    (:use :cl)
    (:nicknames :cvg)
    (:export #:main)))

(adp:text "Now, create a " @c("main.lisp") " file where we will put the main code. For now, put inside the next code.")

(adp:code-block ()
  (in-package :cvg)

  (defun main ()
    (print "Hello world")))

(adp:text "As you can see, it is a simple " @i("Hello world") " program.")

(adp:text "Now, we have a project that can be loaded. But first, we need to make sure ASDF can find our new system. We can do that evaluating in the REPL " @c("(ql:register-local-projects)") ". After that, just eval " @c("(asdf:load-system :common-vulkan-guide)") ". If you see again the package we created before, the " @c("main") " function is exported. If you eval " @c("(cvg:main)") " you will see the awesome " @c("Hello world") " sentence.")

(adp:text "And that's all. As the official tutorial says, you are now set for the real thing.")

(next-previous base-code-header common-vulkan-guide-header)
