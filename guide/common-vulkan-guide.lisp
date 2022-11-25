
(in-package :cvg)

(adp:write-in-file #P"docs/guide/common-vulkan-guide")

(adp:header "Common Vulkan Guide")

(adp:text "Welcome to the Common Vulkan Guide! This guide is based on the official " @w("Vulkan Tutorial" "https://vulkan-tutorial.com/Introduction") ". However, this guide will not teach you Vulkan like the tutorial does. This guide will show you how the code you see in the Vulkan Tutorial should look like using Common Lisp. I’m sure that most of the users that come here have already done at least once the tutorial, that’s why this will be just a guide.")

(adp:text "I tried when wrapping functions and structs to balance speed and comfortability. Most of the functions are close to the original ones, but Common Lisp is a different language and it means that some functions need to be slightly modified. If you don’t know how a function works at the Common Lisp side you can find it in the " @h(api-reference-header) ".")

(adp:text "I think I’m not missing anything so…, let’s code!")

(adp:itemize (:item "Introduction")
	     (:itemize (:item @h(introduction-header)))
	     (:item "Setup")
	     (:itemize (:item @h(base-code-header))))


(defmacro next-previous (next-header previous-header &key ((:main main-link) nil) ((:vertex vertex-link) nil) ((:fragment fragment-link) nil))
  "Write a list of next and previous sections. Optionally, write a list with the source code."
  (check-type symbol next-header)
  (check-type symbol previous-header)
  (check-type (or null string) main-link)
  (check-type (or null string) vertex-link)
  (check-type (or null string) fragment-link)
  `(progn
     ,@(when (or main-link vertex-link fragment-link)
	 `((adp:itemize ,@(when main-link
			    `(:item @b("Common Lisp code") ": " @w("main.lisp" ,main-link)))
			,@(when vertex-link
			    `(:item @b("Vertex shader") ": " @w("shader.vert" ,vertex-link)))
			,@(when fragment-link
			    `(:item @b("Fragment shader") ": " @w("shader.frag" ,fragment-link))))))
     (adp:itemize (:item @b("Next") ": " @h(,next-header))
		  (:item @b("Previous") ": " @h(,previous-header)))))
