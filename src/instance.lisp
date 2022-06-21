
(in-package :cvk)


;; Constructor and destructor of VkApplicationInfo structure
(mcffi:def-foreign-constructor-destructor application-info (:struct VkApplicationInfo)
  ((sType              VK_STRUCTURE_TYPE_APPLICATION_INFO))
  ((pNext              nil) (or pNext (cffi:null-pointer)))
  ((pApplicationName   nil) (if pApplicationName
			        (cffi:foreign-string-alloc pApplicationName)
			        (cffi:null-pointer))
			    (if (not (cffi:null-pointer-p pApplicationName))
				(cffi:foreign-string-free pApplicationName)))
  ((applicationVersion 0))
  ((pEngineName        nil) (if pEngineName
			        (cffi:foreign-string-alloc pEngineName)
			        (cffi:null-pointer))
		            (if (not (cffi:null-pointer-p pEngineName))
				(cffi:foreign-string-free pEngineName)))
  ((engineVersion      0))
  ((apiVersion         0)))

;; VkApplicationInfo getters and setters
(mcffi:def-foreign-accessors application-info (:struct VkApplicationInfo)
  sType
  pNext
  (pApplicationName :getter (() (cffi:foreign-string-to-lisp pApplicationName))
		    :setter ((new-value)
			     (if (not (cffi:null-pointer-p pApplicationName))
				 (cffi:foreign-string-free pApplicationName))
			     (setf pApplicationName (cffi:foreign-string-alloc new-value))))
  applicationVersion
  (pEngineName :getter (() (cffi:foreign-string-to-lisp pEngineName))
	       :setter ((new-value)
			(if (not (cffi:null-pointer-p pEngineName))
			    (cffi:foreign-string-free pEngineName))
			(setf pEngineName (cffi:foreign-string-alloc new-value))))
  engineVersion
  apiVersion)


;; Constructor and destructor of VkInstanceCreateInfo structure
(mcffi:def-foreign-constructor-destructor instance-create-info (:struct VkInstanceCreateInfo)
  ((sType VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO))
  ((pNext nil) (or pNext (cffi:null-pointer)))
  ((flags 0))
  ((pApplicationInfo nil) (or pApplicationInfo (cffi:null-pointer)))
  ((enabledLayerCount 0))
  ((ppEnabledLayerNames nil) (if ppEnabledLayerNames
				 (cffi:foreign-alloc :string :initial-contents ppEnabledLayerNames)
				 (cffi:null-pointer))
			     (if (not (cffi:null-pointer-p ppEnabledLayerNames))
				 (loop for i from 0 below enabledLayerCount
				       do (cffi:foreign-free (cffi:mem-aref ppEnabledLayerNames :pointer i))
				       finally (cffi:foreign-free ppEnabledLayerNames))))
  ((enabledExtensionCount 0))
  ((ppEnabledExtensionNames nil) (if ppEnabledExtensionNames
				     (cffi:foreign-alloc :string :initial-contents ppEnabledExtensionNames)
				     (cffi:null-pointer))
				 (if (not (cffi:null-pointer-p ppEnabledExtensionNames))
				     (loop for i from 0 below enabledExtensionCount
					   do (cffi:foreign-free (cffi:mem-aref ppEnabledExtensionNames
										:pointer i))
					   finally (cffi:foreign-free ppEnabledExtensionNames)))))

