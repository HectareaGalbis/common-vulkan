
(asdf:defsystem "common-vulkan"
   :depends-on ("cffi" "cl-glfw")
   :components (
                ; Vulkan
                (:file "vulkan/load-vulkan")
                (:file "package")
                #|(:file "vulkan/package")|#
                (:file "vulkan/vk-types")
                (:file "vulkan/s-type-table")
                (:file "vulkan/vk-macros")
                (:file "vulkan/vk-funcs")

                ; Common Vulkan
                (:file "src/instance")))
                
