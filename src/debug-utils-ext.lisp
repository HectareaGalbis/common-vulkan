
(in-package :cvk)	


;; Keys for user data table and the user data table 
(defvar *next-address* 1)
(defvar *user-data-table* (make-hash-table))


;; The callback table
(defvar *callback-table* (make-hash-table))


;; Constructor and destructor of VkDebugUtilsMessengerCreateInfoEXT structure
(mcffi:def-foreign-constructor-destructor debug-utils-messenger-create-info
    (:struct VkDebugUtilsMessengerCreateInfoEXT)
  (sType :init-form VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT)
  (pNext :init-form nil
	 :create (or pNext (cffi:null-pointer)))
  (flags :init-form 0)
  (messageSeverity :init-form 0)
  (messageType :init-form 0)
  (pfnUserCallback :init-form nil
		   :create    (if pfnUserCallback
				  (prog2
				      (setf (gethash (cffi:pointer-address (cffi:get-callback pfnUserCallback))
						     *callback-table*)
					    pfnUserCallback)
				      (cffi:get-callback pfnUserCallback))
				  (cffi:null-pointer)))
  (pUserData :init-form nil
	     :create    (if pUserData
			    (prog2
				(setf (gethash *next-address* *user-data-table*) pUserData)
				(cffi:make-pointer *next-address*)
			      (setf *next-address* (1+ *next-address*)))
			    (cffi:null-pointer))))


;; VkDebugUtilsMessengerCreateInfoEXT getters and setters
(mcffi:def-foreign-accessors debug-utils-messenger-create-info (:struct VkDebugUtilsMessengerCreateInfoEXT)
  sType
  pNext
  flags
  messageSeverity
  messageType
  (pfnUserCallback :getter (() (if (cffi:null-pointer-p pfnUserCallback)
				   nil
				   (gethash (cffi:pointer-address pfnUserCallback) *callback-table*)))
		   :setter ((new-value)
			    (if (cffi:null-pointer-p pfnUserCallback)
				(if new-value
				    (progn
				      (setf (gethash (cffi:pointer-address (cffi:get-callback new-value))
						     *callback-table*)
					    new-value)
				      (setf pfnUserCallback (cffi:get-callback new-value))))
				(if new-value
				    (progn
				      (setf (gethash (cffi:pointer-address pfnUserCallback) *callback-table*)
					    new-value)
				      (setf pfnUserCallback (cffi:get-callback new-value)))
				    (progn
				      (remhash (cffi:pointer-address pfnUserCallback) *callback-table*)
				      (setf pfnUserCallback (cffi:null-pointer)))))))
  (pUserData :getter (() (gethash (cffi:pointer-address pUserData) *user-data-table*))
	     :setter ((new-value)
		      (if (cffi:null-pointer-p pUserData)
			  (if new-value
			      (progn
				(setf (gethash *next-address* *user-data-table*) new-value)
				(setf pUserData (cffi:make-pointer *next-address*))
				(setf *next-address* (1+ *next-address*))))
			  (if new-value
			      (setf (gethash (cffi:pointer-address pUserData) *user-data-table*) new-value)
			      (progn
				(remhash (cffi:pointer-address pUserData) *user-data-table*)
				(setf pUserData (cffi:null-pointer))))))))


;; Defines a debug utils messenger callback
(defmacro def-debug-utils-messenger-callback (name (messageSeverity messageTypes pCallbackData
						    pUserData) &body body)
  (let ((messageSeverity-c (gensym))
	(messageTypes-c (gensym))
	(pCallbackData-c (gensym))
	(pUserData-c (gensym)))
    `(progn 
       (cffi:defcallback ,name VkBool32 ((,messageSeverity-c VkDebugUtilsMessageSeverityFlagBitsEXT)
					 (,messageTypes-c    VkDebugUtilsMessageTypeFlagsEXT)
					 (,pCallbackData-c   :pointer)
					 (,pUserData-c       :pointer))
	 (let ((,messageSeverity ,messageSeverity-c)
	       (,messageTypes ,messageTypes-c)
	       (,pCallbackData ,pCallbackData-c)
	       (,pUserData (gethash (cffi:pointer-address ,pUserData-c) cvk::*user-data-table*)))
	   ,@body))
       (setf (gethash (cffi:pointer-address (cffi:get-callback ',name)) cvk::*callback-table*) ',name))))


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
