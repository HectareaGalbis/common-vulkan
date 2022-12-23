
(in-package :cvk)

(adp:in-file #P"docs/api/structs")

(adp:header "Structs" structs-header)


(defmacro vulkan-defstruct (struct-types infix options &body slot-descriptors)
  (let* ((struct-or-union (car struct-types))
	 (foreign-struct-definitions (loop for struct-type in (cdr struct-types)
					   collect `(mcffi:define-foreign-struct ,(list struct-or-union struct-type) ,infix
							,options
						      ,@slot-descriptors))))
    `(progn
       ,@foreign-struct-definitions)))


(adp:subsubheader "VkExtent2D")

(vulkan-defstruct (:struct VkExtent2D) extent-2d
    (:default-constructors :default-readers :default-writers)
  width
  height)


(adp:subsubheader "VkExtent3D")

(vulkan-defstruct (:struct VkExtent3D) extent-3d
    (:default-constructors :default-readers :default-writers)
  width
  height
  depth)


(adp:subsubheader "VkOffset2D")

(vulkan-defstruct (:struct VkOffset2D) offset-2d
    (:default-constructors :default-readers :default-writers)
  x
  y)


(adp:subsubheader "VkOffset3D")

(vulkan-defstruct (:struct VkOffset3D) offset-3d
    (:default-constructors :default-readers :default-writers)
  x
  y
  z)


(adp:subsubheader "VkRect2D")

(vulkan-defstruct (:struct VkRect2D) rect-2d
    (:default-constructors :default-readers :default-writers)
  (offset :pointer t
	  :constructor ((offset-arg)
			(memcpy offset offset-arg (cffi:foreign-type-size '(:struct VkOffset2D))))
	  :writer ((offset-arg)
		   (memcpy offset offset-arg (cffi:foreign-type-size '(:struct VkOffset2D)))))
  (extent :pointer t
	  :constructor ((extent-arg)
			(memcpy extent extent-arg (cffi:foreign-type-size '(:struct VkExtent2D))))
	  :writer ((extent-arg)
		   (memcpy extent extent-arg (cffi:foreign-type-size '(:struct VkExtent2D))))))


(adp:subsubheader "VkBaseInStructure")

(vulkan-defstruct (:struct VkBaseInStructure) base-in-structure
    (:default-constructors :default-readers :default-writers)
  sType
  (pNext :constructor ((pNext-arg)
		       (setf pNext (or pNext-arg (cffi:null-pointer))))
	 :reader (() (if (cffi:null-pointer-p pNext)
			 nil
			 pNext))
	 :writer ((pNext-arg)
		  (setf pNext (or pNext-arg (cffi:null-pointer))))))


(adp:subsubheader "VkBaseOutStructure")

(vulkan-defstruct (:struct VkBaseOutStructure) base-out-structure
    (:default-constructors :default-readers :default-writers)
  sType
  (pNext :constructor ((pNext-arg)
		       (setf pNext (or pNext-arg (cffi:null-pointer))))
	 :reader (() (if (cffi:null-pointer-p pNext)
			 nil
			 pNext))
	 :writer ((pNext-arg)
		  (setf pNext (or pNext-arg (cffi:null-pointer))))))


(adp:subsubheader "VkBufferMemoryBarrier")

(vulkan-defstruct (:struct VkBufferMemoryBarrier) buffer-memory-barrier
    (:default-constructors :default-readers :default-writers)
  sType
  (pNext :constructor ((pNext-arg)
		       (setf pNext (or pNext-arg (cffi:null-pointer))))
	 :reader (() (if (cffi:null-pointer-p pNext)
			 nil
			 pNext))
	 :writer ((pNext-arg)
		  (setf pNext (or pNext-arg (cffi:null-pointer)))))
  srcAccessMask
  dstAccessMask
  srcQueueFamilyIndex
  dstQueueFamilyIndex
  (buffer :constructor ((buffer-arg)
			(setf buffer (or buffer-arg (cffi:null-pointer))))
	  :reader (() (if (cffi:null-pointer-p buffer)
			  nil
			  buffer))
	  :writer ((buffer-arg)
		   (setf buffer (or buffer-arg (cffi:null-pointer)))))
  offset
  size)


(adp:subsubheader "VkDispatchIndirectCommand")

(vulkan-defstruct (:struct VkDispatchIndirectCommand) dispatch-indirect-command
    (:default-constructors :default-readers :default-writers)
  x
  y
  z)


(adp:subsubheader "VkDrawIndexedIndirectCommand")

(vulkan-defstruct (:struct VkDrawIndexedIndirectCommand) draw-indexed-indirect-command
    (:default-constructors :default-readers :default-writers)
  indexCount
  instanceCount
  firstIndex
  vertexOffset
  firstInstance)


(adp:subsubheader "VkDrawIndirectCommand")

(vulkan-defstruct (:struct VkDrawIndirectCommand) draw-indirect-command
    (:default-constructors :default-readers :default-writers)
  vertexCount
  instanceCount
  firstVertex
  firstInstance)


(adp:subsubheader "VkImageSubresourceRange")

(vulkan-defstruct (:struct VkImageSubresourceRange) image-subresource-range
    (:default-constructors :default-readers :default-writers)
  aspectMask
  baseMipLevel
  levelCount
  baseArrayLayer
  layerCount)

;; (defmacro create-pointer (slot slot-arg)
;;   `(setf ,slot (or ,slot-arg (cffi-sys:null-pointer))))

;; (defmacro get-pointer (slot)
;;   `(if (cffi-sys:null-pointer-p ,slot)
;;        nil
;;        ,slot))

;; (defmacro set-pointer (slot new-value)
;;   `(setf ,slot (or ,new-value (cffi-sys:null-pointer))))

;; (defmacro create-string (slot slot-arg &key (dynamic nil))
;;   (if dynamic
;;       `(setf ,slot
;;                (if ,slot-arg
;;                    (cffi:foreign-string-alloc ,slot-arg)
;;                    (cffi-sys:null-pointer)))
;;       (let ((str-sym (gensym)))
;;         `(cffi:with-foreign-string (,str-sym ,slot-arg)
;;            (more-cffi:memcpy ,slot ,str-sym (1+ (length ,slot-arg)))))))

;; (defmacro destroy-string (slot)
;;   `(when (not (cffi-sys:null-pointer-p ,slot))
;;      (cffi:foreign-string-free ,slot)))

;; (defmacro get-string (slot) `(cffi:foreign-string-to-lisp ,slot))

;; (defmacro set-string (slot new-value &key (dynamic nil))
;;   `(progn
;;     ,(when dynamic `(destroy-string ,slot))
;;     (create-string ,slot ,new-value)))

;; (defmacro create-array (type slot slot-arg &key (dynamic nil) (pointers nil))
;;   `(progn
;;     ,@(when dynamic
;;         `((setf ,slot
;;                   (if ,slot-arg
;;                       (cffi:foreign-alloc ',type :count (length ,slot-arg))
;;                       (cffi-sys:null-pointer)))))
;;     ,(let ((i (gensym)) (elem (gensym)))
;;        `(iter
;;           (for ,i from 0 below (length ,slot-arg))
;;           (for ,elem in ,slot-arg)
;;           ,(if pointers
;;                `(more-cffi:memcpy (cffi:mem-aptr ,slot ',type ,i) ,elem
;;                                   (cffi:foreign-type-size ',type))
;;                `(setf (cffi:mem-aref ,slot ',type ,i) ,elem))))))

;; (defmacro destroy-array (slot)
;;   `(when (not (cffi-sys:null-pointer-p ,slot)) (cffi-sys:foreign-free ,slot)))

;; (defmacro get-array (type slot index count &key (pointers nil))
;;   `(if (cffi-sys:null-pointer-p ,slot)
;;        nil
;;        (if ,index
;;            ,(if pointers
;;                 `(cffi:mem-aptr ,slot ',type ,index)
;;                 `(cffi:mem-aref ,slot ',type ,index))
;;            ,(let ((i (gensym)))
;;               `(iter
;;                  (for ,i from 0 below ,count)
;;                  (collect
;;                   ,(if pointers
;;                        `(cffi:mem-aptr ,slot ',type ,i)
;;                        `(cffi:mem-aref ,slot ',type ,i))))))))

;; (defmacro set-array
;;           (type slot new-value index &key (dynamic nil) (pointers nil))
;;   `(if ,index
;;        ,(if pointers
;;             `(more-cffi:memcpy (cffi:mem-aptr ,slot ',type ,index) ,new-value
;;                                (cffi:foreign-type-size ',type))
;;             `(setf (cffi:mem-aref ,slot ',type ,index) ,new-value))
;;        (progn
;;         (destroy-array ,slot)
;;         (create-array ,type ,slot ,new-value :dynamic ,dynamic :pointers
;;          ,pointers))))

;; (defmacro create-array-strings (slot slot-arg &key (dynamic nil))
;;   `(progn
;;     ,@(when dynamic
;;         `((setf ,slot
;;                   (if ,slot-arg
;;                       (cffi:foreign-alloc :pointer :count (length ,slot-arg))
;;                       (cffi-sys:null-pointer)))))
;;     ,(let ((i (gensym)) (elem (gensym)))
;;        `(iter
;;           (for ,i from 0 below (length ,slot-arg))
;;           (for ,elem in ,slot-arg)
;;           (setf (cffi:mem-aref ,slot :pointer ,i)
;;                   (cffi:foreign-string-alloc ,elem))))))

;; (defmacro destroy-array-strings (slot count &key dynamic)
;;   `(when (not (cffi-sys:null-pointer-p ,slot))
;;      ,(let ((i (gensym)))
;;         `(iter
;;            (for ,i from 0 below ,count)
;;            (cffi:foreign-string-free (cffi:mem-aref ,slot :pointer ,i))))
;;      ,(when dynamic `(cffi-sys:foreign-free ,slot))))

;; (defmacro get-array-strings (slot index count)
;;   `(if (cffi-sys:null-pointer-p ,slot)
;;        nil
;;        (if ,index
;;            (cffi:foreign-string-to-lisp (cffi:mem-aref ,slot :pointer ,index))
;;            ,(let ((i (gensym)))
;;               `(iter
;;                  (for ,i from 0 below ,count)
;;                  (collect
;;                   (cffi:foreign-string-to-lisp
;;                    (cffi:mem-aref ,slot :pointer ,i))))))))

;; (defmacro set-array-strings (slot new-value index count &key (dynamic nil))
;;   `(if ,index
;;        (progn
;;         (cffi:foreign-string-free (cffi:mem-aref ,slot :pointer ,index))
;;         (setf (cffi:mem-aref ,slot :pointer ,index) ,new-value))
;;        (progn
;;         (destroy-array-strings ,slot ,count :dynamic ,dynamic)
;;         (create-array-strings ,slot ,new-value :dynamic ,dynamic))))

;; (defun copy-object (slot slot-arg type)
;;   (more-cffi:memcpy slot slot-arg (cffi:foreign-type-size type)))

;; (more-cffi:with-doc-file (doc-file
;;                           (asdf/system:system-relative-pathname "common-vulkan"
;;                                                                 "docs/api/structs.md"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExtent2D"
;;       (extent-2d)
;;       (:default-create :default-get :default-set)
;;     (width :name width :type uint32)
;;     (height :name height :type uint32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExtent3D"
;;       (extent-3d)
;;       (:default-create :default-get :default-set)
;;     (width :name width :type uint32)
;;     (height :name height :type uint32)
;;     (depth :name depth :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkOffset2D"
;;       (offset-2d)
;;       (:default-create :default-get :default-set)
;;     (x :name x :type int32)
;;     (y :name y :type int32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkOffset3D"
;;       (offset-3d)
;;       (:default-create :default-get :default-set)
;;     (x :name x :type int32)
;;     (y :name y :type int32)
;;     (z :name z :type int32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRect2D"
;;       (rect-2d)
;;       (:default-create :default-get :default-set)
;;     (offset :pointer t :name offset :type "VkOffset2D" :create
;;      ((offset-arg) (copy-object offset offset-arg '(:struct vkoffset2d))) :set
;;      ((offset-arg) (copy-object offset offset-arg '(:struct vkoffset2d))))
;;     (extent :pointer t :name extent :type "VkExtent2D" :create
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent2d))) :set
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent2d)))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBaseInStructure"
;;       (base-in-structure)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "VkBaseInStructure" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set
;;      ((pnext-arg) (set-pointer pnext pnext-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBaseOutStructure"
;;       (base-out-structure)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "VkBaseOutStructure" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set
;;      ((pnext-arg) (set-pointer pnext pnext-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferMemoryBarrier"
;;       (buffer-memory-barrier)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcaccessmask :name "srcAccessMask" :type "VkAccessFlags")
;;     (dstaccessmask :name "dstAccessMask" :type "VkAccessFlags")
;;     (srcqueuefamilyindex :name "srcQueueFamilyIndex" :type uint32)
;;     (dstqueuefamilyindex :name "dstQueueFamilyIndex" :type uint32)
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg)))
;;     (offset :name offset :type "VkDeviceSize")
;;     (size :name size :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDispatchIndirectCommand"
;;       (dispatch-indirect-command)
;;       (:default-create :default-get :default-set)
;;     (x :name x :type uint32)
;;     (y :name y :type uint32)
;;     (z :name z :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDrawIndexedIndirectCommand"
;;       (draw-indexed-indirect-command)
;;       (:default-create :default-get :default-set)
;;     (indexcount :name "indexCount" :type uint32)
;;     (instancecount :name "instanceCount" :type uint32)
;;     (firstindex :name "firstIndex" :type uint32)
;;     (vertexoffset :name "vertexOffset" :type int32)
;;     (firstinstance :name "firstInstance" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDrawIndirectCommand"
;;       (draw-indirect-command)
;;       (:default-create :default-get :default-set)
;;     (vertexcount :name "vertexCount" :type uint32)
;;     (instancecount :name "instanceCount" :type uint32)
;;     (firstvertex :name "firstVertex" :type uint32)
;;     (firstinstance :name "firstInstance" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageSubresourceRange"
;;       (image-subresource-range)
;;       (:default-create :default-get :default-set)
;;     (aspectmask :name "aspectMask" :type "VkImageAspectFlags")
;;     (basemiplevel :name "baseMipLevel" :type uint32)
;;     (levelcount :name "levelCount" :type uint32)
;;     (basearraylayer :name "baseArrayLayer" :type uint32)
;;     (layercount :name "layerCount" :type uint32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageMemoryBarrier"
;;       (image-memory-barrier)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcaccessmask :name "srcAccessMask" :type "VkAccessFlags")
;;     (dstaccessmask :name "dstAccessMask" :type "VkAccessFlags")
;;     (oldlayout :name "oldLayout" :type "VkImageLayout")
;;     (newlayout :name "newLayout" :type "VkImageLayout")
;;     (srcqueuefamilyindex :name "srcQueueFamilyIndex" :type uint32)
;;     (dstqueuefamilyindex :name "dstQueueFamilyIndex" :type uint32)
;;     (image :name image :type "VkImage" :create
;;      ((image-arg) (create-pointer image image-arg)) :get
;;      (nil (get-pointer image)) :set ((image-arg) (set-pointer image image-arg)))
;;     (subresourcerange :pointer t :name "subresourceRange" :type
;;      "VkImageSubresourceRange" :create
;;      ((subresourcerange-arg)
;;       (copy-object subresourcerange subresourcerange-arg
;;        '(:struct vkimagesubresourcerange)))
;;      :set
;;      ((subresourcerange-arg)
;;       (copy-object subresourcerange subresourcerange-arg
;;        '(:struct vkimagesubresourcerange)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryBarrier"
;;       (memory-barrier)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcaccessmask :name "srcAccessMask" :type "VkAccessFlags")
;;     (dstaccessmask :name "dstAccessMask" :type "VkAccessFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineCacheHeaderVersionOne"
;;       (pipeline-cache-header-version-one)
;;       (:default-create :default-get :default-set)
;;     (headersize :name "headerSize" :type uint32)
;;     (headerversion :name "headerVersion" :type "VkPipelineCacheHeaderVersion")
;;     (vendorid :name "vendorID" :type uint32)
;;     (deviceid :name "deviceID" :type uint32)
;;     (pipelinecacheuuid :name "pipelineCacheUUID" :type uint8 :create
;;      ((pipelinecacheuuid-arg)
;;       (create-array :uint8 pipelinecacheuuid pipelinecacheuuid-arg :dynamic nil
;;        :pointers nil))
;;      :get
;;      ((&optional pipelinecacheuuid-index)
;;       (get-array :uint8 pipelinecacheuuid pipelinecacheuuid-index 16 :pointers
;;        nil))
;;      :set
;;      ((pipelinecacheuuid-arg &optional pipelinecacheuuid-index)
;;       (set-array :uint8 pipelinecacheuuid pipelinecacheuuid-arg
;;        pipelinecacheuuid-index :dynamic nil :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAllocationCallbacks"
;;       (allocation-callbacks)
;;       (:default-create :default-get :default-set)
;;     (puserdata :name "pUserData" :type void :init-form nil :create
;;      ((puserdata-arg) (create-pointer puserdata puserdata-arg)) :get
;;      (nil (get-pointer puserdata)) :set
;;      ((puserdata-arg) (set-pointer puserdata puserdata-arg)))
;;     (pfnallocation :name "pfnAllocation" :type "PFN_vkAllocationFunction")
;;     (pfnreallocation :name "pfnReallocation" :type "PFN_vkReallocationFunction")
;;     (pfnfree :name "pfnFree" :type "PFN_vkFreeFunction")
;;     (pfninternalallocation :name "pfnInternalAllocation" :type
;;      "PFN_vkInternalAllocationNotification")
;;     (pfninternalfree :name "pfnInternalFree" :type
;;      "PFN_vkInternalFreeNotification"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkApplicationInfo"
;;       application-info
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType" :init-form
;;      vk_structure_type_application_info)
;;     (pnext :name "pNext" :type "vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (papplicationname :name "pApplicationName" :type string :init-form nil
;;      :create
;;      ((papplicationname-arg)
;;       (create-string papplicationname papplicationname-arg :dynamic t))
;;      :destroy (destroy-string papplicationname) :get
;;      (nil (get-string papplicationname)) :set
;;      ((papplicationname-arg)
;;       (set-string papplicationname papplicationname-arg :dynamic t)))
;;     (applicationversion :name "applicationVersion" :type uint32 :init-form 0)
;;     (penginename :name "pEngineName" :type string :init-form nil :create
;;      ((penginename-arg) (create-string penginename penginename-arg :dynamic t))
;;      :destroy (destroy-string penginename) :get (nil (get-string penginename))
;;      :set
;;      ((penginename-arg) (set-string penginename penginename-arg :dynamic t)))
;;     (engineversion :name "engineVersion" :type uint32 :init-form 0)
;;     (apiversion :name "apiVersion" :type uint32 :init-form 0))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFormatProperties"
;;       (format-properties)
;;       (:default-create :default-get :default-set)
;;     (lineartilingfeatures :name "linearTilingFeatures" :type
;;      "VkFormatFeatureFlags")
;;     (optimaltilingfeatures :name "optimalTilingFeatures" :type
;;      "VkFormatFeatureFlags")
;;     (bufferfeatures :name "bufferFeatures" :type "VkFormatFeatureFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageFormatProperties"
;;       (image-format-properties)
;;       (:default-create :default-get :default-set)
;;     (maxextent :pointer t :name "maxExtent" :type "VkExtent3D" :create
;;      ((maxextent-arg)
;;       (copy-object maxextent maxextent-arg '(:struct vkextent3d)))
;;      :set
;;      ((maxextent-arg)
;;       (copy-object maxextent maxextent-arg '(:struct vkextent3d))))
;;     (maxmiplevels :name "maxMipLevels" :type uint32)
;;     (maxarraylayers :name "maxArrayLayers" :type uint32)
;;     (samplecounts :name "sampleCounts" :type "VkSampleCountFlags")
;;     (maxresourcesize :name "maxResourceSize" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkInstanceCreateInfo"
;;       instance-create-info
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType" :init-form
;;      vk_structure_type_instance_create_info)
;;     (pnext :name "pNext" :type "vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :type "VkInstanceCreateFlags")
;;     (papplicationinfo :name "pApplicationInfo" :type "VkApplicationInfo"
;;      :init-form nil :create
;;      ((papplicationinfo-arg)
;;       (create-pointer papplicationinfo papplicationinfo-arg))
;;      :get (nil (get-pointer papplicationinfo)) :set
;;      ((papplicationinfo-arg)
;;       (set-pointer papplicationinfo papplicationinfo-arg)))
;;     (enabledlayercount :name "enabledLayerCount" :type uint32)
;;     (ppenabledlayernames :name "ppEnabledLayerNames" :type (list string)
;;      :init-form nil :create
;;      ((ppenabledlayernames-arg)
;;       (create-array-strings ppenabledlayernames ppenabledlayernames-arg
;;        :dynamic t))
;;      :destroy
;;      (destroy-array-strings ppenabledlayernames enabledlayercount :dynamic t)
;;      :get
;;      ((&optional (index nil))
;;       (get-array-strings ppenabledlayernames index enabledlayercount))
;;      :set
;;      ((ppenabledlayernames-arg &optional (index nil))
;;       (set-array-strings ppenabledlayernames ppenabledlayernames-arg index
;;        enabledlayercount :dynamic t)))
;;     (enabledextensioncount :name "enabledExtensionCount" :type uint32)
;;     (ppenabledextensionnames :name "ppEnabledExtensionNames" :type
;;      (list string) :init-form nil :create
;;      ((ppenabledextensionnames-arg)
;;       (create-array-strings ppenabledextensionnames ppenabledextensionnames-arg
;;        :dynamic t))
;;      :destroy
;;      (destroy-array-strings ppenabledextensionnames enabledlayercount :dynamic
;;       t)
;;      :get
;;      ((&optional (index nil))
;;       (get-array-strings ppenabledextensionnames index enabledextensioncount))
;;      :set
;;      ((ppenabledextensionnames-arg &optional (index nil))
;;       (set-array-strings ppenabledextensionnames ppenabledextensionnames-arg
;;        index enabledextensioncount :dynamic t))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryHeap"
;;       (memory-heap)
;;       (:default-create :default-get :default-set)
;;     (size :name size :type "VkDeviceSize")
;;     (flags :name flags :type "VkMemoryHeapFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryType"
;;       (memory-type)
;;       (:default-create :default-get :default-set)
;;     (propertyflags :name "propertyFlags" :type "VkMemoryPropertyFlags")
;;     (heapindex :name "heapIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFeatures"
;;       (physical-device-features)
;;       (:default-create :default-get :default-set)
;;     (robustbufferaccess :name "robustBufferAccess" :type "VkBool32")
;;     (fulldrawindexuint32 :name "fullDrawIndexUint32" :type "VkBool32")
;;     (imagecubearray :name "imageCubeArray" :type "VkBool32")
;;     (independentblend :name "independentBlend" :type "VkBool32")
;;     (geometryshader :name "geometryShader" :type "VkBool32")
;;     (tessellationshader :name "tessellationShader" :type "VkBool32")
;;     (samplerateshading :name "sampleRateShading" :type "VkBool32")
;;     (dualsrcblend :name "dualSrcBlend" :type "VkBool32")
;;     (logicop :name "logicOp" :type "VkBool32")
;;     (multidrawindirect :name "multiDrawIndirect" :type "VkBool32")
;;     (drawindirectfirstinstance :name "drawIndirectFirstInstance" :type
;;      "VkBool32")
;;     (depthclamp :name "depthClamp" :type "VkBool32")
;;     (depthbiasclamp :name "depthBiasClamp" :type "VkBool32")
;;     (fillmodenonsolid :name "fillModeNonSolid" :type "VkBool32")
;;     (depthbounds :name "depthBounds" :type "VkBool32")
;;     (widelines :name "wideLines" :type "VkBool32")
;;     (largepoints :name "largePoints" :type "VkBool32")
;;     (alphatoone :name "alphaToOne" :type "VkBool32")
;;     (multiviewport :name "multiViewport" :type "VkBool32")
;;     (sampleranisotropy :name "samplerAnisotropy" :type "VkBool32")
;;     (texturecompressionetc2 :name "textureCompressionETC2" :type "VkBool32")
;;     (texturecompressionastc_ldr :name "textureCompressionASTC_LDR" :type
;;      "VkBool32")
;;     (texturecompressionbc :name "textureCompressionBC" :type "VkBool32")
;;     (occlusionqueryprecise :name "occlusionQueryPrecise" :type "VkBool32")
;;     (pipelinestatisticsquery :name "pipelineStatisticsQuery" :type "VkBool32")
;;     (vertexpipelinestoresandatomics :name "vertexPipelineStoresAndAtomics"
;;      :type "VkBool32")
;;     (fragmentstoresandatomics :name "fragmentStoresAndAtomics" :type "VkBool32")
;;     (shadertessellationandgeometrypointsize :name
;;      "shaderTessellationAndGeometryPointSize" :type "VkBool32")
;;     (shaderimagegatherextended :name "shaderImageGatherExtended" :type
;;      "VkBool32")
;;     (shaderstorageimageextendedformats :name
;;      "shaderStorageImageExtendedFormats" :type "VkBool32")
;;     (shaderstorageimagemultisample :name "shaderStorageImageMultisample" :type
;;      "VkBool32")
;;     (shaderstorageimagereadwithoutformat :name
;;      "shaderStorageImageReadWithoutFormat" :type "VkBool32")
;;     (shaderstorageimagewritewithoutformat :name
;;      "shaderStorageImageWriteWithoutFormat" :type "VkBool32")
;;     (shaderuniformbufferarraydynamicindexing :name
;;      "shaderUniformBufferArrayDynamicIndexing" :type "VkBool32")
;;     (shadersampledimagearraydynamicindexing :name
;;      "shaderSampledImageArrayDynamicIndexing" :type "VkBool32")
;;     (shaderstoragebufferarraydynamicindexing :name
;;      "shaderStorageBufferArrayDynamicIndexing" :type "VkBool32")
;;     (shaderstorageimagearraydynamicindexing :name
;;      "shaderStorageImageArrayDynamicIndexing" :type "VkBool32")
;;     (shaderclipdistance :name "shaderClipDistance" :type "VkBool32")
;;     (shaderculldistance :name "shaderCullDistance" :type "VkBool32")
;;     (shaderfloat64 :name "shaderFloat64" :type "VkBool32")
;;     (shaderint64 :name "shaderInt64" :type "VkBool32")
;;     (shaderint16 :name "shaderInt16" :type "VkBool32")
;;     (shaderresourceresidency :name "shaderResourceResidency" :type "VkBool32")
;;     (shaderresourceminlod :name "shaderResourceMinLod" :type "VkBool32")
;;     (sparsebinding :name "sparseBinding" :type "VkBool32")
;;     (sparseresidencybuffer :name "sparseResidencyBuffer" :type "VkBool32")
;;     (sparseresidencyimage2d :name "sparseResidencyImage2D" :type "VkBool32")
;;     (sparseresidencyimage3d :name "sparseResidencyImage3D" :type "VkBool32")
;;     (sparseresidency2samples :name "sparseResidency2Samples" :type "VkBool32")
;;     (sparseresidency4samples :name "sparseResidency4Samples" :type "VkBool32")
;;     (sparseresidency8samples :name "sparseResidency8Samples" :type "VkBool32")
;;     (sparseresidency16samples :name "sparseResidency16Samples" :type "VkBool32")
;;     (sparseresidencyaliased :name "sparseResidencyAliased" :type "VkBool32")
;;     (variablemultisamplerate :name "variableMultisampleRate" :type "VkBool32")
;;     (inheritedqueries :name "inheritedQueries" :type "VkBool32"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceLimits"
;;       (physical-device-limits)
;;       (:default-create :default-get :default-set)
;;     (maximagedimension1d :name "maxImageDimension1D" :type uint32)
;;     (maximagedimension2d :name "maxImageDimension2D" :type uint32)
;;     (maximagedimension3d :name "maxImageDimension3D" :type uint32)
;;     (maximagedimensioncube :name "maxImageDimensionCube" :type uint32)
;;     (maximagearraylayers :name "maxImageArrayLayers" :type uint32)
;;     (maxtexelbufferelements :name "maxTexelBufferElements" :type uint32)
;;     (maxuniformbufferrange :name "maxUniformBufferRange" :type uint32)
;;     (maxstoragebufferrange :name "maxStorageBufferRange" :type uint32)
;;     (maxpushconstantssize :name "maxPushConstantsSize" :type uint32)
;;     (maxmemoryallocationcount :name "maxMemoryAllocationCount" :type uint32)
;;     (maxsamplerallocationcount :name "maxSamplerAllocationCount" :type uint32)
;;     (bufferimagegranularity :name "bufferImageGranularity" :type "VkDeviceSize")
;;     (sparseaddressspacesize :name "sparseAddressSpaceSize" :type "VkDeviceSize")
;;     (maxbounddescriptorsets :name "maxBoundDescriptorSets" :type uint32)
;;     (maxperstagedescriptorsamplers :name "maxPerStageDescriptorSamplers" :type
;;      uint32)
;;     (maxperstagedescriptoruniformbuffers :name
;;      "maxPerStageDescriptorUniformBuffers" :type uint32)
;;     (maxperstagedescriptorstoragebuffers :name
;;      "maxPerStageDescriptorStorageBuffers" :type uint32)
;;     (maxperstagedescriptorsampledimages :name
;;      "maxPerStageDescriptorSampledImages" :type uint32)
;;     (maxperstagedescriptorstorageimages :name
;;      "maxPerStageDescriptorStorageImages" :type uint32)
;;     (maxperstagedescriptorinputattachments :name
;;      "maxPerStageDescriptorInputAttachments" :type uint32)
;;     (maxperstageresources :name "maxPerStageResources" :type uint32)
;;     (maxdescriptorsetsamplers :name "maxDescriptorSetSamplers" :type uint32)
;;     (maxdescriptorsetuniformbuffers :name "maxDescriptorSetUniformBuffers"
;;      :type uint32)
;;     (maxdescriptorsetuniformbuffersdynamic :name
;;      "maxDescriptorSetUniformBuffersDynamic" :type uint32)
;;     (maxdescriptorsetstoragebuffers :name "maxDescriptorSetStorageBuffers"
;;      :type uint32)
;;     (maxdescriptorsetstoragebuffersdynamic :name
;;      "maxDescriptorSetStorageBuffersDynamic" :type uint32)
;;     (maxdescriptorsetsampledimages :name "maxDescriptorSetSampledImages" :type
;;      uint32)
;;     (maxdescriptorsetstorageimages :name "maxDescriptorSetStorageImages" :type
;;      uint32)
;;     (maxdescriptorsetinputattachments :name "maxDescriptorSetInputAttachments"
;;      :type uint32)
;;     (maxvertexinputattributes :name "maxVertexInputAttributes" :type uint32)
;;     (maxvertexinputbindings :name "maxVertexInputBindings" :type uint32)
;;     (maxvertexinputattributeoffset :name "maxVertexInputAttributeOffset" :type
;;      uint32)
;;     (maxvertexinputbindingstride :name "maxVertexInputBindingStride" :type
;;      uint32)
;;     (maxvertexoutputcomponents :name "maxVertexOutputComponents" :type uint32)
;;     (maxtessellationgenerationlevel :name "maxTessellationGenerationLevel"
;;      :type uint32)
;;     (maxtessellationpatchsize :name "maxTessellationPatchSize" :type uint32)
;;     (maxtessellationcontrolpervertexinputcomponents :name
;;      "maxTessellationControlPerVertexInputComponents" :type uint32)
;;     (maxtessellationcontrolpervertexoutputcomponents :name
;;      "maxTessellationControlPerVertexOutputComponents" :type uint32)
;;     (maxtessellationcontrolperpatchoutputcomponents :name
;;      "maxTessellationControlPerPatchOutputComponents" :type uint32)
;;     (maxtessellationcontroltotaloutputcomponents :name
;;      "maxTessellationControlTotalOutputComponents" :type uint32)
;;     (maxtessellationevaluationinputcomponents :name
;;      "maxTessellationEvaluationInputComponents" :type uint32)
;;     (maxtessellationevaluationoutputcomponents :name
;;      "maxTessellationEvaluationOutputComponents" :type uint32)
;;     (maxgeometryshaderinvocations :name "maxGeometryShaderInvocations" :type
;;      uint32)
;;     (maxgeometryinputcomponents :name "maxGeometryInputComponents" :type uint32)
;;     (maxgeometryoutputcomponents :name "maxGeometryOutputComponents" :type
;;      uint32)
;;     (maxgeometryoutputvertices :name "maxGeometryOutputVertices" :type uint32)
;;     (maxgeometrytotaloutputcomponents :name "maxGeometryTotalOutputComponents"
;;      :type uint32)
;;     (maxfragmentinputcomponents :name "maxFragmentInputComponents" :type uint32)
;;     (maxfragmentoutputattachments :name "maxFragmentOutputAttachments" :type
;;      uint32)
;;     (maxfragmentdualsrcattachments :name "maxFragmentDualSrcAttachments" :type
;;      uint32)
;;     (maxfragmentcombinedoutputresources :name
;;      "maxFragmentCombinedOutputResources" :type uint32)
;;     (maxcomputesharedmemorysize :name "maxComputeSharedMemorySize" :type uint32)
;;     (maxcomputeworkgroupcount :name "maxComputeWorkGroupCount" :type uint32
;;      :create
;;      ((maxcomputeworkgroupcount-arg)
;;       (create-array :uint32 maxcomputeworkgroupcount
;;        maxcomputeworkgroupcount-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional maxcomputeworkgroupcount-index)
;;       (get-array :uint32 maxcomputeworkgroupcount
;;        maxcomputeworkgroupcount-index 3 :pointers nil))
;;      :set
;;      ((maxcomputeworkgroupcount-arg &optional maxcomputeworkgroupcount-index)
;;       (set-array :uint32 maxcomputeworkgroupcount maxcomputeworkgroupcount-arg
;;        maxcomputeworkgroupcount-index :dynamic nil :pointers nil)))
;;     (maxcomputeworkgroupinvocations :name "maxComputeWorkGroupInvocations"
;;      :type uint32)
;;     (maxcomputeworkgroupsize :name "maxComputeWorkGroupSize" :type uint32
;;      :create
;;      ((maxcomputeworkgroupsize-arg)
;;       (create-array :uint32 maxcomputeworkgroupsize maxcomputeworkgroupsize-arg
;;        :dynamic nil :pointers nil))
;;      :get
;;      ((&optional maxcomputeworkgroupsize-index)
;;       (get-array :uint32 maxcomputeworkgroupsize maxcomputeworkgroupsize-index
;;        3 :pointers nil))
;;      :set
;;      ((maxcomputeworkgroupsize-arg &optional maxcomputeworkgroupsize-index)
;;       (set-array :uint32 maxcomputeworkgroupsize maxcomputeworkgroupsize-arg
;;        maxcomputeworkgroupsize-index :dynamic nil :pointers nil)))
;;     (subpixelprecisionbits :name "subPixelPrecisionBits" :type uint32)
;;     (subtexelprecisionbits :name "subTexelPrecisionBits" :type uint32)
;;     (mipmapprecisionbits :name "mipmapPrecisionBits" :type uint32)
;;     (maxdrawindexedindexvalue :name "maxDrawIndexedIndexValue" :type uint32)
;;     (maxdrawindirectcount :name "maxDrawIndirectCount" :type uint32)
;;     (maxsamplerlodbias :name "maxSamplerLodBias" :type float)
;;     (maxsampleranisotropy :name "maxSamplerAnisotropy" :type float)
;;     (maxviewports :name "maxViewports" :type uint32)
;;     (maxviewportdimensions :name "maxViewportDimensions" :type uint32 :create
;;      ((maxviewportdimensions-arg)
;;       (create-array :uint32 maxviewportdimensions maxviewportdimensions-arg
;;        :dynamic nil :pointers nil))
;;      :get
;;      ((&optional maxviewportdimensions-index)
;;       (get-array :uint32 maxviewportdimensions maxviewportdimensions-index 2
;;        :pointers nil))
;;      :set
;;      ((maxviewportdimensions-arg &optional maxviewportdimensions-index)
;;       (set-array :uint32 maxviewportdimensions maxviewportdimensions-arg
;;        maxviewportdimensions-index :dynamic nil :pointers nil)))
;;     (viewportboundsrange :name "viewportBoundsRange" :type float :create
;;      ((viewportboundsrange-arg)
;;       (create-array :float viewportboundsrange viewportboundsrange-arg :dynamic
;;        nil :pointers nil))
;;      :get
;;      ((&optional viewportboundsrange-index)
;;       (get-array :float viewportboundsrange viewportboundsrange-index 2
;;        :pointers nil))
;;      :set
;;      ((viewportboundsrange-arg &optional viewportboundsrange-index)
;;       (set-array :float viewportboundsrange viewportboundsrange-arg
;;        viewportboundsrange-index :dynamic nil :pointers nil)))
;;     (viewportsubpixelbits :name "viewportSubPixelBits" :type uint32)
;;     (minmemorymapalignment :name "minMemoryMapAlignment" :type size)
;;     (mintexelbufferoffsetalignment :name "minTexelBufferOffsetAlignment" :type
;;      "VkDeviceSize")
;;     (minuniformbufferoffsetalignment :name "minUniformBufferOffsetAlignment"
;;      :type "VkDeviceSize")
;;     (minstoragebufferoffsetalignment :name "minStorageBufferOffsetAlignment"
;;      :type "VkDeviceSize")
;;     (mintexeloffset :name "minTexelOffset" :type int32)
;;     (maxtexeloffset :name "maxTexelOffset" :type uint32)
;;     (mintexelgatheroffset :name "minTexelGatherOffset" :type int32)
;;     (maxtexelgatheroffset :name "maxTexelGatherOffset" :type uint32)
;;     (mininterpolationoffset :name "minInterpolationOffset" :type float)
;;     (maxinterpolationoffset :name "maxInterpolationOffset" :type float)
;;     (subpixelinterpolationoffsetbits :name "subPixelInterpolationOffsetBits"
;;      :type uint32)
;;     (maxframebufferwidth :name "maxFramebufferWidth" :type uint32)
;;     (maxframebufferheight :name "maxFramebufferHeight" :type uint32)
;;     (maxframebufferlayers :name "maxFramebufferLayers" :type uint32)
;;     (framebuffercolorsamplecounts :name "framebufferColorSampleCounts" :type
;;      "VkSampleCountFlags")
;;     (framebufferdepthsamplecounts :name "framebufferDepthSampleCounts" :type
;;      "VkSampleCountFlags")
;;     (framebufferstencilsamplecounts :name "framebufferStencilSampleCounts"
;;      :type "VkSampleCountFlags")
;;     (framebuffernoattachmentssamplecounts :name
;;      "framebufferNoAttachmentsSampleCounts" :type "VkSampleCountFlags")
;;     (maxcolorattachments :name "maxColorAttachments" :type uint32)
;;     (sampledimagecolorsamplecounts :name "sampledImageColorSampleCounts" :type
;;      "VkSampleCountFlags")
;;     (sampledimageintegersamplecounts :name "sampledImageIntegerSampleCounts"
;;      :type "VkSampleCountFlags")
;;     (sampledimagedepthsamplecounts :name "sampledImageDepthSampleCounts" :type
;;      "VkSampleCountFlags")
;;     (sampledimagestencilsamplecounts :name "sampledImageStencilSampleCounts"
;;      :type "VkSampleCountFlags")
;;     (storageimagesamplecounts :name "storageImageSampleCounts" :type
;;      "VkSampleCountFlags")
;;     (maxsamplemaskwords :name "maxSampleMaskWords" :type uint32)
;;     (timestampcomputeandgraphics :name "timestampComputeAndGraphics" :type
;;      "VkBool32")
;;     (timestampperiod :name "timestampPeriod" :type float)
;;     (maxclipdistances :name "maxClipDistances" :type uint32)
;;     (maxculldistances :name "maxCullDistances" :type uint32)
;;     (maxcombinedclipandculldistances :name "maxCombinedClipAndCullDistances"
;;      :type uint32)
;;     (discretequeuepriorities :name "discreteQueuePriorities" :type uint32)
;;     (pointsizerange :name "pointSizeRange" :type float :create
;;      ((pointsizerange-arg)
;;       (create-array :float pointsizerange pointsizerange-arg :dynamic nil
;;        :pointers nil))
;;      :get
;;      ((&optional pointsizerange-index)
;;       (get-array :float pointsizerange pointsizerange-index 2 :pointers nil))
;;      :set
;;      ((pointsizerange-arg &optional pointsizerange-index)
;;       (set-array :float pointsizerange pointsizerange-arg pointsizerange-index
;;        :dynamic nil :pointers nil)))
;;     (linewidthrange :name "lineWidthRange" :type float :create
;;      ((linewidthrange-arg)
;;       (create-array :float linewidthrange linewidthrange-arg :dynamic nil
;;        :pointers nil))
;;      :get
;;      ((&optional linewidthrange-index)
;;       (get-array :float linewidthrange linewidthrange-index 2 :pointers nil))
;;      :set
;;      ((linewidthrange-arg &optional linewidthrange-index)
;;       (set-array :float linewidthrange linewidthrange-arg linewidthrange-index
;;        :dynamic nil :pointers nil)))
;;     (pointsizegranularity :name "pointSizeGranularity" :type float)
;;     (linewidthgranularity :name "lineWidthGranularity" :type float)
;;     (strictlines :name "strictLines" :type "VkBool32")
;;     (standardsamplelocations :name "standardSampleLocations" :type "VkBool32")
;;     (optimalbuffercopyoffsetalignment :name "optimalBufferCopyOffsetAlignment"
;;      :type "VkDeviceSize")
;;     (optimalbuffercopyrowpitchalignment :name
;;      "optimalBufferCopyRowPitchAlignment" :type "VkDeviceSize")
;;     (noncoherentatomsize :name "nonCoherentAtomSize" :type "VkDeviceSize"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMemoryProperties"
;;       (physical-device-memory-properties)
;;       (:default-create :default-get :default-set)
;;     (memorytypecount :name "memoryTypeCount" :type uint32)
;;     (memorytypes :pointer t :name "memoryTypes" :type (list "VkMemoryType")
;;      :create
;;      ((memorytypes-arg)
;;       (create-array (:struct vkmemorytype) memorytypes memorytypes-arg :dynamic
;;        nil :pointers t))
;;      :get
;;      ((&optional memorytypes-index)
;;       (get-array (:struct vkmemorytype) memorytypes memorytypes-index 32
;;        :pointers t))
;;      :set
;;      ((memorytypes-arg &optional memorytypes-index)
;;       (set-array (:struct vkmemorytype) memorytypes memorytypes-arg
;;        memorytypes-index :dynamic nil :pointers t)))
;;     (memoryheapcount :name "memoryHeapCount" :type uint32)
;;     (memoryheaps :pointer t :name "memoryHeaps" :type (list "VkMemoryHeap")
;;      :create
;;      ((memoryheaps-arg)
;;       (create-array (:struct vkmemoryheap) memoryheaps memoryheaps-arg :dynamic
;;        nil :pointers t))
;;      :get
;;      ((&optional memoryheaps-index)
;;       (get-array (:struct vkmemoryheap) memoryheaps memoryheaps-index 16
;;        :pointers t))
;;      :set
;;      ((memoryheaps-arg &optional memoryheaps-index)
;;       (set-array (:struct vkmemoryheap) memoryheaps memoryheaps-arg
;;        memoryheaps-index :dynamic nil :pointers t))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSparseProperties"
;;       (physical-device-sparse-properties)
;;       (:default-create :default-get :default-set)
;;     (residencystandard2dblockshape :name "residencyStandard2DBlockShape" :type
;;      "VkBool32")
;;     (residencystandard2dmultisampleblockshape :name
;;      "residencyStandard2DMultisampleBlockShape" :type "VkBool32")
;;     (residencystandard3dblockshape :name "residencyStandard3DBlockShape" :type
;;      "VkBool32")
;;     (residencyalignedmipsize :name "residencyAlignedMipSize" :type "VkBool32")
;;     (residencynonresidentstrict :name "residencyNonResidentStrict" :type
;;      "VkBool32"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceProperties"
;;       (physical-device-properties)
;;       (:default-create :default-get :default-set)
;;     (apiversion :name "apiVersion" :type uint32)
;;     (driverversion :name "driverVersion" :type uint32)
;;     (vendorid :name "vendorID" :type uint32)
;;     (deviceid :name "deviceID" :type uint32)
;;     (devicetype :name "deviceType" :type "VkPhysicalDeviceType")
;;     (devicename :name "deviceName" :type string :create
;;      ((devicename-arg) (create-string devicename devicename-arg :dynamic nil))
;;      :get (nil (get-string devicename)) :set
;;      ((devicename-arg) (set-string devicename devicename-arg :dynamic nil)))
;;     (pipelinecacheuuid :name "pipelineCacheUUID" :type (list uint8) :create
;;      ((pipelinecacheuuid-arg)
;;       (create-array :uint8 pipelinecacheuuid pipelinecacheuuid-arg :dynamic nil
;;        :pointers nil))
;;      :get
;;      ((&optional pipelinecacheuuid-index)
;;       (get-array :uint8 pipelinecacheuuid pipelinecacheuuid-index vk_uuid_size
;;        :pointers nil))
;;      :set
;;      ((pipelinecacheuuid-arg &optional pipelinecacheuuid-index)
;;       (set-array :uint8 pipelinecacheuuid pipelinecacheuuid-arg
;;        pipelinecacheuuid-index :dynamic nil :pointers nil)))
;;     (limits :pointer t :name limits :type "VkPhysicalDeviceLimits" :create
;;      ((limits-arg)
;;       (copy-object limits limits-arg '(:struct vkphysicaldevicelimits)))
;;      :set
;;      ((limits-arg)
;;       (copy-object limits limits-arg '(:struct vkphysicaldevicelimits))))
;;     (sparseproperties :pointer t :name "sparseProperties" :type
;;      "VkPhysicalDeviceSparseProperties" :create
;;      ((sparseproperties-arg)
;;       (copy-object sparseproperties sparseproperties-arg
;;        '(:struct vkphysicaldevicesparseproperties)))
;;      :set
;;      ((sparseproperties-arg)
;;       (copy-object sparseproperties sparseproperties-arg
;;        '(:struct vkphysicaldevicesparseproperties)))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkQueueFamilyProperties"
;;       (queue-family-properties)
;;       (:default-create :default-get :default-set)
;;     (queueflags :name "queueFlags" :type "VkQueueFlags")
;;     (queuecount :name "queueCount" :type uint32)
;;     (timestampvalidbits :name "timestampValidBits" :type uint32)
;;     (minimagetransfergranularity :pointer t :name "minImageTransferGranularity"
;;      :type "VkExtent3D" :create
;;      ((minimagetransfergranularity-arg)
;;       (copy-object minimagetransfergranularity minimagetransfergranularity-arg
;;        '(:struct vkextent3d)))
;;      :set
;;      ((minimagetransfergranularity-arg)
;;       (copy-object minimagetransfergranularity minimagetransfergranularity-arg
;;        '(:struct vkextent3d)))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceQueueCreateInfo"
;;       (device-queue-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDeviceQueueCreateFlags")
;;     (queuefamilyindex :name "queueFamilyIndex" :type uint32)
;;     (queuecount :name "queueCount" :type uint32)
;;     (pqueuepriorities :name "pQueuePriorities" :type (list float) :init-form
;;      nil :create
;;      ((pqueuepriorities-arg)
;;       (create-array :float pqueuepriorities pqueuepriorities-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pqueuepriorities) :get
;;      ((&optional pqueuepriorities-index)
;;       (get-array :float pqueuepriorities pqueuepriorities-index queuecount
;;        :pointers nil))
;;      :set
;;      ((pqueuepriorities-arg &optional pqueuepriorities-index)
;;       (set-array :float pqueuepriorities pqueuepriorities-arg
;;        pqueuepriorities-index :dynamic t :pointers nil))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceCreateInfo"
;;       (device-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDeviceCreateFlags")
;;     (queuecreateinfocount :name "queueCreateInfoCount" :type uint32)
;;     (pqueuecreateinfos :name "pQueueCreateInfos" :type
;;      (list "VkDeviceQueueCreateInfo") :init-form nil :create
;;      ((pqueuecreateinfos-arg)
;;       (create-array (:struct vkdevicequeuecreateinfo) pqueuecreateinfos
;;        pqueuecreateinfos-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pqueuecreateinfos) :get
;;      ((&optional pqueuecreateinfos-index)
;;       (get-array (:struct vkdevicequeuecreateinfo) pqueuecreateinfos
;;        pqueuecreateinfos-index queuecreateinfocount :pointers t))
;;      :set
;;      ((pqueuecreateinfos-arg &optional pqueuecreateinfos-index)
;;       (set-array (:struct vkdevicequeuecreateinfo) pqueuecreateinfos
;;        pqueuecreateinfos-arg pqueuecreateinfos-index :dynamic t :pointers t)))
;;     (enabledlayercount :name "enabledLayerCount" :type uint32)
;;     (ppenabledlayernames :name "ppEnabledLayerNames" :type (list string)
;;      :init-form nil :create
;;      ((ppenabledlayernames-arg)
;;       (create-array-strings ppenabledlayernames ppenabledlayernames-arg
;;        :dynamic t))
;;      :destroy
;;      (destroy-array-strings ppenabledlayernames enabledlayercount :dynamic t)
;;      :get
;;      ((&optional ppenabledlayernames-index)
;;       (get-array-strings ppenabledlayernames ppenabledlayernames-index
;;        enabledlayercount))
;;      :set
;;      ((ppenabledlayernames-arg &optional ppenabledlayernames-index)
;;       (set-array-strings ppenabledlayernames ppenabledlayernames-arg
;;        ppenabledlayernames-index enabledlayercount :dynamic t)))
;;     (enabledextensioncount :name "enabledExtensionCount" :type uint32)
;;     (ppenabledextensionnames :name "ppEnabledExtensionNames" :type
;;      (list string) :init-form nil :create
;;      ((ppenabledextensionnames-arg)
;;       (create-array-strings ppenabledextensionnames ppenabledextensionnames-arg
;;        :dynamic t))
;;      :destroy
;;      (destroy-array-strings ppenabledextensionnames enabledextensioncount
;;       :dynamic t)
;;      :get
;;      ((&optional ppenabledextensionnames-index)
;;       (get-array-strings ppenabledextensionnames ppenabledextensionnames-index
;;        enabledextensioncount))
;;      :set
;;      ((ppenabledextensionnames-arg &optional ppenabledextensionnames-index)
;;       (set-array-strings ppenabledextensionnames ppenabledextensionnames-arg
;;        ppenabledextensionnames-index enabledextensioncount :dynamic t)))
;;     (penabledfeatures :name "pEnabledFeatures" :type "VkPhysicalDeviceFeatures"
;;      :init-form nil :create
;;      ((penabledfeatures-arg)
;;       (create-pointer penabledfeatures penabledfeatures-arg))
;;      :get (nil (get-pointer penabledfeatures)) :set
;;      ((penabledfeatures-arg)
;;       (set-pointer penabledfeatures penabledfeatures-arg))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExtensionProperties"
;;       extension-properties
;;       (:default-create :default-get :default-set)
;;     (extensionname :name "extensionName" :type string :init-form nil :create
;;      ((extensionname-arg)
;;       (create-string extensionname extensionname-arg :dynamic nil))
;;      :get (nil (get-string extensionname)) :set
;;      ((extensionname-arg)
;;       (set-string extensionname extensionname-arg :dynamic nil)))
;;     (specversion :name "specVersion" :type uint32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkLayerProperties"
;;       layer-properties
;;       (:default-create :default-get :default-set)
;;     (layername :name "layerName" :type string :init-form nil :create
;;      ((layername-arg) (create-string layername layername-arg :dynamic nil))
;;      :get (nil (get-string layername)) :set
;;      ((layername-arg) (set-string layername layername-arg :dynamic nil)))
;;     (specversion :name "specVersion" :type uint32)
;;     (implementationversion :name "implementationVersion" :type uint32)
;;     (description :type string :init-form nil :create
;;      ((description-arg)
;;       (create-string description description-arg :dynamic nil))
;;      :get (nil (get-string description)) :set
;;      ((description-arg) (set-string description description-arg :dynamic nil))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubmitInfo"
;;       (submit-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (waitsemaphorecount :name "waitSemaphoreCount" :type uint32)
;;     (pwaitsemaphores :name "pWaitSemaphores" :type (list "VkSemaphore")
;;      :init-form nil :create
;;      ((pwaitsemaphores-arg)
;;       (create-array vksemaphore pwaitsemaphores pwaitsemaphores-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pwaitsemaphores) :get
;;      ((&optional pwaitsemaphores-index)
;;       (get-array vksemaphore pwaitsemaphores pwaitsemaphores-index
;;        waitsemaphorecount :pointers nil))
;;      :set
;;      ((pwaitsemaphores-arg &optional pwaitsemaphores-index)
;;       (set-array vksemaphore pwaitsemaphores pwaitsemaphores-arg
;;        pwaitsemaphores-index :dynamic t :pointers nil)))
;;     (pwaitdststagemask :name "pWaitDstStageMask" :type
;;      (list "VkPipelineStageFlags") :init-form nil :create
;;      ((pwaitdststagemask-arg)
;;       (create-array vkpipelinestageflags pwaitdststagemask
;;        pwaitdststagemask-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pwaitdststagemask) :get
;;      ((&optional pwaitdststagemask-index)
;;       (get-array vkpipelinestageflags pwaitdststagemask pwaitdststagemask-index
;;        waitsemaphorecount :pointers nil))
;;      :set
;;      ((pwaitdststagemask-arg &optional pwaitdststagemask-index)
;;       (set-array vkpipelinestageflags pwaitdststagemask pwaitdststagemask-arg
;;        pwaitdststagemask-index :dynamic t :pointers nil)))
;;     (commandbuffercount :name "commandBufferCount" :type uint32)
;;     (pcommandbuffers :name "pCommandBuffers" :type (list "VkCommandBuffer")
;;      :init-form nil :create
;;      ((pcommandbuffers-arg)
;;       (create-array vkcommandbuffer pcommandbuffers pcommandbuffers-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pcommandbuffers) :get
;;      ((&optional pcommandbuffers-index)
;;       (get-array vkcommandbuffer pcommandbuffers pcommandbuffers-index
;;        commandbuffercount :pointers nil))
;;      :set
;;      ((pcommandbuffers-arg &optional pcommandbuffers-index)
;;       (set-array vkcommandbuffer pcommandbuffers pcommandbuffers-arg
;;        pcommandbuffers-index :dynamic t :pointers nil)))
;;     (signalsemaphorecount :name "signalSemaphoreCount" :type uint32)
;;     (psignalsemaphores :name "pSignalSemaphores" :type (list "VkSemaphore")
;;      :init-form nil :create
;;      ((psignalsemaphores-arg)
;;       (create-array vksemaphore psignalsemaphores psignalsemaphores-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array psignalsemaphores) :get
;;      ((&optional psignalsemaphores-index)
;;       (get-array vksemaphore psignalsemaphores psignalsemaphores-index
;;        signalsemaphorecount :pointers nil))
;;      :set
;;      ((psignalsemaphores-arg &optional psignalsemaphores-index)
;;       (set-array vksemaphore psignalsemaphores psignalsemaphores-arg
;;        psignalsemaphores-index :dynamic t :pointers nil))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMappedMemoryRange"
;;       (mapped-memory-range)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (memory :name memory :type "VkDeviceMemory" :create
;;      ((memory-arg) (create-pointer memory memory-arg)) :get
;;      (nil (get-pointer memory)) :set
;;      ((memory-arg) (set-pointer memory memory-arg)))
;;     (offset :name offset :type "VkDeviceSize")
;;     (size :name size :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryAllocateInfo"
;;       (memory-allocate-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (allocationsize :name "allocationSize" :type "VkDeviceSize")
;;     (memorytypeindex :name "memoryTypeIndex" :type uint32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryRequirements"
;;       (memory-requirements)
;;       (:default-create :default-get :default-set)
;;     (size :name size :type "VkDeviceSize")
;;     (alignment :name alignment :type "VkDeviceSize")
;;     (memorytypebits :name "memoryTypeBits" :type uint32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSparseMemoryBind"
;;       (sparse-memory-bind)
;;       (:default-create :default-get :default-set)
;;     (resourceoffset :name "resourceOffset" :type "VkDeviceSize")
;;     (size :name size :type "VkDeviceSize")
;;     (memory :name memory :type "VkDeviceMemory" :create
;;      ((memory-arg) (create-pointer memory memory-arg)) :get
;;      (nil (get-pointer memory)) :set
;;      ((memory-arg) (set-pointer memory memory-arg)))
;;     (memoryoffset :name "memoryOffset" :type "VkDeviceSize")
;;     (flags :name flags :type "VkSparseMemoryBindFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSparseBufferMemoryBindInfo"
;;       (sparse-buffer-memory-bind-info)
;;       (:default-create :default-get :default-set)
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg)))
;;     (bindcount :name "bindCount" :type uint32)
;;     (pbinds :name "pBinds" :type "VkSparseMemoryBind" :init-form nil :create
;;      ((pbinds-arg)
;;       (create-array (:struct vksparsememorybind) pbinds pbinds-arg :dynamic t
;;        :pointers ("VkSparseMemoryBind")))
;;      :destroy (destroy-array pbinds) :get
;;      ((&optional pbinds-index)
;;       (get-array (:struct vksparsememorybind) pbinds pbinds-index bindcount
;;        :pointers ("VkSparseMemoryBind")))
;;      :set
;;      ((pbinds-arg &optional pbinds-index)
;;       (set-array (:struct vksparsememorybind) pbinds pbinds-arg pbinds-index
;;        :dynamic t :pointers ("VkSparseMemoryBind")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSparseImageOpaqueMemoryBindInfo"
;;       (sparse-image-opaque-memory-bind-info)
;;       (:default-create :default-get :default-set)
;;     (image :name image :type "VkImage" :create
;;      ((image-arg) (create-pointer image image-arg)) :get
;;      (nil (get-pointer image)) :set ((image-arg) (set-pointer image image-arg)))
;;     (bindcount :name "bindCount" :type uint32)
;;     (pbinds :name "pBinds" :type "VkSparseMemoryBind" :init-form nil :create
;;      ((pbinds-arg)
;;       (create-array (:struct vksparsememorybind) pbinds pbinds-arg :dynamic t
;;        :pointers ("VkSparseMemoryBind")))
;;      :destroy (destroy-array pbinds) :get
;;      ((&optional pbinds-index)
;;       (get-array (:struct vksparsememorybind) pbinds pbinds-index bindcount
;;        :pointers ("VkSparseMemoryBind")))
;;      :set
;;      ((pbinds-arg &optional pbinds-index)
;;       (set-array (:struct vksparsememorybind) pbinds pbinds-arg pbinds-index
;;        :dynamic t :pointers ("VkSparseMemoryBind")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageSubresource"
;;       (image-subresource)
;;       (:default-create :default-get :default-set)
;;     (aspectmask :name "aspectMask" :type "VkImageAspectFlags")
;;     (miplevel :name "mipLevel" :type uint32)
;;     (arraylayer :name "arrayLayer" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSparseImageMemoryBind"
;;       (sparse-image-memory-bind)
;;       (:default-create :default-get :default-set)
;;     (subresource :pointer t :name subresource :type "VkImageSubresource"
;;      :create
;;      ((subresource-arg)
;;       (copy-object subresource subresource-arg '(:struct vkimagesubresource)))
;;      :set
;;      ((subresource-arg)
;;       (copy-object subresource subresource-arg '(:struct vkimagesubresource))))
;;     (offset :pointer t :name offset :type "VkOffset3D" :create
;;      ((offset-arg) (copy-object offset offset-arg '(:struct vkoffset3d))) :set
;;      ((offset-arg) (copy-object offset offset-arg '(:struct vkoffset3d))))
;;     (extent :pointer t :name extent :type "VkExtent3D" :create
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d))) :set
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d))))
;;     (memory :name memory :type "VkDeviceMemory" :create
;;      ((memory-arg) (create-pointer memory memory-arg)) :get
;;      (nil (get-pointer memory)) :set
;;      ((memory-arg) (set-pointer memory memory-arg)))
;;     (memoryoffset :name "memoryOffset" :type "VkDeviceSize")
;;     (flags :name flags :type "VkSparseMemoryBindFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSparseImageMemoryBindInfo"
;;       (sparse-image-memory-bind-info)
;;       (:default-create :default-get :default-set)
;;     (image :name image :type "VkImage" :create
;;      ((image-arg) (create-pointer image image-arg)) :get
;;      (nil (get-pointer image)) :set ((image-arg) (set-pointer image image-arg)))
;;     (bindcount :name "bindCount" :type uint32)
;;     (pbinds :name "pBinds" :type "VkSparseImageMemoryBind" :init-form nil
;;      :create
;;      ((pbinds-arg)
;;       (create-array (:struct vksparseimagememorybind) pbinds pbinds-arg
;;        :dynamic t :pointers ("VkSparseImageMemoryBind")))
;;      :destroy (destroy-array pbinds) :get
;;      ((&optional pbinds-index)
;;       (get-array (:struct vksparseimagememorybind) pbinds pbinds-index
;;        bindcount :pointers ("VkSparseImageMemoryBind")))
;;      :set
;;      ((pbinds-arg &optional pbinds-index)
;;       (set-array (:struct vksparseimagememorybind) pbinds pbinds-arg
;;        pbinds-index :dynamic t :pointers ("VkSparseImageMemoryBind")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindSparseInfo"
;;       (bind-sparse-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (waitsemaphorecount :name "waitSemaphoreCount" :type uint32)
;;     (pwaitsemaphores :name "pWaitSemaphores" :type "VkSemaphore" :init-form nil
;;      :create
;;      ((pwaitsemaphores-arg)
;;       (create-array vksemaphore pwaitsemaphores pwaitsemaphores-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pwaitsemaphores) :get
;;      ((&optional pwaitsemaphores-index)
;;       (get-array vksemaphore pwaitsemaphores pwaitsemaphores-index
;;        waitsemaphorecount :pointers nil))
;;      :set
;;      ((pwaitsemaphores-arg &optional pwaitsemaphores-index)
;;       (set-array vksemaphore pwaitsemaphores pwaitsemaphores-arg
;;        pwaitsemaphores-index :dynamic t :pointers nil)))
;;     (bufferbindcount :name "bufferBindCount" :type uint32)
;;     (pbufferbinds :name "pBufferBinds" :type "VkSparseBufferMemoryBindInfo"
;;      :init-form nil :create
;;      ((pbufferbinds-arg)
;;       (create-array (:struct vksparsebuffermemorybindinfo) pbufferbinds
;;        pbufferbinds-arg :dynamic t :pointers ("VkSparseBufferMemoryBindInfo")))
;;      :destroy (destroy-array pbufferbinds) :get
;;      ((&optional pbufferbinds-index)
;;       (get-array (:struct vksparsebuffermemorybindinfo) pbufferbinds
;;        pbufferbinds-index bufferbindcount :pointers
;;        ("VkSparseBufferMemoryBindInfo")))
;;      :set
;;      ((pbufferbinds-arg &optional pbufferbinds-index)
;;       (set-array (:struct vksparsebuffermemorybindinfo) pbufferbinds
;;        pbufferbinds-arg pbufferbinds-index :dynamic t :pointers
;;        ("VkSparseBufferMemoryBindInfo"))))
;;     (imageopaquebindcount :name "imageOpaqueBindCount" :type uint32)
;;     (pimageopaquebinds :name "pImageOpaqueBinds" :type
;;      "VkSparseImageOpaqueMemoryBindInfo" :init-form nil :create
;;      ((pimageopaquebinds-arg)
;;       (create-array (:struct vksparseimageopaquememorybindinfo)
;;        pimageopaquebinds pimageopaquebinds-arg :dynamic t :pointers
;;        ("VkSparseImageOpaqueMemoryBindInfo")))
;;      :destroy (destroy-array pimageopaquebinds) :get
;;      ((&optional pimageopaquebinds-index)
;;       (get-array (:struct vksparseimageopaquememorybindinfo) pimageopaquebinds
;;        pimageopaquebinds-index imageopaquebindcount :pointers
;;        ("VkSparseImageOpaqueMemoryBindInfo")))
;;      :set
;;      ((pimageopaquebinds-arg &optional pimageopaquebinds-index)
;;       (set-array (:struct vksparseimageopaquememorybindinfo) pimageopaquebinds
;;        pimageopaquebinds-arg pimageopaquebinds-index :dynamic t :pointers
;;        ("VkSparseImageOpaqueMemoryBindInfo"))))
;;     (imagebindcount :name "imageBindCount" :type uint32)
;;     (pimagebinds :name "pImageBinds" :type "VkSparseImageMemoryBindInfo"
;;      :init-form nil :create
;;      ((pimagebinds-arg)
;;       (create-array (:struct vksparseimagememorybindinfo) pimagebinds
;;        pimagebinds-arg :dynamic t :pointers ("VkSparseImageMemoryBindInfo")))
;;      :destroy (destroy-array pimagebinds) :get
;;      ((&optional pimagebinds-index)
;;       (get-array (:struct vksparseimagememorybindinfo) pimagebinds
;;        pimagebinds-index imagebindcount :pointers
;;        ("VkSparseImageMemoryBindInfo")))
;;      :set
;;      ((pimagebinds-arg &optional pimagebinds-index)
;;       (set-array (:struct vksparseimagememorybindinfo) pimagebinds
;;        pimagebinds-arg pimagebinds-index :dynamic t :pointers
;;        ("VkSparseImageMemoryBindInfo"))))
;;     (signalsemaphorecount :name "signalSemaphoreCount" :type uint32)
;;     (psignalsemaphores :name "pSignalSemaphores" :type "VkSemaphore" :init-form
;;      nil :create
;;      ((psignalsemaphores-arg)
;;       (create-array vksemaphore psignalsemaphores psignalsemaphores-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array psignalsemaphores) :get
;;      ((&optional psignalsemaphores-index)
;;       (get-array vksemaphore psignalsemaphores psignalsemaphores-index
;;        signalsemaphorecount :pointers nil))
;;      :set
;;      ((psignalsemaphores-arg &optional psignalsemaphores-index)
;;       (set-array vksemaphore psignalsemaphores psignalsemaphores-arg
;;        psignalsemaphores-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSparseImageFormatProperties"
;;       (sparse-image-format-properties)
;;       (:default-create :default-get :default-set)
;;     (aspectmask :name "aspectMask" :type "VkImageAspectFlags")
;;     (imagegranularity :pointer t :name "imageGranularity" :type "VkExtent3D"
;;      :create
;;      ((imagegranularity-arg)
;;       (copy-object imagegranularity imagegranularity-arg
;;        '(:struct vkextent3d)))
;;      :set
;;      ((imagegranularity-arg)
;;       (copy-object imagegranularity imagegranularity-arg
;;        '(:struct vkextent3d))))
;;     (flags :name flags :type "VkSparseImageFormatFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSparseImageMemoryRequirements"
;;       (sparse-image-memory-requirements)
;;       (:default-create :default-get :default-set)
;;     (formatproperties :pointer t :name "formatProperties" :type
;;      "VkSparseImageFormatProperties" :create
;;      ((formatproperties-arg)
;;       (copy-object formatproperties formatproperties-arg
;;        '(:struct vksparseimageformatproperties)))
;;      :set
;;      ((formatproperties-arg)
;;       (copy-object formatproperties formatproperties-arg
;;        '(:struct vksparseimageformatproperties))))
;;     (imagemiptailfirstlod :name "imageMipTailFirstLod" :type uint32)
;;     (imagemiptailsize :name "imageMipTailSize" :type "VkDeviceSize")
;;     (imagemiptailoffset :name "imageMipTailOffset" :type "VkDeviceSize")
;;     (imagemiptailstride :name "imageMipTailStride" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFenceCreateInfo"
;;       (fence-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkFenceCreateFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSemaphoreCreateInfo"
;;       (semaphore-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkSemaphoreCreateFlags"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkEventCreateInfo"
;;       (event-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkEventCreateFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkQueryPoolCreateInfo"
;;       (query-pool-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkQueryPoolCreateFlags")
;;     (querytype :name "queryType" :type "VkQueryType")
;;     (querycount :name "queryCount" :type uint32)
;;     (pipelinestatistics :name "pipelineStatistics" :type
;;      "VkQueryPipelineStatisticFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferCreateInfo"
;;       (buffer-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkBufferCreateFlags")
;;     (size :name size :type "VkDeviceSize")
;;     (usage :name usage :type "VkBufferUsageFlags")
;;     (sharingmode :name "sharingMode" :type "VkSharingMode")
;;     (queuefamilyindexcount :name "queueFamilyIndexCount" :type uint32)
;;     (pqueuefamilyindices :name "pQueueFamilyIndices" :type (list uint32)
;;      :init-form nil :create
;;      ((pqueuefamilyindices-arg)
;;       (create-array :uint32 pqueuefamilyindices pqueuefamilyindices-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pqueuefamilyindices) :get
;;      ((&optional pqueuefamilyindices-index)
;;       (get-array :uint32 pqueuefamilyindices pqueuefamilyindices-index
;;        queuefamilyindexcount :pointers nil))
;;      :set
;;      ((pqueuefamilyindices-arg &optional pqueuefamilyindices-index)
;;       (set-array :uint32 pqueuefamilyindices pqueuefamilyindices-arg
;;        pqueuefamilyindices-index :dynamic t :pointers nil))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferViewCreateInfo"
;;       (buffer-view-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkBufferViewCreateFlags")
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg)))
;;     (format :name format :type "VkFormat")
;;     (offset :name offset :type "VkDeviceSize")
;;     (range :name range :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageCreateInfo"
;;       (image-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkImageCreateFlags")
;;     (imagetype :name "imageType" :type "VkImageType")
;;     (format :name format :type "VkFormat")
;;     (extent :pointer t :name extent :type "VkExtent3D" :create
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d))) :set
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d))))
;;     (miplevels :name "mipLevels" :type uint32)
;;     (arraylayers :name "arrayLayers" :type uint32)
;;     (samples :name samples :type "VkSampleCountFlagBits")
;;     (tiling :name tiling :type "VkImageTiling")
;;     (usage :name usage :type "VkImageUsageFlags")
;;     (sharingmode :name "sharingMode" :type "VkSharingMode")
;;     (queuefamilyindexcount :name "queueFamilyIndexCount" :type uint32)
;;     (pqueuefamilyindices :name "pQueueFamilyIndices" :type uint32 :init-form
;;      nil :create
;;      ((pqueuefamilyindices-arg)
;;       (create-array :uint32 pqueuefamilyindices pqueuefamilyindices-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pqueuefamilyindices) :get
;;      ((&optional pqueuefamilyindices-index)
;;       (get-array :uint32 pqueuefamilyindices pqueuefamilyindices-index
;;        queuefamilyindexcount :pointers nil))
;;      :set
;;      ((pqueuefamilyindices-arg &optional pqueuefamilyindices-index)
;;       (set-array :uint32 pqueuefamilyindices pqueuefamilyindices-arg
;;        pqueuefamilyindices-index :dynamic t :pointers nil)))
;;     (initiallayout :name "initialLayout" :type "VkImageLayout"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubresourceLayout"
;;       (subresource-layout)
;;       (:default-create :default-get :default-set)
;;     (offset :name offset :type "VkDeviceSize")
;;     (size :name size :type "VkDeviceSize")
;;     (rowpitch :name "rowPitch" :type "VkDeviceSize")
;;     (arraypitch :name "arrayPitch" :type "VkDeviceSize")
;;     (depthpitch :name "depthPitch" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkComponentMapping"
;;       (component-mapping)
;;       (:default-create :default-get :default-set)
;;     (r :name r :type "VkComponentSwizzle")
;;     (g :name g :type "VkComponentSwizzle")
;;     (b :name b :type "VkComponentSwizzle")
;;     (a :name a :type "VkComponentSwizzle"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageViewCreateInfo"
;;       (image-view-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkImageViewCreateFlags")
;;     (image :name image :type "VkImage" :create
;;      ((image-arg) (create-pointer image image-arg)) :get
;;      (nil (get-pointer image)) :set ((image-arg) (set-pointer image image-arg)))
;;     (viewtype :name "viewType" :type "VkImageViewType")
;;     (format :name format :type "VkFormat")
;;     (components :pointer t :name components :type "VkComponentMapping" :create
;;      ((components-arg)
;;       (copy-object components components-arg '(:struct vkcomponentmapping)))
;;      :set
;;      ((components-arg)
;;       (copy-object components components-arg '(:struct vkcomponentmapping))))
;;     (subresourcerange :pointer t :name "subresourceRange" :type
;;      "VkImageSubresourceRange" :create
;;      ((subresourcerange-arg)
;;       (copy-object subresourcerange subresourcerange-arg
;;        '(:struct vkimagesubresourcerange)))
;;      :set
;;      ((subresourcerange-arg)
;;       (copy-object subresourcerange subresourcerange-arg
;;        '(:struct vkimagesubresourcerange)))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkShaderModuleCreateInfo"
;;       (shader-module-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkShaderModuleCreateFlags")
;;     (codesize :name "codeSize" :type size)
;;     (pcode :name "pCode" :type uint32 :init-form nil :create
;;      ((pcode-arg) (create-pointer pcode pcode-arg)) :get
;;      (nil (get-pointer pcode)) :set
;;      ((pcode-arg) (set-pointer pcode pcode-arg))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineCacheCreateInfo"
;;       (pipeline-cache-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineCacheCreateFlags")
;;     (initialdatasize :name "initialDataSize" :type size)
;;     (pinitialdata :name "pInitialData" :type void :init-form nil :create
;;      ((pinitialdata-arg) (create-pointer pinitialdata pinitialdata-arg)) :get
;;      (nil (get-pointer pinitialdata)) :set
;;      ((pinitialdata-arg) (set-pointer pinitialdata pinitialdata-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSpecializationMapEntry"
;;       (specialization-map-entry)
;;       (:default-create :default-get :default-set)
;;     (antid :name "antID" :type uint32)
;;     (offset :name offset :type uint32)
;;     (size :name size :type size))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSpecializationInfo"
;;       (specialization-info)
;;       (:default-create :default-get :default-set)
;;     (mapentrycount :name "mapEntryCount" :type uint32)
;;     (pmapentries :name "pMapEntries" :type "VkSpecializationMapEntry"
;;      :init-form nil :create
;;      ((pmapentries-arg)
;;       (create-array (:struct vkspecializationmapentry) pmapentries
;;        pmapentries-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pmapentries) :get
;;      ((&optional pmapentries-index)
;;       (get-array (:struct vkspecializationmapentry) pmapentries
;;        pmapentries-index mapentrycount :pointers t))
;;      :set
;;      ((pmapentries-arg &optional pmapentries-index)
;;       (set-array (:struct vkspecializationmapentry) pmapentries pmapentries-arg
;;        pmapentries-index :dynamic t :pointers t)))
;;     (datasize :name "dataSize" :type size)
;;     (pdata :name "pData" :type void :init-form nil :create
;;      ((pdata-arg) (create-pointer pdata pdata-arg)) :get
;;      (nil (get-pointer pdata)) :set
;;      ((pdata-arg) (set-pointer pdata pdata-arg))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineShaderStageCreateInfo"
;;       (pipeline-shader-stage-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineShaderStageCreateFlags")
;;     (stage :name stage :type "VkShaderStageFlagBits")
;;     (module :name module :type "VkShaderModule" :init-form nil :create
;;      ((module-arg) (create-pointer module module-arg)) :get
;;      (nil (get-pointer module)) :set
;;      ((module-arg) (set-pointer module module-arg)))
;;     (pname :name "pName" :type string :init-form nil :create
;;      ((pname-arg) (create-string pname pname-arg :dynamic t)) :destroy
;;      (destroy-string pname) :get (nil (get-string pname)) :set
;;      ((pname-arg) (set-string pname pname-arg :dynamic t)))
;;     (pspecializationinfo :name "pSpecializationInfo" :type
;;      "VkSpecializationInfo" :init-form nil :create
;;      ((pspecializationinfo-arg)
;;       (create-pointer pspecializationinfo pspecializationinfo-arg))
;;      :get (nil (get-pointer pspecializationinfo)) :set
;;      ((pspecializationinfo-arg)
;;       (set-pointer pspecializationinfo pspecializationinfo-arg))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkComputePipelineCreateInfo"
;;       (compute-pipeline-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineCreateFlags")
;;     (stage :pointer t :name stage :type "VkPipelineShaderStageCreateInfo"
;;      :create
;;      ((stage-arg)
;;       (copy-object stage stage-arg '(:struct vkpipelineshaderstagecreateinfo)))
;;      :set
;;      ((stage-arg)
;;       (copy-object stage stage-arg '(:struct vkpipelineshaderstagecreateinfo))))
;;     (layout :name layout :type "VkPipelineLayout" :create
;;      ((layout-arg) (create-pointer layout layout-arg)) :get
;;      (nil (get-pointer layout)) :set
;;      ((layout-arg) (set-pointer layout layout-arg)))
;;     (basepipelinehandle :name "basePipelineHandle" :type "VkPipeline" :create
;;      ((basepipelinehandle-arg)
;;       (create-pointer basepipelinehandle basepipelinehandle-arg))
;;      :get (nil (get-pointer basepipelinehandle)) :set
;;      ((basepipelinehandle-arg)
;;       (set-pointer basepipelinehandle basepipelinehandle-arg)))
;;     (basepipelineindex :name "basePipelineIndex" :type int32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkVertexInputBindingDescription"
;;       (vertex-input-binding-description)
;;       (:default-create :default-get :default-set)
;;     (binding :name binding :type uint32)
;;     (stride :name stride :type uint32)
;;     (inputrate :name "inputRate" :type "VkVertexInputRate"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkVertexInputAttributeDescription"
;;       (vertex-input-attribute-description)
;;       (:default-create :default-get :default-set)
;;     (location :name location :type uint32)
;;     (binding :name binding :type uint32)
;;     (format :name format :type "VkFormat")
;;     (offset :name offset :type uint32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineVertexInputStateCreateInfo"
;;       (pipeline-vertex-input-state-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineVertexInputStateCreateFlags")
;;     (vertexbindingdescriptioncount :name "vertexBindingDescriptionCount" :type
;;      uint32)
;;     (pvertexbindingdescriptions :name "pVertexBindingDescriptions" :type
;;      (list "VkVertexInputBindingDescription") :init-form nil :create
;;      ((pvertexbindingdescriptions-arg)
;;       (create-array (:struct vkvertexinputbindingdescription)
;;        pvertexbindingdescriptions pvertexbindingdescriptions-arg :dynamic t
;;        :pointers t))
;;      :destroy (destroy-array pvertexbindingdescriptions) :get
;;      ((&optional pvertexbindingdescriptions-index)
;;       (get-array (:struct vkvertexinputbindingdescription)
;;        pvertexbindingdescriptions pvertexbindingdescriptions-index
;;        vertexbindingdescriptioncount :pointers t))
;;      :set
;;      ((pvertexbindingdescriptions-arg &optional
;;        pvertexbindingdescriptions-index)
;;       (set-array (:struct vkvertexinputbindingdescription)
;;        pvertexbindingdescriptions pvertexbindingdescriptions-arg
;;        pvertexbindingdescriptions-index :dynamic t :pointers t)))
;;     (vertexattributedescriptioncount :name "vertexAttributeDescriptionCount"
;;      :type uint32)
;;     (pvertexattributedescriptions :name "pVertexAttributeDescriptions" :type
;;      (list "VkVertexInputAttributeDescription") :init-form nil :create
;;      ((pvertexattributedescriptions-arg)
;;       (create-array (:struct vkvertexinputattributedescription)
;;        pvertexattributedescriptions pvertexattributedescriptions-arg :dynamic t
;;        :pointers t))
;;      :destroy (destroy-array pvertexattributedescriptions) :get
;;      ((&optional pvertexattributedescriptions-index)
;;       (get-array (:struct vkvertexinputattributedescription)
;;        pvertexattributedescriptions pvertexattributedescriptions-index
;;        vertexattributedescriptioncount :pointers t))
;;      :set
;;      ((pvertexattributedescriptions-arg &optional
;;        pvertexattributedescriptions-index)
;;       (set-array (:struct vkvertexinputattributedescription)
;;        pvertexattributedescriptions pvertexattributedescriptions-arg
;;        pvertexattributedescriptions-index :dynamic t :pointers t))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineInputAssemblyStateCreateInfo"
;;       (pipeline-input-assembly-state-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineInputAssemblyStateCreateFlags")
;;     (topology :name topology :type "VkPrimitiveTopology")
;;     (primitiverestartenable :name "primitiveRestartEnable" :type "VkBool32"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineTessellationStateCreateInfo"
;;       (pipeline-tessellation-state-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineTessellationStateCreateFlags")
;;     (patchcontrolpoints :name "patchControlPoints" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkViewport"
;;       (viewport)
;;       (:default-create :default-get :default-set)
;;     (x :name x :type float)
;;     (y :name y :type float)
;;     (width :name width :type float)
;;     (height :name height :type float)
;;     (mindepth :name "minDepth" :type float)
;;     (maxdepth :name "maxDepth" :type float))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineViewportStateCreateInfo"
;;       (pipeline-viewport-state-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineViewportStateCreateFlags")
;;     (viewportcount :name "viewportCount" :type uint32)
;;     (pviewports :name "pViewports" :type (list "VkViewport") :init-form nil
;;      :create
;;      ((pviewports-arg)
;;       (create-array (:struct vkviewport) pviewports pviewports-arg :dynamic t
;;        :pointers t))
;;      :destroy (destroy-array pviewports) :get
;;      ((&optional pviewports-index)
;;       (get-array (:struct vkviewport) pviewports pviewports-index viewportcount
;;        :pointers t))
;;      :set
;;      ((pviewports-arg &optional pviewports-index)
;;       (set-array (:struct vkviewport) pviewports pviewports-arg
;;        pviewports-index :dynamic t :pointers t)))
;;     (scissorcount :name "scissorCount" :type uint32)
;;     (pscissors :name "pScissors" :type (list "VkRect2D") :init-form nil :create
;;      ((pscissors-arg)
;;       (create-array (:struct vkrect2d) pscissors pscissors-arg :dynamic t
;;        :pointers t))
;;      :destroy (destroy-array pscissors) :get
;;      ((&optional pscissors-index)
;;       (get-array (:struct vkrect2d) pscissors pscissors-index scissorcount
;;        :pointers t))
;;      :set
;;      ((pscissors-arg &optional pscissors-index)
;;       (set-array (:struct vkrect2d) pscissors pscissors-arg pscissors-index
;;        :dynamic t :pointers t))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineRasterizationStateCreateInfo"
;;       (pipeline-rasterization-state-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineRasterizationStateCreateFlags")
;;     (depthclampenable :name "depthClampEnable" :type "VkBool32")
;;     (rasterizerdiscardenable :name "rasterizerDiscardEnable" :type "VkBool32")
;;     (polygonmode :name "polygonMode" :type "VkPolygonMode")
;;     (cullmode :name "cullMode" :type "VkCullModeFlags")
;;     (frontface :name "frontFace" :type "VkFrontFace")
;;     (depthbiasenable :name "depthBiasEnable" :type "VkBool32")
;;     (depthbiasconstantfactor :name "depthBiasConstantFactor" :type float)
;;     (depthbiasclamp :name "depthBiasClamp" :type float)
;;     (depthbiasslopefactor :name "depthBiasSlopeFactor" :type float)
;;     (linewidth :name "lineWidth" :type float))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineMultisampleStateCreateInfo"
;;       (pipeline-multisample-state-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineMultisampleStateCreateFlags")
;;     (rasterizationsamples :name "rasterizationSamples" :type
;;      "VkSampleCountFlagBits")
;;     (sampleshadingenable :name "sampleShadingEnable" :type "VkBool32")
;;     (minsampleshading :name "minSampleShading" :type float)
;;     (psamplemask :name "pSampleMask" :type "VkSampleMask" :init-form nil
;;      :create ((psamplemask-arg) (create-pointer psamplemask psamplemask-arg))
;;      :get (nil (get-pointer psamplemask)) :set
;;      ((psamplemask-arg) (set-pointer psamplemask psamplemask-arg)))
;;     (alphatocoverageenable :name "alphaToCoverageEnable" :type "VkBool32")
;;     (alphatooneenable :name "alphaToOneEnable" :type "VkBool32"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkStencilOpState"
;;       (stencil-op-state)
;;       (:default-create :default-get :default-set)
;;     (failop :name "failOp" :type "VkStencilOp")
;;     (passop :name "passOp" :type "VkStencilOp")
;;     (depthfailop :name "depthFailOp" :type "VkStencilOp")
;;     (compareop :name "compareOp" :type "VkCompareOp")
;;     (comparemask :name "compareMask" :type uint32)
;;     (writemask :name "writeMask" :type uint32)
;;     (reference :name reference :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineDepthStencilStateCreateInfo"
;;       (pipeline-depth-stencil-state-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineDepthStencilStateCreateFlags")
;;     (depthtestenable :name "depthTestEnable" :type "VkBool32")
;;     (depthwriteenable :name "depthWriteEnable" :type "VkBool32")
;;     (depthcompareop :name "depthCompareOp" :type "VkCompareOp")
;;     (depthboundstestenable :name "depthBoundsTestEnable" :type "VkBool32")
;;     (stenciltestenable :name "stencilTestEnable" :type "VkBool32")
;;     (front :pointer t :name front :type "VkStencilOpState" :create
;;      ((front-arg) (copy-object front front-arg '(:struct vkstencilopstate)))
;;      :set
;;      ((front-arg) (copy-object front front-arg '(:struct vkstencilopstate))))
;;     (back :pointer t :name back :type "VkStencilOpState" :create
;;      ((back-arg) (copy-object back back-arg '(:struct vkstencilopstate))) :set
;;      ((back-arg) (copy-object back back-arg '(:struct vkstencilopstate))))
;;     (mindepthbounds :name "minDepthBounds" :type float)
;;     (maxdepthbounds :name "maxDepthBounds" :type float))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineColorBlendAttachmentState"
;;       (pipeline-color-blend-attachment-state)
;;       (:default-create :default-get :default-set)
;;     (blendenable :name "blendEnable" :type "VkBool32")
;;     (srccolorblendfactor :name "srcColorBlendFactor" :type "VkBlendFactor")
;;     (dstcolorblendfactor :name "dstColorBlendFactor" :type "VkBlendFactor")
;;     (colorblendop :name "colorBlendOp" :type "VkBlendOp")
;;     (srcalphablendfactor :name "srcAlphaBlendFactor" :type "VkBlendFactor")
;;     (dstalphablendfactor :name "dstAlphaBlendFactor" :type "VkBlendFactor")
;;     (alphablendop :name "alphaBlendOp" :type "VkBlendOp")
;;     (colorwritemask :name "colorWriteMask" :type "VkColorComponentFlags"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineColorBlendStateCreateInfo"
;;       (pipeline-color-blend-state-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineColorBlendStateCreateFlags")
;;     (logicopenable :name "logicOpEnable" :type "VkBool32")
;;     (logicop :name "logicOp" :type "VkLogicOp")
;;     (attachmentcount :name "attachmentCount" :type uint32)
;;     (pattachments :name "pAttachments" :type
;;      (list "VkPipelineColorBlendAttachmentState") :init-form nil :create
;;      ((pattachments-arg)
;;       (create-array (:struct vkpipelinecolorblendattachmentstate) pattachments
;;        pattachments-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pattachments) :get
;;      ((&optional pattachments-index)
;;       (get-array (:struct vkpipelinecolorblendattachmentstate) pattachments
;;        pattachments-index attachmentcount :pointers t))
;;      :set
;;      ((pattachments-arg &optional pattachments-index)
;;       (set-array (:struct vkpipelinecolorblendattachmentstate) pattachments
;;        pattachments-arg pattachments-index :dynamic t :pointers t)))
;;     (blendconstants :name "blendConstants" :type (list float) :create
;;      ((blendconstants-arg)
;;       (create-array :float blendconstants blendconstants-arg :dynamic nil
;;        :pointers nil))
;;      :get
;;      ((&optional blendconstants-index)
;;       (get-array :float blendconstants blendconstants-index 4 :pointers nil))
;;      :set
;;      ((blendconstants-arg &optional blendconstants-index)
;;       (set-array :float blendconstants blendconstants-arg blendconstants-index
;;        :dynamic nil :pointers nil))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineDynamicStateCreateInfo"
;;       (pipeline-dynamic-state-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineDynamicStateCreateFlags")
;;     (dynamicstatecount :name "dynamicStateCount" :type uint32)
;;     (pdynamicstates :name "pDynamicStates" :type (list "VkDynamicState")
;;      :init-form nil :create
;;      ((pdynamicstates-arg)
;;       (create-array vkdynamicstate pdynamicstates pdynamicstates-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pdynamicstates) :get
;;      ((&optional pdynamicstates-index)
;;       (get-array vkdynamicstate pdynamicstates pdynamicstates-index
;;        dynamicstatecount :pointers nil))
;;      :set
;;      ((pdynamicstates-arg &optional pdynamicstates-index)
;;       (set-array vkdynamicstate pdynamicstates pdynamicstates-arg
;;        pdynamicstates-index :dynamic t :pointers nil))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkGraphicsPipelineCreateInfo"
;;       (graphics-pipeline-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineCreateFlags")
;;     (stagecount :name "stageCount" :type uint32)
;;     (pstages :name "pStages" :type (list "VkPipelineShaderStageCreateInfo")
;;      :init-form nil :create
;;      ((pstages-arg)
;;       (create-array (:struct vkpipelineshaderstagecreateinfo) pstages
;;        pstages-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pstages) :get
;;      ((&optional pstages-index)
;;       (get-array (:struct vkpipelineshaderstagecreateinfo) pstages
;;        pstages-index stagecount :pointers t))
;;      :set
;;      ((pstages-arg &optional pstages-index)
;;       (set-array (:struct vkpipelineshaderstagecreateinfo) pstages pstages-arg
;;        pstages-index :dynamic t :pointers t)))
;;     (pvertexinputstate :name "pVertexInputState" :type
;;      "VkPipelineVertexInputStateCreateInfo" :init-form nil :create
;;      ((pvertexinputstate-arg)
;;       (create-pointer pvertexinputstate pvertexinputstate-arg))
;;      :get (nil (get-pointer pvertexinputstate)) :set
;;      ((pvertexinputstate-arg)
;;       (set-pointer pvertexinputstate pvertexinputstate-arg)))
;;     (pinputassemblystate :name "pInputAssemblyState" :type
;;      "VkPipelineInputAssemblyStateCreateInfo" :init-form nil :create
;;      ((pinputassemblystate-arg)
;;       (create-pointer pinputassemblystate pinputassemblystate-arg))
;;      :get (nil (get-pointer pinputassemblystate)) :set
;;      ((pinputassemblystate-arg)
;;       (set-pointer pinputassemblystate pinputassemblystate-arg)))
;;     (ptessellationstate :name "pTessellationState" :type
;;      "VkPipelineTessellationStateCreateInfo" :init-form nil :create
;;      ((ptessellationstate-arg)
;;       (create-pointer ptessellationstate ptessellationstate-arg))
;;      :get (nil (get-pointer ptessellationstate)) :set
;;      ((ptessellationstate-arg)
;;       (set-pointer ptessellationstate ptessellationstate-arg)))
;;     (pviewportstate :name "pViewportState" :type
;;      "VkPipelineViewportStateCreateInfo" :init-form nil :create
;;      ((pviewportstate-arg) (create-pointer pviewportstate pviewportstate-arg))
;;      :get (nil (get-pointer pviewportstate)) :set
;;      ((pviewportstate-arg) (set-pointer pviewportstate pviewportstate-arg)))
;;     (prasterizationstate :name "pRasterizationState" :type
;;      "VkPipelineRasterizationStateCreateInfo" :init-form nil :create
;;      ((prasterizationstate-arg)
;;       (create-pointer prasterizationstate prasterizationstate-arg))
;;      :get (nil (get-pointer prasterizationstate)) :set
;;      ((prasterizationstate-arg)
;;       (set-pointer prasterizationstate prasterizationstate-arg)))
;;     (pmultisamplestate :name "pMultisampleState" :type
;;      "VkPipelineMultisampleStateCreateInfo" :init-form nil :create
;;      ((pmultisamplestate-arg)
;;       (create-pointer pmultisamplestate pmultisamplestate-arg))
;;      :get (nil (get-pointer pmultisamplestate)) :set
;;      ((pmultisamplestate-arg)
;;       (set-pointer pmultisamplestate pmultisamplestate-arg)))
;;     (pdepthstencilstate :name "pDepthStencilState" :type
;;      "VkPipelineDepthStencilStateCreateInfo" :init-form nil :create
;;      ((pdepthstencilstate-arg)
;;       (create-pointer pdepthstencilstate pdepthstencilstate-arg))
;;      :get (nil (get-pointer pdepthstencilstate)) :set
;;      ((pdepthstencilstate-arg)
;;       (set-pointer pdepthstencilstate pdepthstencilstate-arg)))
;;     (pcolorblendstate :name "pColorBlendState" :type
;;      "VkPipelineColorBlendStateCreateInfo" :init-form nil :create
;;      ((pcolorblendstate-arg)
;;       (create-pointer pcolorblendstate pcolorblendstate-arg))
;;      :get (nil (get-pointer pcolorblendstate)) :set
;;      ((pcolorblendstate-arg)
;;       (set-pointer pcolorblendstate pcolorblendstate-arg)))
;;     (pdynamicstate :name "pDynamicState" :type
;;      "VkPipelineDynamicStateCreateInfo" :init-form nil :create
;;      ((pdynamicstate-arg) (create-pointer pdynamicstate pdynamicstate-arg))
;;      :get (nil (get-pointer pdynamicstate)) :set
;;      ((pdynamicstate-arg) (set-pointer pdynamicstate pdynamicstate-arg)))
;;     (layout :name layout :type "VkPipelineLayout" :init-form nil :create
;;      ((layout-arg) (create-pointer layout layout-arg)) :get
;;      (nil (get-pointer layout)) :set
;;      ((layout-arg) (set-pointer layout layout-arg)))
;;     (renderpass :name "renderPass" :type "VkRenderPass" :init-form nil :create
;;      ((renderpass-arg) (create-pointer renderpass renderpass-arg)) :get
;;      (nil (get-pointer renderpass)) :set
;;      ((renderpass-arg) (set-pointer renderpass renderpass-arg)))
;;     (subpass :name subpass :type uint32)
;;     (basepipelinehandle :name "basePipelineHandle" :type "VkPipeline"
;;      :init-form nil :create
;;      ((basepipelinehandle-arg)
;;       (create-pointer basepipelinehandle basepipelinehandle-arg))
;;      :get (nil (get-pointer basepipelinehandle)) :set
;;      ((basepipelinehandle-arg)
;;       (set-pointer basepipelinehandle basepipelinehandle-arg)))
;;     (basepipelineindex :name "basePipelineIndex" :type int32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPushConstantRange"
;;       (push-constant-range)
;;       (:default-create :default-get :default-set)
;;     (stageflags :name "stageFlags" :type "VkShaderStageFlags")
;;     (offset :name offset :type uint32)
;;     (size :name size :type uint32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineLayoutCreateInfo"
;;       (pipeline-layout-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineLayoutCreateFlags")
;;     (setlayoutcount :name "setLayoutCount" :type uint32)
;;     (psetlayouts :name "pSetLayouts" :type (list "VkDescriptorSetLayout")
;;      :init-form nil :create
;;      ((psetlayouts-arg)
;;       (create-array vkdescriptorsetlayout psetlayouts psetlayouts-arg :dynamic
;;        t :pointers nil))
;;      :destroy (destroy-array psetlayouts) :get
;;      ((&optional psetlayouts-index)
;;       (get-array vkdescriptorsetlayout psetlayouts psetlayouts-index
;;        setlayoutcount :pointers nil))
;;      :set
;;      ((psetlayouts-arg &optional psetlayouts-index)
;;       (set-array vkdescriptorsetlayout psetlayouts psetlayouts-arg
;;        psetlayouts-index :dynamic t :pointers nil)))
;;     (pushconstantrangecount :name "pushConstantRangeCount" :type uint32)
;;     (ppushconstantranges :name "pPushConstantRanges" :type
;;      (list "VkPushConstantRange") :init-form nil :create
;;      ((ppushconstantranges-arg)
;;       (create-array (:struct vkpushconstantrange) ppushconstantranges
;;        ppushconstantranges-arg :dynamic t :pointers t))
;;      :destroy (destroy-array ppushconstantranges) :get
;;      ((&optional ppushconstantranges-index)
;;       (get-array (:struct vkpushconstantrange) ppushconstantranges
;;        ppushconstantranges-index pushconstantrangecount :pointers t))
;;      :set
;;      ((ppushconstantranges-arg &optional ppushconstantranges-index)
;;       (set-array (:struct vkpushconstantrange) ppushconstantranges
;;        ppushconstantranges-arg ppushconstantranges-index :dynamic t :pointers
;;        t))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSamplerCreateInfo"
;;       (sampler-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkSamplerCreateFlags")
;;     (magfilter :name "magFilter" :type "VkFilter")
;;     (minfilter :name "minFilter" :type "VkFilter")
;;     (mipmapmode :name "mipmapMode" :type "VkSamplerMipmapMode")
;;     (addressmodeu :name "addressModeU" :type "VkSamplerAddressMode")
;;     (addressmodev :name "addressModeV" :type "VkSamplerAddressMode")
;;     (addressmodew :name "addressModeW" :type "VkSamplerAddressMode")
;;     (miplodbias :name "mipLodBias" :type float)
;;     (anisotropyenable :name "anisotropyEnable" :type "VkBool32")
;;     (maxanisotropy :name "maxAnisotropy" :type float)
;;     (compareenable :name "compareEnable" :type "VkBool32")
;;     (compareop :name "compareOp" :type "VkCompareOp")
;;     (minlod :name "minLod" :type float)
;;     (maxlod :name "maxLod" :type float)
;;     (bordercolor :name "borderColor" :type "VkBorderColor")
;;     (unnormalizedcoordinates :name "unnormalizedCoordinates" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCopyDescriptorSet"
;;       (copy-descriptor-set)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcset :name "srcSet" :type "VkDescriptorSet" :create
;;      ((srcset-arg) (create-pointer srcset srcset-arg)) :get
;;      (nil (get-pointer srcset)) :set
;;      ((srcset-arg) (set-pointer srcset srcset-arg)))
;;     (srcbinding :name "srcBinding" :type uint32)
;;     (srcarrayelement :name "srcArrayElement" :type uint32)
;;     (dstset :name "dstSet" :type "VkDescriptorSet" :create
;;      ((dstset-arg) (create-pointer dstset dstset-arg)) :get
;;      (nil (get-pointer dstset)) :set
;;      ((dstset-arg) (set-pointer dstset dstset-arg)))
;;     (dstbinding :name "dstBinding" :type uint32)
;;     (dstarrayelement :name "dstArrayElement" :type uint32)
;;     (descriptorcount :name "descriptorCount" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorBufferInfo"
;;       (descriptor-buffer-info)
;;       (:default-create :default-get :default-set)
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg)))
;;     (offset :name offset :type "VkDeviceSize")
;;     (range :name range :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorImageInfo"
;;       (descriptor-image-info)
;;       (:default-create :default-get :default-set)
;;     (sampler :name sampler :type "VkSampler" :create
;;      ((sampler-arg) (create-pointer sampler sampler-arg)) :get
;;      (nil (get-pointer sampler)) :set
;;      ((sampler-arg) (set-pointer sampler sampler-arg)))
;;     (imageview :name "imageView" :type "VkImageView" :create
;;      ((imageview-arg) (create-pointer imageview imageview-arg)) :get
;;      (nil (get-pointer imageview)) :set
;;      ((imageview-arg) (set-pointer imageview imageview-arg)))
;;     (imagelayout :name "imageLayout" :type "VkImageLayout"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorPoolSize"
;;       (descriptor-pool-size)
;;       (:default-create :default-get :default-set)
;;     (type :name type :type "VkDescriptorType")
;;     (descriptorcount :name "descriptorCount" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorPoolCreateInfo"
;;       (descriptor-pool-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDescriptorPoolCreateFlags")
;;     (maxsets :name "maxSets" :type uint32)
;;     (poolsizecount :name "poolSizeCount" :type uint32)
;;     (ppoolsizes :name "pPoolSizes" :type "VkDescriptorPoolSize" :init-form nil
;;      :create
;;      ((ppoolsizes-arg)
;;       (create-array (:struct vkdescriptorpoolsize) ppoolsizes ppoolsizes-arg
;;        :dynamic t :pointers ("VkDescriptorPoolSize")))
;;      :destroy (destroy-array ppoolsizes) :get
;;      ((&optional ppoolsizes-index)
;;       (get-array (:struct vkdescriptorpoolsize) ppoolsizes ppoolsizes-index
;;        poolsizecount :pointers ("VkDescriptorPoolSize")))
;;      :set
;;      ((ppoolsizes-arg &optional ppoolsizes-index)
;;       (set-array (:struct vkdescriptorpoolsize) ppoolsizes ppoolsizes-arg
;;        ppoolsizes-index :dynamic t :pointers ("VkDescriptorPoolSize")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorSetAllocateInfo"
;;       (descriptor-set-allocate-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (descriptorpool :name "descriptorPool" :type "VkDescriptorPool" :create
;;      ((descriptorpool-arg) (create-pointer descriptorpool descriptorpool-arg))
;;      :get (nil (get-pointer descriptorpool)) :set
;;      ((descriptorpool-arg) (set-pointer descriptorpool descriptorpool-arg)))
;;     (descriptorsetcount :name "descriptorSetCount" :type uint32)
;;     (psetlayouts :name "pSetLayouts" :type "VkDescriptorSetLayout" :init-form
;;      nil :create
;;      ((psetlayouts-arg)
;;       (create-array vkdescriptorsetlayout psetlayouts psetlayouts-arg :dynamic
;;        t :pointers nil))
;;      :destroy (destroy-array psetlayouts) :get
;;      ((&optional psetlayouts-index)
;;       (get-array vkdescriptorsetlayout psetlayouts psetlayouts-index
;;        descriptorsetcount :pointers nil))
;;      :set
;;      ((psetlayouts-arg &optional psetlayouts-index)
;;       (set-array vkdescriptorsetlayout psetlayouts psetlayouts-arg
;;        psetlayouts-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorSetLayoutBinding"
;;       (descriptor-set-layout-binding)
;;       (:default-create :default-get :default-set)
;;     (binding :name binding :type uint32)
;;     (descriptortype :name "descriptorType" :type "VkDescriptorType")
;;     (descriptorcount :name "descriptorCount" :type uint32)
;;     (stageflags :name "stageFlags" :type "VkShaderStageFlags")
;;     (pimmutablesamplers :name "pImmutableSamplers" :type "VkSampler" :init-form
;;      nil :create
;;      ((pimmutablesamplers-arg)
;;       (create-pointer pimmutablesamplers pimmutablesamplers-arg))
;;      :get (nil (get-pointer pimmutablesamplers)) :set
;;      ((pimmutablesamplers-arg)
;;       (set-pointer pimmutablesamplers pimmutablesamplers-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorSetLayoutCreateInfo"
;;       (descriptor-set-layout-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDescriptorSetLayoutCreateFlags")
;;     (bindingcount :name "bindingCount" :type uint32)
;;     (pbindings :name "pBindings" :type "VkDescriptorSetLayoutBinding"
;;      :init-form nil :create
;;      ((pbindings-arg)
;;       (create-array (:struct vkdescriptorsetlayoutbinding) pbindings
;;        pbindings-arg :dynamic t :pointers ("VkDescriptorSetLayoutBinding")))
;;      :destroy (destroy-array pbindings) :get
;;      ((&optional pbindings-index)
;;       (get-array (:struct vkdescriptorsetlayoutbinding) pbindings
;;        pbindings-index bindingcount :pointers
;;        ("VkDescriptorSetLayoutBinding")))
;;      :set
;;      ((pbindings-arg &optional pbindings-index)
;;       (set-array (:struct vkdescriptorsetlayoutbinding) pbindings pbindings-arg
;;        pbindings-index :dynamic t :pointers ("VkDescriptorSetLayoutBinding")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkWriteDescriptorSet"
;;       (write-descriptor-set)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (dstset :name "dstSet" :type "VkDescriptorSet" :create
;;      ((dstset-arg) (create-pointer dstset dstset-arg)) :get
;;      (nil (get-pointer dstset)) :set
;;      ((dstset-arg) (set-pointer dstset dstset-arg)))
;;     (dstbinding :name "dstBinding" :type uint32)
;;     (dstarrayelement :name "dstArrayElement" :type uint32)
;;     (descriptorcount :name "descriptorCount" :type uint32)
;;     (descriptortype :name "descriptorType" :type "VkDescriptorType")
;;     (pimageinfo :name "pImageInfo" :type "VkDescriptorImageInfo" :init-form nil
;;      :create ((pimageinfo-arg) (create-pointer pimageinfo pimageinfo-arg)) :get
;;      (nil (get-pointer pimageinfo)) :set
;;      ((pimageinfo-arg) (set-pointer pimageinfo pimageinfo-arg)))
;;     (pbufferinfo :name "pBufferInfo" :type "VkDescriptorBufferInfo" :init-form
;;      nil :create
;;      ((pbufferinfo-arg) (create-pointer pbufferinfo pbufferinfo-arg)) :get
;;      (nil (get-pointer pbufferinfo)) :set
;;      ((pbufferinfo-arg) (set-pointer pbufferinfo pbufferinfo-arg)))
;;     (ptexelbufferview :name "pTexelBufferView" :type "VkBufferView" :init-form
;;      nil :create
;;      ((ptexelbufferview-arg)
;;       (create-pointer ptexelbufferview ptexelbufferview-arg))
;;      :get (nil (get-pointer ptexelbufferview)) :set
;;      ((ptexelbufferview-arg)
;;       (set-pointer ptexelbufferview ptexelbufferview-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAttachmentDescription"
;;       (attachment-description)
;;       (:default-create :default-get :default-set)
;;     (flags :name flags :type "VkAttachmentDescriptionFlags")
;;     (format :name format :type "VkFormat")
;;     (samples :name samples :type "VkSampleCountFlagBits")
;;     (loadop :name "loadOp" :type "VkAttachmentLoadOp")
;;     (storeop :name "storeOp" :type "VkAttachmentStoreOp")
;;     (stencilloadop :name "stencilLoadOp" :type "VkAttachmentLoadOp")
;;     (stencilstoreop :name "stencilStoreOp" :type "VkAttachmentStoreOp")
;;     (initiallayout :name "initialLayout" :type "VkImageLayout")
;;     (finallayout :name "finalLayout" :type "VkImageLayout"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAttachmentReference"
;;       (attachment-reference)
;;       (:default-create :default-get :default-set)
;;     (attachment :name attachment :type uint32)
;;     (layout :name layout :type "VkImageLayout"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFramebufferCreateInfo"
;;       (framebuffer-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkFramebufferCreateFlags")
;;     (renderpass :name "renderPass" :type "VkRenderPass" :create
;;      ((renderpass-arg) (create-pointer renderpass renderpass-arg)) :get
;;      (nil (get-pointer renderpass)) :set
;;      ((renderpass-arg) (set-pointer renderpass renderpass-arg)))
;;     (attachmentcount :name "attachmentCount" :type uint32)
;;     (pattachments :name "pAttachments" :type (list "VkImageView") :init-form
;;      nil :create
;;      ((pattachments-arg)
;;       (create-array vkimageview pattachments pattachments-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pattachments) :get
;;      ((&optional pattachments-index)
;;       (get-array vkimageview pattachments pattachments-index attachmentcount
;;        :pointers nil))
;;      :set
;;      ((pattachments-arg &optional pattachments-index)
;;       (set-array vkimageview pattachments pattachments-arg pattachments-index
;;        :dynamic t :pointers nil)))
;;     (width :name width :type uint32)
;;     (height :name height :type uint32)
;;     (layers :name layers :type uint32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubpassDescription"
;;       (subpass-description)
;;       (:default-create :default-get :default-set)
;;     (flags :name flags :type "VkSubpassDescriptionFlags")
;;     (pipelinebindpoint :name "pipelineBindPoint" :type "VkPipelineBindPoint")
;;     (inputattachmentcount :name "inputAttachmentCount" :type uint32)
;;     (pinputattachments :name "pInputAttachments" :type
;;      (list "VkAttachmentReference") :init-form nil :create
;;      ((pinputattachments-arg)
;;       (create-array (:struct vkattachmentreference) pinputattachments
;;        pinputattachments-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pinputattachments) :get
;;      ((&optional pinputattachments-index)
;;       (get-array (:struct vkattachmentreference) pinputattachments
;;        pinputattachments-index inputattachmentcount :pointers t))
;;      :set
;;      ((pinputattachments-arg &optional pinputattachments-index)
;;       (set-array (:struct vkattachmentreference) pinputattachments
;;        pinputattachments-arg pinputattachments-index :dynamic t :pointers t)))
;;     (colorattachmentcount :name "colorAttachmentCount" :type uint32)
;;     (pcolorattachments :name "pColorAttachments" :type
;;      (list "VkAttachmentReference") :init-form nil :create
;;      ((pcolorattachments-arg)
;;       (create-array (:struct vkattachmentreference) pcolorattachments
;;        pcolorattachments-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pcolorattachments) :get
;;      ((&optional pcolorattachments-index)
;;       (get-array (:struct vkattachmentreference) pcolorattachments
;;        pcolorattachments-index colorattachmentcount :pointers t))
;;      :set
;;      ((pcolorattachments-arg &optional pcolorattachments-index)
;;       (set-array (:struct vkattachmentreference) pcolorattachments
;;        pcolorattachments-arg pcolorattachments-index :dynamic t :pointers t)))
;;     (presolveattachments :name "pResolveAttachments" :type
;;      "VkAttachmentReference" :init-form nil :create
;;      ((presolveattachments-arg)
;;       (create-array (:struct vkattachmentreference) presolveattachments
;;        presolveattachments-arg :dynamic t :pointers t))
;;      :destroy (destroy-array presolveattachments) :get
;;      ((&optional presolveattachments-index)
;;       (get-array (:struct vkattachmentreference) presolveattachments
;;        presolveattachments-index colorattachmentcount :pointers t))
;;      :set
;;      ((presolveattachments-arg &optional presolveattachments-index)
;;       (set-array (:struct vkattachmentreference) presolveattachments
;;        presolveattachments-arg presolveattachments-index :dynamic t :pointers
;;        t)))
;;     (pdepthstencilattachment :name "pDepthStencilAttachment" :type
;;      "VkAttachmentReference" :init-form nil :create
;;      ((pdepthstencilattachment-arg)
;;       (create-pointer pdepthstencilattachment pdepthstencilattachment-arg))
;;      :get (nil (get-pointer pdepthstencilattachment)) :set
;;      ((pdepthstencilattachment-arg)
;;       (set-pointer pdepthstencilattachment pdepthstencilattachment-arg)))
;;     (preserveattachmentcount :name "preserveAttachmentCount" :type uint32)
;;     (ppreserveattachments :name "pPreserveAttachments" :type uint32 :init-form
;;      nil :create
;;      ((ppreserveattachments-arg)
;;       (create-array :uint32 ppreserveattachments ppreserveattachments-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array ppreserveattachments) :get
;;      ((&optional ppreserveattachments-index)
;;       (get-array :uint32 ppreserveattachments ppreserveattachments-index
;;        preserveattachmentcount :pointers nil))
;;      :set
;;      ((ppreserveattachments-arg &optional ppreserveattachments-index)
;;       (set-array :uint32 ppreserveattachments ppreserveattachments-arg
;;        ppreserveattachments-index :dynamic t :pointers nil))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubpassDependency"
;;       (subpass-dependency)
;;       (:default-create :default-get :default-set)
;;     (srcsubpass :name "srcSubpass" :type uint32)
;;     (dstsubpass :name "dstSubpass" :type uint32)
;;     (srcstagemask :name "srcStageMask" :type "VkPipelineStageFlags")
;;     (dststagemask :name "dstStageMask" :type "VkPipelineStageFlags")
;;     (srcaccessmask :name "srcAccessMask" :type "VkAccessFlags")
;;     (dstaccessmask :name "dstAccessMask" :type "VkAccessFlags")
;;     (dependencyflags :name "dependencyFlags" :type "VkDependencyFlags"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassCreateInfo"
;;       (render-pass-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkRenderPassCreateFlags")
;;     (attachmentcount :name "attachmentCount" :type uint32)
;;     (pattachments :name "pAttachments" :type (list "VkAttachmentDescription")
;;      :init-form nil :create
;;      ((pattachments-arg)
;;       (create-array (:struct vkattachmentdescription) pattachments
;;        pattachments-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pattachments) :get
;;      ((&optional pattachments-index)
;;       (get-array (:struct vkattachmentdescription) pattachments
;;        pattachments-index attachmentcount :pointers t))
;;      :set
;;      ((pattachments-arg &optional pattachments-index)
;;       (set-array (:struct vkattachmentdescription) pattachments
;;        pattachments-arg pattachments-index :dynamic t :pointers t)))
;;     (subpasscount :name "subpassCount" :type uint32)
;;     (psubpasses :name "pSubpasses" :type (list "VkSubpassDescription")
;;      :init-form nil :create
;;      ((psubpasses-arg)
;;       (create-array (:struct vksubpassdescription) psubpasses psubpasses-arg
;;        :dynamic t :pointers t))
;;      :destroy (destroy-array psubpasses) :get
;;      ((&optional psubpasses-index)
;;       (get-array (:struct vksubpassdescription) psubpasses psubpasses-index
;;        subpasscount :pointers t))
;;      :set
;;      ((psubpasses-arg &optional psubpasses-index)
;;       (set-array (:struct vksubpassdescription) psubpasses psubpasses-arg
;;        psubpasses-index :dynamic t :pointers t)))
;;     (dependencycount :name "dependencyCount" :type uint32)
;;     (pdependencies :name "pDependencies" :type (list "VkSubpassDependency")
;;      :init-form nil :create
;;      ((pdependencies-arg)
;;       (create-array (:struct vksubpassdependency) pdependencies
;;        pdependencies-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pdependencies) :get
;;      ((&optional pdependencies-index)
;;       (get-array (:struct vksubpassdependency) pdependencies
;;        pdependencies-index dependencycount :pointers t))
;;      :set
;;      ((pdependencies-arg &optional pdependencies-index)
;;       (set-array (:struct vksubpassdependency) pdependencies pdependencies-arg
;;        pdependencies-index :dynamic t :pointers t))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCommandPoolCreateInfo"
;;       (command-pool-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkCommandPoolCreateFlags")
;;     (queuefamilyindex :name "queueFamilyIndex" :type uint32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCommandBufferAllocateInfo"
;;       (command-buffer-allocate-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (commandpool :name "commandPool" :type "VkCommandPool" :create
;;      ((commandpool-arg) (create-pointer commandpool commandpool-arg)) :get
;;      (nil (get-pointer commandpool)) :set
;;      ((commandpool-arg) (set-pointer commandpool commandpool-arg)))
;;     (level :name level :type "VkCommandBufferLevel")
;;     (commandbuffercount :name "commandBufferCount" :type uint32))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCommandBufferInheritanceInfo"
;;       (command-buffer-inheritance-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (renderpass :name "renderPass" :type "VkRenderPass" :create
;;      ((renderpass-arg) (create-pointer renderpass renderpass-arg)) :get
;;      (nil (get-pointer renderpass)) :set
;;      ((renderpass-arg) (set-pointer renderpass renderpass-arg)))
;;     (subpass :name subpass :type uint32)
;;     (framebuffer :name framebuffer :type "VkFramebuffer" :create
;;      ((framebuffer-arg) (create-pointer framebuffer framebuffer-arg)) :get
;;      (nil (get-pointer framebuffer)) :set
;;      ((framebuffer-arg) (set-pointer framebuffer framebuffer-arg)))
;;     (occlusionqueryenable :name "occlusionQueryEnable" :type "VkBool32")
;;     (queryflags :name "queryFlags" :type "VkQueryControlFlags")
;;     (pipelinestatistics :name "pipelineStatistics" :type
;;      "VkQueryPipelineStatisticFlags"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCommandBufferBeginInfo"
;;       (command-buffer-begin-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkCommandBufferUsageFlags")
;;     (pinheritanceinfo :name "pInheritanceInfo" :type
;;      "VkCommandBufferInheritanceInfo" :init-form nil :create
;;      ((pinheritanceinfo-arg)
;;       (create-pointer pinheritanceinfo pinheritanceinfo-arg))
;;      :get (nil (get-pointer pinheritanceinfo)) :set
;;      ((pinheritanceinfo-arg)
;;       (set-pointer pinheritanceinfo pinheritanceinfo-arg))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferCopy"
;;       (buffer-copy)
;;       (:default-create :default-get :default-set)
;;     (srcoffset :name "srcOffset" :type "VkDeviceSize")
;;     (dstoffset :name "dstOffset" :type "VkDeviceSize")
;;     (size :name size :type "VkDeviceSize"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageSubresourceLayers"
;;       (image-subresource-layers)
;;       (:default-create :default-get :default-set)
;;     (aspectmask :name "aspectMask" :type "VkImageAspectFlags")
;;     (miplevel :name "mipLevel" :type uint32)
;;     (basearraylayer :name "baseArrayLayer" :type uint32)
;;     (layercount :name "layerCount" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferImageCopy"
;;       (buffer-image-copy)
;;       (:default-create :default-get :default-set)
;;     (bufferoffset :name "bufferOffset" :type "VkDeviceSize")
;;     (bufferrowlength :name "bufferRowLength" :type uint32)
;;     (bufferimageheight :name "bufferImageHeight" :type uint32)
;;     (imagesubresource :pointer t :name "imageSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((imagesubresource-arg)
;;       (copy-object imagesubresource imagesubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((imagesubresource-arg)
;;       (copy-object imagesubresource imagesubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (imageoffset :pointer t :name "imageOffset" :type "VkOffset3D" :create
;;      ((imageoffset-arg)
;;       (copy-object imageoffset imageoffset-arg '(:struct vkoffset3d)))
;;      :set
;;      ((imageoffset-arg)
;;       (copy-object imageoffset imageoffset-arg '(:struct vkoffset3d))))
;;     (imageextent :pointer t :name "imageExtent" :type "VkExtent3D" :create
;;      ((imageextent-arg)
;;       (copy-object imageextent imageextent-arg '(:struct vkextent3d)))
;;      :set
;;      ((imageextent-arg)
;;       (copy-object imageextent imageextent-arg '(:struct vkextent3d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-union doc-file
;;       "VkClearColorValue"
;;       (clear-color-value)
;;       (:default-create :default-get :default-set)
;;     (float32 :name float32 :type (list float) :create
;;      ((float32-arg)
;;       (create-array :float float32 float32-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional float32-index)
;;       (get-array :float float32 float32-index 4 :pointers nil))
;;      :set
;;      ((float32-arg &optional float32-index)
;;       (set-array :float float32 float32-arg float32-index :dynamic nil
;;        :pointers nil)))
;;     (int32 :name int32 :type (list int32) :create
;;      ((int32-arg)
;;       (create-array :int32 int32 int32-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional int32-index)
;;       (get-array :int32 int32 int32-index 4 :pointers nil))
;;      :set
;;      ((int32-arg &optional int32-index)
;;       (set-array :int32 int32 int32-arg int32-index :dynamic nil :pointers
;;        nil)))
;;     (uint32 :name uint32 :type (list uint32) :create
;;      ((uint32-arg)
;;       (create-array :uint32 uint32 uint32-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional uint32-index)
;;       (get-array :uint32 uint32 uint32-index 4 :pointers nil))
;;      :set
;;      ((uint32-arg &optional uint32-index)
;;       (set-array :uint32 uint32 uint32-arg uint32-index :dynamic nil :pointers
;;        nil))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkClearDepthStencilValue"
;;       (clear-depth-stencil-value)
;;       (:default-create :default-get :default-set)
;;     (depth :name depth :type float)
;;     (stencil :name stencil :type uint32))

;;   (more-cffi:def-foreign-union doc-file
;;       "VkClearValue"
;;       (clear-value)
;;       (:default-create :default-get :default-set)
;;     (color :pointer t :name color :type "VkClearColorValue" :create
;;      ((color-arg) (copy-object color color-arg '(:union vkclearcolorvalue)))
;;      :set
;;      ((color-arg) (copy-object color color-arg '(:union vkclearcolorvalue))))
;;     (depthstencil :pointer t :name "depthStencil" :type
;;      "VkClearDepthStencilValue" :create
;;      ((depthstencil-arg)
;;       (copy-object depthstencil depthstencil-arg
;;        '(:struct vkcleardepthstencilvalue)))
;;      :set
;;      ((depthstencil-arg)
;;       (copy-object depthstencil depthstencil-arg
;;        '(:struct vkcleardepthstencilvalue)))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkClearAttachment"
;;       (clear-attachment)
;;       (:default-create :default-get :default-set)
;;     (aspectmask :name "aspectMask" :type "VkImageAspectFlags")
;;     (colorattachment :name "colorAttachment" :type uint32)
;;     (clearvalue :pointer t :name "clearValue" :type "VkClearValue" :create
;;      ((clearvalue-arg)
;;       (copy-object clearvalue clearvalue-arg '(:union vkclearvalue)))
;;      :set
;;      ((clearvalue-arg)
;;       (copy-object clearvalue clearvalue-arg '(:union vkclearvalue)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkClearRect"
;;       (clear-rect)
;;       (:default-create :default-get :default-set)
;;     (rect :pointer t :name rect :type "VkRect2D" :create
;;      ((rect-arg) (copy-object rect rect-arg '(:struct vkrect2d))) :set
;;      ((rect-arg) (copy-object rect rect-arg '(:struct vkrect2d))))
;;     (basearraylayer :name "baseArrayLayer" :type uint32)
;;     (layercount :name "layerCount" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageBlit"
;;       (image-blit)
;;       (:default-create :default-get :default-set)
;;     (srcsubresource :pointer t :name "srcSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (srcoffsets :pointer t :name "srcOffsets" :type "VkOffset3D" :create
;;      ((srcoffsets-arg)
;;       (create-array (:struct vkoffset3d) srcoffsets srcoffsets-arg :dynamic nil
;;        :pointers ("VkOffset3D")))
;;      :get
;;      ((&optional srcoffsets-index)
;;       (get-array (:struct vkoffset3d) srcoffsets srcoffsets-index 2 :pointers
;;        ("VkOffset3D")))
;;      :set
;;      ((srcoffsets-arg &optional srcoffsets-index)
;;       (set-array (:struct vkoffset3d) srcoffsets srcoffsets-arg
;;        srcoffsets-index :dynamic nil :pointers ("VkOffset3D"))))
;;     (dstsubresource :pointer t :name "dstSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (dstoffsets :pointer t :name "dstOffsets" :type "VkOffset3D" :create
;;      ((dstoffsets-arg)
;;       (create-array (:struct vkoffset3d) dstoffsets dstoffsets-arg :dynamic nil
;;        :pointers ("VkOffset3D")))
;;      :get
;;      ((&optional dstoffsets-index)
;;       (get-array (:struct vkoffset3d) dstoffsets dstoffsets-index 2 :pointers
;;        ("VkOffset3D")))
;;      :set
;;      ((dstoffsets-arg &optional dstoffsets-index)
;;       (set-array (:struct vkoffset3d) dstoffsets dstoffsets-arg
;;        dstoffsets-index :dynamic nil :pointers ("VkOffset3D")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageCopy"
;;       (image-copy)
;;       (:default-create :default-get :default-set)
;;     (srcsubresource :pointer t :name "srcSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (srcoffset :pointer t :name "srcOffset" :type "VkOffset3D" :create
;;      ((srcoffset-arg)
;;       (copy-object srcoffset srcoffset-arg '(:struct vkoffset3d)))
;;      :set
;;      ((srcoffset-arg)
;;       (copy-object srcoffset srcoffset-arg '(:struct vkoffset3d))))
;;     (dstsubresource :pointer t :name "dstSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (dstoffset :pointer t :name "dstOffset" :type "VkOffset3D" :create
;;      ((dstoffset-arg)
;;       (copy-object dstoffset dstoffset-arg '(:struct vkoffset3d)))
;;      :set
;;      ((dstoffset-arg)
;;       (copy-object dstoffset dstoffset-arg '(:struct vkoffset3d))))
;;     (extent :pointer t :name extent :type "VkExtent3D" :create
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d))) :set
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageResolve"
;;       (image-resolve)
;;       (:default-create :default-get :default-set)
;;     (srcsubresource :pointer t :name "srcSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (srcoffset :pointer t :name "srcOffset" :type "VkOffset3D" :create
;;      ((srcoffset-arg)
;;       (copy-object srcoffset srcoffset-arg '(:struct vkoffset3d)))
;;      :set
;;      ((srcoffset-arg)
;;       (copy-object srcoffset srcoffset-arg '(:struct vkoffset3d))))
;;     (dstsubresource :pointer t :name "dstSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (dstoffset :pointer t :name "dstOffset" :type "VkOffset3D" :create
;;      ((dstoffset-arg)
;;       (copy-object dstoffset dstoffset-arg '(:struct vkoffset3d)))
;;      :set
;;      ((dstoffset-arg)
;;       (copy-object dstoffset dstoffset-arg '(:struct vkoffset3d))))
;;     (extent :pointer t :name extent :type "VkExtent3D" :create
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d))) :set
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassBeginInfo"
;;       (render-pass-begin-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (renderpass :name "renderPass" :type "VkRenderPass" :create
;;      ((renderpass-arg) (create-pointer renderpass renderpass-arg)) :get
;;      (nil (get-pointer renderpass)) :set
;;      ((renderpass-arg) (set-pointer renderpass renderpass-arg)))
;;     (framebuffer :name framebuffer :type "VkFramebuffer" :create
;;      ((framebuffer-arg) (create-pointer framebuffer framebuffer-arg)) :get
;;      (nil (get-pointer framebuffer)) :set
;;      ((framebuffer-arg) (set-pointer framebuffer framebuffer-arg)))
;;     (renderarea :pointer t :name "renderArea" :type "VkRect2D" :create
;;      ((renderarea-arg)
;;       (copy-object renderarea renderarea-arg '(:struct vkrect2d)))
;;      :set
;;      ((renderarea-arg)
;;       (copy-object renderarea renderarea-arg '(:struct vkrect2d))))
;;     (clearvaluecount :name "clearValueCount" :type uint32)
;;     (pclearvalues :name "pClearValues" :type (list "VkClearValue") :init-form
;;      nil :create
;;      ((pclearvalues-arg)
;;       (create-array (:union vkclearvalue) pclearvalues pclearvalues-arg
;;        :dynamic t :pointers ("VkClearValue")))
;;      :destroy (destroy-array pclearvalues) :get
;;      ((&optional pclearvalues-index)
;;       (get-array (:union vkclearvalue) pclearvalues pclearvalues-index
;;        clearvaluecount :pointers ("VkClearValue")))
;;      :set
;;      ((pclearvalues-arg &optional pclearvalues-index)
;;       (set-array (:union vkclearvalue) pclearvalues pclearvalues-arg
;;        pclearvalues-index :dynamic t :pointers ("VkClearValue")))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSubgroupProperties"
;;       (physical-device-subgroup-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (subgroupsize :name "subgroupSize" :type uint32)
;;     (supportedstages :name "supportedStages" :type "VkShaderStageFlags")
;;     (supportedoperations :name "supportedOperations" :type
;;      "VkSubgroupFeatureFlags")
;;     (quadoperationsinallstages :name "quadOperationsInAllStages" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindBufferMemoryInfo"
;;       (bind-buffer-memory-info-khr bind-buffer-memory-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg)))
;;     (memory :name memory :type "VkDeviceMemory" :create
;;      ((memory-arg) (create-pointer memory memory-arg)) :get
;;      (nil (get-pointer memory)) :set
;;      ((memory-arg) (set-pointer memory memory-arg)))
;;     (memoryoffset :name "memoryOffset" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindImageMemoryInfo"
;;       (bind-image-memory-info-khr bind-image-memory-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (image :name image :type "VkImage" :create
;;      ((image-arg) (create-pointer image image-arg)) :get
;;      (nil (get-pointer image)) :set ((image-arg) (set-pointer image image-arg)))
;;     (memory :name memory :type "VkDeviceMemory" :create
;;      ((memory-arg) (create-pointer memory memory-arg)) :get
;;      (nil (get-pointer memory)) :set
;;      ((memory-arg) (set-pointer memory memory-arg)))
;;     (memoryoffset :name "memoryOffset" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevice16BitStorageFeatures"
;;       (physical-device-1-6-bit-storage-features-khr
;;        physical-device-1-6-bit-storage-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (storagebuffer16bitaccess :name "storageBuffer16BitAccess" :type "VkBool32")
;;     (uniformandstoragebuffer16bitaccess :name
;;      "uniformAndStorageBuffer16BitAccess" :type "VkBool32")
;;     (storagepushconstant16 :name "storagePushConstant16" :type "VkBool32")
;;     (storageinputoutput16 :name "storageInputOutput16" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryDedicatedRequirements"
;;       (memory-dedicated-requirements-khr memory-dedicated-requirements)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (prefersdedicatedallocation :name "prefersDedicatedAllocation" :type
;;      "VkBool32")
;;     (requiresdedicatedallocation :name "requiresDedicatedAllocation" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryDedicatedAllocateInfo"
;;       (memory-dedicated-allocate-info-khr memory-dedicated-allocate-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (image :name image :type "VkImage" :create
;;      ((image-arg) (create-pointer image image-arg)) :get
;;      (nil (get-pointer image)) :set ((image-arg) (set-pointer image image-arg)))
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryAllocateFlagsInfo"
;;       (memory-allocate-flags-info-khr memory-allocate-flags-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkMemoryAllocateFlags")
;;     (devicemask :name "deviceMask" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceGroupRenderPassBeginInfo"
;;       (device-group-render-pass-begin-info-khr
;;        device-group-render-pass-begin-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (devicemask :name "deviceMask" :type uint32)
;;     (devicerenderareacount :name "deviceRenderAreaCount" :type uint32)
;;     (pdevicerenderareas :name "pDeviceRenderAreas" :type "VkRect2D" :init-form
;;      nil :create
;;      ((pdevicerenderareas-arg)
;;       (create-array (:struct vkrect2d) pdevicerenderareas
;;        pdevicerenderareas-arg :dynamic t :pointers ("VkRect2D")))
;;      :destroy (destroy-array pdevicerenderareas) :get
;;      ((&optional pdevicerenderareas-index)
;;       (get-array (:struct vkrect2d) pdevicerenderareas pdevicerenderareas-index
;;        devicerenderareacount :pointers ("VkRect2D")))
;;      :set
;;      ((pdevicerenderareas-arg &optional pdevicerenderareas-index)
;;       (set-array (:struct vkrect2d) pdevicerenderareas pdevicerenderareas-arg
;;        pdevicerenderareas-index :dynamic t :pointers ("VkRect2D")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceGroupCommandBufferBeginInfo"
;;       (device-group-command-buffer-begin-info-khr
;;        device-group-command-buffer-begin-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (devicemask :name "deviceMask" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceGroupSubmitInfo"
;;       (device-group-submit-info-khr device-group-submit-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (waitsemaphorecount :name "waitSemaphoreCount" :type uint32)
;;     (pwaitsemaphoredeviceindices :name "pWaitSemaphoreDeviceIndices" :type
;;      uint32 :init-form nil :create
;;      ((pwaitsemaphoredeviceindices-arg)
;;       (create-array :uint32 pwaitsemaphoredeviceindices
;;        pwaitsemaphoredeviceindices-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pwaitsemaphoredeviceindices) :get
;;      ((&optional pwaitsemaphoredeviceindices-index)
;;       (get-array :uint32 pwaitsemaphoredeviceindices
;;        pwaitsemaphoredeviceindices-index waitsemaphorecount :pointers nil))
;;      :set
;;      ((pwaitsemaphoredeviceindices-arg &optional
;;        pwaitsemaphoredeviceindices-index)
;;       (set-array :uint32 pwaitsemaphoredeviceindices
;;        pwaitsemaphoredeviceindices-arg pwaitsemaphoredeviceindices-index
;;        :dynamic t :pointers nil)))
;;     (commandbuffercount :name "commandBufferCount" :type uint32)
;;     (pcommandbufferdevicemasks :name "pCommandBufferDeviceMasks" :type uint32
;;      :init-form nil :create
;;      ((pcommandbufferdevicemasks-arg)
;;       (create-array :uint32 pcommandbufferdevicemasks
;;        pcommandbufferdevicemasks-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pcommandbufferdevicemasks) :get
;;      ((&optional pcommandbufferdevicemasks-index)
;;       (get-array :uint32 pcommandbufferdevicemasks
;;        pcommandbufferdevicemasks-index commandbuffercount :pointers nil))
;;      :set
;;      ((pcommandbufferdevicemasks-arg &optional pcommandbufferdevicemasks-index)
;;       (set-array :uint32 pcommandbufferdevicemasks
;;        pcommandbufferdevicemasks-arg pcommandbufferdevicemasks-index :dynamic t
;;        :pointers nil)))
;;     (signalsemaphorecount :name "signalSemaphoreCount" :type uint32)
;;     (psignalsemaphoredeviceindices :name "pSignalSemaphoreDeviceIndices" :type
;;      uint32 :init-form nil :create
;;      ((psignalsemaphoredeviceindices-arg)
;;       (create-array :uint32 psignalsemaphoredeviceindices
;;        psignalsemaphoredeviceindices-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array psignalsemaphoredeviceindices) :get
;;      ((&optional psignalsemaphoredeviceindices-index)
;;       (get-array :uint32 psignalsemaphoredeviceindices
;;        psignalsemaphoredeviceindices-index signalsemaphorecount :pointers nil))
;;      :set
;;      ((psignalsemaphoredeviceindices-arg &optional
;;        psignalsemaphoredeviceindices-index)
;;       (set-array :uint32 psignalsemaphoredeviceindices
;;        psignalsemaphoredeviceindices-arg psignalsemaphoredeviceindices-index
;;        :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceGroupBindSparseInfo"
;;       (device-group-bind-sparse-info-khr device-group-bind-sparse-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (resourcedeviceindex :name "resourceDeviceIndex" :type uint32)
;;     (memorydeviceindex :name "memoryDeviceIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindBufferMemoryDeviceGroupInfo"
;;       (bind-buffer-memory-device-group-info-khr
;;        bind-buffer-memory-device-group-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (deviceindexcount :name "deviceIndexCount" :type uint32)
;;     (pdeviceindices :name "pDeviceIndices" :type uint32 :init-form nil :create
;;      ((pdeviceindices-arg)
;;       (create-array :uint32 pdeviceindices pdeviceindices-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pdeviceindices) :get
;;      ((&optional pdeviceindices-index)
;;       (get-array :uint32 pdeviceindices pdeviceindices-index deviceindexcount
;;        :pointers nil))
;;      :set
;;      ((pdeviceindices-arg &optional pdeviceindices-index)
;;       (set-array :uint32 pdeviceindices pdeviceindices-arg pdeviceindices-index
;;        :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindImageMemoryDeviceGroupInfo"
;;       (bind-image-memory-device-group-info-khr
;;        bind-image-memory-device-group-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (deviceindexcount :name "deviceIndexCount" :type uint32)
;;     (pdeviceindices :name "pDeviceIndices" :type uint32 :init-form nil :create
;;      ((pdeviceindices-arg)
;;       (create-array :uint32 pdeviceindices pdeviceindices-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pdeviceindices) :get
;;      ((&optional pdeviceindices-index)
;;       (get-array :uint32 pdeviceindices pdeviceindices-index deviceindexcount
;;        :pointers nil))
;;      :set
;;      ((pdeviceindices-arg &optional pdeviceindices-index)
;;       (set-array :uint32 pdeviceindices pdeviceindices-arg pdeviceindices-index
;;        :dynamic t :pointers nil)))
;;     (splitinstancebindregioncount :name "splitInstanceBindRegionCount" :type
;;      uint32)
;;     (psplitinstancebindregions :name "pSplitInstanceBindRegions" :type
;;      "VkRect2D" :init-form nil :create
;;      ((psplitinstancebindregions-arg)
;;       (create-array (:struct vkrect2d) psplitinstancebindregions
;;        psplitinstancebindregions-arg :dynamic t :pointers ("VkRect2D")))
;;      :destroy (destroy-array psplitinstancebindregions) :get
;;      ((&optional psplitinstancebindregions-index)
;;       (get-array (:struct vkrect2d) psplitinstancebindregions
;;        psplitinstancebindregions-index splitinstancebindregioncount :pointers
;;        ("VkRect2D")))
;;      :set
;;      ((psplitinstancebindregions-arg &optional psplitinstancebindregions-index)
;;       (set-array (:struct vkrect2d) psplitinstancebindregions
;;        psplitinstancebindregions-arg psplitinstancebindregions-index :dynamic t
;;        :pointers ("VkRect2D")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceGroupProperties"
;;       (physical-device-group-properties-khr physical-device-group-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (physicaldevicecount :name "physicalDeviceCount" :type uint32)
;;     (physicaldevices :name "physicalDevices" :type "VkPhysicalDevice" :create
;;      ((physicaldevices-arg)
;;       (create-array vkphysicaldevice physicaldevices physicaldevices-arg
;;        :dynamic nil :pointers nil))
;;      :get
;;      ((&optional physicaldevices-index)
;;       (get-array vkphysicaldevice physicaldevices physicaldevices-index 32
;;        :pointers nil))
;;      :set
;;      ((physicaldevices-arg &optional physicaldevices-index)
;;       (set-array vkphysicaldevice physicaldevices physicaldevices-arg
;;        physicaldevices-index :dynamic nil :pointers nil)))
;;     (subsetallocation :name "subsetAllocation" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceGroupDeviceCreateInfo"
;;       (device-group-device-create-info-khr device-group-device-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (physicaldevicecount :name "physicalDeviceCount" :type uint32)
;;     (pphysicaldevices :name "pPhysicalDevices" :type "VkPhysicalDevice"
;;      :init-form nil :create
;;      ((pphysicaldevices-arg)
;;       (create-array vkphysicaldevice pphysicaldevices pphysicaldevices-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pphysicaldevices) :get
;;      ((&optional pphysicaldevices-index)
;;       (get-array vkphysicaldevice pphysicaldevices pphysicaldevices-index
;;        physicaldevicecount :pointers nil))
;;      :set
;;      ((pphysicaldevices-arg &optional pphysicaldevices-index)
;;       (set-array vkphysicaldevice pphysicaldevices pphysicaldevices-arg
;;        pphysicaldevices-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferMemoryRequirementsInfo2"
;;       (buffer-memory-requirements-info-2-khr buffer-memory-requirements-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageMemoryRequirementsInfo2"
;;       (image-memory-requirements-info-2-khr image-memory-requirements-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (image :name image :type "VkImage" :create
;;      ((image-arg) (create-pointer image image-arg)) :get
;;      (nil (get-pointer image)) :set
;;      ((image-arg) (set-pointer image image-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageSparseMemoryRequirementsInfo2"
;;       (image-sparse-memory-requirements-info-2-khr
;;        image-sparse-memory-requirements-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (image :name image :type "VkImage" :create
;;      ((image-arg) (create-pointer image image-arg)) :get
;;      (nil (get-pointer image)) :set
;;      ((image-arg) (set-pointer image image-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryRequirements2"
;;       (memory-requirements-2-khr memory-requirements-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (memoryrequirements :pointer t :name "memoryRequirements" :type
;;      "VkMemoryRequirements" :create
;;      ((memoryrequirements-arg)
;;       (copy-object memoryrequirements memoryrequirements-arg
;;        '(:struct vkmemoryrequirements)))
;;      :set
;;      ((memoryrequirements-arg)
;;       (copy-object memoryrequirements memoryrequirements-arg
;;        '(:struct vkmemoryrequirements)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSparseImageMemoryRequirements2"
;;       (sparse-image-memory-requirements-2-khr
;;        sparse-image-memory-requirements-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (memoryrequirements :pointer t :name "memoryRequirements" :type
;;      "VkSparseImageMemoryRequirements" :create
;;      ((memoryrequirements-arg)
;;       (copy-object memoryrequirements memoryrequirements-arg
;;        '(:struct vksparseimagememoryrequirements)))
;;      :set
;;      ((memoryrequirements-arg)
;;       (copy-object memoryrequirements memoryrequirements-arg
;;        '(:struct vksparseimagememoryrequirements)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFeatures2"
;;       (physical-device-features-2-khr physical-device-features-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (features :pointer t :name features :type "VkPhysicalDeviceFeatures"
;;      :create
;;      ((features-arg)
;;       (copy-object features features-arg '(:struct vkphysicaldevicefeatures)))
;;      :set
;;      ((features-arg)
;;       (copy-object features features-arg '(:struct vkphysicaldevicefeatures)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceProperties2"
;;       (physical-device-properties-2-khr physical-device-properties-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (properties :pointer t :name properties :type "VkPhysicalDeviceProperties"
;;      :create
;;      ((properties-arg)
;;       (copy-object properties properties-arg
;;        '(:struct vkphysicaldeviceproperties)))
;;      :set
;;      ((properties-arg)
;;       (copy-object properties properties-arg
;;        '(:struct vkphysicaldeviceproperties)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFormatProperties2"
;;       (format-properties-2-khr format-properties-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (formatproperties :pointer t :name "formatProperties" :type
;;      "VkFormatProperties" :create
;;      ((formatproperties-arg)
;;       (copy-object formatproperties formatproperties-arg
;;        '(:struct vkformatproperties)))
;;      :set
;;      ((formatproperties-arg)
;;       (copy-object formatproperties formatproperties-arg
;;        '(:struct vkformatproperties)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageFormatProperties2"
;;       (image-format-properties-2-khr image-format-properties-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imageformatproperties :pointer t :name "imageFormatProperties" :type
;;      "VkImageFormatProperties" :create
;;      ((imageformatproperties-arg)
;;       (copy-object imageformatproperties imageformatproperties-arg
;;        '(:struct vkimageformatproperties)))
;;      :set
;;      ((imageformatproperties-arg)
;;       (copy-object imageformatproperties imageformatproperties-arg
;;        '(:struct vkimageformatproperties)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceImageFormatInfo2"
;;       (physical-device-image-format-info-2-khr
;;        physical-device-image-format-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (format :name format :type "VkFormat")
;;     (type :name type :type "VkImageType")
;;     (tiling :name tiling :type "VkImageTiling")
;;     (usage :name usage :type "VkImageUsageFlags")
;;     (flags :name flags :type "VkImageCreateFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkQueueFamilyProperties2"
;;       (queue-family-properties-2-khr queue-family-properties-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (queuefamilyproperties :pointer t :name "queueFamilyProperties" :type
;;      "VkQueueFamilyProperties" :create
;;      ((queuefamilyproperties-arg)
;;       (copy-object queuefamilyproperties queuefamilyproperties-arg
;;        '(:struct vkqueuefamilyproperties)))
;;      :set
;;      ((queuefamilyproperties-arg)
;;       (copy-object queuefamilyproperties queuefamilyproperties-arg
;;        '(:struct vkqueuefamilyproperties)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMemoryProperties2"
;;       (physical-device-memory-properties-2-khr
;;        physical-device-memory-properties-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (memoryproperties :pointer t :name "memoryProperties" :type
;;      "VkPhysicalDeviceMemoryProperties" :create
;;      ((memoryproperties-arg)
;;       (copy-object memoryproperties memoryproperties-arg
;;        '(:struct vkphysicaldevicememoryproperties)))
;;      :set
;;      ((memoryproperties-arg)
;;       (copy-object memoryproperties memoryproperties-arg
;;        '(:struct vkphysicaldevicememoryproperties)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSparseImageFormatProperties2"
;;       (sparse-image-format-properties-2-khr sparse-image-format-properties-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (properties :pointer t :name properties :type
;;      "VkSparseImageFormatProperties" :create
;;      ((properties-arg)
;;       (copy-object properties properties-arg
;;        '(:struct vksparseimageformatproperties)))
;;      :set
;;      ((properties-arg)
;;       (copy-object properties properties-arg
;;        '(:struct vksparseimageformatproperties)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSparseImageFormatInfo2"
;;       (physical-device-sparse-image-format-info-2-khr
;;        physical-device-sparse-image-format-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (format :name format :type "VkFormat")
;;     (type :name type :type "VkImageType")
;;     (samples :name samples :type "VkSampleCountFlagBits")
;;     (usage :name usage :type "VkImageUsageFlags")
;;     (tiling :name tiling :type "VkImageTiling"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePointClippingProperties"
;;       (physical-device-point-clipping-properties-khr
;;        physical-device-point-clipping-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pointclippingbehavior :name "pointClippingBehavior" :type
;;      "VkPointClippingBehavior"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkInputAttachmentAspectReference"
;;       (input-attachment-aspect-reference-khr input-attachment-aspect-reference)
;;       (:default-create :default-get :default-set)
;;     (subpass :name subpass :type uint32)
;;     (inputattachmentindex :name "inputAttachmentIndex" :type uint32)
;;     (aspectmask :name "aspectMask" :type "VkImageAspectFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassInputAttachmentAspectCreateInfo"
;;       (render-pass-input-attachment-aspect-create-info-khr
;;        render-pass-input-attachment-aspect-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (aspectreferencecount :name "aspectReferenceCount" :type uint32)
;;     (paspectreferences :name "pAspectReferences" :type
;;      "VkInputAttachmentAspectReference" :init-form nil :create
;;      ((paspectreferences-arg)
;;       (create-array (:struct vkinputattachmentaspectreference)
;;        paspectreferences paspectreferences-arg :dynamic t :pointers
;;        ("VkInputAttachmentAspectReference")))
;;      :destroy (destroy-array paspectreferences) :get
;;      ((&optional paspectreferences-index)
;;       (get-array (:struct vkinputattachmentaspectreference) paspectreferences
;;        paspectreferences-index aspectreferencecount :pointers
;;        ("VkInputAttachmentAspectReference")))
;;      :set
;;      ((paspectreferences-arg &optional paspectreferences-index)
;;       (set-array (:struct vkinputattachmentaspectreference) paspectreferences
;;        paspectreferences-arg paspectreferences-index :dynamic t :pointers
;;        ("VkInputAttachmentAspectReference")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageViewUsageCreateInfo"
;;       (image-view-usage-create-info-khr image-view-usage-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (usage :name usage :type "VkImageUsageFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineTessellationDomainOriginStateCreateInfo"
;;       (pipeline-tessellation-domain-origin-state-create-info-khr
;;        pipeline-tessellation-domain-origin-state-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (domainorigin :name "domainOrigin" :type "VkTessellationDomainOrigin"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassMultiviewCreateInfo"
;;       (render-pass-multiview-create-info-khr render-pass-multiview-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (subpasscount :name "subpassCount" :type uint32)
;;     (pviewmasks :name "pViewMasks" :type uint32 :init-form nil :create
;;      ((pviewmasks-arg)
;;       (create-array :uint32 pviewmasks pviewmasks-arg :dynamic t :pointers
;;        nil))
;;      :destroy (destroy-array pviewmasks) :get
;;      ((&optional pviewmasks-index)
;;       (get-array :uint32 pviewmasks pviewmasks-index subpasscount :pointers
;;        nil))
;;      :set
;;      ((pviewmasks-arg &optional pviewmasks-index)
;;       (set-array :uint32 pviewmasks pviewmasks-arg pviewmasks-index :dynamic t
;;        :pointers nil)))
;;     (dependencycount :name "dependencyCount" :type uint32)
;;     (pviewoffsets :name "pViewOffsets" :type int32 :init-form nil :create
;;      ((pviewoffsets-arg)
;;       (create-array :int32 pviewoffsets pviewoffsets-arg :dynamic t :pointers
;;        nil))
;;      :destroy (destroy-array pviewoffsets) :get
;;      ((&optional pviewoffsets-index)
;;       (get-array :int32 pviewoffsets pviewoffsets-index dependencycount
;;        :pointers nil))
;;      :set
;;      ((pviewoffsets-arg &optional pviewoffsets-index)
;;       (set-array :int32 pviewoffsets pviewoffsets-arg pviewoffsets-index
;;        :dynamic t :pointers nil)))
;;     (correlationmaskcount :name "correlationMaskCount" :type uint32)
;;     (pcorrelationmasks :name "pCorrelationMasks" :type uint32 :init-form nil
;;      :create
;;      ((pcorrelationmasks-arg)
;;       (create-array :uint32 pcorrelationmasks pcorrelationmasks-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pcorrelationmasks) :get
;;      ((&optional pcorrelationmasks-index)
;;       (get-array :uint32 pcorrelationmasks pcorrelationmasks-index
;;        correlationmaskcount :pointers nil))
;;      :set
;;      ((pcorrelationmasks-arg &optional pcorrelationmasks-index)
;;       (set-array :uint32 pcorrelationmasks pcorrelationmasks-arg
;;        pcorrelationmasks-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMultiviewFeatures"
;;       (physical-device-multiview-features-khr
;;        physical-device-multiview-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (multiview :name multiview :type "VkBool32")
;;     (multiviewgeometryshader :name "multiviewGeometryShader" :type "VkBool32")
;;     (multiviewtessellationshader :name "multiviewTessellationShader" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMultiviewProperties"
;;       (physical-device-multiview-properties-khr
;;        physical-device-multiview-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxmultiviewviewcount :name "maxMultiviewViewCount" :type uint32)
;;     (maxmultiviewinstanceindex :name "maxMultiviewInstanceIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVariablePointersFeatures"
;;       (physical-device-variable-pointers-features-khr
;;        physical-device-variable-pointer-features-khr
;;        physical-device-variable-pointer-features
;;        physical-device-variable-pointers-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (variablepointersstoragebuffer :name "variablePointersStorageBuffer" :type
;;      "VkBool32")
;;     (variablepointers :name "variablePointers" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceProtectedMemoryFeatures"
;;       (physical-device-protected-memory-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (protectedmemory :name "protectedMemory" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceProtectedMemoryProperties"
;;       (physical-device-protected-memory-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (protectednofault :name "protectedNoFault" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceQueueInfo2"
;;       (device-queue-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDeviceQueueCreateFlags")
;;     (queuefamilyindex :name "queueFamilyIndex" :type uint32)
;;     (queueindex :name "queueIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkProtectedSubmitInfo"
;;       (protected-submit-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (protectedsubmit :name "protectedSubmit" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSamplerYcbcrConversionCreateInfo"
;;       (sampler-ycbcr-conversion-create-info-khr
;;        sampler-ycbcr-conversion-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (format :name format :type "VkFormat")
;;     (ycbcrmodel :name "ycbcrModel" :type "VkSamplerYcbcrModelConversion")
;;     (ycbcrrange :name "ycbcrRange" :type "VkSamplerYcbcrRange")
;;     (components :pointer t :name components :type "VkComponentMapping" :create
;;      ((components-arg)
;;       (copy-object components components-arg '(:struct vkcomponentmapping)))
;;      :set
;;      ((components-arg)
;;       (copy-object components components-arg '(:struct vkcomponentmapping))))
;;     (xchromaoffset :name "xChromaOffset" :type "VkChromaLocation")
;;     (ychromaoffset :name "yChromaOffset" :type "VkChromaLocation")
;;     (chromafilter :name "chromaFilter" :type "VkFilter")
;;     (forceexplicitreconstruction :name "forceExplicitReconstruction" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSamplerYcbcrConversionInfo"
;;       (sampler-ycbcr-conversion-info-khr sampler-ycbcr-conversion-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (conversion :name conversion :type "VkSamplerYcbcrConversion" :create
;;      ((conversion-arg) (create-pointer conversion conversion-arg)) :get
;;      (nil (get-pointer conversion)) :set
;;      ((conversion-arg) (set-pointer conversion conversion-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindImagePlaneMemoryInfo"
;;       (bind-image-plane-memory-info-khr bind-image-plane-memory-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (planeaspect :name "planeAspect" :type "VkImageAspectFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImagePlaneMemoryRequirementsInfo"
;;       (image-plane-memory-requirements-info-khr
;;        image-plane-memory-requirements-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (planeaspect :name "planeAspect" :type "VkImageAspectFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSamplerYcbcrConversionFeatures"
;;       (physical-device-sampler-ycbcr-conversion-features-khr
;;        physical-device-sampler-ycbcr-conversion-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (samplerycbcrconversion :name "samplerYcbcrConversion" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSamplerYcbcrConversionImageFormatProperties"
;;       (sampler-ycbcr-conversion-image-format-properties-khr
;;        sampler-ycbcr-conversion-image-format-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (combinedimagesamplerdescriptorcount :name
;;      "combinedImageSamplerDescriptorCount" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorUpdateTemplateEntry"
;;       (descriptor-update-template-entry-khr descriptor-update-template-entry)
;;       (:default-create :default-get :default-set)
;;     (dstbinding :name "dstBinding" :type uint32)
;;     (dstarrayelement :name "dstArrayElement" :type uint32)
;;     (descriptorcount :name "descriptorCount" :type uint32)
;;     (descriptortype :name "descriptorType" :type "VkDescriptorType")
;;     (offset :name offset :type size)
;;     (stride :name stride :type size))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorUpdateTemplateCreateInfo"
;;       (descriptor-update-template-create-info-khr
;;        descriptor-update-template-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDescriptorUpdateTemplateCreateFlags")
;;     (descriptorupdateentrycount :name "descriptorUpdateEntryCount" :type uint32)
;;     (pdescriptorupdateentries :name "pDescriptorUpdateEntries" :type
;;      "VkDescriptorUpdateTemplateEntry" :init-form nil :create
;;      ((pdescriptorupdateentries-arg)
;;       (create-array (:struct vkdescriptorupdatetemplateentry)
;;        pdescriptorupdateentries pdescriptorupdateentries-arg :dynamic t
;;        :pointers ("VkDescriptorUpdateTemplateEntry")))
;;      :destroy (destroy-array pdescriptorupdateentries) :get
;;      ((&optional pdescriptorupdateentries-index)
;;       (get-array (:struct vkdescriptorupdatetemplateentry)
;;        pdescriptorupdateentries pdescriptorupdateentries-index
;;        descriptorupdateentrycount :pointers
;;        ("VkDescriptorUpdateTemplateEntry")))
;;      :set
;;      ((pdescriptorupdateentries-arg &optional pdescriptorupdateentries-index)
;;       (set-array (:struct vkdescriptorupdatetemplateentry)
;;        pdescriptorupdateentries pdescriptorupdateentries-arg
;;        pdescriptorupdateentries-index :dynamic t :pointers
;;        ("VkDescriptorUpdateTemplateEntry"))))
;;     (templatetype :name "templateType" :type "VkDescriptorUpdateTemplateType")
;;     (descriptorsetlayout :name "descriptorSetLayout" :type
;;      "VkDescriptorSetLayout" :create
;;      ((descriptorsetlayout-arg)
;;       (create-pointer descriptorsetlayout descriptorsetlayout-arg))
;;      :get (nil (get-pointer descriptorsetlayout)) :set
;;      ((descriptorsetlayout-arg)
;;       (set-pointer descriptorsetlayout descriptorsetlayout-arg)))
;;     (pipelinebindpoint :name "pipelineBindPoint" :type "VkPipelineBindPoint")
;;     (pipelinelayout :name "pipelineLayout" :type "VkPipelineLayout" :create
;;      ((pipelinelayout-arg) (create-pointer pipelinelayout pipelinelayout-arg))
;;      :get (nil (get-pointer pipelinelayout)) :set
;;      ((pipelinelayout-arg) (set-pointer pipelinelayout pipelinelayout-arg)))
;;     (set :name set :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExternalMemoryProperties"
;;       (external-memory-properties-khr external-memory-properties)
;;       (:default-create :default-get :default-set)
;;     (externalmemoryfeatures :name "externalMemoryFeatures" :type
;;      "VkExternalMemoryFeatureFlags")
;;     (exportfromimportedhandletypes :name "exportFromImportedHandleTypes" :type
;;      "VkExternalMemoryHandleTypeFlags")
;;     (compatiblehandletypes :name "compatibleHandleTypes" :type
;;      "VkExternalMemoryHandleTypeFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceExternalImageFormatInfo"
;;       (physical-device-external-image-format-info-khr
;;        physical-device-external-image-format-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletype :name "handleType" :type "VkExternalMemoryHandleTypeFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExternalImageFormatProperties"
;;       (external-image-format-properties-khr external-image-format-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (externalmemoryproperties :pointer t :name "externalMemoryProperties" :type
;;      "VkExternalMemoryProperties" :create
;;      ((externalmemoryproperties-arg)
;;       (copy-object externalmemoryproperties externalmemoryproperties-arg
;;        '(:struct vkexternalmemoryproperties)))
;;      :set
;;      ((externalmemoryproperties-arg)
;;       (copy-object externalmemoryproperties externalmemoryproperties-arg
;;        '(:struct vkexternalmemoryproperties)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceExternalBufferInfo"
;;       (physical-device-external-buffer-info-khr
;;        physical-device-external-buffer-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkBufferCreateFlags")
;;     (usage :name usage :type "VkBufferUsageFlags")
;;     (handletype :name "handleType" :type "VkExternalMemoryHandleTypeFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExternalBufferProperties"
;;       (external-buffer-properties-khr external-buffer-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (externalmemoryproperties :pointer t :name "externalMemoryProperties" :type
;;      "VkExternalMemoryProperties" :create
;;      ((externalmemoryproperties-arg)
;;       (copy-object externalmemoryproperties externalmemoryproperties-arg
;;        '(:struct vkexternalmemoryproperties)))
;;      :set
;;      ((externalmemoryproperties-arg)
;;       (copy-object externalmemoryproperties externalmemoryproperties-arg
;;        '(:struct vkexternalmemoryproperties)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceIDProperties"
;;       (physical-device-i-d-properties-khr physical-device-i-d-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (deviceuuid :name "deviceUUID" :type uint8 :create
;;      ((deviceuuid-arg)
;;       (create-array :uint8 deviceuuid deviceuuid-arg :dynamic nil :pointers
;;        nil))
;;      :get
;;      ((&optional deviceuuid-index)
;;       (get-array :uint8 deviceuuid deviceuuid-index 16 :pointers nil))
;;      :set
;;      ((deviceuuid-arg &optional deviceuuid-index)
;;       (set-array :uint8 deviceuuid deviceuuid-arg deviceuuid-index :dynamic nil
;;        :pointers nil)))
;;     (driveruuid :name "driverUUID" :type uint8 :create
;;      ((driveruuid-arg)
;;       (create-array :uint8 driveruuid driveruuid-arg :dynamic nil :pointers
;;        nil))
;;      :get
;;      ((&optional driveruuid-index)
;;       (get-array :uint8 driveruuid driveruuid-index 16 :pointers nil))
;;      :set
;;      ((driveruuid-arg &optional driveruuid-index)
;;       (set-array :uint8 driveruuid driveruuid-arg driveruuid-index :dynamic nil
;;        :pointers nil)))
;;     (deviceluid :name "deviceLUID" :type uint8 :create
;;      ((deviceluid-arg)
;;       (create-array :uint8 deviceluid deviceluid-arg :dynamic nil :pointers
;;        nil))
;;      :get
;;      ((&optional deviceluid-index)
;;       (get-array :uint8 deviceluid deviceluid-index 8 :pointers nil))
;;      :set
;;      ((deviceluid-arg &optional deviceluid-index)
;;       (set-array :uint8 deviceluid deviceluid-arg deviceluid-index :dynamic nil
;;        :pointers nil)))
;;     (devicenodemask :name "deviceNodeMask" :type uint32)
;;     (deviceluidvalid :name "deviceLUIDValid" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExternalMemoryImageCreateInfo"
;;       (external-memory-image-create-info-khr external-memory-image-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletypes :name "handleTypes" :type "VkExternalMemoryHandleTypeFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExternalMemoryBufferCreateInfo"
;;       (external-memory-buffer-create-info-khr
;;        external-memory-buffer-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletypes :name "handleTypes" :type "VkExternalMemoryHandleTypeFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExportMemoryAllocateInfo"
;;       (export-memory-allocate-info-khr export-memory-allocate-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletypes :name "handleTypes" :type "VkExternalMemoryHandleTypeFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceExternalFenceInfo"
;;       (physical-device-external-fence-info-khr
;;        physical-device-external-fence-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletype :name "handleType" :type "VkExternalFenceHandleTypeFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExternalFenceProperties"
;;       (external-fence-properties-khr external-fence-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (exportfromimportedhandletypes :name "exportFromImportedHandleTypes" :type
;;      "VkExternalFenceHandleTypeFlags")
;;     (compatiblehandletypes :name "compatibleHandleTypes" :type
;;      "VkExternalFenceHandleTypeFlags")
;;     (externalfencefeatures :name "externalFenceFeatures" :type
;;      "VkExternalFenceFeatureFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExportFenceCreateInfo"
;;       (export-fence-create-info-khr export-fence-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletypes :name "handleTypes" :type "VkExternalFenceHandleTypeFlags"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExportSemaphoreCreateInfo"
;;       (export-semaphore-create-info-khr export-semaphore-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletypes :name "handleTypes" :type
;;      "VkExternalSemaphoreHandleTypeFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceExternalSemaphoreInfo"
;;       (physical-device-external-semaphore-info-khr
;;        physical-device-external-semaphore-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletype :name "handleType" :type
;;      "VkExternalSemaphoreHandleTypeFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExternalSemaphoreProperties"
;;       (external-semaphore-properties-khr external-semaphore-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (exportfromimportedhandletypes :name "exportFromImportedHandleTypes" :type
;;      "VkExternalSemaphoreHandleTypeFlags")
;;     (compatiblehandletypes :name "compatibleHandleTypes" :type
;;      "VkExternalSemaphoreHandleTypeFlags")
;;     (externalsemaphorefeatures :name "externalSemaphoreFeatures" :type
;;      "VkExternalSemaphoreFeatureFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMaintenance3Properties"
;;       (physical-device-maintenance-3-properties-khr
;;        physical-device-maintenance-3-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxpersetdescriptors :name "maxPerSetDescriptors" :type uint32)
;;     (maxmemoryallocationsize :name "maxMemoryAllocationSize" :type
;;      "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorSetLayoutSupport"
;;       (descriptor-set-layout-support-khr descriptor-set-layout-support)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (supported :name supported :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderDrawParametersFeatures"
;;       (physical-device-shader-draw-parameter-features
;;        physical-device-shader-draw-parameters-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderdrawparameters :name "shaderDrawParameters" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVulkan11Features"
;;       (physical-device-vulkan-1-1-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (storagebuffer16bitaccess :name "storageBuffer16BitAccess" :type "VkBool32")
;;     (uniformandstoragebuffer16bitaccess :name
;;      "uniformAndStorageBuffer16BitAccess" :type "VkBool32")
;;     (storagepushconstant16 :name "storagePushConstant16" :type "VkBool32")
;;     (storageinputoutput16 :name "storageInputOutput16" :type "VkBool32")
;;     (multiview :name multiview :type "VkBool32")
;;     (multiviewgeometryshader :name "multiviewGeometryShader" :type "VkBool32")
;;     (multiviewtessellationshader :name "multiviewTessellationShader" :type
;;      "VkBool32")
;;     (variablepointersstoragebuffer :name "variablePointersStorageBuffer" :type
;;      "VkBool32")
;;     (variablepointers :name "variablePointers" :type "VkBool32")
;;     (protectedmemory :name "protectedMemory" :type "VkBool32")
;;     (samplerycbcrconversion :name "samplerYcbcrConversion" :type "VkBool32")
;;     (shaderdrawparameters :name "shaderDrawParameters" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVulkan11Properties"
;;       (physical-device-vulkan-1-1-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (deviceuuid :name "deviceUUID" :type uint8 :create
;;      ((deviceuuid-arg)
;;       (create-array :uint8 deviceuuid deviceuuid-arg :dynamic nil :pointers
;;        nil))
;;      :get
;;      ((&optional deviceuuid-index)
;;       (get-array :uint8 deviceuuid deviceuuid-index 16 :pointers nil))
;;      :set
;;      ((deviceuuid-arg &optional deviceuuid-index)
;;       (set-array :uint8 deviceuuid deviceuuid-arg deviceuuid-index :dynamic nil
;;        :pointers nil)))
;;     (driveruuid :name "driverUUID" :type uint8 :create
;;      ((driveruuid-arg)
;;       (create-array :uint8 driveruuid driveruuid-arg :dynamic nil :pointers
;;        nil))
;;      :get
;;      ((&optional driveruuid-index)
;;       (get-array :uint8 driveruuid driveruuid-index 16 :pointers nil))
;;      :set
;;      ((driveruuid-arg &optional driveruuid-index)
;;       (set-array :uint8 driveruuid driveruuid-arg driveruuid-index :dynamic nil
;;        :pointers nil)))
;;     (deviceluid :name "deviceLUID" :type uint8 :create
;;      ((deviceluid-arg)
;;       (create-array :uint8 deviceluid deviceluid-arg :dynamic nil :pointers
;;        nil))
;;      :get
;;      ((&optional deviceluid-index)
;;       (get-array :uint8 deviceluid deviceluid-index 8 :pointers nil))
;;      :set
;;      ((deviceluid-arg &optional deviceluid-index)
;;       (set-array :uint8 deviceluid deviceluid-arg deviceluid-index :dynamic nil
;;        :pointers nil)))
;;     (devicenodemask :name "deviceNodeMask" :type uint32)
;;     (deviceluidvalid :name "deviceLUIDValid" :type "VkBool32")
;;     (subgroupsize :name "subgroupSize" :type uint32)
;;     (subgroupsupportedstages :name "subgroupSupportedStages" :type
;;      "VkShaderStageFlags")
;;     (subgroupsupportedoperations :name "subgroupSupportedOperations" :type
;;      "VkSubgroupFeatureFlags")
;;     (subgroupquadoperationsinallstages :name
;;      "subgroupQuadOperationsInAllStages" :type "VkBool32")
;;     (pointclippingbehavior :name "pointClippingBehavior" :type
;;      "VkPointClippingBehavior")
;;     (maxmultiviewviewcount :name "maxMultiviewViewCount" :type uint32)
;;     (maxmultiviewinstanceindex :name "maxMultiviewInstanceIndex" :type uint32)
;;     (protectednofault :name "protectedNoFault" :type "VkBool32")
;;     (maxpersetdescriptors :name "maxPerSetDescriptors" :type uint32)
;;     (maxmemoryallocationsize :name "maxMemoryAllocationSize" :type
;;      "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVulkan12Features"
;;       (physical-device-vulkan-1-2-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (samplermirrorclamptoedge :name "samplerMirrorClampToEdge" :type "VkBool32")
;;     (drawindirectcount :name "drawIndirectCount" :type "VkBool32")
;;     (storagebuffer8bitaccess :name "storageBuffer8BitAccess" :type "VkBool32")
;;     (uniformandstoragebuffer8bitaccess :name
;;      "uniformAndStorageBuffer8BitAccess" :type "VkBool32")
;;     (storagepushconstant8 :name "storagePushConstant8" :type "VkBool32")
;;     (shaderbufferint64atomics :name "shaderBufferInt64Atomics" :type "VkBool32")
;;     (shadersharedint64atomics :name "shaderSharedInt64Atomics" :type "VkBool32")
;;     (shaderfloat16 :name "shaderFloat16" :type "VkBool32")
;;     (shaderint8 :name "shaderInt8" :type "VkBool32")
;;     (descriptorindexing :name "descriptorIndexing" :type "VkBool32")
;;     (shaderinputattachmentarraydynamicindexing :name
;;      "shaderInputAttachmentArrayDynamicIndexing" :type "VkBool32")
;;     (shaderuniformtexelbufferarraydynamicindexing :name
;;      "shaderUniformTexelBufferArrayDynamicIndexing" :type "VkBool32")
;;     (shaderstoragetexelbufferarraydynamicindexing :name
;;      "shaderStorageTexelBufferArrayDynamicIndexing" :type "VkBool32")
;;     (shaderuniformbufferarraynonuniformindexing :name
;;      "shaderUniformBufferArrayNonUniformIndexing" :type "VkBool32")
;;     (shadersampledimagearraynonuniformindexing :name
;;      "shaderSampledImageArrayNonUniformIndexing" :type "VkBool32")
;;     (shaderstoragebufferarraynonuniformindexing :name
;;      "shaderStorageBufferArrayNonUniformIndexing" :type "VkBool32")
;;     (shaderstorageimagearraynonuniformindexing :name
;;      "shaderStorageImageArrayNonUniformIndexing" :type "VkBool32")
;;     (shaderinputattachmentarraynonuniformindexing :name
;;      "shaderInputAttachmentArrayNonUniformIndexing" :type "VkBool32")
;;     (shaderuniformtexelbufferarraynonuniformindexing :name
;;      "shaderUniformTexelBufferArrayNonUniformIndexing" :type "VkBool32")
;;     (shaderstoragetexelbufferarraynonuniformindexing :name
;;      "shaderStorageTexelBufferArrayNonUniformIndexing" :type "VkBool32")
;;     (descriptorbindinguniformbufferupdateafterbind :name
;;      "descriptorBindingUniformBufferUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindingsampledimageupdateafterbind :name
;;      "descriptorBindingSampledImageUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindingstorageimageupdateafterbind :name
;;      "descriptorBindingStorageImageUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindingstoragebufferupdateafterbind :name
;;      "descriptorBindingStorageBufferUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindinguniformtexelbufferupdateafterbind :name
;;      "descriptorBindingUniformTexelBufferUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindingstoragetexelbufferupdateafterbind :name
;;      "descriptorBindingStorageTexelBufferUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindingupdateunusedwhilepending :name
;;      "descriptorBindingUpdateUnusedWhilePending" :type "VkBool32")
;;     (descriptorbindingpartiallybound :name "descriptorBindingPartiallyBound"
;;      :type "VkBool32")
;;     (descriptorbindingvariabledescriptorcount :name
;;      "descriptorBindingVariableDescriptorCount" :type "VkBool32")
;;     (runtimedescriptorarray :name "runtimeDescriptorArray" :type "VkBool32")
;;     (samplerfilterminmax :name "samplerFilterMinmax" :type "VkBool32")
;;     (scalarblocklayout :name "scalarBlockLayout" :type "VkBool32")
;;     (imagelessframebuffer :name "imagelessFramebuffer" :type "VkBool32")
;;     (uniformbufferstandardlayout :name "uniformBufferStandardLayout" :type
;;      "VkBool32")
;;     (shadersubgroupextendedtypes :name "shaderSubgroupExtendedTypes" :type
;;      "VkBool32")
;;     (separatedepthstencillayouts :name "separateDepthStencilLayouts" :type
;;      "VkBool32")
;;     (hostqueryreset :name "hostQueryReset" :type "VkBool32")
;;     (timelinesemaphore :name "timelineSemaphore" :type "VkBool32")
;;     (bufferdeviceaddress :name "bufferDeviceAddress" :type "VkBool32")
;;     (bufferdeviceaddresscapturereplay :name "bufferDeviceAddressCaptureReplay"
;;      :type "VkBool32")
;;     (bufferdeviceaddressmultidevice :name "bufferDeviceAddressMultiDevice"
;;      :type "VkBool32")
;;     (vulkanmemorymodel :name "vulkanMemoryModel" :type "VkBool32")
;;     (vulkanmemorymodeldevicescope :name "vulkanMemoryModelDeviceScope" :type
;;      "VkBool32")
;;     (vulkanmemorymodelavailabilityvisibilitychains :name
;;      "vulkanMemoryModelAvailabilityVisibilityChains" :type "VkBool32")
;;     (shaderoutputviewportindex :name "shaderOutputViewportIndex" :type
;;      "VkBool32")
;;     (shaderoutputlayer :name "shaderOutputLayer" :type "VkBool32")
;;     (subgroupbroadcastdynamicid :name "subgroupBroadcastDynamicId" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkConformanceVersion"
;;       (conformance-version-khr conformance-version)
;;       (:default-create :default-get :default-set)
;;     (major :name major :type uint8)
;;     (minor :name minor :type uint8)
;;     (subminor :name subminor :type uint8)
;;     (patch :name patch :type uint8))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVulkan12Properties"
;;       (physical-device-vulkan-1-2-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (driverid :name "driverID" :type "VkDriverId")
;;     (drivername :name "driverName" :type char :create
;;      ((drivername-arg) (create-string drivername drivername-arg :dynamic nil))
;;      :get (nil (get-string drivername)) :set
;;      ((drivername-arg) (set-string drivername drivername-arg :dynamic nil)))
;;     (driverinfo :name "driverInfo" :type char :create
;;      ((driverinfo-arg) (create-string driverinfo driverinfo-arg :dynamic nil))
;;      :get (nil (get-string driverinfo)) :set
;;      ((driverinfo-arg) (set-string driverinfo driverinfo-arg :dynamic nil)))
;;     (conformanceversion :pointer t :name "conformanceVersion" :type
;;      "VkConformanceVersion" :create
;;      ((conformanceversion-arg)
;;       (copy-object conformanceversion conformanceversion-arg
;;        '(:struct vkconformanceversion)))
;;      :set
;;      ((conformanceversion-arg)
;;       (copy-object conformanceversion conformanceversion-arg
;;        '(:struct vkconformanceversion))))
;;     (denormbehaviorindependence :name "denormBehaviorIndependence" :type
;;      "VkShaderFloatControlsIndependence")
;;     (roundingmodeindependence :name "roundingModeIndependence" :type
;;      "VkShaderFloatControlsIndependence")
;;     (shadersignedzeroinfnanpreservefloat16 :name
;;      "shaderSignedZeroInfNanPreserveFloat16" :type "VkBool32")
;;     (shadersignedzeroinfnanpreservefloat32 :name
;;      "shaderSignedZeroInfNanPreserveFloat32" :type "VkBool32")
;;     (shadersignedzeroinfnanpreservefloat64 :name
;;      "shaderSignedZeroInfNanPreserveFloat64" :type "VkBool32")
;;     (shaderdenormpreservefloat16 :name "shaderDenormPreserveFloat16" :type
;;      "VkBool32")
;;     (shaderdenormpreservefloat32 :name "shaderDenormPreserveFloat32" :type
;;      "VkBool32")
;;     (shaderdenormpreservefloat64 :name "shaderDenormPreserveFloat64" :type
;;      "VkBool32")
;;     (shaderdenormflushtozerofloat16 :name "shaderDenormFlushToZeroFloat16"
;;      :type "VkBool32")
;;     (shaderdenormflushtozerofloat32 :name "shaderDenormFlushToZeroFloat32"
;;      :type "VkBool32")
;;     (shaderdenormflushtozerofloat64 :name "shaderDenormFlushToZeroFloat64"
;;      :type "VkBool32")
;;     (shaderroundingmodertefloat16 :name "shaderRoundingModeRTEFloat16" :type
;;      "VkBool32")
;;     (shaderroundingmodertefloat32 :name "shaderRoundingModeRTEFloat32" :type
;;      "VkBool32")
;;     (shaderroundingmodertefloat64 :name "shaderRoundingModeRTEFloat64" :type
;;      "VkBool32")
;;     (shaderroundingmodertzfloat16 :name "shaderRoundingModeRTZFloat16" :type
;;      "VkBool32")
;;     (shaderroundingmodertzfloat32 :name "shaderRoundingModeRTZFloat32" :type
;;      "VkBool32")
;;     (shaderroundingmodertzfloat64 :name "shaderRoundingModeRTZFloat64" :type
;;      "VkBool32")
;;     (maxupdateafterbinddescriptorsinallpools :name
;;      "maxUpdateAfterBindDescriptorsInAllPools" :type uint32)
;;     (shaderuniformbufferarraynonuniformindexingnative :name
;;      "shaderUniformBufferArrayNonUniformIndexingNative" :type "VkBool32")
;;     (shadersampledimagearraynonuniformindexingnative :name
;;      "shaderSampledImageArrayNonUniformIndexingNative" :type "VkBool32")
;;     (shaderstoragebufferarraynonuniformindexingnative :name
;;      "shaderStorageBufferArrayNonUniformIndexingNative" :type "VkBool32")
;;     (shaderstorageimagearraynonuniformindexingnative :name
;;      "shaderStorageImageArrayNonUniformIndexingNative" :type "VkBool32")
;;     (shaderinputattachmentarraynonuniformindexingnative :name
;;      "shaderInputAttachmentArrayNonUniformIndexingNative" :type "VkBool32")
;;     (robustbufferaccessupdateafterbind :name
;;      "robustBufferAccessUpdateAfterBind" :type "VkBool32")
;;     (quaddivergentimplicitlod :name "quadDivergentImplicitLod" :type "VkBool32")
;;     (maxperstagedescriptorupdateafterbindsamplers :name
;;      "maxPerStageDescriptorUpdateAfterBindSamplers" :type uint32)
;;     (maxperstagedescriptorupdateafterbinduniformbuffers :name
;;      "maxPerStageDescriptorUpdateAfterBindUniformBuffers" :type uint32)
;;     (maxperstagedescriptorupdateafterbindstoragebuffers :name
;;      "maxPerStageDescriptorUpdateAfterBindStorageBuffers" :type uint32)
;;     (maxperstagedescriptorupdateafterbindsampledimages :name
;;      "maxPerStageDescriptorUpdateAfterBindSampledImages" :type uint32)
;;     (maxperstagedescriptorupdateafterbindstorageimages :name
;;      "maxPerStageDescriptorUpdateAfterBindStorageImages" :type uint32)
;;     (maxperstagedescriptorupdateafterbindinputattachments :name
;;      "maxPerStageDescriptorUpdateAfterBindInputAttachments" :type uint32)
;;     (maxperstageupdateafterbindresources :name
;;      "maxPerStageUpdateAfterBindResources" :type uint32)
;;     (maxdescriptorsetupdateafterbindsamplers :name
;;      "maxDescriptorSetUpdateAfterBindSamplers" :type uint32)
;;     (maxdescriptorsetupdateafterbinduniformbuffers :name
;;      "maxDescriptorSetUpdateAfterBindUniformBuffers" :type uint32)
;;     (maxdescriptorsetupdateafterbinduniformbuffersdynamic :name
;;      "maxDescriptorSetUpdateAfterBindUniformBuffersDynamic" :type uint32)
;;     (maxdescriptorsetupdateafterbindstoragebuffers :name
;;      "maxDescriptorSetUpdateAfterBindStorageBuffers" :type uint32)
;;     (maxdescriptorsetupdateafterbindstoragebuffersdynamic :name
;;      "maxDescriptorSetUpdateAfterBindStorageBuffersDynamic" :type uint32)
;;     (maxdescriptorsetupdateafterbindsampledimages :name
;;      "maxDescriptorSetUpdateAfterBindSampledImages" :type uint32)
;;     (maxdescriptorsetupdateafterbindstorageimages :name
;;      "maxDescriptorSetUpdateAfterBindStorageImages" :type uint32)
;;     (maxdescriptorsetupdateafterbindinputattachments :name
;;      "maxDescriptorSetUpdateAfterBindInputAttachments" :type uint32)
;;     (supporteddepthresolvemodes :name "supportedDepthResolveModes" :type
;;      "VkResolveModeFlags")
;;     (supportedstencilresolvemodes :name "supportedStencilResolveModes" :type
;;      "VkResolveModeFlags")
;;     (independentresolvenone :name "independentResolveNone" :type "VkBool32")
;;     (independentresolve :name "independentResolve" :type "VkBool32")
;;     (filterminmaxsinglecomponentformats :name
;;      "filterMinmaxSingleComponentFormats" :type "VkBool32")
;;     (filterminmaximagecomponentmapping :name
;;      "filterMinmaxImageComponentMapping" :type "VkBool32")
;;     (maxtimelinesemaphorevaluedifference :name
;;      "maxTimelineSemaphoreValueDifference" :type uint64)
;;     (framebufferintegercolorsamplecounts :name
;;      "framebufferIntegerColorSampleCounts" :type "VkSampleCountFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageFormatListCreateInfo"
;;       (image-format-list-create-info-khr image-format-list-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (viewformatcount :name "viewFormatCount" :type uint32)
;;     (pviewformats :name "pViewFormats" :type "VkFormat" :init-form nil :create
;;      ((pviewformats-arg)
;;       (create-array vkformat pviewformats pviewformats-arg :dynamic t :pointers
;;        nil))
;;      :destroy (destroy-array pviewformats) :get
;;      ((&optional pviewformats-index)
;;       (get-array vkformat pviewformats pviewformats-index viewformatcount
;;        :pointers nil))
;;      :set
;;      ((pviewformats-arg &optional pviewformats-index)
;;       (set-array vkformat pviewformats pviewformats-arg pviewformats-index
;;        :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAttachmentDescription2"
;;       (attachment-description-2-khr attachment-description-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkAttachmentDescriptionFlags")
;;     (format :name format :type "VkFormat")
;;     (samples :name samples :type "VkSampleCountFlagBits")
;;     (loadop :name "loadOp" :type "VkAttachmentLoadOp")
;;     (storeop :name "storeOp" :type "VkAttachmentStoreOp")
;;     (stencilloadop :name "stencilLoadOp" :type "VkAttachmentLoadOp")
;;     (stencilstoreop :name "stencilStoreOp" :type "VkAttachmentStoreOp")
;;     (initiallayout :name "initialLayout" :type "VkImageLayout")
;;     (finallayout :name "finalLayout" :type "VkImageLayout"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAttachmentReference2"
;;       (attachment-reference-2-khr attachment-reference-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (attachment :name attachment :type uint32)
;;     (layout :name layout :type "VkImageLayout")
;;     (aspectmask :name "aspectMask" :type "VkImageAspectFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubpassDescription2"
;;       (subpass-description-2-khr subpass-description-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkSubpassDescriptionFlags")
;;     (pipelinebindpoint :name "pipelineBindPoint" :type "VkPipelineBindPoint")
;;     (viewmask :name "viewMask" :type uint32)
;;     (inputattachmentcount :name "inputAttachmentCount" :type uint32)
;;     (pinputattachments :name "pInputAttachments" :type "VkAttachmentReference2"
;;      :init-form nil :create
;;      ((pinputattachments-arg)
;;       (create-array (:struct vkattachmentreference2) pinputattachments
;;        pinputattachments-arg :dynamic t :pointers ("VkAttachmentReference2")))
;;      :destroy (destroy-array pinputattachments) :get
;;      ((&optional pinputattachments-index)
;;       (get-array (:struct vkattachmentreference2) pinputattachments
;;        pinputattachments-index inputattachmentcount :pointers
;;        ("VkAttachmentReference2")))
;;      :set
;;      ((pinputattachments-arg &optional pinputattachments-index)
;;       (set-array (:struct vkattachmentreference2) pinputattachments
;;        pinputattachments-arg pinputattachments-index :dynamic t :pointers
;;        ("VkAttachmentReference2"))))
;;     (colorattachmentcount :name "colorAttachmentCount" :type uint32)
;;     (pcolorattachments :name "pColorAttachments" :type "VkAttachmentReference2"
;;      :init-form nil :create
;;      ((pcolorattachments-arg)
;;       (create-array (:struct vkattachmentreference2) pcolorattachments
;;        pcolorattachments-arg :dynamic t :pointers ("VkAttachmentReference2")))
;;      :destroy (destroy-array pcolorattachments) :get
;;      ((&optional pcolorattachments-index)
;;       (get-array (:struct vkattachmentreference2) pcolorattachments
;;        pcolorattachments-index colorattachmentcount :pointers
;;        ("VkAttachmentReference2")))
;;      :set
;;      ((pcolorattachments-arg &optional pcolorattachments-index)
;;       (set-array (:struct vkattachmentreference2) pcolorattachments
;;        pcolorattachments-arg pcolorattachments-index :dynamic t :pointers
;;        ("VkAttachmentReference2"))))
;;     (presolveattachments :name "pResolveAttachments" :type
;;      "VkAttachmentReference2" :init-form nil :create
;;      ((presolveattachments-arg)
;;       (create-pointer presolveattachments presolveattachments-arg))
;;      :get (nil (get-pointer presolveattachments)) :set
;;      ((presolveattachments-arg)
;;       (set-pointer presolveattachments presolveattachments-arg)))
;;     (pdepthstencilattachment :name "pDepthStencilAttachment" :type
;;      "VkAttachmentReference2" :init-form nil :create
;;      ((pdepthstencilattachment-arg)
;;       (create-pointer pdepthstencilattachment pdepthstencilattachment-arg))
;;      :get (nil (get-pointer pdepthstencilattachment)) :set
;;      ((pdepthstencilattachment-arg)
;;       (set-pointer pdepthstencilattachment pdepthstencilattachment-arg)))
;;     (preserveattachmentcount :name "preserveAttachmentCount" :type uint32)
;;     (ppreserveattachments :name "pPreserveAttachments" :type uint32 :init-form
;;      nil :create
;;      ((ppreserveattachments-arg)
;;       (create-array :uint32 ppreserveattachments ppreserveattachments-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array ppreserveattachments) :get
;;      ((&optional ppreserveattachments-index)
;;       (get-array :uint32 ppreserveattachments ppreserveattachments-index
;;        preserveattachmentcount :pointers nil))
;;      :set
;;      ((ppreserveattachments-arg &optional ppreserveattachments-index)
;;       (set-array :uint32 ppreserveattachments ppreserveattachments-arg
;;        ppreserveattachments-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubpassDependency2"
;;       (subpass-dependency-2-khr subpass-dependency-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcsubpass :name "srcSubpass" :type uint32)
;;     (dstsubpass :name "dstSubpass" :type uint32)
;;     (srcstagemask :name "srcStageMask" :type "VkPipelineStageFlags")
;;     (dststagemask :name "dstStageMask" :type "VkPipelineStageFlags")
;;     (srcaccessmask :name "srcAccessMask" :type "VkAccessFlags")
;;     (dstaccessmask :name "dstAccessMask" :type "VkAccessFlags")
;;     (dependencyflags :name "dependencyFlags" :type "VkDependencyFlags")
;;     (viewoffset :name "viewOffset" :type int32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassCreateInfo2"
;;       (render-pass-create-info-2-khr render-pass-create-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkRenderPassCreateFlags")
;;     (attachmentcount :name "attachmentCount" :type uint32)
;;     (pattachments :name "pAttachments" :type "VkAttachmentDescription2"
;;      :init-form nil :create
;;      ((pattachments-arg)
;;       (create-array (:struct vkattachmentdescription2) pattachments
;;        pattachments-arg :dynamic t :pointers ("VkAttachmentDescription2")))
;;      :destroy (destroy-array pattachments) :get
;;      ((&optional pattachments-index)
;;       (get-array (:struct vkattachmentdescription2) pattachments
;;        pattachments-index attachmentcount :pointers
;;        ("VkAttachmentDescription2")))
;;      :set
;;      ((pattachments-arg &optional pattachments-index)
;;       (set-array (:struct vkattachmentdescription2) pattachments
;;        pattachments-arg pattachments-index :dynamic t :pointers
;;        ("VkAttachmentDescription2"))))
;;     (subpasscount :name "subpassCount" :type uint32)
;;     (psubpasses :name "pSubpasses" :type "VkSubpassDescription2" :init-form nil
;;      :create
;;      ((psubpasses-arg)
;;       (create-array (:struct vksubpassdescription2) psubpasses psubpasses-arg
;;        :dynamic t :pointers ("VkSubpassDescription2")))
;;      :destroy (destroy-array psubpasses) :get
;;      ((&optional psubpasses-index)
;;       (get-array (:struct vksubpassdescription2) psubpasses psubpasses-index
;;        subpasscount :pointers ("VkSubpassDescription2")))
;;      :set
;;      ((psubpasses-arg &optional psubpasses-index)
;;       (set-array (:struct vksubpassdescription2) psubpasses psubpasses-arg
;;        psubpasses-index :dynamic t :pointers ("VkSubpassDescription2"))))
;;     (dependencycount :name "dependencyCount" :type uint32)
;;     (pdependencies :name "pDependencies" :type "VkSubpassDependency2"
;;      :init-form nil :create
;;      ((pdependencies-arg)
;;       (create-array (:struct vksubpassdependency2) pdependencies
;;        pdependencies-arg :dynamic t :pointers ("VkSubpassDependency2")))
;;      :destroy (destroy-array pdependencies) :get
;;      ((&optional pdependencies-index)
;;       (get-array (:struct vksubpassdependency2) pdependencies
;;        pdependencies-index dependencycount :pointers ("VkSubpassDependency2")))
;;      :set
;;      ((pdependencies-arg &optional pdependencies-index)
;;       (set-array (:struct vksubpassdependency2) pdependencies pdependencies-arg
;;        pdependencies-index :dynamic t :pointers ("VkSubpassDependency2"))))
;;     (correlatedviewmaskcount :name "correlatedViewMaskCount" :type uint32)
;;     (pcorrelatedviewmasks :name "pCorrelatedViewMasks" :type uint32 :init-form
;;      nil :create
;;      ((pcorrelatedviewmasks-arg)
;;       (create-array :uint32 pcorrelatedviewmasks pcorrelatedviewmasks-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pcorrelatedviewmasks) :get
;;      ((&optional pcorrelatedviewmasks-index)
;;       (get-array :uint32 pcorrelatedviewmasks pcorrelatedviewmasks-index
;;        correlatedviewmaskcount :pointers nil))
;;      :set
;;      ((pcorrelatedviewmasks-arg &optional pcorrelatedviewmasks-index)
;;       (set-array :uint32 pcorrelatedviewmasks pcorrelatedviewmasks-arg
;;        pcorrelatedviewmasks-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubpassBeginInfo"
;;       (subpass-begin-info-khr subpass-begin-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (contents :name contents :type "VkSubpassContents"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubpassEndInfo"
;;       (subpass-end-info-khr subpass-end-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set
;;      ((pnext-arg) (set-pointer pnext pnext-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevice8BitStorageFeatures"
;;       (physical-device-8-bit-storage-features-khr
;;        physical-device-8-bit-storage-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (storagebuffer8bitaccess :name "storageBuffer8BitAccess" :type "VkBool32")
;;     (uniformandstoragebuffer8bitaccess :name
;;      "uniformAndStorageBuffer8BitAccess" :type "VkBool32")
;;     (storagepushconstant8 :name "storagePushConstant8" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDriverProperties"
;;       (physical-device-driver-properties-khr physical-device-driver-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (driverid :name "driverID" :type "VkDriverId")
;;     (drivername :name "driverName" :type char :create
;;      ((drivername-arg) (create-string drivername drivername-arg :dynamic nil))
;;      :get (nil (get-string drivername)) :set
;;      ((drivername-arg) (set-string drivername drivername-arg :dynamic nil)))
;;     (driverinfo :name "driverInfo" :type char :create
;;      ((driverinfo-arg) (create-string driverinfo driverinfo-arg :dynamic nil))
;;      :get (nil (get-string driverinfo)) :set
;;      ((driverinfo-arg) (set-string driverinfo driverinfo-arg :dynamic nil)))
;;     (conformanceversion :pointer t :name "conformanceVersion" :type
;;      "VkConformanceVersion" :create
;;      ((conformanceversion-arg)
;;       (copy-object conformanceversion conformanceversion-arg
;;        '(:struct vkconformanceversion)))
;;      :set
;;      ((conformanceversion-arg)
;;       (copy-object conformanceversion conformanceversion-arg
;;        '(:struct vkconformanceversion)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderAtomicInt64Features"
;;       (physical-device-shader-atomic-int-6-4-features-khr
;;        physical-device-shader-atomic-int-6-4-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderbufferint64atomics :name "shaderBufferInt64Atomics" :type "VkBool32")
;;     (shadersharedint64atomics :name "shaderSharedInt64Atomics" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderFloat16Int8Features"
;;       (physical-device-float-1-6-int-8-features-khr
;;        physical-device-shader-float-1-6-int-8-features-khr
;;        physical-device-shader-float-1-6-int-8-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderfloat16 :name "shaderFloat16" :type "VkBool32")
;;     (shaderint8 :name "shaderInt8" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFloatControlsProperties"
;;       (physical-device-float-controls-properties-khr
;;        physical-device-float-controls-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (denormbehaviorindependence :name "denormBehaviorIndependence" :type
;;      "VkShaderFloatControlsIndependence")
;;     (roundingmodeindependence :name "roundingModeIndependence" :type
;;      "VkShaderFloatControlsIndependence")
;;     (shadersignedzeroinfnanpreservefloat16 :name
;;      "shaderSignedZeroInfNanPreserveFloat16" :type "VkBool32")
;;     (shadersignedzeroinfnanpreservefloat32 :name
;;      "shaderSignedZeroInfNanPreserveFloat32" :type "VkBool32")
;;     (shadersignedzeroinfnanpreservefloat64 :name
;;      "shaderSignedZeroInfNanPreserveFloat64" :type "VkBool32")
;;     (shaderdenormpreservefloat16 :name "shaderDenormPreserveFloat16" :type
;;      "VkBool32")
;;     (shaderdenormpreservefloat32 :name "shaderDenormPreserveFloat32" :type
;;      "VkBool32")
;;     (shaderdenormpreservefloat64 :name "shaderDenormPreserveFloat64" :type
;;      "VkBool32")
;;     (shaderdenormflushtozerofloat16 :name "shaderDenormFlushToZeroFloat16"
;;      :type "VkBool32")
;;     (shaderdenormflushtozerofloat32 :name "shaderDenormFlushToZeroFloat32"
;;      :type "VkBool32")
;;     (shaderdenormflushtozerofloat64 :name "shaderDenormFlushToZeroFloat64"
;;      :type "VkBool32")
;;     (shaderroundingmodertefloat16 :name "shaderRoundingModeRTEFloat16" :type
;;      "VkBool32")
;;     (shaderroundingmodertefloat32 :name "shaderRoundingModeRTEFloat32" :type
;;      "VkBool32")
;;     (shaderroundingmodertefloat64 :name "shaderRoundingModeRTEFloat64" :type
;;      "VkBool32")
;;     (shaderroundingmodertzfloat16 :name "shaderRoundingModeRTZFloat16" :type
;;      "VkBool32")
;;     (shaderroundingmodertzfloat32 :name "shaderRoundingModeRTZFloat32" :type
;;      "VkBool32")
;;     (shaderroundingmodertzfloat64 :name "shaderRoundingModeRTZFloat64" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorSetLayoutBindingFlagsCreateInfo"
;;       (descriptor-set-layout-binding-flags-create-info-ext
;;        descriptor-set-layout-binding-flags-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (bindingcount :name "bindingCount" :type uint32)
;;     (pbindingflags :name "pBindingFlags" :type "VkDescriptorBindingFlags"
;;      :init-form nil :create
;;      ((pbindingflags-arg)
;;       (create-array vkdescriptorbindingflags pbindingflags pbindingflags-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pbindingflags) :get
;;      ((&optional pbindingflags-index)
;;       (get-array vkdescriptorbindingflags pbindingflags pbindingflags-index
;;        bindingcount :pointers nil))
;;      :set
;;      ((pbindingflags-arg &optional pbindingflags-index)
;;       (set-array vkdescriptorbindingflags pbindingflags pbindingflags-arg
;;        pbindingflags-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDescriptorIndexingFeatures"
;;       (physical-device-descriptor-indexing-features-ext
;;        physical-device-descriptor-indexing-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderinputattachmentarraydynamicindexing :name
;;      "shaderInputAttachmentArrayDynamicIndexing" :type "VkBool32")
;;     (shaderuniformtexelbufferarraydynamicindexing :name
;;      "shaderUniformTexelBufferArrayDynamicIndexing" :type "VkBool32")
;;     (shaderstoragetexelbufferarraydynamicindexing :name
;;      "shaderStorageTexelBufferArrayDynamicIndexing" :type "VkBool32")
;;     (shaderuniformbufferarraynonuniformindexing :name
;;      "shaderUniformBufferArrayNonUniformIndexing" :type "VkBool32")
;;     (shadersampledimagearraynonuniformindexing :name
;;      "shaderSampledImageArrayNonUniformIndexing" :type "VkBool32")
;;     (shaderstoragebufferarraynonuniformindexing :name
;;      "shaderStorageBufferArrayNonUniformIndexing" :type "VkBool32")
;;     (shaderstorageimagearraynonuniformindexing :name
;;      "shaderStorageImageArrayNonUniformIndexing" :type "VkBool32")
;;     (shaderinputattachmentarraynonuniformindexing :name
;;      "shaderInputAttachmentArrayNonUniformIndexing" :type "VkBool32")
;;     (shaderuniformtexelbufferarraynonuniformindexing :name
;;      "shaderUniformTexelBufferArrayNonUniformIndexing" :type "VkBool32")
;;     (shaderstoragetexelbufferarraynonuniformindexing :name
;;      "shaderStorageTexelBufferArrayNonUniformIndexing" :type "VkBool32")
;;     (descriptorbindinguniformbufferupdateafterbind :name
;;      "descriptorBindingUniformBufferUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindingsampledimageupdateafterbind :name
;;      "descriptorBindingSampledImageUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindingstorageimageupdateafterbind :name
;;      "descriptorBindingStorageImageUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindingstoragebufferupdateafterbind :name
;;      "descriptorBindingStorageBufferUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindinguniformtexelbufferupdateafterbind :name
;;      "descriptorBindingUniformTexelBufferUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindingstoragetexelbufferupdateafterbind :name
;;      "descriptorBindingStorageTexelBufferUpdateAfterBind" :type "VkBool32")
;;     (descriptorbindingupdateunusedwhilepending :name
;;      "descriptorBindingUpdateUnusedWhilePending" :type "VkBool32")
;;     (descriptorbindingpartiallybound :name "descriptorBindingPartiallyBound"
;;      :type "VkBool32")
;;     (descriptorbindingvariabledescriptorcount :name
;;      "descriptorBindingVariableDescriptorCount" :type "VkBool32")
;;     (runtimedescriptorarray :name "runtimeDescriptorArray" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDescriptorIndexingProperties"
;;       (physical-device-descriptor-indexing-properties-ext
;;        physical-device-descriptor-indexing-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxupdateafterbinddescriptorsinallpools :name
;;      "maxUpdateAfterBindDescriptorsInAllPools" :type uint32)
;;     (shaderuniformbufferarraynonuniformindexingnative :name
;;      "shaderUniformBufferArrayNonUniformIndexingNative" :type "VkBool32")
;;     (shadersampledimagearraynonuniformindexingnative :name
;;      "shaderSampledImageArrayNonUniformIndexingNative" :type "VkBool32")
;;     (shaderstoragebufferarraynonuniformindexingnative :name
;;      "shaderStorageBufferArrayNonUniformIndexingNative" :type "VkBool32")
;;     (shaderstorageimagearraynonuniformindexingnative :name
;;      "shaderStorageImageArrayNonUniformIndexingNative" :type "VkBool32")
;;     (shaderinputattachmentarraynonuniformindexingnative :name
;;      "shaderInputAttachmentArrayNonUniformIndexingNative" :type "VkBool32")
;;     (robustbufferaccessupdateafterbind :name
;;      "robustBufferAccessUpdateAfterBind" :type "VkBool32")
;;     (quaddivergentimplicitlod :name "quadDivergentImplicitLod" :type "VkBool32")
;;     (maxperstagedescriptorupdateafterbindsamplers :name
;;      "maxPerStageDescriptorUpdateAfterBindSamplers" :type uint32)
;;     (maxperstagedescriptorupdateafterbinduniformbuffers :name
;;      "maxPerStageDescriptorUpdateAfterBindUniformBuffers" :type uint32)
;;     (maxperstagedescriptorupdateafterbindstoragebuffers :name
;;      "maxPerStageDescriptorUpdateAfterBindStorageBuffers" :type uint32)
;;     (maxperstagedescriptorupdateafterbindsampledimages :name
;;      "maxPerStageDescriptorUpdateAfterBindSampledImages" :type uint32)
;;     (maxperstagedescriptorupdateafterbindstorageimages :name
;;      "maxPerStageDescriptorUpdateAfterBindStorageImages" :type uint32)
;;     (maxperstagedescriptorupdateafterbindinputattachments :name
;;      "maxPerStageDescriptorUpdateAfterBindInputAttachments" :type uint32)
;;     (maxperstageupdateafterbindresources :name
;;      "maxPerStageUpdateAfterBindResources" :type uint32)
;;     (maxdescriptorsetupdateafterbindsamplers :name
;;      "maxDescriptorSetUpdateAfterBindSamplers" :type uint32)
;;     (maxdescriptorsetupdateafterbinduniformbuffers :name
;;      "maxDescriptorSetUpdateAfterBindUniformBuffers" :type uint32)
;;     (maxdescriptorsetupdateafterbinduniformbuffersdynamic :name
;;      "maxDescriptorSetUpdateAfterBindUniformBuffersDynamic" :type uint32)
;;     (maxdescriptorsetupdateafterbindstoragebuffers :name
;;      "maxDescriptorSetUpdateAfterBindStorageBuffers" :type uint32)
;;     (maxdescriptorsetupdateafterbindstoragebuffersdynamic :name
;;      "maxDescriptorSetUpdateAfterBindStorageBuffersDynamic" :type uint32)
;;     (maxdescriptorsetupdateafterbindsampledimages :name
;;      "maxDescriptorSetUpdateAfterBindSampledImages" :type uint32)
;;     (maxdescriptorsetupdateafterbindstorageimages :name
;;      "maxDescriptorSetUpdateAfterBindStorageImages" :type uint32)
;;     (maxdescriptorsetupdateafterbindinputattachments :name
;;      "maxDescriptorSetUpdateAfterBindInputAttachments" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorSetVariableDescriptorCountAllocateInfo"
;;       (descriptor-set-variable-descriptor-count-allocate-info-ext
;;        descriptor-set-variable-descriptor-count-allocate-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (descriptorsetcount :name "descriptorSetCount" :type uint32)
;;     (pdescriptorcounts :name "pDescriptorCounts" :type uint32 :init-form nil
;;      :create
;;      ((pdescriptorcounts-arg)
;;       (create-array :uint32 pdescriptorcounts pdescriptorcounts-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pdescriptorcounts) :get
;;      ((&optional pdescriptorcounts-index)
;;       (get-array :uint32 pdescriptorcounts pdescriptorcounts-index
;;        descriptorsetcount :pointers nil))
;;      :set
;;      ((pdescriptorcounts-arg &optional pdescriptorcounts-index)
;;       (set-array :uint32 pdescriptorcounts pdescriptorcounts-arg
;;        pdescriptorcounts-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorSetVariableDescriptorCountLayoutSupport"
;;       (descriptor-set-variable-descriptor-count-layout-support-ext
;;        descriptor-set-variable-descriptor-count-layout-support)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxvariabledescriptorcount :name "maxVariableDescriptorCount" :type
;;      uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubpassDescriptionDepthStencilResolve"
;;       (subpass-description-depth-stencil-resolve-khr
;;        subpass-description-depth-stencil-resolve)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (depthresolvemode :name "depthResolveMode" :type "VkResolveModeFlagBits")
;;     (stencilresolvemode :name "stencilResolveMode" :type
;;      "VkResolveModeFlagBits")
;;     (pdepthstencilresolveattachment :name "pDepthStencilResolveAttachment"
;;      :type "VkAttachmentReference2" :init-form nil :create
;;      ((pdepthstencilresolveattachment-arg)
;;       (create-pointer pdepthstencilresolveattachment
;;        pdepthstencilresolveattachment-arg))
;;      :get (nil (get-pointer pdepthstencilresolveattachment)) :set
;;      ((pdepthstencilresolveattachment-arg)
;;       (set-pointer pdepthstencilresolveattachment
;;        pdepthstencilresolveattachment-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDepthStencilResolveProperties"
;;       (physical-device-depth-stencil-resolve-properties-khr
;;        physical-device-depth-stencil-resolve-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (supporteddepthresolvemodes :name "supportedDepthResolveModes" :type
;;      "VkResolveModeFlags")
;;     (supportedstencilresolvemodes :name "supportedStencilResolveModes" :type
;;      "VkResolveModeFlags")
;;     (independentresolvenone :name "independentResolveNone" :type "VkBool32")
;;     (independentresolve :name "independentResolve" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceScalarBlockLayoutFeatures"
;;       (physical-device-scalar-block-layout-features-ext
;;        physical-device-scalar-block-layout-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (scalarblocklayout :name "scalarBlockLayout" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageStencilUsageCreateInfo"
;;       (image-stencil-usage-create-info-ext image-stencil-usage-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (stencilusage :name "stencilUsage" :type "VkImageUsageFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSamplerReductionModeCreateInfo"
;;       (sampler-reduction-mode-create-info-ext
;;        sampler-reduction-mode-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (reductionmode :name "reductionMode" :type "VkSamplerReductionMode"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSamplerFilterMinmaxProperties"
;;       (physical-device-sampler-filter-minmax-properties-ext
;;        physical-device-sampler-filter-minmax-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (filterminmaxsinglecomponentformats :name
;;      "filterMinmaxSingleComponentFormats" :type "VkBool32")
;;     (filterminmaximagecomponentmapping :name
;;      "filterMinmaxImageComponentMapping" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVulkanMemoryModelFeatures"
;;       (physical-device-vulkan-memory-model-features-khr
;;        physical-device-vulkan-memory-model-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (vulkanmemorymodel :name "vulkanMemoryModel" :type "VkBool32")
;;     (vulkanmemorymodeldevicescope :name "vulkanMemoryModelDeviceScope" :type
;;      "VkBool32")
;;     (vulkanmemorymodelavailabilityvisibilitychains :name
;;      "vulkanMemoryModelAvailabilityVisibilityChains" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceImagelessFramebufferFeatures"
;;       (physical-device-imageless-framebuffer-features-khr
;;        physical-device-imageless-framebuffer-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imagelessframebuffer :name "imagelessFramebuffer" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFramebufferAttachmentImageInfo"
;;       (framebuffer-attachment-image-info-khr framebuffer-attachment-image-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkImageCreateFlags")
;;     (usage :name usage :type "VkImageUsageFlags")
;;     (width :name width :type uint32)
;;     (height :name height :type uint32)
;;     (layercount :name "layerCount" :type uint32)
;;     (viewformatcount :name "viewFormatCount" :type uint32)
;;     (pviewformats :name "pViewFormats" :type "VkFormat" :init-form nil :create
;;      ((pviewformats-arg)
;;       (create-array vkformat pviewformats pviewformats-arg :dynamic t :pointers
;;        nil))
;;      :destroy (destroy-array pviewformats) :get
;;      ((&optional pviewformats-index)
;;       (get-array vkformat pviewformats pviewformats-index viewformatcount
;;        :pointers nil))
;;      :set
;;      ((pviewformats-arg &optional pviewformats-index)
;;       (set-array vkformat pviewformats pviewformats-arg pviewformats-index
;;        :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFramebufferAttachmentsCreateInfo"
;;       (framebuffer-attachments-create-info-khr
;;        framebuffer-attachments-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (attachmentimageinfocount :name "attachmentImageInfoCount" :type uint32)
;;     (pattachmentimageinfos :name "pAttachmentImageInfos" :type
;;      "VkFramebufferAttachmentImageInfo" :init-form nil :create
;;      ((pattachmentimageinfos-arg)
;;       (create-array (:struct vkframebufferattachmentimageinfo)
;;        pattachmentimageinfos pattachmentimageinfos-arg :dynamic t :pointers
;;        ("VkFramebufferAttachmentImageInfo")))
;;      :destroy (destroy-array pattachmentimageinfos) :get
;;      ((&optional pattachmentimageinfos-index)
;;       (get-array (:struct vkframebufferattachmentimageinfo)
;;        pattachmentimageinfos pattachmentimageinfos-index
;;        attachmentimageinfocount :pointers
;;        ("VkFramebufferAttachmentImageInfo")))
;;      :set
;;      ((pattachmentimageinfos-arg &optional pattachmentimageinfos-index)
;;       (set-array (:struct vkframebufferattachmentimageinfo)
;;        pattachmentimageinfos pattachmentimageinfos-arg
;;        pattachmentimageinfos-index :dynamic t :pointers
;;        ("VkFramebufferAttachmentImageInfo")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassAttachmentBeginInfo"
;;       (render-pass-attachment-begin-info-khr render-pass-attachment-begin-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (attachmentcount :name "attachmentCount" :type uint32)
;;     (pattachments :name "pAttachments" :type "VkImageView" :init-form nil
;;      :create
;;      ((pattachments-arg)
;;       (create-array vkimageview pattachments pattachments-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pattachments) :get
;;      ((&optional pattachments-index)
;;       (get-array vkimageview pattachments pattachments-index attachmentcount
;;        :pointers nil))
;;      :set
;;      ((pattachments-arg &optional pattachments-index)
;;       (set-array vkimageview pattachments pattachments-arg pattachments-index
;;        :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceUniformBufferStandardLayoutFeatures"
;;       (physical-device-uniform-buffer-standard-layout-features-khr
;;        physical-device-uniform-buffer-standard-layout-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (uniformbufferstandardlayout :name "uniformBufferStandardLayout" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures"
;;       (physical-device-shader-subgroup-extended-types-features-khr
;;        physical-device-shader-subgroup-extended-types-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadersubgroupextendedtypes :name "shaderSubgroupExtendedTypes" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures"
;;       (physical-device-separate-depth-stencil-layouts-features-khr
;;        physical-device-separate-depth-stencil-layouts-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (separatedepthstencillayouts :name "separateDepthStencilLayouts" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAttachmentReferenceStencilLayout"
;;       (attachment-reference-stencil-layout-khr
;;        attachment-reference-stencil-layout)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (stencillayout :name "stencilLayout" :type "VkImageLayout"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAttachmentDescriptionStencilLayout"
;;       (attachment-description-stencil-layout-khr
;;        attachment-description-stencil-layout)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (stencilinitiallayout :name "stencilInitialLayout" :type "VkImageLayout")
;;     (stencilfinallayout :name "stencilFinalLayout" :type "VkImageLayout"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceHostQueryResetFeatures"
;;       (physical-device-host-query-reset-features-ext
;;        physical-device-host-query-reset-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (hostqueryreset :name "hostQueryReset" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceTimelineSemaphoreFeatures"
;;       (physical-device-timeline-semaphore-features-khr
;;        physical-device-timeline-semaphore-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (timelinesemaphore :name "timelineSemaphore" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceTimelineSemaphoreProperties"
;;       (physical-device-timeline-semaphore-properties-khr
;;        physical-device-timeline-semaphore-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxtimelinesemaphorevaluedifference :name
;;      "maxTimelineSemaphoreValueDifference" :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSemaphoreTypeCreateInfo"
;;       (semaphore-type-create-info-khr semaphore-type-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (semaphoretype :name "semaphoreType" :type "VkSemaphoreType")
;;     (initialvalue :name "initialValue" :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkTimelineSemaphoreSubmitInfo"
;;       (timeline-semaphore-submit-info-khr timeline-semaphore-submit-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (waitsemaphorevaluecount :name "waitSemaphoreValueCount" :type uint32)
;;     (pwaitsemaphorevalues :name "pWaitSemaphoreValues" :type uint64 :init-form
;;      nil :create
;;      ((pwaitsemaphorevalues-arg)
;;       (create-array :uint64 pwaitsemaphorevalues pwaitsemaphorevalues-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pwaitsemaphorevalues) :get
;;      ((&optional pwaitsemaphorevalues-index)
;;       (get-array :uint64 pwaitsemaphorevalues pwaitsemaphorevalues-index
;;        waitsemaphorevaluecount :pointers nil))
;;      :set
;;      ((pwaitsemaphorevalues-arg &optional pwaitsemaphorevalues-index)
;;       (set-array :uint64 pwaitsemaphorevalues pwaitsemaphorevalues-arg
;;        pwaitsemaphorevalues-index :dynamic t :pointers nil)))
;;     (signalsemaphorevaluecount :name "signalSemaphoreValueCount" :type uint32)
;;     (psignalsemaphorevalues :name "pSignalSemaphoreValues" :type uint64
;;      :init-form nil :create
;;      ((psignalsemaphorevalues-arg)
;;       (create-array :uint64 psignalsemaphorevalues psignalsemaphorevalues-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array psignalsemaphorevalues) :get
;;      ((&optional psignalsemaphorevalues-index)
;;       (get-array :uint64 psignalsemaphorevalues psignalsemaphorevalues-index
;;        signalsemaphorevaluecount :pointers nil))
;;      :set
;;      ((psignalsemaphorevalues-arg &optional psignalsemaphorevalues-index)
;;       (set-array :uint64 psignalsemaphorevalues psignalsemaphorevalues-arg
;;        psignalsemaphorevalues-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSemaphoreWaitInfo"
;;       (semaphore-wait-info-khr semaphore-wait-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkSemaphoreWaitFlags")
;;     (semaphorecount :name "semaphoreCount" :type uint32)
;;     (psemaphores :name "pSemaphores" :type "VkSemaphore" :init-form nil :create
;;      ((psemaphores-arg)
;;       (create-array vksemaphore psemaphores psemaphores-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array psemaphores) :get
;;      ((&optional psemaphores-index)
;;       (get-array vksemaphore psemaphores psemaphores-index semaphorecount
;;        :pointers nil))
;;      :set
;;      ((psemaphores-arg &optional psemaphores-index)
;;       (set-array vksemaphore psemaphores psemaphores-arg psemaphores-index
;;        :dynamic t :pointers nil)))
;;     (pvalues :name "pValues" :type uint64 :init-form nil :create
;;      ((pvalues-arg) (create-pointer pvalues pvalues-arg)) :get
;;      (nil (get-pointer pvalues)) :set
;;      ((pvalues-arg) (set-pointer pvalues pvalues-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSemaphoreSignalInfo"
;;       (semaphore-signal-info-khr semaphore-signal-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (semaphore :name semaphore :type "VkSemaphore" :create
;;      ((semaphore-arg) (create-pointer semaphore semaphore-arg)) :get
;;      (nil (get-pointer semaphore)) :set
;;      ((semaphore-arg) (set-pointer semaphore semaphore-arg)))
;;     (value :name value :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceBufferDeviceAddressFeatures"
;;       (physical-device-buffer-device-address-features-khr
;;        physical-device-buffer-device-address-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (bufferdeviceaddress :name "bufferDeviceAddress" :type "VkBool32")
;;     (bufferdeviceaddresscapturereplay :name "bufferDeviceAddressCaptureReplay"
;;      :type "VkBool32")
;;     (bufferdeviceaddressmultidevice :name "bufferDeviceAddressMultiDevice"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferDeviceAddressInfo"
;;       (buffer-device-address-info-ext buffer-device-address-info-khr
;;        buffer-device-address-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferOpaqueCaptureAddressCreateInfo"
;;       (buffer-opaque-capture-address-create-info-khr
;;        buffer-opaque-capture-address-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (opaquecaptureaddress :name "opaqueCaptureAddress" :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryOpaqueCaptureAddressAllocateInfo"
;;       (memory-opaque-capture-address-allocate-info-khr
;;        memory-opaque-capture-address-allocate-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (opaquecaptureaddress :name "opaqueCaptureAddress" :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceMemoryOpaqueCaptureAddressInfo"
;;       (device-memory-opaque-capture-address-info-khr
;;        device-memory-opaque-capture-address-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (memory :name memory :type "VkDeviceMemory" :create
;;      ((memory-arg) (create-pointer memory memory-arg)) :get
;;      (nil (get-pointer memory)) :set
;;      ((memory-arg) (set-pointer memory memory-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVulkan13Features"
;;       (physical-device-vulkan-1-3-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (robustimageaccess :name "robustImageAccess" :type "VkBool32")
;;     (inlineuniformblock :name "inlineUniformBlock" :type "VkBool32")
;;     (descriptorbindinginlineuniformblockupdateafterbind :name
;;      "descriptorBindingInlineUniformBlockUpdateAfterBind" :type "VkBool32")
;;     (pipelinecreationcachecontrol :name "pipelineCreationCacheControl" :type
;;      "VkBool32")
;;     (privatedata :name "privateData" :type "VkBool32")
;;     (shaderdemotetohelperinvocation :name "shaderDemoteToHelperInvocation"
;;      :type "VkBool32")
;;     (shaderterminateinvocation :name "shaderTerminateInvocation" :type
;;      "VkBool32")
;;     (subgroupsizecontrol :name "subgroupSizeControl" :type "VkBool32")
;;     (computefullsubgroups :name "computeFullSubgroups" :type "VkBool32")
;;     (synchronization2 :name synchronization2 :type "VkBool32")
;;     (texturecompressionastc_hdr :name "textureCompressionASTC_HDR" :type
;;      "VkBool32")
;;     (shaderzeroinitializeworkgroupmemory :name
;;      "shaderZeroInitializeWorkgroupMemory" :type "VkBool32")
;;     (dynamicrendering :name "dynamicRendering" :type "VkBool32")
;;     (shaderintegerdotproduct :name "shaderIntegerDotProduct" :type "VkBool32")
;;     (maintenance4 :name maintenance4 :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVulkan13Properties"
;;       (physical-device-vulkan-1-3-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (minsubgroupsize :name "minSubgroupSize" :type uint32)
;;     (maxsubgroupsize :name "maxSubgroupSize" :type uint32)
;;     (maxcomputeworkgroupsubgroups :name "maxComputeWorkgroupSubgroups" :type
;;      uint32)
;;     (requiredsubgroupsizestages :name "requiredSubgroupSizeStages" :type
;;      "VkShaderStageFlags")
;;     (maxinlineuniformblocksize :name "maxInlineUniformBlockSize" :type uint32)
;;     (maxperstagedescriptorinlineuniformblocks :name
;;      "maxPerStageDescriptorInlineUniformBlocks" :type uint32)
;;     (maxperstagedescriptorupdateafterbindinlineuniformblocks :name
;;      "maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks" :type uint32)
;;     (maxdescriptorsetinlineuniformblocks :name
;;      "maxDescriptorSetInlineUniformBlocks" :type uint32)
;;     (maxdescriptorsetupdateafterbindinlineuniformblocks :name
;;      "maxDescriptorSetUpdateAfterBindInlineUniformBlocks" :type uint32)
;;     (maxinlineuniformtotalsize :name "maxInlineUniformTotalSize" :type uint32)
;;     (integerdotproduct8bitunsignedaccelerated :name
;;      "integerDotProduct8BitUnsignedAccelerated" :type "VkBool32")
;;     (integerdotproduct8bitsignedaccelerated :name
;;      "integerDotProduct8BitSignedAccelerated" :type "VkBool32")
;;     (integerdotproduct8bitmixedsignednessaccelerated :name
;;      "integerDotProduct8BitMixedSignednessAccelerated" :type "VkBool32")
;;     (integerdotproduct4x8bitpackedunsignedaccelerated :name
;;      "integerDotProduct4x8BitPackedUnsignedAccelerated" :type "VkBool32")
;;     (integerdotproduct4x8bitpackedsignedaccelerated :name
;;      "integerDotProduct4x8BitPackedSignedAccelerated" :type "VkBool32")
;;     (integerdotproduct4x8bitpackedmixedsignednessaccelerated :name
;;      "integerDotProduct4x8BitPackedMixedSignednessAccelerated" :type "VkBool32")
;;     (integerdotproduct16bitunsignedaccelerated :name
;;      "integerDotProduct16BitUnsignedAccelerated" :type "VkBool32")
;;     (integerdotproduct16bitsignedaccelerated :name
;;      "integerDotProduct16BitSignedAccelerated" :type "VkBool32")
;;     (integerdotproduct16bitmixedsignednessaccelerated :name
;;      "integerDotProduct16BitMixedSignednessAccelerated" :type "VkBool32")
;;     (integerdotproduct32bitunsignedaccelerated :name
;;      "integerDotProduct32BitUnsignedAccelerated" :type "VkBool32")
;;     (integerdotproduct32bitsignedaccelerated :name
;;      "integerDotProduct32BitSignedAccelerated" :type "VkBool32")
;;     (integerdotproduct32bitmixedsignednessaccelerated :name
;;      "integerDotProduct32BitMixedSignednessAccelerated" :type "VkBool32")
;;     (integerdotproduct64bitunsignedaccelerated :name
;;      "integerDotProduct64BitUnsignedAccelerated" :type "VkBool32")
;;     (integerdotproduct64bitsignedaccelerated :name
;;      "integerDotProduct64BitSignedAccelerated" :type "VkBool32")
;;     (integerdotproduct64bitmixedsignednessaccelerated :name
;;      "integerDotProduct64BitMixedSignednessAccelerated" :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating8bitunsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating8BitUnsignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating8bitsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating8BitSignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating8bitmixedsignednessaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating4x8bitpackedunsignedaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating4x8bitpackedsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating4x8bitpackedmixedsignednessaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating16bitunsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating16BitUnsignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating16bitsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating16BitSignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating16bitmixedsignednessaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating32bitunsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating32BitUnsignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating32bitsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating32BitSignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating32bitmixedsignednessaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating64bitunsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating64BitUnsignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating64bitsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating64BitSignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating64bitmixedsignednessaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated"
;;      :type "VkBool32")
;;     (storagetexelbufferoffsetalignmentbytes :name
;;      "storageTexelBufferOffsetAlignmentBytes" :type "VkDeviceSize")
;;     (storagetexelbufferoffsetsingletexelalignment :name
;;      "storageTexelBufferOffsetSingleTexelAlignment" :type "VkBool32")
;;     (uniformtexelbufferoffsetalignmentbytes :name
;;      "uniformTexelBufferOffsetAlignmentBytes" :type "VkDeviceSize")
;;     (uniformtexelbufferoffsetsingletexelalignment :name
;;      "uniformTexelBufferOffsetSingleTexelAlignment" :type "VkBool32")
;;     (maxbuffersize :name "maxBufferSize" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineCreationFeedback"
;;       (pipeline-creation-feedback-ext pipeline-creation-feedback)
;;       (:default-create :default-get :default-set)
;;     (flags :name flags :type "VkPipelineCreationFeedbackFlags")
;;     (duration :name duration :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineCreationFeedbackCreateInfo"
;;       (pipeline-creation-feedback-create-info-ext
;;        pipeline-creation-feedback-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (ppipelinecreationfeedback :name "pPipelineCreationFeedback" :type
;;      "VkPipelineCreationFeedback" :init-form nil :create
;;      ((ppipelinecreationfeedback-arg)
;;       (create-pointer ppipelinecreationfeedback ppipelinecreationfeedback-arg))
;;      :get (nil (get-pointer ppipelinecreationfeedback)) :set
;;      ((ppipelinecreationfeedback-arg)
;;       (set-pointer ppipelinecreationfeedback ppipelinecreationfeedback-arg)))
;;     (pipelinestagecreationfeedbackcount :name
;;      "pipelineStageCreationFeedbackCount" :type uint32)
;;     (ppipelinestagecreationfeedbacks :name "pPipelineStageCreationFeedbacks"
;;      :type "VkPipelineCreationFeedback" :init-form nil :create
;;      ((ppipelinestagecreationfeedbacks-arg)
;;       (create-array (:struct vkpipelinecreationfeedback)
;;        ppipelinestagecreationfeedbacks ppipelinestagecreationfeedbacks-arg
;;        :dynamic t :pointers ("VkPipelineCreationFeedback")))
;;      :destroy (destroy-array ppipelinestagecreationfeedbacks) :get
;;      ((&optional ppipelinestagecreationfeedbacks-index)
;;       (get-array (:struct vkpipelinecreationfeedback)
;;        ppipelinestagecreationfeedbacks ppipelinestagecreationfeedbacks-index
;;        pipelinestagecreationfeedbackcount :pointers
;;        ("VkPipelineCreationFeedback")))
;;      :set
;;      ((ppipelinestagecreationfeedbacks-arg &optional
;;        ppipelinestagecreationfeedbacks-index)
;;       (set-array (:struct vkpipelinecreationfeedback)
;;        ppipelinestagecreationfeedbacks ppipelinestagecreationfeedbacks-arg
;;        ppipelinestagecreationfeedbacks-index :dynamic t :pointers
;;        ("VkPipelineCreationFeedback")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderTerminateInvocationFeatures"
;;       (physical-device-shader-terminate-invocation-features-khr
;;        physical-device-shader-terminate-invocation-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderterminateinvocation :name "shaderTerminateInvocation" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceToolProperties"
;;       (physical-device-tool-properties-ext physical-device-tool-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (name :name name :type char :create
;;      ((name-arg) (create-string name name-arg :dynamic nil)) :get
;;      (nil (get-string name)) :set
;;      ((name-arg) (set-string name name-arg :dynamic nil)))
;;     (version :name version :type char :create
;;      ((version-arg) (create-string version version-arg :dynamic nil)) :get
;;      (nil (get-string version)) :set
;;      ((version-arg) (set-string version version-arg :dynamic nil)))
;;     (purposes :name purposes :type "VkToolPurposeFlags")
;;     (description :name description :type char :create
;;      ((description-arg)
;;       (create-string description description-arg :dynamic nil))
;;      :get (nil (get-string description)) :set
;;      ((description-arg) (set-string description description-arg :dynamic nil)))
;;     (layer :name layer :type char :create
;;      ((layer-arg) (create-string layer layer-arg :dynamic nil)) :get
;;      (nil (get-string layer)) :set
;;      ((layer-arg) (set-string layer layer-arg :dynamic nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderDemoteToHelperInvocationFeatures"
;;       (physical-device-shader-demote-to-helper-invocation-features-ext
;;        physical-device-shader-demote-to-helper-invocation-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderdemotetohelperinvocation :name "shaderDemoteToHelperInvocation"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePrivateDataFeatures"
;;       (physical-device-private-data-features-ext
;;        physical-device-private-data-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (privatedata :name "privateData" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDevicePrivateDataCreateInfo"
;;       (device-private-data-create-info-ext device-private-data-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (privatedataslotrequestcount :name "privateDataSlotRequestCount" :type
;;      uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPrivateDataSlotCreateInfo"
;;       (private-data-slot-create-info-ext private-data-slot-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPrivateDataSlotCreateFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePipelineCreationCacheControlFeatures"
;;       (physical-device-pipeline-creation-cache-control-features-ext
;;        physical-device-pipeline-creation-cache-control-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pipelinecreationcachecontrol :name "pipelineCreationCacheControl" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryBarrier2"
;;       (memory-barrier-2-khr memory-barrier-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcstagemask :name "srcStageMask" :type "VkPipelineStageFlags2")
;;     (srcaccessmask :name "srcAccessMask" :type "VkAccessFlags2")
;;     (dststagemask :name "dstStageMask" :type "VkPipelineStageFlags2")
;;     (dstaccessmask :name "dstAccessMask" :type "VkAccessFlags2"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferMemoryBarrier2"
;;       (buffer-memory-barrier-2-khr buffer-memory-barrier-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcstagemask :name "srcStageMask" :type "VkPipelineStageFlags2")
;;     (srcaccessmask :name "srcAccessMask" :type "VkAccessFlags2")
;;     (dststagemask :name "dstStageMask" :type "VkPipelineStageFlags2")
;;     (dstaccessmask :name "dstAccessMask" :type "VkAccessFlags2")
;;     (srcqueuefamilyindex :name "srcQueueFamilyIndex" :type uint32)
;;     (dstqueuefamilyindex :name "dstQueueFamilyIndex" :type uint32)
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg)))
;;     (offset :name offset :type "VkDeviceSize")
;;     (size :name size :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageMemoryBarrier2"
;;       (image-memory-barrier-2-khr image-memory-barrier-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcstagemask :name "srcStageMask" :type "VkPipelineStageFlags2")
;;     (srcaccessmask :name "srcAccessMask" :type "VkAccessFlags2")
;;     (dststagemask :name "dstStageMask" :type "VkPipelineStageFlags2")
;;     (dstaccessmask :name "dstAccessMask" :type "VkAccessFlags2")
;;     (oldlayout :name "oldLayout" :type "VkImageLayout")
;;     (newlayout :name "newLayout" :type "VkImageLayout")
;;     (srcqueuefamilyindex :name "srcQueueFamilyIndex" :type uint32)
;;     (dstqueuefamilyindex :name "dstQueueFamilyIndex" :type uint32)
;;     (image :name image :type "VkImage" :create
;;      ((image-arg) (create-pointer image image-arg)) :get
;;      (nil (get-pointer image)) :set ((image-arg) (set-pointer image image-arg)))
;;     (subresourcerange :pointer t :name "subresourceRange" :type
;;      "VkImageSubresourceRange" :create
;;      ((subresourcerange-arg)
;;       (copy-object subresourcerange subresourcerange-arg
;;        '(:struct vkimagesubresourcerange)))
;;      :set
;;      ((subresourcerange-arg)
;;       (copy-object subresourcerange subresourcerange-arg
;;        '(:struct vkimagesubresourcerange)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDependencyInfo"
;;       (dependency-info-khr dependency-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (dependencyflags :name "dependencyFlags" :type "VkDependencyFlags")
;;     (memorybarriercount :name "memoryBarrierCount" :type uint32)
;;     (pmemorybarriers :name "pMemoryBarriers" :type "VkMemoryBarrier2"
;;      :init-form nil :create
;;      ((pmemorybarriers-arg)
;;       (create-array (:struct vkmemorybarrier2) pmemorybarriers
;;        pmemorybarriers-arg :dynamic t :pointers ("VkMemoryBarrier2")))
;;      :destroy (destroy-array pmemorybarriers) :get
;;      ((&optional pmemorybarriers-index)
;;       (get-array (:struct vkmemorybarrier2) pmemorybarriers
;;        pmemorybarriers-index memorybarriercount :pointers
;;        ("VkMemoryBarrier2")))
;;      :set
;;      ((pmemorybarriers-arg &optional pmemorybarriers-index)
;;       (set-array (:struct vkmemorybarrier2) pmemorybarriers pmemorybarriers-arg
;;        pmemorybarriers-index :dynamic t :pointers ("VkMemoryBarrier2"))))
;;     (buffermemorybarriercount :name "bufferMemoryBarrierCount" :type uint32)
;;     (pbuffermemorybarriers :name "pBufferMemoryBarriers" :type
;;      "VkBufferMemoryBarrier2" :init-form nil :create
;;      ((pbuffermemorybarriers-arg)
;;       (create-array (:struct vkbuffermemorybarrier2) pbuffermemorybarriers
;;        pbuffermemorybarriers-arg :dynamic t :pointers
;;        ("VkBufferMemoryBarrier2")))
;;      :destroy (destroy-array pbuffermemorybarriers) :get
;;      ((&optional pbuffermemorybarriers-index)
;;       (get-array (:struct vkbuffermemorybarrier2) pbuffermemorybarriers
;;        pbuffermemorybarriers-index buffermemorybarriercount :pointers
;;        ("VkBufferMemoryBarrier2")))
;;      :set
;;      ((pbuffermemorybarriers-arg &optional pbuffermemorybarriers-index)
;;       (set-array (:struct vkbuffermemorybarrier2) pbuffermemorybarriers
;;        pbuffermemorybarriers-arg pbuffermemorybarriers-index :dynamic t
;;        :pointers ("VkBufferMemoryBarrier2"))))
;;     (imagememorybarriercount :name "imageMemoryBarrierCount" :type uint32)
;;     (pimagememorybarriers :name "pImageMemoryBarriers" :type
;;      "VkImageMemoryBarrier2" :init-form nil :create
;;      ((pimagememorybarriers-arg)
;;       (create-array (:struct vkimagememorybarrier2) pimagememorybarriers
;;        pimagememorybarriers-arg :dynamic t :pointers
;;        ("VkImageMemoryBarrier2")))
;;      :destroy (destroy-array pimagememorybarriers) :get
;;      ((&optional pimagememorybarriers-index)
;;       (get-array (:struct vkimagememorybarrier2) pimagememorybarriers
;;        pimagememorybarriers-index imagememorybarriercount :pointers
;;        ("VkImageMemoryBarrier2")))
;;      :set
;;      ((pimagememorybarriers-arg &optional pimagememorybarriers-index)
;;       (set-array (:struct vkimagememorybarrier2) pimagememorybarriers
;;        pimagememorybarriers-arg pimagememorybarriers-index :dynamic t :pointers
;;        ("VkImageMemoryBarrier2")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSemaphoreSubmitInfo"
;;       (semaphore-submit-info-khr semaphore-submit-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (semaphore :name semaphore :type "VkSemaphore" :create
;;      ((semaphore-arg) (create-pointer semaphore semaphore-arg)) :get
;;      (nil (get-pointer semaphore)) :set
;;      ((semaphore-arg) (set-pointer semaphore semaphore-arg)))
;;     (value :name value :type uint64)
;;     (stagemask :name "stageMask" :type "VkPipelineStageFlags2")
;;     (deviceindex :name "deviceIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCommandBufferSubmitInfo"
;;       (command-buffer-submit-info-khr command-buffer-submit-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (commandbuffer :name "commandBuffer" :type "VkCommandBuffer" :create
;;      ((commandbuffer-arg) (create-pointer commandbuffer commandbuffer-arg))
;;      :get (nil (get-pointer commandbuffer)) :set
;;      ((commandbuffer-arg) (set-pointer commandbuffer commandbuffer-arg)))
;;     (devicemask :name "deviceMask" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubmitInfo2"
;;       (submit-info-2-khr submit-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkSubmitFlags")
;;     (waitsemaphoreinfocount :name "waitSemaphoreInfoCount" :type uint32)
;;     (pwaitsemaphoreinfos :name "pWaitSemaphoreInfos" :type
;;      "VkSemaphoreSubmitInfo" :init-form nil :create
;;      ((pwaitsemaphoreinfos-arg)
;;       (create-array (:struct vksemaphoresubmitinfo) pwaitsemaphoreinfos
;;        pwaitsemaphoreinfos-arg :dynamic t :pointers ("VkSemaphoreSubmitInfo")))
;;      :destroy (destroy-array pwaitsemaphoreinfos) :get
;;      ((&optional pwaitsemaphoreinfos-index)
;;       (get-array (:struct vksemaphoresubmitinfo) pwaitsemaphoreinfos
;;        pwaitsemaphoreinfos-index waitsemaphoreinfocount :pointers
;;        ("VkSemaphoreSubmitInfo")))
;;      :set
;;      ((pwaitsemaphoreinfos-arg &optional pwaitsemaphoreinfos-index)
;;       (set-array (:struct vksemaphoresubmitinfo) pwaitsemaphoreinfos
;;        pwaitsemaphoreinfos-arg pwaitsemaphoreinfos-index :dynamic t :pointers
;;        ("VkSemaphoreSubmitInfo"))))
;;     (commandbufferinfocount :name "commandBufferInfoCount" :type uint32)
;;     (pcommandbufferinfos :name "pCommandBufferInfos" :type
;;      "VkCommandBufferSubmitInfo" :init-form nil :create
;;      ((pcommandbufferinfos-arg)
;;       (create-array (:struct vkcommandbuffersubmitinfo) pcommandbufferinfos
;;        pcommandbufferinfos-arg :dynamic t :pointers
;;        ("VkCommandBufferSubmitInfo")))
;;      :destroy (destroy-array pcommandbufferinfos) :get
;;      ((&optional pcommandbufferinfos-index)
;;       (get-array (:struct vkcommandbuffersubmitinfo) pcommandbufferinfos
;;        pcommandbufferinfos-index commandbufferinfocount :pointers
;;        ("VkCommandBufferSubmitInfo")))
;;      :set
;;      ((pcommandbufferinfos-arg &optional pcommandbufferinfos-index)
;;       (set-array (:struct vkcommandbuffersubmitinfo) pcommandbufferinfos
;;        pcommandbufferinfos-arg pcommandbufferinfos-index :dynamic t :pointers
;;        ("VkCommandBufferSubmitInfo"))))
;;     (signalsemaphoreinfocount :name "signalSemaphoreInfoCount" :type uint32)
;;     (psignalsemaphoreinfos :name "pSignalSemaphoreInfos" :type
;;      "VkSemaphoreSubmitInfo" :init-form nil :create
;;      ((psignalsemaphoreinfos-arg)
;;       (create-array (:struct vksemaphoresubmitinfo) psignalsemaphoreinfos
;;        psignalsemaphoreinfos-arg :dynamic t :pointers
;;        ("VkSemaphoreSubmitInfo")))
;;      :destroy (destroy-array psignalsemaphoreinfos) :get
;;      ((&optional psignalsemaphoreinfos-index)
;;       (get-array (:struct vksemaphoresubmitinfo) psignalsemaphoreinfos
;;        psignalsemaphoreinfos-index signalsemaphoreinfocount :pointers
;;        ("VkSemaphoreSubmitInfo")))
;;      :set
;;      ((psignalsemaphoreinfos-arg &optional psignalsemaphoreinfos-index)
;;       (set-array (:struct vksemaphoresubmitinfo) psignalsemaphoreinfos
;;        psignalsemaphoreinfos-arg psignalsemaphoreinfos-index :dynamic t
;;        :pointers ("VkSemaphoreSubmitInfo")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSynchronization2Features"
;;       (physical-device-synchronization-2-features-khr
;;        physical-device-synchronization-2-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (synchronization2 :name synchronization2 :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeatures"
;;       (physical-device-zero-initialize-workgroup-memory-features-khr
;;        physical-device-zero-initialize-workgroup-memory-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderzeroinitializeworkgroupmemory :name
;;      "shaderZeroInitializeWorkgroupMemory" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceImageRobustnessFeatures"
;;       (physical-device-image-robustness-features-ext
;;        physical-device-image-robustness-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (robustimageaccess :name "robustImageAccess" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferCopy2"
;;       (buffer-copy-2-khr buffer-copy-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcoffset :name "srcOffset" :type "VkDeviceSize")
;;     (dstoffset :name "dstOffset" :type "VkDeviceSize")
;;     (size :name size :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCopyBufferInfo2"
;;       (copy-buffer-info-2-khr copy-buffer-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcbuffer :name "srcBuffer" :type "VkBuffer" :create
;;      ((srcbuffer-arg) (create-pointer srcbuffer srcbuffer-arg)) :get
;;      (nil (get-pointer srcbuffer)) :set
;;      ((srcbuffer-arg) (set-pointer srcbuffer srcbuffer-arg)))
;;     (dstbuffer :name "dstBuffer" :type "VkBuffer" :create
;;      ((dstbuffer-arg) (create-pointer dstbuffer dstbuffer-arg)) :get
;;      (nil (get-pointer dstbuffer)) :set
;;      ((dstbuffer-arg) (set-pointer dstbuffer dstbuffer-arg)))
;;     (regioncount :name "regionCount" :type uint32)
;;     (pregions :name "pRegions" :type "VkBufferCopy2" :init-form nil :create
;;      ((pregions-arg)
;;       (create-array (:struct vkbuffercopy2) pregions pregions-arg :dynamic t
;;        :pointers ("VkBufferCopy2")))
;;      :destroy (destroy-array pregions) :get
;;      ((&optional pregions-index)
;;       (get-array (:struct vkbuffercopy2) pregions pregions-index regioncount
;;        :pointers ("VkBufferCopy2")))
;;      :set
;;      ((pregions-arg &optional pregions-index)
;;       (set-array (:struct vkbuffercopy2) pregions pregions-arg pregions-index
;;        :dynamic t :pointers ("VkBufferCopy2")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageCopy2"
;;       (image-copy-2-khr image-copy-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcsubresource :pointer t :name "srcSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (srcoffset :pointer t :name "srcOffset" :type "VkOffset3D" :create
;;      ((srcoffset-arg)
;;       (copy-object srcoffset srcoffset-arg '(:struct vkoffset3d)))
;;      :set
;;      ((srcoffset-arg)
;;       (copy-object srcoffset srcoffset-arg '(:struct vkoffset3d))))
;;     (dstsubresource :pointer t :name "dstSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (dstoffset :pointer t :name "dstOffset" :type "VkOffset3D" :create
;;      ((dstoffset-arg)
;;       (copy-object dstoffset dstoffset-arg '(:struct vkoffset3d)))
;;      :set
;;      ((dstoffset-arg)
;;       (copy-object dstoffset dstoffset-arg '(:struct vkoffset3d))))
;;     (extent :pointer t :name extent :type "VkExtent3D" :create
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d))) :set
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCopyImageInfo2"
;;       (copy-image-info-2-khr copy-image-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcimage :name "srcImage" :type "VkImage" :create
;;      ((srcimage-arg) (create-pointer srcimage srcimage-arg)) :get
;;      (nil (get-pointer srcimage)) :set
;;      ((srcimage-arg) (set-pointer srcimage srcimage-arg)))
;;     (srcimagelayout :name "srcImageLayout" :type "VkImageLayout")
;;     (dstimage :name "dstImage" :type "VkImage" :create
;;      ((dstimage-arg) (create-pointer dstimage dstimage-arg)) :get
;;      (nil (get-pointer dstimage)) :set
;;      ((dstimage-arg) (set-pointer dstimage dstimage-arg)))
;;     (dstimagelayout :name "dstImageLayout" :type "VkImageLayout")
;;     (regioncount :name "regionCount" :type uint32)
;;     (pregions :name "pRegions" :type "VkImageCopy2" :init-form nil :create
;;      ((pregions-arg)
;;       (create-array (:struct vkimagecopy2) pregions pregions-arg :dynamic t
;;        :pointers ("VkImageCopy2")))
;;      :destroy (destroy-array pregions) :get
;;      ((&optional pregions-index)
;;       (get-array (:struct vkimagecopy2) pregions pregions-index regioncount
;;        :pointers ("VkImageCopy2")))
;;      :set
;;      ((pregions-arg &optional pregions-index)
;;       (set-array (:struct vkimagecopy2) pregions pregions-arg pregions-index
;;        :dynamic t :pointers ("VkImageCopy2")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferImageCopy2"
;;       (buffer-image-copy-2-khr buffer-image-copy-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (bufferoffset :name "bufferOffset" :type "VkDeviceSize")
;;     (bufferrowlength :name "bufferRowLength" :type uint32)
;;     (bufferimageheight :name "bufferImageHeight" :type uint32)
;;     (imagesubresource :pointer t :name "imageSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((imagesubresource-arg)
;;       (copy-object imagesubresource imagesubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((imagesubresource-arg)
;;       (copy-object imagesubresource imagesubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (imageoffset :pointer t :name "imageOffset" :type "VkOffset3D" :create
;;      ((imageoffset-arg)
;;       (copy-object imageoffset imageoffset-arg '(:struct vkoffset3d)))
;;      :set
;;      ((imageoffset-arg)
;;       (copy-object imageoffset imageoffset-arg '(:struct vkoffset3d))))
;;     (imageextent :pointer t :name "imageExtent" :type "VkExtent3D" :create
;;      ((imageextent-arg)
;;       (copy-object imageextent imageextent-arg '(:struct vkextent3d)))
;;      :set
;;      ((imageextent-arg)
;;       (copy-object imageextent imageextent-arg '(:struct vkextent3d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCopyBufferToImageInfo2"
;;       (copy-buffer-to-image-info-2-khr copy-buffer-to-image-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcbuffer :name "srcBuffer" :type "VkBuffer" :create
;;      ((srcbuffer-arg) (create-pointer srcbuffer srcbuffer-arg)) :get
;;      (nil (get-pointer srcbuffer)) :set
;;      ((srcbuffer-arg) (set-pointer srcbuffer srcbuffer-arg)))
;;     (dstimage :name "dstImage" :type "VkImage" :create
;;      ((dstimage-arg) (create-pointer dstimage dstimage-arg)) :get
;;      (nil (get-pointer dstimage)) :set
;;      ((dstimage-arg) (set-pointer dstimage dstimage-arg)))
;;     (dstimagelayout :name "dstImageLayout" :type "VkImageLayout")
;;     (regioncount :name "regionCount" :type uint32)
;;     (pregions :name "pRegions" :type "VkBufferImageCopy2" :init-form nil
;;      :create
;;      ((pregions-arg)
;;       (create-array (:struct vkbufferimagecopy2) pregions pregions-arg :dynamic
;;        t :pointers ("VkBufferImageCopy2")))
;;      :destroy (destroy-array pregions) :get
;;      ((&optional pregions-index)
;;       (get-array (:struct vkbufferimagecopy2) pregions pregions-index
;;        regioncount :pointers ("VkBufferImageCopy2")))
;;      :set
;;      ((pregions-arg &optional pregions-index)
;;       (set-array (:struct vkbufferimagecopy2) pregions pregions-arg
;;        pregions-index :dynamic t :pointers ("VkBufferImageCopy2")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCopyImageToBufferInfo2"
;;       (copy-image-to-buffer-info-2-khr copy-image-to-buffer-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcimage :name "srcImage" :type "VkImage" :create
;;      ((srcimage-arg) (create-pointer srcimage srcimage-arg)) :get
;;      (nil (get-pointer srcimage)) :set
;;      ((srcimage-arg) (set-pointer srcimage srcimage-arg)))
;;     (srcimagelayout :name "srcImageLayout" :type "VkImageLayout")
;;     (dstbuffer :name "dstBuffer" :type "VkBuffer" :create
;;      ((dstbuffer-arg) (create-pointer dstbuffer dstbuffer-arg)) :get
;;      (nil (get-pointer dstbuffer)) :set
;;      ((dstbuffer-arg) (set-pointer dstbuffer dstbuffer-arg)))
;;     (regioncount :name "regionCount" :type uint32)
;;     (pregions :name "pRegions" :type "VkBufferImageCopy2" :init-form nil
;;      :create
;;      ((pregions-arg)
;;       (create-array (:struct vkbufferimagecopy2) pregions pregions-arg :dynamic
;;        t :pointers ("VkBufferImageCopy2")))
;;      :destroy (destroy-array pregions) :get
;;      ((&optional pregions-index)
;;       (get-array (:struct vkbufferimagecopy2) pregions pregions-index
;;        regioncount :pointers ("VkBufferImageCopy2")))
;;      :set
;;      ((pregions-arg &optional pregions-index)
;;       (set-array (:struct vkbufferimagecopy2) pregions pregions-arg
;;        pregions-index :dynamic t :pointers ("VkBufferImageCopy2")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageBlit2"
;;       (image-blit-2-khr image-blit-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcsubresource :pointer t :name "srcSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (srcoffsets :pointer t :name "srcOffsets" :type "VkOffset3D" :create
;;      ((srcoffsets-arg)
;;       (create-array (:struct vkoffset3d) srcoffsets srcoffsets-arg :dynamic nil
;;        :pointers ("VkOffset3D")))
;;      :get
;;      ((&optional srcoffsets-index)
;;       (get-array (:struct vkoffset3d) srcoffsets srcoffsets-index 2 :pointers
;;        ("VkOffset3D")))
;;      :set
;;      ((srcoffsets-arg &optional srcoffsets-index)
;;       (set-array (:struct vkoffset3d) srcoffsets srcoffsets-arg
;;        srcoffsets-index :dynamic nil :pointers ("VkOffset3D"))))
;;     (dstsubresource :pointer t :name "dstSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (dstoffsets :pointer t :name "dstOffsets" :type "VkOffset3D" :create
;;      ((dstoffsets-arg)
;;       (create-array (:struct vkoffset3d) dstoffsets dstoffsets-arg :dynamic nil
;;        :pointers ("VkOffset3D")))
;;      :get
;;      ((&optional dstoffsets-index)
;;       (get-array (:struct vkoffset3d) dstoffsets dstoffsets-index 2 :pointers
;;        ("VkOffset3D")))
;;      :set
;;      ((dstoffsets-arg &optional dstoffsets-index)
;;       (set-array (:struct vkoffset3d) dstoffsets dstoffsets-arg
;;        dstoffsets-index :dynamic nil :pointers ("VkOffset3D")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBlitImageInfo2"
;;       (blit-image-info-2-khr blit-image-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcimage :name "srcImage" :type "VkImage" :create
;;      ((srcimage-arg) (create-pointer srcimage srcimage-arg)) :get
;;      (nil (get-pointer srcimage)) :set
;;      ((srcimage-arg) (set-pointer srcimage srcimage-arg)))
;;     (srcimagelayout :name "srcImageLayout" :type "VkImageLayout")
;;     (dstimage :name "dstImage" :type "VkImage" :create
;;      ((dstimage-arg) (create-pointer dstimage dstimage-arg)) :get
;;      (nil (get-pointer dstimage)) :set
;;      ((dstimage-arg) (set-pointer dstimage dstimage-arg)))
;;     (dstimagelayout :name "dstImageLayout" :type "VkImageLayout")
;;     (regioncount :name "regionCount" :type uint32)
;;     (pregions :name "pRegions" :type "VkImageBlit2" :init-form nil :create
;;      ((pregions-arg)
;;       (create-array (:struct vkimageblit2) pregions pregions-arg :dynamic t
;;        :pointers ("VkImageBlit2")))
;;      :destroy (destroy-array pregions) :get
;;      ((&optional pregions-index)
;;       (get-array (:struct vkimageblit2) pregions pregions-index regioncount
;;        :pointers ("VkImageBlit2")))
;;      :set
;;      ((pregions-arg &optional pregions-index)
;;       (set-array (:struct vkimageblit2) pregions pregions-arg pregions-index
;;        :dynamic t :pointers ("VkImageBlit2"))))
;;     (filter :name filter :type "VkFilter"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageResolve2"
;;       (image-resolve-2-khr image-resolve-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcsubresource :pointer t :name "srcSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((srcsubresource-arg)
;;       (copy-object srcsubresource srcsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (srcoffset :pointer t :name "srcOffset" :type "VkOffset3D" :create
;;      ((srcoffset-arg)
;;       (copy-object srcoffset srcoffset-arg '(:struct vkoffset3d)))
;;      :set
;;      ((srcoffset-arg)
;;       (copy-object srcoffset srcoffset-arg '(:struct vkoffset3d))))
;;     (dstsubresource :pointer t :name "dstSubresource" :type
;;      "VkImageSubresourceLayers" :create
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers)))
;;      :set
;;      ((dstsubresource-arg)
;;       (copy-object dstsubresource dstsubresource-arg
;;        '(:struct vkimagesubresourcelayers))))
;;     (dstoffset :pointer t :name "dstOffset" :type "VkOffset3D" :create
;;      ((dstoffset-arg)
;;       (copy-object dstoffset dstoffset-arg '(:struct vkoffset3d)))
;;      :set
;;      ((dstoffset-arg)
;;       (copy-object dstoffset dstoffset-arg '(:struct vkoffset3d))))
;;     (extent :pointer t :name extent :type "VkExtent3D" :create
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d))) :set
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent3d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkResolveImageInfo2"
;;       (resolve-image-info-2-khr resolve-image-info-2)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcimage :name "srcImage" :type "VkImage" :create
;;      ((srcimage-arg) (create-pointer srcimage srcimage-arg)) :get
;;      (nil (get-pointer srcimage)) :set
;;      ((srcimage-arg) (set-pointer srcimage srcimage-arg)))
;;     (srcimagelayout :name "srcImageLayout" :type "VkImageLayout")
;;     (dstimage :name "dstImage" :type "VkImage" :create
;;      ((dstimage-arg) (create-pointer dstimage dstimage-arg)) :get
;;      (nil (get-pointer dstimage)) :set
;;      ((dstimage-arg) (set-pointer dstimage dstimage-arg)))
;;     (dstimagelayout :name "dstImageLayout" :type "VkImageLayout")
;;     (regioncount :name "regionCount" :type uint32)
;;     (pregions :name "pRegions" :type "VkImageResolve2" :init-form nil :create
;;      ((pregions-arg)
;;       (create-array (:struct vkimageresolve2) pregions pregions-arg :dynamic t
;;        :pointers ("VkImageResolve2")))
;;      :destroy (destroy-array pregions) :get
;;      ((&optional pregions-index)
;;       (get-array (:struct vkimageresolve2) pregions pregions-index regioncount
;;        :pointers ("VkImageResolve2")))
;;      :set
;;      ((pregions-arg &optional pregions-index)
;;       (set-array (:struct vkimageresolve2) pregions pregions-arg pregions-index
;;        :dynamic t :pointers ("VkImageResolve2")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSubgroupSizeControlFeatures"
;;       (physical-device-subgroup-size-control-features-ext
;;        physical-device-subgroup-size-control-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (subgroupsizecontrol :name "subgroupSizeControl" :type "VkBool32")
;;     (computefullsubgroups :name "computeFullSubgroups" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSubgroupSizeControlProperties"
;;       (physical-device-subgroup-size-control-properties-ext
;;        physical-device-subgroup-size-control-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (minsubgroupsize :name "minSubgroupSize" :type uint32)
;;     (maxsubgroupsize :name "maxSubgroupSize" :type uint32)
;;     (maxcomputeworkgroupsubgroups :name "maxComputeWorkgroupSubgroups" :type
;;      uint32)
;;     (requiredsubgroupsizestages :name "requiredSubgroupSizeStages" :type
;;      "VkShaderStageFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineShaderStageRequiredSubgroupSizeCreateInfo"
;;       (pipeline-shader-stage-required-subgroup-size-create-info-ext
;;        pipeline-shader-stage-required-subgroup-size-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (requiredsubgroupsize :name "requiredSubgroupSize" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceInlineUniformBlockFeatures"
;;       (physical-device-inline-uniform-block-features-ext
;;        physical-device-inline-uniform-block-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (inlineuniformblock :name "inlineUniformBlock" :type "VkBool32")
;;     (descriptorbindinginlineuniformblockupdateafterbind :name
;;      "descriptorBindingInlineUniformBlockUpdateAfterBind" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceInlineUniformBlockProperties"
;;       (physical-device-inline-uniform-block-properties-ext
;;        physical-device-inline-uniform-block-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxinlineuniformblocksize :name "maxInlineUniformBlockSize" :type uint32)
;;     (maxperstagedescriptorinlineuniformblocks :name
;;      "maxPerStageDescriptorInlineUniformBlocks" :type uint32)
;;     (maxperstagedescriptorupdateafterbindinlineuniformblocks :name
;;      "maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks" :type uint32)
;;     (maxdescriptorsetinlineuniformblocks :name
;;      "maxDescriptorSetInlineUniformBlocks" :type uint32)
;;     (maxdescriptorsetupdateafterbindinlineuniformblocks :name
;;      "maxDescriptorSetUpdateAfterBindInlineUniformBlocks" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkWriteDescriptorSetInlineUniformBlock"
;;       (write-descriptor-set-inline-uniform-block-ext
;;        write-descriptor-set-inline-uniform-block)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (datasize :name "dataSize" :type uint32)
;;     (pdata :name "pData" :type void :init-form nil :create
;;      ((pdata-arg) (create-pointer pdata pdata-arg)) :get
;;      (nil (get-pointer pdata)) :set
;;      ((pdata-arg) (set-pointer pdata pdata-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorPoolInlineUniformBlockCreateInfo"
;;       (descriptor-pool-inline-uniform-block-create-info-ext
;;        descriptor-pool-inline-uniform-block-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxinlineuniformblockbindings :name "maxInlineUniformBlockBindings" :type
;;      uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceTextureCompressionASTCHDRFeatures"
;;       (physical-device-texture-compression-a-s-t-c-h-d-r-features-ext
;;        physical-device-texture-compression-a-s-t-c-h-d-r-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (texturecompressionastc_hdr :name "textureCompressionASTC_HDR" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderingAttachmentInfo"
;;       (rendering-attachment-info-khr rendering-attachment-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imageview :name "imageView" :type "VkImageView" :create
;;      ((imageview-arg) (create-pointer imageview imageview-arg)) :get
;;      (nil (get-pointer imageview)) :set
;;      ((imageview-arg) (set-pointer imageview imageview-arg)))
;;     (imagelayout :name "imageLayout" :type "VkImageLayout")
;;     (resolvemode :name "resolveMode" :type "VkResolveModeFlagBits")
;;     (resolveimageview :name "resolveImageView" :type "VkImageView" :create
;;      ((resolveimageview-arg)
;;       (create-pointer resolveimageview resolveimageview-arg))
;;      :get (nil (get-pointer resolveimageview)) :set
;;      ((resolveimageview-arg)
;;       (set-pointer resolveimageview resolveimageview-arg)))
;;     (resolveimagelayout :name "resolveImageLayout" :type "VkImageLayout")
;;     (loadop :name "loadOp" :type "VkAttachmentLoadOp")
;;     (storeop :name "storeOp" :type "VkAttachmentStoreOp")
;;     (clearvalue :pointer t :name "clearValue" :type "VkClearValue" :create
;;      ((clearvalue-arg)
;;       (copy-object clearvalue clearvalue-arg '(:union vkclearvalue)))
;;      :set
;;      ((clearvalue-arg)
;;       (copy-object clearvalue clearvalue-arg '(:union vkclearvalue)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderingInfo"
;;       (rendering-info-khr rendering-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkRenderingFlags")
;;     (renderarea :pointer t :name "renderArea" :type "VkRect2D" :create
;;      ((renderarea-arg)
;;       (copy-object renderarea renderarea-arg '(:struct vkrect2d)))
;;      :set
;;      ((renderarea-arg)
;;       (copy-object renderarea renderarea-arg '(:struct vkrect2d))))
;;     (layercount :name "layerCount" :type uint32)
;;     (viewmask :name "viewMask" :type uint32)
;;     (colorattachmentcount :name "colorAttachmentCount" :type uint32)
;;     (pcolorattachments :name "pColorAttachments" :type
;;      "VkRenderingAttachmentInfo" :init-form nil :create
;;      ((pcolorattachments-arg)
;;       (create-array (:struct vkrenderingattachmentinfo) pcolorattachments
;;        pcolorattachments-arg :dynamic t :pointers
;;        ("VkRenderingAttachmentInfo")))
;;      :destroy (destroy-array pcolorattachments) :get
;;      ((&optional pcolorattachments-index)
;;       (get-array (:struct vkrenderingattachmentinfo) pcolorattachments
;;        pcolorattachments-index colorattachmentcount :pointers
;;        ("VkRenderingAttachmentInfo")))
;;      :set
;;      ((pcolorattachments-arg &optional pcolorattachments-index)
;;       (set-array (:struct vkrenderingattachmentinfo) pcolorattachments
;;        pcolorattachments-arg pcolorattachments-index :dynamic t :pointers
;;        ("VkRenderingAttachmentInfo"))))
;;     (pdepthattachment :name "pDepthAttachment" :type
;;      "VkRenderingAttachmentInfo" :init-form nil :create
;;      ((pdepthattachment-arg)
;;       (create-pointer pdepthattachment pdepthattachment-arg))
;;      :get (nil (get-pointer pdepthattachment)) :set
;;      ((pdepthattachment-arg)
;;       (set-pointer pdepthattachment pdepthattachment-arg)))
;;     (pstencilattachment :name "pStencilAttachment" :type
;;      "VkRenderingAttachmentInfo" :init-form nil :create
;;      ((pstencilattachment-arg)
;;       (create-pointer pstencilattachment pstencilattachment-arg))
;;      :get (nil (get-pointer pstencilattachment)) :set
;;      ((pstencilattachment-arg)
;;       (set-pointer pstencilattachment pstencilattachment-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineRenderingCreateInfo"
;;       (pipeline-rendering-create-info-khr pipeline-rendering-create-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (viewmask :name "viewMask" :type uint32)
;;     (colorattachmentcount :name "colorAttachmentCount" :type uint32)
;;     (pcolorattachmentformats :name "pColorAttachmentFormats" :type "VkFormat"
;;      :init-form nil :create
;;      ((pcolorattachmentformats-arg)
;;       (create-array vkformat pcolorattachmentformats
;;        pcolorattachmentformats-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pcolorattachmentformats) :get
;;      ((&optional pcolorattachmentformats-index)
;;       (get-array vkformat pcolorattachmentformats pcolorattachmentformats-index
;;        colorattachmentcount :pointers nil))
;;      :set
;;      ((pcolorattachmentformats-arg &optional pcolorattachmentformats-index)
;;       (set-array vkformat pcolorattachmentformats pcolorattachmentformats-arg
;;        pcolorattachmentformats-index :dynamic t :pointers nil)))
;;     (depthattachmentformat :name "depthAttachmentFormat" :type "VkFormat")
;;     (stencilattachmentformat :name "stencilAttachmentFormat" :type "VkFormat"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDynamicRenderingFeatures"
;;       (physical-device-dynamic-rendering-features-khr
;;        physical-device-dynamic-rendering-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (dynamicrendering :name "dynamicRendering" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCommandBufferInheritanceRenderingInfo"
;;       (command-buffer-inheritance-rendering-info-khr
;;        command-buffer-inheritance-rendering-info)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkRenderingFlags")
;;     (viewmask :name "viewMask" :type uint32)
;;     (colorattachmentcount :name "colorAttachmentCount" :type uint32)
;;     (pcolorattachmentformats :name "pColorAttachmentFormats" :type "VkFormat"
;;      :init-form nil :create
;;      ((pcolorattachmentformats-arg)
;;       (create-array vkformat pcolorattachmentformats
;;        pcolorattachmentformats-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pcolorattachmentformats) :get
;;      ((&optional pcolorattachmentformats-index)
;;       (get-array vkformat pcolorattachmentformats pcolorattachmentformats-index
;;        colorattachmentcount :pointers nil))
;;      :set
;;      ((pcolorattachmentformats-arg &optional pcolorattachmentformats-index)
;;       (set-array vkformat pcolorattachmentformats pcolorattachmentformats-arg
;;        pcolorattachmentformats-index :dynamic t :pointers nil)))
;;     (depthattachmentformat :name "depthAttachmentFormat" :type "VkFormat")
;;     (stencilattachmentformat :name "stencilAttachmentFormat" :type "VkFormat")
;;     (rasterizationsamples :name "rasterizationSamples" :type
;;      "VkSampleCountFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderIntegerDotProductFeatures"
;;       (physical-device-shader-integer-dot-product-features-khr
;;        physical-device-shader-integer-dot-product-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderintegerdotproduct :name "shaderIntegerDotProduct" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderIntegerDotProductProperties"
;;       (physical-device-shader-integer-dot-product-properties-khr
;;        physical-device-shader-integer-dot-product-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (integerdotproduct8bitunsignedaccelerated :name
;;      "integerDotProduct8BitUnsignedAccelerated" :type "VkBool32")
;;     (integerdotproduct8bitsignedaccelerated :name
;;      "integerDotProduct8BitSignedAccelerated" :type "VkBool32")
;;     (integerdotproduct8bitmixedsignednessaccelerated :name
;;      "integerDotProduct8BitMixedSignednessAccelerated" :type "VkBool32")
;;     (integerdotproduct4x8bitpackedunsignedaccelerated :name
;;      "integerDotProduct4x8BitPackedUnsignedAccelerated" :type "VkBool32")
;;     (integerdotproduct4x8bitpackedsignedaccelerated :name
;;      "integerDotProduct4x8BitPackedSignedAccelerated" :type "VkBool32")
;;     (integerdotproduct4x8bitpackedmixedsignednessaccelerated :name
;;      "integerDotProduct4x8BitPackedMixedSignednessAccelerated" :type "VkBool32")
;;     (integerdotproduct16bitunsignedaccelerated :name
;;      "integerDotProduct16BitUnsignedAccelerated" :type "VkBool32")
;;     (integerdotproduct16bitsignedaccelerated :name
;;      "integerDotProduct16BitSignedAccelerated" :type "VkBool32")
;;     (integerdotproduct16bitmixedsignednessaccelerated :name
;;      "integerDotProduct16BitMixedSignednessAccelerated" :type "VkBool32")
;;     (integerdotproduct32bitunsignedaccelerated :name
;;      "integerDotProduct32BitUnsignedAccelerated" :type "VkBool32")
;;     (integerdotproduct32bitsignedaccelerated :name
;;      "integerDotProduct32BitSignedAccelerated" :type "VkBool32")
;;     (integerdotproduct32bitmixedsignednessaccelerated :name
;;      "integerDotProduct32BitMixedSignednessAccelerated" :type "VkBool32")
;;     (integerdotproduct64bitunsignedaccelerated :name
;;      "integerDotProduct64BitUnsignedAccelerated" :type "VkBool32")
;;     (integerdotproduct64bitsignedaccelerated :name
;;      "integerDotProduct64BitSignedAccelerated" :type "VkBool32")
;;     (integerdotproduct64bitmixedsignednessaccelerated :name
;;      "integerDotProduct64BitMixedSignednessAccelerated" :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating8bitunsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating8BitUnsignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating8bitsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating8BitSignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating8bitmixedsignednessaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating4x8bitpackedunsignedaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating4x8bitpackedsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating4x8bitpackedmixedsignednessaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating16bitunsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating16BitUnsignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating16bitsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating16BitSignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating16bitmixedsignednessaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating32bitunsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating32BitUnsignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating32bitsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating32BitSignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating32bitmixedsignednessaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated"
;;      :type "VkBool32")
;;     (integerdotproductaccumulatingsaturating64bitunsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating64BitUnsignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating64bitsignedaccelerated :name
;;      "integerDotProductAccumulatingSaturating64BitSignedAccelerated" :type
;;      "VkBool32")
;;     (integerdotproductaccumulatingsaturating64bitmixedsignednessaccelerated
;;      :name
;;      "integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceTexelBufferAlignmentProperties"
;;       (physical-device-texel-buffer-alignment-properties-ext
;;        physical-device-texel-buffer-alignment-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (storagetexelbufferoffsetalignmentbytes :name
;;      "storageTexelBufferOffsetAlignmentBytes" :type "VkDeviceSize")
;;     (storagetexelbufferoffsetsingletexelalignment :name
;;      "storageTexelBufferOffsetSingleTexelAlignment" :type "VkBool32")
;;     (uniformtexelbufferoffsetalignmentbytes :name
;;      "uniformTexelBufferOffsetAlignmentBytes" :type "VkDeviceSize")
;;     (uniformtexelbufferoffsetsingletexelalignment :name
;;      "uniformTexelBufferOffsetSingleTexelAlignment" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFormatProperties3"
;;       (format-properties-3-khr format-properties-3)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (lineartilingfeatures :name "linearTilingFeatures" :type
;;      "VkFormatFeatureFlags2")
;;     (optimaltilingfeatures :name "optimalTilingFeatures" :type
;;      "VkFormatFeatureFlags2")
;;     (bufferfeatures :name "bufferFeatures" :type "VkFormatFeatureFlags2"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMaintenance4Features"
;;       (physical-device-maintenance-4-features-khr
;;        physical-device-maintenance-4-features)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maintenance4 :name maintenance4 :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMaintenance4Properties"
;;       (physical-device-maintenance-4-properties-khr
;;        physical-device-maintenance-4-properties)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxbuffersize :name "maxBufferSize" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceBufferMemoryRequirements"
;;       (device-buffer-memory-requirements-khr device-buffer-memory-requirements)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pcreateinfo :name "pCreateInfo" :type "VkBufferCreateInfo" :init-form nil
;;      :create ((pcreateinfo-arg) (create-pointer pcreateinfo pcreateinfo-arg))
;;      :get (nil (get-pointer pcreateinfo)) :set
;;      ((pcreateinfo-arg) (set-pointer pcreateinfo pcreateinfo-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceImageMemoryRequirements"
;;       (device-image-memory-requirements-khr device-image-memory-requirements)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pcreateinfo :name "pCreateInfo" :type "VkImageCreateInfo" :init-form nil
;;      :create ((pcreateinfo-arg) (create-pointer pcreateinfo pcreateinfo-arg))
;;      :get (nil (get-pointer pcreateinfo)) :set
;;      ((pcreateinfo-arg) (set-pointer pcreateinfo pcreateinfo-arg)))
;;     (planeaspect :name "planeAspect" :type "VkImageAspectFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSurfaceCapabilitiesKHR"
;;       (surface-capabilities-khr)
;;       (:default-create :default-get :default-set)
;;     (minimagecount :name "minImageCount" :type uint32)
;;     (maximagecount :name "maxImageCount" :type uint32)
;;     (currentextent :pointer t :name "currentExtent" :type "VkExtent2D" :create
;;      ((currentextent-arg)
;;       (copy-object currentextent currentextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((currentextent-arg)
;;       (copy-object currentextent currentextent-arg '(:struct vkextent2d))))
;;     (minimageextent :pointer t :name "minImageExtent" :type "VkExtent2D"
;;      :create
;;      ((minimageextent-arg)
;;       (copy-object minimageextent minimageextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((minimageextent-arg)
;;       (copy-object minimageextent minimageextent-arg '(:struct vkextent2d))))
;;     (maximageextent :pointer t :name "maxImageExtent" :type "VkExtent2D"
;;      :create
;;      ((maximageextent-arg)
;;       (copy-object maximageextent maximageextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((maximageextent-arg)
;;       (copy-object maximageextent maximageextent-arg '(:struct vkextent2d))))
;;     (maximagearraylayers :name "maxImageArrayLayers" :type uint32)
;;     (supportedtransforms :name "supportedTransforms" :type
;;      "VkSurfaceTransformFlagsKHR")
;;     (currenttransform :name "currentTransform" :type
;;      "VkSurfaceTransformFlagBitsKHR")
;;     (supportedcompositealpha :name "supportedCompositeAlpha" :type
;;      "VkCompositeAlphaFlagsKHR")
;;     (supportedusageflags :name "supportedUsageFlags" :type "VkImageUsageFlags"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSurfaceFormatKHR"
;;       (surface-format-khr)
;;       (:default-create :default-get :default-set)
;;     (format :name format :type "VkFormat")
;;     (colorspace :name "colorSpace" :type "VkColorSpaceKHR"))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSwapchainCreateInfoKHR"
;;       (swapchain-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkSwapchainCreateFlagsKHR")
;;     (surface :name surface :type "VkSurfaceKHR" :create
;;      ((surface-arg) (create-pointer surface surface-arg)) :get
;;      (nil (get-pointer surface)) :set
;;      ((surface-arg) (set-pointer surface surface-arg)))
;;     (minimagecount :name "minImageCount" :type uint32)
;;     (imageformat :name "imageFormat" :type "VkFormat")
;;     (imagecolorspace :name "imageColorSpace" :type "VkColorSpaceKHR")
;;     (imageextent :pointer t :name "imageExtent" :type "VkExtent2D" :create
;;      ((imageextent-arg)
;;       (copy-object imageextent imageextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((imageextent-arg)
;;       (copy-object imageextent imageextent-arg '(:struct vkextent2d))))
;;     (imagearraylayers :name "imageArrayLayers" :type uint32)
;;     (imageusage :name "imageUsage" :type "VkImageUsageFlags")
;;     (imagesharingmode :name "imageSharingMode" :type "VkSharingMode")
;;     (queuefamilyindexcount :name "queueFamilyIndexCount" :type uint32)
;;     (pqueuefamilyindices :name "pQueueFamilyIndices" :type (list uint32)
;;      :init-form nil :create
;;      ((pqueuefamilyindices-arg)
;;       (create-array :uint32 pqueuefamilyindices pqueuefamilyindices-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pqueuefamilyindices) :get
;;      ((&optional pqueuefamilyindices-index)
;;       (get-array :uint32 pqueuefamilyindices pqueuefamilyindices-index
;;        queuefamilyindexcount :pointers nil))
;;      :set
;;      ((pqueuefamilyindices-arg &optional pqueuefamilyindices-index)
;;       (set-array :uint32 pqueuefamilyindices pqueuefamilyindices-arg
;;        pqueuefamilyindices-index :dynamic t :pointers nil)))
;;     (pretransform :name "preTransform" :type "VkSurfaceTransformFlagBitsKHR")
;;     (compositealpha :name "compositeAlpha" :type "VkCompositeAlphaFlagBitsKHR")
;;     (presentmode :name "presentMode" :type "VkPresentModeKHR")
;;     (clipped :name clipped :type "VkBool32")
;;     (oldswapchain :name "oldSwapchain" :type "VkSwapchainKHR" :create
;;      ((oldswapchain-arg) (create-pointer oldswapchain oldswapchain-arg)) :get
;;      (nil (get-pointer oldswapchain)) :set
;;      ((oldswapchain-arg) (set-pointer oldswapchain oldswapchain-arg))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPresentInfoKHR"
;;       (present-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (waitsemaphorecount :name "waitSemaphoreCount" :type uint32)
;;     (pwaitsemaphores :name "pWaitSemaphores" :type (list "VkSemaphore")
;;      :init-form nil :create
;;      ((pwaitsemaphores-arg)
;;       (create-array vksemaphore pwaitsemaphores pwaitsemaphores-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pwaitsemaphores) :get
;;      ((&optional pwaitsemaphores-index)
;;       (get-array vksemaphore pwaitsemaphores pwaitsemaphores-index
;;        waitsemaphorecount :pointers nil))
;;      :set
;;      ((pwaitsemaphores-arg &optional pwaitsemaphores-index)
;;       (set-array vksemaphore pwaitsemaphores pwaitsemaphores-arg
;;        pwaitsemaphores-index :dynamic t :pointers nil)))
;;     (swapchaincount :name "swapchainCount" :type uint32)
;;     (pswapchains :name "pSwapchains" :type (list "VkSwapchainKHR") :init-form
;;      nil :create
;;      ((pswapchains-arg)
;;       (create-array vkswapchainkhr pswapchains pswapchains-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pswapchains) :get
;;      ((&optional pswapchains-index)
;;       (get-array vkswapchainkhr pswapchains pswapchains-index swapchaincount
;;        :pointers nil))
;;      :set
;;      ((pswapchains-arg &optional pswapchains-index)
;;       (set-array vkswapchainkhr pswapchains pswapchains-arg pswapchains-index
;;        :dynamic t :pointers nil)))
;;     (pimageindices :name "pImageIndices" :type (list uint32) :init-form nil
;;      :create
;;      ((pimageindices-arg)
;;       (create-array :uint32 pimageindices pimageindices-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pimageindices) :get
;;      ((&optional pimageindices-index)
;;       (get-array :uint32 pimageindices pimageindices-index swapchaincount
;;        :pointers nil))
;;      :set
;;      ((pimageindices-arg &optional pimageindices-index)
;;       (set-array :uint32 pimageindices pimageindices-arg pimageindices-index
;;        :dynamic t :pointers nil)))
;;     (presults :name "pResults" :type "VkResult" :init-form nil :create
;;      ((presults-arg)
;;       (create-array vkresult presults presults-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array presults) :get
;;      ((&optional presults-index)
;;       (get-array vkresult presults presults-index swapchaincount :pointers
;;        nil))
;;      :set
;;      ((presults-arg &optional presults-index)
;;       (set-array vkresult presults presults-arg presults-index :dynamic t
;;        :pointers nil))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageSwapchainCreateInfoKHR"
;;       (image-swapchain-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (swapchain :name swapchain :type "VkSwapchainKHR" :create
;;      ((swapchain-arg) (create-pointer swapchain swapchain-arg)) :get
;;      (nil (get-pointer swapchain)) :set
;;      ((swapchain-arg) (set-pointer swapchain swapchain-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindImageMemorySwapchainInfoKHR"
;;       (bind-image-memory-swapchain-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (swapchain :name swapchain :type "VkSwapchainKHR" :create
;;      ((swapchain-arg) (create-pointer swapchain swapchain-arg)) :get
;;      (nil (get-pointer swapchain)) :set
;;      ((swapchain-arg) (set-pointer swapchain swapchain-arg)))
;;     (imageindex :name "imageIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAcquireNextImageInfoKHR"
;;       (acquire-next-image-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (swapchain :name swapchain :type "VkSwapchainKHR" :create
;;      ((swapchain-arg) (create-pointer swapchain swapchain-arg)) :get
;;      (nil (get-pointer swapchain)) :set
;;      ((swapchain-arg) (set-pointer swapchain swapchain-arg)))
;;     (timeout :name timeout :type uint64)
;;     (semaphore :name semaphore :type "VkSemaphore" :create
;;      ((semaphore-arg) (create-pointer semaphore semaphore-arg)) :get
;;      (nil (get-pointer semaphore)) :set
;;      ((semaphore-arg) (set-pointer semaphore semaphore-arg)))
;;     (fence :name fence :type "VkFence" :create
;;      ((fence-arg) (create-pointer fence fence-arg)) :get
;;      (nil (get-pointer fence)) :set ((fence-arg) (set-pointer fence fence-arg)))
;;     (devicemask :name "deviceMask" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceGroupPresentCapabilitiesKHR"
;;       (device-group-present-capabilities-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (presentmask :name "presentMask" :type uint32 :create
;;      ((presentmask-arg)
;;       (create-array :uint32 presentmask presentmask-arg :dynamic nil :pointers
;;        nil))
;;      :get
;;      ((&optional presentmask-index)
;;       (get-array :uint32 presentmask presentmask-index 32 :pointers nil))
;;      :set
;;      ((presentmask-arg &optional presentmask-index)
;;       (set-array :uint32 presentmask presentmask-arg presentmask-index :dynamic
;;        nil :pointers nil)))
;;     (modes :name modes :type "VkDeviceGroupPresentModeFlagsKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceGroupPresentInfoKHR"
;;       (device-group-present-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (swapchaincount :name "swapchainCount" :type uint32)
;;     (pdevicemasks :name "pDeviceMasks" :type uint32 :init-form nil :create
;;      ((pdevicemasks-arg)
;;       (create-array :uint32 pdevicemasks pdevicemasks-arg :dynamic t :pointers
;;        nil))
;;      :destroy (destroy-array pdevicemasks) :get
;;      ((&optional pdevicemasks-index)
;;       (get-array :uint32 pdevicemasks pdevicemasks-index swapchaincount
;;        :pointers nil))
;;      :set
;;      ((pdevicemasks-arg &optional pdevicemasks-index)
;;       (set-array :uint32 pdevicemasks pdevicemasks-arg pdevicemasks-index
;;        :dynamic t :pointers nil)))
;;     (mode :name mode :type "VkDeviceGroupPresentModeFlagBitsKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceGroupSwapchainCreateInfoKHR"
;;       (device-group-swapchain-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (modes :name modes :type "VkDeviceGroupPresentModeFlagsKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayModeParametersKHR"
;;       (display-mode-parameters-khr)
;;       (:default-create :default-get :default-set)
;;     (visibleregion :pointer t :name "visibleRegion" :type "VkExtent2D" :create
;;      ((visibleregion-arg)
;;       (copy-object visibleregion visibleregion-arg '(:struct vkextent2d)))
;;      :set
;;      ((visibleregion-arg)
;;       (copy-object visibleregion visibleregion-arg '(:struct vkextent2d))))
;;     (refreshrate :name "refreshRate" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayModeCreateInfoKHR"
;;       (display-mode-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDisplayModeCreateFlagsKHR")
;;     (parameters :pointer t :name parameters :type "VkDisplayModeParametersKHR"
;;      :create
;;      ((parameters-arg)
;;       (copy-object parameters parameters-arg
;;        '(:struct vkdisplaymodeparameterskhr)))
;;      :set
;;      ((parameters-arg)
;;       (copy-object parameters parameters-arg
;;        '(:struct vkdisplaymodeparameterskhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayModePropertiesKHR"
;;       (display-mode-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (displaymode :name "displayMode" :type "VkDisplayModeKHR" :create
;;      ((displaymode-arg) (create-pointer displaymode displaymode-arg)) :get
;;      (nil (get-pointer displaymode)) :set
;;      ((displaymode-arg) (set-pointer displaymode displaymode-arg)))
;;     (parameters :pointer t :name parameters :type "VkDisplayModeParametersKHR"
;;      :create
;;      ((parameters-arg)
;;       (copy-object parameters parameters-arg
;;        '(:struct vkdisplaymodeparameterskhr)))
;;      :set
;;      ((parameters-arg)
;;       (copy-object parameters parameters-arg
;;        '(:struct vkdisplaymodeparameterskhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayPlaneCapabilitiesKHR"
;;       (display-plane-capabilities-khr)
;;       (:default-create :default-get :default-set)
;;     (supportedalpha :name "supportedAlpha" :type "VkDisplayPlaneAlphaFlagsKHR")
;;     (minsrcposition :pointer t :name "minSrcPosition" :type "VkOffset2D"
;;      :create
;;      ((minsrcposition-arg)
;;       (copy-object minsrcposition minsrcposition-arg '(:struct vkoffset2d)))
;;      :set
;;      ((minsrcposition-arg)
;;       (copy-object minsrcposition minsrcposition-arg '(:struct vkoffset2d))))
;;     (maxsrcposition :pointer t :name "maxSrcPosition" :type "VkOffset2D"
;;      :create
;;      ((maxsrcposition-arg)
;;       (copy-object maxsrcposition maxsrcposition-arg '(:struct vkoffset2d)))
;;      :set
;;      ((maxsrcposition-arg)
;;       (copy-object maxsrcposition maxsrcposition-arg '(:struct vkoffset2d))))
;;     (minsrcextent :pointer t :name "minSrcExtent" :type "VkExtent2D" :create
;;      ((minsrcextent-arg)
;;       (copy-object minsrcextent minsrcextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((minsrcextent-arg)
;;       (copy-object minsrcextent minsrcextent-arg '(:struct vkextent2d))))
;;     (maxsrcextent :pointer t :name "maxSrcExtent" :type "VkExtent2D" :create
;;      ((maxsrcextent-arg)
;;       (copy-object maxsrcextent maxsrcextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((maxsrcextent-arg)
;;       (copy-object maxsrcextent maxsrcextent-arg '(:struct vkextent2d))))
;;     (mindstposition :pointer t :name "minDstPosition" :type "VkOffset2D"
;;      :create
;;      ((mindstposition-arg)
;;       (copy-object mindstposition mindstposition-arg '(:struct vkoffset2d)))
;;      :set
;;      ((mindstposition-arg)
;;       (copy-object mindstposition mindstposition-arg '(:struct vkoffset2d))))
;;     (maxdstposition :pointer t :name "maxDstPosition" :type "VkOffset2D"
;;      :create
;;      ((maxdstposition-arg)
;;       (copy-object maxdstposition maxdstposition-arg '(:struct vkoffset2d)))
;;      :set
;;      ((maxdstposition-arg)
;;       (copy-object maxdstposition maxdstposition-arg '(:struct vkoffset2d))))
;;     (mindstextent :pointer t :name "minDstExtent" :type "VkExtent2D" :create
;;      ((mindstextent-arg)
;;       (copy-object mindstextent mindstextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((mindstextent-arg)
;;       (copy-object mindstextent mindstextent-arg '(:struct vkextent2d))))
;;     (maxdstextent :pointer t :name "maxDstExtent" :type "VkExtent2D" :create
;;      ((maxdstextent-arg)
;;       (copy-object maxdstextent maxdstextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((maxdstextent-arg)
;;       (copy-object maxdstextent maxdstextent-arg '(:struct vkextent2d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayPlanePropertiesKHR"
;;       (display-plane-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (currentdisplay :name "currentDisplay" :type "VkDisplayKHR" :create
;;      ((currentdisplay-arg) (create-pointer currentdisplay currentdisplay-arg))
;;      :get (nil (get-pointer currentdisplay)) :set
;;      ((currentdisplay-arg) (set-pointer currentdisplay currentdisplay-arg)))
;;     (currentstackindex :name "currentStackIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayPropertiesKHR"
;;       (display-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (display :name display :type "VkDisplayKHR" :create
;;      ((display-arg) (create-pointer display display-arg)) :get
;;      (nil (get-pointer display)) :set
;;      ((display-arg) (set-pointer display display-arg)))
;;     (displayname :name "displayName" :type char :init-form nil :create
;;      ((displayname-arg) (create-string displayname displayname-arg :dynamic t))
;;      :destroy (destroy-string displayname) :get (nil (get-string displayname))
;;      :set
;;      ((displayname-arg) (set-string displayname displayname-arg :dynamic t)))
;;     (physicaldimensions :pointer t :name "physicalDimensions" :type
;;      "VkExtent2D" :create
;;      ((physicaldimensions-arg)
;;       (copy-object physicaldimensions physicaldimensions-arg
;;        '(:struct vkextent2d)))
;;      :set
;;      ((physicaldimensions-arg)
;;       (copy-object physicaldimensions physicaldimensions-arg
;;        '(:struct vkextent2d))))
;;     (physicalresolution :pointer t :name "physicalResolution" :type
;;      "VkExtent2D" :create
;;      ((physicalresolution-arg)
;;       (copy-object physicalresolution physicalresolution-arg
;;        '(:struct vkextent2d)))
;;      :set
;;      ((physicalresolution-arg)
;;       (copy-object physicalresolution physicalresolution-arg
;;        '(:struct vkextent2d))))
;;     (supportedtransforms :name "supportedTransforms" :type
;;      "VkSurfaceTransformFlagsKHR")
;;     (planereorderpossible :name "planeReorderPossible" :type "VkBool32")
;;     (persistentcontent :name "persistentContent" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplaySurfaceCreateInfoKHR"
;;       (display-surface-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDisplaySurfaceCreateFlagsKHR")
;;     (displaymode :name "displayMode" :type "VkDisplayModeKHR" :create
;;      ((displaymode-arg) (create-pointer displaymode displaymode-arg)) :get
;;      (nil (get-pointer displaymode)) :set
;;      ((displaymode-arg) (set-pointer displaymode displaymode-arg)))
;;     (planeindex :name "planeIndex" :type uint32)
;;     (planestackindex :name "planeStackIndex" :type uint32)
;;     (transform :name transform :type "VkSurfaceTransformFlagBitsKHR")
;;     (globalalpha :name "globalAlpha" :type float)
;;     (alphamode :name "alphaMode" :type "VkDisplayPlaneAlphaFlagBitsKHR")
;;     (imageextent :pointer t :name "imageExtent" :type "VkExtent2D" :create
;;      ((imageextent-arg)
;;       (copy-object imageextent imageextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((imageextent-arg)
;;       (copy-object imageextent imageextent-arg '(:struct vkextent2d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayPresentInfoKHR"
;;       (display-present-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcrect :pointer t :name "srcRect" :type "VkRect2D" :create
;;      ((srcrect-arg) (copy-object srcrect srcrect-arg '(:struct vkrect2d))) :set
;;      ((srcrect-arg) (copy-object srcrect srcrect-arg '(:struct vkrect2d))))
;;     (dstrect :pointer t :name "dstRect" :type "VkRect2D" :create
;;      ((dstrect-arg) (copy-object dstrect dstrect-arg '(:struct vkrect2d))) :set
;;      ((dstrect-arg) (copy-object dstrect dstrect-arg '(:struct vkrect2d))))
;;     (persistent :name persistent :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderingFragmentShadingRateAttachmentInfoKHR"
;;       (rendering-fragment-shading-rate-attachment-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imageview :name "imageView" :type "VkImageView" :create
;;      ((imageview-arg) (create-pointer imageview imageview-arg)) :get
;;      (nil (get-pointer imageview)) :set
;;      ((imageview-arg) (set-pointer imageview imageview-arg)))
;;     (imagelayout :name "imageLayout" :type "VkImageLayout")
;;     (shadingrateattachmenttexelsize :pointer t :name
;;      "shadingRateAttachmentTexelSize" :type "VkExtent2D" :create
;;      ((shadingrateattachmenttexelsize-arg)
;;       (copy-object shadingrateattachmenttexelsize
;;        shadingrateattachmenttexelsize-arg '(:struct vkextent2d)))
;;      :set
;;      ((shadingrateattachmenttexelsize-arg)
;;       (copy-object shadingrateattachmenttexelsize
;;        shadingrateattachmenttexelsize-arg '(:struct vkextent2d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderingFragmentDensityMapAttachmentInfoEXT"
;;       (rendering-fragment-density-map-attachment-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imageview :name "imageView" :type "VkImageView" :create
;;      ((imageview-arg) (create-pointer imageview imageview-arg)) :get
;;      (nil (get-pointer imageview)) :set
;;      ((imageview-arg) (set-pointer imageview imageview-arg)))
;;     (imagelayout :name "imageLayout" :type "VkImageLayout"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAttachmentSampleCountInfoAMD"
;;       (attachment-sample-count-info-nv attachment-sample-count-info-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (colorattachmentcount :name "colorAttachmentCount" :type uint32)
;;     (pcolorattachmentsamples :name "pColorAttachmentSamples" :type
;;      "VkSampleCountFlagBits" :init-form nil :create
;;      ((pcolorattachmentsamples-arg)
;;       (create-array vksamplecountflagbits pcolorattachmentsamples
;;        pcolorattachmentsamples-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pcolorattachmentsamples) :get
;;      ((&optional pcolorattachmentsamples-index)
;;       (get-array vksamplecountflagbits pcolorattachmentsamples
;;        pcolorattachmentsamples-index colorattachmentcount :pointers nil))
;;      :set
;;      ((pcolorattachmentsamples-arg &optional pcolorattachmentsamples-index)
;;       (set-array vksamplecountflagbits pcolorattachmentsamples
;;        pcolorattachmentsamples-arg pcolorattachmentsamples-index :dynamic t
;;        :pointers nil)))
;;     (depthstencilattachmentsamples :name "depthStencilAttachmentSamples" :type
;;      "VkSampleCountFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMultiviewPerViewAttributesInfoNVX"
;;       (multiview-per-view-attributes-info-nvx)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (perviewattributes :name "perViewAttributes" :type "VkBool32")
;;     (perviewattributespositionxonly :name "perViewAttributesPositionXOnly"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImportMemoryFdInfoKHR"
;;       (import-memory-fd-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletype :name "handleType" :type "VkExternalMemoryHandleTypeFlagBits")
;;     (fd :name fd :type int))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryFdPropertiesKHR"
;;       (memory-fd-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (memorytypebits :name "memoryTypeBits" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryGetFdInfoKHR"
;;       (memory-get-fd-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (memory :name memory :type "VkDeviceMemory" :create
;;      ((memory-arg) (create-pointer memory memory-arg)) :get
;;      (nil (get-pointer memory)) :set
;;      ((memory-arg) (set-pointer memory memory-arg)))
;;     (handletype :name "handleType" :type "VkExternalMemoryHandleTypeFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImportSemaphoreFdInfoKHR"
;;       (import-semaphore-fd-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (semaphore :name semaphore :type "VkSemaphore" :create
;;      ((semaphore-arg) (create-pointer semaphore semaphore-arg)) :get
;;      (nil (get-pointer semaphore)) :set
;;      ((semaphore-arg) (set-pointer semaphore semaphore-arg)))
;;     (flags :name flags :type "VkSemaphoreImportFlags")
;;     (handletype :name "handleType" :type
;;      "VkExternalSemaphoreHandleTypeFlagBits")
;;     (fd :name fd :type int))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSemaphoreGetFdInfoKHR"
;;       (semaphore-get-fd-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (semaphore :name semaphore :type "VkSemaphore" :create
;;      ((semaphore-arg) (create-pointer semaphore semaphore-arg)) :get
;;      (nil (get-pointer semaphore)) :set
;;      ((semaphore-arg) (set-pointer semaphore semaphore-arg)))
;;     (handletype :name "handleType" :type
;;      "VkExternalSemaphoreHandleTypeFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePushDescriptorPropertiesKHR"
;;       (physical-device-push-descriptor-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxpushdescriptors :name "maxPushDescriptors" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRectLayerKHR"
;;       (rect-layer-khr)
;;       (:default-create :default-get :default-set)
;;     (offset :pointer t :name offset :type "VkOffset2D" :create
;;      ((offset-arg) (copy-object offset offset-arg '(:struct vkoffset2d))) :set
;;      ((offset-arg) (copy-object offset offset-arg '(:struct vkoffset2d))))
;;     (extent :pointer t :name extent :type "VkExtent2D" :create
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent2d))) :set
;;      ((extent-arg) (copy-object extent extent-arg '(:struct vkextent2d))))
;;     (layer :name layer :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPresentRegionKHR"
;;       (present-region-khr)
;;       (:default-create :default-get :default-set)
;;     (rectanglecount :name "rectangleCount" :type uint32)
;;     (prectangles :name "pRectangles" :type "VkRectLayerKHR" :init-form nil
;;      :create
;;      ((prectangles-arg)
;;       (create-array (:struct vkrectlayerkhr) prectangles prectangles-arg
;;        :dynamic t :pointers ("VkRectLayerKHR")))
;;      :destroy (destroy-array prectangles) :get
;;      ((&optional prectangles-index)
;;       (get-array (:struct vkrectlayerkhr) prectangles prectangles-index
;;        rectanglecount :pointers ("VkRectLayerKHR")))
;;      :set
;;      ((prectangles-arg &optional prectangles-index)
;;       (set-array (:struct vkrectlayerkhr) prectangles prectangles-arg
;;        prectangles-index :dynamic t :pointers ("VkRectLayerKHR")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPresentRegionsKHR"
;;       (present-regions-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (swapchaincount :name "swapchainCount" :type uint32)
;;     (pregions :name "pRegions" :type "VkPresentRegionKHR" :init-form nil
;;      :create
;;      ((pregions-arg)
;;       (create-array (:struct vkpresentregionkhr) pregions pregions-arg :dynamic
;;        t :pointers ("VkPresentRegionKHR")))
;;      :destroy (destroy-array pregions) :get
;;      ((&optional pregions-index)
;;       (get-array (:struct vkpresentregionkhr) pregions pregions-index
;;        swapchaincount :pointers ("VkPresentRegionKHR")))
;;      :set
;;      ((pregions-arg &optional pregions-index)
;;       (set-array (:struct vkpresentregionkhr) pregions pregions-arg
;;        pregions-index :dynamic t :pointers ("VkPresentRegionKHR")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSharedPresentSurfaceCapabilitiesKHR"
;;       (shared-present-surface-capabilities-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (sharedpresentsupportedusageflags :name "sharedPresentSupportedUsageFlags"
;;      :type "VkImageUsageFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImportFenceFdInfoKHR"
;;       (import-fence-fd-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fence :name fence :type "VkFence" :create
;;      ((fence-arg) (create-pointer fence fence-arg)) :get
;;      (nil (get-pointer fence)) :set ((fence-arg) (set-pointer fence fence-arg)))
;;     (flags :name flags :type "VkFenceImportFlags")
;;     (handletype :name "handleType" :type "VkExternalFenceHandleTypeFlagBits")
;;     (fd :name fd :type int))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFenceGetFdInfoKHR"
;;       (fence-get-fd-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fence :name fence :type "VkFence" :create
;;      ((fence-arg) (create-pointer fence fence-arg)) :get
;;      (nil (get-pointer fence)) :set ((fence-arg) (set-pointer fence fence-arg)))
;;     (handletype :name "handleType" :type "VkExternalFenceHandleTypeFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePerformanceQueryFeaturesKHR"
;;       (physical-device-performance-query-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (performancecounterquerypools :name "performanceCounterQueryPools" :type
;;      "VkBool32")
;;     (performancecountermultiplequerypools :name
;;      "performanceCounterMultipleQueryPools" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePerformanceQueryPropertiesKHR"
;;       (physical-device-performance-query-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (allowcommandbufferquerycopies :name "allowCommandBufferQueryCopies" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPerformanceCounterKHR"
;;       (performance-counter-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (unit :name unit :type "VkPerformanceCounterUnitKHR")
;;     (scope :name scope :type "VkPerformanceCounterScopeKHR")
;;     (storage :name storage :type "VkPerformanceCounterStorageKHR")
;;     (uuid :name uuid :type uint8 :create
;;      ((uuid-arg)
;;       (create-array :uint8 uuid uuid-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional uuid-index)
;;       (get-array :uint8 uuid uuid-index 16 :pointers nil))
;;      :set
;;      ((uuid-arg &optional uuid-index)
;;       (set-array :uint8 uuid uuid-arg uuid-index :dynamic nil :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPerformanceCounterDescriptionKHR"
;;       (performance-counter-description-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPerformanceCounterDescriptionFlagsKHR")
;;     (name :name name :type char :create
;;      ((name-arg) (create-string name name-arg :dynamic nil)) :get
;;      (nil (get-string name)) :set
;;      ((name-arg) (set-string name name-arg :dynamic nil)))
;;     (category :name category :type char :create
;;      ((category-arg) (create-string category category-arg :dynamic nil)) :get
;;      (nil (get-string category)) :set
;;      ((category-arg) (set-string category category-arg :dynamic nil)))
;;     (description :name description :type char :create
;;      ((description-arg)
;;       (create-string description description-arg :dynamic nil))
;;      :get (nil (get-string description)) :set
;;      ((description-arg) (set-string description description-arg :dynamic nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkQueryPoolPerformanceCreateInfoKHR"
;;       (query-pool-performance-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (queuefamilyindex :name "queueFamilyIndex" :type uint32)
;;     (counterindexcount :name "counterIndexCount" :type uint32)
;;     (pcounterindices :name "pCounterIndices" :type uint32 :init-form nil
;;      :create
;;      ((pcounterindices-arg)
;;       (create-array :uint32 pcounterindices pcounterindices-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pcounterindices) :get
;;      ((&optional pcounterindices-index)
;;       (get-array :uint32 pcounterindices pcounterindices-index
;;        counterindexcount :pointers nil))
;;      :set
;;      ((pcounterindices-arg &optional pcounterindices-index)
;;       (set-array :uint32 pcounterindices pcounterindices-arg
;;        pcounterindices-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-union doc-file
;;       "VkPerformanceCounterResultKHR"
;;       (performance-counter-result-khr)
;;       (:default-create :default-get :default-set)
;;     (int32 :name int32 :type int32)
;;     (int64 :name int64 :type int64)
;;     (uint32 :name uint32 :type uint32)
;;     (uint64 :name uint64 :type uint64)
;;     (float32 :name float32 :type float)
;;     (float64 :name float64 :type double))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAcquireProfilingLockInfoKHR"
;;       (acquire-profiling-lock-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkAcquireProfilingLockFlagsKHR")
;;     (timeout :name timeout :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPerformanceQuerySubmitInfoKHR"
;;       (performance-query-submit-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (counterpassindex :name "counterPassIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSurfaceInfo2KHR"
;;       (physical-device-surface-info-2-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (surface :name surface :type "VkSurfaceKHR" :create
;;      ((surface-arg) (create-pointer surface surface-arg)) :get
;;      (nil (get-pointer surface)) :set
;;      ((surface-arg) (set-pointer surface surface-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSurfaceCapabilities2KHR"
;;       (surface-capabilities-2-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (surfacecapabilities :pointer t :name "surfaceCapabilities" :type
;;      "VkSurfaceCapabilitiesKHR" :create
;;      ((surfacecapabilities-arg)
;;       (copy-object surfacecapabilities surfacecapabilities-arg
;;        '(:struct vksurfacecapabilitieskhr)))
;;      :set
;;      ((surfacecapabilities-arg)
;;       (copy-object surfacecapabilities surfacecapabilities-arg
;;        '(:struct vksurfacecapabilitieskhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSurfaceFormat2KHR"
;;       (surface-format-2-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (surfaceformat :pointer t :name "surfaceFormat" :type "VkSurfaceFormatKHR"
;;      :create
;;      ((surfaceformat-arg)
;;       (copy-object surfaceformat surfaceformat-arg
;;        '(:struct vksurfaceformatkhr)))
;;      :set
;;      ((surfaceformat-arg)
;;       (copy-object surfaceformat surfaceformat-arg
;;        '(:struct vksurfaceformatkhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayProperties2KHR"
;;       (display-properties-2-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (displayproperties :pointer t :name "displayProperties" :type
;;      "VkDisplayPropertiesKHR" :create
;;      ((displayproperties-arg)
;;       (copy-object displayproperties displayproperties-arg
;;        '(:struct vkdisplaypropertieskhr)))
;;      :set
;;      ((displayproperties-arg)
;;       (copy-object displayproperties displayproperties-arg
;;        '(:struct vkdisplaypropertieskhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayPlaneProperties2KHR"
;;       (display-plane-properties-2-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (displayplaneproperties :pointer t :name "displayPlaneProperties" :type
;;      "VkDisplayPlanePropertiesKHR" :create
;;      ((displayplaneproperties-arg)
;;       (copy-object displayplaneproperties displayplaneproperties-arg
;;        '(:struct vkdisplayplanepropertieskhr)))
;;      :set
;;      ((displayplaneproperties-arg)
;;       (copy-object displayplaneproperties displayplaneproperties-arg
;;        '(:struct vkdisplayplanepropertieskhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayModeProperties2KHR"
;;       (display-mode-properties-2-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (displaymodeproperties :pointer t :name "displayModeProperties" :type
;;      "VkDisplayModePropertiesKHR" :create
;;      ((displaymodeproperties-arg)
;;       (copy-object displaymodeproperties displaymodeproperties-arg
;;        '(:struct vkdisplaymodepropertieskhr)))
;;      :set
;;      ((displaymodeproperties-arg)
;;       (copy-object displaymodeproperties displaymodeproperties-arg
;;        '(:struct vkdisplaymodepropertieskhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayPlaneInfo2KHR"
;;       (display-plane-info-2-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (mode :name mode :type "VkDisplayModeKHR" :create
;;      ((mode-arg) (create-pointer mode mode-arg)) :get (nil (get-pointer mode))
;;      :set ((mode-arg) (set-pointer mode mode-arg)))
;;     (planeindex :name "planeIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayPlaneCapabilities2KHR"
;;       (display-plane-capabilities-2-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (capabilities :pointer t :name capabilities :type
;;      "VkDisplayPlaneCapabilitiesKHR" :create
;;      ((capabilities-arg)
;;       (copy-object capabilities capabilities-arg
;;        '(:struct vkdisplayplanecapabilitieskhr)))
;;      :set
;;      ((capabilities-arg)
;;       (copy-object capabilities capabilities-arg
;;        '(:struct vkdisplayplanecapabilitieskhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderClockFeaturesKHR"
;;       (physical-device-shader-clock-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadersubgroupclock :name "shaderSubgroupClock" :type "VkBool32")
;;     (shaderdeviceclock :name "shaderDeviceClock" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceQueueGlobalPriorityCreateInfoKHR"
;;       (device-queue-global-priority-create-info-ext
;;        device-queue-global-priority-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (globalpriority :name "globalPriority" :type "VkQueueGlobalPriorityKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR"
;;       (physical-device-global-priority-query-features-ext
;;        physical-device-global-priority-query-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (globalpriorityquery :name "globalPriorityQuery" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkQueueFamilyGlobalPriorityPropertiesKHR"
;;       (queue-family-global-priority-properties-ext
;;        queue-family-global-priority-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (prioritycount :name "priorityCount" :type uint32)
;;     (priorities :name priorities :type "VkQueueGlobalPriorityKHR" :create
;;      ((priorities-arg)
;;       (create-array vkqueueglobalprioritykhr priorities priorities-arg :dynamic
;;        nil :pointers nil))
;;      :get
;;      ((&optional priorities-index)
;;       (get-array vkqueueglobalprioritykhr priorities priorities-index 16
;;        :pointers nil))
;;      :set
;;      ((priorities-arg &optional priorities-index)
;;       (set-array vkqueueglobalprioritykhr priorities priorities-arg
;;        priorities-index :dynamic nil :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFragmentShadingRateAttachmentInfoKHR"
;;       (fragment-shading-rate-attachment-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pfragmentshadingrateattachment :name "pFragmentShadingRateAttachment"
;;      :type "VkAttachmentReference2" :init-form nil :create
;;      ((pfragmentshadingrateattachment-arg)
;;       (create-pointer pfragmentshadingrateattachment
;;        pfragmentshadingrateattachment-arg))
;;      :get (nil (get-pointer pfragmentshadingrateattachment)) :set
;;      ((pfragmentshadingrateattachment-arg)
;;       (set-pointer pfragmentshadingrateattachment
;;        pfragmentshadingrateattachment-arg)))
;;     (shadingrateattachmenttexelsize :pointer t :name
;;      "shadingRateAttachmentTexelSize" :type "VkExtent2D" :create
;;      ((shadingrateattachmenttexelsize-arg)
;;       (copy-object shadingrateattachmenttexelsize
;;        shadingrateattachmenttexelsize-arg '(:struct vkextent2d)))
;;      :set
;;      ((shadingrateattachmenttexelsize-arg)
;;       (copy-object shadingrateattachmenttexelsize
;;        shadingrateattachmenttexelsize-arg '(:struct vkextent2d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineFragmentShadingRateStateCreateInfoKHR"
;;       (pipeline-fragment-shading-rate-state-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fragmentsize :pointer t :name "fragmentSize" :type "VkExtent2D" :create
;;      ((fragmentsize-arg)
;;       (copy-object fragmentsize fragmentsize-arg '(:struct vkextent2d)))
;;      :set
;;      ((fragmentsize-arg)
;;       (copy-object fragmentsize fragmentsize-arg '(:struct vkextent2d))))
;;     (combinerops :name "combinerOps" :type "VkFragmentShadingRateCombinerOpKHR"
;;      :create
;;      ((combinerops-arg)
;;       (create-array vkfragmentshadingratecombineropkhr combinerops
;;        combinerops-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional combinerops-index)
;;       (get-array vkfragmentshadingratecombineropkhr combinerops
;;        combinerops-index 2 :pointers nil))
;;      :set
;;      ((combinerops-arg &optional combinerops-index)
;;       (set-array vkfragmentshadingratecombineropkhr combinerops combinerops-arg
;;        combinerops-index :dynamic nil :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentShadingRateFeaturesKHR"
;;       (physical-device-fragment-shading-rate-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pipelinefragmentshadingrate :name "pipelineFragmentShadingRate" :type
;;      "VkBool32")
;;     (primitivefragmentshadingrate :name "primitiveFragmentShadingRate" :type
;;      "VkBool32")
;;     (attachmentfragmentshadingrate :name "attachmentFragmentShadingRate" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentShadingRatePropertiesKHR"
;;       (physical-device-fragment-shading-rate-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (minfragmentshadingrateattachmenttexelsize :pointer t :name
;;      "minFragmentShadingRateAttachmentTexelSize" :type "VkExtent2D" :create
;;      ((minfragmentshadingrateattachmenttexelsize-arg)
;;       (copy-object minfragmentshadingrateattachmenttexelsize
;;        minfragmentshadingrateattachmenttexelsize-arg '(:struct vkextent2d)))
;;      :set
;;      ((minfragmentshadingrateattachmenttexelsize-arg)
;;       (copy-object minfragmentshadingrateattachmenttexelsize
;;        minfragmentshadingrateattachmenttexelsize-arg '(:struct vkextent2d))))
;;     (maxfragmentshadingrateattachmenttexelsize :pointer t :name
;;      "maxFragmentShadingRateAttachmentTexelSize" :type "VkExtent2D" :create
;;      ((maxfragmentshadingrateattachmenttexelsize-arg)
;;       (copy-object maxfragmentshadingrateattachmenttexelsize
;;        maxfragmentshadingrateattachmenttexelsize-arg '(:struct vkextent2d)))
;;      :set
;;      ((maxfragmentshadingrateattachmenttexelsize-arg)
;;       (copy-object maxfragmentshadingrateattachmenttexelsize
;;        maxfragmentshadingrateattachmenttexelsize-arg '(:struct vkextent2d))))
;;     (maxfragmentshadingrateattachmenttexelsizeaspectratio :name
;;      "maxFragmentShadingRateAttachmentTexelSizeAspectRatio" :type uint32)
;;     (primitivefragmentshadingratewithmultipleviewports :name
;;      "primitiveFragmentShadingRateWithMultipleViewports" :type "VkBool32")
;;     (layeredshadingrateattachments :name "layeredShadingRateAttachments" :type
;;      "VkBool32")
;;     (fragmentshadingratenontrivialcombinerops :name
;;      "fragmentShadingRateNonTrivialCombinerOps" :type "VkBool32")
;;     (maxfragmentsize :pointer t :name "maxFragmentSize" :type "VkExtent2D"
;;      :create
;;      ((maxfragmentsize-arg)
;;       (copy-object maxfragmentsize maxfragmentsize-arg '(:struct vkextent2d)))
;;      :set
;;      ((maxfragmentsize-arg)
;;       (copy-object maxfragmentsize maxfragmentsize-arg '(:struct vkextent2d))))
;;     (maxfragmentsizeaspectratio :name "maxFragmentSizeAspectRatio" :type uint32)
;;     (maxfragmentshadingratecoveragesamples :name
;;      "maxFragmentShadingRateCoverageSamples" :type uint32)
;;     (maxfragmentshadingraterasterizationsamples :name
;;      "maxFragmentShadingRateRasterizationSamples" :type "VkSampleCountFlagBits")
;;     (fragmentshadingratewithshaderdepthstencilwrites :name
;;      "fragmentShadingRateWithShaderDepthStencilWrites" :type "VkBool32")
;;     (fragmentshadingratewithsamplemask :name
;;      "fragmentShadingRateWithSampleMask" :type "VkBool32")
;;     (fragmentshadingratewithshadersamplemask :name
;;      "fragmentShadingRateWithShaderSampleMask" :type "VkBool32")
;;     (fragmentshadingratewithconservativerasterization :name
;;      "fragmentShadingRateWithConservativeRasterization" :type "VkBool32")
;;     (fragmentshadingratewithfragmentshaderinterlock :name
;;      "fragmentShadingRateWithFragmentShaderInterlock" :type "VkBool32")
;;     (fragmentshadingratewithcustomsamplelocations :name
;;      "fragmentShadingRateWithCustomSampleLocations" :type "VkBool32")
;;     (fragmentshadingratestrictmultiplycombiner :name
;;      "fragmentShadingRateStrictMultiplyCombiner" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentShadingRateKHR"
;;       (physical-device-fragment-shading-rate-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (samplecounts :name "sampleCounts" :type "VkSampleCountFlags")
;;     (fragmentsize :pointer t :name "fragmentSize" :type "VkExtent2D" :create
;;      ((fragmentsize-arg)
;;       (copy-object fragmentsize fragmentsize-arg '(:struct vkextent2d)))
;;      :set
;;      ((fragmentsize-arg)
;;       (copy-object fragmentsize fragmentsize-arg '(:struct vkextent2d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSurfaceProtectedCapabilitiesKHR"
;;       (surface-protected-capabilities-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (supportsprotected :name "supportsProtected" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePresentWaitFeaturesKHR"
;;       (physical-device-present-wait-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (presentwait :name "presentWait" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR"
;;       (physical-device-pipeline-executable-properties-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pipelineexecutableinfo :name "pipelineExecutableInfo" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineInfoKHR"
;;       (pipeline-info-ext pipeline-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pipeline :name pipeline :type "VkPipeline" :create
;;      ((pipeline-arg) (create-pointer pipeline pipeline-arg)) :get
;;      (nil (get-pointer pipeline)) :set
;;      ((pipeline-arg) (set-pointer pipeline pipeline-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineExecutablePropertiesKHR"
;;       (pipeline-executable-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (stages :name stages :type "VkShaderStageFlags")
;;     (name :name name :type char :create
;;      ((name-arg) (create-string name name-arg :dynamic nil)) :get
;;      (nil (get-string name)) :set
;;      ((name-arg) (set-string name name-arg :dynamic nil)))
;;     (description :name description :type char :create
;;      ((description-arg)
;;       (create-string description description-arg :dynamic nil))
;;      :get (nil (get-string description)) :set
;;      ((description-arg) (set-string description description-arg :dynamic nil)))
;;     (subgroupsize :name "subgroupSize" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineExecutableInfoKHR"
;;       (pipeline-executable-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pipeline :name pipeline :type "VkPipeline" :create
;;      ((pipeline-arg) (create-pointer pipeline pipeline-arg)) :get
;;      (nil (get-pointer pipeline)) :set
;;      ((pipeline-arg) (set-pointer pipeline pipeline-arg)))
;;     (executableindex :name "executableIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-union doc-file
;;       "VkPipelineExecutableStatisticValueKHR"
;;       (pipeline-executable-statistic-value-khr)
;;       (:default-create :default-get :default-set)
;;     (b32 :name b32 :type "VkBool32")
;;     (i64 :name i64 :type int64)
;;     (u64 :name u64 :type uint64)
;;     (f64 :name f64 :type double))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineExecutableStatisticKHR"
;;       (pipeline-executable-statistic-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (name :name name :type char :create
;;      ((name-arg) (create-string name name-arg :dynamic nil)) :get
;;      (nil (get-string name)) :set
;;      ((name-arg) (set-string name name-arg :dynamic nil)))
;;     (description :name description :type char :create
;;      ((description-arg)
;;       (create-string description description-arg :dynamic nil))
;;      :get (nil (get-string description)) :set
;;      ((description-arg) (set-string description description-arg :dynamic nil)))
;;     (format :name format :type "VkPipelineExecutableStatisticFormatKHR")
;;     (value :pointer t :name value :type "VkPipelineExecutableStatisticValueKHR"
;;      :create
;;      ((value-arg)
;;       (copy-object value value-arg
;;        '(:union vkpipelineexecutablestatisticvaluekhr)))
;;      :set
;;      ((value-arg)
;;       (copy-object value value-arg
;;        '(:union vkpipelineexecutablestatisticvaluekhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineExecutableInternalRepresentationKHR"
;;       (pipeline-executable-internal-representation-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (name :name name :type char :create
;;      ((name-arg) (create-string name name-arg :dynamic nil)) :get
;;      (nil (get-string name)) :set
;;      ((name-arg) (set-string name name-arg :dynamic nil)))
;;     (description :name description :type char :create
;;      ((description-arg)
;;       (create-string description description-arg :dynamic nil))
;;      :get (nil (get-string description)) :set
;;      ((description-arg) (set-string description description-arg :dynamic nil)))
;;     (istext :name "isText" :type "VkBool32")
;;     (datasize :name "dataSize" :type size)
;;     (pdata :name "pData" :type void :init-form nil :create
;;      ((pdata-arg) (create-pointer pdata pdata-arg)) :get
;;      (nil (get-pointer pdata)) :set
;;      ((pdata-arg) (set-pointer pdata pdata-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineLibraryCreateInfoKHR"
;;       (pipeline-library-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (librarycount :name "libraryCount" :type uint32)
;;     (plibraries :name "pLibraries" :type "VkPipeline" :init-form nil :create
;;      ((plibraries-arg)
;;       (create-array vkpipeline plibraries plibraries-arg :dynamic t :pointers
;;        nil))
;;      :destroy (destroy-array plibraries) :get
;;      ((&optional plibraries-index)
;;       (get-array vkpipeline plibraries plibraries-index librarycount :pointers
;;        nil))
;;      :set
;;      ((plibraries-arg &optional plibraries-index)
;;       (set-array vkpipeline plibraries plibraries-arg plibraries-index :dynamic
;;        t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPresentIdKHR"
;;       (present-id-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (swapchaincount :name "swapchainCount" :type uint32)
;;     (ppresentids :name "pPresentIds" :type uint64 :init-form nil :create
;;      ((ppresentids-arg)
;;       (create-array :uint64 ppresentids ppresentids-arg :dynamic t :pointers
;;        nil))
;;      :destroy (destroy-array ppresentids) :get
;;      ((&optional ppresentids-index)
;;       (get-array :uint64 ppresentids ppresentids-index swapchaincount :pointers
;;        nil))
;;      :set
;;      ((ppresentids-arg &optional ppresentids-index)
;;       (set-array :uint64 ppresentids ppresentids-arg ppresentids-index :dynamic
;;        t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePresentIdFeaturesKHR"
;;       (physical-device-present-id-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (presentid :name "presentId" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkQueueFamilyCheckpointProperties2NV"
;;       (queue-family-checkpoint-properties-2-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (checkpointexecutionstagemask :name "checkpointExecutionStageMask" :type
;;      "VkPipelineStageFlags2"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCheckpointData2NV"
;;       (checkpoint-data-2-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (stage :name stage :type "VkPipelineStageFlags2")
;;     (pcheckpointmarker :name "pCheckpointMarker" :type void :init-form nil
;;      :create
;;      ((pcheckpointmarker-arg)
;;       (create-pointer pcheckpointmarker pcheckpointmarker-arg))
;;      :get (nil (get-pointer pcheckpointmarker)) :set
;;      ((pcheckpointmarker-arg)
;;       (set-pointer pcheckpointmarker pcheckpointmarker-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR"
;;       (physical-device-fragment-shader-barycentric-features-nv
;;        physical-device-fragment-shader-barycentric-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fragmentshaderbarycentric :name "fragmentShaderBarycentric" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR"
;;       (physical-device-fragment-shader-barycentric-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (tristripvertexorderindependentofprovokingvertex :name
;;      "triStripVertexOrderIndependentOfProvokingVertex" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR"
;;       (physical-device-shader-subgroup-uniform-control-flow-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadersubgroupuniformcontrolflow :name "shaderSubgroupUniformControlFlow"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR"
;;       (physical-device-workgroup-memory-explicit-layout-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (workgroupmemoryexplicitlayout :name "workgroupMemoryExplicitLayout" :type
;;      "VkBool32")
;;     (workgroupmemoryexplicitlayoutscalarblocklayout :name
;;      "workgroupMemoryExplicitLayoutScalarBlockLayout" :type "VkBool32")
;;     (workgroupmemoryexplicitlayout8bitaccess :name
;;      "workgroupMemoryExplicitLayout8BitAccess" :type "VkBool32")
;;     (workgroupmemoryexplicitlayout16bitaccess :name
;;      "workgroupMemoryExplicitLayout16BitAccess" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR"
;;       (physical-device-ray-tracing-maintenance-1-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (raytracingmaintenance1 :name "rayTracingMaintenance1" :type "VkBool32")
;;     (raytracingpipelinetraceraysindirect2 :name
;;      "rayTracingPipelineTraceRaysIndirect2" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkTraceRaysIndirectCommand2KHR"
;;       (trace-rays-indirect-command-2-khr)
;;       (:default-create :default-get :default-set)
;;     (raygenshaderrecordaddress :name "raygenShaderRecordAddress" :type
;;      "VkDeviceAddress")
;;     (raygenshaderrecordsize :name "raygenShaderRecordSize" :type "VkDeviceSize")
;;     (missshaderbindingtableaddress :name "missShaderBindingTableAddress" :type
;;      "VkDeviceAddress")
;;     (missshaderbindingtablesize :name "missShaderBindingTableSize" :type
;;      "VkDeviceSize")
;;     (missshaderbindingtablestride :name "missShaderBindingTableStride" :type
;;      "VkDeviceSize")
;;     (hitshaderbindingtableaddress :name "hitShaderBindingTableAddress" :type
;;      "VkDeviceAddress")
;;     (hitshaderbindingtablesize :name "hitShaderBindingTableSize" :type
;;      "VkDeviceSize")
;;     (hitshaderbindingtablestride :name "hitShaderBindingTableStride" :type
;;      "VkDeviceSize")
;;     (callableshaderbindingtableaddress :name
;;      "callableShaderBindingTableAddress" :type "VkDeviceAddress")
;;     (callableshaderbindingtablesize :name "callableShaderBindingTableSize"
;;      :type "VkDeviceSize")
;;     (callableshaderbindingtablestride :name "callableShaderBindingTableStride"
;;      :type "VkDeviceSize")
;;     (width :name width :type uint32)
;;     (height :name height :type uint32)
;;     (depth :name depth :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDebugReportCallbackCreateInfoEXT"
;;       (debug-report-callback-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDebugReportFlagsEXT")
;;     (pfncallback :name "pfnCallback" :type "PFN_vkDebugReportCallbackEXT")
;;     (puserdata :name "pUserData" :type void :init-form nil :create
;;      ((puserdata-arg) (create-pointer puserdata puserdata-arg)) :get
;;      (nil (get-pointer puserdata)) :set
;;      ((puserdata-arg) (set-pointer puserdata puserdata-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineRasterizationStateRasterizationOrderAMD"
;;       (pipeline-rasterization-state-rasterization-order-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (rasterizationorder :name "rasterizationOrder" :type
;;      "VkRasterizationOrderAMD"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDebugMarkerObjectNameInfoEXT"
;;       (debug-marker-object-name-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (objecttype :name "objectType" :type "VkDebugReportObjectTypeEXT")
;;     (object :name object :type uint64)
;;     (pobjectname :name "pObjectName" :type char :init-form nil :create
;;      ((pobjectname-arg) (create-string pobjectname pobjectname-arg :dynamic t))
;;      :destroy (destroy-string pobjectname) :get (nil (get-string pobjectname))
;;      :set
;;      ((pobjectname-arg) (set-string pobjectname pobjectname-arg :dynamic t))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDebugMarkerObjectTagInfoEXT"
;;       (debug-marker-object-tag-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (objecttype :name "objectType" :type "VkDebugReportObjectTypeEXT")
;;     (object :name object :type uint64)
;;     (tagname :name "tagName" :type uint64)
;;     (tagsize :name "tagSize" :type size)
;;     (ptag :name "pTag" :type void :init-form nil :create
;;      ((ptag-arg) (create-pointer ptag ptag-arg)) :get (nil (get-pointer ptag))
;;      :set ((ptag-arg) (set-pointer ptag ptag-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDebugMarkerMarkerInfoEXT"
;;       (debug-marker-marker-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pmarkername :name "pMarkerName" :type char :init-form nil :create
;;      ((pmarkername-arg) (create-string pmarkername pmarkername-arg :dynamic t))
;;      :destroy (destroy-string pmarkername) :get (nil (get-string pmarkername))
;;      :set
;;      ((pmarkername-arg) (set-string pmarkername pmarkername-arg :dynamic t)))
;;     (color :name color :type float :create
;;      ((color-arg)
;;       (create-array :float color color-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional color-index)
;;       (get-array :float color color-index 4 :pointers nil))
;;      :set
;;      ((color-arg &optional color-index)
;;       (set-array :float color color-arg color-index :dynamic nil :pointers
;;        nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDedicatedAllocationImageCreateInfoNV"
;;       (dedicated-allocation-image-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (dedicatedallocation :name "dedicatedAllocation" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDedicatedAllocationBufferCreateInfoNV"
;;       (dedicated-allocation-buffer-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (dedicatedallocation :name "dedicatedAllocation" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDedicatedAllocationMemoryAllocateInfoNV"
;;       (dedicated-allocation-memory-allocate-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (image :name image :type "VkImage" :create
;;      ((image-arg) (create-pointer image image-arg)) :get
;;      (nil (get-pointer image)) :set ((image-arg) (set-pointer image image-arg)))
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceTransformFeedbackFeaturesEXT"
;;       (physical-device-transform-feedback-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (transformfeedback :name "transformFeedback" :type "VkBool32")
;;     (geometrystreams :name "geometryStreams" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceTransformFeedbackPropertiesEXT"
;;       (physical-device-transform-feedback-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxtransformfeedbackstreams :name "maxTransformFeedbackStreams" :type
;;      uint32)
;;     (maxtransformfeedbackbuffers :name "maxTransformFeedbackBuffers" :type
;;      uint32)
;;     (maxtransformfeedbackbuffersize :name "maxTransformFeedbackBufferSize"
;;      :type "VkDeviceSize")
;;     (maxtransformfeedbackstreamdatasize :name
;;      "maxTransformFeedbackStreamDataSize" :type uint32)
;;     (maxtransformfeedbackbufferdatasize :name
;;      "maxTransformFeedbackBufferDataSize" :type uint32)
;;     (maxtransformfeedbackbufferdatastride :name
;;      "maxTransformFeedbackBufferDataStride" :type uint32)
;;     (transformfeedbackqueries :name "transformFeedbackQueries" :type "VkBool32")
;;     (transformfeedbackstreamslinestriangles :name
;;      "transformFeedbackStreamsLinesTriangles" :type "VkBool32")
;;     (transformfeedbackrasterizationstreamselect :name
;;      "transformFeedbackRasterizationStreamSelect" :type "VkBool32")
;;     (transformfeedbackdraw :name "transformFeedbackDraw" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineRasterizationStateStreamCreateInfoEXT"
;;       (pipeline-rasterization-state-stream-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineRasterizationStateStreamCreateFlagsEXT")
;;     (rasterizationstream :name "rasterizationStream" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCuModuleCreateInfoNVX"
;;       (cu-module-create-info-nvx)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (datasize :name "dataSize" :type size)
;;     (pdata :name "pData" :type void :init-form nil :create
;;      ((pdata-arg) (create-pointer pdata pdata-arg)) :get
;;      (nil (get-pointer pdata)) :set
;;      ((pdata-arg) (set-pointer pdata pdata-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCuFunctionCreateInfoNVX"
;;       (cu-function-create-info-nvx)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (module :name module :type "VkCuModuleNVX" :create
;;      ((module-arg) (create-pointer module module-arg)) :get
;;      (nil (get-pointer module)) :set
;;      ((module-arg) (set-pointer module module-arg)))
;;     (pname :name "pName" :type char :init-form nil :create
;;      ((pname-arg) (create-string pname pname-arg :dynamic t)) :destroy
;;      (destroy-string pname) :get (nil (get-string pname)) :set
;;      ((pname-arg) (set-string pname pname-arg :dynamic t))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCuLaunchInfoNVX"
;;       (cu-launch-info-nvx)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (function :name function :type "VkCuFunctionNVX" :create
;;      ((function-arg) (create-pointer function function-arg)) :get
;;      (nil (get-pointer function)) :set
;;      ((function-arg) (set-pointer function function-arg)))
;;     (griddimx :name "gridDimX" :type uint32)
;;     (griddimy :name "gridDimY" :type uint32)
;;     (griddimz :name "gridDimZ" :type uint32)
;;     (blockdimx :name "blockDimX" :type uint32)
;;     (blockdimy :name "blockDimY" :type uint32)
;;     (blockdimz :name "blockDimZ" :type uint32)
;;     (sharedmembytes :name "sharedMemBytes" :type uint32)
;;     (paramcount :name "paramCount" :type size)
;;     (pparams :name "pParams" :type void :init-form nil :create
;;      ((pparams-arg) (create-pointer pparams pparams-arg)) :get
;;      (nil (get-pointer pparams)) :set
;;      ((pparams-arg) (set-pointer pparams pparams-arg)))
;;     (extracount :name "extraCount" :type size)
;;     (pextras :name "pExtras" :type void :init-form nil :create
;;      ((pextras-arg) (create-pointer pextras pextras-arg)) :get
;;      (nil (get-pointer pextras)) :set
;;      ((pextras-arg) (set-pointer pextras pextras-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageViewHandleInfoNVX"
;;       (image-view-handle-info-nvx)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imageview :name "imageView" :type "VkImageView" :create
;;      ((imageview-arg) (create-pointer imageview imageview-arg)) :get
;;      (nil (get-pointer imageview)) :set
;;      ((imageview-arg) (set-pointer imageview imageview-arg)))
;;     (descriptortype :name "descriptorType" :type "VkDescriptorType")
;;     (sampler :name sampler :type "VkSampler" :create
;;      ((sampler-arg) (create-pointer sampler sampler-arg)) :get
;;      (nil (get-pointer sampler)) :set
;;      ((sampler-arg) (set-pointer sampler sampler-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageViewAddressPropertiesNVX"
;;       (image-view-address-properties-nvx)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (deviceaddress :name "deviceAddress" :type "VkDeviceAddress")
;;     (size :name size :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkTextureLODGatherFormatPropertiesAMD"
;;       (texture-l-o-d-gather-format-properties-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (supportstexturegatherlodbiasamd :name "supportsTextureGatherLODBiasAMD"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkShaderResourceUsageAMD"
;;       (shader-resource-usage-amd)
;;       (:default-create :default-get :default-set)
;;     (numusedvgprs :name "numUsedVgprs" :type uint32)
;;     (numusedsgprs :name "numUsedSgprs" :type uint32)
;;     (ldssizeperlocalworkgroup :name "ldsSizePerLocalWorkGroup" :type uint32)
;;     (ldsusagesizeinbytes :name "ldsUsageSizeInBytes" :type size)
;;     (scratchmemusageinbytes :name "scratchMemUsageInBytes" :type size))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkShaderStatisticsInfoAMD"
;;       (shader-statistics-info-amd)
;;       (:default-create :default-get :default-set)
;;     (shaderstagemask :name "shaderStageMask" :type "VkShaderStageFlags")
;;     (resourceusage :pointer t :name "resourceUsage" :type
;;      "VkShaderResourceUsageAMD" :create
;;      ((resourceusage-arg)
;;       (copy-object resourceusage resourceusage-arg
;;        '(:struct vkshaderresourceusageamd)))
;;      :set
;;      ((resourceusage-arg)
;;       (copy-object resourceusage resourceusage-arg
;;        '(:struct vkshaderresourceusageamd))))
;;     (numphysicalvgprs :name "numPhysicalVgprs" :type uint32)
;;     (numphysicalsgprs :name "numPhysicalSgprs" :type uint32)
;;     (numavailablevgprs :name "numAvailableVgprs" :type uint32)
;;     (numavailablesgprs :name "numAvailableSgprs" :type uint32)
;;     (computeworkgroupsize :name "computeWorkGroupSize" :type uint32 :create
;;      ((computeworkgroupsize-arg)
;;       (create-array :uint32 computeworkgroupsize computeworkgroupsize-arg
;;        :dynamic nil :pointers nil))
;;      :get
;;      ((&optional computeworkgroupsize-index)
;;       (get-array :uint32 computeworkgroupsize computeworkgroupsize-index 3
;;        :pointers nil))
;;      :set
;;      ((computeworkgroupsize-arg &optional computeworkgroupsize-index)
;;       (set-array :uint32 computeworkgroupsize computeworkgroupsize-arg
;;        computeworkgroupsize-index :dynamic nil :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceCornerSampledImageFeaturesNV"
;;       (physical-device-corner-sampled-image-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (cornersampledimage :name "cornerSampledImage" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExternalImageFormatPropertiesNV"
;;       (external-image-format-properties-nv)
;;       (:default-create :default-get :default-set)
;;     (imageformatproperties :pointer t :name "imageFormatProperties" :type
;;      "VkImageFormatProperties" :create
;;      ((imageformatproperties-arg)
;;       (copy-object imageformatproperties imageformatproperties-arg
;;        '(:struct vkimageformatproperties)))
;;      :set
;;      ((imageformatproperties-arg)
;;       (copy-object imageformatproperties imageformatproperties-arg
;;        '(:struct vkimageformatproperties))))
;;     (externalmemoryfeatures :name "externalMemoryFeatures" :type
;;      "VkExternalMemoryFeatureFlagsNV")
;;     (exportfromimportedhandletypes :name "exportFromImportedHandleTypes" :type
;;      "VkExternalMemoryHandleTypeFlagsNV")
;;     (compatiblehandletypes :name "compatibleHandleTypes" :type
;;      "VkExternalMemoryHandleTypeFlagsNV"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExternalMemoryImageCreateInfoNV"
;;       (external-memory-image-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletypes :name "handleTypes" :type "VkExternalMemoryHandleTypeFlagsNV"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkExportMemoryAllocateInfoNV"
;;       (export-memory-allocate-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletypes :name "handleTypes" :type "VkExternalMemoryHandleTypeFlagsNV"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkValidationFlagsEXT"
;;       (validation-flags-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (disabledvalidationcheckcount :name "disabledValidationCheckCount" :type
;;      uint32)
;;     (pdisabledvalidationchecks :name "pDisabledValidationChecks" :type
;;      "VkValidationCheckEXT" :init-form nil :create
;;      ((pdisabledvalidationchecks-arg)
;;       (create-array vkvalidationcheckext pdisabledvalidationchecks
;;        pdisabledvalidationchecks-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pdisabledvalidationchecks) :get
;;      ((&optional pdisabledvalidationchecks-index)
;;       (get-array vkvalidationcheckext pdisabledvalidationchecks
;;        pdisabledvalidationchecks-index disabledvalidationcheckcount :pointers
;;        nil))
;;      :set
;;      ((pdisabledvalidationchecks-arg &optional pdisabledvalidationchecks-index)
;;       (set-array vkvalidationcheckext pdisabledvalidationchecks
;;        pdisabledvalidationchecks-arg pdisabledvalidationchecks-index :dynamic t
;;        :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageViewASTCDecodeModeEXT"
;;       (image-view-a-s-t-c-decode-mode-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (decodemode :name "decodeMode" :type "VkFormat"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceASTCDecodeFeaturesEXT"
;;       (physical-device-a-s-t-c-decode-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (decodemodesharedexponent :name "decodeModeSharedExponent" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkConditionalRenderingBeginInfoEXT"
;;       (conditional-rendering-begin-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg)))
;;     (offset :name offset :type "VkDeviceSize")
;;     (flags :name flags :type "VkConditionalRenderingFlagsEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceConditionalRenderingFeaturesEXT"
;;       (physical-device-conditional-rendering-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (conditionalrendering :name "conditionalRendering" :type "VkBool32")
;;     (inheritedconditionalrendering :name "inheritedConditionalRendering" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCommandBufferInheritanceConditionalRenderingInfoEXT"
;;       (command-buffer-inheritance-conditional-rendering-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (conditionalrenderingenable :name "conditionalRenderingEnable" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkViewportWScalingNV"
;;       (viewport-w-scaling-nv)
;;       (:default-create :default-get :default-set)
;;     (xcoeff :name xcoeff :type float)
;;     (ycoeff :name ycoeff :type float))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineViewportWScalingStateCreateInfoNV"
;;       (pipeline-viewport-w-scaling-state-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (viewportwscalingenable :name "viewportWScalingEnable" :type "VkBool32")
;;     (viewportcount :name "viewportCount" :type uint32)
;;     (pviewportwscalings :name "pViewportWScalings" :type "VkViewportWScalingNV"
;;      :init-form nil :create
;;      ((pviewportwscalings-arg)
;;       (create-array (:struct vkviewportwscalingnv) pviewportwscalings
;;        pviewportwscalings-arg :dynamic t :pointers ("VkViewportWScalingNV")))
;;      :destroy (destroy-array pviewportwscalings) :get
;;      ((&optional pviewportwscalings-index)
;;       (get-array (:struct vkviewportwscalingnv) pviewportwscalings
;;        pviewportwscalings-index viewportcount :pointers
;;        ("VkViewportWScalingNV")))
;;      :set
;;      ((pviewportwscalings-arg &optional pviewportwscalings-index)
;;       (set-array (:struct vkviewportwscalingnv) pviewportwscalings
;;        pviewportwscalings-arg pviewportwscalings-index :dynamic t :pointers
;;        ("VkViewportWScalingNV")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSurfaceCapabilities2EXT"
;;       (surface-capabilities-2-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (minimagecount :name "minImageCount" :type uint32)
;;     (maximagecount :name "maxImageCount" :type uint32)
;;     (currentextent :pointer t :name "currentExtent" :type "VkExtent2D" :create
;;      ((currentextent-arg)
;;       (copy-object currentextent currentextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((currentextent-arg)
;;       (copy-object currentextent currentextent-arg '(:struct vkextent2d))))
;;     (minimageextent :pointer t :name "minImageExtent" :type "VkExtent2D"
;;      :create
;;      ((minimageextent-arg)
;;       (copy-object minimageextent minimageextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((minimageextent-arg)
;;       (copy-object minimageextent minimageextent-arg '(:struct vkextent2d))))
;;     (maximageextent :pointer t :name "maxImageExtent" :type "VkExtent2D"
;;      :create
;;      ((maximageextent-arg)
;;       (copy-object maximageextent maximageextent-arg '(:struct vkextent2d)))
;;      :set
;;      ((maximageextent-arg)
;;       (copy-object maximageextent maximageextent-arg '(:struct vkextent2d))))
;;     (maximagearraylayers :name "maxImageArrayLayers" :type uint32)
;;     (supportedtransforms :name "supportedTransforms" :type
;;      "VkSurfaceTransformFlagsKHR")
;;     (currenttransform :name "currentTransform" :type
;;      "VkSurfaceTransformFlagBitsKHR")
;;     (supportedcompositealpha :name "supportedCompositeAlpha" :type
;;      "VkCompositeAlphaFlagsKHR")
;;     (supportedusageflags :name "supportedUsageFlags" :type "VkImageUsageFlags")
;;     (supportedsurfacecounters :name "supportedSurfaceCounters" :type
;;      "VkSurfaceCounterFlagsEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayPowerInfoEXT"
;;       (display-power-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (powerstate :name "powerState" :type "VkDisplayPowerStateEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceEventInfoEXT"
;;       (device-event-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (deviceevent :name "deviceEvent" :type "VkDeviceEventTypeEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayEventInfoEXT"
;;       (display-event-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (displayevent :name "displayEvent" :type "VkDisplayEventTypeEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSwapchainCounterCreateInfoEXT"
;;       (swapchain-counter-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (surfacecounters :name "surfaceCounters" :type "VkSurfaceCounterFlagsEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRefreshCycleDurationGOOGLE"
;;       (refresh-cycle-duration-google)
;;       (:default-create :default-get :default-set)
;;     (refreshduration :name "refreshDuration" :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPastPresentationTimingGOOGLE"
;;       (past-presentation-timing-google)
;;       (:default-create :default-get :default-set)
;;     (presentid :name "presentID" :type uint32)
;;     (desiredpresenttime :name "desiredPresentTime" :type uint64)
;;     (actualpresenttime :name "actualPresentTime" :type uint64)
;;     (earliestpresenttime :name "earliestPresentTime" :type uint64)
;;     (presentmargin :name "presentMargin" :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPresentTimeGOOGLE"
;;       (present-time-google)
;;       (:default-create :default-get :default-set)
;;     (presentid :name "presentID" :type uint32)
;;     (desiredpresenttime :name "desiredPresentTime" :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPresentTimesInfoGOOGLE"
;;       (present-times-info-google)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (swapchaincount :name "swapchainCount" :type uint32)
;;     (ptimes :name "pTimes" :type "VkPresentTimeGOOGLE" :init-form nil :create
;;      ((ptimes-arg)
;;       (create-array (:struct vkpresenttimegoogle) ptimes ptimes-arg :dynamic t
;;        :pointers ("VkPresentTimeGOOGLE")))
;;      :destroy (destroy-array ptimes) :get
;;      ((&optional ptimes-index)
;;       (get-array (:struct vkpresenttimegoogle) ptimes ptimes-index
;;        swapchaincount :pointers ("VkPresentTimeGOOGLE")))
;;      :set
;;      ((ptimes-arg &optional ptimes-index)
;;       (set-array (:struct vkpresenttimegoogle) ptimes ptimes-arg ptimes-index
;;        :dynamic t :pointers ("VkPresentTimeGOOGLE")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX"
;;       (physical-device-multiview-per-view-attributes-properties-nvx)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (perviewpositionallcomponents :name "perViewPositionAllComponents" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkViewportSwizzleNV"
;;       (viewport-swizzle-nv)
;;       (:default-create :default-get :default-set)
;;     (x :name x :type "VkViewportCoordinateSwizzleNV")
;;     (y :name y :type "VkViewportCoordinateSwizzleNV")
;;     (z :name z :type "VkViewportCoordinateSwizzleNV")
;;     (w :name w :type "VkViewportCoordinateSwizzleNV"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineViewportSwizzleStateCreateInfoNV"
;;       (pipeline-viewport-swizzle-state-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineViewportSwizzleStateCreateFlagsNV")
;;     (viewportcount :name "viewportCount" :type uint32)
;;     (pviewportswizzles :name "pViewportSwizzles" :type "VkViewportSwizzleNV"
;;      :init-form nil :create
;;      ((pviewportswizzles-arg)
;;       (create-array (:struct vkviewportswizzlenv) pviewportswizzles
;;        pviewportswizzles-arg :dynamic t :pointers ("VkViewportSwizzleNV")))
;;      :destroy (destroy-array pviewportswizzles) :get
;;      ((&optional pviewportswizzles-index)
;;       (get-array (:struct vkviewportswizzlenv) pviewportswizzles
;;        pviewportswizzles-index viewportcount :pointers
;;        ("VkViewportSwizzleNV")))
;;      :set
;;      ((pviewportswizzles-arg &optional pviewportswizzles-index)
;;       (set-array (:struct vkviewportswizzlenv) pviewportswizzles
;;        pviewportswizzles-arg pviewportswizzles-index :dynamic t :pointers
;;        ("VkViewportSwizzleNV")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDiscardRectanglePropertiesEXT"
;;       (physical-device-discard-rectangle-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxdiscardrectangles :name "maxDiscardRectangles" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineDiscardRectangleStateCreateInfoEXT"
;;       (pipeline-discard-rectangle-state-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineDiscardRectangleStateCreateFlagsEXT")
;;     (discardrectanglemode :name "discardRectangleMode" :type
;;      "VkDiscardRectangleModeEXT")
;;     (discardrectanglecount :name "discardRectangleCount" :type uint32)
;;     (pdiscardrectangles :name "pDiscardRectangles" :type "VkRect2D" :init-form
;;      nil :create
;;      ((pdiscardrectangles-arg)
;;       (create-array (:struct vkrect2d) pdiscardrectangles
;;        pdiscardrectangles-arg :dynamic t :pointers ("VkRect2D")))
;;      :destroy (destroy-array pdiscardrectangles) :get
;;      ((&optional pdiscardrectangles-index)
;;       (get-array (:struct vkrect2d) pdiscardrectangles pdiscardrectangles-index
;;        discardrectanglecount :pointers ("VkRect2D")))
;;      :set
;;      ((pdiscardrectangles-arg &optional pdiscardrectangles-index)
;;       (set-array (:struct vkrect2d) pdiscardrectangles pdiscardrectangles-arg
;;        pdiscardrectangles-index :dynamic t :pointers ("VkRect2D")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceConservativeRasterizationPropertiesEXT"
;;       (physical-device-conservative-rasterization-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (primitiveoverestimationsize :name "primitiveOverestimationSize" :type
;;      float)
;;     (maxextraprimitiveoverestimationsize :name
;;      "maxExtraPrimitiveOverestimationSize" :type float)
;;     (extraprimitiveoverestimationsizegranularity :name
;;      "extraPrimitiveOverestimationSizeGranularity" :type float)
;;     (primitiveunderestimation :name "primitiveUnderestimation" :type "VkBool32")
;;     (conservativepointandlinerasterization :name
;;      "conservativePointAndLineRasterization" :type "VkBool32")
;;     (degeneratetrianglesrasterized :name "degenerateTrianglesRasterized" :type
;;      "VkBool32")
;;     (degeneratelinesrasterized :name "degenerateLinesRasterized" :type
;;      "VkBool32")
;;     (fullycoveredfragmentshaderinputvariable :name
;;      "fullyCoveredFragmentShaderInputVariable" :type "VkBool32")
;;     (conservativerasterizationpostdepthcoverage :name
;;      "conservativeRasterizationPostDepthCoverage" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineRasterizationConservativeStateCreateInfoEXT"
;;       (pipeline-rasterization-conservative-state-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type
;;      "VkPipelineRasterizationConservativeStateCreateFlagsEXT")
;;     (conservativerasterizationmode :name "conservativeRasterizationMode" :type
;;      "VkConservativeRasterizationModeEXT")
;;     (extraprimitiveoverestimationsize :name "extraPrimitiveOverestimationSize"
;;      :type float))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDepthClipEnableFeaturesEXT"
;;       (physical-device-depth-clip-enable-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (depthclipenable :name "depthClipEnable" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineRasterizationDepthClipStateCreateInfoEXT"
;;       (pipeline-rasterization-depth-clip-state-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type
;;      "VkPipelineRasterizationDepthClipStateCreateFlagsEXT")
;;     (depthclipenable :name "depthClipEnable" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkXYColorEXT"
;;       (x-y-color-ext)
;;       (:default-create :default-get :default-set)
;;     (x :name x :type float)
;;     (y :name y :type float))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkHdrMetadataEXT"
;;       (hdr-metadata-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (displayprimaryred :pointer t :name "displayPrimaryRed" :type
;;      "VkXYColorEXT" :create
;;      ((displayprimaryred-arg)
;;       (copy-object displayprimaryred displayprimaryred-arg
;;        '(:struct vkxycolorext)))
;;      :set
;;      ((displayprimaryred-arg)
;;       (copy-object displayprimaryred displayprimaryred-arg
;;        '(:struct vkxycolorext))))
;;     (displayprimarygreen :pointer t :name "displayPrimaryGreen" :type
;;      "VkXYColorEXT" :create
;;      ((displayprimarygreen-arg)
;;       (copy-object displayprimarygreen displayprimarygreen-arg
;;        '(:struct vkxycolorext)))
;;      :set
;;      ((displayprimarygreen-arg)
;;       (copy-object displayprimarygreen displayprimarygreen-arg
;;        '(:struct vkxycolorext))))
;;     (displayprimaryblue :pointer t :name "displayPrimaryBlue" :type
;;      "VkXYColorEXT" :create
;;      ((displayprimaryblue-arg)
;;       (copy-object displayprimaryblue displayprimaryblue-arg
;;        '(:struct vkxycolorext)))
;;      :set
;;      ((displayprimaryblue-arg)
;;       (copy-object displayprimaryblue displayprimaryblue-arg
;;        '(:struct vkxycolorext))))
;;     (whitepoint :pointer t :name "whitePoint" :type "VkXYColorEXT" :create
;;      ((whitepoint-arg)
;;       (copy-object whitepoint whitepoint-arg '(:struct vkxycolorext)))
;;      :set
;;      ((whitepoint-arg)
;;       (copy-object whitepoint whitepoint-arg '(:struct vkxycolorext))))
;;     (maxluminance :name "maxLuminance" :type float)
;;     (minluminance :name "minLuminance" :type float)
;;     (maxcontentlightlevel :name "maxContentLightLevel" :type float)
;;     (maxframeaveragelightlevel :name "maxFrameAverageLightLevel" :type float))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDebugUtilsLabelEXT"
;;       (debug-utils-label-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (plabelname :name "pLabelName" :type string :init-form nil :create
;;      ((plabelname-arg) (create-string plabelname plabelname-arg :dynamic t))
;;      :destroy (destroy-string plabelname) :get (nil (get-string plabelname))
;;      :set ((plabelname-arg) (set-string plabelname plabelname-arg :dynamic t)))
;;     (color :name color :type (list float) :init-form '(0.0 0.0 0.0 0.0) :create
;;      ((color-arg)
;;       (create-array :float color color-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional color-index)
;;       (get-array :float color color-index 4 :pointers nil))
;;      :set
;;      ((color-arg &optional color-index)
;;       (set-array :float color color-arg color-index :dynamic nil :pointers
;;        nil))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDebugUtilsObjectNameInfoEXT"
;;       (debug-utils-object-name-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "Vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (objecttype :name "objectType" :type "VkObjectType")
;;     (objecthandle :name "objectHandle" :type uint64)
;;     (pobjectname :name "pObjectName" :type string :init-form nil :create
;;      ((pobjectname-arg) (create-string pobjectname pobjectname-arg :dynamic t))
;;      :destroy (destroy-string pobjectname) :get (nil (get-string pobjectname))
;;      :set
;;      ((pobjectname-arg) (set-string pobjectname pobjectname-arg :dynamic t))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDebugUtilsMessengerCallbackDataEXT"
;;       (debug-utils-messenger-callback-data-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDebugUtilsMessengerCallbackDataFlagsEXT")
;;     (pmessageidname :name "pMessageIdName" :type string :init-form nil :create
;;      ((pmessageidname-arg)
;;       (create-string pmessageidname pmessageidname-arg :dynamic t))
;;      :destroy (destroy-string pmessageidname) :get
;;      (nil (get-string pmessageidname)) :set
;;      ((pmessageidname-arg)
;;       (set-string pmessageidname pmessageidname-arg :dynamic t)))
;;     (messageidnumber :name "messageIdNumber" :type int32)
;;     (pmessage :name "pMessage" :type string :init-form nil :create
;;      ((pmessage-arg) (create-string pmessage pmessage-arg :dynamic t)) :destroy
;;      (destroy-string pmessage) :get (nil (get-string pmessage)) :set
;;      ((pmessage-arg) (set-string pmessage pmessage-arg :dynamic t)))
;;     (queuelabelcount :name "queueLabelCount" :type uint32)
;;     (pqueuelabels :name "pQueueLabels" :type (list "VkDebugUtilsLabelEXT")
;;      :init-form nil :create
;;      ((pqueuelabels-arg)
;;       (create-array (:struct vkdebugutilslabelext) pqueuelabels
;;        pqueuelabels-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pqueuelabels) :get
;;      ((&optional pqueuelabels-index)
;;       (get-array (:struct vkdebugutilslabelext) pqueuelabels pqueuelabels-index
;;        queuelabelcount :pointers t))
;;      :set
;;      ((pqueuelabels-arg &optional pqueuelabels-index)
;;       (set-array (:struct vkdebugutilslabelext) pqueuelabels pqueuelabels-arg
;;        pqueuelabels-index :dynamic t :pointers t)))
;;     (cmdbuflabelcount :name "cmdBufLabelCount" :type uint32)
;;     (pcmdbuflabels :name "pCmdBufLabels" :type (list "VkDebugUtilsLabelEXT")
;;      :init-form nil :create
;;      ((pcmdbuflabels-arg)
;;       (create-array (:struct vkdebugutilslabelext) pcmdbuflabels
;;        pcmdbuflabels-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pcmdbuflabels) :get
;;      ((&optional pcmdbuflabels-index)
;;       (get-array (:struct vkdebugutilslabelext) pcmdbuflabels
;;        pcmdbuflabels-index cmdbuflabelcount :pointers t))
;;      :set
;;      ((pcmdbuflabels-arg &optional pcmdbuflabels-index)
;;       (set-array (:struct vkdebugutilslabelext) pcmdbuflabels pcmdbuflabels-arg
;;        pcmdbuflabels-index :dynamic t :pointers t)))
;;     (objectcount :name "objectCount" :type uint32)
;;     (pobjects :name "pObjects" :type (list "VkDebugUtilsObjectNameInfoEXT")
;;      :init-form nil :create
;;      ((pobjects-arg)
;;       (create-array (:struct vkdebugutilsobjectnameinfoext) pobjects
;;        pobjects-arg :dynamic t :pointers t))
;;      :destroy (destroy-array pobjects) :get
;;      ((&optional pobjects-index)
;;       (get-array (:struct vkdebugutilsobjectnameinfoext) pobjects
;;        pobjects-index objectcount :pointers t))
;;      :set
;;      ((pobjects-arg &optional pobjects-index)
;;       (set-array (:struct vkdebugutilsobjectnameinfoext) pobjects pobjects-arg
;;        pobjects-index :dynamic t :pointers t))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDebugUtilsMessengerCreateInfoEXT"
;;       (debug-utils-messenger-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type "vulkan object" :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDebugUtilsMessengerCreateFlagsEXT")
;;     (messageseverity :name "messageSeverity" :type
;;      "VkDebugUtilsMessageSeverityFlagsEXT")
;;     (messagetype :name "messageType" :type "VkDebugUtilsMessageTypeFlagsEXT")
;;     (pfnusercallback :name "pfnUserCallback" :type callback :init-form nil
;;      :create
;;      ((pfnusercallback-arg)
;;       (setf pfnusercallback
;;               (if pfnusercallback-arg
;;                   (if (symbolp pfnusercallback-arg)
;;                       (cffi:get-callback pfnusercallback-arg)
;;                       pfnusercallback-arg)
;;                   (cffi-sys:null-pointer))))
;;      :set
;;      ((new-value)
;;       (if new-value
;;           (if (symbolp new-value)
;;               (setf pfnusercallback (cffi:get-callback new-value))
;;               (setf pfnusercallback new-value))
;;           (setf pfnusercallback (cffi-sys:null-pointer)))))
;;     (puserdata :name "pUserData" :type "lisp object" :init-form nil :create
;;      ((puserdata-arg)
;;       (setf puserdata
;;               (if puserdata-arg
;;                   (prog2
;;                       (setf (gethash
;;                              *debug-utils-messenger-callback-next-address*
;;                              *debug-utils-messenger-callback-user-data*)
;;                               puserdata-arg)
;;                       (cffi-sys:make-pointer
;;                        *debug-utils-messenger-callback-next-address*)
;;                     (setf *debug-utils-messenger-callback-next-address*
;;                             (1+
;;                              *debug-utils-messenger-callback-next-address*)))
;;                   (cffi-sys:null-pointer))))
;;      :get
;;      (nil
;;       (gethash (cffi-sys:pointer-address puserdata)
;;                *debug-utils-messenger-callback-user-data*))
;;      :set
;;      ((new-value)
;;       (if (cffi-sys:null-pointer-p puserdata)
;;           (if new-value
;;               (progn
;;                (setf (gethash *debug-utils-messenger-callback-next-address*
;;                               *debug-utils-messenger-callback-user-data*)
;;                        new-value)
;;                (setf puserdata
;;                        (cffi-sys:make-pointer
;;                         *debug-utils-messenger-callback-next-address*))
;;                (setf *debug-utils-messenger-callback-next-address*
;;                        (1+ *debug-utils-messenger-callback-next-address*))))
;;           (if new-value
;;               (setf (gethash (cffi-sys:pointer-address puserdata)
;;                              *debug-utils-messenger-callback-user-data*)
;;                       new-value)
;;               (progn
;;                (remhash (cffi-sys:pointer-address puserdata)
;;                         *debug-utils-messenger-callback-user-data*)
;;                (setf puserdata (cffi-sys:null-pointer))))))))

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDebugUtilsObjectTagInfoEXT"
;;       (debug-utils-object-tag-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (objecttype :name "objectType" :type "VkObjectType")
;;     (objecthandle :name "objectHandle" :type uint64)
;;     (tagname :name "tagName" :type uint64)
;;     (tagsize :name "tagSize" :type size)
;;     (ptag :name "pTag" :type void :init-form nil :create
;;      ((ptag-arg) (create-pointer ptag ptag-arg)) :get (nil (get-pointer ptag))
;;      :set ((ptag-arg) (set-pointer ptag ptag-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSampleLocationEXT"
;;       (sample-location-ext)
;;       (:default-create :default-get :default-set)
;;     (x :name x :type float)
;;     (y :name y :type float))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSampleLocationsInfoEXT"
;;       (sample-locations-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (samplelocationsperpixel :name "sampleLocationsPerPixel" :type
;;      "VkSampleCountFlagBits")
;;     (samplelocationgridsize :pointer t :name "sampleLocationGridSize" :type
;;      "VkExtent2D" :create
;;      ((samplelocationgridsize-arg)
;;       (copy-object samplelocationgridsize samplelocationgridsize-arg
;;        '(:struct vkextent2d)))
;;      :set
;;      ((samplelocationgridsize-arg)
;;       (copy-object samplelocationgridsize samplelocationgridsize-arg
;;        '(:struct vkextent2d))))
;;     (samplelocationscount :name "sampleLocationsCount" :type uint32)
;;     (psamplelocations :name "pSampleLocations" :type "VkSampleLocationEXT"
;;      :init-form nil :create
;;      ((psamplelocations-arg)
;;       (create-array (:struct vksamplelocationext) psamplelocations
;;        psamplelocations-arg :dynamic t :pointers ("VkSampleLocationEXT")))
;;      :destroy (destroy-array psamplelocations) :get
;;      ((&optional psamplelocations-index)
;;       (get-array (:struct vksamplelocationext) psamplelocations
;;        psamplelocations-index samplelocationscount :pointers
;;        ("VkSampleLocationEXT")))
;;      :set
;;      ((psamplelocations-arg &optional psamplelocations-index)
;;       (set-array (:struct vksamplelocationext) psamplelocations
;;        psamplelocations-arg psamplelocations-index :dynamic t :pointers
;;        ("VkSampleLocationEXT")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAttachmentSampleLocationsEXT"
;;       (attachment-sample-locations-ext)
;;       (:default-create :default-get :default-set)
;;     (attachmentindex :name "attachmentIndex" :type uint32)
;;     (samplelocationsinfo :pointer t :name "sampleLocationsInfo" :type
;;      "VkSampleLocationsInfoEXT" :create
;;      ((samplelocationsinfo-arg)
;;       (copy-object samplelocationsinfo samplelocationsinfo-arg
;;        '(:struct vksamplelocationsinfoext)))
;;      :set
;;      ((samplelocationsinfo-arg)
;;       (copy-object samplelocationsinfo samplelocationsinfo-arg
;;        '(:struct vksamplelocationsinfoext)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubpassSampleLocationsEXT"
;;       (subpass-sample-locations-ext)
;;       (:default-create :default-get :default-set)
;;     (subpassindex :name "subpassIndex" :type uint32)
;;     (samplelocationsinfo :pointer t :name "sampleLocationsInfo" :type
;;      "VkSampleLocationsInfoEXT" :create
;;      ((samplelocationsinfo-arg)
;;       (copy-object samplelocationsinfo samplelocationsinfo-arg
;;        '(:struct vksamplelocationsinfoext)))
;;      :set
;;      ((samplelocationsinfo-arg)
;;       (copy-object samplelocationsinfo samplelocationsinfo-arg
;;        '(:struct vksamplelocationsinfoext)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassSampleLocationsBeginInfoEXT"
;;       (render-pass-sample-locations-begin-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (attachmentinitialsamplelocationscount :name
;;      "attachmentInitialSampleLocationsCount" :type uint32)
;;     (pattachmentinitialsamplelocations :name
;;      "pAttachmentInitialSampleLocations" :type "VkAttachmentSampleLocationsEXT"
;;      :init-form nil :create
;;      ((pattachmentinitialsamplelocations-arg)
;;       (create-array (:struct vkattachmentsamplelocationsext)
;;        pattachmentinitialsamplelocations pattachmentinitialsamplelocations-arg
;;        :dynamic t :pointers ("VkAttachmentSampleLocationsEXT")))
;;      :destroy (destroy-array pattachmentinitialsamplelocations) :get
;;      ((&optional pattachmentinitialsamplelocations-index)
;;       (get-array (:struct vkattachmentsamplelocationsext)
;;        pattachmentinitialsamplelocations
;;        pattachmentinitialsamplelocations-index
;;        attachmentinitialsamplelocationscount :pointers
;;        ("VkAttachmentSampleLocationsEXT")))
;;      :set
;;      ((pattachmentinitialsamplelocations-arg &optional
;;        pattachmentinitialsamplelocations-index)
;;       (set-array (:struct vkattachmentsamplelocationsext)
;;        pattachmentinitialsamplelocations pattachmentinitialsamplelocations-arg
;;        pattachmentinitialsamplelocations-index :dynamic t :pointers
;;        ("VkAttachmentSampleLocationsEXT"))))
;;     (postsubpasssamplelocationscount :name "postSubpassSampleLocationsCount"
;;      :type uint32)
;;     (ppostsubpasssamplelocations :name "pPostSubpassSampleLocations" :type
;;      "VkSubpassSampleLocationsEXT" :init-form nil :create
;;      ((ppostsubpasssamplelocations-arg)
;;       (create-array (:struct vksubpasssamplelocationsext)
;;        ppostsubpasssamplelocations ppostsubpasssamplelocations-arg :dynamic t
;;        :pointers ("VkSubpassSampleLocationsEXT")))
;;      :destroy (destroy-array ppostsubpasssamplelocations) :get
;;      ((&optional ppostsubpasssamplelocations-index)
;;       (get-array (:struct vksubpasssamplelocationsext)
;;        ppostsubpasssamplelocations ppostsubpasssamplelocations-index
;;        postsubpasssamplelocationscount :pointers
;;        ("VkSubpassSampleLocationsEXT")))
;;      :set
;;      ((ppostsubpasssamplelocations-arg &optional
;;        ppostsubpasssamplelocations-index)
;;       (set-array (:struct vksubpasssamplelocationsext)
;;        ppostsubpasssamplelocations ppostsubpasssamplelocations-arg
;;        ppostsubpasssamplelocations-index :dynamic t :pointers
;;        ("VkSubpassSampleLocationsEXT")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineSampleLocationsStateCreateInfoEXT"
;;       (pipeline-sample-locations-state-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (samplelocationsenable :name "sampleLocationsEnable" :type "VkBool32")
;;     (samplelocationsinfo :pointer t :name "sampleLocationsInfo" :type
;;      "VkSampleLocationsInfoEXT" :create
;;      ((samplelocationsinfo-arg)
;;       (copy-object samplelocationsinfo samplelocationsinfo-arg
;;        '(:struct vksamplelocationsinfoext)))
;;      :set
;;      ((samplelocationsinfo-arg)
;;       (copy-object samplelocationsinfo samplelocationsinfo-arg
;;        '(:struct vksamplelocationsinfoext)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSampleLocationsPropertiesEXT"
;;       (physical-device-sample-locations-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (samplelocationsamplecounts :name "sampleLocationSampleCounts" :type
;;      "VkSampleCountFlags")
;;     (maxsamplelocationgridsize :pointer t :name "maxSampleLocationGridSize"
;;      :type "VkExtent2D" :create
;;      ((maxsamplelocationgridsize-arg)
;;       (copy-object maxsamplelocationgridsize maxsamplelocationgridsize-arg
;;        '(:struct vkextent2d)))
;;      :set
;;      ((maxsamplelocationgridsize-arg)
;;       (copy-object maxsamplelocationgridsize maxsamplelocationgridsize-arg
;;        '(:struct vkextent2d))))
;;     (samplelocationcoordinaterange :name "sampleLocationCoordinateRange" :type
;;      float :create
;;      ((samplelocationcoordinaterange-arg)
;;       (create-array :float samplelocationcoordinaterange
;;        samplelocationcoordinaterange-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional samplelocationcoordinaterange-index)
;;       (get-array :float samplelocationcoordinaterange
;;        samplelocationcoordinaterange-index 2 :pointers nil))
;;      :set
;;      ((samplelocationcoordinaterange-arg &optional
;;        samplelocationcoordinaterange-index)
;;       (set-array :float samplelocationcoordinaterange
;;        samplelocationcoordinaterange-arg samplelocationcoordinaterange-index
;;        :dynamic nil :pointers nil)))
;;     (samplelocationsubpixelbits :name "sampleLocationSubPixelBits" :type uint32)
;;     (variablesamplelocations :name "variableSampleLocations" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMultisamplePropertiesEXT"
;;       (multisample-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxsamplelocationgridsize :pointer t :name "maxSampleLocationGridSize"
;;      :type "VkExtent2D" :create
;;      ((maxsamplelocationgridsize-arg)
;;       (copy-object maxsamplelocationgridsize maxsamplelocationgridsize-arg
;;        '(:struct vkextent2d)))
;;      :set
;;      ((maxsamplelocationgridsize-arg)
;;       (copy-object maxsamplelocationgridsize maxsamplelocationgridsize-arg
;;        '(:struct vkextent2d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT"
;;       (physical-device-blend-operation-advanced-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (advancedblendcoherentoperations :name "advancedBlendCoherentOperations"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT"
;;       (physical-device-blend-operation-advanced-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (advancedblendmaxcolorattachments :name "advancedBlendMaxColorAttachments"
;;      :type uint32)
;;     (advancedblendindependentblend :name "advancedBlendIndependentBlend" :type
;;      "VkBool32")
;;     (advancedblendnonpremultipliedsrccolor :name
;;      "advancedBlendNonPremultipliedSrcColor" :type "VkBool32")
;;     (advancedblendnonpremultiplieddstcolor :name
;;      "advancedBlendNonPremultipliedDstColor" :type "VkBool32")
;;     (advancedblendcorrelatedoverlap :name "advancedBlendCorrelatedOverlap"
;;      :type "VkBool32")
;;     (advancedblendalloperations :name "advancedBlendAllOperations" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineColorBlendAdvancedStateCreateInfoEXT"
;;       (pipeline-color-blend-advanced-state-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (srcpremultiplied :name "srcPremultiplied" :type "VkBool32")
;;     (dstpremultiplied :name "dstPremultiplied" :type "VkBool32")
;;     (blendoverlap :name "blendOverlap" :type "VkBlendOverlapEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineCoverageToColorStateCreateInfoNV"
;;       (pipeline-coverage-to-color-state-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineCoverageToColorStateCreateFlagsNV")
;;     (coveragetocolorenable :name "coverageToColorEnable" :type "VkBool32")
;;     (coveragetocolorlocation :name "coverageToColorLocation" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineCoverageModulationStateCreateInfoNV"
;;       (pipeline-coverage-modulation-state-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineCoverageModulationStateCreateFlagsNV")
;;     (coveragemodulationmode :name "coverageModulationMode" :type
;;      "VkCoverageModulationModeNV")
;;     (coveragemodulationtableenable :name "coverageModulationTableEnable" :type
;;      "VkBool32")
;;     (coveragemodulationtablecount :name "coverageModulationTableCount" :type
;;      uint32)
;;     (pcoveragemodulationtable :name "pCoverageModulationTable" :type float
;;      :init-form nil :create
;;      ((pcoveragemodulationtable-arg)
;;       (create-array :float pcoveragemodulationtable
;;        pcoveragemodulationtable-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pcoveragemodulationtable) :get
;;      ((&optional pcoveragemodulationtable-index)
;;       (get-array :float pcoveragemodulationtable pcoveragemodulationtable-index
;;        coveragemodulationtablecount :pointers nil))
;;      :set
;;      ((pcoveragemodulationtable-arg &optional pcoveragemodulationtable-index)
;;       (set-array :float pcoveragemodulationtable pcoveragemodulationtable-arg
;;        pcoveragemodulationtable-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderSMBuiltinsPropertiesNV"
;;       (physical-device-shader-s-m-builtins-properties-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadersmcount :name "shaderSMCount" :type uint32)
;;     (shaderwarpspersm :name "shaderWarpsPerSM" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderSMBuiltinsFeaturesNV"
;;       (physical-device-shader-s-m-builtins-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadersmbuiltins :name "shaderSMBuiltins" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDrmFormatModifierPropertiesEXT"
;;       (drm-format-modifier-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (drmformatmodifier :name "drmFormatModifier" :type uint64)
;;     (drmformatmodifierplanecount :name "drmFormatModifierPlaneCount" :type
;;      uint32)
;;     (drmformatmodifiertilingfeatures :name "drmFormatModifierTilingFeatures"
;;      :type "VkFormatFeatureFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDrmFormatModifierPropertiesListEXT"
;;       (drm-format-modifier-properties-list-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (drmformatmodifiercount :name "drmFormatModifierCount" :type uint32)
;;     (pdrmformatmodifierproperties :name "pDrmFormatModifierProperties" :type
;;      "VkDrmFormatModifierPropertiesEXT" :init-form nil :create
;;      ((pdrmformatmodifierproperties-arg)
;;       (create-array (:struct vkdrmformatmodifierpropertiesext)
;;        pdrmformatmodifierproperties pdrmformatmodifierproperties-arg :dynamic t
;;        :pointers ("VkDrmFormatModifierPropertiesEXT")))
;;      :destroy (destroy-array pdrmformatmodifierproperties) :get
;;      ((&optional pdrmformatmodifierproperties-index)
;;       (get-array (:struct vkdrmformatmodifierpropertiesext)
;;        pdrmformatmodifierproperties pdrmformatmodifierproperties-index
;;        drmformatmodifiercount :pointers ("VkDrmFormatModifierPropertiesEXT")))
;;      :set
;;      ((pdrmformatmodifierproperties-arg &optional
;;        pdrmformatmodifierproperties-index)
;;       (set-array (:struct vkdrmformatmodifierpropertiesext)
;;        pdrmformatmodifierproperties pdrmformatmodifierproperties-arg
;;        pdrmformatmodifierproperties-index :dynamic t :pointers
;;        ("VkDrmFormatModifierPropertiesEXT")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceImageDrmFormatModifierInfoEXT"
;;       (physical-device-image-drm-format-modifier-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (drmformatmodifier :name "drmFormatModifier" :type uint64)
;;     (sharingmode :name "sharingMode" :type "VkSharingMode")
;;     (queuefamilyindexcount :name "queueFamilyIndexCount" :type uint32)
;;     (pqueuefamilyindices :name "pQueueFamilyIndices" :type uint32 :init-form
;;      nil :create
;;      ((pqueuefamilyindices-arg)
;;       (create-array :uint32 pqueuefamilyindices pqueuefamilyindices-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pqueuefamilyindices) :get
;;      ((&optional pqueuefamilyindices-index)
;;       (get-array :uint32 pqueuefamilyindices pqueuefamilyindices-index
;;        queuefamilyindexcount :pointers nil))
;;      :set
;;      ((pqueuefamilyindices-arg &optional pqueuefamilyindices-index)
;;       (set-array :uint32 pqueuefamilyindices pqueuefamilyindices-arg
;;        pqueuefamilyindices-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageDrmFormatModifierListCreateInfoEXT"
;;       (image-drm-format-modifier-list-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (drmformatmodifiercount :name "drmFormatModifierCount" :type uint32)
;;     (pdrmformatmodifiers :name "pDrmFormatModifiers" :type uint64 :init-form
;;      nil :create
;;      ((pdrmformatmodifiers-arg)
;;       (create-array :uint64 pdrmformatmodifiers pdrmformatmodifiers-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pdrmformatmodifiers) :get
;;      ((&optional pdrmformatmodifiers-index)
;;       (get-array :uint64 pdrmformatmodifiers pdrmformatmodifiers-index
;;        drmformatmodifiercount :pointers nil))
;;      :set
;;      ((pdrmformatmodifiers-arg &optional pdrmformatmodifiers-index)
;;       (set-array :uint64 pdrmformatmodifiers pdrmformatmodifiers-arg
;;        pdrmformatmodifiers-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageDrmFormatModifierExplicitCreateInfoEXT"
;;       (image-drm-format-modifier-explicit-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (drmformatmodifier :name "drmFormatModifier" :type uint64)
;;     (drmformatmodifierplanecount :name "drmFormatModifierPlaneCount" :type
;;      uint32)
;;     (pplanelayouts :name "pPlaneLayouts" :type "VkSubresourceLayout" :init-form
;;      nil :create
;;      ((pplanelayouts-arg)
;;       (create-array (:struct vksubresourcelayout) pplanelayouts
;;        pplanelayouts-arg :dynamic t :pointers ("VkSubresourceLayout")))
;;      :destroy (destroy-array pplanelayouts) :get
;;      ((&optional pplanelayouts-index)
;;       (get-array (:struct vksubresourcelayout) pplanelayouts
;;        pplanelayouts-index drmformatmodifierplanecount :pointers
;;        ("VkSubresourceLayout")))
;;      :set
;;      ((pplanelayouts-arg &optional pplanelayouts-index)
;;       (set-array (:struct vksubresourcelayout) pplanelayouts pplanelayouts-arg
;;        pplanelayouts-index :dynamic t :pointers ("VkSubresourceLayout")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageDrmFormatModifierPropertiesEXT"
;;       (image-drm-format-modifier-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (drmformatmodifier :name "drmFormatModifier" :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDrmFormatModifierProperties2EXT"
;;       (drm-format-modifier-properties-2-ext)
;;       (:default-create :default-get :default-set)
;;     (drmformatmodifier :name "drmFormatModifier" :type uint64)
;;     (drmformatmodifierplanecount :name "drmFormatModifierPlaneCount" :type
;;      uint32)
;;     (drmformatmodifiertilingfeatures :name "drmFormatModifierTilingFeatures"
;;      :type "VkFormatFeatureFlags2"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDrmFormatModifierPropertiesList2EXT"
;;       (drm-format-modifier-properties-list-2-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (drmformatmodifiercount :name "drmFormatModifierCount" :type uint32)
;;     (pdrmformatmodifierproperties :name "pDrmFormatModifierProperties" :type
;;      "VkDrmFormatModifierProperties2EXT" :init-form nil :create
;;      ((pdrmformatmodifierproperties-arg)
;;       (create-array (:struct vkdrmformatmodifierproperties2ext)
;;        pdrmformatmodifierproperties pdrmformatmodifierproperties-arg :dynamic t
;;        :pointers ("VkDrmFormatModifierProperties2EXT")))
;;      :destroy (destroy-array pdrmformatmodifierproperties) :get
;;      ((&optional pdrmformatmodifierproperties-index)
;;       (get-array (:struct vkdrmformatmodifierproperties2ext)
;;        pdrmformatmodifierproperties pdrmformatmodifierproperties-index
;;        drmformatmodifiercount :pointers ("VkDrmFormatModifierProperties2EXT")))
;;      :set
;;      ((pdrmformatmodifierproperties-arg &optional
;;        pdrmformatmodifierproperties-index)
;;       (set-array (:struct vkdrmformatmodifierproperties2ext)
;;        pdrmformatmodifierproperties pdrmformatmodifierproperties-arg
;;        pdrmformatmodifierproperties-index :dynamic t :pointers
;;        ("VkDrmFormatModifierProperties2EXT")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkValidationCacheCreateInfoEXT"
;;       (validation-cache-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkValidationCacheCreateFlagsEXT")
;;     (initialdatasize :name "initialDataSize" :type size)
;;     (pinitialdata :name "pInitialData" :type void :init-form nil :create
;;      ((pinitialdata-arg) (create-pointer pinitialdata pinitialdata-arg)) :get
;;      (nil (get-pointer pinitialdata)) :set
;;      ((pinitialdata-arg) (set-pointer pinitialdata pinitialdata-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkShaderModuleValidationCacheCreateInfoEXT"
;;       (shader-module-validation-cache-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (validationcache :name "validationCache" :type "VkValidationCacheEXT"
;;      :create
;;      ((validationcache-arg)
;;       (create-pointer validationcache validationcache-arg))
;;      :get (nil (get-pointer validationcache)) :set
;;      ((validationcache-arg) (set-pointer validationcache validationcache-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkShadingRatePaletteNV"
;;       (shading-rate-palette-nv)
;;       (:default-create :default-get :default-set)
;;     (shadingratepaletteentrycount :name "shadingRatePaletteEntryCount" :type
;;      uint32)
;;     (pshadingratepaletteentries :name "pShadingRatePaletteEntries" :type
;;      "VkShadingRatePaletteEntryNV" :init-form nil :create
;;      ((pshadingratepaletteentries-arg)
;;       (create-array vkshadingratepaletteentrynv pshadingratepaletteentries
;;        pshadingratepaletteentries-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pshadingratepaletteentries) :get
;;      ((&optional pshadingratepaletteentries-index)
;;       (get-array vkshadingratepaletteentrynv pshadingratepaletteentries
;;        pshadingratepaletteentries-index shadingratepaletteentrycount :pointers
;;        nil))
;;      :set
;;      ((pshadingratepaletteentries-arg &optional
;;        pshadingratepaletteentries-index)
;;       (set-array vkshadingratepaletteentrynv pshadingratepaletteentries
;;        pshadingratepaletteentries-arg pshadingratepaletteentries-index :dynamic
;;        t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineViewportShadingRateImageStateCreateInfoNV"
;;       (pipeline-viewport-shading-rate-image-state-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadingrateimageenable :name "shadingRateImageEnable" :type "VkBool32")
;;     (viewportcount :name "viewportCount" :type uint32)
;;     (pshadingratepalettes :name "pShadingRatePalettes" :type
;;      "VkShadingRatePaletteNV" :init-form nil :create
;;      ((pshadingratepalettes-arg)
;;       (create-array (:struct vkshadingratepalettenv) pshadingratepalettes
;;        pshadingratepalettes-arg :dynamic t :pointers
;;        ("VkShadingRatePaletteNV")))
;;      :destroy (destroy-array pshadingratepalettes) :get
;;      ((&optional pshadingratepalettes-index)
;;       (get-array (:struct vkshadingratepalettenv) pshadingratepalettes
;;        pshadingratepalettes-index viewportcount :pointers
;;        ("VkShadingRatePaletteNV")))
;;      :set
;;      ((pshadingratepalettes-arg &optional pshadingratepalettes-index)
;;       (set-array (:struct vkshadingratepalettenv) pshadingratepalettes
;;        pshadingratepalettes-arg pshadingratepalettes-index :dynamic t :pointers
;;        ("VkShadingRatePaletteNV")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShadingRateImageFeaturesNV"
;;       (physical-device-shading-rate-image-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadingrateimage :name "shadingRateImage" :type "VkBool32")
;;     (shadingratecoarsesampleorder :name "shadingRateCoarseSampleOrder" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShadingRateImagePropertiesNV"
;;       (physical-device-shading-rate-image-properties-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadingratetexelsize :pointer t :name "shadingRateTexelSize" :type
;;      "VkExtent2D" :create
;;      ((shadingratetexelsize-arg)
;;       (copy-object shadingratetexelsize shadingratetexelsize-arg
;;        '(:struct vkextent2d)))
;;      :set
;;      ((shadingratetexelsize-arg)
;;       (copy-object shadingratetexelsize shadingratetexelsize-arg
;;        '(:struct vkextent2d))))
;;     (shadingratepalettesize :name "shadingRatePaletteSize" :type uint32)
;;     (shadingratemaxcoarsesamples :name "shadingRateMaxCoarseSamples" :type
;;      uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCoarseSampleLocationNV"
;;       (coarse-sample-location-nv)
;;       (:default-create :default-get :default-set)
;;     (pixelx :name "pixelX" :type uint32)
;;     (pixely :name "pixelY" :type uint32)
;;     (sample :name sample :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCoarseSampleOrderCustomNV"
;;       (coarse-sample-order-custom-nv)
;;       (:default-create :default-get :default-set)
;;     (shadingrate :name "shadingRate" :type "VkShadingRatePaletteEntryNV")
;;     (samplecount :name "sampleCount" :type uint32)
;;     (samplelocationcount :name "sampleLocationCount" :type uint32)
;;     (psamplelocations :name "pSampleLocations" :type "VkCoarseSampleLocationNV"
;;      :init-form nil :create
;;      ((psamplelocations-arg)
;;       (create-array (:struct vkcoarsesamplelocationnv) psamplelocations
;;        psamplelocations-arg :dynamic t :pointers ("VkCoarseSampleLocationNV")))
;;      :destroy (destroy-array psamplelocations) :get
;;      ((&optional psamplelocations-index)
;;       (get-array (:struct vkcoarsesamplelocationnv) psamplelocations
;;        psamplelocations-index samplelocationcount :pointers
;;        ("VkCoarseSampleLocationNV")))
;;      :set
;;      ((psamplelocations-arg &optional psamplelocations-index)
;;       (set-array (:struct vkcoarsesamplelocationnv) psamplelocations
;;        psamplelocations-arg psamplelocations-index :dynamic t :pointers
;;        ("VkCoarseSampleLocationNV")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineViewportCoarseSampleOrderStateCreateInfoNV"
;;       (pipeline-viewport-coarse-sample-order-state-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (sampleordertype :name "sampleOrderType" :type "VkCoarseSampleOrderTypeNV")
;;     (customsampleordercount :name "customSampleOrderCount" :type uint32)
;;     (pcustomsampleorders :name "pCustomSampleOrders" :type
;;      "VkCoarseSampleOrderCustomNV" :init-form nil :create
;;      ((pcustomsampleorders-arg)
;;       (create-array (:struct vkcoarsesampleordercustomnv) pcustomsampleorders
;;        pcustomsampleorders-arg :dynamic t :pointers
;;        ("VkCoarseSampleOrderCustomNV")))
;;      :destroy (destroy-array pcustomsampleorders) :get
;;      ((&optional pcustomsampleorders-index)
;;       (get-array (:struct vkcoarsesampleordercustomnv) pcustomsampleorders
;;        pcustomsampleorders-index customsampleordercount :pointers
;;        ("VkCoarseSampleOrderCustomNV")))
;;      :set
;;      ((pcustomsampleorders-arg &optional pcustomsampleorders-index)
;;       (set-array (:struct vkcoarsesampleordercustomnv) pcustomsampleorders
;;        pcustomsampleorders-arg pcustomsampleorders-index :dynamic t :pointers
;;        ("VkCoarseSampleOrderCustomNV")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRayTracingShaderGroupCreateInfoNV"
;;       (ray-tracing-shader-group-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (type :name type :type "VkRayTracingShaderGroupTypeKHR")
;;     (generalshader :name "generalShader" :type uint32)
;;     (closesthitshader :name "closestHitShader" :type uint32)
;;     (anyhitshader :name "anyHitShader" :type uint32)
;;     (intersectionshader :name "intersectionShader" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRayTracingPipelineCreateInfoNV"
;;       (ray-tracing-pipeline-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineCreateFlags")
;;     (stagecount :name "stageCount" :type uint32)
;;     (pstages :name "pStages" :type "VkPipelineShaderStageCreateInfo" :init-form
;;      nil :create
;;      ((pstages-arg)
;;       (create-array (:struct vkpipelineshaderstagecreateinfo) pstages
;;        pstages-arg :dynamic t :pointers ("VkPipelineShaderStageCreateInfo")))
;;      :destroy (destroy-array pstages) :get
;;      ((&optional pstages-index)
;;       (get-array (:struct vkpipelineshaderstagecreateinfo) pstages
;;        pstages-index stagecount :pointers ("VkPipelineShaderStageCreateInfo")))
;;      :set
;;      ((pstages-arg &optional pstages-index)
;;       (set-array (:struct vkpipelineshaderstagecreateinfo) pstages pstages-arg
;;        pstages-index :dynamic t :pointers ("VkPipelineShaderStageCreateInfo"))))
;;     (groupcount :name "groupCount" :type uint32)
;;     (pgroups :name "pGroups" :type "VkRayTracingShaderGroupCreateInfoNV"
;;      :init-form nil :create
;;      ((pgroups-arg)
;;       (create-array (:struct vkraytracingshadergroupcreateinfonv) pgroups
;;        pgroups-arg :dynamic t :pointers
;;        ("VkRayTracingShaderGroupCreateInfoNV")))
;;      :destroy (destroy-array pgroups) :get
;;      ((&optional pgroups-index)
;;       (get-array (:struct vkraytracingshadergroupcreateinfonv) pgroups
;;        pgroups-index groupcount :pointers
;;        ("VkRayTracingShaderGroupCreateInfoNV")))
;;      :set
;;      ((pgroups-arg &optional pgroups-index)
;;       (set-array (:struct vkraytracingshadergroupcreateinfonv) pgroups
;;        pgroups-arg pgroups-index :dynamic t :pointers
;;        ("VkRayTracingShaderGroupCreateInfoNV"))))
;;     (maxrecursiondepth :name "maxRecursionDepth" :type uint32)
;;     (layout :name layout :type "VkPipelineLayout" :create
;;      ((layout-arg) (create-pointer layout layout-arg)) :get
;;      (nil (get-pointer layout)) :set
;;      ((layout-arg) (set-pointer layout layout-arg)))
;;     (basepipelinehandle :name "basePipelineHandle" :type "VkPipeline" :create
;;      ((basepipelinehandle-arg)
;;       (create-pointer basepipelinehandle basepipelinehandle-arg))
;;      :get (nil (get-pointer basepipelinehandle)) :set
;;      ((basepipelinehandle-arg)
;;       (set-pointer basepipelinehandle basepipelinehandle-arg)))
;;     (basepipelineindex :name "basePipelineIndex" :type int32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkGeometryTrianglesNV"
;;       (geometry-triangles-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (vertexdata :name "vertexData" :type "VkBuffer" :create
;;      ((vertexdata-arg) (create-pointer vertexdata vertexdata-arg)) :get
;;      (nil (get-pointer vertexdata)) :set
;;      ((vertexdata-arg) (set-pointer vertexdata vertexdata-arg)))
;;     (vertexoffset :name "vertexOffset" :type "VkDeviceSize")
;;     (vertexcount :name "vertexCount" :type uint32)
;;     (vertexstride :name "vertexStride" :type "VkDeviceSize")
;;     (vertexformat :name "vertexFormat" :type "VkFormat")
;;     (indexdata :name "indexData" :type "VkBuffer" :create
;;      ((indexdata-arg) (create-pointer indexdata indexdata-arg)) :get
;;      (nil (get-pointer indexdata)) :set
;;      ((indexdata-arg) (set-pointer indexdata indexdata-arg)))
;;     (indexoffset :name "indexOffset" :type "VkDeviceSize")
;;     (indexcount :name "indexCount" :type uint32)
;;     (indextype :name "indexType" :type "VkIndexType")
;;     (transformdata :name "transformData" :type "VkBuffer" :create
;;      ((transformdata-arg) (create-pointer transformdata transformdata-arg))
;;      :get (nil (get-pointer transformdata)) :set
;;      ((transformdata-arg) (set-pointer transformdata transformdata-arg)))
;;     (transformoffset :name "transformOffset" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkGeometryAABBNV"
;;       (geometry-a-a-b-b-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (aabbdata :name "aabbData" :type "VkBuffer" :create
;;      ((aabbdata-arg) (create-pointer aabbdata aabbdata-arg)) :get
;;      (nil (get-pointer aabbdata)) :set
;;      ((aabbdata-arg) (set-pointer aabbdata aabbdata-arg)))
;;     (numaabbs :name "numAABBs" :type uint32)
;;     (stride :name stride :type uint32)
;;     (offset :name offset :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkGeometryDataNV"
;;       (geometry-data-nv)
;;       (:default-create :default-get :default-set)
;;     (triangles :pointer t :name triangles :type "VkGeometryTrianglesNV" :create
;;      ((triangles-arg)
;;       (copy-object triangles triangles-arg '(:struct vkgeometrytrianglesnv)))
;;      :set
;;      ((triangles-arg)
;;       (copy-object triangles triangles-arg '(:struct vkgeometrytrianglesnv))))
;;     (aabbs :pointer t :name aabbs :type "VkGeometryAABBNV" :create
;;      ((aabbs-arg) (copy-object aabbs aabbs-arg '(:struct vkgeometryaabbnv)))
;;      :set
;;      ((aabbs-arg) (copy-object aabbs aabbs-arg '(:struct vkgeometryaabbnv)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkGeometryNV"
;;       (geometry-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (geometrytype :name "geometryType" :type "VkGeometryTypeKHR")
;;     (geometry :pointer t :name geometry :type "VkGeometryDataNV" :create
;;      ((geometry-arg)
;;       (copy-object geometry geometry-arg '(:struct vkgeometrydatanv)))
;;      :set
;;      ((geometry-arg)
;;       (copy-object geometry geometry-arg '(:struct vkgeometrydatanv))))
;;     (flags :name flags :type "VkGeometryFlagsKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureInfoNV"
;;       (acceleration-structure-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (type :name type :type "VkAccelerationStructureTypeNV")
;;     (flags :name flags :type "VkBuildAccelerationStructureFlagsNV")
;;     (instancecount :name "instanceCount" :type uint32)
;;     (geometrycount :name "geometryCount" :type uint32)
;;     (pgeometries :name "pGeometries" :type "VkGeometryNV" :init-form nil
;;      :create
;;      ((pgeometries-arg)
;;       (create-array (:struct vkgeometrynv) pgeometries pgeometries-arg :dynamic
;;        t :pointers ("VkGeometryNV")))
;;      :destroy (destroy-array pgeometries) :get
;;      ((&optional pgeometries-index)
;;       (get-array (:struct vkgeometrynv) pgeometries pgeometries-index
;;        geometrycount :pointers ("VkGeometryNV")))
;;      :set
;;      ((pgeometries-arg &optional pgeometries-index)
;;       (set-array (:struct vkgeometrynv) pgeometries pgeometries-arg
;;        pgeometries-index :dynamic t :pointers ("VkGeometryNV")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureCreateInfoNV"
;;       (acceleration-structure-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (compactedsize :name "compactedSize" :type "VkDeviceSize")
;;     (info :pointer t :name info :type "VkAccelerationStructureInfoNV" :create
;;      ((info-arg)
;;       (copy-object info info-arg '(:struct vkaccelerationstructureinfonv)))
;;      :set
;;      ((info-arg)
;;       (copy-object info info-arg '(:struct vkaccelerationstructureinfonv)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindAccelerationStructureMemoryInfoNV"
;;       (bind-acceleration-structure-memory-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (accelerationstructure :name "accelerationStructure" :type
;;      "VkAccelerationStructureNV" :create
;;      ((accelerationstructure-arg)
;;       (create-pointer accelerationstructure accelerationstructure-arg))
;;      :get (nil (get-pointer accelerationstructure)) :set
;;      ((accelerationstructure-arg)
;;       (set-pointer accelerationstructure accelerationstructure-arg)))
;;     (memory :name memory :type "VkDeviceMemory" :create
;;      ((memory-arg) (create-pointer memory memory-arg)) :get
;;      (nil (get-pointer memory)) :set
;;      ((memory-arg) (set-pointer memory memory-arg)))
;;     (memoryoffset :name "memoryOffset" :type "VkDeviceSize")
;;     (deviceindexcount :name "deviceIndexCount" :type uint32)
;;     (pdeviceindices :name "pDeviceIndices" :type uint32 :init-form nil :create
;;      ((pdeviceindices-arg)
;;       (create-array :uint32 pdeviceindices pdeviceindices-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pdeviceindices) :get
;;      ((&optional pdeviceindices-index)
;;       (get-array :uint32 pdeviceindices pdeviceindices-index deviceindexcount
;;        :pointers nil))
;;      :set
;;      ((pdeviceindices-arg &optional pdeviceindices-index)
;;       (set-array :uint32 pdeviceindices pdeviceindices-arg pdeviceindices-index
;;        :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkWriteDescriptorSetAccelerationStructureNV"
;;       (write-descriptor-set-acceleration-structure-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (accelerationstructurecount :name "accelerationStructureCount" :type uint32)
;;     (paccelerationstructures :name "pAccelerationStructures" :type
;;      "VkAccelerationStructureNV" :init-form nil :create
;;      ((paccelerationstructures-arg)
;;       (create-array vkaccelerationstructurenv paccelerationstructures
;;        paccelerationstructures-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array paccelerationstructures) :get
;;      ((&optional paccelerationstructures-index)
;;       (get-array vkaccelerationstructurenv paccelerationstructures
;;        paccelerationstructures-index accelerationstructurecount :pointers nil))
;;      :set
;;      ((paccelerationstructures-arg &optional paccelerationstructures-index)
;;       (set-array vkaccelerationstructurenv paccelerationstructures
;;        paccelerationstructures-arg paccelerationstructures-index :dynamic t
;;        :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureMemoryRequirementsInfoNV"
;;       (acceleration-structure-memory-requirements-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (type :name type :type "VkAccelerationStructureMemoryRequirementsTypeNV")
;;     (accelerationstructure :name "accelerationStructure" :type
;;      "VkAccelerationStructureNV" :create
;;      ((accelerationstructure-arg)
;;       (create-pointer accelerationstructure accelerationstructure-arg))
;;      :get (nil (get-pointer accelerationstructure)) :set
;;      ((accelerationstructure-arg)
;;       (set-pointer accelerationstructure accelerationstructure-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRayTracingPropertiesNV"
;;       (physical-device-ray-tracing-properties-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadergrouphandlesize :name "shaderGroupHandleSize" :type uint32)
;;     (maxrecursiondepth :name "maxRecursionDepth" :type uint32)
;;     (maxshadergroupstride :name "maxShaderGroupStride" :type uint32)
;;     (shadergroupbasealignment :name "shaderGroupBaseAlignment" :type uint32)
;;     (maxgeometrycount :name "maxGeometryCount" :type uint64)
;;     (maxinstancecount :name "maxInstanceCount" :type uint64)
;;     (maxtrianglecount :name "maxTriangleCount" :type uint64)
;;     (maxdescriptorsetaccelerationstructures :name
;;      "maxDescriptorSetAccelerationStructures" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkTransformMatrixKHR"
;;       (transform-matrix-nv transform-matrix-khr)
;;       (:default-create :default-get :default-set)
;;     (matrix :name matrix :type float :create
;;      ((matrix-arg)
;;       (create-array :float matrix matrix-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional matrix-index)
;;       (get-array :float matrix matrix-index 12 :pointers nil))
;;      :set
;;      ((matrix-arg &optional matrix-index)
;;       (set-array :float matrix matrix-arg matrix-index :dynamic nil :pointers
;;        nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAabbPositionsKHR"
;;       (aabb-positions-nv aabb-positions-khr)
;;       (:default-create :default-get :default-set)
;;     (minx :name "minX" :type float)
;;     (miny :name "minY" :type float)
;;     (minz :name "minZ" :type float)
;;     (maxx :name "maxX" :type float)
;;     (maxy :name "maxY" :type float)
;;     (maxz :name "maxZ" :type float))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureInstanceKHR"
;;       (acceleration-structure-instance-nv acceleration-structure-instance-khr)
;;       (:default-create :default-get :default-set)
;;     (transform :pointer t :name transform :type "VkTransformMatrixKHR" :create
;;      ((transform-arg)
;;       (copy-object transform transform-arg '(:struct vktransformmatrixkhr)))
;;      :set
;;      ((transform-arg)
;;       (copy-object transform transform-arg '(:struct vktransformmatrixkhr))))
;;     (instancecustomindex :name "instanceCustomIndex" :type uint32)
;;     (instanceshaderbindingtablerecordoffset :name
;;      "instanceShaderBindingTableRecordOffset" :type uint32)
;;     (accelerationstructurereference :name "accelerationStructureReference"
;;      :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV"
;;       (physical-device-representative-fragment-test-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (representativefragmenttest :name "representativeFragmentTest" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineRepresentativeFragmentTestStateCreateInfoNV"
;;       (pipeline-representative-fragment-test-state-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (representativefragmenttestenable :name "representativeFragmentTestEnable"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceImageViewImageFormatInfoEXT"
;;       (physical-device-image-view-image-format-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imageviewtype :name "imageViewType" :type "VkImageViewType"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFilterCubicImageViewImageFormatPropertiesEXT"
;;       (filter-cubic-image-view-image-format-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (filtercubic :name "filterCubic" :type "VkBool32")
;;     (filtercubicminmax :name "filterCubicMinmax" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImportMemoryHostPointerInfoEXT"
;;       (import-memory-host-pointer-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (handletype :name "handleType" :type "VkExternalMemoryHandleTypeFlagBits")
;;     (phostpointer :name "pHostPointer" :type void :init-form nil :create
;;      ((phostpointer-arg) (create-pointer phostpointer phostpointer-arg)) :get
;;      (nil (get-pointer phostpointer)) :set
;;      ((phostpointer-arg) (set-pointer phostpointer phostpointer-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryHostPointerPropertiesEXT"
;;       (memory-host-pointer-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (memorytypebits :name "memoryTypeBits" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceExternalMemoryHostPropertiesEXT"
;;       (physical-device-external-memory-host-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (minimportedhostpointeralignment :name "minImportedHostPointerAlignment"
;;      :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineCompilerControlCreateInfoAMD"
;;       (pipeline-compiler-control-create-info-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (compilercontrolflags :name "compilerControlFlags" :type
;;      "VkPipelineCompilerControlFlagsAMD"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCalibratedTimestampInfoEXT"
;;       (calibrated-timestamp-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (timedomain :name "timeDomain" :type "VkTimeDomainEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderCorePropertiesAMD"
;;       (physical-device-shader-core-properties-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderenginecount :name "shaderEngineCount" :type uint32)
;;     (shaderarraysperenginecount :name "shaderArraysPerEngineCount" :type uint32)
;;     (computeunitspershaderarray :name "computeUnitsPerShaderArray" :type uint32)
;;     (simdpercomputeunit :name "simdPerComputeUnit" :type uint32)
;;     (wavefrontspersimd :name "wavefrontsPerSimd" :type uint32)
;;     (wavefrontsize :name "wavefrontSize" :type uint32)
;;     (sgprspersimd :name "sgprsPerSimd" :type uint32)
;;     (minsgprallocation :name "minSgprAllocation" :type uint32)
;;     (maxsgprallocation :name "maxSgprAllocation" :type uint32)
;;     (sgprallocationgranularity :name "sgprAllocationGranularity" :type uint32)
;;     (vgprspersimd :name "vgprsPerSimd" :type uint32)
;;     (minvgprallocation :name "minVgprAllocation" :type uint32)
;;     (maxvgprallocation :name "maxVgprAllocation" :type uint32)
;;     (vgprallocationgranularity :name "vgprAllocationGranularity" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceMemoryOverallocationCreateInfoAMD"
;;       (device-memory-overallocation-create-info-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (overallocationbehavior :name "overallocationBehavior" :type
;;      "VkMemoryOverallocationBehaviorAMD"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT"
;;       (physical-device-vertex-attribute-divisor-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxvertexattribdivisor :name "maxVertexAttribDivisor" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkVertexInputBindingDivisorDescriptionEXT"
;;       (vertex-input-binding-divisor-description-ext)
;;       (:default-create :default-get :default-set)
;;     (binding :name binding :type uint32)
;;     (divisor :name divisor :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineVertexInputDivisorStateCreateInfoEXT"
;;       (pipeline-vertex-input-divisor-state-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (vertexbindingdivisorcount :name "vertexBindingDivisorCount" :type uint32)
;;     (pvertexbindingdivisors :name "pVertexBindingDivisors" :type
;;      "VkVertexInputBindingDivisorDescriptionEXT" :init-form nil :create
;;      ((pvertexbindingdivisors-arg)
;;       (create-array (:struct vkvertexinputbindingdivisordescriptionext)
;;        pvertexbindingdivisors pvertexbindingdivisors-arg :dynamic t :pointers
;;        ("VkVertexInputBindingDivisorDescriptionEXT")))
;;      :destroy (destroy-array pvertexbindingdivisors) :get
;;      ((&optional pvertexbindingdivisors-index)
;;       (get-array (:struct vkvertexinputbindingdivisordescriptionext)
;;        pvertexbindingdivisors pvertexbindingdivisors-index
;;        vertexbindingdivisorcount :pointers
;;        ("VkVertexInputBindingDivisorDescriptionEXT")))
;;      :set
;;      ((pvertexbindingdivisors-arg &optional pvertexbindingdivisors-index)
;;       (set-array (:struct vkvertexinputbindingdivisordescriptionext)
;;        pvertexbindingdivisors pvertexbindingdivisors-arg
;;        pvertexbindingdivisors-index :dynamic t :pointers
;;        ("VkVertexInputBindingDivisorDescriptionEXT")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT"
;;       (physical-device-vertex-attribute-divisor-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (vertexattributeinstanceratedivisor :name
;;      "vertexAttributeInstanceRateDivisor" :type "VkBool32")
;;     (vertexattributeinstanceratezerodivisor :name
;;      "vertexAttributeInstanceRateZeroDivisor" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceComputeShaderDerivativesFeaturesNV"
;;       (physical-device-compute-shader-derivatives-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (computederivativegroupquads :name "computeDerivativeGroupQuads" :type
;;      "VkBool32")
;;     (computederivativegrouplinear :name "computeDerivativeGroupLinear" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMeshShaderFeaturesNV"
;;       (physical-device-mesh-shader-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (taskshader :name "taskShader" :type "VkBool32")
;;     (meshshader :name "meshShader" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMeshShaderPropertiesNV"
;;       (physical-device-mesh-shader-properties-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxdrawmeshtaskscount :name "maxDrawMeshTasksCount" :type uint32)
;;     (maxtaskworkgroupinvocations :name "maxTaskWorkGroupInvocations" :type
;;      uint32)
;;     (maxtaskworkgroupsize :name "maxTaskWorkGroupSize" :type uint32 :create
;;      ((maxtaskworkgroupsize-arg)
;;       (create-array :uint32 maxtaskworkgroupsize maxtaskworkgroupsize-arg
;;        :dynamic nil :pointers nil))
;;      :get
;;      ((&optional maxtaskworkgroupsize-index)
;;       (get-array :uint32 maxtaskworkgroupsize maxtaskworkgroupsize-index 3
;;        :pointers nil))
;;      :set
;;      ((maxtaskworkgroupsize-arg &optional maxtaskworkgroupsize-index)
;;       (set-array :uint32 maxtaskworkgroupsize maxtaskworkgroupsize-arg
;;        maxtaskworkgroupsize-index :dynamic nil :pointers nil)))
;;     (maxtasktotalmemorysize :name "maxTaskTotalMemorySize" :type uint32)
;;     (maxtaskoutputcount :name "maxTaskOutputCount" :type uint32)
;;     (maxmeshworkgroupinvocations :name "maxMeshWorkGroupInvocations" :type
;;      uint32)
;;     (maxmeshworkgroupsize :name "maxMeshWorkGroupSize" :type uint32 :create
;;      ((maxmeshworkgroupsize-arg)
;;       (create-array :uint32 maxmeshworkgroupsize maxmeshworkgroupsize-arg
;;        :dynamic nil :pointers nil))
;;      :get
;;      ((&optional maxmeshworkgroupsize-index)
;;       (get-array :uint32 maxmeshworkgroupsize maxmeshworkgroupsize-index 3
;;        :pointers nil))
;;      :set
;;      ((maxmeshworkgroupsize-arg &optional maxmeshworkgroupsize-index)
;;       (set-array :uint32 maxmeshworkgroupsize maxmeshworkgroupsize-arg
;;        maxmeshworkgroupsize-index :dynamic nil :pointers nil)))
;;     (maxmeshtotalmemorysize :name "maxMeshTotalMemorySize" :type uint32)
;;     (maxmeshoutputvertices :name "maxMeshOutputVertices" :type uint32)
;;     (maxmeshoutputprimitives :name "maxMeshOutputPrimitives" :type uint32)
;;     (maxmeshmultiviewviewcount :name "maxMeshMultiviewViewCount" :type uint32)
;;     (meshoutputpervertexgranularity :name "meshOutputPerVertexGranularity"
;;      :type uint32)
;;     (meshoutputperprimitivegranularity :name
;;      "meshOutputPerPrimitiveGranularity" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDrawMeshTasksIndirectCommandNV"
;;       (draw-mesh-tasks-indirect-command-nv)
;;       (:default-create :default-get :default-set)
;;     (taskcount :name "taskCount" :type uint32)
;;     (firsttask :name "firstTask" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderImageFootprintFeaturesNV"
;;       (physical-device-shader-image-footprint-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imagefootprint :name "imageFootprint" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineViewportExclusiveScissorStateCreateInfoNV"
;;       (pipeline-viewport-exclusive-scissor-state-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (exclusivescissorcount :name "exclusiveScissorCount" :type uint32)
;;     (pexclusivescissors :name "pExclusiveScissors" :type "VkRect2D" :init-form
;;      nil :create
;;      ((pexclusivescissors-arg)
;;       (create-array (:struct vkrect2d) pexclusivescissors
;;        pexclusivescissors-arg :dynamic t :pointers ("VkRect2D")))
;;      :destroy (destroy-array pexclusivescissors) :get
;;      ((&optional pexclusivescissors-index)
;;       (get-array (:struct vkrect2d) pexclusivescissors pexclusivescissors-index
;;        exclusivescissorcount :pointers ("VkRect2D")))
;;      :set
;;      ((pexclusivescissors-arg &optional pexclusivescissors-index)
;;       (set-array (:struct vkrect2d) pexclusivescissors pexclusivescissors-arg
;;        pexclusivescissors-index :dynamic t :pointers ("VkRect2D")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceExclusiveScissorFeaturesNV"
;;       (physical-device-exclusive-scissor-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (exclusivescissor :name "exclusiveScissor" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkQueueFamilyCheckpointPropertiesNV"
;;       (queue-family-checkpoint-properties-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (checkpointexecutionstagemask :name "checkpointExecutionStageMask" :type
;;      "VkPipelineStageFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCheckpointDataNV"
;;       (checkpoint-data-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (stage :name stage :type "VkPipelineStageFlagBits")
;;     (pcheckpointmarker :name "pCheckpointMarker" :type void :init-form nil
;;      :create
;;      ((pcheckpointmarker-arg)
;;       (create-pointer pcheckpointmarker pcheckpointmarker-arg))
;;      :get (nil (get-pointer pcheckpointmarker)) :set
;;      ((pcheckpointmarker-arg)
;;       (set-pointer pcheckpointmarker pcheckpointmarker-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL"
;;       (physical-device-shader-integer-functions-2-features-intel)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderintegerfunctions2 :name "shaderIntegerFunctions2" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-union doc-file
;;       "VkPerformanceValueDataINTEL"
;;       (performance-value-data-intel)
;;       (:default-create :default-get :default-set)
;;     (value32 :name value32 :type uint32)
;;     (value64 :name value64 :type uint64)
;;     (valuefloat :name "valueFloat" :type float)
;;     (valuebool :name "valueBool" :type "VkBool32")
;;     (valuestring :name "valueString" :type char :init-form nil :create
;;      ((valuestring-arg) (create-string valuestring valuestring-arg :dynamic t))
;;      :destroy (destroy-string valuestring) :get (nil (get-string valuestring))
;;      :set
;;      ((valuestring-arg) (set-string valuestring valuestring-arg :dynamic t))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPerformanceValueINTEL"
;;       (performance-value-intel)
;;       (:default-create :default-get :default-set)
;;     (type :name type :type "VkPerformanceValueTypeINTEL")
;;     (data :pointer t :name data :type "VkPerformanceValueDataINTEL" :create
;;      ((data-arg)
;;       (copy-object data data-arg '(:union vkperformancevaluedataintel)))
;;      :set
;;      ((data-arg)
;;       (copy-object data data-arg '(:union vkperformancevaluedataintel)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkInitializePerformanceApiInfoINTEL"
;;       (initialize-performance-api-info-intel)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (puserdata :name "pUserData" :type void :init-form nil :create
;;      ((puserdata-arg) (create-pointer puserdata puserdata-arg)) :get
;;      (nil (get-pointer puserdata)) :set
;;      ((puserdata-arg) (set-pointer puserdata puserdata-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkQueryPoolPerformanceQueryCreateInfoINTEL"
;;       (query-pool-create-info-intel
;;        query-pool-performance-query-create-info-intel)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (performancecounterssampling :name "performanceCountersSampling" :type
;;      "VkQueryPoolSamplingModeINTEL"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPerformanceMarkerInfoINTEL"
;;       (performance-marker-info-intel)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (marker :name marker :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPerformanceStreamMarkerInfoINTEL"
;;       (performance-stream-marker-info-intel)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (marker :name marker :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPerformanceOverrideInfoINTEL"
;;       (performance-override-info-intel)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (type :name type :type "VkPerformanceOverrideTypeINTEL")
;;     (enable :name enable :type "VkBool32")
;;     (parameter :name parameter :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPerformanceConfigurationAcquireInfoINTEL"
;;       (performance-configuration-acquire-info-intel)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (type :name type :type "VkPerformanceConfigurationTypeINTEL"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePCIBusInfoPropertiesEXT"
;;       (physical-device-p-c-i-bus-info-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pcidomain :name "pciDomain" :type uint32)
;;     (pcibus :name "pciBus" :type uint32)
;;     (pcidevice :name "pciDevice" :type uint32)
;;     (pcifunction :name "pciFunction" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDisplayNativeHdrSurfaceCapabilitiesAMD"
;;       (display-native-hdr-surface-capabilities-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (localdimmingsupport :name "localDimmingSupport" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSwapchainDisplayNativeHdrCreateInfoAMD"
;;       (swapchain-display-native-hdr-create-info-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (localdimmingenable :name "localDimmingEnable" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentDensityMapFeaturesEXT"
;;       (physical-device-fragment-density-map-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fragmentdensitymap :name "fragmentDensityMap" :type "VkBool32")
;;     (fragmentdensitymapdynamic :name "fragmentDensityMapDynamic" :type
;;      "VkBool32")
;;     (fragmentdensitymapnonsubsampledimages :name
;;      "fragmentDensityMapNonSubsampledImages" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentDensityMapPropertiesEXT"
;;       (physical-device-fragment-density-map-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (minfragmentdensitytexelsize :pointer t :name "minFragmentDensityTexelSize"
;;      :type "VkExtent2D" :create
;;      ((minfragmentdensitytexelsize-arg)
;;       (copy-object minfragmentdensitytexelsize minfragmentdensitytexelsize-arg
;;        '(:struct vkextent2d)))
;;      :set
;;      ((minfragmentdensitytexelsize-arg)
;;       (copy-object minfragmentdensitytexelsize minfragmentdensitytexelsize-arg
;;        '(:struct vkextent2d))))
;;     (maxfragmentdensitytexelsize :pointer t :name "maxFragmentDensityTexelSize"
;;      :type "VkExtent2D" :create
;;      ((maxfragmentdensitytexelsize-arg)
;;       (copy-object maxfragmentdensitytexelsize maxfragmentdensitytexelsize-arg
;;        '(:struct vkextent2d)))
;;      :set
;;      ((maxfragmentdensitytexelsize-arg)
;;       (copy-object maxfragmentdensitytexelsize maxfragmentdensitytexelsize-arg
;;        '(:struct vkextent2d))))
;;     (fragmentdensityinvocations :name "fragmentDensityInvocations" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassFragmentDensityMapCreateInfoEXT"
;;       (render-pass-fragment-density-map-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fragmentdensitymapattachment :pointer t :name
;;      "fragmentDensityMapAttachment" :type "VkAttachmentReference" :create
;;      ((fragmentdensitymapattachment-arg)
;;       (copy-object fragmentdensitymapattachment
;;        fragmentdensitymapattachment-arg '(:struct vkattachmentreference)))
;;      :set
;;      ((fragmentdensitymapattachment-arg)
;;       (copy-object fragmentdensitymapattachment
;;        fragmentdensitymapattachment-arg '(:struct vkattachmentreference)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderCoreProperties2AMD"
;;       (physical-device-shader-core-properties-2-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadercorefeatures :name "shaderCoreFeatures" :type
;;      "VkShaderCorePropertiesFlagsAMD")
;;     (activecomputeunitcount :name "activeComputeUnitCount" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceCoherentMemoryFeaturesAMD"
;;       (physical-device-coherent-memory-features-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (devicecoherentmemory :name "deviceCoherentMemory" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT"
;;       (physical-device-shader-image-atomic-int-6-4-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderimageint64atomics :name "shaderImageInt64Atomics" :type "VkBool32")
;;     (sparseimageint64atomics :name "sparseImageInt64Atomics" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMemoryBudgetPropertiesEXT"
;;       (physical-device-memory-budget-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (heapbudget :name "heapBudget" :type "VkDeviceSize" :create
;;      ((heapbudget-arg)
;;       (create-array vkdevicesize heapbudget heapbudget-arg :dynamic nil
;;        :pointers nil))
;;      :get
;;      ((&optional heapbudget-index)
;;       (get-array vkdevicesize heapbudget heapbudget-index 16 :pointers nil))
;;      :set
;;      ((heapbudget-arg &optional heapbudget-index)
;;       (set-array vkdevicesize heapbudget heapbudget-arg heapbudget-index
;;        :dynamic nil :pointers nil)))
;;     (heapusage :name "heapUsage" :type "VkDeviceSize" :create
;;      ((heapusage-arg)
;;       (create-array vkdevicesize heapusage heapusage-arg :dynamic nil :pointers
;;        nil))
;;      :get
;;      ((&optional heapusage-index)
;;       (get-array vkdevicesize heapusage heapusage-index 16 :pointers nil))
;;      :set
;;      ((heapusage-arg &optional heapusage-index)
;;       (set-array vkdevicesize heapusage heapusage-arg heapusage-index :dynamic
;;        nil :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMemoryPriorityFeaturesEXT"
;;       (physical-device-memory-priority-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (memorypriority :name "memoryPriority" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryPriorityAllocateInfoEXT"
;;       (memory-priority-allocate-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (priority :name priority :type float))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV"
;;       (physical-device-dedicated-allocation-image-aliasing-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (dedicatedallocationimagealiasing :name "dedicatedAllocationImageAliasing"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceBufferDeviceAddressFeaturesEXT"
;;       (physical-device-buffer-address-features-ext
;;        physical-device-buffer-device-address-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (bufferdeviceaddress :name "bufferDeviceAddress" :type "VkBool32")
;;     (bufferdeviceaddresscapturereplay :name "bufferDeviceAddressCaptureReplay"
;;      :type "VkBool32")
;;     (bufferdeviceaddressmultidevice :name "bufferDeviceAddressMultiDevice"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBufferDeviceAddressCreateInfoEXT"
;;       (buffer-device-address-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (deviceaddress :name "deviceAddress" :type "VkDeviceAddress"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkValidationFeaturesEXT"
;;       (validation-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (enabledvalidationfeaturecount :name "enabledValidationFeatureCount" :type
;;      uint32)
;;     (penabledvalidationfeatures :name "pEnabledValidationFeatures" :type
;;      "VkValidationFeatureEnableEXT" :init-form nil :create
;;      ((penabledvalidationfeatures-arg)
;;       (create-array vkvalidationfeatureenableext penabledvalidationfeatures
;;        penabledvalidationfeatures-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array penabledvalidationfeatures) :get
;;      ((&optional penabledvalidationfeatures-index)
;;       (get-array vkvalidationfeatureenableext penabledvalidationfeatures
;;        penabledvalidationfeatures-index enabledvalidationfeaturecount :pointers
;;        nil))
;;      :set
;;      ((penabledvalidationfeatures-arg &optional
;;        penabledvalidationfeatures-index)
;;       (set-array vkvalidationfeatureenableext penabledvalidationfeatures
;;        penabledvalidationfeatures-arg penabledvalidationfeatures-index :dynamic
;;        t :pointers nil)))
;;     (disabledvalidationfeaturecount :name "disabledValidationFeatureCount"
;;      :type uint32)
;;     (pdisabledvalidationfeatures :name "pDisabledValidationFeatures" :type
;;      "VkValidationFeatureDisableEXT" :init-form nil :create
;;      ((pdisabledvalidationfeatures-arg)
;;       (create-array vkvalidationfeaturedisableext pdisabledvalidationfeatures
;;        pdisabledvalidationfeatures-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pdisabledvalidationfeatures) :get
;;      ((&optional pdisabledvalidationfeatures-index)
;;       (get-array vkvalidationfeaturedisableext pdisabledvalidationfeatures
;;        pdisabledvalidationfeatures-index disabledvalidationfeaturecount
;;        :pointers nil))
;;      :set
;;      ((pdisabledvalidationfeatures-arg &optional
;;        pdisabledvalidationfeatures-index)
;;       (set-array vkvalidationfeaturedisableext pdisabledvalidationfeatures
;;        pdisabledvalidationfeatures-arg pdisabledvalidationfeatures-index
;;        :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCooperativeMatrixPropertiesNV"
;;       (cooperative-matrix-properties-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (msize :name "MSize" :type uint32)
;;     (nsize :name "NSize" :type uint32)
;;     (ksize :name "KSize" :type uint32)
;;     (atype :name "AType" :type "VkComponentTypeNV")
;;     (btype :name "BType" :type "VkComponentTypeNV")
;;     (ctype :name "CType" :type "VkComponentTypeNV")
;;     (dtype :name "DType" :type "VkComponentTypeNV")
;;     (scope :name scope :type "VkScopeNV"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceCooperativeMatrixFeaturesNV"
;;       (physical-device-cooperative-matrix-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (cooperativematrix :name "cooperativeMatrix" :type "VkBool32")
;;     (cooperativematrixrobustbufferaccess :name
;;      "cooperativeMatrixRobustBufferAccess" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceCooperativeMatrixPropertiesNV"
;;       (physical-device-cooperative-matrix-properties-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (cooperativematrixsupportedstages :name "cooperativeMatrixSupportedStages"
;;      :type "VkShaderStageFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceCoverageReductionModeFeaturesNV"
;;       (physical-device-coverage-reduction-mode-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (coveragereductionmode :name "coverageReductionMode" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineCoverageReductionStateCreateInfoNV"
;;       (pipeline-coverage-reduction-state-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineCoverageReductionStateCreateFlagsNV")
;;     (coveragereductionmode :name "coverageReductionMode" :type
;;      "VkCoverageReductionModeNV"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkFramebufferMixedSamplesCombinationNV"
;;       (framebuffer-mixed-samples-combination-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (coveragereductionmode :name "coverageReductionMode" :type
;;      "VkCoverageReductionModeNV")
;;     (rasterizationsamples :name "rasterizationSamples" :type
;;      "VkSampleCountFlagBits")
;;     (depthstencilsamples :name "depthStencilSamples" :type "VkSampleCountFlags")
;;     (colorsamples :name "colorSamples" :type "VkSampleCountFlags"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentShaderInterlockFeaturesEXT"
;;       (physical-device-fragment-shader-interlock-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fragmentshadersampleinterlock :name "fragmentShaderSampleInterlock" :type
;;      "VkBool32")
;;     (fragmentshaderpixelinterlock :name "fragmentShaderPixelInterlock" :type
;;      "VkBool32")
;;     (fragmentshadershadingrateinterlock :name
;;      "fragmentShaderShadingRateInterlock" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceYcbcrImageArraysFeaturesEXT"
;;       (physical-device-ycbcr-image-arrays-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (ycbcrimagearrays :name "ycbcrImageArrays" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceProvokingVertexFeaturesEXT"
;;       (physical-device-provoking-vertex-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (provokingvertexlast :name "provokingVertexLast" :type "VkBool32")
;;     (transformfeedbackpreservesprovokingvertex :name
;;      "transformFeedbackPreservesProvokingVertex" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceProvokingVertexPropertiesEXT"
;;       (physical-device-provoking-vertex-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (provokingvertexmodeperpipeline :name "provokingVertexModePerPipeline"
;;      :type "VkBool32")
;;     (transformfeedbackpreservestrianglefanprovokingvertex :name
;;      "transformFeedbackPreservesTriangleFanProvokingVertex" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineRasterizationProvokingVertexStateCreateInfoEXT"
;;       (pipeline-rasterization-provoking-vertex-state-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (provokingvertexmode :name "provokingVertexMode" :type
;;      "VkProvokingVertexModeEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkHeadlessSurfaceCreateInfoEXT"
;;       (headless-surface-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkHeadlessSurfaceCreateFlagsEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceLineRasterizationFeaturesEXT"
;;       (physical-device-line-rasterization-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (rectangularlines :name "rectangularLines" :type "VkBool32")
;;     (bresenhamlines :name "bresenhamLines" :type "VkBool32")
;;     (smoothlines :name "smoothLines" :type "VkBool32")
;;     (stippledrectangularlines :name "stippledRectangularLines" :type "VkBool32")
;;     (stippledbresenhamlines :name "stippledBresenhamLines" :type "VkBool32")
;;     (stippledsmoothlines :name "stippledSmoothLines" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceLineRasterizationPropertiesEXT"
;;       (physical-device-line-rasterization-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (linesubpixelprecisionbits :name "lineSubPixelPrecisionBits" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineRasterizationLineStateCreateInfoEXT"
;;       (pipeline-rasterization-line-state-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (linerasterizationmode :name "lineRasterizationMode" :type
;;      "VkLineRasterizationModeEXT")
;;     (stippledlineenable :name "stippledLineEnable" :type "VkBool32")
;;     (linestipplefactor :name "lineStippleFactor" :type uint32)
;;     (linestipplepattern :name "lineStipplePattern" :type uint16))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderAtomicFloatFeaturesEXT"
;;       (physical-device-shader-atomic-float-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderbufferfloat32atomics :name "shaderBufferFloat32Atomics" :type
;;      "VkBool32")
;;     (shaderbufferfloat32atomicadd :name "shaderBufferFloat32AtomicAdd" :type
;;      "VkBool32")
;;     (shaderbufferfloat64atomics :name "shaderBufferFloat64Atomics" :type
;;      "VkBool32")
;;     (shaderbufferfloat64atomicadd :name "shaderBufferFloat64AtomicAdd" :type
;;      "VkBool32")
;;     (shadersharedfloat32atomics :name "shaderSharedFloat32Atomics" :type
;;      "VkBool32")
;;     (shadersharedfloat32atomicadd :name "shaderSharedFloat32AtomicAdd" :type
;;      "VkBool32")
;;     (shadersharedfloat64atomics :name "shaderSharedFloat64Atomics" :type
;;      "VkBool32")
;;     (shadersharedfloat64atomicadd :name "shaderSharedFloat64AtomicAdd" :type
;;      "VkBool32")
;;     (shaderimagefloat32atomics :name "shaderImageFloat32Atomics" :type
;;      "VkBool32")
;;     (shaderimagefloat32atomicadd :name "shaderImageFloat32AtomicAdd" :type
;;      "VkBool32")
;;     (sparseimagefloat32atomics :name "sparseImageFloat32Atomics" :type
;;      "VkBool32")
;;     (sparseimagefloat32atomicadd :name "sparseImageFloat32AtomicAdd" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceIndexTypeUint8FeaturesEXT"
;;       (physical-device-index-type-uint-8-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (indextypeuint8 :name "indexTypeUint8" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceExtendedDynamicStateFeaturesEXT"
;;       (physical-device-extended-dynamic-state-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (extendeddynamicstate :name "extendedDynamicState" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderAtomicFloat2FeaturesEXT"
;;       (physical-device-shader-atomic-float-2-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderbufferfloat16atomics :name "shaderBufferFloat16Atomics" :type
;;      "VkBool32")
;;     (shaderbufferfloat16atomicadd :name "shaderBufferFloat16AtomicAdd" :type
;;      "VkBool32")
;;     (shaderbufferfloat16atomicminmax :name "shaderBufferFloat16AtomicMinMax"
;;      :type "VkBool32")
;;     (shaderbufferfloat32atomicminmax :name "shaderBufferFloat32AtomicMinMax"
;;      :type "VkBool32")
;;     (shaderbufferfloat64atomicminmax :name "shaderBufferFloat64AtomicMinMax"
;;      :type "VkBool32")
;;     (shadersharedfloat16atomics :name "shaderSharedFloat16Atomics" :type
;;      "VkBool32")
;;     (shadersharedfloat16atomicadd :name "shaderSharedFloat16AtomicAdd" :type
;;      "VkBool32")
;;     (shadersharedfloat16atomicminmax :name "shaderSharedFloat16AtomicMinMax"
;;      :type "VkBool32")
;;     (shadersharedfloat32atomicminmax :name "shaderSharedFloat32AtomicMinMax"
;;      :type "VkBool32")
;;     (shadersharedfloat64atomicminmax :name "shaderSharedFloat64AtomicMinMax"
;;      :type "VkBool32")
;;     (shaderimagefloat32atomicminmax :name "shaderImageFloat32AtomicMinMax"
;;      :type "VkBool32")
;;     (sparseimagefloat32atomicminmax :name "sparseImageFloat32AtomicMinMax"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV"
;;       (physical-device-device-generated-commands-properties-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxgraphicsshadergroupcount :name "maxGraphicsShaderGroupCount" :type
;;      uint32)
;;     (maxindirectsequencecount :name "maxIndirectSequenceCount" :type uint32)
;;     (maxindirectcommandstokencount :name "maxIndirectCommandsTokenCount" :type
;;      uint32)
;;     (maxindirectcommandsstreamcount :name "maxIndirectCommandsStreamCount"
;;      :type uint32)
;;     (maxindirectcommandstokenoffset :name "maxIndirectCommandsTokenOffset"
;;      :type uint32)
;;     (maxindirectcommandsstreamstride :name "maxIndirectCommandsStreamStride"
;;      :type uint32)
;;     (minsequencescountbufferoffsetalignment :name
;;      "minSequencesCountBufferOffsetAlignment" :type uint32)
;;     (minsequencesindexbufferoffsetalignment :name
;;      "minSequencesIndexBufferOffsetAlignment" :type uint32)
;;     (minindirectcommandsbufferoffsetalignment :name
;;      "minIndirectCommandsBufferOffsetAlignment" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV"
;;       (physical-device-device-generated-commands-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (devicegeneratedcommands :name "deviceGeneratedCommands" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkGraphicsShaderGroupCreateInfoNV"
;;       (graphics-shader-group-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (stagecount :name "stageCount" :type uint32)
;;     (pstages :name "pStages" :type "VkPipelineShaderStageCreateInfo" :init-form
;;      nil :create
;;      ((pstages-arg)
;;       (create-array (:struct vkpipelineshaderstagecreateinfo) pstages
;;        pstages-arg :dynamic t :pointers ("VkPipelineShaderStageCreateInfo")))
;;      :destroy (destroy-array pstages) :get
;;      ((&optional pstages-index)
;;       (get-array (:struct vkpipelineshaderstagecreateinfo) pstages
;;        pstages-index stagecount :pointers ("VkPipelineShaderStageCreateInfo")))
;;      :set
;;      ((pstages-arg &optional pstages-index)
;;       (set-array (:struct vkpipelineshaderstagecreateinfo) pstages pstages-arg
;;        pstages-index :dynamic t :pointers ("VkPipelineShaderStageCreateInfo"))))
;;     (pvertexinputstate :name "pVertexInputState" :type
;;      "VkPipelineVertexInputStateCreateInfo" :init-form nil :create
;;      ((pvertexinputstate-arg)
;;       (create-pointer pvertexinputstate pvertexinputstate-arg))
;;      :get (nil (get-pointer pvertexinputstate)) :set
;;      ((pvertexinputstate-arg)
;;       (set-pointer pvertexinputstate pvertexinputstate-arg)))
;;     (ptessellationstate :name "pTessellationState" :type
;;      "VkPipelineTessellationStateCreateInfo" :init-form nil :create
;;      ((ptessellationstate-arg)
;;       (create-pointer ptessellationstate ptessellationstate-arg))
;;      :get (nil (get-pointer ptessellationstate)) :set
;;      ((ptessellationstate-arg)
;;       (set-pointer ptessellationstate ptessellationstate-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkGraphicsPipelineShaderGroupsCreateInfoNV"
;;       (graphics-pipeline-shader-groups-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (groupcount :name "groupCount" :type uint32)
;;     (pgroups :name "pGroups" :type "VkGraphicsShaderGroupCreateInfoNV"
;;      :init-form nil :create
;;      ((pgroups-arg)
;;       (create-array (:struct vkgraphicsshadergroupcreateinfonv) pgroups
;;        pgroups-arg :dynamic t :pointers ("VkGraphicsShaderGroupCreateInfoNV")))
;;      :destroy (destroy-array pgroups) :get
;;      ((&optional pgroups-index)
;;       (get-array (:struct vkgraphicsshadergroupcreateinfonv) pgroups
;;        pgroups-index groupcount :pointers
;;        ("VkGraphicsShaderGroupCreateInfoNV")))
;;      :set
;;      ((pgroups-arg &optional pgroups-index)
;;       (set-array (:struct vkgraphicsshadergroupcreateinfonv) pgroups
;;        pgroups-arg pgroups-index :dynamic t :pointers
;;        ("VkGraphicsShaderGroupCreateInfoNV"))))
;;     (pipelinecount :name "pipelineCount" :type uint32)
;;     (ppipelines :name "pPipelines" :type "VkPipeline" :init-form nil :create
;;      ((ppipelines-arg)
;;       (create-array vkpipeline ppipelines ppipelines-arg :dynamic t :pointers
;;        nil))
;;      :destroy (destroy-array ppipelines) :get
;;      ((&optional ppipelines-index)
;;       (get-array vkpipeline ppipelines ppipelines-index pipelinecount :pointers
;;        nil))
;;      :set
;;      ((ppipelines-arg &optional ppipelines-index)
;;       (set-array vkpipeline ppipelines ppipelines-arg ppipelines-index :dynamic
;;        t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindShaderGroupIndirectCommandNV"
;;       (bind-shader-group-indirect-command-nv)
;;       (:default-create :default-get :default-set)
;;     (groupindex :name "groupIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindIndexBufferIndirectCommandNV"
;;       (bind-index-buffer-indirect-command-nv)
;;       (:default-create :default-get :default-set)
;;     (bufferaddress :name "bufferAddress" :type "VkDeviceAddress")
;;     (size :name size :type uint32)
;;     (indextype :name "indexType" :type "VkIndexType"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkBindVertexBufferIndirectCommandNV"
;;       (bind-vertex-buffer-indirect-command-nv)
;;       (:default-create :default-get :default-set)
;;     (bufferaddress :name "bufferAddress" :type "VkDeviceAddress")
;;     (size :name size :type uint32)
;;     (stride :name stride :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSetStateFlagsIndirectCommandNV"
;;       (set-state-flags-indirect-command-nv)
;;       (:default-create :default-get :default-set)
;;     (data :name data :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkIndirectCommandsStreamNV"
;;       (indirect-commands-stream-nv)
;;       (:default-create :default-get :default-set)
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg)))
;;     (offset :name offset :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkIndirectCommandsLayoutTokenNV"
;;       (indirect-commands-layout-token-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (tokentype :name "tokenType" :type "VkIndirectCommandsTokenTypeNV")
;;     (stream :name stream :type uint32)
;;     (offset :name offset :type uint32)
;;     (vertexbindingunit :name "vertexBindingUnit" :type uint32)
;;     (vertexdynamicstride :name "vertexDynamicStride" :type "VkBool32")
;;     (pushconstantpipelinelayout :name "pushconstantPipelineLayout" :type
;;      "VkPipelineLayout" :create
;;      ((pushconstantpipelinelayout-arg)
;;       (create-pointer pushconstantpipelinelayout
;;        pushconstantpipelinelayout-arg))
;;      :get (nil (get-pointer pushconstantpipelinelayout)) :set
;;      ((pushconstantpipelinelayout-arg)
;;       (set-pointer pushconstantpipelinelayout pushconstantpipelinelayout-arg)))
;;     (pushconstantshaderstageflags :name "pushconstantShaderStageFlags" :type
;;      "VkShaderStageFlags")
;;     (pushconstantoffset :name "pushconstantOffset" :type uint32)
;;     (pushconstantsize :name "pushconstantSize" :type uint32)
;;     (indirectstateflags :name "indirectStateFlags" :type
;;      "VkIndirectStateFlagsNV")
;;     (indextypecount :name "indexTypeCount" :type uint32)
;;     (pindextypes :name "pIndexTypes" :type "VkIndexType" :init-form nil :create
;;      ((pindextypes-arg)
;;       (create-array vkindextype pindextypes pindextypes-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pindextypes) :get
;;      ((&optional pindextypes-index)
;;       (get-array vkindextype pindextypes pindextypes-index indextypecount
;;        :pointers nil))
;;      :set
;;      ((pindextypes-arg &optional pindextypes-index)
;;       (set-array vkindextype pindextypes pindextypes-arg pindextypes-index
;;        :dynamic t :pointers nil)))
;;     (pindextypevalues :name "pIndexTypeValues" :type uint32 :init-form nil
;;      :create
;;      ((pindextypevalues-arg)
;;       (create-pointer pindextypevalues pindextypevalues-arg))
;;      :get (nil (get-pointer pindextypevalues)) :set
;;      ((pindextypevalues-arg)
;;       (set-pointer pindextypevalues pindextypevalues-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkIndirectCommandsLayoutCreateInfoNV"
;;       (indirect-commands-layout-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkIndirectCommandsLayoutUsageFlagsNV")
;;     (pipelinebindpoint :name "pipelineBindPoint" :type "VkPipelineBindPoint")
;;     (tokencount :name "tokenCount" :type uint32)
;;     (ptokens :name "pTokens" :type "VkIndirectCommandsLayoutTokenNV" :init-form
;;      nil :create
;;      ((ptokens-arg)
;;       (create-array (:struct vkindirectcommandslayouttokennv) ptokens
;;        ptokens-arg :dynamic t :pointers ("VkIndirectCommandsLayoutTokenNV")))
;;      :destroy (destroy-array ptokens) :get
;;      ((&optional ptokens-index)
;;       (get-array (:struct vkindirectcommandslayouttokennv) ptokens
;;        ptokens-index tokencount :pointers ("VkIndirectCommandsLayoutTokenNV")))
;;      :set
;;      ((ptokens-arg &optional ptokens-index)
;;       (set-array (:struct vkindirectcommandslayouttokennv) ptokens ptokens-arg
;;        ptokens-index :dynamic t :pointers ("VkIndirectCommandsLayoutTokenNV"))))
;;     (streamcount :name "streamCount" :type uint32)
;;     (pstreamstrides :name "pStreamStrides" :type uint32 :init-form nil :create
;;      ((pstreamstrides-arg)
;;       (create-array :uint32 pstreamstrides pstreamstrides-arg :dynamic t
;;        :pointers nil))
;;      :destroy (destroy-array pstreamstrides) :get
;;      ((&optional pstreamstrides-index)
;;       (get-array :uint32 pstreamstrides pstreamstrides-index streamcount
;;        :pointers nil))
;;      :set
;;      ((pstreamstrides-arg &optional pstreamstrides-index)
;;       (set-array :uint32 pstreamstrides pstreamstrides-arg pstreamstrides-index
;;        :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkGeneratedCommandsInfoNV"
;;       (generated-commands-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pipelinebindpoint :name "pipelineBindPoint" :type "VkPipelineBindPoint")
;;     (pipeline :name pipeline :type "VkPipeline" :create
;;      ((pipeline-arg) (create-pointer pipeline pipeline-arg)) :get
;;      (nil (get-pointer pipeline)) :set
;;      ((pipeline-arg) (set-pointer pipeline pipeline-arg)))
;;     (indirectcommandslayout :name "indirectCommandsLayout" :type
;;      "VkIndirectCommandsLayoutNV" :create
;;      ((indirectcommandslayout-arg)
;;       (create-pointer indirectcommandslayout indirectcommandslayout-arg))
;;      :get (nil (get-pointer indirectcommandslayout)) :set
;;      ((indirectcommandslayout-arg)
;;       (set-pointer indirectcommandslayout indirectcommandslayout-arg)))
;;     (streamcount :name "streamCount" :type uint32)
;;     (pstreams :name "pStreams" :type "VkIndirectCommandsStreamNV" :init-form
;;      nil :create
;;      ((pstreams-arg)
;;       (create-array (:struct vkindirectcommandsstreamnv) pstreams pstreams-arg
;;        :dynamic t :pointers ("VkIndirectCommandsStreamNV")))
;;      :destroy (destroy-array pstreams) :get
;;      ((&optional pstreams-index)
;;       (get-array (:struct vkindirectcommandsstreamnv) pstreams pstreams-index
;;        streamcount :pointers ("VkIndirectCommandsStreamNV")))
;;      :set
;;      ((pstreams-arg &optional pstreams-index)
;;       (set-array (:struct vkindirectcommandsstreamnv) pstreams pstreams-arg
;;        pstreams-index :dynamic t :pointers ("VkIndirectCommandsStreamNV"))))
;;     (sequencescount :name "sequencesCount" :type uint32)
;;     (preprocessbuffer :name "preprocessBuffer" :type "VkBuffer" :create
;;      ((preprocessbuffer-arg)
;;       (create-pointer preprocessbuffer preprocessbuffer-arg))
;;      :get (nil (get-pointer preprocessbuffer)) :set
;;      ((preprocessbuffer-arg)
;;       (set-pointer preprocessbuffer preprocessbuffer-arg)))
;;     (preprocessoffset :name "preprocessOffset" :type "VkDeviceSize")
;;     (preprocesssize :name "preprocessSize" :type "VkDeviceSize")
;;     (sequencescountbuffer :name "sequencesCountBuffer" :type "VkBuffer" :create
;;      ((sequencescountbuffer-arg)
;;       (create-pointer sequencescountbuffer sequencescountbuffer-arg))
;;      :get (nil (get-pointer sequencescountbuffer)) :set
;;      ((sequencescountbuffer-arg)
;;       (set-pointer sequencescountbuffer sequencescountbuffer-arg)))
;;     (sequencescountoffset :name "sequencesCountOffset" :type "VkDeviceSize")
;;     (sequencesindexbuffer :name "sequencesIndexBuffer" :type "VkBuffer" :create
;;      ((sequencesindexbuffer-arg)
;;       (create-pointer sequencesindexbuffer sequencesindexbuffer-arg))
;;      :get (nil (get-pointer sequencesindexbuffer)) :set
;;      ((sequencesindexbuffer-arg)
;;       (set-pointer sequencesindexbuffer sequencesindexbuffer-arg)))
;;     (sequencesindexoffset :name "sequencesIndexOffset" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkGeneratedCommandsMemoryRequirementsInfoNV"
;;       (generated-commands-memory-requirements-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pipelinebindpoint :name "pipelineBindPoint" :type "VkPipelineBindPoint")
;;     (pipeline :name pipeline :type "VkPipeline" :create
;;      ((pipeline-arg) (create-pointer pipeline pipeline-arg)) :get
;;      (nil (get-pointer pipeline)) :set
;;      ((pipeline-arg) (set-pointer pipeline pipeline-arg)))
;;     (indirectcommandslayout :name "indirectCommandsLayout" :type
;;      "VkIndirectCommandsLayoutNV" :create
;;      ((indirectcommandslayout-arg)
;;       (create-pointer indirectcommandslayout indirectcommandslayout-arg))
;;      :get (nil (get-pointer indirectcommandslayout)) :set
;;      ((indirectcommandslayout-arg)
;;       (set-pointer indirectcommandslayout indirectcommandslayout-arg)))
;;     (maxsequencescount :name "maxSequencesCount" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceInheritedViewportScissorFeaturesNV"
;;       (physical-device-inherited-viewport-scissor-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (inheritedviewportscissor2d :name "inheritedViewportScissor2D" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCommandBufferInheritanceViewportScissorInfoNV"
;;       (command-buffer-inheritance-viewport-scissor-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (viewportscissor2d :name "viewportScissor2D" :type "VkBool32")
;;     (viewportdepthcount :name "viewportDepthCount" :type uint32)
;;     (pviewportdepths :name "pViewportDepths" :type "VkViewport" :init-form nil
;;      :create
;;      ((pviewportdepths-arg)
;;       (create-array (:struct vkviewport) pviewportdepths pviewportdepths-arg
;;        :dynamic t :pointers ("VkViewport")))
;;      :destroy (destroy-array pviewportdepths) :get
;;      ((&optional pviewportdepths-index)
;;       (get-array (:struct vkviewport) pviewportdepths pviewportdepths-index
;;        viewportdepthcount :pointers ("VkViewport")))
;;      :set
;;      ((pviewportdepths-arg &optional pviewportdepths-index)
;;       (set-array (:struct vkviewport) pviewportdepths pviewportdepths-arg
;;        pviewportdepths-index :dynamic t :pointers ("VkViewport")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT"
;;       (physical-device-texel-buffer-alignment-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (texelbufferalignment :name "texelBufferAlignment" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassTransformBeginInfoQCOM"
;;       (render-pass-transform-begin-info-q-c-o-m)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (transform :name transform :type "VkSurfaceTransformFlagBitsKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCommandBufferInheritanceRenderPassTransformInfoQCOM"
;;       (command-buffer-inheritance-render-pass-transform-info-q-c-o-m)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (transform :name transform :type "VkSurfaceTransformFlagBitsKHR")
;;     (renderarea :pointer t :name "renderArea" :type "VkRect2D" :create
;;      ((renderarea-arg)
;;       (copy-object renderarea renderarea-arg '(:struct vkrect2d)))
;;      :set
;;      ((renderarea-arg)
;;       (copy-object renderarea renderarea-arg '(:struct vkrect2d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDeviceMemoryReportFeaturesEXT"
;;       (physical-device-device-memory-report-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (devicememoryreport :name "deviceMemoryReport" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceMemoryReportCallbackDataEXT"
;;       (device-memory-report-callback-data-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDeviceMemoryReportFlagsEXT")
;;     (type :name type :type "VkDeviceMemoryReportEventTypeEXT")
;;     (memoryobjectid :name "memoryObjectId" :type uint64)
;;     (size :name size :type "VkDeviceSize")
;;     (objecttype :name "objectType" :type "VkObjectType")
;;     (objecthandle :name "objectHandle" :type uint64)
;;     (heapindex :name "heapIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceDeviceMemoryReportCreateInfoEXT"
;;       (device-device-memory-report-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDeviceMemoryReportFlagsEXT")
;;     (pfnusercallback :name "pfnUserCallback" :type
;;      "PFN_vkDeviceMemoryReportCallbackEXT")
;;     (puserdata :name "pUserData" :type void :init-form nil :create
;;      ((puserdata-arg) (create-pointer puserdata puserdata-arg)) :get
;;      (nil (get-pointer puserdata)) :set
;;      ((puserdata-arg) (set-pointer puserdata puserdata-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRobustness2FeaturesEXT"
;;       (physical-device-robustness-2-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (robustbufferaccess2 :name "robustBufferAccess2" :type "VkBool32")
;;     (robustimageaccess2 :name "robustImageAccess2" :type "VkBool32")
;;     (nulldescriptor :name "nullDescriptor" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRobustness2PropertiesEXT"
;;       (physical-device-robustness-2-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (robuststoragebufferaccesssizealignment :name
;;      "robustStorageBufferAccessSizeAlignment" :type "VkDeviceSize")
;;     (robustuniformbufferaccesssizealignment :name
;;      "robustUniformBufferAccessSizeAlignment" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSamplerCustomBorderColorCreateInfoEXT"
;;       (sampler-custom-border-color-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (custombordercolor :pointer t :name "customBorderColor" :type
;;      "VkClearColorValue" :create
;;      ((custombordercolor-arg)
;;       (copy-object custombordercolor custombordercolor-arg
;;        '(:union vkclearcolorvalue)))
;;      :set
;;      ((custombordercolor-arg)
;;       (copy-object custombordercolor custombordercolor-arg
;;        '(:union vkclearcolorvalue))))
;;     (format :name format :type "VkFormat"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceCustomBorderColorPropertiesEXT"
;;       (physical-device-custom-border-color-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxcustombordercolorsamplers :name "maxCustomBorderColorSamplers" :type
;;      uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceCustomBorderColorFeaturesEXT"
;;       (physical-device-custom-border-color-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (custombordercolors :name "customBorderColors" :type "VkBool32")
;;     (custombordercolorwithoutformat :name "customBorderColorWithoutFormat"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDiagnosticsConfigFeaturesNV"
;;       (physical-device-diagnostics-config-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (diagnosticsconfig :name "diagnosticsConfig" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDeviceDiagnosticsConfigCreateInfoNV"
;;       (device-diagnostics-config-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkDeviceDiagnosticsConfigFlagsNV"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT"
;;       (physical-device-graphics-pipeline-library-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (graphicspipelinelibrary :name "graphicsPipelineLibrary" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT"
;;       (physical-device-graphics-pipeline-library-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (graphicspipelinelibraryfastlinking :name
;;      "graphicsPipelineLibraryFastLinking" :type "VkBool32")
;;     (graphicspipelinelibraryindependentinterpolationdecoration :name
;;      "graphicsPipelineLibraryIndependentInterpolationDecoration" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkGraphicsPipelineLibraryCreateInfoEXT"
;;       (graphics-pipeline-library-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkGraphicsPipelineLibraryFlagsEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMD"
;;       (physical-device-shader-early-and-late-fragment-tests-features-amd)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shaderearlyandlatefragmenttests :name "shaderEarlyAndLateFragmentTests"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV"
;;       (physical-device-fragment-shading-rate-enums-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fragmentshadingrateenums :name "fragmentShadingRateEnums" :type "VkBool32")
;;     (supersamplefragmentshadingrates :name "supersampleFragmentShadingRates"
;;      :type "VkBool32")
;;     (noinvocationfragmentshadingrates :name "noInvocationFragmentShadingRates"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV"
;;       (physical-device-fragment-shading-rate-enums-properties-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxfragmentshadingrateinvocationcount :name
;;      "maxFragmentShadingRateInvocationCount" :type "VkSampleCountFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineFragmentShadingRateEnumStateCreateInfoNV"
;;       (pipeline-fragment-shading-rate-enum-state-create-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadingratetype :name "shadingRateType" :type
;;      "VkFragmentShadingRateTypeNV")
;;     (shadingrate :name "shadingRate" :type "VkFragmentShadingRateNV")
;;     (combinerops :name "combinerOps" :type "VkFragmentShadingRateCombinerOpKHR"
;;      :create
;;      ((combinerops-arg)
;;       (create-array vkfragmentshadingratecombineropkhr combinerops
;;        combinerops-arg :dynamic nil :pointers nil))
;;      :get
;;      ((&optional combinerops-index)
;;       (get-array vkfragmentshadingratecombineropkhr combinerops
;;        combinerops-index 2 :pointers nil))
;;      :set
;;      ((combinerops-arg &optional combinerops-index)
;;       (set-array vkfragmentshadingratecombineropkhr combinerops combinerops-arg
;;        combinerops-index :dynamic nil :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-union doc-file
;;       "VkDeviceOrHostAddressConstKHR"
;;       (device-or-host-address-const-khr)
;;       (:default-create :default-get :default-set)
;;     (deviceaddress :name "deviceAddress" :type "VkDeviceAddress")
;;     (hostaddress :name "hostAddress" :type void :init-form nil :create
;;      ((hostaddress-arg) (create-pointer hostaddress hostaddress-arg)) :get
;;      (nil (get-pointer hostaddress)) :set
;;      ((hostaddress-arg) (set-pointer hostaddress hostaddress-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureGeometryMotionTrianglesDataNV"
;;       (acceleration-structure-geometry-motion-triangles-data-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (vertexdata :pointer t :name "vertexData" :type
;;      "VkDeviceOrHostAddressConstKHR" :create
;;      ((vertexdata-arg)
;;       (copy-object vertexdata vertexdata-arg
;;        '(:union vkdeviceorhostaddressconstkhr)))
;;      :set
;;      ((vertexdata-arg)
;;       (copy-object vertexdata vertexdata-arg
;;        '(:union vkdeviceorhostaddressconstkhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureMotionInfoNV"
;;       (acceleration-structure-motion-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxinstances :name "maxInstances" :type uint32)
;;     (flags :name flags :type "VkAccelerationStructureMotionInfoFlagsNV"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureMatrixMotionInstanceNV"
;;       (acceleration-structure-matrix-motion-instance-nv)
;;       (:default-create :default-get :default-set)
;;     (transformt0 :pointer t :name "transformT0" :type "VkTransformMatrixKHR"
;;      :create
;;      ((transformt0-arg)
;;       (copy-object transformt0 transformt0-arg
;;        '(:struct vktransformmatrixkhr)))
;;      :set
;;      ((transformt0-arg)
;;       (copy-object transformt0 transformt0-arg
;;        '(:struct vktransformmatrixkhr))))
;;     (transformt1 :pointer t :name "transformT1" :type "VkTransformMatrixKHR"
;;      :create
;;      ((transformt1-arg)
;;       (copy-object transformt1 transformt1-arg
;;        '(:struct vktransformmatrixkhr)))
;;      :set
;;      ((transformt1-arg)
;;       (copy-object transformt1 transformt1-arg
;;        '(:struct vktransformmatrixkhr))))
;;     (instancecustomindex :name "instanceCustomIndex" :type uint32)
;;     (instanceshaderbindingtablerecordoffset :name
;;      "instanceShaderBindingTableRecordOffset" :type uint32)
;;     (accelerationstructurereference :name "accelerationStructureReference"
;;      :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSRTDataNV"
;;       (s-r-t-data-nv)
;;       (:default-create :default-get :default-set)
;;     (sx :name sx :type float)
;;     (a :name a :type float)
;;     (b :name b :type float)
;;     (pvx :name pvx :type float)
;;     (sy :name sy :type float)
;;     (c :name c :type float)
;;     (pvy :name pvy :type float)
;;     (sz :name sz :type float)
;;     (pvz :name pvz :type float)
;;     (qx :name qx :type float)
;;     (qy :name qy :type float)
;;     (qz :name qz :type float)
;;     (qw :name qw :type float)
;;     (tx :name tx :type float)
;;     (ty :name ty :type float)
;;     (tz :name tz :type float))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureSRTMotionInstanceNV"
;;       (acceleration-structure-s-r-t-motion-instance-nv)
;;       (:default-create :default-get :default-set)
;;     (transformt0 :pointer t :name "transformT0" :type "VkSRTDataNV" :create
;;      ((transformt0-arg)
;;       (copy-object transformt0 transformt0-arg '(:struct vksrtdatanv)))
;;      :set
;;      ((transformt0-arg)
;;       (copy-object transformt0 transformt0-arg '(:struct vksrtdatanv))))
;;     (transformt1 :pointer t :name "transformT1" :type "VkSRTDataNV" :create
;;      ((transformt1-arg)
;;       (copy-object transformt1 transformt1-arg '(:struct vksrtdatanv)))
;;      :set
;;      ((transformt1-arg)
;;       (copy-object transformt1 transformt1-arg '(:struct vksrtdatanv))))
;;     (instancecustomindex :name "instanceCustomIndex" :type uint32)
;;     (instanceshaderbindingtablerecordoffset :name
;;      "instanceShaderBindingTableRecordOffset" :type uint32)
;;     (accelerationstructurereference :name "accelerationStructureReference"
;;      :type uint64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-union doc-file
;;       "VkAccelerationStructureMotionInstanceDataNV"
;;       (acceleration-structure-motion-instance-data-nv)
;;       (:default-create :default-get :default-set)
;;     (staticinstance :pointer t :name "staticInstance" :type
;;      "VkAccelerationStructureInstanceKHR" :create
;;      ((staticinstance-arg)
;;       (copy-object staticinstance staticinstance-arg
;;        '(:struct vkaccelerationstructureinstancekhr)))
;;      :set
;;      ((staticinstance-arg)
;;       (copy-object staticinstance staticinstance-arg
;;        '(:struct vkaccelerationstructureinstancekhr))))
;;     (matrixmotioninstance :pointer t :name "matrixMotionInstance" :type
;;      "VkAccelerationStructureMatrixMotionInstanceNV" :create
;;      ((matrixmotioninstance-arg)
;;       (copy-object matrixmotioninstance matrixmotioninstance-arg
;;        '(:struct vkaccelerationstructurematrixmotioninstancenv)))
;;      :set
;;      ((matrixmotioninstance-arg)
;;       (copy-object matrixmotioninstance matrixmotioninstance-arg
;;        '(:struct vkaccelerationstructurematrixmotioninstancenv))))
;;     (srtmotioninstance :pointer t :name "srtMotionInstance" :type
;;      "VkAccelerationStructureSRTMotionInstanceNV" :create
;;      ((srtmotioninstance-arg)
;;       (copy-object srtmotioninstance srtmotioninstance-arg
;;        '(:struct vkaccelerationstructuresrtmotioninstancenv)))
;;      :set
;;      ((srtmotioninstance-arg)
;;       (copy-object srtmotioninstance srtmotioninstance-arg
;;        '(:struct vkaccelerationstructuresrtmotioninstancenv)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureMotionInstanceNV"
;;       (acceleration-structure-motion-instance-nv)
;;       (:default-create :default-get :default-set)
;;     (type :name type :type "VkAccelerationStructureMotionInstanceTypeNV")
;;     (flags :name flags :type "VkAccelerationStructureMotionInstanceFlagsNV")
;;     (data :pointer t :name data :type
;;      "VkAccelerationStructureMotionInstanceDataNV" :create
;;      ((data-arg)
;;       (copy-object data data-arg
;;        '(:union vkaccelerationstructuremotioninstancedatanv)))
;;      :set
;;      ((data-arg)
;;       (copy-object data data-arg
;;        '(:union vkaccelerationstructuremotioninstancedatanv)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRayTracingMotionBlurFeaturesNV"
;;       (physical-device-ray-tracing-motion-blur-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (raytracingmotionblur :name "rayTracingMotionBlur" :type "VkBool32")
;;     (raytracingmotionblurpipelinetraceraysindirect :name
;;      "rayTracingMotionBlurPipelineTraceRaysIndirect" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT"
;;       (physical-device-ycbcr-2-plane-4-4-4-formats-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (ycbcr2plane444formats :name "ycbcr2plane444Formats" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentDensityMap2FeaturesEXT"
;;       (physical-device-fragment-density-map-2-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fragmentdensitymapdeferred :name "fragmentDensityMapDeferred" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentDensityMap2PropertiesEXT"
;;       (physical-device-fragment-density-map-2-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (subsampledloads :name "subsampledLoads" :type "VkBool32")
;;     (subsampledcoarsereconstructionearlyaccess :name
;;      "subsampledCoarseReconstructionEarlyAccess" :type "VkBool32")
;;     (maxsubsampledarraylayers :name "maxSubsampledArrayLayers" :type uint32)
;;     (maxdescriptorsetsubsampledsamplers :name
;;      "maxDescriptorSetSubsampledSamplers" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCopyCommandTransformInfoQCOM"
;;       (copy-command-transform-info-q-c-o-m)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (transform :name transform :type "VkSurfaceTransformFlagBitsKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceImageCompressionControlFeaturesEXT"
;;       (physical-device-image-compression-control-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imagecompressioncontrol :name "imageCompressionControl" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageCompressionControlEXT"
;;       (image-compression-control-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkImageCompressionFlagsEXT")
;;     (compressioncontrolplanecount :name "compressionControlPlaneCount" :type
;;      uint32)
;;     (pfixedrateflags :name "pFixedRateFlags" :type
;;      "VkImageCompressionFixedRateFlagsEXT" :init-form nil :create
;;      ((pfixedrateflags-arg)
;;       (create-array vkimagecompressionfixedrateflagsext pfixedrateflags
;;        pfixedrateflags-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array pfixedrateflags) :get
;;      ((&optional pfixedrateflags-index)
;;       (get-array vkimagecompressionfixedrateflagsext pfixedrateflags
;;        pfixedrateflags-index compressioncontrolplanecount :pointers nil))
;;      :set
;;      ((pfixedrateflags-arg &optional pfixedrateflags-index)
;;       (set-array vkimagecompressionfixedrateflagsext pfixedrateflags
;;        pfixedrateflags-arg pfixedrateflags-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubresourceLayout2EXT"
;;       (subresource-layout-2-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (subresourcelayout :pointer t :name "subresourceLayout" :type
;;      "VkSubresourceLayout" :create
;;      ((subresourcelayout-arg)
;;       (copy-object subresourcelayout subresourcelayout-arg
;;        '(:struct vksubresourcelayout)))
;;      :set
;;      ((subresourcelayout-arg)
;;       (copy-object subresourcelayout subresourcelayout-arg
;;        '(:struct vksubresourcelayout)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageSubresource2EXT"
;;       (image-subresource-2-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imagesubresource :pointer t :name "imageSubresource" :type
;;      "VkImageSubresource" :create
;;      ((imagesubresource-arg)
;;       (copy-object imagesubresource imagesubresource-arg
;;        '(:struct vkimagesubresource)))
;;      :set
;;      ((imagesubresource-arg)
;;       (copy-object imagesubresource imagesubresource-arg
;;        '(:struct vkimagesubresource)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageCompressionPropertiesEXT"
;;       (image-compression-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imagecompressionflags :name "imageCompressionFlags" :type
;;      "VkImageCompressionFlagsEXT")
;;     (imagecompressionfixedrateflags :name "imageCompressionFixedRateFlags"
;;      :type "VkImageCompressionFixedRateFlagsEXT"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevice4444FormatsFeaturesEXT"
;;       (physical-device-4-4-4-4-formats-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (formata4r4g4b4 :name "formatA4R4G4B4" :type "VkBool32")
;;     (formata4b4g4r4 :name "formatA4B4G4R4" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM"
;;       (physical-device-rasterization-order-attachment-access-features-a-r-m)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (rasterizationordercolorattachmentaccess :name
;;      "rasterizationOrderColorAttachmentAccess" :type "VkBool32")
;;     (rasterizationorderdepthattachmentaccess :name
;;      "rasterizationOrderDepthAttachmentAccess" :type "VkBool32")
;;     (rasterizationorderstencilattachmentaccess :name
;;      "rasterizationOrderStencilAttachmentAccess" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRGBA10X6FormatsFeaturesEXT"
;;       (physical-device-r-g-b-a-1-0-x-6-formats-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (formatrgba10x6withoutycbcrsampler :name
;;      "formatRgba10x6WithoutYCbCrSampler" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE"
;;       (physical-device-mutable-descriptor-type-features-valve)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (mutabledescriptortype :name "mutableDescriptorType" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMutableDescriptorTypeListVALVE"
;;       (mutable-descriptor-type-list-valve)
;;       (:default-create :default-get :default-set)
;;     (descriptortypecount :name "descriptorTypeCount" :type uint32)
;;     (pdescriptortypes :name "pDescriptorTypes" :type "VkDescriptorType"
;;      :init-form nil :create
;;      ((pdescriptortypes-arg)
;;       (create-array vkdescriptortype pdescriptortypes pdescriptortypes-arg
;;        :dynamic t :pointers nil))
;;      :destroy (destroy-array pdescriptortypes) :get
;;      ((&optional pdescriptortypes-index)
;;       (get-array vkdescriptortype pdescriptortypes pdescriptortypes-index
;;        descriptortypecount :pointers nil))
;;      :set
;;      ((pdescriptortypes-arg &optional pdescriptortypes-index)
;;       (set-array vkdescriptortype pdescriptortypes pdescriptortypes-arg
;;        pdescriptortypes-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMutableDescriptorTypeCreateInfoVALVE"
;;       (mutable-descriptor-type-create-info-valve)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (mutabledescriptortypelistcount :name "mutableDescriptorTypeListCount"
;;      :type uint32)
;;     (pmutabledescriptortypelists :name "pMutableDescriptorTypeLists" :type
;;      "VkMutableDescriptorTypeListVALVE" :init-form nil :create
;;      ((pmutabledescriptortypelists-arg)
;;       (create-array (:struct vkmutabledescriptortypelistvalve)
;;        pmutabledescriptortypelists pmutabledescriptortypelists-arg :dynamic t
;;        :pointers ("VkMutableDescriptorTypeListVALVE")))
;;      :destroy (destroy-array pmutabledescriptortypelists) :get
;;      ((&optional pmutabledescriptortypelists-index)
;;       (get-array (:struct vkmutabledescriptortypelistvalve)
;;        pmutabledescriptortypelists pmutabledescriptortypelists-index
;;        mutabledescriptortypelistcount :pointers
;;        ("VkMutableDescriptorTypeListVALVE")))
;;      :set
;;      ((pmutabledescriptortypelists-arg &optional
;;        pmutabledescriptortypelists-index)
;;       (set-array (:struct vkmutabledescriptortypelistvalve)
;;        pmutabledescriptortypelists pmutabledescriptortypelists-arg
;;        pmutabledescriptortypelists-index :dynamic t :pointers
;;        ("VkMutableDescriptorTypeListVALVE")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceVertexInputDynamicStateFeaturesEXT"
;;       (physical-device-vertex-input-dynamic-state-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (vertexinputdynamicstate :name "vertexInputDynamicState" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkVertexInputBindingDescription2EXT"
;;       (vertex-input-binding-description-2-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (binding :name binding :type uint32)
;;     (stride :name stride :type uint32)
;;     (inputrate :name "inputRate" :type "VkVertexInputRate")
;;     (divisor :name divisor :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkVertexInputAttributeDescription2EXT"
;;       (vertex-input-attribute-description-2-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (location :name location :type uint32)
;;     (binding :name binding :type uint32)
;;     (format :name format :type "VkFormat")
;;     (offset :name offset :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDrmPropertiesEXT"
;;       (physical-device-drm-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (hasprimary :name "hasPrimary" :type "VkBool32")
;;     (hasrender :name "hasRender" :type "VkBool32")
;;     (primarymajor :name "primaryMajor" :type int64)
;;     (primaryminor :name "primaryMinor" :type int64)
;;     (rendermajor :name "renderMajor" :type int64)
;;     (renderminor :name "renderMinor" :type int64))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDepthClipControlFeaturesEXT"
;;       (physical-device-depth-clip-control-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (depthclipcontrol :name "depthClipControl" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineViewportDepthClipControlCreateInfoEXT"
;;       (pipeline-viewport-depth-clip-control-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (negativeonetoone :name "negativeOneToOne" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePrimitiveTopologyListRestartFeaturesEXT"
;;       (physical-device-primitive-topology-list-restart-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (primitivetopologylistrestart :name "primitiveTopologyListRestart" :type
;;      "VkBool32")
;;     (primitivetopologypatchlistrestart :name
;;      "primitiveTopologyPatchListRestart" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubpassShadingPipelineCreateInfoHUAWEI"
;;       (subpass-shading-pipeline-create-info-huawei)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (renderpass :name "renderPass" :type "VkRenderPass" :create
;;      ((renderpass-arg) (create-pointer renderpass renderpass-arg)) :get
;;      (nil (get-pointer renderpass)) :set
;;      ((renderpass-arg) (set-pointer renderpass renderpass-arg)))
;;     (subpass :name subpass :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSubpassShadingFeaturesHUAWEI"
;;       (physical-device-subpass-shading-features-huawei)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (subpassshading :name "subpassShading" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSubpassShadingPropertiesHUAWEI"
;;       (physical-device-subpass-shading-properties-huawei)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxsubpassshadingworkgroupsizeaspectratio :name
;;      "maxSubpassShadingWorkgroupSizeAspectRatio" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceInvocationMaskFeaturesHUAWEI"
;;       (physical-device-invocation-mask-features-huawei)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (invocationmask :name "invocationMask" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMemoryGetRemoteAddressInfoNV"
;;       (memory-get-remote-address-info-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (memory :name memory :type "VkDeviceMemory" :create
;;      ((memory-arg) (create-pointer memory memory-arg)) :get
;;      (nil (get-pointer memory)) :set
;;      ((memory-arg) (set-pointer memory memory-arg)))
;;     (handletype :name "handleType" :type "VkExternalMemoryHandleTypeFlagBits"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceExternalMemoryRDMAFeaturesNV"
;;       (physical-device-external-memory-r-d-m-a-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (externalmemoryrdma :name "externalMemoryRDMA" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelinePropertiesIdentifierEXT"
;;       (pipeline-properties-identifier-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pipelineidentifier :name "pipelineIdentifier" :type uint8 :create
;;      ((pipelineidentifier-arg)
;;       (create-array :uint8 pipelineidentifier pipelineidentifier-arg :dynamic
;;        nil :pointers nil))
;;      :get
;;      ((&optional pipelineidentifier-index)
;;       (get-array :uint8 pipelineidentifier pipelineidentifier-index 16
;;        :pointers nil))
;;      :set
;;      ((pipelineidentifier-arg &optional pipelineidentifier-index)
;;       (set-array :uint8 pipelineidentifier pipelineidentifier-arg
;;        pipelineidentifier-index :dynamic nil :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePipelinePropertiesFeaturesEXT"
;;       (physical-device-pipeline-properties-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pipelinepropertiesidentifier :name "pipelinePropertiesIdentifier" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceExtendedDynamicState2FeaturesEXT"
;;       (physical-device-extended-dynamic-state-2-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (extendeddynamicstate2 :name "extendedDynamicState2" :type "VkBool32")
;;     (extendeddynamicstate2logicop :name "extendedDynamicState2LogicOp" :type
;;      "VkBool32")
;;     (extendeddynamicstate2patchcontrolpoints :name
;;      "extendedDynamicState2PatchControlPoints" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceColorWriteEnableFeaturesEXT"
;;       (physical-device-color-write-enable-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (colorwriteenable :name "colorWriteEnable" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPipelineColorWriteCreateInfoEXT"
;;       (pipeline-color-write-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (attachmentcount :name "attachmentCount" :type uint32)
;;     (pcolorwriteenables :name "pColorWriteEnables" :type "VkBool32" :init-form
;;      nil :create
;;      ((pcolorwriteenables-arg)
;;       (create-array vkbool32 pcolorwriteenables pcolorwriteenables-arg :dynamic
;;        t :pointers nil))
;;      :destroy (destroy-array pcolorwriteenables) :get
;;      ((&optional pcolorwriteenables-index)
;;       (get-array vkbool32 pcolorwriteenables pcolorwriteenables-index
;;        attachmentcount :pointers nil))
;;      :set
;;      ((pcolorwriteenables-arg &optional pcolorwriteenables-index)
;;       (set-array vkbool32 pcolorwriteenables pcolorwriteenables-arg
;;        pcolorwriteenables-index :dynamic t :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT"
;;       (physical-device-primitives-generated-query-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (primitivesgeneratedquery :name "primitivesGeneratedQuery" :type "VkBool32")
;;     (primitivesgeneratedquerywithrasterizerdiscard :name
;;      "primitivesGeneratedQueryWithRasterizerDiscard" :type "VkBool32")
;;     (primitivesgeneratedquerywithnonzerostreams :name
;;      "primitivesGeneratedQueryWithNonZeroStreams" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceImageViewMinLodFeaturesEXT"
;;       (physical-device-image-view-min-lod-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (minlod :name "minLod" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkImageViewMinLodCreateInfoEXT"
;;       (image-view-min-lod-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (minlod :name "minLod" :type float))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMultiDrawFeaturesEXT"
;;       (physical-device-multi-draw-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (multidraw :name "multiDraw" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceMultiDrawPropertiesEXT"
;;       (physical-device-multi-draw-properties-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxmultidrawcount :name "maxMultiDrawCount" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMultiDrawInfoEXT"
;;       (multi-draw-info-ext)
;;       (:default-create :default-get :default-set)
;;     (firstvertex :name "firstVertex" :type uint32)
;;     (vertexcount :name "vertexCount" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkMultiDrawIndexedInfoEXT"
;;       (multi-draw-indexed-info-ext)
;;       (:default-create :default-get :default-set)
;;     (firstindex :name "firstIndex" :type uint32)
;;     (indexcount :name "indexCount" :type uint32)
;;     (vertexoffset :name "vertexOffset" :type int32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceImage2DViewOf3DFeaturesEXT"
;;       (physical-device-image-2d-view-of-3d-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (image2dviewof3d :name "image2DViewOf3D" :type "VkBool32")
;;     (sampler2dviewof3d :name "sampler2DViewOf3D" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceBorderColorSwizzleFeaturesEXT"
;;       (physical-device-border-color-swizzle-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (bordercolorswizzle :name "borderColorSwizzle" :type "VkBool32")
;;     (bordercolorswizzlefromimage :name "borderColorSwizzleFromImage" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSamplerBorderColorComponentMappingCreateInfoEXT"
;;       (sampler-border-color-component-mapping-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (components :pointer t :name components :type "VkComponentMapping" :create
;;      ((components-arg)
;;       (copy-object components components-arg '(:struct vkcomponentmapping)))
;;      :set
;;      ((components-arg)
;;       (copy-object components components-arg '(:struct vkcomponentmapping))))
;;     (srgb :name srgb :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDevicePageableDeviceLocalMemoryFeaturesEXT"
;;       (physical-device-pageable-device-local-memory-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pageabledevicelocalmemory :name "pageableDeviceLocalMemory" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceDescriptorSetHostMappingFeaturesVALVE"
;;       (physical-device-descriptor-set-host-mapping-features-valve)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (descriptorsethostmapping :name "descriptorSetHostMapping" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorSetBindingReferenceVALVE"
;;       (descriptor-set-binding-reference-valve)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (descriptorsetlayout :name "descriptorSetLayout" :type
;;      "VkDescriptorSetLayout" :create
;;      ((descriptorsetlayout-arg)
;;       (create-pointer descriptorsetlayout descriptorsetlayout-arg))
;;      :get (nil (get-pointer descriptorsetlayout)) :set
;;      ((descriptorsetlayout-arg)
;;       (set-pointer descriptorsetlayout descriptorsetlayout-arg)))
;;     (binding :name binding :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkDescriptorSetLayoutHostMappingInfoVALVE"
;;       (descriptor-set-layout-host-mapping-info-valve)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (descriptoroffset :name "descriptorOffset" :type size)
;;     (descriptorsize :name "descriptorSize" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentDensityMapOffsetFeaturesQCOM"
;;       (physical-device-fragment-density-map-offset-features-q-c-o-m)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fragmentdensitymapoffset :name "fragmentDensityMapOffset" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceFragmentDensityMapOffsetPropertiesQCOM"
;;       (physical-device-fragment-density-map-offset-properties-q-c-o-m)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fragmentdensityoffsetgranularity :pointer t :name
;;      "fragmentDensityOffsetGranularity" :type "VkExtent2D" :create
;;      ((fragmentdensityoffsetgranularity-arg)
;;       (copy-object fragmentdensityoffsetgranularity
;;        fragmentdensityoffsetgranularity-arg '(:struct vkextent2d)))
;;      :set
;;      ((fragmentdensityoffsetgranularity-arg)
;;       (copy-object fragmentdensityoffsetgranularity
;;        fragmentdensityoffsetgranularity-arg '(:struct vkextent2d)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkSubpassFragmentDensityMapOffsetEndInfoQCOM"
;;       (subpass-fragment-density-map-offset-end-info-q-c-o-m)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (fragmentdensityoffsetcount :name "fragmentDensityOffsetCount" :type uint32)
;;     (pfragmentdensityoffsets :name "pFragmentDensityOffsets" :type "VkOffset2D"
;;      :init-form nil :create
;;      ((pfragmentdensityoffsets-arg)
;;       (create-array (:struct vkoffset2d) pfragmentdensityoffsets
;;        pfragmentdensityoffsets-arg :dynamic t :pointers ("VkOffset2D")))
;;      :destroy (destroy-array pfragmentdensityoffsets) :get
;;      ((&optional pfragmentdensityoffsets-index)
;;       (get-array (:struct vkoffset2d) pfragmentdensityoffsets
;;        pfragmentdensityoffsets-index fragmentdensityoffsetcount :pointers
;;        ("VkOffset2D")))
;;      :set
;;      ((pfragmentdensityoffsets-arg &optional pfragmentdensityoffsets-index)
;;       (set-array (:struct vkoffset2d) pfragmentdensityoffsets
;;        pfragmentdensityoffsets-arg pfragmentdensityoffsets-index :dynamic t
;;        :pointers ("VkOffset2D")))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceLinearColorAttachmentFeaturesNV"
;;       (physical-device-linear-color-attachment-features-nv)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (linearcolorattachment :name "linearColorAttachment" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT"
;;       (physical-device-image-compression-control-swapchain-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (imagecompressioncontrolswapchain :name "imageCompressionControlSwapchain"
;;      :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT"
;;       (physical-device-subpass-merge-feedback-features-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (subpassmergefeedback :name "subpassMergeFeedback" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassCreationControlEXT"
;;       (render-pass-creation-control-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (disallowmerging :name "disallowMerging" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassCreationFeedbackInfoEXT"
;;       (render-pass-creation-feedback-info-ext)
;;       (:default-create :default-get :default-set)
;;     (postmergesubpasscount :name "postMergeSubpassCount" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassCreationFeedbackCreateInfoEXT"
;;       (render-pass-creation-feedback-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (prenderpassfeedback :name "pRenderPassFeedback" :type
;;      "VkRenderPassCreationFeedbackInfoEXT" :init-form nil :create
;;      ((prenderpassfeedback-arg)
;;       (create-pointer prenderpassfeedback prenderpassfeedback-arg))
;;      :get (nil (get-pointer prenderpassfeedback)) :set
;;      ((prenderpassfeedback-arg)
;;       (set-pointer prenderpassfeedback prenderpassfeedback-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassSubpassFeedbackInfoEXT"
;;       (render-pass-subpass-feedback-info-ext)
;;       (:default-create :default-get :default-set)
;;     (subpassmergestatus :name "subpassMergeStatus" :type
;;      "VkSubpassMergeStatusEXT")
;;     (description :name description :type char :create
;;      ((description-arg)
;;       (create-string description description-arg :dynamic nil))
;;      :get (nil (get-string description)) :set
;;      ((description-arg) (set-string description description-arg :dynamic nil)))
;;     (postmergeindex :name "postMergeIndex" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRenderPassSubpassFeedbackCreateInfoEXT"
;;       (render-pass-subpass-feedback-create-info-ext)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (psubpassfeedback :name "pSubpassFeedback" :type
;;      "VkRenderPassSubpassFeedbackInfoEXT" :init-form nil :create
;;      ((psubpassfeedback-arg)
;;       (create-pointer psubpassfeedback psubpassfeedback-arg))
;;      :get (nil (get-pointer psubpassfeedback)) :set
;;      ((psubpassfeedback-arg)
;;       (set-pointer psubpassfeedback psubpassfeedback-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-union doc-file
;;       "VkDeviceOrHostAddressKHR"
;;       (device-or-host-address-khr)
;;       (:default-create :default-get :default-set)
;;     (deviceaddress :name "deviceAddress" :type "VkDeviceAddress")
;;     (hostaddress :name "hostAddress" :type void :init-form nil :create
;;      ((hostaddress-arg) (create-pointer hostaddress hostaddress-arg)) :get
;;      (nil (get-pointer hostaddress)) :set
;;      ((hostaddress-arg) (set-pointer hostaddress hostaddress-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureBuildRangeInfoKHR"
;;       (acceleration-structure-build-range-info-khr)
;;       (:default-create :default-get :default-set)
;;     (primitivecount :name "primitiveCount" :type uint32)
;;     (primitiveoffset :name "primitiveOffset" :type uint32)
;;     (firstvertex :name "firstVertex" :type uint32)
;;     (transformoffset :name "transformOffset" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureGeometryTrianglesDataKHR"
;;       (acceleration-structure-geometry-triangles-data-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (vertexformat :name "vertexFormat" :type "VkFormat")
;;     (vertexdata :pointer t :name "vertexData" :type
;;      "VkDeviceOrHostAddressConstKHR" :create
;;      ((vertexdata-arg)
;;       (copy-object vertexdata vertexdata-arg
;;        '(:union vkdeviceorhostaddressconstkhr)))
;;      :set
;;      ((vertexdata-arg)
;;       (copy-object vertexdata vertexdata-arg
;;        '(:union vkdeviceorhostaddressconstkhr))))
;;     (vertexstride :name "vertexStride" :type "VkDeviceSize")
;;     (maxvertex :name "maxVertex" :type uint32)
;;     (indextype :name "indexType" :type "VkIndexType")
;;     (indexdata :pointer t :name "indexData" :type
;;      "VkDeviceOrHostAddressConstKHR" :create
;;      ((indexdata-arg)
;;       (copy-object indexdata indexdata-arg
;;        '(:union vkdeviceorhostaddressconstkhr)))
;;      :set
;;      ((indexdata-arg)
;;       (copy-object indexdata indexdata-arg
;;        '(:union vkdeviceorhostaddressconstkhr))))
;;     (transformdata :pointer t :name "transformData" :type
;;      "VkDeviceOrHostAddressConstKHR" :create
;;      ((transformdata-arg)
;;       (copy-object transformdata transformdata-arg
;;        '(:union vkdeviceorhostaddressconstkhr)))
;;      :set
;;      ((transformdata-arg)
;;       (copy-object transformdata transformdata-arg
;;        '(:union vkdeviceorhostaddressconstkhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureGeometryAabbsDataKHR"
;;       (acceleration-structure-geometry-aabbs-data-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (data :pointer t :name data :type "VkDeviceOrHostAddressConstKHR" :create
;;      ((data-arg)
;;       (copy-object data data-arg '(:union vkdeviceorhostaddressconstkhr)))
;;      :set
;;      ((data-arg)
;;       (copy-object data data-arg '(:union vkdeviceorhostaddressconstkhr))))
;;     (stride :name stride :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureGeometryInstancesDataKHR"
;;       (acceleration-structure-geometry-instances-data-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (arrayofpointers :name "arrayOfPointers" :type "VkBool32")
;;     (data :pointer t :name data :type "VkDeviceOrHostAddressConstKHR" :create
;;      ((data-arg)
;;       (copy-object data data-arg '(:union vkdeviceorhostaddressconstkhr)))
;;      :set
;;      ((data-arg)
;;       (copy-object data data-arg '(:union vkdeviceorhostaddressconstkhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-union doc-file
;;       "VkAccelerationStructureGeometryDataKHR"
;;       (acceleration-structure-geometry-data-khr)
;;       (:default-create :default-get :default-set)
;;     (triangles :pointer t :name triangles :type
;;      "VkAccelerationStructureGeometryTrianglesDataKHR" :create
;;      ((triangles-arg)
;;       (copy-object triangles triangles-arg
;;        '(:struct vkaccelerationstructuregeometrytrianglesdatakhr)))
;;      :set
;;      ((triangles-arg)
;;       (copy-object triangles triangles-arg
;;        '(:struct vkaccelerationstructuregeometrytrianglesdatakhr))))
;;     (aabbs :pointer t :name aabbs :type
;;      "VkAccelerationStructureGeometryAabbsDataKHR" :create
;;      ((aabbs-arg)
;;       (copy-object aabbs aabbs-arg
;;        '(:struct vkaccelerationstructuregeometryaabbsdatakhr)))
;;      :set
;;      ((aabbs-arg)
;;       (copy-object aabbs aabbs-arg
;;        '(:struct vkaccelerationstructuregeometryaabbsdatakhr))))
;;     (instances :pointer t :name instances :type
;;      "VkAccelerationStructureGeometryInstancesDataKHR" :create
;;      ((instances-arg)
;;       (copy-object instances instances-arg
;;        '(:struct vkaccelerationstructuregeometryinstancesdatakhr)))
;;      :set
;;      ((instances-arg)
;;       (copy-object instances instances-arg
;;        '(:struct vkaccelerationstructuregeometryinstancesdatakhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureGeometryKHR"
;;       (acceleration-structure-geometry-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (geometrytype :name "geometryType" :type "VkGeometryTypeKHR")
;;     (geometry :pointer t :name geometry :type
;;      "VkAccelerationStructureGeometryDataKHR" :create
;;      ((geometry-arg)
;;       (copy-object geometry geometry-arg
;;        '(:union vkaccelerationstructuregeometrydatakhr)))
;;      :set
;;      ((geometry-arg)
;;       (copy-object geometry geometry-arg
;;        '(:union vkaccelerationstructuregeometrydatakhr))))
;;     (flags :name flags :type "VkGeometryFlagsKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureBuildGeometryInfoKHR"
;;       (acceleration-structure-build-geometry-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (type :name type :type "VkAccelerationStructureTypeKHR")
;;     (flags :name flags :type "VkBuildAccelerationStructureFlagsKHR")
;;     (mode :name mode :type "VkBuildAccelerationStructureModeKHR")
;;     (srcaccelerationstructure :name "srcAccelerationStructure" :type
;;      "VkAccelerationStructureKHR" :create
;;      ((srcaccelerationstructure-arg)
;;       (create-pointer srcaccelerationstructure srcaccelerationstructure-arg))
;;      :get (nil (get-pointer srcaccelerationstructure)) :set
;;      ((srcaccelerationstructure-arg)
;;       (set-pointer srcaccelerationstructure srcaccelerationstructure-arg)))
;;     (dstaccelerationstructure :name "dstAccelerationStructure" :type
;;      "VkAccelerationStructureKHR" :create
;;      ((dstaccelerationstructure-arg)
;;       (create-pointer dstaccelerationstructure dstaccelerationstructure-arg))
;;      :get (nil (get-pointer dstaccelerationstructure)) :set
;;      ((dstaccelerationstructure-arg)
;;       (set-pointer dstaccelerationstructure dstaccelerationstructure-arg)))
;;     (geometrycount :name "geometryCount" :type uint32)
;;     (pgeometries :name "pGeometries" :type "VkAccelerationStructureGeometryKHR"
;;      :init-form nil :create
;;      ((pgeometries-arg)
;;       (create-array (:struct vkaccelerationstructuregeometrykhr) pgeometries
;;        pgeometries-arg :dynamic t :pointers
;;        ("VkAccelerationStructureGeometryKHR")))
;;      :destroy (destroy-array pgeometries) :get
;;      ((&optional pgeometries-index)
;;       (get-array (:struct vkaccelerationstructuregeometrykhr) pgeometries
;;        pgeometries-index geometrycount :pointers
;;        ("VkAccelerationStructureGeometryKHR")))
;;      :set
;;      ((pgeometries-arg &optional pgeometries-index)
;;       (set-array (:struct vkaccelerationstructuregeometrykhr) pgeometries
;;        pgeometries-arg pgeometries-index :dynamic t :pointers
;;        ("VkAccelerationStructureGeometryKHR"))))
;;     (ppgeometries :name "ppGeometries" :type
;;      "VkAccelerationStructureGeometryKHR" :init-form nil :create
;;      ((ppgeometries-arg) (create-pointer ppgeometries ppgeometries-arg)) :get
;;      (nil (get-pointer ppgeometries)) :set
;;      ((ppgeometries-arg) (set-pointer ppgeometries ppgeometries-arg)))
;;     (scratchdata :pointer t :name "scratchData" :type
;;      "VkDeviceOrHostAddressKHR" :create
;;      ((scratchdata-arg)
;;       (copy-object scratchdata scratchdata-arg
;;        '(:union vkdeviceorhostaddresskhr)))
;;      :set
;;      ((scratchdata-arg)
;;       (copy-object scratchdata scratchdata-arg
;;        '(:union vkdeviceorhostaddresskhr)))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureCreateInfoKHR"
;;       (acceleration-structure-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (createflags :name "createFlags" :type
;;      "VkAccelerationStructureCreateFlagsKHR")
;;     (buffer :name buffer :type "VkBuffer" :create
;;      ((buffer-arg) (create-pointer buffer buffer-arg)) :get
;;      (nil (get-pointer buffer)) :set
;;      ((buffer-arg) (set-pointer buffer buffer-arg)))
;;     (offset :name offset :type "VkDeviceSize")
;;     (size :name size :type "VkDeviceSize")
;;     (type :name type :type "VkAccelerationStructureTypeKHR")
;;     (deviceaddress :name "deviceAddress" :type "VkDeviceAddress"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkWriteDescriptorSetAccelerationStructureKHR"
;;       (write-descriptor-set-acceleration-structure-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (accelerationstructurecount :name "accelerationStructureCount" :type uint32)
;;     (paccelerationstructures :name "pAccelerationStructures" :type
;;      "VkAccelerationStructureKHR" :init-form nil :create
;;      ((paccelerationstructures-arg)
;;       (create-array vkaccelerationstructurekhr paccelerationstructures
;;        paccelerationstructures-arg :dynamic t :pointers nil))
;;      :destroy (destroy-array paccelerationstructures) :get
;;      ((&optional paccelerationstructures-index)
;;       (get-array vkaccelerationstructurekhr paccelerationstructures
;;        paccelerationstructures-index accelerationstructurecount :pointers nil))
;;      :set
;;      ((paccelerationstructures-arg &optional paccelerationstructures-index)
;;       (set-array vkaccelerationstructurekhr paccelerationstructures
;;        paccelerationstructures-arg paccelerationstructures-index :dynamic t
;;        :pointers nil))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceAccelerationStructureFeaturesKHR"
;;       (physical-device-acceleration-structure-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (accelerationstructure :name "accelerationStructure" :type "VkBool32")
;;     (accelerationstructurecapturereplay :name
;;      "accelerationStructureCaptureReplay" :type "VkBool32")
;;     (accelerationstructureindirectbuild :name
;;      "accelerationStructureIndirectBuild" :type "VkBool32")
;;     (accelerationstructurehostcommands :name
;;      "accelerationStructureHostCommands" :type "VkBool32")
;;     (descriptorbindingaccelerationstructureupdateafterbind :name
;;      "descriptorBindingAccelerationStructureUpdateAfterBind" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceAccelerationStructurePropertiesKHR"
;;       (physical-device-acceleration-structure-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxgeometrycount :name "maxGeometryCount" :type uint64)
;;     (maxinstancecount :name "maxInstanceCount" :type uint64)
;;     (maxprimitivecount :name "maxPrimitiveCount" :type uint64)
;;     (maxperstagedescriptoraccelerationstructures :name
;;      "maxPerStageDescriptorAccelerationStructures" :type uint32)
;;     (maxperstagedescriptorupdateafterbindaccelerationstructures :name
;;      "maxPerStageDescriptorUpdateAfterBindAccelerationStructures" :type uint32)
;;     (maxdescriptorsetaccelerationstructures :name
;;      "maxDescriptorSetAccelerationStructures" :type uint32)
;;     (maxdescriptorsetupdateafterbindaccelerationstructures :name
;;      "maxDescriptorSetUpdateAfterBindAccelerationStructures" :type uint32)
;;     (minaccelerationstructurescratchoffsetalignment :name
;;      "minAccelerationStructureScratchOffsetAlignment" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureDeviceAddressInfoKHR"
;;       (acceleration-structure-device-address-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (accelerationstructure :name "accelerationStructure" :type
;;      "VkAccelerationStructureKHR" :create
;;      ((accelerationstructure-arg)
;;       (create-pointer accelerationstructure accelerationstructure-arg))
;;      :get (nil (get-pointer accelerationstructure)) :set
;;      ((accelerationstructure-arg)
;;       (set-pointer accelerationstructure accelerationstructure-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureVersionInfoKHR"
;;       (acceleration-structure-version-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (pversiondata :name "pVersionData" :type uint8 :init-form nil :create
;;      ((pversiondata-arg) (create-pointer pversiondata pversiondata-arg)) :get
;;      (nil (get-pointer pversiondata)) :set
;;      ((pversiondata-arg) (set-pointer pversiondata pversiondata-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCopyAccelerationStructureToMemoryInfoKHR"
;;       (copy-acceleration-structure-to-memory-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (src :name src :type "VkAccelerationStructureKHR" :create
;;      ((src-arg) (create-pointer src src-arg)) :get (nil (get-pointer src)) :set
;;      ((src-arg) (set-pointer src src-arg)))
;;     (dst :pointer t :name dst :type "VkDeviceOrHostAddressKHR" :create
;;      ((dst-arg) (copy-object dst dst-arg '(:union vkdeviceorhostaddresskhr)))
;;      :set
;;      ((dst-arg) (copy-object dst dst-arg '(:union vkdeviceorhostaddresskhr))))
;;     (mode :name mode :type "VkCopyAccelerationStructureModeKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCopyMemoryToAccelerationStructureInfoKHR"
;;       (copy-memory-to-acceleration-structure-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (src :pointer t :name src :type "VkDeviceOrHostAddressConstKHR" :create
;;      ((src-arg)
;;       (copy-object src src-arg '(:union vkdeviceorhostaddressconstkhr)))
;;      :set
;;      ((src-arg)
;;       (copy-object src src-arg '(:union vkdeviceorhostaddressconstkhr))))
;;     (dst :name dst :type "VkAccelerationStructureKHR" :create
;;      ((dst-arg) (create-pointer dst dst-arg)) :get (nil (get-pointer dst)) :set
;;      ((dst-arg) (set-pointer dst dst-arg)))
;;     (mode :name mode :type "VkCopyAccelerationStructureModeKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkCopyAccelerationStructureInfoKHR"
;;       (copy-acceleration-structure-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (src :name src :type "VkAccelerationStructureKHR" :create
;;      ((src-arg) (create-pointer src src-arg)) :get (nil (get-pointer src)) :set
;;      ((src-arg) (set-pointer src src-arg)))
;;     (dst :name dst :type "VkAccelerationStructureKHR" :create
;;      ((dst-arg) (create-pointer dst dst-arg)) :get (nil (get-pointer dst)) :set
;;      ((dst-arg) (set-pointer dst dst-arg)))
;;     (mode :name mode :type "VkCopyAccelerationStructureModeKHR"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkAccelerationStructureBuildSizesInfoKHR"
;;       (acceleration-structure-build-sizes-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (accelerationstructuresize :name "accelerationStructureSize" :type
;;      "VkDeviceSize")
;;     (updatescratchsize :name "updateScratchSize" :type "VkDeviceSize")
;;     (buildscratchsize :name "buildScratchSize" :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRayTracingShaderGroupCreateInfoKHR"
;;       (ray-tracing-shader-group-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (type :name type :type "VkRayTracingShaderGroupTypeKHR")
;;     (generalshader :name "generalShader" :type uint32)
;;     (closesthitshader :name "closestHitShader" :type uint32)
;;     (anyhitshader :name "anyHitShader" :type uint32)
;;     (intersectionshader :name "intersectionShader" :type uint32)
;;     (pshadergroupcapturereplayhandle :name "pShaderGroupCaptureReplayHandle"
;;      :type void :init-form nil :create
;;      ((pshadergroupcapturereplayhandle-arg)
;;       (create-pointer pshadergroupcapturereplayhandle
;;        pshadergroupcapturereplayhandle-arg))
;;      :get (nil (get-pointer pshadergroupcapturereplayhandle)) :set
;;      ((pshadergroupcapturereplayhandle-arg)
;;       (set-pointer pshadergroupcapturereplayhandle
;;        pshadergroupcapturereplayhandle-arg))))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRayTracingPipelineInterfaceCreateInfoKHR"
;;       (ray-tracing-pipeline-interface-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (maxpipelineraypayloadsize :name "maxPipelineRayPayloadSize" :type uint32)
;;     (maxpipelinerayhitattributesize :name "maxPipelineRayHitAttributeSize"
;;      :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkRayTracingPipelineCreateInfoKHR"
;;       (ray-tracing-pipeline-create-info-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (flags :name flags :type "VkPipelineCreateFlags")
;;     (stagecount :name "stageCount" :type uint32)
;;     (pstages :name "pStages" :type "VkPipelineShaderStageCreateInfo" :init-form
;;      nil :create
;;      ((pstages-arg)
;;       (create-array (:struct vkpipelineshaderstagecreateinfo) pstages
;;        pstages-arg :dynamic t :pointers ("VkPipelineShaderStageCreateInfo")))
;;      :destroy (destroy-array pstages) :get
;;      ((&optional pstages-index)
;;       (get-array (:struct vkpipelineshaderstagecreateinfo) pstages
;;        pstages-index stagecount :pointers ("VkPipelineShaderStageCreateInfo")))
;;      :set
;;      ((pstages-arg &optional pstages-index)
;;       (set-array (:struct vkpipelineshaderstagecreateinfo) pstages pstages-arg
;;        pstages-index :dynamic t :pointers ("VkPipelineShaderStageCreateInfo"))))
;;     (groupcount :name "groupCount" :type uint32)
;;     (pgroups :name "pGroups" :type "VkRayTracingShaderGroupCreateInfoKHR"
;;      :init-form nil :create
;;      ((pgroups-arg)
;;       (create-array (:struct vkraytracingshadergroupcreateinfokhr) pgroups
;;        pgroups-arg :dynamic t :pointers
;;        ("VkRayTracingShaderGroupCreateInfoKHR")))
;;      :destroy (destroy-array pgroups) :get
;;      ((&optional pgroups-index)
;;       (get-array (:struct vkraytracingshadergroupcreateinfokhr) pgroups
;;        pgroups-index groupcount :pointers
;;        ("VkRayTracingShaderGroupCreateInfoKHR")))
;;      :set
;;      ((pgroups-arg &optional pgroups-index)
;;       (set-array (:struct vkraytracingshadergroupcreateinfokhr) pgroups
;;        pgroups-arg pgroups-index :dynamic t :pointers
;;        ("VkRayTracingShaderGroupCreateInfoKHR"))))
;;     (maxpipelinerayrecursiondepth :name "maxPipelineRayRecursionDepth" :type
;;      uint32)
;;     (plibraryinfo :name "pLibraryInfo" :type "VkPipelineLibraryCreateInfoKHR"
;;      :init-form nil :create
;;      ((plibraryinfo-arg) (create-pointer plibraryinfo plibraryinfo-arg)) :get
;;      (nil (get-pointer plibraryinfo)) :set
;;      ((plibraryinfo-arg) (set-pointer plibraryinfo plibraryinfo-arg)))
;;     (plibraryinterface :name "pLibraryInterface" :type
;;      "VkRayTracingPipelineInterfaceCreateInfoKHR" :init-form nil :create
;;      ((plibraryinterface-arg)
;;       (create-pointer plibraryinterface plibraryinterface-arg))
;;      :get (nil (get-pointer plibraryinterface)) :set
;;      ((plibraryinterface-arg)
;;       (set-pointer plibraryinterface plibraryinterface-arg)))
;;     (pdynamicstate :name "pDynamicState" :type
;;      "VkPipelineDynamicStateCreateInfo" :init-form nil :create
;;      ((pdynamicstate-arg) (create-pointer pdynamicstate pdynamicstate-arg))
;;      :get (nil (get-pointer pdynamicstate)) :set
;;      ((pdynamicstate-arg) (set-pointer pdynamicstate pdynamicstate-arg)))
;;     (layout :name layout :type "VkPipelineLayout" :create
;;      ((layout-arg) (create-pointer layout layout-arg)) :get
;;      (nil (get-pointer layout)) :set
;;      ((layout-arg) (set-pointer layout layout-arg)))
;;     (basepipelinehandle :name "basePipelineHandle" :type "VkPipeline" :create
;;      ((basepipelinehandle-arg)
;;       (create-pointer basepipelinehandle basepipelinehandle-arg))
;;      :get (nil (get-pointer basepipelinehandle)) :set
;;      ((basepipelinehandle-arg)
;;       (set-pointer basepipelinehandle basepipelinehandle-arg)))
;;     (basepipelineindex :name "basePipelineIndex" :type int32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRayTracingPipelineFeaturesKHR"
;;       (physical-device-ray-tracing-pipeline-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (raytracingpipeline :name "rayTracingPipeline" :type "VkBool32")
;;     (raytracingpipelineshadergrouphandlecapturereplay :name
;;      "rayTracingPipelineShaderGroupHandleCaptureReplay" :type "VkBool32")
;;     (raytracingpipelineshadergrouphandlecapturereplaymixed :name
;;      "rayTracingPipelineShaderGroupHandleCaptureReplayMixed" :type "VkBool32")
;;     (raytracingpipelinetraceraysindirect :name
;;      "rayTracingPipelineTraceRaysIndirect" :type "VkBool32")
;;     (raytraversalprimitiveculling :name "rayTraversalPrimitiveCulling" :type
;;      "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRayTracingPipelinePropertiesKHR"
;;       (physical-device-ray-tracing-pipeline-properties-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (shadergrouphandlesize :name "shaderGroupHandleSize" :type uint32)
;;     (maxrayrecursiondepth :name "maxRayRecursionDepth" :type uint32)
;;     (maxshadergroupstride :name "maxShaderGroupStride" :type uint32)
;;     (shadergroupbasealignment :name "shaderGroupBaseAlignment" :type uint32)
;;     (shadergrouphandlecapturereplaysize :name
;;      "shaderGroupHandleCaptureReplaySize" :type uint32)
;;     (maxraydispatchinvocationcount :name "maxRayDispatchInvocationCount" :type
;;      uint32)
;;     (shadergrouphandlealignment :name "shaderGroupHandleAlignment" :type uint32)
;;     (maxrayhitattributesize :name "maxRayHitAttributeSize" :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkStridedDeviceAddressRegionKHR"
;;       (strided-device-address-region-khr)
;;       (:default-create :default-get :default-set)
;;     (deviceaddress :name "deviceAddress" :type "VkDeviceAddress")
;;     (stride :name stride :type "VkDeviceSize")
;;     (size :name size :type "VkDeviceSize"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkTraceRaysIndirectCommandKHR"
;;       (trace-rays-indirect-command-khr)
;;       (:default-create :default-get :default-set)
;;     (width :name width :type uint32)
;;     (height :name height :type uint32)
;;     (depth :name depth :type uint32))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it.")

;;   (more-cffi:def-foreign-struct doc-file
;;       "VkPhysicalDeviceRayQueryFeaturesKHR"
;;       (physical-device-ray-query-features-khr)
;;       (:default-create :default-get :default-set)
;;     (stype :name "sType" :type "VkStructureType")
;;     (pnext :name "pNext" :type void :init-form nil :create
;;      ((pnext-arg) (create-pointer pnext pnext-arg)) :get
;;      (nil (get-pointer pnext)) :set ((pnext-arg) (set-pointer pnext pnext-arg)))
;;     (rayquery :name "rayQuery" :type "VkBool32"))

;;   (more-cffi:doc-note doc-file
;;                       "This struct needs to be revised. Please, post an issue to request it."))
