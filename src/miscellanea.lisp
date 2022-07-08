
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/miscellanea.md"))


  (mcffi:doc-header "Miscellanea" doc-file)


  (mcffi:doc-subheader "Structs" doc-file)


  (mcffi:def-foreign-struct "VkExtent2D" extent-2d doc-file
      (:enable-default-create :enable-default-get :enable-default-set)
    (width :type uint32)
    (height :type uint32)))