;; VkInstanceCreateInfo getters and setters
(mcffi:def-foreign-accessors instance-create-info (:struct VkInstanceCreateInfo)
  sType
  pNext
  flags
  pApplicationInfo
  enabledLayerCount
  (ppEnabledLayerNames :getter ((&optional (index nil))
				(if index
				    (cffi:foreign-string-to-lisp (cffi:mem-aref ppEnabledLayerNames
										:pointer index))
				    (if (not (cffi:null-pointer-p ppEnabledLayerNames))
					(loop for i from 0 below enabledLayerCount
					      collect (cffi:foreign-string-to-lisp
						       (cffi:mem-aref ppEnabledLayerNames :pointer i))))))
		       :setter ((new-value &optional (index nil))
				(if index
				    (progn
				      (cffi:foreign-free (cffi:mem-aref ppEnabledLayerNames :pointer index))
				      (setf (cffi:mem-aref ppEnabledLayerNames :pointer index)
					    (cffi:foreign-string-alloc new-value)))
				    (progn
				      (if (not (cffi:null-pointer-p ppEnabledLayerNames))
					  (loop for i from 0 below enabledLayerCount
						do (cffi:foreign-free (cffi:mem-aref ppEnabledLayerNames
										     :pointer i))
						finally (cffi:foreign-free ppEnabledLayerNames)))
				      (setf ppEnabledLayerNames
					    (cffi:foreign-alloc :string :initial-contents new-value))))))
  enabledExtensionCount
  (ppEnabledExtensionNames :getter ((&optional (index nil))
				    (if index
					(cffi:foreign-string-to-lisp (cffi:mem-aref ppEnabledExtensionNames
										    :pointer index))
					(if (not (cffi:null-pointer-p ppEnabledExtensionNames))
					    (loop for i from 0 below enabledExtensionCount
						  collect (cffi:foreign-string-to-lisp
							   (cffi:mem-aref ppEnabledExtensionNames
									  :pointer i))))))
			   :setter ((new-value &optional (index nil))
				    (if index
					(progn
					  (cffi:foreign-free (cffi:mem-aref ppEnabledExtensionNames
									    :pointer index))
					  (setf (cffi:mem-aref ppEnabledExtensionNames :pointer index)
						(cffi:foreign-string-alloc new-value)))
					(progn
					  (if (not (cffi:null-pointer-p ppEnabledExtensionNames))
					      (loop for i from 0 below enabledExtensionCount
						    do (cffi:foreign-free (cffi:mem-aref ppEnabledExtensionNames
											 :pointer i))
						    finally (cffi:foreign-free ppEnabledExtensionNames)))
					  (setf ppEnabledExtensionNames
						(cffi:foreign-alloc :string :initial-contents new-value)))))))


;; Creates an instance
(defun create-instance (pCreateInfo-c _pAllocator)
  (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
    (cffi:with-foreign-object (pInstance-c 'VkInstance)
      (let ((result-c (vkCreateInstance pCreateInfo-c pAllocator-c pInstance-c)))
	(values (cffi:mem-ref pInstance-c 'VkInstance) result-c pAllocator-c)))))

;; Destroyes an instance
(defun destroy-instance (instance-c _pAllocator)
  (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
    (vkDestroyInstance instance-c pAllocator-c)))

;; With instance macro
(mcffi:defwith with-instance
  create-instance
  destroy-instance
  :destructor-arguments (0 2))


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
	      (collect (cffi:mem-aptr pProperties-c '(:struct VkExtensionProperties) i)))))))
   

;; Returns up to requested number of global layer properties
(defun enumerate-instance-layer-properties ()
  (cffi:with-foreign-object (pPropertyCount-c :uint32)
    (vkEnumerateInstanceLayerProperties pPropertyCount-c (cffi:null-pointer))
    (cffi:with-foreign-object (pProperties-c '(:struct VkLayerProperties) (cffi:mem-ref pPropertyCount-c
											:uint32))
      (vkEnumerateInstanceLayerProperties pPropertyCount-c pProperties-c)
      (iter (for i from 0 below (cffi:mem-ref pPropertyCount-c :uint32))
	    (collect (cffi:mem-aptr pProperties-c '(:struct VkLayerProperties) i))))))
	     

;; Returns an instance procedure 
(defun get-instance-proc-addr (instance-c pName)
  (cffi:with-foreign-string (pName-c pName)
    (let ((func-c (vkGetInstanceProcAddr instance-c pName-c)))
      (cond
	;; Creates a debug utils messenger
        ((string= pName "vkCreateDebugUtilsMessengerEXT")
         (lambda (instance-c pCreateInfo-c _pAllocator)
	   (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
	     (cffi:with-foreign-object (pMessenger-c 'VkDebugUtilsMessengerEXT)
	       (let ((result (cffi:foreign-funcall-pointer func-c ()
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
    
    
