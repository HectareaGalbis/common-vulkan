
(in-package :cvk)

(with-open-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/instance.md")
			  :direction :output :if-exists :supersede :if-does-not-exist :create)

  
  (mcffi:doc-header "Instance" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)

  
  (mcffi:def-foreign-struct "VkApplicationInfo" application-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType              :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_APPLICATION_INFO)
    (pNext              :name "pNext" :type "pointer" :init-form nil
	                :create (or pNext (cffi:null-pointer))
			:get (() (if (cffi:null-pointer-p pNext)
				     nil
				     pNext))
			:set ((new-value)
			      (setf pNext (or new-value (cffi:null-pointer)))))
    (pApplicationName   :name "pApplicationName" :type string :init-form nil
		        :create (if pApplicationName
			            (cffi:foreign-string-alloc pApplicationName)
			            (cffi:null-pointer))
		        :destroy (if (not (cffi:null-pointer-p pApplicationName))
				     (cffi:foreign-string-free pApplicationName))
		        :get (() (cffi:foreign-string-to-lisp pApplicationName))
		        :set ((new-value)
			      (if (not (cffi:null-pointer-p pApplicationName))
				  (cffi:foreign-string-free pApplicationName))
			      (setf pApplicationName (cffi:foreign-string-alloc new-value))))
    (applicationVersion :name "applicationVersion" :type uint32 :init-form 0)
    (pEngineName        :name "pEngineName" :type string :init-form nil
		        :create (if pEngineName
				    (cffi:foreign-string-alloc pEngineName)
				    (cffi:null-pointer))
		        :destroy (if (not (cffi:null-pointer-p pEngineName))
				     (cffi:foreign-string-free pEngineName))
		        :get (() (cffi:foreign-string-to-lisp pEngineName))
		        :set ((new-value)
			      (if (not (cffi:null-pointer-p pEngineName))
				  (cffi:foreign-string-free pEngineName))
			      (setf pEngineName (cffi:foreign-string-alloc new-value))))
    (engineVersion      :name "engineVersion" :type uint32 :init-form 0)
    (apiVersion         :name "apiVersion" :type uint32 :init-form 0))


  
  (mcffi:def-foreign-struct "VkInstanceCreateInfo" instance-create-info doc-file 
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType                   :name "sType" :type "VkStructureType"
			     :init-form VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO)
    (pNext                   :name "pNext" :type pointer :init-form nil
	                     :create (or pNext (cffi:null-pointer))
			     :get (() (if (cffi:null-pointer-p pNext)
					  nil
					  pNext))
			     :set ((new-value)
				   (setf pNext (or new-value (cffi:null-pointer)))))
    (flags                   :type "VkInstanceCreateFlags")
    (pApplicationInfo        :name "pApplicationInfo" :type string :init-form nil
		             :create (or pApplicationInfo (cffi:null-pointer)))
    (enabledLayerCount       :name "enabledLayerCount" :type uint32)
    (ppEnabledLayerNames     :name "ppEnabledLayerNames" :type (list string) :init-form nil
			     :create (if ppEnabledLayerNames
					 (cffi:foreign-alloc :string :initial-contents ppEnabledLayerNames)
					 (cffi:null-pointer))
			     :destroy (if (not (cffi:null-pointer-p ppEnabledLayerNames))
					  (loop for i from 0 below enabledLayerCount
						do (cffi:foreign-free (cffi:mem-aref ppEnabledLayerNames
										     :pointer i))
						finally (cffi:foreign-free ppEnabledLayerNames)))
			     :get ((&optional (index nil))
				   (if index
				       (cffi:foreign-string-to-lisp (cffi:mem-aref ppEnabledLayerNames
										   :pointer index))
				       (if (not (cffi:null-pointer-p ppEnabledLayerNames))
					   (loop for i from 0 below enabledLayerCount
						 collect (cffi:foreign-string-to-lisp
							  (cffi:mem-aref ppEnabledLayerNames :pointer i))))))
			     :set ((new-value &optional (index nil))
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
    (enabledExtensionCount   :name "enabledExtensionCount" :type uint32)
    (ppEnabledExtensionNames :name "ppEnabledExtensionNames" :type (list string) :init-form nil
			     :create (if ppEnabledExtensionNames
					 (cffi:foreign-alloc :string :initial-contents ppEnabledExtensionNames)
					 (cffi:null-pointer))
			     :destroy (if (not (cffi:null-pointer-p ppEnabledExtensionNames))
					  (loop for i from 0 below enabledExtensionCount
						do (cffi:foreign-free (cffi:mem-aref ppEnabledExtensionNames
										     :pointer i))
						finally (cffi:foreign-free ppEnabledExtensionNames)))
			     :get ((&optional (index nil))
				   (if index
				       (cffi:foreign-string-to-lisp (cffi:mem-aref ppEnabledExtensionNames
										   :pointer index))
				       (if (not (cffi:null-pointer-p ppEnabledExtensionNames))
					   (loop for i from 0 below enabledExtensionCount
						 collect (cffi:foreign-string-to-lisp
							  (cffi:mem-aref ppEnabledExtensionNames
									 :pointer i))))))
			     :set ((new-value &optional (index nil))
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

  

  (mcffi:def-foreign-struct "VkExtensionProperties" extension-properties doc-file 
      (:no-constructor :no-destructor :enable-default-get)
    (extensionName :name "extensionName" :type string
		   :get (() (cffi:foreign-string-to-lisp extensionName)))
    (specVersion   :name "specVersion" :type uint32))

  
  (mcffi:def-foreign-struct "VkLayerProperties" layer-properties doc-file 
      (:no-constructor :no-destructor :enable-default-get)
    (layerName             :name "layerName" :type string
	                   :get (() (cffi:foreign-string-to-lisp layerName)))
    (specVersion           :name "specVersion" :type uint32)
    (implementationVersion :name "implementationVersion" :type uint32)
    (description           :type string
		           :get (() (cffi:foreign-string-to-lisp description))))

  

  (mcffi:doc-subheader "Functions" doc-file)


  (mcffi:doc-subsubheader "vkCreateInstance" doc-file)

  
  (mcffi:def-foreign-function create-instance doc-file (pCreateInfo pAllocator)
    (declare-types ("VkInstanceCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkInstance" instance))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pInstance 'VkInstance)
	(let ((result (vkCreateInstance pCreateInfo pAllocator-c pInstance)))
	  (values (cffi:mem-ref pInstance 'VkInstance)
		  result
		  (if pAllocator pAllocator-c nil))))))


  
  (mcffi:doc-subsubheader "vkDestroyInstance" doc-file)
  
  (mcffi:def-foreign-function destroy-instance doc-file (instance pAllocator)
    (declare-types ("VkInstance" instance) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyInstance instance pAllocator-c)))


  (mcffi:doc-subsubheader "with-instance" doc-file)
  
  (mcffi:defwith with-instance doc-file
    create-instance
    destroy-instance
    :destructor-arguments (0 2))

  (mcffi:doc-note "The allocator is passed to both constructor and destructor." doc-file)


  
  (mcffi:doc-subsubheader "vkEnumerateInstanceExtensionProperties" doc-file)

  (mcffi:doc-note "This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions." doc-file)

  (mcffi:def-foreign-function create-enumerate-instance-extension-properties doc-file (pLayerName)
    (declare-types (string "pLayerName") :return ("(list VkExtensionProperties)" extension-props))
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

  (mcffi:def-foreign-function destroy-enumerate-instance-extension-properties doc-file (extension-props)
    (declare-types ("(list VkExtensionProperties)" extension-props))
    (cffi:foreign-free (car extension-props)))

  (mcffi:defwith with-enumerate-instance-extension-properties doc-file
    create-enumerate-instance-extension-properties
    destroy-enumerate-instance-extension-properties)


  
  (mcffi:doc-subsubheader "vkEnumerateInstanceLayerProperties" doc-file)

  (mcffi:doc-note "This function requires an allocation for retrieving the information. For that reason this function is splitted up in two creation and destruction functions." doc-file)
  
  (mcffi:def-foreign-function create-enumerate-instance-layer-properties doc-file ()
    (declare-types :return ("(list VkLayerProperties)" layer-props))
    (cffi:with-foreign-object (pPropertyCount :uint32)
      (vkEnumerateInstanceLayerProperties pPropertyCount (cffi:null-pointer))
      (let* ((property-count (cffi:mem-ref pPropertyCount :uint32))
	     (pProperties (cffi:foreign-alloc '(:struct VkLayerProperties) :count property-count)))
	(vkEnumerateInstanceLayerProperties pPropertyCount pProperties)
	(iter (for i from 0 below property-count)
	  (collect (cffi:mem-aptr pProperties '(:struct VkLayerProperties) i))))))

  (mcffi:def-foreign-function destroy-enumerate-instance-layer-properties doc-file (layer-props)
    (declare-types ("(list VkLayerProperties)" layer-props))
    (cffi:foreign-free (car layer-props)))

  (mcffi:defwith with-enumerate-instance-layer-properties doc-file
    create-enumerate-instance-layer-properties
    destroy-enumerate-instance-layer-properties)
  

  
  (mcffi:doc-subsubheader "vkGetInstanceProcAddr" doc-file)

  (mcffi:doc-note "Available functions: vkCreateDebugUtilsMessengerEXT, vkDestroyDebugUtilsMessengerEXT" doc-file)
  
  (mcffi:def-foreign-function get-instance-proc-addr doc-file (instance pName)
    (declare-types ("VkInstance" instance) (string "pName")
		   :return (function proc))
    (cffi:with-foreign-string (pName-c pName)
      (let ((func-c (vkGetInstanceProcAddr instance pName-c)))
	(cond
	  ;; Creates a debug utils messenger
          ((string= pName "vkCreateDebugUtilsMessengerEXT")
	   (lambda (instance pCreateInfo-c _pAllocator)
	     (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
	       (cffi:with-foreign-object (pMessenger-c 'VkDebugUtilsMessengerEXT)
		 (let ((result (cffi:foreign-funcall-pointer func-c ()
	  						     VkInstance instance
							     :pointer pCreateInfo-c
							     :pointer pAllocator-c
							     VkDebugUtilsMessengerEXT pMessenger-c
							     VkResult)))
	           (values (cffi:mem-ref pMessenger-c 'VkDebugUtilsMessengerEXT) result))))))
	  ;; Destroys a debug utils messenger
	  ((string= pName "vkDestroyDebugUtilsMessengerEXT")
	   (lambda (instance messenger-c _pAllocator)
	     (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
	       (cffi:foreign-funcall-pointer func-c ()
					     VkInstance instance
					     VkDebugUtilsMessengerEXT messenger-c
					     :pointer pAllocator-c
					     :void))))
	  (t (warn "get-instance-proc-addr: invalid function name!")))))))
