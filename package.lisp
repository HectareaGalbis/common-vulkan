
(defpackage "common-vulkan"
  (:use :cl :iterate)
  (:nicknames :cvk)
  (:export

    ;; Helpers
    #:nest

    ;; Vulkan instance
    #:create-instance
    #:destroy-instance
    #:with-instance

    ;; Window
    #:create-window
    #:destroy-window
    #:with-window

    ;; Surface
    #:create-surface
    #:destroy-surface
    #:with-surface

    ;; Physical device
    ;#:get-available-extensions ; Revisar y documentar
    #:create-physical-device
    #:with-physical-device

    ;; Queue family
    #:physical-device-queue-families
    #:physical-device-queue-family

    ;; Device
    #:create-device
    #:destroy-device
    #:with-device

    ;; Semaphore
    #:create-semaphore
    #:destroy-semaphore
    #:with-semaphore

    ;; Fence
    #:create-fence
    #:destroy-fence
    #:with-fence
    #:reset-fences
    #:wait-for-fences

    ;; Command pool
    #:create-command-pool
    #:destroy-command-pool
    #:with-command-pool

    ;; Command buffer
    #:create-command-buffer
    #:destroy-command-buffer
    #:with-command-buffer
    #:reset-command-buffer
    #:begin-command-buffer
    #:end-command-buffer

    ;; Queue
    #:device-queue
    #:device-queues

    ;; Swapchain
    #:create-swapchain
    #:destroy-swapchain
    #:with-swapchain
    #:acquire-next-image
    #:present-swapchain

    ;; Shader module
    #:create-shader-module
    #:destroy-shader-module
    #:with-shader-module

    ;; Render pass
    #:create-attachment-description
    #:destroy-attachment-description
    #:with-attachment-description
    #:create-attachment-reference
    #:destroy-attachment-reference
    #:with-attachment-reference
    #:create-subpass-description
    #:destroy-subpass-description
    #:with-subpass-description
    #:create-subpass-dependency
    #:destroy-subpass-dependency
    #:with-subpass-dependency
    #:create-render-pass
    #:destroy-render-pass
    #:with-render-pass
    #:do-render-pass))
