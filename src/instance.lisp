
(in-package "cvk")

; Instance struct
(defstruct instance
  vk-instance
  layers
  extensions)


;: Creates an application info structure
(defun create-application-info (app-name app-version eng-name eng-version api-version)
  (with-foreign-strings ((app-name-str    app-name)
                         (engine-name-str eng-name))
    (vk:with-vulkan-object (app-info vk:VkApplicationInfo)
      (with-foreign-slots ((sType pApplicationName applicationVersion pEngineName engineVersion apiVersion)
                           app-info '(struct vk:VkApplicationInfo))
        (setf sType              VK_STRUCTURE_TYPE_APPLICATION_INFO
              pApplicationName   app-name-str
              applicationVersion app-version
              pEngineName        eng-name-str
              engineVersion      eng-version
              apiVersion         api-version))
      app-info)))


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
  (with-vulkan-object (instance-info vk:VkInstanceCreateInfo)
    (with-foreign-slots ((sType flags pApplicationInfo enabledLayerCount
                          ppEnabledLayerNames enabledExtensionCount ppEnabledExtensionNames)
                         instance-info '(:struct vk:VkInstanceCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
            flags instance-flags
            enabledLayerCount (length enabled-layers)))))
            

;; Creates the vulkan instance
(defun create-instance (validation)

  ;; Application info
  (with-foreign-strings ((app-name "Common Vulkan example")
                         (engine-name "Common Vulkan"))
    (vk:with-vulkan-object (app-info vk:VkApplicationInfo)
      (with-foreign-slots ((sType pApplicationName applicationVersion pEngineName engineVersion apiVersion)
                           app-info '(struct vk:VkApplicationInfo))
        (setf sType              VK_STRUCTURE_TYPE_APPLICATION_INFO
              pApplicationName   app-name
              applicationVersion (vk:make-version 0 1 1)
              pEngineName        engine-name
              engineVersion      (make-version 0 1 1)
              apiVersion         (make-version 1 0 0)))

      ;; Layers and extensions
      (let ((required-layers     (get-required-layers validation))
            (required-extensions (get-required-extensions)))
        (when (not (check-required-layers required-layers))
          (error 'create-instance "Required layers not present"))
        (when (not (check-required-extensions required-extensions))
          (error 'create-instance "Required extensions not present"))

        ;; Instance info
        (with-vulkan-object (instance-info vk:VkInstanceCreateInfo)
          (with-foreign-slots ((sType flags pApplicationInfo enabledLayerCount
                                ppEnabledLayerNames enabledExtensionCount ppEnabledExtensionNames)
                               instance-info '(:struct vk:VkInstanceCreateInfo))
            (setf sType VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
                  flags)))))))
