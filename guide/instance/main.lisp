
(in-package :cvg)

(adp:in-file #P"docs/guide/instance/main")

(adp:header "Instance source code" instance-source-header)

(adp:code-block (instance-tag)
  instance-tag)

(adp:code-tag (instance-tag)

  (in-package :cvg)
  
  (defconstant +width+ 800)
  (defconstant +height+ 600)

  (defstruct triangle-app
    window
    instance)


  (defun create-instance (app)
    (cvk:with-application-info app-info (:sType cvk:VK_STRUCTURE_TYPE_APPLICATION_INFO
					 :pApplicationName "Hello triangle"
					 :applicationVersion (cvk:VK_MAKE_VERSION 1 0 0)
					 :pEngineName "No Engine"
					 :engineVersion (cvk:VK_MAKE_VERSION 1 0 0)
					 :apiVersion cvk:VK_API_VERSION_1_0)
      (cvk:with-instance-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
						  :pApplicationInfo ))))


  (defun init-window (app)
    (glfw:init)
    (glfw:window-hint glfw:GLFW_CLIENT_API glfw:GLFW_NO_API)
    (glfw:window-hint glfw:GLFW_RESIZABLE  nil)
    
    (setf (triangle-app-window app) (glfw:create-window +width+ +height+ "Vulkan" nil nil)))


  (defun init-vulkan (app)
    (create-instance app))

  (defun main-loop (app)
    (loop while (not (glfw:window-should-close (triangle-app-window app)))
	  do (glfw:poll-events)))

  (defun cleanup (app)
    (glfw:destroy-window (triangle-app-window app))
    (glfw:terminate))

  (defun run (app)
    (init-window app)
    (init-vulkan app)
    (main-loop app)
    (cleanup app))

  (defun main ()
    (let ((app (make-triangle-app)))
      (run app)))

  )
