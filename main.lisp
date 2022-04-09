
(asdf:load-system "common-vulkan")


(defun main ()
  (glfw:with-glfw
    (cvk:with-vulkan-instance (instance t)
      (cvk:with-window (window "My window" 640 480)
        (cvk:with-surface (surface instance window)
          (cvk:with-physical-device (physical-device instance :surface surface)
            (sleep 5)
            (print "Hola")
            (values)))))))
