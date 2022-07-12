
(asdf:defsystem "common-vulkan"
   :depends-on ("cffi" "more-cffi" "iterate" "alexandria")
   :components (
                ;; Vulkan
                (:file "vulkan/load-vulkan")
                (:file "package")
                (:file "vulkan/vk-types")
                (:file "vulkan/s-type-table")
                (:file "vulkan/vk-macros")
                (:file "vulkan/vk-funcs")
                (:file "vulkan/support")
                (:file "vulkan/debug-utils")

		;; Common Vulkan
		(:file "src/miscellanea")
                (:file "src/instance")
                (:file "src/debug-utils-ext")
		(:file "src/physical-device")
		(:file "src/device")
		(:file "src/surface")
		(:file "src/swapchain")
		(:file "src/image-view")
		(:file "src/shader-module")
		(:file "src/pipeline")
		(:file "src/render-pass")))
		
