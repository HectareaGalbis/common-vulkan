
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/miscellanea.md"))


  (mcffi:doc-header "Miscellanea" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)



  (mcffi:def-foreign-struct "VkOffset2D" offset-2d doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (x :type int32)
    (y :type int32))

  

  (mcffi:def-foreign-struct "VkExtent2D" extent-2d doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (width :type uint32)
    (height :type uint32))



  (mcffi:def-foreign-struct "VkRect2D" rect-2d doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (offset :pointer t :type "VkOffset2D"
	    :create ((offset-arg)
		     (setf (offset-2d-x offset) (offset-2d-x offset-arg)
			   (offset-2d-y offset) (offset-2d-y offset-arg)))
	    :set ((new-value)
		  (setf (offset-2d-x offset) (offset-2d-x new-value)
			(offset-2d-y offset) (offset-2d-y new-value))))
    (extent :pointer t :type "VkExtent2D"
	    :create ((extent-arg)
		     (setf (extent-2d-width extent) (extent-2d-width extent-arg)
			   (extent-2d-height extent) (extent-2d-height extent-arg)))
	    :set ((new-value)
		  (setf (extent-2d-width extent) (extent-2d-width new-value)
			(extent-2d-height extent) (extent-2d-height new-value)))))
  


  (mcffi:def-foreign-struct "VkComponentMapping" component-mapping doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (r :type "VkComponentSwizzle")
    (g :type "VkComponentSwizzle")
    (b :type "VkComponentSwizzle")
    (a :type "VkComponentSwizzle"))



  (mcffi:def-foreign-struct "VkImageSubresourceRange" image-subresource-range doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (aspectMask :name "aspectMask" :type "VkImageAspectFlags")
    (baseMipLevel :name "baseMipLevel" :type uint32)
    (levelCount :name "levelCount" :type uint32)
    (baseArrayLayer :name "baseArrayLayer" :type uint32)
    (layerCount :name "layerCount" :type uint32))



  (mcffi:def-foreign-struct "VkSpecializationMapEntry" specialization-map-entry doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (constantID :name "constantID" :type uint32)
    (offset :type uint32)
    (size :type size))
  
  

  (mcffi:def-foreign-struct "VkSpecializationInfo" specialization-info doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (mapEntryCount :name "mapEntryCount" :type uint32)
    (pMapEntries :name "pMapEntries" :type "VkSpecializationMapEntry" :init-form nil
		 :create ((pMapEntries-arg)
			  (setf pMapEntries (or pMapEntries-arg (cffi:null-pointer))))
		 :get (() (if (cffi:null-pointer-p pMapEntries)
			      nil
			      pMapEntries))
		 :set ((new-value)
		       (setf pMapEntries (or new-value (cffi:null-pointer)))))
    (dataSize :name "dataSize" :type size)
    (pData :name "pData" :type void*)) ; Sin tratar de momento



  (mcffi:def-foreign-struct "VkViewport" viewport doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (x :type float)
    (y :type float)
    (width :type float)
    (height :type float)
    (minDepth :name "minDepth" :type float)
    (maxDepth :name "maxDepth" :type float))



  (mcffi:def-foreign-struct "VkPushConstantRange" push-constant-range doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (stageFlags :name "stageFlags" :type "VkShaderStageFlags")
    (offset :type uint32)
    (size :type uint32))



  (mcffi:doc-subheader "Functions" doc-file)


  (mcffi:doc-subsubheader "create-spv-code" doc-file)

  (mcffi:def-foreign-function create-spv-code doc-file (file)
    (declare-types ("pathname designator" file) :return ("spv code" code) ("uint" size))
    (with-open-file (stream file :direction :input :element-type '(unsigned-byte 8))
      (let ((buffer (make-array 1024 :element-type '(unsigned-byte 8) :fill-pointer 0 :adjustable t)))
	(loop for byte = (read-byte stream nil)
	      while byte
	      do (vector-push-extend byte buffer))
	(let ((code (cffi:foreign-alloc :uint8 :initial-contents buffer)))
	  (values code (fill-pointer buffer))))))



  (mcffi:doc-subsubheader "destroy-spv-code" doc-file)
  
  (mcffi:def-foreign-function destroy-spv-code doc-file (code)
    (declare-types ("spv code" code))
    (cffi:foreign-free code))



  (mcffi:doc-subsubheader "with-spv-code" doc-file)

  (mcffi:defwith with-spv-code doc-file
    create-spv-code
    destroy-spv-code)) 
