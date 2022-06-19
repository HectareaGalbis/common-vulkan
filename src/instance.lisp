
(in-package :cvk)

;;; -------------------
;;; ----- Structs -----
;;; -------------------

;; Extension properties structure
(defstruct extension-properties
  extensionName
  specVersion)


;; Layer properties structure
(defstruct layer-properties
  layerName
  specVersion
  implementationVersion
  description)


;;; ---------------------
;;; ----- Functions -----
;;; ---------------------

;; ;: Creates an application info structure
;; (defun create-application-info (&key ((:sType sType-c) VK_STRUCTURE_TYPE_APPLICATION_INFO)
;; 				  ((:pNext _pNext) nil) ((:pApplicationName _pApplicationName) nil)
;; 				  ((:applicationVersion applicationVersion-c) 0)
;; 				  ((:pEngineName _pEngineName) nil) ((:engineVersion engineVersion-c) 0)
;; 				  ((:apiVersion apiVersion-c) 0))
;;   (let ((pNext-c            (or _pNext (cffi:null-pointer)))
;; 	(pApplicationName-c (if _pApplicationName
;; 				(cffi:foreign-string-alloc _pApplicationName)
;; 				(cffi:null-pointer)))
;;         (pEngineName-c      (if _pEngineName
;; 				(cffi:foreign-string-alloc _pEngineName)
;; 				(cffi:null-pointer)))
;; 	(application-info-c (alloc-vulkan-object '(:struct VkApplicationInfo))))
;;     (cffi:with-foreign-slots ((sType pNext pApplicationName applicationVersion pEngineName engineVersion
;; 				     apiVersion)
;;                               application-info-c (:struct VkApplicationInfo))
;;       (setf sType              sType-c
;; 	    pNext              pNext-c
;;             pApplicationName   pApplicationName-c
;;             applicationVersion applicationVersion-c
;;             pEngineName        pEngineName-c
;;             engineVersion      engineVersion-c
;;             apiVersion         apiVersion-c))
;;     (values application-info-c)))

;; ;; Destroys an application info structure
;; (defun destroy-application-info (application-info-c)
;;   (cffi:with-foreign-slots ((pApplicationName pEngineName) application-info-c (:struct VkApplicationInfo))
;;     (cffi:foreign-string-free pApplicationName)
;;     (cffi:foreign-string-free pEngineName))
;;   (free-vulkan-object app-info))

;; ;; With application info macro
;; (defwith with-application-info
;;          create-application-info
;;          destroy-application-info)


(def-foreign-constructor-destructor application-info (:struct VkApplicationInfo)
  ((sType              VK_STRUCTURE_TYPE_APPLICATION_INFO)))
  ;; ((pNext              nil) (or pNext (cffi:null-pointer)))
  ;; ((pApplicationName   nil) (if pApplicationName
  ;; 			        (cffi:foreign-string-alloc pApplicationName)
  ;; 			        (cffi:null-pointer))
  ;; 			    (cffi:foreign-string-free pApplicationName))
  ;; ((applicationVersion 0))
  ;; ((pEngineName        nil) (if pEngineName
  ;; 			        (cffi:foreign-alloc pEngineName)
  ;; 			        (cffi:null-pointer))
  ;; 		            (cffi:foreign-string-free))
  ;; ((engineVersion      0))
  ;; ((apiVersion         0)))



;; ;; Creates an instance create info structure
;; (defun create-instance-create-info (((:sType sType-c) VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO)
;; 				    ((:pNext _pNext) nil) ((:flags flags-c) 0)
;; 				    ((:pApplicationInfo _pApplicationInfo) nil)
;; 				    ((:ppEnabledLayerNames _ppEnabledLayerNames) nil)
;; 				    ((:ppEnabledExtensionNames _ppEnabledExtensionNames) nil))
;;   (let ((pNext-c                   (or _pNext (cffi:null-pointer)))
;; 	(pApplicationInfo-c        (or _pApplicationInfo (cffi:null-pointer)))
;; 	(enabledLayerCount-c       (length _ppEnabledLayerNames))
;; 	(ppEnabledLayerNames-c     (cffi:foreign-alloc :string :initial-contents _ppEnabledLayerNames))
;; 	(enabledExtensionCount     (length _ppEnabledExtensionNames))
;;         (ppEnabledExtensionNames-c (cffi:foreign-alloc :string :initial-contents _ppEnabledExtensionNames)))
;;         (instance-create-info-c    (alloc-vulkan-object '(:struct VkInstanceCreateInfo)))
;;     (cffi:with-foreign-slots ((sType pNext flags pApplicationInfo enabledLayerCount ppEnabledLayerNames
;; 				     enabledExtensionCount ppEnabledExtensionNames)
;;                               instance-create-info-c (:struct VkInstanceCreateInfo))
;;         (setf sType                   sType-c
;;               flags                   flags-c
;;               pApplicationInfo        pApplicationInfo-c
;;               enabledLayerCount       enabledLayerCount-c
;;               ppEnabledLayerNames     ppEnabledLayerNames-c
;;               enabledExtensionCount   enabledExtensionCount-c
;;               ppEnabledExtensionNames ppEnabledExtensionNames-c))
;;     (values instance-create-info-c)))


;; ;; Destroys an instance create info structure
;; (defun destroy-instance-info (instance-create-info-c)
;;   (cffi:with-foreign-slots ((enabledLayerCount ppEnabledLayerNames enabledExtensionCount
;; 			     ppEnabledExtensionNames)  instance-info (:struct VkInstanceCreateInfo))
;;     (loop for i from 0 below enabledLayerCount
;; 	  do (cffi:foreign-free (cffi:mem-aref ppEnabledLayerNames :pointer i)))
;;     (loop for i from 0 below enabledExtensionCount
;; 	  do (cffi:foreign-free (cffi:mem-aref ppEnabledExtensionNames :pointer i)))
;;     (cffi:foreign-free ppEnabledLayerNames)
;;     (cffi:foreign-free ppEnabledExtensionNames))
;;   (cffi:foreign-free instance-info))

;; ;; With instance create info macro
;; (defwith with-instance-create-info
;;          create-instance-create-info
;;          destroy-instance-create-info)


(def-foreign-constructor-destructor instance-create-info (:struct VkInstanceCreateInfo)
  ;; ((sType VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO))
   ((pNext nil) (or pNext (cffi:null-pointer))))
  ;; ((flags 0))
  ;; ((pApplicationInfo nil) (or pApplicationInfo (cffi:null-pointer)))
  ;; ((enabledLayerCount 0))
  ;; ((ppEnabledLayerNames nil) (cffi:foreign-alloc :string :initial-contents ppEnabledLayerNames)
  ;; 			     (loop for i from 0 below enabledLayerCount
  ;; 				   do (cffi:foreign-free (cffi:mem-aref ppEnabledLayerNames :pointer i))
  ;; 				   finally (cffi:foreign-free ppEnabledLayerNames)))
  ;; ((enabledExtensionCount 0))
  ;; ((ppEnabledExtensionNames nil) (cffi:foreign-alloc :string :initial-contents ppEnabledExtensionNames)
  ;; 				 (loop for i from 0 below enabledExtensionCount
  ;; 				       do (cffi:foreign-free (cffi:mem-aref ppEnabledExtensionNames
  ;; 									    :pointer i))
  ;; 				       finally (cffi:foreign-free ppEnabledExtensionNames))))



;; Creates an instance
(defun create-instance (pCreateInfo-c _pAllocator)
  (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
    (cffi:with-foreign-object (pInstance-c 'VkInstance)
      (let ((result-c (vkCreateInstance pCreateInfo-c pAllocator-c pInstance-c)))
	(values (cffi:mem-ref pInstance-c 'VkInstance) result-c pAllocator-c)))))

;; Destroyes an instance
(defun destroy-instance (instance-c result pAllocator-c)
  (declare (ignore result))
  (vkDestroyInstance instance-c pAllocator-c))

;; With instance macro
(defwith with-instance
  create-instance
  destroy-instance
  :destructor-arity 3)


;; Returns global extension properties
(defun enumerate-instance-extension-properties (_pLayerName)
  (let ((pLayerName-c (if _pLayerName
			  (cffi:foreign-string-alloc _pLayerName)
			  (cffi:null-pointer))))
    (cffi:with-foreign-object (pPropertyCount-c :uint32)
      (vkEnumerateInstanceExtensionProperties pLayerName-c pPropertyCount-c (cffi:null-pointer))
      (cffi:with-foreign-object (pProperties-c '(:struct VkExtensionProperties)
					       (cffi:mem-ref pPropertyCount-c :uint32))
	(vkEnumerateInstanceExtensionProperties pLayerName-c pPropertyCount-c pProperties-c)
	(iter (for i from 0 below (cffi:mem-ref pPropertyCount-c :uint32))
	      (let ((extension-property-c (cffi:mem-aptr pProperties-c '(:struct VkExtensionProperties) i)))
		(cffi:with-foreign-slots ((extensionName specVersion)
					  extension-property-c (:struct VkExtensionProperties))
		  (collect (make-extension-properties :extensionName (cffi:foreign-string-to-lisp extensionName)
						      :specVersion specVersion)))))))))
  

;; Returns up to requested number of global layer properties
(defun enumerate-instance-layer-properties ()
  (cffi:with-foreign-object (pPropertyCount-c :uint32)
    (vkEnumerateInstanceLayerProperties pPropertyCount-c (cffi:null-pointer))
    (cffi:with-foreign-object (pProperties-c '(:struct VkLayerProperties) (cffi:mem-ref pPropertyCount-c
											:uint32))
      (vkEnumerateInstanceLayerProperties pPropertyCount-c pProperties-c)
      (iter (for i from 0 below (cffi:mem-ref pPropertyCount-c :uint32))
	    (let ((layer-property-c (cffi:mem-aptr pProperties-c '(:struct VkLayerProperties) i)))
	      (cffi:with-foreign-slots ((layerName specVersion implementationVersion description)
					layer-property-c (:struct VkLayerProperties))
		(collect (make-layer-properties :layerName (cffi:foreign-string-to-lisp layerName)
						:specVersion specVersion
						:implementationVersion implementationVersion
						:description (cffi:foreign-string-to-lisp description)))))))))


(defun get-instance-proc-addr (instance-c _pName)
  (cffi:with-foreign-string (pName-c _pName)
    (let ((func-c (vkGetInstanceProcAddr instance-c pName-c)))
      (cond
	;; Creates a debug utils messenger
        ((string= pName "vkCreateDebugUtilsMessengerEXT")
         (lambda (instance-c pCreateInfo-c _pAllocator)
	   (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
	     (cffi:with-foreign-object (pMessenger-c 'VkDebugUtilsMessengerEXT)
	       (let ((result (foreign-funcall-pointer func-c ()
	  					      VkInstance instance-c
					              :pointer pCreateInfo-c
					              :pointer pAllocator-c
					              VkDebugUtilsMessengerEXT pMessenger-c)))
	         (values (cffi:mem-ref pMessenger-c 'VkDebugUtilsMessengerEXT) result))))))
	;; Destroys a debug utils messenger
	((string= pName "vkDestroyDebugUtilsMessengerEXT")
	 (lambda (instance-c messenger-c _pAllocator)
	   (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
	     (cffi:foreign-funcall-pointer func-c ()
					   VkInstance instance-c
					   VkDebugUtilsMessengerEXT messenger-c
					   :pointer pAllocator-c))))))))
    
    
