
(in-package :cvk)


;; Functions for VkDeviceQueueCreateInfo
(mcffi:def-foreign-struct-functions device-queue-create-info (:struct VkDeviceQueueCreateInfo)
    (:enable-default-create :enable-default-get :enable-default-set)
  (sType :create ((sType VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO)
		  sType))
  (pNext :create ((pNext nil)
		  (or pNext (cffi:null-pointer)))
	 :get (()
	       (if (cffi:null-pointer-p pNext)
		   nil
		   pNext)))
  flags
  queueFamilyIndex
  queueCount
  (pQueuePriorities :create ((pQueuePriorities nil)
			     (if pQueuePriorities
				 (cffi:foreign-alloc :float :initial-contents pQueuePriorities)
				 (cffi:null-pointer)))
		    :destroy (if (not (cffi:null-pointer-p pQueuePriorities))
				 (cffi:foreign-free pQueuePriorities))
		    :get ((&optional (index nil))
			  (if index
			      (cffi:mem-aref pQueuePrioerities :float index)
			      (if (cffi:null-pointer-p pQueuePriorities)
				  nil
				  (loop for i from 0 below queueCount
					collect (cffi:mem-aref pQueuePriorities :float i)))))
		    :set ((new-value &optional (index nil))
			  (if index
			      (setf (cffi:mem-aref pQueuePriorities :float index) new-value)
			      (progn
				(when (not (cffi:null-pointer-p pQueuePriorities))
				  (cffi:foreign-free pQueuePriorities))
				(setf pQueuePriorities (cffi:foreign-alloc :float :initial-contents
									   pQueuePriorities)))))))


