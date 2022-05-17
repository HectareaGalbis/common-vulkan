

(asdf:load-system "common-vulkan") ;:force t)

(defun main ()
  (cvk:nest ((glfw:with-glfw)
             (cvk:with-instance instance (t))
             (cvk:with-debug-messenger () (instance))
             (cvk:with-window window ("My window" 640 480))
             (cvk:with-surface surface (instance window))
             (cvk:with-physical-device physical-device (instance :surface surface))
             (let ((queue-family (cvk:physical-device-queue-family physical-device :surface surface))))
             (cvk:with-device device (physical-device (list queue-family)))
             (cvk:with-command-pool command-pool (device queue-family))
             (cvk:with-command-buffer command-buffer (device command-pool))
             (let ((queue (cvk:device-queue device queue-family 0))))
             (cvk:with-swapchain (swapchain img-format) (physical-device device surface (list queue-family) 640 480))
             (cvk:with-shader-module module (device "shaders/shader/vert.spv"))
             (cvk:with-attachment-description color-attachment (img-format cvk:VK_SAMPLE_COUNT_1_BIT
                                                                cvk:VK_ATTACHMENT_LOAD_OP_CLEAR     cvk:VK_ATTACHMENT_STORE_OP_STORE
                                                                cvk:VK_ATTACHMENT_LOAD_OP_DONT_CARE cvk:VK_ATTACHMENT_STORE_OP_DONT_CARE
                                                                cvk:VK_IMAGE_LAYOUT_UNDEFINED       cvk:VK_IMAGE_LAYOUT_PRESENT_SRC_KHR))
             (cvk:with-attachment-reference color-reference (0 cvk:VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL))
             (cvk:with-subpass-description subpass (cvk:VK_PIPELINE_BIND_POINT_GRAPHICS :color-attachments (list color-reference)))
             (cvk:with-render-pass render-pass (device (list color-attachment) (list color-reference))))
    (format t "Hola~%")
    (format t "~S~%" swapchain)
    (sleep 3)
    (format t "Adios~%")))

(trace cffi::foreign-alloc)

(main)
