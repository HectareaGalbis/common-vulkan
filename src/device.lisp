
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/device.md"))


  (mcffi:doc-header "Device" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)


  (mcffi:def-foreign-struct "VkDeviceQueueCreateInfo" device-queue-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStrutureType" :init-form VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO)
    (pNext :name "pNext" :type pointer :init-form nil
	   :create (or pNext (cffi:null-pointer))
	   :get (()
		 (if (cffi:null-pointer-p pNext)
		     nil
		     pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkDeviceQueueCreateFlags")
    (queueFamilyIndex :name "queueFamilyIndex" :type uint32)
    (queueCount :name "queueCount" :type uint32)
    (pQueuePriorities :name "pQueuePriorities" :type (list float)
		      :create (if pQueuePriorities
				   (cffi:foreign-alloc :float :initial-contents pQueuePriorities)
				   (cffi:null-pointer))
		      :destroy (if (not (cffi:null-pointer-p pQueuePriorities))
				   (cffi:foreign-free pQueuePriorities))
		      :get ((&optional (index nil))
			    (if index
				(cffi:mem-aref pQueuePriorities :float index)
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
  (mcffi:def-foreign-struct "VkDeviceCreateInfo" device-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO)
    (pNext :name "pNext" :type pointer :init-form nil
	   :create (or pNext (cffi:null-pointer))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkDeviceCreateFlags")
    (queueCreateInfoCount :name "queueCreateInfoCount" :type uint32)
    (pQueueCreateInfos :name "pQueueCreateInfos" :type (list "VkDeviceQueueCreateInfo") :init-form nil
		       :create (if pQueueCreateInfos
				   (cffi:foreign-alloc '(:struct VkDeviceQueueCreateInfo)
						       :initial-contents
						       (mapcar
							(lambda (x)
							  (cffi:mem-ref x '(:struct VkDeviceQueueCreateInfo)))
							pQueueCreateInfos))
				   (cffi:null-pointer))
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
    (enabledLayerCount :name "enabledLayerCount" :type uint32)
    (ppEnabledLayerNames :name "ppEnabledLayerNames" :type (list string) :init-form nil
			 :create (if ppEnabledLayerNames
				     (cffi:foreign-alloc :string :initial-contents ppEnabledLayerNames)
				     (cffi:null-pointer))
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
    (enabledExtensionCount :name "enabledExtensionCount" :type uint32)
    (ppEnabledExtensionNames :name "ppEnabledExtensionNames" :type (list string) :init-form nil
			     :create (if ppEnabledExtensionNames
					 (cffi:foreign-alloc :string :initial-contents ppEnabledExtensionNames)
					 (cffi:null-pointer))
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
    (pEnabledFeatures :name "pEnabledFeatures" :type "VkPhysicalDeviceFeatures" :init-form nil
		      :create (or pEnabledFeatures (cffi:null-pointer))
		      :get (() (if (cffi:null-pointer-p pEnabledFeatures)
				   nil
				   pEnabledFeatures))
		      :set ((new-value)
			    (setf pEnabledFeatures (or new-value (cffi:null-pointer))))))



  (mcffi:doc-subheader "Functions" doc-file)
  

  (mcffi:doc-subsubheader "vkCreateDevice" doc-file)
  
  (mcffi:def-foreign-function create-device doc-file (physicalDevice pCreateInfo pAllocator)
    (declare-types ("VkPhysicalDevice" "physicalDevice") ("VkDeviceCreateInfo" "pCreateInfo")
		   ("VkAllocationCallbacks" "pAllocator") :return ("VkDevice" device) ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pDevice 'VkDevice)
	(let ((result (vkCreateDevice physicalDevice pCreateInfo pAllocator-c pDevice)))
	  (values (cffi:mem-ref pDevice 'VkDevice) result (if pAllocator pAllocator-c nil))))))



  (mcffi:doc-subsubheader "vkDestroyDevice" doc-file)
  
  (mcffi:def-foreign-function destroy-device doc-file (device pAllocator)
    (declare-types ("VkDevice" device) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyDevice device pAllocator-c)))


  
  (mcffi:doc-subsubheader "with-device" doc-file)
  
  (mcffi:defwith with-device doc-file
    create-device
    destroy-device
    :destructor-arguments (0 2))



  (mcffi:doc-subsubheader "vkGetDeviceQueue" doc-file)
  
  (mcffi:def-foreign-function get-device-queue doc-file (device queueFamilyIndex queueIndex)
    (declare-types ("VkDevice" device) (uint32 "queueFamilyIndex") (uint32 "queueIndex")
		   :return ("VkQueue" queue))
    (cffi:with-foreign-object (pQueue 'VkQueue)
      (vkGetDeviceQueue device queueFamilyIndex queueIndex pQueue)
      (cffi:mem-ref pQueue 'VkQueue))))