;; Functions for VkDeviceCreateInfo
(mcffi:def-foreign-struct-functions device-create-info (:struct VkDeviceCreateInfo)
    (:enable-default-create :enable-default-get :enable-default-set)
  (sType :create ((sType VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO)
		  sType))
  (pNext :create ((pNext nil)
		  (or pNext (cffi:null-pointer)))
	 :get (() (if (cffi:null-pointer-p pNext)
		      nil
		      pNext)))
  flags
  queueCreateInfoCount
  (pQueueCreateInfos :create ((pQueueCreateInfos nil)
			      (if pQueueCreateInfos
				  (cffi:foreign-alloc '(:struct VkDeviceQueueCreateInfo)
						      :initial-contents
						      (mapcar
						       (lambda (x)
							 (cffi:mem-ref x '(:struct VkDeviceQueueCreateInfo)))
						       pQueueCreateInfos))
				  (cffi:null-pointer)))
		     :destroy (when (not (cffi:null-pointer-p pQueueCreateInfos))
				(cffi:foreign-free pQueueCreateInfos))
		     :get ((&optional (index nil))
			   (if index
			       (cffi:mem-aptr pQueueCreateInfos '(:struct VkDeviceQueueCreateInfo) index)
			       (if (cffi:null-pointer-p pQueueCreateInfos)
				   nil
				   (loop for i from 0 below queueCreateInfoCount
					 collect (cffi:mem-aptr pQueueCreateInfos
								'(:struct VkDeviceCreateInfo) i)))))
		     :set ((new-value)
			   (when (not (cffi:null-pointer-p pQueueCreateInfos))
			     (cffi:foreign-free pQueueCreateInfos))
			   (setf pQueueCreateInfos
				 (cffi:foreign-alloc '(:struct VkDeviceQueueCreateInfo)
						     :initial-contents
						     (mapcar
						      (lambda (x)
							(cffi:mem-ref x '(:struct VkDeviceQueueCreateInfo)))
						      new-value)))))
  enabledLayerCount
  (ppEnabledLayerNames :create ((ppEnabledLayerNames nil)
				(if ppEnabledLayerNames
				    (cffi:foreign-alloc :string :initial-contents ppEnabledLayerNames)
				    (cffi:null-pointer)))
		       :destroy (loop for i from 0 below enabledLayerCount
				      do (cffi:foreign-free (cffi:mem-aref ppEnabledLayerNames :pointer i))
				      finally (cffi:foreign-free ppEnabledLayerNames))
		       :get ((&optional (index nil))
			     (if index
				 (cffi:foreign-string-to-lisp (cffi:mem-aref ppEnabledLayerNames
									     :pointer index))
				 (if (cffi:null-pointer-p ppEnabledLayerNames)
				     nil
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
				   (when (not (cffi:null-pointer-p ppEnabledLayerNames))
				     (loop for i from 0 below enabledLayerCount
					   do (cffi:foreign-free (cffi:mem-aref ppEnabledLayerNames :pointer i))
					   finally (cffi:foreign-free ppEnabledLayerNames)))
				   (setf ppEnabledLayerNames (cffi:foreign-alloc :string
										 :initial-contents
										 new-value))))))
  enabledExtensionCount
  (ppEnabledExtensionNames :create ((ppEnabledExtensionNames nil)
				    (if ppEnabledExtensionNames
					(cffi:foreign-alloc :string :initial-contents ppEnabledExtensionNames)
					(cffi:null-pointer)))
			   :destroy (loop for i from 0 below enabledExtensionCount
					  do (cffi:foreign-free (cffi:mem-aref ppEnabledExtensionNames
									       :pointer i))
					  finally (cffi:foreign-free ppEnabledExtensionNames))
			   :get ((&optional (index nil))
				 (if index
				     (cffi:foreign-string-to-lisp (cffi:mem-aref ppEnabledExtensionNames
										 :pointer index))
				     (if (cffi:null-pointer-p ppEnabledExtensionNames)
					 nil
					 (loop for i from 0 below enabledExtensionCount
					       collect (cffi:foreign-string-to-lisp
							(cffi:mem-aref ppEnabledExtensionNames :pointer i))))))
			   :set ((new-value &optional (index nil))
				 (if index
				     (progn
				       (cffi:foreign-free (cffi:mem-aref ppEnabledExtensionNames
									 :pointer index))
				       (setf (cffi:mem-aref ppEnabledExtensionNames :pointer index)
					     (cffi:foreign-string-alloc new-value)))
				     (progn
				       (when (not (cffi:null-pointer-p ppEnabledExtensionNames))
					 (loop for i from 0 below enabledExtensionCount
					       do (cffi:foreign-free (cffi:mem-aref ppEnabledExtensionNames
										    :pointer i))
					       finally (cffi:foreign-free ppEnabledExtensionNames)))
				       (setf ppEnabledExtensionNames (cffi:foreign-alloc :string
											 :initial-contents
											 new-value))))))
  (pEnabledFeatures :create ((pEnabledFeatures nil)
			     (or pEnabledFeatures (cffi:null-pointer)))
		    :get (() (if (cffi:null-pointer-p pEnabledFeatures)
				 nil
				 pEnabledFeatures))))


;; ---------------------
;; ----- Functions -----
;; ---------------------

;; Create a device
(defun create-device (physicalDevice-c pCreateInfo-c _pAllocator)
  (let ((pAllocator-c (or _pAllocator (cffi:null-pointer))))
    (cffi:with-foreign-object (pDevice-c 'VkDevice)
      (let ((result (vkCreateDevice physicalDevice-c pCreateInfo-c pAllocator-c pDevice-c)))
	(values (cffi:mem-ref pDevice-c 'VkDevice) result pAllocator-c)))))

;; Destroy a device
(defun destroy-device (device-c pAllocator-c)
  (vkDestroyDevice device-c pAllocator-c))

;; With device macro
(mcffi:defwith with-device
  create-device
  destroy-device
  :destructor-arguments (0 2))


;; Get a queue handle from a device
(defun get-device-queue (device-c queueFamilyIndex-c queueIndex-c)
  (cffi:with-foreign-object (pQueue-c 'VkQueue)
    (vkGetDeviceQueue device-c queueFamilyIndex-c queueIndex-c pQueue-c)
    (cffi:mem-ref pQueue-c 'VkQueue)))
