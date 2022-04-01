
(defpackage "common-vulkan"
  (:use :cl)
  (:nicknames :cvk)
  (:export

    ;; Vulkan instance
    #:create-vulkan-instance
    #:destroy-vulkan-instance
    #:with-vulkan-instance
    #:get-vulkan-instance-enabled-layers
    #:get-vulkan-instance-enabled-extensions

    ;; Window
    #:create-window
    #:destroy-window
    #:with-window

    ;; Surface
    #:create-surface
    #:destroy-surface
    #:with-surface))
