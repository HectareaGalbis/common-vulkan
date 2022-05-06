
(in-package :cvk)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Creates a submit info structure
(defun create-submit-info wait-sems wait-stages signal-sems command-buffers
  (let ((wait-sem-count       (length wait-sems))
        (signal-sem-count     (length signal-sems))
        (command-buffer-count (length command-buffers-count))
        (wait-sems-ptr        (if (not (zerop wait-sem-count))
                                  (cffi:foreign-alloc 'VkSemaphore :initial-contents wait-sems)
                                  (cffi:null-pointer)))
        (wait-stages-ptr      (if (not (zerop wait-sem-count))
                                  (cffi:foreign-alloc 'VkPipelineStageFlags :initial-contents wait-stages)
                                  (cffi:null-pointer)))
        (signal-sems-ptr      (if (not (zerop signal-sem-count))
                                  (cffi:foreign-alloc 'VkSemaphore :initial-contents signal-sems)
                                  (cffi:null-pointer)))
        (command-buffers-ptr  (if (not (zerop command-buffer-count))
                                  (cffi:foreign-alloc 'VkCommandBuffer :initial-contents command-buffers)
                                  (cffi:null-pointer)))
        (submit-info-ptr      (alloc-vulkan-object '(:struct VkSubmitInfo))))
    (cffi:with-foreign-slots ((sType waitSemaphoreCount pWaitSemaphores pWaitDstStageMask commandBufferCount
                               pCommandBuffers signalSemaphoreCount pSignalSemaphores) submit-info-ptr '(:struct VkSubmitInfo))
      (setf sType                VK_STRUCTURE_TYPE_SUBMIT_INFO
            waitSemaphoreCount   wait-sem-count
            pWaitSemaphores      wait-sems-ptr
            pWaitDstStageMask    wait-stages-ptr
            commandBufferCount   command-buffer-count
            pCommandBuffers      command-buffers-ptr
            signalSemaphoreCount signal-sem-count
            pSignalSemaphores    signal-sems-ptr))
    (values submit-info-ptr)))

;; Destroys a submit info structure
(defun destroy-submit-info (submit-info-ptr)
  (cffi:with-foreign-slots ((pWaitSemaphores pWaitDstStageMask pCommandBuffers pSignalSemaphores)
                            submit-info-ptr '(:struct VkSubmitInfo))
    (cffi:foreign-free pWaitSemaphores)
    (cffi:foreign-free pWaitDstStageMask)
    (cffi:foreign-free pCommandBuffer)
    (cffi:foreign-free pSignalSemaphores))
  (free-vulkan-object submit-info-ptr))

;; With submit info macro
(defwith with-submit-info
         create-submit-info
         destroy-submit-info)


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

(defun device-queue (device queue-family queue-index)
  (cffi:with-foreign-object (queue-ptr 'VkQueue)
    (vkGetDeviceQueue device (vk-queue-family-index queue-family) queue-index) queue-ptr
    (cffi:mem-ref queue-ptr)))

(defun device-queues (device queue-family)
  (loop for i from 0 below (vk-queue-family-queue-count queue-family)
        collect (device-queue device queue-family i)))
