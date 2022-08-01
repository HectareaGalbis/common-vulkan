
(in-package :cvk)

(defmacro create-pointer (slot slot-arg)
  `(setf ,slot (or ,slot-arg (cffi-sys:null-pointer))))

(defmacro get-pointer (slot)
  `(if (cffi-sys:null-pointer-p ,slot)
       nil
       ,slot))

(defmacro set-pointer (slot new-value)
  `(setf ,slot (or ,new-value (cffi-sys:null-pointer))))

(defmacro create-string (slot slot-arg)
  `(setf ,slot
           (if ,slot-arg
               (cffi:foreign-string-alloc ,slot-arg)
               (cffi-sys:null-pointer))))

(defmacro destroy-string (slot)
  `(when (not (cffi-sys:null-pointer-p ,slot))
     (cffi:foreign-string-free ,slot)))

(defmacro get-string (slot) `(cffi:foreign-string-to-lisp ,slot))

(defmacro set-string (slot new-value)
  `(progn (destroy-string ,slot) (create-string ,slot ,new-value)))

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

  
  (more-cffi:def-foreign-struct doc-file "VkExtent2D" (extent-2d)
      (:default-create :default-get :default-set)
    (width :name width :type uint32)
    (height :name height :type uint32)))


