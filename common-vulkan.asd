
(asdf:defsystem "common-vulkan"
   :depends-on ("cffi" "cl-glfw" "iterate" "alexandria")
   :components (
                ; Vulkan
                (:file "vulkan/load-vulkan")
                (:file "package")
                (:file "vulkan/vk-types")
                (:file "vulkan/s-type-table")
                (:file "vulkan/vk-macros")
                (:file "vulkan/vk-funcs")
                (:file "vulkan/support")
                (:file "vulkan/debug-utils")

                ; Common Vulkan
                (:file "src/instance")
                (:file "src/debug-messenger")
                (:file "src/window")
                (:file "src/surface")
                (:file "src/physical-device")
                (:file "src/queue-family")
                (:file "src/device")
                (:file "src/semaphore")
                (:file "src/fence")
                (:file "src/command-pool")
                (:file "src/command-buffer")
                (:file "src/queue")
                (:file "src/swapchain")
                (:file "src/shader-module")
                (:file "src/render-pass")))
