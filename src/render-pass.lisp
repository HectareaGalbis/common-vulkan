
(in-package :cvk)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------



;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates an attachment description structure
(defun create-attachment-description (img-format img-samples load-op store-op stencil-load-op stencil-store-op initial-layout final-layout)
  (let ((description-ptr (alloc-vulkan-object '(:struct VkAttachmentDescription))))
    (cffi:with-foreign-slots ((format samples loadOp storeOp stencilLoadOp stencilStoreOp initialLayout finalLayout)
                              description-ptr (:struct VkAttachmentDescription)))
    (setf format         img-format
          samples        img-samples
          loadOp         load-op
          storeOp        store-op
          stencilLoadOp  stencil-load-op
          stencilStoreOp stencil-store-op
          initialLayout  initial-layout
          finalLayout    final-layout)
    (values description-ptr)))

;; Destroys an attachment description structure
(defun destroy-attachment-description (description-ptr)
  (free-vulkan-object description-ptr))

;; With attachment description macro
(defwith with-attachment-description
         create-attachment-description
         destroy-attachment-description)


;; Creates an attachment reference structure
(defun create-attachment-reference (_attachment _layout)
  (let ((attachment-ref-ptr (alloc-vulkan-object '(:struct VkAttachmentReference))))
    (cffi:with-foreign-slots ((attachment layout))
      (setf attachment _attachment
            layout     _layout)
      attachment-ref-ptr)))

;; Destroys an attachment reference structure
(defun destroy-attachment-reference (attachment-ref-ptr)
  (free-vulkan-object attachment-ref-ptr))

;; With attachment reference macro
(defwith with-attachment-reference
         create-attachment-reference
         destroy-attachment-reference)


;; Creates a subpass description structure
(defun create-subpass-description (pipeline-bind-point &key (input-attachments nil) (color-attachments nil) (resolve-attachments nil)
                                   (depth-stencil-attachment nil) (preserve-attachments nil))
  (let ((input-attachments-ptr        (if input-attachments
                                          (cffi:foreign-alloc '(:struct VkAttachmentReference) :initial-contents input-attachments)
                                          (cffi:null-pointer)))
        (color-attachments-ptr        (if color-attachments
                                          (cffi:foreign-alloc '(:struct VkAttachmentReference) :initial-contents color-attachments)
                                          (cffi:null-pointer)))
        (resolve-attachments-ptr      (if resolve-attachments
                                          (cffi:foreign-alloc '(:struct VkAttachmentReference) :initial-contents resolve-attachments)
                                          (cffi:null-pointer)))
        (depth-stencil-attachment-ptr (if depth-stencil-attachment
                                          (cffi:foreign-alloc '(:struct VkAttachmentReference) :initial-element depth-stencil-attachment)
                                          (cffi:null-pointer)))
        (preserve-attachments-ptr     (if preserve-attachments
                                          (cffi:foreign-alloc '(:struct VkAttachmentReference) :initial-contents preserve-attachments)
                                          (cffi:null-pointer)))
        (subpass-description-ptr      (alloc-vulkan-object '(:struct VkSubpassDescription))))
    (cffi:with-foreign-slots ((pipelineBindPoint inputAttachmentCount pInputAttachments colorAttachmentCount pColorAttachments
                               pResolveAttachments pDepthStencilAttachment preserveAttachmentCount pPreserveAttachments)
                              subpass-description-ptr (:struct VkSubpassDescription))
      (setf pipelineBindPoint       pipeline-bind-point
            inputAttachmentCount    (length input-attachments)
            pInputAttachments       input-attachments-ptr
            colorAttachmentCount    (length color-attachments)
            pColorAttachments       color-attachments-ptr
            pResolveAttachments     resolve-attachments-ptr
            pDepthStencilAttachment depth-stencil-attachment-ptr
            preserveAttachmentCount (length preserve-attachments)
            pPreserveAttachments    preserve-attachments-ptr))
    (values subpass-description-ptr)))

;; Destroys a subpass description structure
(defun destroy-subpass-description (subpass-description-ptr)
  (cffi:with-foreign-slots ((pInputAttachments pColorAttachments pResolveAttachments pDepthStencilAttachment pPreserveAttachments)
                            subpass-description-ptr (:struct VkSubpassDescription))
    (cffi:foreign-free pInputAttachments)
    (cffi:foreign-free pColorAttachments)
    (cffi:foreign-free pResolveAttachments)
    (cffi:foreign-free pDepthStencilAttachment)
    (cffi:foreign-free pPreserveAttachments))
  (free-vulkan-object subpass-description-ptr))

;; With subpass description macro
(defwith with-subpass-description
         create-subpass-description
         destroy-subpass-description)


;; Creates a subpass dependency structure
(defun create-subpass-dependency (src-subpass dst-subpass src-stage-mask dst-stage-mask src-access-mask dst-access-mask dependency-flags)
  (let ((subpass-dependency-ptr (alloc-vulkan-object '(:struct VkSubpassDependency))))
    (cffi:with-foreign-slots ((srcSubpass dstSubpass srcStageMask dstStageMask srcAccessMask dstAccessMask dependencyFlags)
                              subpass-dependency-ptr (:struct VkSubpassDependency))
      (setf srcSubpass      src-subpass
            dstSubpass      dst-subpass
            srcStageMask    src-stage-mask
            dstStageMask    dst-stage-mask
            srcAccessMask   src-access-mask
            dstAccessMask   dst-access-mask
            dependencyFlags dependency-flags))
    (values subpass-dependency-ptr)))

;; Destroys a subpass dependency structure
(defun destroy-subpass-dependency (subpass-dependency-ptr)
  (free-vulkan-object subpass-dependency-ptr))

;; With subpass dependency macro
(defwith with-subpass-dependency
         create-subpass-dependency
         destroy-subpass-dependency)


;; Creates a render pass create info structure
(defun create-render-pass-create-info (attachments subpasses dependencies)
  (let ((attachments-ptr (cffi:foreign-alloc '(:struct VkAttachmentDescription) :initial-contents attachments))
        (subpasses-ptr (cffi:foreign-alloc '(:struct VkSubpassDescription) :initial-contents subpasses))
        (dependencies-ptr (cffi:foreign-alloc '(:struct VkSubpassDependency) :initial-contents dependencies))
        (render-pass-info-ptr (alloc-vulkan-object '(:struct VkRenderPassCreateInfo))))
    (cffi:with-foreign-slots ((sType attachmentCount pAttachments subpassCount pSubpasses dependencyCount pDependencies)
                              render-pass-info-ptr (:struct VkRenderPassCreateInfo))
      (setf sType VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO
            attachmentCount (length attachments)
            pAttachments attachments-ptr
            subpassCount (length subpasses)
            pSubpasses subpasses-ptr
            dependencyCount (length dependencies)
            pDependencies dependencies-ptr))
    (values render-pass-info-ptr)))

;; Destroys a render pass create info structure
(defun destroy-render-pass-create-info (render-pass-info-ptr)
  (cffi:with-foreign-slots ((pAttachments pSubpasses pDependencies) render-pass-info-ptr (:struct VkRenderPassCreateInfo))
    (cffi:foreign-free pAttachments)
    (cffi:foreign-free pSubpasses)
    (cffi:foreign-free pDependencies))
  (cffi:foreign-free render-pass-info-ptr))

;; With render pass create info macro
(defwith with-render-pass-create-info
         create-render-pass-create-info
         destroy-render-pass-create-info)


;; Creates a render pass
(defun create-render-pass (device attachments subpasses dependencies)
  (with-render-pass-create-info render-pass-info (attachments subpasses dependencies)
    (cffi:with-foreign-object (render-pass-ptr 'VkRenderPass)
      (check-vk-result (vkCreateRenderPass device render-pass-info (cffi:null-pointer) render-pass-ptr))
      (values (cffi:mem-ref render-pass-ptr 'VkRenderPass) device))))

;; Destroys a render pass
(defun destroy-render-pass (render-pass device)
  (vkDestroyRenderPass device render-pass (cffi:null-pointer)))

;; With render pass macro
(defwith with-render-pass
         create-render-pass
         destroy-render-pass
         :destructor-arity 2)


;;; -------------------------
;;; --- Private functions ---
;;; -------------------------

(defun empty-env ()
  (list :attachments-code nil :ref-attachments-code nil))

(defun attachment-creation-p (code)
  (eq 'create-attachment (car code)))

(defun attachment-creation (code attachment-var)
  (values code `(destroy-attachment-description ,attachment-var)))

(defun attachment-layout-p (code)
  (and (equal (length code) 2)))

(defun attachment-layout (code attachment-vars)
  (let ((ref-var (gensym)))
    (values ,ref-var
            `(create-attachment-reference ,(position (car code) attachment-vars) ,(cadr code))
            `(destroy-attachment-reference ,ref-var))))

(defun attachment-layout-list-p (code)
  (and (listp code)
       (loop for att-lay in code
             always (attachment-layout-p att-lay))))

(defun attachment-layout-list (code attachment-vars)
  (loop for attachment in code
        for (ref-var constructor destructor) = (values-list (progn (check-attachment-layout attachment)
                                                                   (attachment-layout attachment)))
        collect ref-var     into ref-vars
        collect constructor into constructors
        collect destructor  into destructors
        finally (return (values ref-vars constructors destructors))))

(defun key-p (code)
  (member code (list :input-attachments :color-attachments :resolve-attachments :depth-stencil-attachment :preserve-attachment)))

(defun subpass-creation-p (code)
  (and (eq 'create-subpass (car code))
       (loop for rcode = code then (cddr rcode)
             for (key-symbol att-list) = (list (car rcode) (cadr rcode))
             and (key-p key-symbol)
                 (attachment-layout-list-p att-list))))

(defun subpass-creation (code attachment-vars subpass-var)
  (loop for rcode = (cddr code)
        for (key att-lay-list) = (list (car rcode) (cadr rcode))
        for (ref-vars ref-const ref-dest) = (values-list (attachment-layout-list att-lay-list attachment-vars))
        append (list key ref-vars) into key-att-code
        append ref-vars            into all-ref-vars
        append ref-const           into all-ref-const
        append ref-dest            into all-ref-dest
        finally (return (values all-ref-vars
                                all-ref-const
                                all-ref-dest
                                `(create-subpass-description ,(cadr code) ,@key-att-code)
                                `(destroy-subpass-description ,subpass-var)))))


create-render-pass  ::= (create-render-pass assignment {assignment | subpass-creation | dependency-creation}*)
assignment          ::= var = {attachment-creation | subpass-creation}
attachment-creation ::= (create-attachment img-format img-samples load-op store-op stencil-load-op
                                          stencil-store-op initial-layout final-layout)
subpass-creation    ::= (create-subpass pipeline-bind-point {key attachment-layout-list}*)
key                 ::= {:input-attachments | :color-attachments | :resolve-attachments | :depth-stencil-attachment | :preserve-attachment}
attachment-layout-list  ::= (attachment-layout*)
attachment-layout   ::= (attachment layout)
dependency-creation ::= (create-dependency src-subpass dst-subpass src-stage-mask dst-stage-mask src-access-mask
                                          dst-access-mask dependency-flags)
