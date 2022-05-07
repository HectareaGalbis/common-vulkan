
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


;; Auxiliary functions for do-submit-info-aux macro
(labels ((rfind (arg tree)
           (cond
             ((null tree) nil)
             ((listp tree) (or (rfind arg (car tree) (cdr tree))))
             (t (eq arg tree))))
         (find-args (args tree)
           (map (lambda (s) (rfind s tree)) symbols))
         (transform-body (args body)
           (unless (eq 'do-command-buffer (car body))
             (error "do-submit-info error: Expected a do-command-buffer statement. Found ~S" (car body)))
           (if (find-args args body)
               `(do-resettable-command-buffer ,(second body) ,args (,device ,reset-pool) ,@(cddr body))
               `(do-command-buffer ,(second body) (,device ,pool) ,@(cddr body)))))
  ;; Auxiliar macro for do-submit-info
  (defmacro do-submit-info-aux (args (device pool reset-pool) &body buffer-bodies)
    (let ((command-buffers (gensym))
          (procs           (gensym))
          (command-buffer  (gensym))
          (proc            (gensym))
          (device-sym      (gensym))
          (pools           (gensym))
          (pool-sym        (gensym)))
      (if (null buffer-bodies)
          '(values nil nil nil)
          `(multiple-value-bind (,command-buffers ,procs ,pools) (do-submit-info-aux ,args (,device ,pool ,reset-pool) ,(cdr buffer-bodies))
             (multiple-value-bind (,command-buffer ,proc ,device-sym ,pool-sym) ,(transform-body (car buffer-bodies))
               (values (cons ,command-buffer ,command-buffers) (if ,proc (cons ,proc ,procs) ,procs) (cons ,pool-sym ,pools))))))))

;; Creates a submit info structure with new command buffers
(defmacro do-submit-info (args (device pool reset-pool wait-sems wait-stages signal-sems) &body buffer-bodies)
  (let ((command-buffers (gensym))
        (procs           (gensym))
        (command-pools   (gensym)))
    `(multiple-value-bind (,command-buffers ,procs ,command-pools) (do-submit-info-aux ,args (,device ,pool ,reset-pool) ,@buffer-bodies)
       (values (create-submit-info ,wait-sems ,wait-stages ,signal-sems ,command-buffers) ,procs ,command-pools))))

;; Destroys a submit info created with do-submit-info
(defun undo-submit-info (submit-info-ptr device command-pools)
  (cffi:with-foreign-slots ((commandBufferCount pCommandBuffers) submit-info-ptr '(:struct VkSubmitInfo))
    (loop for i from 0 below commandBufferCount
          for command-pool in command-pools
          do (undo-command-buffer (cffi:mem-aref pCommandBuffers 'VkCommandBuffer i) device command-pool)))
  (destroy-submit-info submit-info-ptr))


(flet ((transform-body (args device body)
         `(do-submit-info ,args ,(cons device (cadr body)) ,@(cddr body))))
  (defmacro do-queue-submit-aux (args (device) &body bodies)
    (let ((submit-infos (gensym))
          (procs        (gensym))
          (pools        (gensym))
          (submit-info  (gensym))
          (new-procs    (gensym))
          (new-pools    (gensym)))
      (if (null bodies)
          '(values nil nil)
          `(multiple-value-bind (,submit-infos ,procs ,pools) (do-queue-submit-aux ,args (,device) ,@(cdr bodies))
             (multiple-value-bind (,submit-info ,new-procs ,new-pools) ,(transform-body args device (car bodies))
               (values (cons ,submit-info ,submit-infos) (append ,new-procs ,procs) (cons ,new-pools ,pools))))))))

(defmacro do-queue-submit (args (device queue fence) &body bodies)
  (let ((submit-infos (gensym))
        (procs        (gensym))
        (pools        (gensym))
        (proc (gensym)))
    `(multiple-value-bind (,submit-infos ,procs ,pools) (do-queue-submit-aux ,args (,device) ,@bodies)
       (values (lambda ,args
                 (loop for ,proc in ,procs
                       do (funcall ,proc ,@args))
                 (queue-submit ,queue ,submit-infos ,fence))
               ,pools))))


(flet ((body-transform (args device body)
         (if (eq 'submit (car body))
             `(do-queue-submit ,args ,(cons device (cadr body)) ,@(cddr body)))))) ; Arreglar
(defmacro do-vulkan-submission-aux (args (device) &body bodies))




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
