
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/callbacks.md"))

  (mcffi:def-foreign-callback-definer def-debug-utils-messenger-callback doc-file 
    ("messageSeverity" :type "VkDebugUtilsMessageSeverityFlagBitsEXT"
		       :foreign-type VkDebugUtilsMessageSeverityFlagBitsEXT)
    ("messageTypes" :type VkDebugUtilsMessageTypeFlagsEXT
		    :foreign-type VkDebugUtilsMessageTypeFlagsEXT)
    ("pCallbackData" :type "VkDebugUtilsMessengerCallbackDataEXT"
		     :foreign-type :pointer)
    ("pUserData" :type "lisp object"
		 :foreign-type :pointer
		 :create (gethash (cffi:pointer-address pUserData) *debug-utils-messenger-callback-user-data*))
    (result :type boolean
	    :foreign-type VkBool32
	    :return (if (null result) VK_FALSE VK_TRUE))))
