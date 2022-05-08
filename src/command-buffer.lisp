
(in-package :cvk)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Creates a command buffer allocate info
(defun create-command-buffer-allocate-info (command-pool &key (secondary-buffer nil) (count 1))
  (let ((allocate-info-ptr (alloc-vulkan-object '(:struct VkCommandBufferAllocateInfo))))
    (cffi:with-foreign-slots ((sType commandPool level commandBufferCount) allocate-info-ptr (:struct VkCommandBufferAllocateInfo))
      (setf sType              VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO
            commandPool        command-pool
            level              (if secondary-buffer VK_COMMAND_BUFFER_LEVEL_SECONDARY
                                                    VK_COMMAND_BUFFER_LEVEL_PRIMARY)
            commandBufferCount count)
      (values allocate-info-ptr))))

;; Destroys a command buffer allocate info
(defun destroy-command-buffer-allocate-info (allocate-info-ptr)
  (free-vulkan-object allocate-info-ptr))

;; With command buffer allocate info macro
(defwith with-command-buffer-allocate-info
         create-command-buffer-allocate-info
         destroy-command-buffer-allocate-info)


;; Creates a command buffer begin info struct
(defun create-command-buffer-begin-info (usage-flags)
  (let ((begin-info-ptr (alloc-vulkan-object '(:struct VkCommandBufferBeginInfo))))
    (cffi:with-foreign-slots ((sType flags) begin-info-ptr (:struct VkCommandBufferBeginInfo))
      (setf sType VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO
            flags usage-flags))
    (values begin-info-ptr)))

;; Destroys a command buffer begin info struct
(defun destroy-command-buffer-begin-info (begin-info-ptr)
  (free-vulkan-object begin-info-ptr))

;; With command buffer begin info macro
(defwith with-command-buffer-begin-info
         create-command-buffer-begin-info
         destroy-command-buffer-begin-info)

;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Create an c-array of command buffers
(defun create-command-buffer (device command-pool &key (secondary-buffer nil))
  (with-command-buffer-allocate-info allocate-info-ptr (command-pool :secondary-buffer secondary-buffer :count 1)
    (let ((command-buffer-ptr (cffi:foreign-alloc 'VkCommandBuffer :count 1)))
      (check-vk-result (vkAllocateCommandBuffers device allocate-info-ptr command-buffer-ptr))
      (values command-buffer-ptr device command-pool))))

;; Destroys an array of command buffers
(defun destroy-command-buffer (command-buffer-ptr device command-pool)
  (vkFreeCommandBuffers device command-pool 1 command-buffer-ptr))

;; With command buffers macro
(defwith with-command-buffer
         create-command-buffer
         destroy-command-buffer
         :destructor-arity 3)


;; Resets a command buffer
(defun reset-command-buffer (command-buffer-ptr)
  (vkResetCommandBuffer (cffi:mem-ref command-buffer-ptr 'VkCommandBuffer) 0))


;; Initializes a command recording to a command buffer
(defun begin-command-buffer (command-buffer-ptr usage-flags)
  (with-command-buffer-begin-info begin-info-ptr (usage-flags)
    (vkBeginCommandBuffer (cffi:mem-ref command-buffer-ptr 'VkCommandBuffer) begin-info-ptr)
    command-buffer-ptr))

;; Finalizes a command recording to a command buffer
(defun end-command-buffer (command-buffer-ptr)
  (vkEndCommandBuffer (cffi:mem-ref command-buffer-ptr 'VkCommandBuffer)))


;; Creates a command buffer ready to submit
;; This can't be rerecorded
(defmacro do-command-buffer (buffer-name (device command-pool) &body body)
  `(let ((,buffer-name (create-command-buffer ,device ,command-pool)))
     (begin-command-buffer ,buffer-name VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT)
     ,@body
     (end-command-buffer ,buffer-name)
     (values ,buffer-name nil ,device ,command-pool)))

;; Creates a command buffer and a function that rerecord the command buffer
(defmacro do-resettable-command-buffer (buffer-name args (device command-pool) &body body)
  `(let ((,buffer-name (create-command-buffer ,device ,command-pool)))
     (values ,buffer-name
             (lambda ,args
               (reset-command-buffer ,buffer-name)
               (begin-command-buffer ,buffer-name VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT)
               ,@body
               (end-command-buffer ,buffer-name))
             ,device
             ,command-pool)))

;; Same as destroy-command-buffer. Just for completeness
(defun undo-command-buffer (command-buffer-ptr device command-pool)
  (destroy-command-buffer command-buffer-ptr device command-pool))
