
(in-package :cvk)



(mcffi:def-foreign-constructor-destructor debug-utils-messenger-create-info
    (:struct VkDebugUtilsMessengerCreateInfoEXT)
  ((sType VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT))
  ((pNext nil) (or pNext (cffi:null-pointer)))
  ((flags 0))
  ((messageSeverity 0))
  ((messageType 0))
  ((pfnUserCallback nil) (if pfnUserCallback
			     (cffi:get-callback pfnUserCallback)
			     (cffi:null-pointer)))
  ((pUserData nil) (or pUserData (cffi:null-pointer))))


;; Defines a debug utils messenger callback
(defmacro def-debug-utils-messenger-callback (name (messageSeverity-c messageTypes-c pCallbackData-c
						    pUserData-c) &body body)
  `(cffi:defcallback ,name VkBool32 ((,messageSeverity-c VkDebugUtilsMessageSeverityFlagBitsEXT)
			             (,messageTypes-c    VkDebugUtilsMessageTypeFlagsEXT)
			             (,pCallbackData-c   :pointer)
			             (,pUserData-c       :pointer))
     ,@body))


;; VkDebugUtilsMessengerCallbackDataEXT accessors
(mcffi:def-foreign-accessors debug-utils-messenger-callback-data (:struct VkDebugUtilsMessengerCallbackDataEXT)
  sType
  pNext
  flags
  (pMessageIdName  :getter (() (cffi:foreign-string-to-lisp pMessageIdName)))
  messageIdNumber
  (pMessage        :getter (() (cffi:foreign-string-to-lisp pMessage)))
  queueLabelCount
  (pQueueLabels    :getter ((&optional (index nil))
			    (if index
                                (cffi:mem-aptr pQueueLabels '(:struct VkDebugUtilsLabelExt) index)
			        (loop for i from 0 below queueLabelCount
			              collect (cffi:mem-aptr pQueueLabels
							     '(:struct VkDebugUtilsLabelEXT) i)))))
  cmdBufLabelCount
  (pCmdBufLabels   :getter ((&optional (index nil))
			    (if index
                                (cffi:mem-aptr pCmdBufLabels '(:struct VkDebugUtilsLabelEXT) index)
				(loop for i from 0 below cmdBufLabelCount
			              collect (cffi:mem-aptr pCmdBufLabels
							     '(:struct VkDebugUtilsLabelEXT) i)))))
  objectCount
  (pObjects        :getter ((&optional (index nil))
			    (if index
                                (cffi:mem-aptr pObjects '(:struct VkDebugUtilsObjectNameInfoEXT) index)
			        (loop for i from 0 below objectCount
			              collect (cffi:mem-aptr pObjects
				 			     '(:struct VkDebugUtilsObjectNameInfoEXT) i))))))
  

;; VkDebugUtilsLabelEXT accessors
(mcffi:def-foreign-accessors debug-utils-label (:struct VkDebugUtilsLabelEXT)
  sType
  pNext
  (pLabelName :getter (() (cffi:foreign-string-to-lisp pLabelName)))
  (color      :getter ((&optional (index nil))
	              (if index
		          (cffi:mem-aref color :float index)
		          (loop for i from 0 below 4
		                collect (cffi:mem-aref color :float i))))))


;; VkDebugUtilsObjectNameInfoEXT accessors
(mcffi:def-foreign-accessors debug-utils-object-name-info (:struct VkDebugUtilsObjectNameInfoEXT)
  sType
  pNext
  objectType
  objectHandle
  (pObjectName :getter (() (cffi:foreign-string-to-lisp pObjectName))))
