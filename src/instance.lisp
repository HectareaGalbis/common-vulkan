
(in-package :cvk)


;: Creates an application info structure
(defun create-application-info (&key ((:sType sType-c) VK_STRUCTURE_TYPE_APPLICATION_INFO)
				  ((:pNext _pNext) nil) ((:pApplicationName _pApplicationName) nil)
				  ((:applicationVersion applicationVersion-c) 0)
				  ((:pEngineName _pEngineName) nil) ((:engineVersion engineVersion-c) 0)
				  ((:apiVersion apiVersion-c) 0))
  (let ((pNext-c            (or _pNext (cffi:null-pointer)))
	(pApplicationName-c (if _pApplicationName
				(cffi:foreign-string-alloc _pApplicationName)
				(cffi:null-pointer)))
        (pEngineName-c      (if _pEngineName
				(cffi:foreign-string-alloc _pEngineName)
				(cffi:null-pointer)))
	(application-info-c (alloc-vulkan-object '(:struct VkApplicationInfo))))
    (cffi:with-foreign-slots ((sType pNext pApplicationName applicationVersion pEngineName engineVersion
				     apiVersion)
                              application-info-c (:struct VkApplicationInfo))
      (setf sType              sType-c
	    pNext              pNext-c
            pApplicationName   pApplicationName-c
            applicationVersion applicationVersion-c
            pEngineName        pEngineName-c
            engineVersion      engineVersion-c
            apiVersion         apiVersion-c))
    (values application-info-c)))

;; Destroys an application info structure
(defun destroy-application-info (application-info-c)
  (cffi:with-foreign-slots ((pApplicationName pEngineName) application-info-c (:struct VkApplicationInfo))
    (cffi:foreign-string-free pApplicationName)
    (cffi:foreign-string-free pEngineName))
  (free-vulkan-object app-info))

;; With application info macro
(defwith with-application-info
         create-application-info
         destroy-application-info)


;; Creates an instance create info structure
(defun create-instance-create-info (((:sType sType-c) VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO)
				    ((:pNext _pNext) nil) ((:flags flags-c) 0)
				    ((:pApplicationInfo _pApplicationInfo) nil)
				    ((:ppEnabledLayerNames _ppEnabledLayerNames) nil)
				    ((:ppEnabledExtensionNames _ppEnabledExtensionNames) nil))
  (let ((pNext-c                   (or _pNext (cffi:null-pointer)))
	(pApplicationInfo-c        (or _pApplicationInfo (cffi:null-pointer)))
	(enabledLayerCount-c       (length _ppEnabledLayerNames))
	(ppEnabledLayerNames-c     (cffi:foreign-alloc :string :initial-contents _ppEnabledLayerNames))
	(enabledExtensionCount     (length _ppEnabledExtensionNames))
        (ppEnabledExtensionNames-c (cffi:foreign-alloc :string :initial-contents _ppEnabledExtensionNames)))
        (instance-create-info-c    (alloc-vulkan-object '(:struct VkInstanceCreateInfo)))
    (cffi:with-foreign-slots ((sType pNext flags pApplicationInfo enabledLayerCount ppEnabledLayerNames
				     enabledExtensionCount ppEnabledExtensionNames)
                              instance-create-info-c (:struct VkInstanceCreateInfo))
        (setf sType                   sType-c
              flags                   flags-c
              pApplicationInfo        pApplicationInfo-c
              enabledLayerCount       enabledLayerCount-c
              ppEnabledLayerNames     ppEnabledLayerNames-c
              enabledExtensionCount   enabledExtensionCount-c
              ppEnabledExtensionNames ppEnabledExtensionNames-c))
    (values instance-create-info-c)))


;; Destroys an instance create info structure
(defun destroy-instance-info (instance-create-info-c)
  (cffi:with-foreign-slots ((enabledLayerCount ppEnabledLayerNames enabledExtensionCount
			     ppEnabledExtensionNames)  instance-info (:struct VkInstanceCreateInfo))
    (loop for i from 0 below enabledLayerCount
	  do (cffi:foreign-free (cffi:mem-aref ppEnabledLayerNames :pointer i)))
    (loop for i from 0 below enabledExtensionCount
	  do (cffi:foreign-free (cffi:mem-aref ppEnabledExtensionNames :pointer i)))
    (cffi:foreign-free ppEnabledLayerNames)
    (cffi:foreign-free ppEnabledExtensionNames))
  (cffi:foreign-free instance-info))

;; With instance create info macro
(defwith with-instance-create-info
         create-instance-create-info
         destroy-instance-create-info)


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


(defun enumerate-instance-extension-properties (_pLayerName)
  (let ((pLayerName-c (if _pLayerName
			  (cffi:foreign-string-alloc _pLayerName)
			  (cffi:null-pointer))))
    (cffi:with-foreign-objetc (pPropertyCount-c :uint32)
      (vkEnumerateInstanceExtensionProperties pLayerName-c pPropertyCount-c (cffi:null-pointer))
      (cffi:with-foreign-object (pProperties-c '(:struct VkExtensionProperties)
					       (cffi:mem-ref pPropertyCount-c :uint32))
	(vkEnumerateInstanceExtensionProperties pLayerName-c pPropertyCount-c pProperties-c)
	(loop for i from 0 below (cffi:mem-ref pPropertyCount-c :uint32)
	      collect (cffi:mem-aref pProperties-c '(:struct VkExtensionProperties) i)))))) ; Crear VkExtensionProperties por mi cuenta? O quizas mejor una estructure de lisp con la info.
  

;; List of wanted layers
(defun get-required-layers (&optional (validation t))
  (if validation
      '("VK_LAYER_KHRONOS_validation")
      nil))


;; Check whether the wanted layers are available
(defun check-required-layers (required-layers)

  ;; We get the available layers
  (cffi:with-foreign-object (count :uint32)
    (vkEnumerateInstanceLayerProperties count (cffi:null-pointer))
    (cffi:with-foreign-object (properties '(:struct VkLayerProperties) (cffi:mem-ref count :uint32))
      (vkEnumerateInstanceLayerProperties count properties)
      (loop for required-layer in required-layers
            always (loop for i from 0 below (cffi:mem-ref count :uint32)
                         for property-ptr = (cffi:mem-aptr properties '(:struct VkLayerProperties) i)
                         thereis (equal required-layer
                                        (cffi:foreign-string-to-lisp (cffi:foreign-slot-value property-ptr
                                                                                              '(:struct VkLayerProperties)
                                                                                              'layerName))))))))


;; Returns the wanted extensions
(defun get-required-extensions ()
  (let ((glfw-extensions (glfw:get-required-instance-extensions)))
    (unless glfw-extensions
      (error "glfw error: ~S" (glfw:get-error)))
    (cons VK_EXT_DEBUG_UTILS_EXTENSION_NAME glfw-extensions)))


;; Check whether the wanted extensions are available
(defun check-required-extensions (required-extensions)

  ;; We get the available extensions
  (cffi:with-foreign-object (count :uint32)
    (vkEnumerateInstanceExtensionProperties (cffi:null-pointer) count (cffi:null-pointer))
    (cffi:with-foreign-object (properties '(:struct VkExtensionProperties) (cffi:mem-ref count :uint32))
      (vkEnumerateInstanceExtensionProperties (cffi:null-pointer) count properties)
      ;; We check the availability of the wanted extensions
      (loop for required-extension in required-extensions
        always (loop for i from 0 below (cffi:mem-ref count :uint32)
                 thereis (equal required-extension
                                (cffi:foreign-string-to-lisp (cffi:foreign-slot-value (cffi:mem-aptr properties '(:struct VkExtensionProperties) i)
                                                                                     '(:struct VkExtensionProperties) 'extensionName))))))))



;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------


