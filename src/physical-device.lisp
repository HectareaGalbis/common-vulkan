
(in-package :cvk)


;;; -------------------
;;; ----- Structs -----
;;; -------------------

;; Functions for VkPhysicalDeviceProperties
(mcffi:def-foreign-struct-functions physical-device-properties (:struct VkPhysicalDeviceProperties)
    (:no-constructor :no-destructor :enable-default-get)
  apiVersion
  driverVersion
  vendorID
  deviceID
  deviceType
  (deviceName :get (() (cffi:foreign-string-to-lisp deviceName)))
  (pipelineCacheUUID :get ((&optional index)
			   (if index
			       (cffi:mem-aref pipelineCacheUUID :uint8 index)
			       (loop for i from 0 below VK_UUID_SIZE
				     collect (cffi:mem-aref pipelineCacheUUID :uint8 i)))))
  (limits :pointer t)
  (sparseProperties :pointer t))


;; Functions for VkPhysicalDeviceLimits
(mcffi:def-foreign-struct-functions physical-device-limits (:struct VkPhysicalDeviceLimits)
    (:no-constructor :no-destructor :enable-default-get :include-invisibles)
  (maxComputeWorkGroupCount :get ((&optional index)
				     (if index
					 (cffi:mem-aref maxComputeWorkGroupCount :uint32 index)
					 (loop for i from 0 below 3
					       collect (cffi:mem-aref maxComputeWorkGroupCount :uint32 i)))))
  (maxComputeWorkGroupSize :get ((&optional index)
				    (if index
					(cffi:mem-aref maxComputeWorkGroupSize :uint32 index)
					(loop for i from 0 below 3
					      collect (cffi:mem-aref maxComputeWorkGroupSize :uint32 i)))))
  (maxViewportDimensions :get ((&optional index)
				  (if index
				      (cffi:mem-aref maxViewportDimensions :uint32 index)
				      (loop for i from 0 below 2
					    collect (cffi:mem-aref maxViewportDimensions :uint32 i)))))
  (viewportBoundsRange :get ((&optional index)
				(if index
				    (cffi:mem-aref viewportBoundsRange :float index)
				    (loop for i from 0 below 2
					  collect (cffi:mem-aref viewportBoundsRange :float i)))))
  (pointSizeRange :get ((&optional index)
			   (if index
			       (cffi:mem-aref pointSizeRange :float index)
			       (loop for i from 0 below 2
				     collect (cffi:mem-aref pointSizeRange :float i)))))
  (lineWidthRange :get ((&optional index)
			   (if index
			       (cffi:mem-aref lineWidthRange :float index)
			       (loop for i from 0 below 2
				     collect (cffi:mem-aref lineWidthRange :float i))))))


;; Functions for VkPhysicalDeviceSparseProperties
(mcffi:def-foreign-struct-functions physical-device-sparse-properties (:struct VkPhysicalDeviceSparseProperties)
    (:no-constructor :no-destructor :enable-default-get :include-invisibles))


;; Functions for VkPhysicalDeviceFeatures
(mcffi:def-foreign-struct-functions physical-device-features (:struct VkPhysicalDeviceFeatures)
  (:no-constructor :no-destructor :enable-default-get :include-invisibles))


;; Functions for VkQueueFamilyProperties
(mcffi:def-foreign-struct-functions queue-family-properties (:struct VkQueueFamilyProperties)
    (:no-constructor :no-destructor :enable-default-get)
  queueFlags
  queueCount
  timestampValidBits
  (minImageTransferGranularity :pointer t))


;;; ---------------------
;;; ----- Functions -----
;;; ---------------------

;; Returns a list of available devices
(defun enumerate-physical-devices (instance-c)
  (cffi:with-foreign-object (pPhysicalDeviceCount-c :uint32)
    (vkEnumeratePhysicalDevices instance-c pPhysicalDeviceCount-c (cffi:null-pointer))
    (let ((physical-device-count (cffi:mem-ref pPhysicalDeviceCount-c :uint32)))
      (cffi:with-foreign-object (pPhysicalDevices-c 'VKPhysicalDevice physical-device-count) 
	(vkEnumeratePhysicalDevices instance-c pPhysicalDeviceCount-c pPhysicalDevices-c)
	(loop for i from 0 below physical-device-count
              collect (cffi:mem-aref pPhysicalDevices-c 'VKPhysicalDevice i))))))


;; Return properties of a physical device
(defun create-get-physical-device-properties (physicalDevice-c)
  (let ((pProperties-c (cffi:foreign-alloc '(:struct VkPhysicalDeviceProperties))))
    (vkGetPhysicalDeviceProperties physicalDevice-c pProperties-c)
    (values pProperties-c)))

;; Destroy the allocated array from create-get-physical-device-properties
(defun destroy-get-physical-device-properties (pProperties-c)
  (cffi:foreign-free pProperties-c))

;; With get physical device properties
(mcffi:defwith with-get-physical-device-properties
  create-get-physical-device-properties
  destroy-get-physical-device-properties)


;; Return features of a physical device
(defun create-get-physical-device-features (physicalDevice-c)
  (let ((pFeatures-c (cffi:foreign-alloc '(:struct VkPhysicalDeviceFeatures))))
    (vkGetPhysicalDeviceFeatures physicalDevice-c pFeatures-c)
    (values pFeatures-c)))

;; Destroy the allocated array from create-get-physical-device-features
(defun destroy-get-physical-device-features (pFeatures-c)
  (cffi:foreign-free pFeatures-c))

;; With get physical device features
(mcffi:defwith with-get-physical-device-features
  create-get-physical-device-features
  destroy-get-physical-device-features)


;; Returns a list of available devices
(defun create-get-physical-device-queue-family-properties (physicalDevice-c)
  (cffi:with-foreign-object (pQueueFamilyPropertyCount-c :uint32)
    (vkGetPhysicalDeviceQueueFamilyProperties physicalDevice-c pQueueFamilyPropertyCount-c (cffi:null-pointer))
    (let* ((queue-family-property-count (cffi:mem-ref pQueueFamilyPropertyCount-c :uint32))
	   (pQueueFamilyProperties-c (cffi:foreign-alloc '(:struct VKQueueFamilyProperties)
							 :count queue-family-property-count))) 
      (vkGetPhysicalDeviceQueueFamilyProperties physicalDevice-c pQueueFamilyPropertyCount-c pQueueFamilyProperties-c)
      (loop for i from 0 below queue-family-property-count
            collect (cffi:mem-aptr pQueueFamilyProperties-c '(:struct VKQueueFamilyProperties) i)))))

;; Destroy the allocated array from create-enumerate-physical-devices
(defun destroy-get-physical-device-queue-family-properties (queue-family-properties)
  (cffi:foreign-free (car queue-family-properties)))

;; With enumerate physical devices macro
(mcffi:defwith with-get-physical-device-queue-family-properties
  create-get-physical-device-queue-family-properties
  destroy-get-physical-device-queue-family-properties)
