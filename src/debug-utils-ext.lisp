
(in-package :cvk)



(let ((next-address 1) (user-data-table (make-hash-table)))

  ;; Constructor and destructor of VkDebugUtilsMessengerCreateInfoEXT structure
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
    ((pUserData nil) (if pUserData
			 (prog2
			     (setf (gethash next-address user-data-table) pUserData)
			     (cffi:make-pointer next-address)
			   (setf next-address (+1 next-address)))
			 (cffi:null-pointer))
     (if (not (cffi:null-pointer-p pUserData))
	 (setf (gethash (cffi:pointer-address pUserData) user-data-table) nil))))

  (let ((callback-table (make-hash-table)))

    ;; VkDebugUtilsMessengerCreateInfoEXT getters and setters
    (mcffi:def-foreign-accessors debug-utils-messenger-create-info (:struct VkDebugUtilsMessengerCreateInfoEXT)
      sType
      pNext
      flags
      messageSeverity
      messageType
      (pfnUserCallback :getter (() (if (cffi:null-pointer-p pfnUserCallback)
				       nil
				       (gethash (cffi:pointer-address pfnUserCallback) user-data-table)))
		       :setter ((new-value)
				(setf pfnUserCallback (if new-value
							  (cffi:get-callback new-value)
							  (cffi:null-pointer)))))
      (pUserData :getter (() (gethash (cffi:pointer-address pUserData) user-data-table))
		 :setter ((new-value)
			  (if (cffi:null-pointer-p pUserData)
			      (if pUserData
				  (prog2
				      (setf (gethash next-address user-data-table) new-value)
				      (cffi:make-pointer next-address)
				    (setf next-address (+1 next-address)))
				  (cffi:null-pointer))
			      (if pUserData
				  (setf (gethash (cffi:pointer-address pUserData) user-data-table) new-value)
				  (progn
				    (setf (gethash (cffi:pointer-address pUserData) user-data-table) nil)
				    (setf pUserData (cffi:null-pointer))))))))

    ;; Defines a debug utils messenger callback
    (defmacro def-debug-utils-messenger-callback (name (messageSeverity-c messageTypes-c pCallbackData-c
							pUserData-c) &body body)
      `(progn
	 (cffi:defcallback ,name VkBool32 ((,messageSeverity-c VkDebugUtilsMessageSeverityFlagBitsEXT)
					   (,messageTypes-c    VkDebugUtilsMessageTypeFlagsEXT)
					   (,pCallbackData-c   :pointer)
					   (,pUserData-c       :pointer))
	   ,@body)
	 (setf (gethash (cffi:pointer-address (cffi:get-callback ',name)) callback-table) ',name)))))


;; VkDebugUtilsMessengerCallbackDataEXT accessors
(mcffi:def-foreign-accessors debug-utils-messenger-callback-data (:struct VkDebugUtilsMessengerCallbackDataEXT)
  (sType :setter nil)
  (pNext :setter nil)
  (flags :setter nil)
  (pMessageIdName  :getter (() (cffi:foreign-string-to-lisp pMessageIdName))
		   :setter nil)
  (messageIdNumber :setter nil)
  (pMessage        :getter (() (cffi:foreign-string-to-lisp pMessage))
		   :setter nil)
  (queueLabelCount :setter nil)
  (pQueueLabels    :getter ((&optional (index nil))
			    (if index
                                (cffi:mem-aptr pQueueLabels '(:struct VkDebugUtilsLabelExt) index)
			        (loop for i from 0 below queueLabelCount
			              collect (cffi:mem-aptr pQueueLabels
							     '(:struct VkDebugUtilsLabelEXT) i))))
		   :setter nil)
  (cmdBufLabelCount :setter nil)
  (pCmdBufLabels   :getter ((&optional (index nil))
			    (if index
                                (cffi:mem-aptr pCmdBufLabels '(:struct VkDebugUtilsLabelEXT) index)
				(loop for i from 0 below cmdBufLabelCount
			              collect (cffi:mem-aptr pCmdBufLabels
							     '(:struct VkDebugUtilsLabelEXT) i))))
		   :setter nil)
  (objectCount :setter nil)
  (pObjects        :getter ((&optional (index nil))
			    (if index
                                (cffi:mem-aptr pObjects '(:struct VkDebugUtilsObjectNameInfoEXT) index)
			        (loop for i from 0 below objectCount
			              collect (cffi:mem-aptr pObjects
				 			     '(:struct VkDebugUtilsObjectNameInfoEXT) i))))
		   :setter nil))
  

;; VkDebugUtilsLabelEXT accessors
(mcffi:def-foreign-accessors debug-utils-label (:struct VkDebugUtilsLabelEXT)
  (sType :setter nil)
  (pNext :setter nil)
  (pLabelName :getter (() (cffi:foreign-string-to-lisp pLabelName))
	      :setter nil)
  (color      :getter ((&optional (index nil))
	              (if index
		          (cffi:mem-aref color :float index)
		          (loop for i from 0 below 4
		                collect (cffi:mem-aref color :float i))))
	      :setter nil))


;; VkDebugUtilsObjectNameInfoEXT accessors
(mcffi:def-foreign-accessors debug-utils-object-name-info (:struct VkDebugUtilsObjectNameInfoEXT)
  (sType :setter nil)
  (pNext :setter nil)
  (objectType :setter nil)
  (objectHandle :setter nil)
  (pObjectName :getter (() (cffi:foreign-string-to-lisp pObjectName))
	       :setter nil))
