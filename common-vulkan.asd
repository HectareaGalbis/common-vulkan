
(asdf:defsystem "common-vulkan"
   :depends-on ("cffi" "more-cffi" "iterate" "alexandria")
   :components (
                ;; Vulkan
                (:file "vulkan/load-vulkan")
                (:file "package")
                (:file "vulkan/ctypes" :depends-on ("src/constants" "src/enums"))
                (:file "vulkan/cfunctions")

		;; Common Vulkan
		(:file "src/initial-parameters")
		(:file "src/constants")
                (:file "src/enums")
                (:file "src/structs")
		(:file "src/functions")
		(:file "src/callbacks")))
		
