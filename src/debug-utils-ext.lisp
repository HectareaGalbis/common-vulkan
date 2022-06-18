
(in-package :cvk)


;; Creates a debug utils messenger create info ext structure
(defun create-debug-utils-messenger-create-info-ext
    (&key ((:sType sType-c) VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT) ((:pNext _pNext) nil)
       ((:flags flags-c) 0) ((:messageSeverity messageSeverity-c) 0) ((:messageType messageType-c) 0)
       ((:pfnUserCallback pfnUserCallback-c)) ((:pUserData _pUserData) nil))
  (let ((pNext-c                                 (or _pNext (cffi:null-pointer)))
        (pUserData-c                             (or _pUserData (cffi:null-pointer)))
        (debug-utils-messenger-create-info-ext-c (alloc-vulkan-object
             				          '(:struct VkDebugUtilsMessengerCreateInfoEXT))))
    (cffi:with-foreign-slots ((sType pNext flags messageSeverity messageType pfnUserCallback pUserData)
			      debug-utils-messenger-create-info-ext-c
			      '(:struct VkDebugUtilsMessengerCreateInfoEXT))
      (setf sType           sType-c
            pNext           pNext-c
            flags           flags-c
            messageSeverity messageSeverity-c
            messageType     messageType-c
            pfnUserCallback pfnUserCallback-c
            pUserData       pUserData-c))
    (values debug-utils-messenger-create-info-ext-c)))

;; Destroys a debug utils messenger create info ext structure
(defun destroy-debug-utils-messenger-create-info-ext (debug-utils-messenger-create-info-ext-c)
  (free-vulkan-object debug-utils-messenger-create-info-ext-c))

;; With debug utils messenger create info ext macro
(defwith with-debug-utils-messenger-create-info-ext
  create-debug-utils-messenger-create-info-ext
  destroy-debug-utils-messenger-create-info-ext)


;; Defines a debug utils messenger callback
(defmacro def-debug-utils-messenger-callback (name (messageSeverity-c messageTypes-c pCallbackData-c
						    pUserData-c) &body body)
  `(cffi:defcallback ,name 'VkBool32 ((,messageSeverity-c 'VkDebugUtilsMessageSeverityFlagBitsEXT)
			              (,messageType-c     'VkDebugUtilsMessageTypeFlagsEXT)
			              (,pCallbackData-c   :pointer)
			              (,pUserData-c       :pointer))
     ,@body))


;; VkDebugUtilsMessengerCallbackDataEXT accessors
(def-foreign-accessors debug-utils-messenger-callback-data (:struct VkDebugUtilsMessengerCallbackDataEXT)
  sType
  pNext
  flags
  (pMessageIdName  (cffi:foreign-string-to-lisp pMessageIdName))
  messageIdNumber
  (pMessage        (cffi:foreign-string-to-lisp pMessage))
  queueLabelCount
  (pQueueLabels    (loop for i from 0 below queueLabelCount
			 collect (cffi:mem-aptr pQueueLabels '(:struct VkDebugUtilsLabelEXT) i)))
  cmdBufLabelCount
  (pCmdBufLabels   (loop for i from 0 below cmdBufLabelCount
			 collect (cffi:mem-aptr pCmdBufLabels '(:struct VkDebugUtilsLabelEXT) i)))
  objectCount
  (pObjects        (loop for i from 0 below objectCount
			 collect (cffi:mem-aptr pObjects '(:struct VkDebugUtilsObjectNameInfoEXT) i))))
  

;; VkDebugUtilsLabelEXT accessors
(def-foreign-accessors debug-utils-label (:struct VkDebugUtilsLabelEXT)
  sType
  pNext
  (pLabelName (cffi:foreign-string-to-lisp pLabelName))
  (color      (loop for i from 0 below 4
		    collect (cffi:mem-aref color :float i))))


;; VkDebugUtilsObjectNameInfoEXT accessors
(def-foreign-accessors debug-utils-object-name-info (:struct VkDebugUtilsObjectNameInfoEXT)
  sType
  pNext
  objectType
  objectHandle
  (pObjectName (cffi:foreign-string-to-lisp pObjectName)))
