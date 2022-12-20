
(in-package :cvk)


(adp:header "Common Vulkan Reference" api-reference-header)

(adp:text "Welcome the Common Vulkan Api Reference!")


(adp:subheader "What is this?")

(adp:text "This reference will not teach you what the Vulkan functions do. Here you will see how the functions are in Common Lisp and the types of the arguments and returned values. Like the Vulkan Guide, this is complementary material. Your main source of information should be the official Vulkan Specifications.")


(adp:subheader "How this works?")

(adp:text "In this reference you will find the constants, functions and structures that Common Vulkan exports. In order to see how a function or structure looks like in Common Lisp you should search the Vulkan name in this reference and you will see its Common Lisp traslation.")


(adp:subheader "The API reference")

(adp:itemize (adp:item @h(constants-header))
	     (adp:item @h(callbacks-header))
	     (adp:item @h(functions-header))
	     (adp:item @h(structs-header)))
