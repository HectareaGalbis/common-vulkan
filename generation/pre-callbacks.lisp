
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/callbacks.md"))


(more-cffi:def-foreign-callback-definer doc-file
    "PFN_vkAllocationFunction"
    def-allocation-function-callback)

(more-cffi:def-foreign-callback-definer doc-file
    "PFN_vkReallocationFunction"
    def-reallocation-function-callback)

(more-cffi:def-foreign-callback-definer doc-file
    "PFN_vkFreeFunction"
    def-free-function-callback)

(more-cffi:def-foreign-callback-definer doc-file
    "PFN_vkInternalAllocationNotification"
    def-internal-allocation-notification-callback)

(more-cffi:def-foreign-callback-definer doc-file
    "PFN_vkInternalFreeNotification"
    def-internal-free-notification-callback)

(more-cffi:def-foreign-callback-definer doc-file
    "PFN_vkDebugReportCallbackEXT"
    def-debug-report-callback-ext-callback)

(more-cffi:def-foreign-callback-definer doc-file
    "PFN_vkDebugUtilsMessengerCallbackEXT"
    def-debug-utils-messenger-callback-ext-callback)

(more-cffi:def-foreign-callback-definer doc-file
    "PFN_vkDeviceMemoryReportCallbackEXT"
    def-device-memory-report-callback-ext-callback))