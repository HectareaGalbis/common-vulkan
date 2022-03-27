
(in-package :cvk)

; Instance struct
(defstruct vulkan-instance
  vk-instance
  layers
  extensions)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;: Creates an application info structure
(defun create-application-info (app-name app-version eng-name eng-version api-version)

  ;; Create the strings
  (let ((app-name-str (cffi:foreign-string-alloc app-name))
        (eng-name-str (cffi:foreign-string-alloc eng-name)))

    ;; Create application info
    (let ((app-info (cffi:foreign-alloc '(:struct VkApplicationInfo))))
      (zero-struct app-info '(:struct VkApplicationInfo))
      (cffi:with-foreign-slots ((sType pApplicationName applicationVersion pEngineName engineVersion apiVersion)
                                app-info (:struct VkApplicationInfo))
        (setf sType              VK_STRUCTURE_TYPE_APPLICATION_INFO
              pApplicationName   app-name-str
              applicationVersion app-version
              pEngineName        eng-name-str
              engineVersion      eng-version
              apiVersion         api-version))

      app-info)))


;; Destroys an application info structure
(defun destroy-application-info (app-info)

  ;; Destroy strings
  (cffi:with-foreign-slots ((pApplicationName pEngineName) app-info (:struct VkApplicationInfo))
    (cffi:foreign-string-free pApplicationName)
    (cffi:foreign-string-free pEngineName))

  ;; Destroy application info
  (cffi:foreign-free app-info))


;; With application info wrapper
(defmacro with-application-info (var-args &body body)
  (let ((var  (first var-args))
        (args (rest var-args)))
    `(let ((,var (create-application-info ,@args)))
       ,@body
       (destroy-application-info ,var))))


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

      ;; We check the availability of the wanted layers
      (loop for required-layer in required-layers
        always (loop for i from 0 to (1- (cffi:mem-ref count :uint32))
                 thereis (equal required-layer
                                (cffi:foreign-string-to-lisp (cffi:foreign-slot-value (cffi:mem-aref properties '(:struct VkLayerProperties) i)
                                                                                      '(:struct VkLayerProperties) 'layerName))))))))


;; Returns the wanted extensions
(defun get-required-extensions ()
  (let (extensions (glfw:get-required-instance-extensions))
    (or extensions (error "glfw error: ~S" (glfw:get-error)))))


;; Check whether the wanted extensions are available
(defun check-required-extensions (required-extensions)

  ;; We get the available extensions
  (cffi:with-foreign-object (count :uint32)
    (vkEnumerateInstanceExtensionProperties (cffi:null-pointer) count (cffi:null-pointer))
    (cffi:with-foreign-object (properties '(:struct VkExtensionProperties) (cffi:mem-ref count :uint32))
      (vkEnumerateInstanceExtensionProperties (cffi:null-pointer) count properties)

      ;; We check the availability of the wanted extensions
      (loop for required-extension in required-extensions
        always (loop for i from 0 to (1- (cffi:mem-ref count :uint32))
                 thereis (equal required-extension
                                (cffi:foreign-string-to-lisp (cffi:foreign-slot-value (cffi:mem-aref properties '(:struct VkExtensionProperties) i)
                                                                                      '(:struct VkExtensionProperties) 'extensionName))))))))


;; Creates an instance create info structure
(defun create-instance-info (instance-flags app-info enabled-layers enabled-extensions)

  ;; Create strings and array of strings
  (let ((enabled-layers-str     (cffi:foreign-alloc :string :initial-contents enabled-layers)) ; Cambiar por allocs
        (enabled-extensions-str (cffi:foreign-alloc :string :initial-contents enabled-extensions)))

    ;; Create instance info
    (let ((instance-info (cffi:foreign-alloc '(:struct VkInstanceCreateInfo))))
      (zero-struct instance-info '(:struct VkInstanceCreateInfo))
      (cffi:with-foreign-slots ((sType flags pApplicationInfo enabledLayerCount
                                 ppEnabledLayerNames enabledExtensionCount ppEnabledExtensionNames)
                                instance-info (:struct VkInstanceCreateInfo))
        (setf sType                   VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
              flags                   instance-flags
              pApplicationInfo        app-info
              enabledLayerCount       (length enabled-layers)
              ppEnabledLayerNames     enabled-layers-str
              enabledExtensionCount   (length enabled-extensions)
              ppEnabledExtensionNames enabled-extensions-str))

      instance-info)))


;; Destroys an instance info
(defun destroy-instance-info (instance-info)

  ;; Destroy strings
  (cffi:with-foreign-slots ((enabledLayerCount ppEnabledLayerNames enabledExtensionCount ppEnabledExtensionNames)
                            instance-info (:struct VkInstanceCreateInfo))
    (loop for i from 0 below enabledLayerCount
      do (cffi:foreign-string-free (cffi:mem-aref ppEnabledLayerNames :string i)))
    (loop for i from 0 below enabledExtensionCount
      do (cffi:foreign-string-free (cffi:mem-aref ppEnabledExtensionNames :string i)))

    ;; Destroy arrays
    (cffi:foreign-free ppEnabledLayerNames)
    (cffi:foreign-free ppEnabledExtensionNames))

  ;; Destroy instance info
  (cffi:foreign-free instance-info))


;; With application info wrapper
(defmacro with-instance-info (var-args &body body)
  (let ((var  (first var-args))
        (args (rest var-args)))
    `(let ((,var (create-instance-info ,@args)))
       ,@body
       (destroy-instance-info ,var))))


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates the vulkan instance
(defun create-vulkan-instance (&optional (validation t))

  (format t "Hola1")

  ;; Application info
  (with-application-info (app-info "Common Vulkan example" (make-version 0 1 1) "Common Vulkan"
                                   (make-version 0 1 1) (make-version 1 0 0))
      (format t "Hola1.5")
      ;; Layers and extensions
      (let ((required-layers     (get-required-layers validation))
            (required-extensions (progn (format t "Hola1.7") (get-required-extensions))))
        (format t "Hola2")
        (when (not (check-required-layers required-layers))
          (error 'create-instance "Required layers not present"))
        (when (not (check-required-extensions required-extensions))
          (error 'create-instance "Required extensions not present"))

        (format t "Hola3")

        ;; Instance info
        (with-instance-info (instance-info 0 app-info required-layers required-extensions)

          ;; Instance
          (cffi:with-foreign-object (instance-ptr 'VkInstance)
            (let ((result (vkCreateInstance instance-info (cffi:null-pointer) instance-ptr)))
              (check-result result)
              (make-instance (cffi:mem-ref instance-ptr 'VkInstance)
                             required-layers
                             required-extensions)))))))


;; Destroyes a vulkan instance
(defun destroy-vulkan-instance (instance)
  (vkDestroyInstance instance (cffi:null-pointer)))


;; With macro for vulkan instance
(defmacro with-vulkan-instance (var-args &body body)
  (let ((var  (first var-args))
        (args (rest var-args)))
    `(let ((,var (create-vulkan-instance ,@args)))
       ,@body
       (destroy-vulkan-instance ,var))))


;; Returns the layers from a given instance
(defun get-vulkan-instance-enabled-layers (instance)
  (vulkan-instance-layers instance))


;; Returns the extensions from a given instance
(defun get-vulkan-instance-enabled-extensions (instance)
  (vulkan-instance-extensions instance))
