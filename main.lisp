
(asdf:load-system "common-vulkan")


(defun main ()
  (cvk:nest ((glfw:with-glfw)
             (cvk:with-vk-instance (instance t))
             (cvk:with-glfw-window (window "My window" 640 480))
             (cvk:with-vk-surface (surface instance window))
             (cvk:with-vk-physical-device (physical-device instance :surface surface))
             (let ((queue-family (cvk:vk-physical-device-queue-family physical-device :surface surface)))))
    (format t "~S~%" queue-family)))
