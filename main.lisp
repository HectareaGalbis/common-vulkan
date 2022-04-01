

(defun main ()

  (glfw:with-glfw
    (cvk:with-vulkan-instance (instance t)
      (cvk:with-window (window "My window" 640 480)
        (cvk:with-surface (surface instance window)
          (sleep 10))))))
