
(in-package :cvk)

;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Creates a shader module create info structure
(defun create-shader-module-create-info (spv-file)
  (let* ((code     (uiop:read-file-string spv-file))
         (code-ptr (cffi:foreign-string-alloc code))
         (shader-module-info-ptr (alloc-vulkan-object '(:struct VkShaderModuleCreateInfo))))
    (cffi:with-foreign-slots ((sType codeSize pCode))
      (setf sType    VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
            codeSize (length code)
            pCode    code-ptr)
      (values shader-module-info-ptr))))

;; Destroys a shader module create info structure
(defun destroy-shader-module-create-info (shader-info-ptr)
  (cffi:foreign-string-free (cffi:foreign-slot-value shader-info-ptr '(:struct VkShaderModuleCreateInfo) 'pCode))
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
