
(defpackage "common-vulkan"
  (:use :cl)
  (:nicknames :cvk)
  (:export

    ;; Helpers
    #:nest

    ;; Vulkan instance
    #:create-vk-instance
    #:destroy-vk-instance
    #:with-vk-instance
    #:vk-instance-layers
    #:vk-instance-extensions

    ;; Window
    #:create-glfw-window
    #:destroy-glfw-window
    #:with-glfw-window

    ;; Surface
    #:create-vk-surface
    #:destroy-vk-surface
    #:with-vk-surface

    ;; Physical device
    ;#:get-available-extensions ; Revisar y documentar
    #:create-vk-physical-device
    #:with-vk-physical-device

    ;; Queue family
    #:vk-physical-device-queue-families
    #:vk-physical-device-queue-family

    ;; Device
    #:create-vk-device
    #:destroy-vk-device
    #:with-vk-device))
