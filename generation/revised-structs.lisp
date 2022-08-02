
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
    (pNext              :name "pNext" :type "pointer" :init-form nil
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
    (pNext                   :name "pNext" :type pointer :init-form nil
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
			 (set-string description description-arg :dynamic nil)))))


