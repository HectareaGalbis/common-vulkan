
(in-package :cvk)


;; 
(defvar *user-data-table* (make-hash-table))


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/callbacks.md"))

  (mcffi:def-foreign-callback-definer doc-file "PFN_vkDebugUtilsMessengerCallbackEXT" def-debug-utils-messenger-callback-ext-callback 
    ("messageSeverity" :type "VkDebugUtilsMessageSeverityFlagBitsEXT"
		       :foreign-type VkDebugUtilsMessageSeverityFlagBitsEXT)
    ("messageTypes" :type VkDebugUtilsMessageTypeFlagsEXT
		    :foreign-type VkDebugUtilsMessageTypeFlagsEXT)
    ("pCallbackData" :type "VkDebugUtilsMessengerCallbackDataEXT"
		     :foreign-type :pointer)
    ("pUserData" :type t
		 :foreign-type :pointer
		 :create (gethash (cffi:pointer-address pUserData) *user-data-table*))
    (result :type boolean
	    :foreign-type VkBool32
	    :return (if (not result) VK_FALSE VK_TRUE))))
