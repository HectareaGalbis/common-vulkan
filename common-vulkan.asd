
(asdf:defsystem "common-vulkan"
   :depends-on ("cffi")
   :components (
                ; Vulkan
                (:file "vulkan/package")
                (:file "vulkan/s-type-table")
                (:file "vulkan/vk-funcs")
                (:file "vulkan/vk-macros")
                (:file "vulkan/vk-types")

                ; Common Vulkan))
