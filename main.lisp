
(glfw:init)

(cvk:with-vulkan-instance (instance t)
  (format t "Dentro de vulkan-instance~%")
  4)

(format t "Por fin~%")

(glfw:terminate)
