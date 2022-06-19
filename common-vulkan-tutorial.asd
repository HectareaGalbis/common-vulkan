


(asdf:defsystem "common-vulkan-tutorial"
  :depends-on ("cl-glfw" "common-vulkan")
  :components ((:module "examples/vulkan-tutorial"
	        :components ((:file "package")
	                     (:file "main")))))
