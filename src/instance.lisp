
(in-package "cvk")

; Instance struct
(defstruct instance
  vk-instance
  layers
  extensions)


; List of wanted layers
(defun get-required-layers (&optional (validation t))
  (if validation
    '("VK_LAYER_KHRONOS_validation")
    nil))


; Check whether the wanted layers are available
(defun check-required-layers (required-layers)

  ; We get the available layers
  (with-foreign-object (count :uint32)
    (vk:vkEnumerateInstanceLayerProperties count (null-pointer))
    (with-foreign-object (properties '(struct vk:VkLayerProperties) (mem-ref count))
      (vk:vkEnumerateInstanceLayerProperties count properties)

      ; We check the availability of the wanted layers
      (loop for required-layer in required-layers
        always (loop for i from 0 to (1- (mem-ref count))
                 thereis (equal required-layer
                                (foreign-string-to-lisp (foreign-slot-value (mem-aref properties '(struct vk:VkLayerProperties) i)
                                                                            '(:struct vk:VkLayerProperties) 'layerName))))))))


; Returns the wanted extensions
(defun get-required-extensions ()
  (glfw:get-required-instance-extensions))


; Check whether the wanted extensions are available
(defun check-required-extensions (required-extensions)

  ; We get the available extensions
  (with-object (count :uint32)
    (vk:vkEnumerateInstanceExtensionProperties (null-pointer) count (null-pointer))
    (with-foreign-object (properties '(struct vk:VkExtensionProperties) (mem-ref count))
      (vk:vkEnumerateInstanceExtensionProperties (null-pointer) count properties)

      ; We check the availability of the wanted extensions
      (loop for required-extension in required-extensions
        always (loop for i from 0 to (1- (mem-ref count))
                 thereis (equal required-extension
                                (foreign-string-to-lisp (foreign-slot-value (mem-aref properties '(struct vk:VkExtensionProperties) i)
                                                                            '(:struct vk:VkExtensionProperties) 'extensionName))))))))


; Creates the vulkan instance
(defun create-instance (validation)

  ; Application info
  (with-foreign-strings ((app-name "Common Vulkan example")
                         (engine-name "Common Vulkan"))
    (vk:with-vulkan-object (app-info vk:VkApplicationInfo)
                           (setf (foreign-slot-value app-info '(struct vk:VkApplicationInfo) 'sType) VK_STRUCTURE_TYPE_APPLICATION_INFO)
                           (setf (foreign-slot-value app-info '(struct vk:VkApplicationInfo) 'pApplicationName) app-name)
                           (setf (foreign-slot-value app-info '(struct vk:VkApplicationInfo) 'applicationVersion) (vk:make-version 0 1 1))
                           (setf (foreign-slot-value app-info '(struct vk:VkApplicationInfo) 'pEngineName) engine-name)
                           (setf (foreign-slot-value app-info '(struct vk:VkApplicationInfo) 'engineVersion) (make-version 0 1 1))
                           (setf (foreign-slot-value app-info '(struct vk:VkApplicationInfo) 'apiVersion) (make-version 1 0 0))

                           ; Layers
                           (let ((required-layers (get-required-layers validation)))
                             (when (not (check-required-layers required-layers))
                               (error ))))))
