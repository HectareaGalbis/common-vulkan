
(in-package "cvk")

; Instance struct
(defstruct instance
  vk-instance
  layers
  extensions)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;: Creates an application info structure
(defun create-application-info (app-name app-version eng-name eng-version api-version)

  ;; Create the strings
  (let ((app-name-str    (foreign-string-alloc app-name))
        (engine-name-str (foreign-string-alloc eng-name)))

    ;; Create application info
    (let (app-info (foreign-alloc vk:VkApplicationInfo))
      (vk:struct-zero app-info)
      (with-foreign-slots ((sType pApplicationName applicationVersion pEngineName engineVersion apiVersion)
                           app-info '(struct vk:VkApplicationInfo))
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
  (with-foreign-slots ((pApplicationName pEngineName) app-info vk:VkApplicationInfo)
    (foreign-string-free pApplicationName)
    (foreign-string-free pEngineName))

  ;; Destroy application info
  (foreign-free app-info))


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
  (with-foreign-object (count :uint32)
    (vk:vkEnumerateInstanceLayerProperties count (null-pointer))
    (with-foreign-object (properties '(struct vk:VkLayerProperties) (mem-ref count))
      (vk:vkEnumerateInstanceLayerProperties count properties)

      ;; We check the availability of the wanted layers
      (loop for required-layer in required-layers
        always (loop for i from 0 to (1- (mem-ref count))
                 thereis (equal required-layer
                                (foreign-string-to-lisp (foreign-slot-value (mem-aref properties '(struct vk:VkLayerProperties) i)
                                                                            '(:struct vk:VkLayerProperties) 'layerName))))))))


;; Returns the wanted extensions
(defun get-required-extensions ()
  (glfw:get-required-instance-extensions))


;; Check whether the wanted extensions are available
(defun check-required-extensions (required-extensions)

  ;; We get the available extensions
  (with-object (count :uint32)
    (vk:vkEnumerateInstanceExtensionProperties (null-pointer) count (null-pointer))
    (with-foreign-object (properties '(struct vk:VkExtensionProperties) (mem-ref count))
      (vk:vkEnumerateInstanceExtensionProperties (null-pointer) count properties)

      ;; We check the availability of the wanted extensions
      (loop for required-extension in required-extensions
        always (loop for i from 0 to (1- (mem-ref count))
                 thereis (equal required-extension
                                (foreign-string-to-lisp (foreign-slot-value (mem-aref properties '(struct vk:VkExtensionProperties) i)
                                                                            '(:struct vk:VkExtensionProperties) 'extensionName))))))))


;; Creates an instance create info structure
(defun create-instance-info (instance-flags app-info enabled-layers enabled-extensions)

  ;; Create strings and array of strings
  (let ((enabled-layers-str     (foreign-alloc :string :initial-contents enabled-layers)) ; Cambiar por allocs
        (enabled-extensions-str (foreign-alloc :string :initial-contents enabled-extensions)))

    ;; Create instance info
    (let ((instance-info (foreign-alloc vk:VkInstanceCreateInfo)))
      (vk:zero-struct instance-info vk:VkInstanceCreateInfo)
      (with-foreign-slots ((sType flags pApplicationInfo enabledLayerCount
                            ppEnabledLayerNames enabledExtensionCount ppEnabledExtensionNames)
                           instance-info '(:struct vk:VkInstanceCreateInfo))
        (setf sType                   VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
              flags                   instance-flags
              enabledLayerCount       (length enabled-layers)
              ppEnabledLayerNames     enabled-layers-str
              enabledExtensionCount   (length enabled-extensions)
              ppEnabledExtensionNames enabled-extensions-str))

      instance-info)))


;; Destroys an instance info
(defun destroy-instance-info (instance-info)

  ;; Destroy strings
  (with-foreign-slots ((enabledLayerCount ppEnabledLayerNames enabledExtensionCount ppEnabledExtensionNames)
                       instance-info '(:struct vk:VkInstanceCreateInfo))
    (loop for i from 0 to (1- enabledLayerCount)
      (foreign-string-free (mem-aref ppEnabledLayerNames :string i)))
    (loop for i from 0 to (1- enabledExtensionCount)
      (foreign-string-free (mem-aref ppEnabledExtensionNames :string i)))

    ;; Destroy arrays
    (foreign-free ppEnabledLayerNames)
    (foreign-free ppEnabledExtensionNames))

  ;; Destroy instance info
  (foreign-free instance-info))


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
(defun create-instance (&optional (validation t))

  ;; Application info
  (with-application-info (app-info "Common Vulkan example" (vk:make-version 0 1 1) "Common Vulkan"
                                   (make-version 0 1 1) (make-version 1 0 0))

      ;; Layers and extensions
      (let ((required-layers     (get-required-layers validation))
            (required-extensions (get-required-extensions)))
        (when (not (check-required-layers required-layers))
          (error 'create-instance "Required layers not present"))
        (when (not (check-required-extensions required-extensions))
          (error 'create-instance "Required extensions not present"))

        ;; Instance info
        (with-instance-info (instance-info 0 app-info required-layers required-extensions)

          ;; Instance
          (with-foreign-object (instance-ptr vk:VkInstance)
            (let ((result (vk:vkCreateInstance instance-info (null-pointer) instance-ptr)))
              (vk:check-result result)
              (make-instance (mem-ref instance-ptr vk:VkInstance)
                             required-layers
                             required-extensions)))))))


;; Destroyes a vulkan instance
(defun destroy-instance (instance)
  (vk:vkDestroyInstance))


;; With macro for vulkan instance
(defmacro with-instance (var-args &body body)
  (let ((var  (first var-args))
        (args (rest var-args)))
    `(let ((,var (create-instance ,@args)))
       ,@body
       (destroy-instance ,var))))


;; Returns the layers from a given instance
(defun get-instance-enabled-layers (instance)
  (instance-layers instance))


;; Returns the extensions from a given instance
(defun get-instance-enabled-extensions (instance)
  (instance-extensions instance))
