
(cffi:defcunion VkClearColorValue 
    (float32 :float :count 4)
  (int32 :int32 :count 4)
  (uint32 :uint32 :count 4))

(cffi:defcunion VkClearValue 
    (color (:union VkClearColorValue))
  (depthStencil (:struct VkClearDepthStencilValue)))

(cffi:defcunion VkPerformanceCounterResultKHR 
    (int32 :int32)
  (int64 :int64)
  (uint32 :uint32)
  (uint64 :uint64)
  (float32 :float)
  (float64 :double))

(cffi:defcunion VkPipelineExecutableStatisticValueKHR 
    (b32 VkBool32)
  (i64 :int64)
  (u64 :uint64)
  (f64 :double))

(cffi:defcunion VkPerformanceValueDataINTEL 
    (value32 :uint32)
  (value64 :uint64)
  (valueFloat :float)
  (valueBool VkBool32)
  (valueString :pointer))

(cffi:defcunion VkDeviceOrHostAddressConstKHR 
    (deviceAddress VkDeviceAddress)
  (hostAddress :pointer))

(cffi:defcunion VkAccelerationStructureMotionInstanceDataNV 
    (staticInstance (:struct VkAccelerationStructureInstanceKHR))
  (matrixMotionInstance (:struct VkAccelerationStructureMatrixMotionInstanceNV))
  (srtMotionInstance (:struct VkAccelerationStructureSRTMotionInstanceNV)))

(cffi:defcunion VkDeviceOrHostAddressKHR 
    (deviceAddress VkDeviceAddress)
  (hostAddress :pointer))

(cffi:defcunion VkAccelerationStructureGeometryDataKHR 
    (triangles (:struct VkAccelerationStructureGeometryTrianglesDataKHR))
  (aabbs (:struct VkAccelerationStructureGeometryAabbsDataKHR))
  (instances (:struct VkAccelerationStructureGeometryInstancesDataKHR)))

