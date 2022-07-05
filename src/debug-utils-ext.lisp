
(in-package :cvk)	


(with-open-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/debug-utils.md")
			  :direction :output :if-exists :supersede :if-does-not-exist :create)


  ;; Keys for user data table and the user data table 
  (defvar *next-address* 1)
  (defvar *user-data-table* (make-hash-table))

  ;; The callback table
  (defvar *callback-table* (make-hash-table))


  
  (mcffi:def-foreign-struct "VkDebugUtilsMessengerCreateInfoEXT" debug-utils-messenger-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType"
	   :init-form VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT)
    (pNext :name "pNext" :type pointer :init-form nil
	   :create (or pNext (cffi:null-pointer)))
    (flags :type "VkDebugUtilsMessengerCreateFlagsEXT")
    (messageSeverity :name "messageSeverity" :type "VkDebugUtilsMessageSeverityFlagsEXT")
    (messageType :name "messageType" :type "VkDebugUtilsMessageTypeFlagsEXT")
    (pfnUserCallback :name "pfnUserCallback" :type "PFN_vkDebugUtilsMessengerCallbackEXT" :init-form nil
		     :create (if pfnUserCallback
				 (prog2
				     (setf (gethash (cffi:pointer-address (cffi:get-callback pfnUserCallback))
						    *callback-table*)
					   pfnUserCallback)
				     (cffi:get-callback pfnUserCallback))
				 (cffi:null-pointer))
		     :get (() (if (cffi:null-pointer-p pfnUserCallback)
				  nil
				  (gethash (cffi:pointer-address pfnUserCallback) *callback-table*)))
		     :set ((new-value)
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
    (pUserData :name "pUserData" :type t :init-form nil
	       :create (if pUserData
			   (prog2
			       (setf (gethash *next-address* *user-data-table*) pUserData)
			       (cffi:make-pointer *next-address*)
			     (setf *next-address* (1+ *next-address*)))
			   (cffi:null-pointer))
	       :get (() (gethash (cffi:pointer-address pUserData) *user-data-table*))
	       :set ((new-value)
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


  ;; Functions for VkDebugUtilsMessengerCallbackDataEXT
  (mcffi:def-foreign-struct-functions debug-utils-messenger-callback-data
      (:struct VkDebugUtilsMessengerCallbackDataEXT) (:no-constructor :no-destructor :enable-default-get)
    sType
    pNext
    flags
    (pMessageIdName  :get (() (cffi:foreign-string-to-lisp pMessageIdName)))
    messageIdNumber
    (pMessage        :get (() (cffi:foreign-string-to-lisp pMessage)))
    queueLabelCount
    (pQueueLabels    :get ((&optional (index nil))
			   (if index
                               (cffi:mem-aptr pQueueLabels '(:struct VkDebugUtilsLabelExt) index)
			       (loop for i from 0 below queueLabelCount
			             collect (cffi:mem-aptr pQueueLabels
							    '(:struct VkDebugUtilsLabelEXT) i)))))
    cmdBufLabelCount
    (pCmdBufLabels   :get ((&optional (index nil))
			   (if index
                               (cffi:mem-aptr pCmdBufLabels '(:struct VkDebugUtilsLabelEXT) index)
			       (loop for i from 0 below cmdBufLabelCount
			             collect (cffi:mem-aptr pCmdBufLabels
							    '(:struct VkDebugUtilsLabelEXT) i)))))
    objectCount
    (pObjects        :get ((&optional (index nil))
			   (if index
                               (cffi:mem-aptr pObjects '(:struct VkDebugUtilsObjectNameInfoEXT) index)
			       (loop for i from 0 below objectCount
			             collect (cffi:mem-aptr pObjects
				 			    '(:struct VkDebugUtilsObjectNameInfoEXT) i))))))
  

  ;; Functions for VkDebugUtilsLabelEXT 
  (mcffi:def-foreign-struct-functions debug-utils-label (:struct VkDebugUtilsLabelEXT)
    (:no-constructor :no-destructor :enable-default-get)
    sType
    pNext
    (pLabelName :get (() (cffi:foreign-string-to-lisp pLabelName)))
    (color      :get ((&optional (index nil))
	              (if index
		          (cffi:mem-aref color :float index)
		          (loop for i from 0 below 4
				collect (cffi:mem-aref color :float i))))))


  ;; Functions for VkDebugUtilsObjectNameInfoEXT
  (mcffi:def-foreign-struct-functions debug-utils-object-name-info (:struct VkDebugUtilsObjectNameInfoEXT)
    (:no-constructor :no-destructor :enable-default-get)
    sType
    pNext
    objectType
    objectHandle
    (pObjectName :get (() (cffi:foreign-string-to-lisp pObjectName)))))
