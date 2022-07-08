
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/surface.md"))


  (mcffi:doc-header "Surface" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)


  (mcffi:def-foreign-struct "VkSurfaceCapabilitiesKHR" surface-capabilities doc-file
      (:no-constructor :no-destructor :enable-default-get)
    (minImageCount :name "minImageCount" :type uint32)
    (maxImageCount :name "maxImageCount" :type uint32_t)
    (currentExtent :name "currentExtent" :type VkExtent2D)
    (minImageExtent :name "minImageExtent" :type VkExtent2D)
    (maxImageExtent :name "maxImageExtent" :type VkExtent2D)
    (maxImageArrayLayers :name "maxImageArrayLayers" :type uint32_t)
    (supportedTransforms :name "supportedTransforms" :type VkSurfaceTransformFlagsKHR)
    (currentTransform :name "currentTransform" :type VkSurfaceTransformFlagBitsKHR)
    (supportedCompositeAlpha :name "supportedCompositeAlpha" :type VkCompositeAlphaFlagsKHR)
    (supportedUsageFlags :name "supportedUsageFlags" :type VkImageUsageFlags))



  (mcffi:def-foreign-struct "VkSurfaceFormatKHR" surface-format doc-file
      (:no-constructor :no-destructor :enable-default-get)
    (format :type "VkFormat")
    (colorSpace :name "colorSpace" :type "VkColorSpaceKHR"))
  
  

  (mcffi:doc-subheader "Functions" doc-file)
  

  (mcffi:doc-subsubheader "vkDestroySurfaceKHR" doc-file)
  
  (mcffi:def-foreign-function destroy-surface doc-file (instance surface pAllocator)
    (declare-types ("VkInstance" instance) ("VkSurfaceKHR" surface) ("VkAllocationCallbacks" "pAllocator"))
    (let ((pAllocator-c (or pAllocator (cffi:null-pointer))))
      (vkDestroySurfaceKHR instance surface pAllocator-c))))
