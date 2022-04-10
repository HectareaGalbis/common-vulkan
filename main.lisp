
(asdf:load-system "common-vulkan")


(defun main ()
  (cvk:nest ((glfw:with-glfw)
             (cvk:with-vk-instance (instance t))
             (cvk:with-glfw-window (window "My window" 640 480))
             (let ((seconds 5) (text "Hello world")))
             (cvk:with-vk-surface (surface instance window))
             (cvk:with-vk-physical-device (physical-device instance :surface surface)))
    (sleep seconds)
    (print text)
    (values)))
