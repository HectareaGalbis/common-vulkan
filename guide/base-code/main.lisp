
(in-package :cvg)

(adp:in-file #P"docs/guide/base-code/main")

(adp:header "Base code source code" base-code-source-header)

(adp:code-block (base-code-tag)
  base-code-tag)

(adp:code-tag (base-code-tag)

  @'((in-package :cvg))
  
  (adp:code-tag (integrating-glfw-tag-2)
    (defconstant +width+ 800)
    (defconstant +height+ 600)

    (adp:code-tag (general-structure-tag)
      (defstruct triangle-app
	@_((general-structure-tag)
	   window))))


  (adp:code-tag (integrating-glfw-tag integrating-glfw-tag-3)
    (defun init-window (app)
      (glfw:init)
      (glfw:window-hint glfw:GLFW_CLIENT_API glfw:GLFW_NO_API)
      (glfw:window-hint glfw:GLFW_RESIZABLE  nil)

      @_((integrating-glfw-tag-3)
	 @'((setf (triangle-app-window app) (glfw:create-window 800 600 "Vulkan" nil nil))))
      @_((integrating-glfw-tag)
	 (setf (triangle-app-window app) (glfw:create-window +width+ +height+ "Vulkan" nil nil)))))


  (adp:code-tag (general-structure-tag)

    (defun init-vulkan (app))

    (adp:code-tag (integrating-glfw-tag-4)
      (defun main-loop (app)
	@_((general-structure-tag)
	   (loop while (not (glfw:window-should-close (triangle-app-window app)))
	         do (glfw:poll-events)))))

    (adp:code-tag (integrating-glfw-tag-5)
      (defun cleanup (app)
        @_((general-structure-tag)
	   (glfw:destroy-window (triangle-app-window app))
           (glfw:terminate))))

    (adp:code-tag (integrating-glfw-tag)
      (defun run (app)
        @_((general-structure-tag)
	   (init-window app))
        (init-vulkan app)
        (main-loop app)
        (cleanup app)))

    (defun main ()
      (let ((app (make-triangle-app)))
	(run app))))

  )
