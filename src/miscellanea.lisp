
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/miscellanea.md"))


  (mcffi:doc-header "Miscellanea" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)


  (mcffi:def-foreign-struct "VkExtent2D" extent-2d doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (width :type uint32)
    (height :type uint32))



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
    (layerCount :name "layerCount" :type uint32)))
