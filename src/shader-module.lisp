
(in-package :cvk)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Took from cl-vulkan
(defun create-spv-code (filename)
  (with-open-file (stream filename :element-type '(unsigned-byte 8))
    (let ((buffer (make-array 1024 :element-type '(unsigned-byte 8) :adjustable t :fill-pointer 0))
	  (byte))
      (loop while (setq byte (read-byte stream nil))
	 do (vector-push-extend byte buffer))
      (let* ((size (fill-pointer buffer))
	     (binary (cffi:foreign-alloc (list :array :unsigned-char size))))
	(loop for b across buffer for i from 0
	   do (setf (cffi:mem-aref binary :unsigned-char i) b))
	(values binary size)))))

(defun destroy-spv-code (binary)
  (cffi:foreign-free binary))


;; Creates a shader module create info structure
(defun create-shader-module-create-info (spv-file)
  (multiple-value-bind (code-ptr code-size) (create-spv-code spv-file)
    (let ((shader-module-info-ptr (alloc-vulkan-object '(:struct VkShaderModuleCreateInfo))))
      (cffi:with-foreign-slots ((sType codeSize pCode) shader-module-info-ptr (:struct VkShaderModuleCreateInfo))
        (setf sType    VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
              codeSize code-size
              pCode    code-ptr))
      (values shader-module-info-ptr))))

;; Destroys a shader module create info structure
(defun destroy-shader-module-create-info (shader-info-ptr)
  (destroy-spv-code (cffi:foreign-slot-value shader-info-ptr '(:struct VkShaderModuleCreateInfo) 'pCode))
  (free-vulkan-object shader-info-ptr))

;; With shader module create info macro
(defwith with-shader-module-create-info
         create-shader-module-create-info
         destroy-shader-module-create-info)


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a shader module
(defun create-shader-module (device spv-file)
  (with-shader-module-create-info shader-module-info (spv-file)
    (cffi:with-foreign-object (shader-module-ptr 'VkShaderModule)
      (check-vk-result (vkCreateShaderModule device shader-module-info (cffi:null-pointer) shader-module-ptr))
      (values (cffi:mem-ref shader-module-ptr 'VkShaderModule) device))))

;; Destroys a shader module
(defun destroy-shader-module (shader-module device)
  (vkDestroyShaderModule device shader-module (cffi:null-pointer)))

;; With shader module macro
(defwith with-shader-module
         create-shader-module
         destroy-shader-module
         :destructor-arity 2)
