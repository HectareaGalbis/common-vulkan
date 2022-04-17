
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
    #:with-semaphore))
