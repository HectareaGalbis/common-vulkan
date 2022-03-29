

(defun main ()

  (glfw:with-glfw

    (cvk:with-vulkan-instance (instance t)
      (loop for extension in (cvk:get-vulkan-instance-enabled-extensions instance)
        do (print extension)))

    (format t "Por fin~%")

    (unwind-protect
      (unwind-protect
        (* 1 0)
        (print "Primero"))
      (print "Segundo"))

    (print "Tercero")))
