
(in-package :cvk)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Creates a command pool info struct
(defun create-command-pool-info (index-family reset-buffers)
  (let ((pool-info-ptr (alloc-vulkan-object '(:struct VkCommandPoolCreateInfo))))
    (cffi:with-foreign-slots ((sType flags queueFamilyIndex) pool-info-ptr (:struct VkCommandPoolCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO
            flags (if reset-buffers VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT 0)
            queueFamilyIndex index-family)
      pool-info-ptr)))

;; Destroys a command pool info struct
(defun destroy-command-pool-info (pool-info-ptr)
  (free-vulkan-object pool-info-ptr))

;; with command pool info struct
(defwith with-command-pool-info
         create-command-pool-info
         destroy-command-pool-info)

;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a command pool
(defun create-command-pool (device queue-family &key (reset-buffers nil))
  (with-command-pool-info pool-info-ptr ((vk-queue-family-index queue-family) reset-buffers)
    (cffi:with-foreign-object (command-pool-ptr 'VkCommandPool)
      (check-vk-result (vkCreateCommandPool device pool-info-ptr (cffi:null-pointer) command-pool-ptr))
      (values (cffi:mem-ref command-pool-ptr 'VkCommandPool) device))))

;; Destroys a command pool
(defun destroy-command-pool (command-pool device)
  (vkDestroyCommandPool device command-pool (cffi:null-pointer)))

;; With command pool macro
(defwith with-command-pool
         create-command-pool
         destroy-command-pool
         :destructor-arity 2)
