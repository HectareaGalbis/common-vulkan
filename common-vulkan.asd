
(asdf:defsystem "common-vulkan"
   :depends-on ("cffi" "more-cffi" "iterate" "alexandria")
   :components ((:file "package")
		
                ;; Vulkan
		(:module "vulkan"
		 :components ((:file "load-vulkan")
			      (:file "ctypes" :depends-on ("src/constants"))
			      (:file "cfunctions")))
                
		;; Common Vulkan
		(:module "src"
		 :components ((:file "initial-parameters")
			      (:file "helper-functions")
			      (:file "constants")
			      (:file "structs")
			      (:file "functions")
			      (:file "callbacks")))))


(asdf:defsystem "common-vulkan/generation"
  :depends-on ("cffi" "more-cffi" "cl-ppcre" "alexandria")
  :components ((:file "package")
	       (:module "vulkan"
		:components ((:file "generate")))))
		
