
(in-package :cvk)

(defmacro create-pointer (slot slot-arg)
  `(setf ,slot (or ,slot-arg (cffi-sys:null-pointer))))

(defmacro get-pointer (slot)
  `(if (cffi-sys:null-pointer-p ,slot)
       nil
       ,slot))

(defmacro set-pointer (slot new-value)
  `(setf ,slot (or ,new-value (cffi-sys:null-pointer))))

(defmacro create-string (slot slot-arg &key (dynamic nil))
  (when dynamic
    `(setf ,slot
           (if ,slot-arg
               (cffi:foreign-string-alloc ,slot-arg)
               (cffi-sys:null-pointer)))
    (let ((str-sym (gensym)))
      `(cffi:with-foreign-string (,str-sym ,slot-arg)
	 (mcffi:copy ,slot ,str-sym (length ,slot-arg))))))

(defmacro destroy-string (slot)
  `(when (not (cffi-sys:null-pointer-p ,slot))
     (cffi:foreign-string-free ,slot)))

(defmacro get-string (slot)
  `(cffi:foreign-string-to-lisp ,slot))

(defmacro set-string (slot new-value &key (dynamic nil))
  `(progn
     ,(when dynamic
	`(destroy-string ,slot))
     (create-string ,slot ,new-value)))

(defmacro create-array (type slot slot-arg &key (dynamic nil) (pointers nil))
  `(progn
    ,@(when dynamic
        `((setf ,slot
                  (if ,slot-arg
                      (cffi:foreign-alloc ',type :count (length ,slot-arg))
                      (cffi-sys:null-pointer)))))
    ,(let ((i (gensym)))
       `(iter
          (for ,i from 0 below (length ,slot-arg))
          ,(if pointers
               `(more-cffi:copy (cffi:mem-aptr ,slot ,i) (aref ,slot-arg ,i)
                                ',type)
               `(setf (cffi:mem-aref ,slot ',type ,i) (aref ,slot-arg ,i)))))))

(defmacro destroy-array (slot)
  `(when (not (cffi-sys:null-pointer-p ,slot)) (cffi-sys:foreign-free ,slot)))

(defmacro get-array (type slot index count &key (pointers nil))
  `(if (cffi-sys:null-pointer-p ,slot)
       nil
       (if ,index
           ,(if pointers
                `(cffi:mem-aptr ,slot ',type ,index)
                `(cffi:mem-aref ,slot ',type ,index))
           ,(let ((i (gensym)))
              `(iter
                 (for ,i from 0 below ,count)
                 (collect
                  ,(if pointers
                       `(cffi:mem-aptr ,slot ',type ,i)
                       `(cffi:mem-aref ,slot ',type ,i))))))))

(defmacro set-array
          (type slot new-value index &key (dynamic nil) (pointers nil))
  `(if ,index
       ,(if pointers
            `(more-cffi:copy (cffi:mem-aptr ,slot ',type ,index) ,new-value
                             ',type)
            `(setf (cffi:mem-aref ,slot ',type ,index) ,new-value))
       (progn
        (destroy-array ,slot)
        (create-array ,type ,slot ,new-value :dynamic ,dynamic :pointers
         ,pointers))))

(defmacro create-array-strings (slot slot-arg &key (dynamic nil))
  `(progn
    ,@(when dynamic
        `((setf ,slot
                  (if ,slot-arg
                      (cffi:foreign-alloc :pointer :count (length ,slot-arg))
                      (cffi-sys:null-pointer)))))
    ,(let ((i (gensym)))
       `(iter
          (for ,i from 0 below (length ,slot-arg))
          (setf (cffi:mem-aref ,slot :pointer ,i)
                  (cffi:foreign-string-alloc (aref ,slot-arg ,i)))))))

(defmacro destroy-array-strings (slot count &key dynamic)
  `(when (not (cffi-sys:null-pointer-p ,slot))
     ,(let ((i (gensym)))
        `(iter
           (for ,i from 0 below ,count)
           (cffi:foreign-string-free (cffi:mem-aref ,slot :pointer ,i))))
     ,(when dynamic `(cffi-sys:foreign-free ,slot))))

(defmacro get-array-strings (slot index count)
  `(if (cffi-sys:null-pointer-p ,slot)
       nil
       (if ,index
           (cffi:foreign-string-to-lisp (cffi:mem-aref ,slot :pointer ,index))
           ,(let ((i (gensym)))
              `(iter
                 (for ,i from 0 below ,count)
                 (collect
                  (cffi:foreign-string-to-lisp
                   (cffi:mem-aref ,slot :pointer ,i))))))))

(defmacro set-array-strings (slot new-value index count &key (dynamic nil))
  `(if ,index
       (progn
        (cffi:foreign-string-free (cffi:mem-aref ,slot :pointer ,index))
        (setf (cffi:mem-aref ,slot :pointer ,index) ,new-value))
       (progn
        (destroy-array-strings ,slot ,count :dynamic ,dynamic)
        (create-array-strings ,slot ,new-value :dynamic ,dynamic))))


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/structs.md"))

  
  (mcffi:def-foreign-struct doc-file "VkApplicationInfo" application-info
      (:default-create :default-get :default-set)
    (sType              :name "sType" :type "VkStructureType" :init-form VK_STRUCTURE_TYPE_APPLICATION_INFO)
    (pNext              :name "pNext" :type "vulkan object" :init-form nil
	                :create ((pNext-arg)
				 (create-pointer pNext pNext-arg))
			:get (() (get-pointer pNext))
			:set ((pNext-arg)
			      (set-pointer pNext pNext-arg)))
    (pApplicationName   :name "pApplicationName" :type string :init-form nil
		        :create ((pApplicationName-arg)
				 (create-string pApplicationName pApplicationName-arg))
		        :destroy (destroy-string pApplicationName)
		        :get (() (get-string pApplicationName))
		        :set ((pApplicationName-arg)
			      (set-string pApplicationName pApplicationName-arg)))
    (applicationVersion :name "applicationVersion" :type uint32 :init-form 0)
    (pEngineName        :name "pEngineName" :type string :init-form nil
		        :create ((pEngineName-arg)
				 (create-string pEngineName pEngineName-arg))
		        :destroy (destroy-string pEngineName)
		        :get (() (get-string pEngineName))
		        :set ((pEngineName-arg)
			      (set-string pEngineName pEngineName-arg)))
    (engineVersion      :name "engineVersion" :type uint32 :init-form 0)
    (apiVersion         :name "apiVersion" :type uint32 :init-form 0))


  (mcffi:def-foreign-struct doc-file "VkInstanceCreateInfo" instance-create-info 
      (:default-create :default-get :default-set)
    (sType                   :name "sType" :type "VkStructureType"
			     :init-form VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO)
    (pNext                   :name "pNext" :type "vulkan object" :init-form nil
	                     :create ((pNext-arg)
				      (create-pointer pNext pNext-arg))
			     :get (() (get-pointer pNext))
			     :set ((pNext-arg)
				   (set-pointer pNext pNext-arg)))
    (flags                   :type "VkInstanceCreateFlags")
    (pApplicationInfo        :name "pApplicationInfo" :type "VkApplicationInfo" :init-form nil
		             :create ((pApplicationInfo-arg)
				      (create-pointer pApplicationInfo pApplicationInfo-arg))
			     :get (() (get-pointer pApplicationInfo))
			     :set ((pApplicationInfo-arg)
				   (set-pointer pApplicationInfo pApplicationInfo-arg)))
    (enabledLayerCount       :name "enabledLayerCount" :type uint32)
    (ppEnabledLayerNames     :name "ppEnabledLayerNames" :type (list string) :init-form nil
			     :create ((ppEnabledLayerNames-arg)
				      (create-array-strings ppEnabledLayerNames ppEnabledLayerNames-arg :dynamic t))
			     :destroy (destroy-array-strings ppEnabledLayerNames enableLayerCount :dynamic t)
			     :get ((&optional (index nil))
				   (get-array-strings ppEnabledLayerNames index enabledLayerCount))
			     :set ((ppEnabledLayerNames-arg &optional (index nil))
				   (set-array-strings ppEnabledLayerNames ppEnabledLayerNames-arg index enabledLayerCount :dynamic t)))
    (enabledExtensionCount   :name "enabledExtensionCount" :type uint32)
    (ppEnabledExtensionNames :name "ppEnabledExtensionNames" :type (list string) :init-form nil
			     :create ((ppEnabledExtensionNames-arg)
				      (create-array-strings ppEnabledExtensionNames ppEnabledExtensionNames-arg :dynamic t))
			     :destroy (destroy-array-strings ppEnabledExtensionNames enableLayerCount :dynamic t)
			     :get ((&optional (index nil))
				   (get-array-strings ppEnabledExtensionNames index enabledExtensionCount))
			     :set ((ppEnabledExtensionNames-arg &optional (index nil))
				   (set-array-strings ppEnabledExtensionNames ppEnabledExtensionNames-arg index enabledExtensionCount :dynamic t))))


  (mcffi:def-foreign-struct doc-file "VkExtensionProperties" extension-properties 
      (:default-create :default-get :default-set)
    (extensionName :name "extensionName" :type string :init-value nil
		   :create ((extensionName-arg)
			    (create-string extensionName extensionName-arg :dynamic nil))
		   :get (() (get-string extensionName))
		   :set ((extensionName-arg)
			 (set-string extensionName extensionName-arg :dynamic nil)))
    (specVersion   :name "specVersion" :type uint32))


  (mcffi:def-foreign-struct doc-file "VkLayerProperties" layer-properties  
      (:default-create :default-destroy :default-get)
    (layerName             :name "layerName" :type string :init-value nil
	                   :create ((layerName-arg)
				    (create-string layerName layerName-arg :dynamic nil))
			   :get (() (get-string layerName))
			   :set ((layerName-arg)
				 (set-string layerName layerName-arg :dynamic nil)))
    (specVersion           :name "specVersion" :type uint32)
    (implementationVersion :name "implementationVersion" :type uint32)
    (description           :type string :init-value nil
		           :create ((description-arg)
				    (create-string description description-arg :dynamic nil))
			   :get (() (get-string description))
			   :set ((description-arg)
				 (set-string description description-arg :dynamic nil))))

  
  (more-cffi:def-foreign-struct doc-file "VkDebugUtilsMessengerCreateInfoEXT" (debug-utils-messenger-create-info-ext)
      (:default-create :default-get :default-set)
    (stype :name "sType" :type "VkStructureType")
    (pnext :name "pNext" :type "vulkan object" :init-form nil
	   :create ((pnext-arg)
		    (create-pointer pnext pnext-arg))
	   :get (nil (get-pointer pnext))
	   :set ((pnext-arg) (set-pointer pnext pnext-arg)))
    (flags :name flags :type "VkDebugUtilsMessengerCreateFlagsEXT")
    (messageseverity :name "messageSeverity" :type "VkDebugUtilsMessageSeverityFlagsEXT")
    (messagetype :name "messageType" :type "VkDebugUtilsMessageTypeFlagsEXT")
    (pfnusercallback :name "pfnUserCallback" :type callback :init-form nil
		     :create ((pfnUserCallback-arg)
			      (setf pfnUserCallback (if pfnUserCallback-arg
							(if (symbolp pfnUserCallback-arg)
							    (cffi:get-callback pfnUserCallback-arg)
							    pfnUserCallback-arg)
							(cffi:null-pointer))))
		     :set ((new-value)			   
			   (if new-value
			       (if (symbolp new-value)
				   (setf pfnUserCallback (cffi:get-callback new-value))
				   (setf pfnUserCallback new-value))
			       (setf pfnUserCallback (cffi:null-pointer)))))
    (puserdata :name "pUserData" :type "lisp object" :init-form nil
	       :create ((pUserData-arg)
			(setf pUserData (if pUserData-arg
					    (prog2
						(setf (gethash *debug-utils-messenger-callback-next-address* *debug-utils-messenger-callback-user-data*) pUserData-arg)
						(cffi:make-pointer *debug-utils-messenger-callback-next-address*)
					      (setf *debug-utils-messenger-callback-next-address* (1+ *debug-utils-messenger-callback-next-address*)))
					    (cffi:null-pointer))))
	       :get (() (gethash (cffi:pointer-address pUserData) *debug-utils-messenger-callback-user-data*))
	       :set ((new-value)
		     (if (cffi:null-pointer-p pUserData)
			 (if new-value
			     (progn
			       (setf (gethash *debug-utils-messenger-callback-next-address* *debug-utils-messenger-callback-user-data*) new-value)
			       (setf pUserData (cffi:make-pointer *debug-utils-messenger-callback-next-address*))
			       (setf *debug-utils-messenger-callback-next-address* (1+ *debug-utils-messenger-callback-next-address*))))
			 (if new-value
			     (setf (gethash (cffi:pointer-address pUserData) *debug-utils-messenger-callback-user-data*) new-value)
			     (progn
			       (remhash (cffi:pointer-address pUserData) *debug-utils-messenger-callback-user-data*)
			       (setf pUserData (cffi:null-pointer))))))))


  (more-cffi:def-foreign-struct doc-file "VkDebugUtilsMessengerCallbackDataEXT" (debug-utils-messenger-callback-data-ext)
      (:default-create :default-get :default-set)
    (stype :name "sType" :type "VkStructureType")
    (pnext :name "pNext" :type "vulkan object" :init-form nil
	   :create ((pnext-arg)
		    (create-pointer pnext pnext-arg))
	   :get (() (get-pointer pnext))
	   :set ((pnext-arg)
		 (set-pointer pnext pnext-arg)))
    (flags :name flags :type "VkDebugUtilsMessengerCallbackDataFlagsEXT")
    (pmessageidname :name "pMessageIdName" :type string :init-form nil
		    :create ((pmessageidname-arg)
			     (create-string pmessageidname pmessageidname-arg :dynamic t))
		    :destroy (destroy-string pmessageidname)
		    :get (nil (get-string pmessageidname))
		    :set ((pmessageidname-arg)
			  (set-string pmessageidname pmessageidname-arg :dynamic t)))
    (messageidnumber :name "messageIdNumber" :type int32)
    (pmessage :name "pMessage" :type string :init-form nil
	      :create ((pmessage-arg)
		       (create-string pmessage pmessage-arg :dynamic t))
	      :destroy (destroy-string pmessage)
	      :get (() (get-string pmessage))
	      :set ((pmessage-arg)
		    (set-string pmessage pmessage-arg :dynamic t)))
    (queuelabelcount :name "queueLabelCount" :type uint32)
    (pqueuelabels :name "pQueueLabels" :type (list "VkDebugUtilsLabelEXT") :init-form nil
		  :create ((pqueuelabels-arg)
			   (create-array (:struct vkdebugutilslabelext) pqueuelabels pqueuelabels-arg :dynamic t :pointers t))
		  :destroy (destroy-array pqueuelabels)
		  :get ((&optional pqueuelabels-index)
			(get-array (:struct vkdebugutilslabelext) pqueuelabels pqueuelabels-index queuelabelcount :pointers t))
		  :set ((pqueuelabels-arg &optional pqueuelabels-index)
			(set-array (:struct vkdebugutilslabelext) pqueuelabels pqueuelabels-arg pqueuelabels-index :dynamic t :pointers t)))
    (cmdbuflabelcount :name "cmdBufLabelCount" :type uint32)
    (pcmdbuflabels :name "pCmdBufLabels" :type (list "VkDebugUtilsLabelEXT") :init-form nil
		   :create ((pcmdbuflabels-arg)
			    (create-array (:struct vkdebugutilslabelext) pcmdbuflabels pcmdbuflabels-arg :dynamic t :pointers t))
		   :destroy (destroy-array pcmdbuflabels)
		   :get ((&optional pcmdbuflabels-index)
			 (get-array (:struct vkdebugutilslabelext) pcmdbuflabels pcmdbuflabels-index cmdbuflabelcount :pointers t))
		   :set ((pcmdbuflabels-arg &optional pcmdbuflabels-index)
			 (set-array (:struct vkdebugutilslabelext) pcmdbuflabels pcmdbuflabels-arg pcmdbuflabels-index :dynamic t :pointers t)))
    (objectcount :name "objectCount" :type uint32)
    (pobjects :name "pObjects" :type (list "VkDebugUtilsObjectNameInfoEXT") :init-form nil
	      :create ((pobjects-arg)
		       (create-array (:struct vkdebugutilsobjectnameinfoext) pobjects pobjects-arg :dynamic t :pointers t))
	      :destroy (destroy-array pobjects)
	      :get ((&optional pobjects-index)
		    (get-array (:struct vkdebugutilsobjectnameinfoext) pobjects pobjects-index objectcount :pointers t))
	      :set ((pobjects-arg &optional pobjects-index)
		    (set-array (:struct vkdebugutilsobjectnameinfoext) pobjects pobjects-arg pobjects-index :dynamic t :pointers t))))


  (more-cffi:def-foreign-struct doc-file "VkDebugUtilsLabelEXT" (debug-utils-label-ext)
      (:default-create :default-get :default-set)
    (stype :name "sType" :type "VkStructureType")
    (pnext :name "pNext" :type void :init-form nil
	   :create ((pnext-arg)
		    (create-pointer pnext pnext-arg))
	   :get (nil (get-pointer pnext))
	   :set ((pnext-arg)
		 (set-pointer pnext pnext-arg)))
    (plabelname :name "pLabelName" :type string :init-form nil
		:create ((plabelname-arg)
			 (create-string plabelname plabelname-arg :dynamic t))
		:destroy (destroy-string plabelname)
		:get (nil (get-string plabelname))
		:set ((plabelname-arg) (set-string plabelname plabelname-arg :dynamic t)))
    (color :name color :type (list float) :init-form '(0.0 0.0 0.0 0.0)
	   :create ((color-arg)
		    (create-array :float color color-arg :dynamic nil :pointers nil))
	   :get ((&optional color-index)
		 (get-array :float color color-index 4 :pointers nil))
	   :set ((color-arg &optional color-index)
		 (set-array :float color color-arg color-index :dynamic nil :pointers nil))))


  (more-cffi:def-foreign-struct doc-file "VkDebugUtilsObjectNameInfoEXT" (debug-utils-object-name-info-ext)
      (:default-create :default-get :default-set)
    (stype :name "sType" :type "VkStructureType")
    (pnext :name "pNext" :type void :init-form nil
	   :create ((pnext-arg)
		    (create-pointer pnext pnext-arg))
	   :get (nil (get-pointer pnext))
	   :set ((pnext-arg)
		 (set-pointer pnext pnext-arg)))
    (objecttype :name "objectType" :type "VkObjectType")
    (objecthandle :name "objectHandle" :type uint64)
    (pobjectname :name "pObjectName" :type string :init-form nil
		 :create ((pobjectname-arg)
			  (create-string pobjectname pobjectname-arg :dynamic t))
		 :destroy (destroy-string pobjectname)
		 :get (nil (get-string pobjectname))
		 :set ((pobjectname-arg)
		       (set-string pobjectname pobjectname-arg :dynamic t))))


  (more-cffi:def-foreign-struct doc-file "VkPhysicalDeviceProperties" (physical-device-properties)
      (:default-create :default-get :default-set)
    (apiversion :name "apiVersion" :type uint32)
    (driverversion :name "driverVersion" :type uint32)
    (vendorid :name "vendorID" :type uint32)
    (deviceid :name "deviceID" :type uint32)
    (devicetype :name "deviceType" :type "VkPhysicalDeviceType")
    (devicename :name "deviceName" :type string
		:create ((devicename-arg)
			 (create-string devicename devicename-arg :dynamic nil))
		:get (nil (get-string devicename))
		:set ((devicename-arg)
		      (set-string devicename devicename-arg :dynamic nil)))
    (pipelinecacheuuid :name "pipelineCacheUUID" :type (list uint8)
		       :create ((pipelinecacheuuid-arg)
				(create-array :uint8 pipelinecacheuuid pipelinecacheuuid-arg :dynamic nil :pointers nil))
		       :get ((&optional pipelinecacheuuid-index)
			     (get-array :uint8 pipelinecacheuuid pipelinecacheuuid-index VK_UUID_SIZE :pointers nil))
		       :set ((pipelinecacheuuid-arg &optional pipelinecacheuuid-index)
			     (set-array :uint8 pipelinecacheuuid pipelinecacheuuid-arg pipelinecacheuuid-index :dynamic nil :pointers nil)))
    (limits :pointer t :name limits :type "VkPhysicalDeviceLimits"
	    :create ((limits-arg)
		     (more-cffi:copy limits limits-arg '(:struct vkphysicaldevicelimits)))
	    :set ((limits-arg)
		  (more-cffi:copy limits limits-arg '(:struct vkphysicaldevicelimits))))
    (sparseproperties :pointer t :name "sparseProperties" :type "VkPhysicalDeviceSparseProperties"
		      :create ((sparseproperties-arg)
			       (more-cffi:copy sparseproperties sparseproperties-arg '(:struct vkphysicaldevicesparseproperties)))
		      :set ((sparseproperties-arg)
			    (more-cffi:copy sparseproperties sparseproperties-arg '(:struct vkphysicaldevicesparseproperties)))))


  (more-cffi:def-foreign-struct doc-file "VkPhysicalDeviceLimits" (physical-device-limits)
      (:default-create :default-get :default-set)
    (maximagedimension1d :name "maxImageDimension1D" :type uint32)
    (maximagedimension2d :name "maxImageDimension2D" :type uint32)
    (maximagedimension3d :name "maxImageDimension3D" :type uint32)
    (maximagedimensioncube :name "maxImageDimensionCube" :type uint32)
    (maximagearraylayers :name "maxImageArrayLayers" :type uint32)
    (maxtexelbufferelements :name "maxTexelBufferElements" :type uint32)
    (maxuniformbufferrange :name "maxUniformBufferRange" :type uint32)
    (maxstoragebufferrange :name "maxStorageBufferRange" :type uint32)
    (maxpushconstantssize :name "maxPushConstantsSize" :type uint32)
    (maxmemoryallocationcount :name "maxMemoryAllocationCount" :type uint32)
    (maxsamplerallocationcount :name "maxSamplerAllocationCount" :type uint32)
    (bufferimagegranularity :name "bufferImageGranularity" :type "VkDeviceSize")
    (sparseaddressspacesize :name "sparseAddressSpaceSize" :type "VkDeviceSize")
    (maxbounddescriptorsets :name "maxBoundDescriptorSets" :type uint32)
    (maxperstagedescriptorsamplers :name "maxPerStageDescriptorSamplers" :type uint32)
    (maxperstagedescriptoruniformbuffers :name "maxPerStageDescriptorUniformBuffers" :type uint32)
    (maxperstagedescriptorstoragebuffers :name "maxPerStageDescriptorStorageBuffers" :type uint32)
    (maxperstagedescriptorsampledimages :name "maxPerStageDescriptorSampledImages" :type uint32)
    (maxperstagedescriptorstorageimages :name "maxPerStageDescriptorStorageImages" :type uint32)
    (maxperstagedescriptorinputattachments :name "maxPerStageDescriptorInputAttachments" :type uint32)
    (maxperstageresources :name "maxPerStageResources" :type uint32)
    (maxdescriptorsetsamplers :name "maxDescriptorSetSamplers" :type uint32)
    (maxdescriptorsetuniformbuffers :name "maxDescriptorSetUniformBuffers" :type uint32)
    (maxdescriptorsetuniformbuffersdynamic :name "maxDescriptorSetUniformBuffersDynamic" :type uint32)
    (maxdescriptorsetstoragebuffers :name "maxDescriptorSetStorageBuffers" :type uint32)
    (maxdescriptorsetstoragebuffersdynamic :name "maxDescriptorSetStorageBuffersDynamic" :type uint32)
    (maxdescriptorsetsampledimages :name "maxDescriptorSetSampledImages" :type uint32)
    (maxdescriptorsetstorageimages :name "maxDescriptorSetStorageImages" :type uint32)
    (maxdescriptorsetinputattachments :name "maxDescriptorSetInputAttachments" :type uint32)
    (maxvertexinputattributes :name "maxVertexInputAttributes" :type uint32)
    (maxvertexinputbindings :name "maxVertexInputBindings" :type uint32)
    (maxvertexinputattributeoffset :name "maxVertexInputAttributeOffset" :type uint32)
    (maxvertexinputbindingstride :name "maxVertexInputBindingStride" :type uint32)
    (maxvertexoutputcomponents :name "maxVertexOutputComponents" :type uint32)
    (maxtessellationgenerationlevel :name "maxTessellationGenerationLevel" :type uint32)
    (maxtessellationpatchsize :name "maxTessellationPatchSize" :type uint32)
    (maxtessellationcontrolpervertexinputcomponents :name "maxTessellationControlPerVertexInputComponents" :type uint32)
    (maxtessellationcontrolpervertexoutputcomponents :name "maxTessellationControlPerVertexOutputComponents" :type uint32)
    (maxtessellationcontrolperpatchoutputcomponents :name "maxTessellationControlPerPatchOutputComponents" :type uint32)
    (maxtessellationcontroltotaloutputcomponents :name "maxTessellationControlTotalOutputComponents" :type uint32)
    (maxtessellationevaluationinputcomponents :name "maxTessellationEvaluationInputComponents" :type uint32)
    (maxtessellationevaluationoutputcomponents :name "maxTessellationEvaluationOutputComponents" :type uint32)
    (maxgeometryshaderinvocations :name "maxGeometryShaderInvocations" :type uint32)
    (maxgeometryinputcomponents :name "maxGeometryInputComponents" :type uint32)
    (maxgeometryoutputcomponents :name "maxGeometryOutputComponents" :type uint32)
    (maxgeometryoutputvertices :name "maxGeometryOutputVertices" :type uint32)
    (maxgeometrytotaloutputcomponents :name "maxGeometryTotalOutputComponents" :type uint32)
    (maxfragmentinputcomponents :name "maxFragmentInputComponents" :type uint32)
    (maxfragmentoutputattachments :name "maxFragmentOutputAttachments" :type uint32)
    (maxfragmentdualsrcattachments :name "maxFragmentDualSrcAttachments" :type uint32)
    (maxfragmentcombinedoutputresources :name "maxFragmentCombinedOutputResources" :type uint32)
    (maxcomputesharedmemorysize :name "maxComputeSharedMemorySize" :type uint32)
    (maxcomputeworkgroupcount :name "maxComputeWorkGroupCount" :type uint32
			      :create ((maxcomputeworkgroupcount-arg)
				       (create-array :uint32 maxcomputeworkgroupcount maxcomputeworkgroupcount-arg :dynamic nil :pointers nil))
			      :get ((&optional maxcomputeworkgroupcount-index)
				    (get-array :uint32 maxcomputeworkgroupcount maxcomputeworkgroupcount-index 3 :pointers nil))
			      :set ((maxcomputeworkgroupcount-arg &optional maxcomputeworkgroupcount-index)
				    (set-array :uint32 maxcomputeworkgroupcount maxcomputeworkgroupcount-arg maxcomputeworkgroupcount-index :dynamic nil :pointers nil)))
    (maxcomputeworkgroupinvocations :name "maxComputeWorkGroupInvocations" :type uint32)
    (maxcomputeworkgroupsize :name "maxComputeWorkGroupSize" :type uint32
			     :create ((maxcomputeworkgroupsize-arg)
				      (create-array :uint32 maxcomputeworkgroupsize maxcomputeworkgroupsize-arg :dynamic nil :pointers nil))
			     :get ((&optional maxcomputeworkgroupsize-index)
				   (get-array :uint32 maxcomputeworkgroupsize maxcomputeworkgroupsize-index 3 :pointers nil))
			     :set ((maxcomputeworkgroupsize-arg &optional maxcomputeworkgroupsize-index)
				   (set-array :uint32 maxcomputeworkgroupsize maxcomputeworkgroupsize-arg maxcomputeworkgroupsize-index :dynamic nil :pointers nil)))
    (subpixelprecisionbits :name "subPixelPrecisionBits" :type uint32)
    (subtexelprecisionbits :name "subTexelPrecisionBits" :type uint32)
    (mipmapprecisionbits :name "mipmapPrecisionBits" :type uint32)
    (maxdrawindexedindexvalue :name "maxDrawIndexedIndexValue" :type uint32)
    (maxdrawindirectcount :name "maxDrawIndirectCount" :type uint32)
    (maxsamplerlodbias :name "maxSamplerLodBias" :type float)
    (maxsampleranisotropy :name "maxSamplerAnisotropy" :type float)
    (maxviewports :name "maxViewports" :type uint32)
    (maxviewportdimensions :name "maxViewportDimensions" :type uint32
			   :create ((maxviewportdimensions-arg)
				    (create-array :uint32 maxviewportdimensions maxviewportdimensions-arg :dynamic nil :pointers nil))
			   :get ((&optional maxviewportdimensions-index)
				 (get-array :uint32 maxviewportdimensions maxviewportdimensions-index 2 :pointers nil))
			   :set ((maxviewportdimensions-arg &optional maxviewportdimensions-index)
				 (set-array :uint32 maxviewportdimensions maxviewportdimensions-arg maxviewportdimensions-index :dynamic nil :pointers nil)))
    (viewportboundsrange :name "viewportBoundsRange" :type float
			 :create ((viewportboundsrange-arg)
				  (create-array :float viewportboundsrange viewportboundsrange-arg :dynamic nil :pointers nil))
			 :get ((&optional viewportboundsrange-index)
			       (get-array :float viewportboundsrange viewportboundsrange-index 2 :pointers nil))
			 :set ((viewportboundsrange-arg &optional viewportboundsrange-index)
			       (set-array :float viewportboundsrange viewportboundsrange-arg viewportboundsrange-index :dynamic nil :pointers nil)))
    (viewportsubpixelbits :name "viewportSubPixelBits" :type uint32)
    (minmemorymapalignment :name "minMemoryMapAlignment" :type size)
    (mintexelbufferoffsetalignment :name "minTexelBufferOffsetAlignment" :type "VkDeviceSize")
    (minuniformbufferoffsetalignment :name "minUniformBufferOffsetAlignment" :type "VkDeviceSize")
    (minstoragebufferoffsetalignment :name "minStorageBufferOffsetAlignment" :type "VkDeviceSize")
    (mintexeloffset :name "minTexelOffset" :type int32)
    (maxtexeloffset :name "maxTexelOffset" :type uint32)
    (mintexelgatheroffset :name "minTexelGatherOffset" :type int32)
    (maxtexelgatheroffset :name "maxTexelGatherOffset" :type uint32)
    (mininterpolationoffset :name "minInterpolationOffset" :type float)
    (maxinterpolationoffset :name "maxInterpolationOffset" :type float)
    (subpixelinterpolationoffsetbits :name "subPixelInterpolationOffsetBits" :type uint32)
    (maxframebufferwidth :name "maxFramebufferWidth" :type uint32)
    (maxframebufferheight :name "maxFramebufferHeight" :type uint32)
    (maxframebufferlayers :name "maxFramebufferLayers" :type uint32)
    (framebuffercolorsamplecounts :name "framebufferColorSampleCounts" :type "VkSampleCountFlags")
    (framebufferdepthsamplecounts :name "framebufferDepthSampleCounts" :type "VkSampleCountFlags")
    (framebufferstencilsamplecounts :name "framebufferStencilSampleCounts" :type "VkSampleCountFlags")
    (framebuffernoattachmentssamplecounts :name "framebufferNoAttachmentsSampleCounts" :type "VkSampleCountFlags")
    (maxcolorattachments :name "maxColorAttachments" :type uint32)
    (sampledimagecolorsamplecounts :name "sampledImageColorSampleCounts" :type "VkSampleCountFlags")
    (sampledimageintegersamplecounts :name "sampledImageIntegerSampleCounts" :type "VkSampleCountFlags")
    (sampledimagedepthsamplecounts :name "sampledImageDepthSampleCounts" :type "VkSampleCountFlags")
    (sampledimagestencilsamplecounts :name "sampledImageStencilSampleCounts" :type "VkSampleCountFlags")
    (storageimagesamplecounts :name "storageImageSampleCounts" :type "VkSampleCountFlags")
    (maxsamplemaskwords :name "maxSampleMaskWords" :type uint32)
    (timestampcomputeandgraphics :name "timestampComputeAndGraphics" :type "VkBool32")
    (timestampperiod :name "timestampPeriod" :type float)
    (maxclipdistances :name "maxClipDistances" :type uint32)
    (maxculldistances :name "maxCullDistances" :type uint32)
    (maxcombinedclipandculldistances :name "maxCombinedClipAndCullDistances" :type uint32)
    (discretequeuepriorities :name "discreteQueuePriorities" :type uint32)
    (pointsizerange :name "pointSizeRange" :type float
		    :create ((pointsizerange-arg)
			     (create-array :float pointsizerange pointsizerange-arg :dynamic nil :pointers nil))
		    :get ((&optional pointsizerange-index)
			  (get-array :float pointsizerange pointsizerange-index 2 :pointers nil))
		    :set ((pointsizerange-arg &optional pointsizerange-index)
			  (set-array :float pointsizerange pointsizerange-arg pointsizerange-index :dynamic nil :pointers nil)))
    (linewidthrange :name "lineWidthRange" :type float
		    :create ((linewidthrange-arg)
			     (create-array :float linewidthrange linewidthrange-arg :dynamic nil :pointers nil))
		    :get ((&optional linewidthrange-index)
			  (get-array :float linewidthrange linewidthrange-index 2 :pointers nil))
		    :set ((linewidthrange-arg &optional linewidthrange-index)
			  (set-array :float linewidthrange linewidthrange-arg linewidthrange-index :dynamic nil :pointers nil)))
    (pointsizegranularity :name "pointSizeGranularity" :type float)
    (linewidthgranularity :name "lineWidthGranularity" :type float)
    (strictlines :name "strictLines" :type "VkBool32")
    (standardsamplelocations :name "standardSampleLocations" :type "VkBool32")
    (optimalbuffercopyoffsetalignment :name "optimalBufferCopyOffsetAlignment" :type "VkDeviceSize")
    (optimalbuffercopyrowpitchalignment :name "optimalBufferCopyRowPitchAlignment" :type "VkDeviceSize")
    (noncoherentatomsize :name "nonCoherentAtomSize" :type "VkDeviceSize"))


  (more-cffi:def-foreign-struct doc-file "VkPhysicalDeviceSparseProperties" (physical-device-sparse-properties)
      (:default-create :default-get :default-set)
    (residencystandard2dblockshape :name "residencyStandard2DBlockShape" :type "VkBool32")
    (residencystandard2dmultisampleblockshape :name "residencyStandard2DMultisampleBlockShape" :type "VkBool32")
    (residencystandard3dblockshape :name "residencyStandard3DBlockShape" :type "VkBool32")
    (residencyalignedmipsize :name "residencyAlignedMipSize" :type "VkBool32")
    (residencynonresidentstrict :name "residencyNonResidentStrict" :type "VkBool32"))


  (more-cffi:def-foreign-struct doc-file "VkPhysicalDeviceFeatures" (physical-device-features)
      (:default-create :default-get :default-set)
    (robustbufferaccess :name "robustBufferAccess" :type "VkBool32")
    (fulldrawindexuint32 :name "fullDrawIndexUint32" :type "VkBool32")
    (imagecubearray :name "imageCubeArray" :type "VkBool32")
    (independentblend :name "independentBlend" :type "VkBool32")
    (geometryshader :name "geometryShader" :type "VkBool32")
    (tessellationshader :name "tessellationShader" :type "VkBool32")
    (samplerateshading :name "sampleRateShading" :type "VkBool32")
    (dualsrcblend :name "dualSrcBlend" :type "VkBool32")
    (logicop :name "logicOp" :type "VkBool32")
    (multidrawindirect :name "multiDrawIndirect" :type "VkBool32")
    (drawindirectfirstinstance :name "drawIndirectFirstInstance" :type "VkBool32")
    (depthclamp :name "depthClamp" :type "VkBool32")
    (depthbiasclamp :name "depthBiasClamp" :type "VkBool32")
    (fillmodenonsolid :name "fillModeNonSolid" :type "VkBool32")
    (depthbounds :name "depthBounds" :type "VkBool32")
    (widelines :name "wideLines" :type "VkBool32")
    (largepoints :name "largePoints" :type "VkBool32")
    (alphatoone :name "alphaToOne" :type "VkBool32")
    (multiviewport :name "multiViewport" :type "VkBool32")
    (sampleranisotropy :name "samplerAnisotropy" :type "VkBool32")
    (texturecompressionetc2 :name "textureCompressionETC2" :type "VkBool32")
    (texturecompressionastc_ldr :name "textureCompressionASTC_LDR" :type "VkBool32")
    (texturecompressionbc :name "textureCompressionBC" :type "VkBool32")
    (occlusionqueryprecise :name "occlusionQueryPrecise" :type "VkBool32")
    (pipelinestatisticsquery :name "pipelineStatisticsQuery" :type "VkBool32")
    (vertexpipelinestoresandatomics :name "vertexPipelineStoresAndAtomics" :type "VkBool32")
    (fragmentstoresandatomics :name "fragmentStoresAndAtomics" :type "VkBool32")
    (shadertessellationandgeometrypointsize :name "shaderTessellationAndGeometryPointSize" :type "VkBool32")
    (shaderimagegatherextended :name "shaderImageGatherExtended" :type "VkBool32")
    (shaderstorageimageextendedformats :name "shaderStorageImageExtendedFormats" :type "VkBool32")
    (shaderstorageimagemultisample :name "shaderStorageImageMultisample" :type "VkBool32")
    (shaderstorageimagereadwithoutformat :name "shaderStorageImageReadWithoutFormat" :type "VkBool32")
    (shaderstorageimagewritewithoutformat :name "shaderStorageImageWriteWithoutFormat" :type "VkBool32")
    (shaderuniformbufferarraydynamicindexing :name "shaderUniformBufferArrayDynamicIndexing" :type "VkBool32")
    (shadersampledimagearraydynamicindexing :name "shaderSampledImageArrayDynamicIndexing" :type "VkBool32")
    (shaderstoragebufferarraydynamicindexing :name "shaderStorageBufferArrayDynamicIndexing" :type "VkBool32")
    (shaderstorageimagearraydynamicindexing :name "shaderStorageImageArrayDynamicIndexing" :type "VkBool32")
    (shaderclipdistance :name "shaderClipDistance" :type "VkBool32")
    (shaderculldistance :name "shaderCullDistance" :type "VkBool32")
    (shaderfloat64 :name "shaderFloat64" :type "VkBool32")
    (shaderint64 :name "shaderInt64" :type "VkBool32")
    (shaderint16 :name "shaderInt16" :type "VkBool32")
    (shaderresourceresidency :name "shaderResourceResidency" :type "VkBool32")
    (shaderresourceminlod :name "shaderResourceMinLod" :type "VkBool32")
    (sparsebinding :name "sparseBinding" :type "VkBool32")
    (sparseresidencybuffer :name "sparseResidencyBuffer" :type "VkBool32")
    (sparseresidencyimage2d :name "sparseResidencyImage2D" :type "VkBool32")
    (sparseresidencyimage3d :name "sparseResidencyImage3D" :type "VkBool32")
    (sparseresidency2samples :name "sparseResidency2Samples" :type "VkBool32")
    (sparseresidency4samples :name "sparseResidency4Samples" :type "VkBool32")
    (sparseresidency8samples :name "sparseResidency8Samples" :type "VkBool32")
    (sparseresidency16samples :name "sparseResidency16Samples" :type "VkBool32")
    (sparseresidencyaliased :name "sparseResidencyAliased" :type "VkBool32")
    (variablemultisamplerate :name "variableMultisampleRate" :type "VkBool32")
    (inheritedqueries :name "inheritedQueries" :type "VkBool32"))


  (more-cffi:def-foreign-struct doc-file "VkQueueFamilyProperties" (queue-family-properties)
      (:default-create :default-get :default-set)
    (queueflags :name "queueFlags" :type "VkQueueFlags")
    (queuecount :name "queueCount" :type uint32)
    (timestampvalidbits :name "timestampValidBits" :type uint32)
    (minimagetransfergranularity :pointer t :name "minImageTransferGranularity"
				 :type "VkExtent3D"
				 :create ((minimagetransfergranularity-arg)
					  (more-cffi:copy minimagetransfergranularity minimagetransfergranularity-arg '(:struct vkextent3d)))
				 :set ((minimagetransfergranularity-arg)
				       (more-cffi:copy minimagetransfergranularity minimagetransfergranularity-arg '(:struct vkextent3d)))))


  (more-cffi:def-foreign-struct doc-file "VkDeviceQueueCreateInfo" (device-queue-create-info)
      (:default-create :default-get :default-set)
    (stype :name "sType" :type "VkStructureType")
    (pnext :name "pNext" :type void :init-form nil
	   :create ((pnext-arg)
		    (create-pointer pnext pnext-arg))
	   :get (nil (get-pointer pnext))
	   :set ((pnext-arg)
		 (set-pointer pnext pnext-arg)))
    (flags :name flags :type "VkDeviceQueueCreateFlags")
    (queuefamilyindex :name "queueFamilyIndex" :type uint32)
    (queuecount :name "queueCount" :type uint32)
    (pqueuepriorities :name "pQueuePriorities" :type (list float) :init-form nil
		      :create ((pqueuepriorities-arg)
			       (create-array :float pqueuepriorities pqueuepriorities-arg :dynamic t :pointers nil))
		      :destroy (destroy-array pqueuepriorities)
		      :get ((&optional pqueuepriorities-index)
			    (get-array :float pqueuepriorities pqueuepriorities-index queuecount :pointers nil))
		      :set ((pqueuepriorities-arg &optional pqueuepriorities-index)
			    (set-array :float pqueuepriorities pqueuepriorities-arg pqueuepriorities-index :dynamic t :pointers nil))))


  (more-cffi:def-foreign-struct doc-file "VkDeviceCreateInfo" (device-create-info)
      (:default-create :default-get :default-set)
    (stype :name "sType" :type "VkStructureType")
    (pnext :name "pNext" :type "vulkan object" :init-form nil
	   :create ((pnext-arg)
		    (create-pointer pnext pnext-arg))
	   :get (nil (get-pointer pnext))
	   :set ((pnext-arg)
		 (set-pointer pnext pnext-arg)))
    (flags :name flags :type "VkDeviceCreateFlags")
    (queuecreateinfocount :name "queueCreateInfoCount" :type uint32)
    (pqueuecreateinfos :name "pQueueCreateInfos" :type (list "VkDeviceQueueCreateInfo") :init-form nil
		       :create ((pqueuecreateinfos-arg)
				(create-array (:struct vkdevicequeuecreateinfo) pqueuecreateinfos pqueuecreateinfos-arg :dynamic t :pointers t))
		       :destroy (destroy-array pqueuecreateinfos)
		       :get ((&optional pqueuecreateinfos-index)
			     (get-array (:struct vkdevicequeuecreateinfo) pqueuecreateinfos pqueuecreateinfos-index queuecreateinfocount :pointers t))
		       :set ((pqueuecreateinfos-arg &optional pqueuecreateinfos-index)
			     (set-array (:struct vkdevicequeuecreateinfo) pqueuecreateinfos pqueuecreateinfos-arg pqueuecreateinfos-index :dynamic t :pointers t)))
    (enabledlayercount :name "enabledLayerCount" :type uint32)
    (ppenabledlayernames :name "ppEnabledLayerNames" :type (list string) :init-form nil
			 :create ((ppenabledlayernames-arg)
				  (create-array-strings ppenabledlayernames ppenabledlayernames-arg :dynamic t))
			 :destroy (destroy-array-strings ppenabledlayernames enabledlayercount :dynamic t)
			 :get ((&optional ppenabledlayernames-index)
			       (get-array-strings ppenabledlayernames ppenabledlayernames-index enabledlayercount))
			 :set ((ppenabledlayernames-arg &optional ppenabledlayernames-index)
			       (set-array-strings ppenabledlayernames ppenabledlayernames-arg ppenabledlayernames-index enabledlayercount :dynamic t)))
    (enabledextensioncount :name "enabledExtensionCount" :type uint32)
    (ppenabledextensionnames :name "ppEnabledExtensionNames" :type (list string) :init-form nil
			     :create ((ppenabledextensionnames-arg)
				      (create-array-strings ppenabledextensionnames ppenabledextensionnames-arg :dynamic t))
			     :destroy (destroy-array-strings ppenabledextensionnames enabledextensioncount :dynamic t)
			     :get ((&optional ppenabledextensionnames-index)
				   (get-array-strings ppenabledextensionnames ppenabledextensionnames-index enabledextensioncount))
			     :set ((ppenabledextensionnames-arg &optional ppenabledextensionnames-index)
				   (set-array-strings ppenabledextensionnames ppenabledextensionnames-arg ppenabledextensionnames-index enabledextensioncount :dynamic t)))
    (penabledfeatures :name "pEnabledFeatures" :type "VkPhysicalDeviceFeatures" :init-form nil
		      :create ((penabledfeatures-arg)
			       (create-pointer penabledfeatures penabledfeatures-arg))
		      :get (nil (get-pointer penabledfeatures))
		      :set ((penabledfeatures-arg)
			    (set-pointer penabledfeatures penabledfeatures-arg))))


  (more-cffi:def-foreign-struct doc-file "VkSurfaceCapabilitiesKHR" (surface-capabilities-khr)
      (:default-create :default-get :default-set)
    (minimagecount :name "minImageCount" :type uint32)
    (maximagecount :name "maxImageCount" :type uint32)
    (currentextent :pointer t :name "currentExtent" :type "VkExtent2D"
		   :create ((currentextent-arg)
			    (more-cffi:copy currentextent currentextent-arg '(:struct vkextent2d)))
		   :set ((currentextent-arg)
			 (more-cffi:copy currentextent currentextent-arg '(:struct vkextent2d))))
    (minimageextent :pointer t :name "minImageExtent" :type "VkExtent2D"
		    :create ((minimageextent-arg)
			     (more-cffi:copy minimageextent minimageextent-arg '(:struct vkextent2d)))
		    :set ((minimageextent-arg)
			  (more-cffi:copy minimageextent minimageextent-arg '(:struct vkextent2d))))
    (maximageextent :pointer t :name "maxImageExtent" :type "VkExtent2D"
		    :create ((maximageextent-arg)
			     (more-cffi:copy maximageextent maximageextent-arg '(:struct vkextent2d)))
		    :set ((maximageextent-arg)
			  (more-cffi:copy maximageextent maximageextent-arg '(:struct vkextent2d))))
    (maximagearraylayers :name "maxImageArrayLayers" :type uint32)
    (supportedtransforms :name "supportedTransforms" :type "VkSurfaceTransformFlagsKHR")
    (currenttransform :name "currentTransform" :type "VkSurfaceTransformFlagBitsKHR")
    (supportedcompositealpha :name "supportedCompositeAlpha" :type "VkCompositeAlphaFlagsKHR")
    (supportedusageflags :name "supportedUsageFlags" :type "VkImageUsageFlags"))


  (more-cffi:def-foreign-struct doc-file "VkSurfaceFormatKHR" (surface-format-khr)
      (:default-create :default-get :default-set)
    (format :name format :type "VkFormat")
    (colorspace :name "colorSpace" :type "VkColorSpaceKHR"))


  (more-cffi:def-foreign-struct doc-file "VkShaderModuleCreateInfo" (shader-module-create-info)
      (:default-create :default-get :default-set)
    (stype :name "sType" :type "VkStructureType")
    (pnext :name "pNext" :type void :init-form nil
	   :create ((pnext-arg)
		    (create-pointer pnext pnext-arg))
	   :get (nil (get-pointer pnext))
	   :set ((pnext-arg)
		 (set-pointer pnext pnext-arg)))
    (flags :name flags :type "VkShaderModuleCreateFlags")
    (codesize :name "codeSize" :type size)
    (pcode :name "pCode" :type uint32 :init-form nil
	   :create ((pcode-arg)
		    (create-pointer pcode pcode-arg))
	   :get (nil (get-pointer pcode))
	   :set ((pcode-arg)
		 (set-pointer pcode pcode-arg))))


  (more-cffi:def-foreign-struct doc-file "VkImageViewCreateInfo" (image-view-create-info)
      (:default-create :default-get :default-set)
    (stype :name "sType" :type "VkStructureType")
    (pnext :name "pNext" :type void :init-form nil
	   :create ((pnext-arg)
		    (create-pointer pnext pnext-arg))
	   :get (nil (get-pointer pnext))
	   :set ((pnext-arg)
		 (set-pointer pnext pnext-arg)))
    (flags :name flags :type "VkImageViewCreateFlags")
    (image :name image :type "VkImage"
	   :create ((image-arg)
		    (create-pointer image image-arg))
	   :get (nil (get-pointer image))
	   :set ((image-arg)
		 (set-pointer image image-arg)))
    (viewtype :name "viewType" :type "VkImageViewType")
    (format :name format :type "VkFormat")
    (components :pointer t :name components :type "VkComponentMapping"
		:create ((components-arg)
			 (more-cffi:copy components components-arg '(:struct vkcomponentmapping)))
		:set ((components-arg)
		      (more-cffi:copy components components-arg '(:struct vkcomponentmapping))))
    (subresourcerange :pointer t :name "subresourceRange" :type "VkImageSubresourceRange"
		      :create ((subresourcerange-arg)
			       (more-cffi:copy subresourcerange subresourcerange-arg '(:struct vkimagesubresourcerange)))
		      :set ((subresourcerange-arg)
			    (more-cffi:copy subresourcerange subresourcerange-arg '(:struct vkimagesubresourcerange))))))


