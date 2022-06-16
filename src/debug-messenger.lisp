
(in-package :cvk)


;; Creates a messenger create info structure
(defun create-messenger-create-info (debug-callback &optional
						      (message-severity
						        (logior VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT
                                                                VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT))
						      (message-type
						        (logior VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT
                                                                VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT
                                                               VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT)))
  (let ((messenger-info-ptr (alloc-vulkan-object '(:struct VkDebugUtilsMessengerCreateInfoEXT))))
    (cffi:with-foreign-slots ((sType messageSeverity messageType pfnUserCallback pUserData)
                              messenger-info-ptr (:struct VkDebugUtilsMessengerCreateInfoEXT))
      (setf sType           VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT
            messageSeverity message-severity
            messageType     message-type
            pfnUserCallback (cffi:get-callback debug-callback)))
    (values messenger-info-ptr)))

;; Destroys a messenger create info structure
(defun destroy-messenger-create-info (messenger-info-ptr)
  (free-vulkan-object messenger-info-ptr))

;; With messenger create info macro
(defwith with-messenger-create-info
         create-messenger-create-info
         destroy-messenger-create-info)


;; Messenger callback
(cffi:defcallback messenger-callback VkBool32 ((messageSeverity VkDebugUtilsMessageSeverityFlagBitsEXT)
                                               (messageTypes VkDebugUtilsMessageTypeFlagsEXT)
                                               (pCallbackData (:pointer
							         (:struct VkDebugUtilsMessengerCallbackDataEXT)))
                                               (pUserData (:pointer :void)))
  (declare (ignore pUserData))
  (cffi:with-foreign-slots ((pMessageIdName pMessage objectCount pObjects)
                              pCallbackData (:struct VkDebugUtilsMessengerCallbackDataEXT))
    (warn "Validation layer message:~%  Severity: ~S~%  Type: ~S~%  MessageId: ~S~%  Message: ~S~%  Objects: ~S"
          (cond
            ((equal messageSeverity VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT) "verbose")
            ((equal messageSeverity VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT)    "info")
            ((equal messageSeverity VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT) "warning")
            ((equal messageSeverity VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT)   "error"))
          (cond
            ((equal messageTypes VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT)     "general")
            ((equal messageTypes VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT)  "validation")
            ((equal messageTypes VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT) "performance"))
          (cffi:foreign-string-to-lisp pMessageIdName)
          (cffi:foreign-string-to-lisp pMessage)
          (loop for i from 0 below objectCount
                for object = (cffi:mem-aptr pObjects '(:struct VkDebugUtilsObjectNameInfoEXT) i)
                collect (cffi:foreign-string-to-lisp (cffi:foreign-slot-value object
                                                                     '(:struct VkDebugUtilsObjectNameInfoEXT)
                                                                     'pObjectName)))))
  (values VK_FALSE))


;; Creates a debug messenger
(defun create-debug-messenger (instance)
  (with-messenger-create-info messenger-info-ptr ('messenger-callback)
    (cffi:with-foreign-object (messenger-ptr 'VkDebugUtilsMessengerEXT)
      (check-vk-result (vkCreateDebugUtilsMessengerEXT instance instance messenger-info-ptr (cffi:null-pointer) messenger-ptr))
      (values (cffi:mem-ref messenger-ptr 'VkDebugUtilsMessengerEXT) instance))))

;; Destroys a debug messenger
(defun destroy-debug-messenger (messenger instance)
  (vkDestroyDebugUtilsMessengerEXT instance instance messenger (cffi:null-pointer)))

;; With debug messenger macro
(defwith with-debug-messenger
         create-debug-messenger
         destroy-debug-messenger
         :destructor-arity 2)
