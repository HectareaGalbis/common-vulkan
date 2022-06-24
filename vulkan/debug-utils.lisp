
(in-package :cvk)

;; Object types
(cffi:defctype VkDebugUtilsMessengerEXT NON-DISPATCH-HANDLE)


;; Enums
(cffi:defctype VkDebugUtilsMessageSeverityFlagBitsEXT :int)
(defconstant VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT #x1)
(defconstant VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT #x10)
(defconstant VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT #x100)
(defconstant VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT #x1000)

(cffi:defctype VkDebugUtilsMessageTypeFlagBitsEXT :int)
(defconstant VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT #x1)
(defconstant VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT #x2)
(defconstant VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT #x4)

;; Bitmasks
(cffi:defctype VkDebugUtilsMessageSeverityFlagsEXT VkFlags)

(cffi:defctype VkDebugUtilsMessageTypeFlagsEXT VkFlags)

(cffi:defctype VkDebugUtilsMessengerCallbackDataFlagsEXT VkFlags)

(cffi:defctype VkDebugUtilsMessengerCreateFlagsEXT VkFlags)


;; Constants
(defparameter VK_EXT_DEBUG_UTILS_EXTENSION_NAME "VK_EXT_debug_utils")

(defconstant VK_OBJECT_TYPE_DEBUG_UTILS_MESSENGER_EXT 1000128000)

(defconstant VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT 1000128000)
(defconstant VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_TAG_INFO_EXT 1000128001)
(defconstant VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT 1000128002)
(defconstant VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT 1000128003)
(defconstant VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT 1000128004)


;; Function pointers
(cffi:defctype PFN_vkDebugUtilsMessengerCallbackEXT :pointer)


;; Structures
(cffi:defcstruct VkDebugUtilsLabelEXT
  (sType      VkStructureType)
  (pNext      (:pointer :void))
  (pLabelName (:pointer :char))
  (color      :float :count 4))

(cffi:defcstruct VkDebugUtilsObjectNameInfoEXT
  (sType        VkStructureType)
  (pNext        (:pointer :void))
  (objectType   VkObjectType)
  (objectHandle :uint64)
  (pObjectName  (:pointer :char)))

(cffi:defcstruct VkDebugUtilsMessengerCallbackDataEXT
  (sType            VkStructureType)
  (pNext            (:pointer :void))
  (flags            VkDebugUtilsMessengerCallbackDataFlagsEXT)
  (pMessageIdName   (:pointer :char))
  (messageIdNumber  :int32)
  (pMessage         (:pointer :char))
  (queueLabelCount  :uint32)
  (pQueueLabels     (:pointer (:struct VkDebugUtilsLabelEXT)))
  (cmdBufLabelCount :uint32)
  (pCmdBufLabels    (:pointer (:struct VkDebugUtilsLabelEXT)))
  (objectCount      :uint32)
  (pObjects         (:pointer (:struct VkDebugUtilsObjectNameInfoEXT))))

(cffi:defcstruct VkDebugUtilsObjectTagInfoEXT
  (sType        VkStructureType)
  (pNext        (:pointer :void))
  (objectType   VkObjectType)
  (objectHandle :uint64)
  (tagName      :uint64)
  (tagSize      :size)
  (pTag         (:pointer :void)))

(cffi:defcstruct VkDebugUtilsMessengerCreateInfoEXT
  (sType           VkStructureType)
  (pNext           (:pointer :void))
  (flags           VkDebugUtilsMessengerCreateFlagsEXT)
  (messageSeverity VkDebugUtilsMessageSeverityFlagsEXT)
  (messageType     VkDebugUtilsMessageTypeFlagsEXT)
  (pfnUserCallback PFN_vkDebugUtilsMessengerCallbackEXT)
  (pUserData       (:pointer :void)))


;; Functions
;; (defvkinstextfun ("vkCmdBeginDebugUtilsLabelEXT" vkCmdBeginDebugUtilsLabelEXT) :void
;;   (commandBuffer VkCommandBuffer)
;;   (pLabelInfo (:pointer (:struct VkDebugUtilsLabelEXT))))

;; (defvkinstextfun ("vkCmdEndDebugUtilsLabelEXT" vkCmdEndDebugUtilsLabelEXT) :void
;;   (commandBuffer VkCommandBuffer))

;; (defvkinstextfun ("vkCmdInsertDebugUtilsLabelEXT" vkCmdInsertDebugUtilsLabelEXT) :void
;;   (commandBuffer VkCommandBuffer)
;;   (pLabelInfo (:pointer (:struct VkDebugUtilsLabelEXT))))

;; (defvkinstextfun ("vkCreateDebugUtilsMessengerEXT" vkCreateDebugUtilsMessengerEXT) VkResult
;;   (instance VkInstance)
;;   (pCreateInfo (:pointer (:struct VkDebugUtilsMessengerCreateInfoEXT)))
;;   (pAllocator (:pointer (:struct VkAllocationCallbacks)))
;;   (pMessenger (:pointer VkDebugUtilsMessengerEXT)))

;; (defvkinstextfun ("vkDestroyDebugUtilsMessengerEXT" vkDestroyDebugUtilsMessengerEXT) :void
;;   (instance VkInstance)
;;   (messenger VkDebugUtilsMessengerEXT)
;;   (pAllocator (:pointer (:struct VkAllocationCallbacks))))

;; (defvkinstextfun ("vkQueueBeginDebugUtilsLabelEXT" vkQueueBeginDebugUtilsLabelEXT) :void
;;   (queue VkQueue)
;;   (pLabelInfo (:pointer (:struct VkDebugUtilsLabelEXT))))

;; (defvkinstextfun ("vkQueueEndDebugUtilsLabelEXT" vkQueueEndDebugUtilsLabelEXT) :void
;;   (queue VkQueue))

;; (defvkinstextfun ("vkQueueInsertDebugUtilsLabelEXT" vkQueueInsertDebugUtilsLabelEXT) :void
;;   (queue VkQueue)
;;   (pLabelInfo (:pointer (:struct VkDebugUtilsLabelEXT))))

;; (defvkinstextfun ("vkSetDebugUtilsObjectNameEXT" vkSetDebugUtilsObjectNameEXT) VkResult
;;   (device VkDevice)
;;   (pNameInfo (:pointer (:struct VkDebugUtilsObjectNameInfoEXT))))

;; (defvkinstextfun ("vkSetDebugUtilsObjectTagEXT" vkSetDebugUtilsObjectTagEXT) VkResult
;;   (device VkDevice)
;;   (pTagInfo (:pointer (:struct VkDebugUtilsObjectTagInfoEXT))))

;; (defvkinstextfun ("vkSubmitDebugUtilsMessageEXT" vkSubmitDebugUtilsMessageEXT) :void
;;   (instance VkInstance)
;;   (messageSeverity VkDebugUtilsMessageSeverityFlagBitsEXT)
;;   (messageTypes VkDebugUtilsMessageTypeFlagsEXT)
;;   (pCallbackData (:pointer (:struct VkDebugUtilsMessengerCallbackDataEXT))))
