
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/functions.md"))

  
  (mcffi:def-foreign-function doc-file "vkCreateInstance" create-instance (pcreateinfo pallocator)
    (declare-types ("VkInstanceCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkInstance" instance) ("VkResult" result))
    (let ((pallocator-c (or pallocator (cffi-sys:null-pointer))))
      (cffi:with-foreign-object (pinstance 'vkinstance)
        (let ((result (vkcreateinstance pcreateinfo pallocator-c pinstance)))
          (values (cffi:mem-ref pinstance 'vkinstance) result (if pallocator
								  pallocator-c
								  nil))))))

  
  (mcffi:def-foreign-function doc-file "vkDestroyInstance" destroy-instance  (instance pAllocator)
    (declare-types ("VkInstance" instance) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyInstance instance pAllocator-c)))


  (mcffi:defwith doc-file with-instance 
    create-instance
    destroy-instance
    :destructor-arguments (0 2))

  (mcffi:doc-note "The allocator is passed to both constructor and destructor." doc-file)


  (mcffi:def-foreign-function doc-file "vkEnumerateInstanceExtensionProperties" create-enumerate-instance-extension-properties (pLayerName)
    (declare-types (string "pLayerName") :return ((list "VkExtensionProperties") extension-props))
    (let ((pLayerName-c (if pLayerName
			    (cffi:foreign-string-alloc pLayerName)
			    (cffi:null-pointer))))
      (cffi:with-foreign-object (pPropertyCount :uint32)
	(vkEnumerateInstanceExtensionProperties pLayerName-c pPropertyCount (cffi:null-pointer))
	(let* ((property-count (cffi:mem-ref pPropertyCount :uint32))
	       (pProperties (cffi:foreign-alloc '(:struct VkExtensionProperties) :count property-count)))
	  (vkEnumerateInstanceExtensionProperties pLayerName-c pPropertyCount pProperties)
	  (iter (for i from 0 below property-count)
	    (collect (cffi:mem-aptr pProperties '(:struct VkExtensionProperties) i)))))))

  (mcffi:def-foreign-function doc-file nil destroy-enumerate-instance-extension-properties (extension-props)
    (declare-types ("(list VkExtensionProperties)" extension-props))
    (cffi:foreign-free (car extension-props)))

  
  (mcffi:defwith doc-file with-enumerate-instance-extension-properties
    create-enumerate-instance-extension-properties
    destroy-enumerate-instance-extension-properties)


  (mcffi:def-foreign-function doc-file "vkEnumerateInstanceLayerProperties" create-enumerate-instance-layer-properties ()
    (declare-types :return ((list "VkLayerProperties") layer-props))
    (cffi:with-foreign-object (pPropertyCount :uint32)
      (vkEnumerateInstanceLayerProperties pPropertyCount (cffi:null-pointer))
      (let* ((property-count (cffi:mem-ref pPropertyCount :uint32))
	     (pProperties (cffi:foreign-alloc '(:struct VkLayerProperties) :count property-count)))
	(vkEnumerateInstanceLayerProperties pPropertyCount pProperties)
	(iter (for i from 0 below property-count)
	  (collect (cffi:mem-aptr pProperties '(:struct VkLayerProperties) i))))))

  (mcffi:def-foreign-function doc-file nil destroy-enumerate-instance-layer-properties (layer-props)
    (declare-types ((list "VkLayerProperties") layer-props))
    (cffi:foreign-free (car layer-props)))


  (mcffi:defwith doc-file with-enumerate-instance-layer-properties 
    create-enumerate-instance-layer-properties
    destroy-enumerate-instance-layer-properties)


  ;; (mcffi:def-foreign-function get-instance-proc-addr doc-file (instance pName)
  ;;   (declare-types ("VkInstance" instance) (string "pName")
  ;; 		   :return (function proc))
  ;;   (cffi:with-foreign-string (pName-c pName)
  ;;     (let ((func-c (vkGetInstanceProcAddr instance pName-c)))
  ;; 	(cond
  ;; 	  ;; Creates a debug utils messenger
  ;;         ((string= pName "vkCreateDebugUtilsMessengerEXT")
  ;; 	   (lambda (instance pCreateInfo-c _pAllocator)
  ;; 	     (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
  ;; 	       (cffi:with-foreign-object (pMessenger-c 'VkDebugUtilsMessengerEXT)
  ;; 		 (let ((result (cffi:foreign-funcall-pointer func-c ()
  ;; 	  						     VkInstance instance
  ;; 							     :pointer pCreateInfo-c
  ;; 							     :pointer pAllocator-c
  ;; 							     VkDebugUtilsMessengerEXT pMessenger-c
  ;; 							     VkResult)))
  ;; 	           (values (cffi:mem-ref pMessenger-c 'VkDebugUtilsMessengerEXT) result))))))
  ;; 	  ;; Destroys a debug utils messenger
  ;; 	  ((string= pName "vkDestroyDebugUtilsMessengerEXT")
  ;; 	   (lambda (instance messenger-c _pAllocator)
  ;; 	     (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
  ;; 	       (cffi:foreign-funcall-pointer func-c ()
  ;; 					     VkInstance instance
  ;; 					     VkDebugUtilsMessengerEXT messenger-c
  ;; 					     :pointer pAllocator-c
  ;; 					     :void))))
  ;; 	  (t (warn "get-instance-proc-addr: invalid function name!"))))))
  )
