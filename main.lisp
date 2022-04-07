
(asdf:load-system "common-vulkan")

(declaim (optimize (speed 0) (space 0) (debug 3)))

(defun main ()
  (glfw:with-glfw
    (cvk:with-vulkan-instance (instance t)
      (cvk:with-window (window "My window" 640 480)
        (cvk:with-surface (surface instance window)
          (cvk:with-physical-device (physical-device instance :surface surface)
            (sleep 10)
            (print "Hola")))))))
