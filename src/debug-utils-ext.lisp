
(in-package :cvk)	


;; Keys for user data table and the user data table 
(defvar *next-address* 1)
(defvar *user-data-table* (make-hash-table))


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/debug-utils.md"))


  (mcffi:doc-header "Debug utils extension" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)

  
  (mcffi:def-foreign-struct "VkDebugUtilsMessengerCreateInfoEXT" debug-utils-messenger-create-info doc-file
      (:default-create :default-get :default-set)
    (sType :name "sType" :type "VkStructureType"
	   :init-form VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT)
    (pNext :name "pNext" :type pointer :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer)))))
    (flags :type "VkDebugUtilsMessengerCreateFlagsEXT")
    (messageSeverity :name "messageSeverity" :type "VkDebugUtilsMessageSeverityFlagsEXT")
    (messageType :name "messageType" :type "VkDebugUtilsMessageTypeFlagsEXT")
    (pfnUserCallback :name "pfnUserCallback" :type "PFN_vkDebugUtilsMessengerCallbackEXT" :init-form nil
		     :create ((pfnUserCallback-arg)
			      (setf pfnUserCallback (if pfnUserCallback-arg
							(if (symbolp pfnUserCallback-arg)
							    (cffi:get-callback pfnUserCallback-arg)
							    pfnUserCallback-arg)
							(cffi:null-pointer))))
		     :set ((new-value)			   
			   (if new-value
			       (if (symbolp new-value)
				   (setf pfnUserCallback (cffi:get-callback new-value))
				   (setf pfnUserCallback new-value))
			       (setf pfnUserCallback (cffi:null-pointer)))))
    (pUserData :name "pUserData" :type t :init-form nil
	       :create ((pUserData-arg)
			(setf pUserData (if pUserData-arg
					    (prog2
						(setf (gethash *next-address* *user-data-table*) pUserData-arg)
						(cffi:make-pointer *next-address*)
					      (setf *next-address* (1+ *next-address*)))
					    (cffi:null-pointer))))
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

  

  (mcffi:def-foreign-struct "VkDebugUtilsMessengerCallbackDataEXT" debug-utils-messenger-callback-data doc-file
      (:no-constructor :no-destructor :default-get)
    (sType :name "sType" :type "VkStructureType")
    (pNext :name "pNext" :type "pointer")
    (flags :type "VkDebugUtilsMessengerCallbackDataFlagsEXT")
    (pMessageIdName :name "pMessageIdName" :type string
		    :get (() (cffi:foreign-string-to-lisp pMessageIdName)))
    (messageIdNumber :name "messageIdNumber" :type int32)
    (pMessage        :name "pMessage" :type string
		     :get (() (cffi:foreign-string-to-lisp pMessage)))
    (queueLabelCount :name "queueLabelCount" :type uint32)
    (pQueueLabels    :name "pQueueLabels" :type (list "VkDebugUtilsLabelEXT")
		     :get ((&optional (index nil))
			   (if index
                               (cffi:mem-aptr pQueueLabels '(:struct VkDebugUtilsLabelExt) index)
			       (loop for i from 0 below queueLabelCount
			             collect (cffi:mem-aptr pQueueLabels
							    '(:struct VkDebugUtilsLabelEXT) i)))))
    (cmdBufLabelCount :name "cmdBufLabelCount" :type uint32)
    (pCmdBufLabels   :name "pCmdBufLabels" :type (list "VkDebugUtilsLabelEXT")
		     :get ((&optional (index nil))
			   (if index
                               (cffi:mem-aptr pCmdBufLabels '(:struct VkDebugUtilsLabelEXT) index)
			       (loop for i from 0 below cmdBufLabelCount
			             collect (cffi:mem-aptr pCmdBufLabels
							    '(:struct VkDebugUtilsLabelEXT) i)))))
    (objectCount :name "objectCount" :type uint32)
    (pObjects        :name "pObjects" :type (list "VkDebugUtilsObjectNameInfoEXT")
		     :get ((&optional (index nil))
			   (if index
                               (cffi:mem-aptr pObjects '(:struct VkDebugUtilsObjectNameInfoEXT) index)
			       (loop for i from 0 below objectCount
			             collect (cffi:mem-aptr pObjects
				 			    '(:struct VkDebugUtilsObjectNameInfoEXT) i))))))
  

  
  (mcffi:def-foreign-struct "VkDebugUtilsLabelEXT" debug-utils-label doc-file
      (:no-constructor :no-destructor :default-get)
    (sType :name "sType" :type "VkStructureType")
    (pNext :name "pNext" :type pointer)
    (pLabelName :name "pLabelName" :type string
		:get (() (cffi:foreign-string-to-lisp pLabelName)))
    (color      :type float
		:get ((&optional (index nil))
	              (if index
		          (cffi:mem-aref color :float index)
		          (loop for i from 0 below 4
				collect (cffi:mem-aref color :float i))))))



  (mcffi:def-foreign-struct "VkDebugUtilsObjectNameInfoEXT" debug-utils-object-name-info doc-file
      (:no-constructor :no-destructor :default-get)
    (sType :name "sType" :type "VkStructureType")
    (pNext :name "pNext" :type pointer)
    (objectType :name "objectType" :type "VkObjectType")
    (objectHandle :name "objectHandle" :type uint64)
    (pObjectName :name "pObjectName" :type string
		 :get (() (cffi:foreign-string-to-lisp pObjectName))))



  (mcffi:doc-subheader "Callbacks" doc-file)
  

  (mcffi:doc-subsubheader "PFN_vkDebugUtilsMessengerCallbackEXT" doc-file)

  (mcffi:def-foreign-callback-definer def-debug-utils-messenger-callback doc-file 
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
	    :return (if (null result) VK_FALSE VK_TRUE))))


