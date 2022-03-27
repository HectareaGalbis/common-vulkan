

(let ((instance (cvk:create-vulkan-instance)))
  (format t "Hola vulkan")
  (cvk:destroy-vulkan-instance instance))
