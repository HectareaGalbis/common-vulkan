
(defpackage "common-vulkan"
  (:use :cl)
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
    #:with-shader-module))
