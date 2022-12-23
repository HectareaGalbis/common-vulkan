
(asdf:defsystem "common-vulkan"
   :depends-on ("cffi" "more-cffi" "alexandria" "adp")
   :components ((:file "package")
		
                ;; Vulkan
		(:file "vulkan/load-vulkan")
		(:file "vulkan/ctypes" :depends-on ("src/constants"))
		(:file "vulkan/cfunctions")
                
		;; Common Vulkan
		;; (:file "initial-parameters")
		(:file "src/helper-functions")
		(:file "src/constants")
		(:file "src/structs")
		(:file "src/functions")
		(:file "src/callbacks")))


(asdf:defsystem "common-vulkan/generation"
  :depends-on ("cffi" "more-cffi" "cl-ppcre" "alexandria")
  :components ((:file "package")
	       (:module "vulkan"
		:components ((:file "generate")))))


(asdf:defsystem "common-vulkan/guide"
  :depends-on ("common-vulkan" "adp" "cl-glfw")
  :components ((:module "guide"
		:components ((:file "package")
			     (:file "base-code/main")))))


(asdf:defsystem "common-vulkan/docs"
  :depends-on ("cffi" "more-cffi" "alexandria" "cl-glfw" "adp")
  :components ((:file "package")
	       
               ;; Vulkan
	       (:file "vulkan/load-vulkan")
	       (:file "vulkan/ctypes" :depends-on ("src/constants"))
	       (:file "vulkan/cfunctions")
               
	       ;; Common Vulkan
	       ;; (:file "initial-parameters")
	       (:file "src/helper-functions")
	       (:file "src/constants")
	       (:file "src/structs")
	       (:file "src/functions")
	       (:file "src/callbacks")

	       ;; API
	       (:module "reference"
		:components ((:file "reference")))
	       
	       ;; Readme
	       (:file "README")
))
		
