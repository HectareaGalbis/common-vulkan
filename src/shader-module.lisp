
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/shader-module.md"))


  (mcffi:doc-header "Shader module" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)


  (mcffi:def-foreign-struct "VkShaderModuleCreateInfo" shader-module-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form "VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO")
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			nil
			pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkShaderModuleCreateFlags")
    (codeSize :name "codeSize" :type size)
    (pCode :name "pCode" :type "spv code"))



  (mcffi:doc-subheader "Functions" doc-file)


  (mcffi:doc-subsubheader "vkCreateShaderModule" doc-file)

  (mcffi:def-foreign-function create-shader-module doc-file (device pCreateInfo pAllocator)
    (declare-types ("VkDevice" device) ("VkShaderModuleCreateInfo" "pCreateInfo") ("VkAllocationCallbacks" "pAllocator")
		   :return ("VkShaderModule" "pShaderModule") ("VkResult" result))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (cffi:with-foreign-object (pShaderModule 'VkShaderModule)
	(let ((result (vkCreateShaderModule device pCreateInfo pAllocator-c pShaderModule)))
	  (values (cffi:mem-ref pShaderModule 'VkShaderModule) result device pAllocator)))))



  (mcffi:doc-subsubheader "vkDestroyShaderModule" doc-file)

  (mcffi:def-foreign-function destroy-shader-module doc-file (device shaderModule pAllocator)
    (declare-types ("VkDevice" device) ("VkShaderModule" "shaderModule") ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroyShaderModule device shaderModule pAllocator-c)))



  (mcffi:doc-subsubheader "with-shader-module" doc-file)

  (mcffi:defwith with-shader-module doc-file
    create-shader-module
    destroy-shader-module
    :destructor-arguments (2 0 3)))
