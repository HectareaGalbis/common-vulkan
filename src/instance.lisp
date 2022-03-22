
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
    (with-foreign-object (properties '(struct VkLayerProperties) (mem-ref count))
      (vk:vkEnumerateInstanceLayerProperties count properties)

      ; We check the availability of the wanted layers
      (loop for required-layer in required-layers
        always (loop for i from 0 to (1- (mem-ref count))
                 thereis (equal required-layer
                                (foreign-string-to-lisp (foreign-slot-value (mem-aref properties '(struct VkLayerProperties) i)
                                                                            '(:struct VkLayerProperties) 'layerName))))))))
