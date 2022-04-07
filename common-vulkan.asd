
(asdf:defsystem "common-vulkan"
   :depends-on ("cffi" "cl-glfw")
   :components (
                ; Vulkan
                (:file "vulkan/load-vulkan")
                (:file "package")
                (:file "vulkan/vk-types")
                (:file "vulkan/s-type-table")
                (:file "vulkan/vk-macros")
                (:file "vulkan/vk-funcs")

                ; Common Vulkan
                (:file "src/instance")
                (:file "src/window")
                (:file "src/surface")
                (:file "src/physical-device")))
