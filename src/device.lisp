
(in-package :cvk)

;;; -------------------------
;;; -------- Structs --------
;;; -------------------------

(defstruct vk-device
  device-ptr)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Creates a list of pointers to queues create infos
(defun create-queue-create-infos (queue-families)
  (let* ((queue-family-count (length queue-families))
         (queue-create-infos-ptr (cffi:foreign-alloc '(:struct VkDeviceQueueCreateInfo) :count queue-family-count)))
    (loop for queue-family in queue-families
          and i from 0 below queue-family-count
          for queue-count           = (vk-queue-family-queue-count queue-family)
          and family-index          = (vk-queue-family-index       queue-family)
          and queue-create-info-ptr = (cffi:mem-aptr queue-create-infos-ptr '(:struct VkDeviceQueueCreateInfo) i)
          for priority-ptr          = (cffi:foreign-alloc :float :count queue-count)
          do (loop for i from 0 below queue-count do (setf (cffi:mem-aref priority-ptr :float i) 1.0))
             (memset queue-create-info-ptr 0 (cffi:foreign-type-size '(:struct VkDeviceQueueCreateInfo)))
             (cffi:with-foreign-slots ((sType queueFamilyIndex queueCount pQueuePriorities)
                                       queue-create-info-ptr (:struct VkDeviceQueueCreateInfo))
               (setf sType            VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
                     queueFamilyIndex family-index
                     queueCount       queue-count
                     pQueuePriorities priority-ptr)))
    (values queue-create-infos-ptr queue-family-count)))

(defun print-queue-create-info (queue-create-info-ptr)
  (cffi:with-foreign-slots ((sType queueFamilyIndex queueCount pQueuePriorities)
                            queue-create-info-ptr (:struct VkDeviceQueueCreateInfo))
    (format t "~TsType: ~S~%" sType)
    (format t "~TqueueFamilyIndex: ~S~%" queueFamilyIndex)
    (format t "~TqueueCount: ~S~%" queueCount)
    (format t "~TpQueuePriorities:~%")
    (loop for i from 0 below queueCount
          for queuePriority = (cffi:mem-aref pQueuePriorities :float i)
          do (format t "~T~TqueuePriority: ~S~%" queuePriority))))

;; Destroys a list of pointers to queue create infos
(defun destroy-queue-create-infos (queue-create-infos-ptr queue-create-info-count)
  (loop for i from 0 below queue-create-info-count
        for queue-create-info-ptr = (cffi:mem-aptr queue-create-infos-ptr '(:struct VkDeviceQueueCreateInfo) i)
        do (cffi:with-foreign-slots ((pQueuePriorities) queue-create-info-ptr (:struct VkDeviceQueueCreateInfo))
             (cffi:foreign-free pQueuePriorities)))
  (cffi:foreign-free queue-create-infos-ptr))

;; With queue create infos macro
(defwith with-queue-create-infos
         create-queue-create-infos
         destroy-queue-create-infos
         :destructor-arity 2)


;; Creates a physical device extensions struct
(defun create-device-extensions (extensions)
  (if (null extensions)
    (values (cffi:null-pointer) 0)
    (let ((extensions-ptr (cffi:foreign-alloc :string :initial-contents extensions)))
      (values extensions-ptr (length extensions)))))

(defun print-device-extensions (extensions-ptr extension-count)
  (loop for i from 0 below extension-count
        for extension = (cffi:mem-aref extensions-ptr :string i)
        do (format t "~Textension: ~S~%" extension)))

;; Destroys a physical device extensions struct
(defun destroy-device-extensions (extensions-ptr extension-count)
  (unless (zerop extension-count)
    (loop for i from 0 below extension-count
         do (cffi:foreign-string-free (cffi:mem-aptr extensions-ptr :string i))))
  (cffi:foreign-free extensions-ptr))

;; With device extensions macro
(defwith with-device-extensions
         create-device-extensions
         destroy-device-extensions
         :destructor-arity 2)


;; Creates a physical device features pointer
(defun create-device-features (features)
  (let ((device-features-ptr (cffi:foreign-alloc '(:struct VkPhysicalDeviceFeatures))))
    (memset device-features-ptr 0 (cffi:foreign-type-size '(:struct VkPhysicalDeviceFeatures)))
    (loop for feature in features
      do (setf (cffi:foreign-slot-value device-features-ptr '(:struct VkPhysicalDeviceFeatures) feature) VK_TRUE))
    (values device-features-ptr)))

(defun print-device-features (features-ptr)
  (loop for feature in '(robustBufferAccess
                         fullDrawIndexUint32
                         imageCubeArray
                         independentBlend
                         geometryShader
                         tessellationShader
                         sampleRateShading
                         dualSrcBlend
                         logicOp
                         multiDrawIndirect
                         drawIndirectFirstInstance
                         depthClamp
                         depthBiasClamp
                         fillModeNonSolid
                         depthBounds
                         wideLines
                         largePoints
                         alphaToOne
                         multiViewport
                         samplerAnisotropy
                         textureCompressionETC2
                         textureCompressionASTC_LDR
                         textureCompressionBC
                         occlusionQueryPrecise
                         pipelineStatisticsQuery
                         vertexPipelineStoresAndAtomics
                         fragmentStoresAndAtomics
                         shaderTessellationAndGeometryPointSize
                         shaderImageGatherExtended
                         shaderStorageImageExtendedFormats
                         shaderStorageImageMultisample
                         shaderStorageImageReadWithoutFormat
                         shaderStorageImageWriteWithoutFormat
                         shaderUniformBufferArrayDynamicIndexing
                         shaderSampledImageArrayDynamicIndexing
                         shaderStorageBufferArrayDynamicIndexing
                         shaderStorageImageArrayDynamicIndexing
                         shaderClipDistance
                         shaderCullDistance
                         shaderFloat64
                         shaderInt64
                         shaderInt16
                         shaderResourceResidency
                         shaderResourceMinLod
                         sparseBinding
                         sparseResidencyBuffer
                         sparseResidencyImage2D
                         sparseResidencyImage3D
                         sparseResidency2Samples
                         sparseResidency4Samples
                         sparseResidency8Samples
                         sparseResidency16Samples
                         sparseResidencyAliased
                         variableMultisampleRate
                         inheritedQueries)
        do (format t "~T~S: ~S~%" (symbol-name feature) (cffi:foreign-slot-value features-ptr '(:struct VkPhysicalDeviceFeatures) feature))))

;; Destroys a physical device features pointer
(defun destroy-device-features (device-features-ptr)
  (cffi:foreign-free device-features-ptr))

;; With device features macro
(defwith with-device-features
         create-device-features
         destroy-device-features)


;; Creates a device create info
(defun create-device-create-info (queue-create-infos-ptr queue-create-info-count extensions-ptr extension-count features-ptr)
  (let ((device-create-info-ptr (cffi:foreign-alloc '(:struct VkDeviceCreateInfo))))
    (memset device-create-info-ptr 0 (cffi:foreign-type-size '(:struct VkDeviceCreateInfo)))
    (cffi:with-foreign-slots ((sType queueCreateInfoCount pQueueCreateInfos enabledExtensionCount
                               ppEnabledExtensionNames pEnabledFeatures) device-create-info-ptr (:struct VkDeviceCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
            queueCreateInfoCount queue-create-info-count
            pQueueCreateInfos queue-create-infos-ptr
            enabledExtensionCount extension-count
            ppEnabledExtensionNames extensions-ptr
            pEnabledFeatures features-ptr)
      (values device-create-info-ptr))))

(defun print-device-create-info (device-create-info-ptr)
  (cffi:with-foreign-slots ((sType queueCreateInfoCount pQueueCreateInfos enabledExtensionCount
                             ppEnabledExtensionNames pEnabledFeatures) device-create-info-ptr (:struct VkDeviceCreateInfo))
    (format t "sType: ~S~%" sType)
    (format t "queueCreateInfoCount: ~S~%" queueCreateInfoCount)
    (format t "pQueueCreateInfos:~%")
    (loop for i from 0 below queueCreateInfoCount
          for queueCreateInfo = (cffi:mem-aptr pQueueCreateInfos '(:struct VkDeviceQueueCreateInfo) i)
          do (print-queue-create-info queueCreateInfo))
    (format t "enabledExtensionCount: ~S~%" enabledExtensionCount)
    (format t "ppEnabledExtensionNames:~%")
    (print-device-extensions ppEnabledExtensionNames enabledExtensionCount)
    (format t "pEnabledFeatures:~%")
    (print-device-features pEnabledFeatures)
    (format t "Done printing~%")))


;; Destroys a device create info
(defun destroy-device-create-info (device-create-info-ptr)
  (cffi:foreign-free device-create-info-ptr))

;; With device create info macro
(defwith with-device-create-info
         create-device-create-info
         destroy-device-create-info)

;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a device
(defun create-vk-device (physical-device queue-families &key (extensions nil) (features nil))
  (nest ((let ((physical-device-ptr       (vk-physical-device-physical-device-ptr physical-device))))
         (with-queue-create-infos       ((queue-create-infos-ptr queue-create-info-count) queue-families))
         (with-device-extensions      ((extensions-ptr extension-count) extensions))
         (with-device-features      (features-ptr features))
         (with-device-create-info (device-create-info-ptr queue-create-infos-ptr queue-create-info-count
                                                          extensions-ptr extension-count features-ptr))
         (cffi:with-foreign-object (device-ptr 'VkDevice)))
    (check-vk-result (vkCreateDevice physical-device-ptr device-create-info-ptr (cffi:null-pointer) device-ptr))
    (make-vk-device :device-ptr (cffi:mem-ref device-ptr 'VkDevice))))

;; Destroys a device
(defun destroy-vk-device (device)
  (let ((device-ptr (vk-device-device-ptr device)))
    (vkDestroyDevice device-ptr (cffi:null-pointer))))

;; With device macro
(defwith with-vk-device
         create-vk-device
         destroy-vk-device)
