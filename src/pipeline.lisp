
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/pipeline.md"))


  (mcffi:doc-header "Pipeline" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)


  (mcffi:def-foreign-struct "VkPipelineShaderStageCreateInfo" pipeline-shader-stage-create-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (sType :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO)
    (pNext :name "pNext" :type "Vulkan object" :init-form nil
	   :create ((pNext-arg)
		    (setf pNext (or pNext-arg (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pNext)
			 nil
			 pNext))
	   :set ((new-value)
		 (setf pNext (or new-value (cffi:null-pointer)))))
    (flags :type "VkPipelineShaderStageCreateFlags")
    (stage :type VkShaderStageFlagBits)
    (module :type "VkShaderModule" :init-form nil
	    :create ((module-arg)
		     (setf module (or module-arg (cffi:null-pointer))))
	    :get (() (if (cffi:null-pointer-p module)
			  nil
			  module))
	    :set ((new-value)
		  (setf module (or new-value (cffi:null-pointer)))))
    (pName :name "pName" :type string :init-form nil
	   :create ((pName-arg)
		    (setf pName (if pName-arg (cffi:foreign-string-alloc pName-arg) (cffi:null-pointer))))
	   :get (() (if (cffi:null-pointer-p pName)
			nil
			(cffi:foreign-string-to-lisp pName)))
	   :set ((new-value)
		 (when (not (cffi:null-pointer-p pName))
		   (cffi:foreign-string-free pName))
		 (setf pName (if new-value (cffi:foreign-string-alloc new-value) (cffi:null-pointer)))))
    (pSpecializationInfo :name "pSpecializationInfo" :type "VkSpecializationInfo" :init-form nil
			 :create ((pSpecializationInfo-arg)
				  (setf pSpecializationInfo (or pSpecializationInfo-arg (cffi:null-pointer))))
			 :get (() (if (cffi:null-pointer-p pSpecializationInfo)
				       nil
				       pSpecializationInfo))
			 :set ((new-value)
			       (setf pSpecializationInfo (or new-value (cffi:null-pointer)))))))
