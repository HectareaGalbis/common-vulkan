
(in-package :cvk)


;; Constructor and destructor of VkDeviceQueueCreateInfo
(mcffi:def-foreign-constructor-destructor device-queue-create-info (:struct VkDeviceQueueCreateInfo)
  sType
  pNext
  flags
  queueFamilyIndex
  queueCount
  (pQueuePriorities :create (cffi:foreign-alloc :float :initial-contents pQueuePriorities)
		    :destroy (cffi:foreign-free pQueuePriorities)))


(mcffi:def-foreign-accessors)
