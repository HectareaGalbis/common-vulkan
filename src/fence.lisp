
(in-package :cvk)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Creates a fence create info structure
(defun create-fence-create-info (&key (signaled nil))
  (let ((fence-info-ptr (alloc-vulkan-object '(:struct VkFenceCreateInfo))))
    (cffi:with-foreign-slots ((sType flags) fence-info-ptr (:struct VkFenceCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_FENCE_CREATE_INFO
            flags (if signaled VK_FENCE_CREATE_SIGNALED_BIT 0)))
    (values fence-info-ptr)))

;; Destroys a fence create info structure
(defun destroy-fence-create-info (fence-info-ptr)
  (free-vulkan-object fence-info-ptr))

;; With fence create info macro
(defwith with-fence-create-info
         create-fence-create-info
         destroy-fence-create-info)

;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a fence
(defun create-fence (device &key (signaled nil))
  (with-fence-create-info fence-info-ptr (:signaled signaled)
    (cffi:with-foreign-object (fence-ptr 'VkFence)
      (check-vk-result (vkCreateFence device fence-info-ptr (cffi:null-pointer) fence-ptr))
      (values (cffi:mem-ref fence-ptr 'VkFence) device))))

;; Destroys a fence
(defun destroy-fence (fence device)
  (vkDestroyFence device fence (cffi:null-pointer)))

;; With fence macro
(defwith with-fence
         create-fence
         destroy-fence
         :destructor-arity 2)


;; Resets a list of fences to the unsignaled state
(defun reset-fences (device fences)
  (let ((fences-ptr (cffi:foreign-alloc 'VkFence :initial-contents fences)))
    (check-vk-result (vkResetFences device (length fences) fences-ptr))
    (cffi:foreign-free fences-ptr)))


;; Performs a wait operation
(defun wait-for-fences (device fences &key (wait-all t) (timeout UINT64_MAX))
  (let ((fences-ptr (cffi:foreign-alloc 'VkFence :initial-contents fences)))
    (check-vk-result (vkWaitForFences device (length fences) fences-ptr (if wait-all VK_TRUE VK_FALSE) timeout))
    (cffi:foreign-free fences-ptr)))
