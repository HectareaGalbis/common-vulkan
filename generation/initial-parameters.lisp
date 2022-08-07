
(in-package :cvk)


;; Used by: VkDebugUtilsMessengerCreateInfoEXT, PFN_vkDebugUtilsMessengerCallbackEXT
(defparameter *debug-utils-messenger-callback-user-data* (make-hash-table))
(defparameter *debug-utils-messenger-callback-next-address* 1)
