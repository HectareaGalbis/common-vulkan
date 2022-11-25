
(in-package :cvg)

(adp:write-in-file #P"base-code-source")

(adp:header "Base code source" base-code-source-header)

(adp:code-block (base-code-tag)
  base-code-tag)

(code-tag (base-code-tag)

  (adp:code-tag (integrating-glfw-tag-2)
    (defconstant +width+ 800)
    (defconstant +height+ 600)

    (adp:code-tag (general-structure-tag)
      (defstruct triangle-app
	(window nil))))


  (adp:code-tag (integrating-glfw-tag integrating-glfw-tag-3)
    (defun init-window (app)
      (adp:remove-code (integrating-glfw-tag)
	(glfw:window-hint glfw:GLFW_CLIENT_API glfw:GLFW_NO_API)
        (glfw:window-hint glfw:GLFW_RESIZABLE  nil)

        (setf (triangle-app-window app) (glfw:create-window +width+ +height+ "Vulkan" nil nil)))))


  (adp:code-tag (general-structure-tag)

    (defun init-vulkan (app))

    (adp:code-tag (integrating-glfw-tag-4)
      (defun main-loop (app)
	(adp:remove-code (general-structure-tag)
	  (loop while (not (glfw:window-should-close (triangle-app-window app)))
	        do (glfw:poll-events)))))

    (adp:code-tag (integrating-glfw-tag-5)
      (defun cleanup (app)
        (adp:remove-code (general-structure-tag)
	  (glfw:destroy-window (triangle-app-window app))
          (glfw:terminate))))

    (adp:code-tag (integrating-glfw-tag)
      (defun run (app)
        (adp:remove-code (general-structure-tag)
	  (init-window app))
        (init-vulkan app)
        (main-loop app)
        (cleanup app)))

    (defun main ()
      (let ((app (make-hello-triangle-application)))
	(run app))))

  )
