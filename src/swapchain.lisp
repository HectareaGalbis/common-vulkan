
(in-package :cvk)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

;; Returns a format and a color space for the swapchain
(defun choose-format-and-color (physical-device surface)
  (with-surface-formats (formats-ptr format-count) (physical-device surface)
    (let ((the-format (loop for i from 0 below format-count
                            for format-ptr = (cffi:mem-aptr formats-ptr '(:struct VkSurfaceFormatKHR) i)
                            thereis (cffi:with-foreign-slots ((format colorSpace) format-ptr (:struct VkSurfaceFormatKHR))
                                      (and (equal format     VK_FORMAT_B8G8R8A8_SRGB)
                                           (equal colorSpace VK_COLOR_SPACE_SRGB_NONLINEAR_KHR)
                                           format-ptr)))))
      (if the-format
          (cffi:with-foreign-slots ((format colorSpace) the-format (:struct VkSurfaceFormatKHR))
            (values format colorSpace))
          (cffi:with-foreign-slots ((format colorSpace) formats-ptr (:struct VkSurfaceFormatKHR)) ; We return the first available format
            (values format colorSpace))))))


;; Returns a present mode for the swapchain
(defun choose-present-mode (physical-device surface)
  (with-surface-present-modes (modes-ptr mode-count) (physical-device surface)
    (or (loop for i from 0 below mode-count
             for mode = (cffi:mem-aref modes-ptr 'VkPresentModeKHR i)
             thereis (and (equal mode VK_PRESENT_MODE_MAILBOX_KHR) mode))
        VK_PRESENT_MODE_FIFO_KHR)))


;; Returns an extent for the swapchain
(defun choose-extent (width height capabilities-ptr)
  (cffi:with-foreign-slots (((:pointer currentExtent) (:pointer minImageExtent) (:pointer maxImageExtent))
                            capabilities-ptr (:struct VkSurfaceCapabilitiesKHR))
    (if (not (equal (cffi:foreign-slot-value currentExtent '(:struct VkExtent2D) 'width) UINT32_MAX))
        (values (cffi:foreign-slot-value currentExtent '(:struct VkExtent2D) 'width)
                (cffi:foreign-slot-value currentExtent '(:struct VkExtent2D) 'height))
        (values (max (cffi:foreign-slot-value minImageExtent '(:struct VkExtent2D) 'width)
                     (min (cffi:foreign-slot-value maxImageExtent '(:struct VkExtent2D) 'width)
                          width))
                (max (cffi:foreign-slot-value minImageExtent '(:struct VkExtent2D) 'height)
                     (min (cffi:foreign-slot-value maxImageExtent '(:struct VkExtent2D) 'height)
                          height))))))


;; Returns a transform for the swapchain
(defun choose-transform (capabilities-ptr)
  (cffi:foreign-slot-value capabilities-ptr '(:struct VkSurfaceCapabilitiesKHR) 'currentTransform))



;; Returns an image count for the swapchain
(defun choose-image-count (capabilities-ptr)
  (cffi:with-foreign-slots ((minImageCount maxImageCount) capabilities-ptr (:struct VkSurfaceCapabilitiesKHR))
    (if (and (> maxImageCount 0) (>= minImageCount maxImageCount))
        maxImageCount
        (1+ minImageCount))))


;; Creates a present info structure
(defun create-present-info (swapchain image-index semaphores)
  (let ((semaphores-ptr (if semaphores
                            (cffi:foreign-alloc 'VkSemaphore :initial-contents semaphores)
                            (cffi:null-pointer)))
        (image-index-ptr (cffi:foreign-alloc :uint32 :initial-element image-index))
        (result-ptr (cffi:foreign-alloc 'VkResult))
        (present-info-ptr (alloc-vulkan-object '(:struct VkPresentInfoKHR))))
    (cffi:with-foreign-slots ((sType waitSemaphoreCount pWaitSemaphores swapchainCount pSwapchains pImageIndices pResults)
                              present-info-ptr (:struct VkPresentInfoKHR))
      (setf sType              VK_STRUCTURE_TYPE_PRESENT_INFO_KHR
            waitSemaphoreCount (length semaphores)
            pWaitSemaphores    semaphores-ptr
            swapchainCount     1
            pSwapchains        swapchain
            pImageIndices      image-index-ptr
            pResults           result-ptr))
    (values present-info-ptr)))

;; Destroys a present info structure
(defun destroy-present-info (present-info-ptr)
  (cffi:with-foreign-slots ((pWaitSemaphores pImageIndices pResults) present-info-ptr (:struct VkPresentInfoKHR))
    (unless (cffi:null-pointer-p pWaitSemaphores)
      (cffi:foreign-free pWaitSemaphores))
    (cffi:foreign-free pImageIndices)
    (cffi:foreign-free pResults))
  (free-vulkan-object present-info-ptr))

;; With present info macro
(defwith with-present-info
         create-present-info
         destroy-present-info)


;; Creates a swapchain create info structure
(defun create-swapchain-create-info (_surface image-count image-format color-space _width _height
                                     present-families transform present-mode)
  (let ((index-count (length present-families)))
    (when (zerop index-count)
      (error "create-swapchain-create-info error: Expected 1 or more queue families"))
    (let ((indices-ptr (cffi:foreign-alloc :uint32 :initial-contents (mapcar #'vk-queue-family-index present-families)))
          (sharing-mode (if (> index-count 1) VK_SHARING_MODE_CONCURRENT VK_SHARING_MODE_EXCLUSIVE))
          (swapchain-info-ptr (alloc-vulkan-object '(:struct VkSwapchainCreateInfoKHR))))
      (cffi:with-foreign-slots ((sType surface minImageCount imageFormat imageColorSpace (:pointer imageExtent) imageArrayLayers
                                 imageUsage imageSharingMode queueFamilyIndexCount pQueueFamilyIndices preTransform
                                 compositeAlpha presentMode) swapchain-info-ptr (:struct VkSwapchainCreateInfoKHR))
        (setf sType                 VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR
              surface               _surface
              minImageCount         image-count
              imageFormat           image-format
              imageColorSpace       color-space
              imageArrayLayers      1
              imageUsage            VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT
              imageSharingMode      sharing-mode
              queueFamilyIndexCount index-count
              pQueueFamilyIndices   indices-ptr
              preTransform          transform
              compositeAlpha        VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR
              presentMode           present-mode)

        (cffi:with-foreign-slots ((width height) imageExtent (:struct VkExtent2D))
          (setf width  _width
                height _height)))
      (values swapchain-info-ptr))))

;; Destroys a swapchain create info structure
(defun destroy-swapchain-create-info (swapchain-info-ptr)
  (cffi:with-foreign-slots ((pQueueFamilyIndices) swapchain-info-ptr (:struct VkSwapchainCreateInfoKHR))
    (cffi:foreign-free pQueueFamilyIndices))
  (free-vulkan-object swapchain-info-ptr))

;; With swapchain create info macro
(defwith with-swapchain-create-info
         create-swapchain-create-info
         destroy-swapchain-create-info)


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates a swapchain
(defun create-swapchain (physical-device device surface present-families _width _height)
  (with-surface-capabilities capabilities-ptr (physical-device surface)
    (multiple-value-bind (image-format color-space) (choose-format-and-color physical-device surface)
      (multiple-value-bind (width height) (choose-extent _width _height capabilities-ptr)
        (let ((present-mode (choose-present-mode physical-device surface))
              (transform    (choose-transform capabilities-ptr))
              (image-count  (choose-image-count capabilities-ptr)))
          (with-swapchain-create-info swapchain-info-ptr (surface image-count image-format color-space width height
                                                          present-families transform present-mode)
            (cffi:with-foreign-object (swapchain-ptr 'VkSwapchainKHR)
              (check-vk-result (vkCreateSwapchainKHR device swapchain-info-ptr (cffi:null-pointer) swapchain-ptr))
              (values (cffi:mem-ref swapchain-ptr 'VkSwapchainKHR) image-format device))))))))

;; Destroys a swapchain
(defun destroy-swapchain (swapchain img-format device)
  (declare (ignore img-format))
  (vkDestroySwapchainKHR device swapchain (cffi:null-pointer)))

;; With swapchain macro
(defwith with-swapchain
         create-swapchain
         destroy-swapchain
         :destructor-arity 3)


;; Returns the next available image in the swapchain
(defun acquire-next-image (device swapchain &key (semaphore nil) (fence nil))
  (cffi:with-foreign-object (image-index-ptr :uint32)
    (vkAcquireNextImageKHR device swapchain UINT64_MAX semaphore fence image-index-ptr)
    (cffi:mem-ref image-index-ptr :uint32)))


;; Presents on screen an image from the swapchain
(defun present-swapchain (queue swapchain image-index &key (sem-or-sems nil))
  (with-present-info present-info-ptr (swapchain image-index (if (listp sem-or-sems) sem-or-sems (list sem-or-sems)))
    (vkQueuePresentKHR queue present-info-ptr)
    (cffi:with-foreign-slots ((pResults) present-info-ptr (:struct VkPresentInfoKHR))
      (check-vk-result (cffi:mem-ref pResults 'VkResult)))))
