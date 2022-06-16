
(in-package :cvk)


;;; -------------------------
;;; ---- Public functions ---
;;; -------------------------

;; Creates an attachment description structure
(defun create-attachment-description (img-format img-samples load-op store-op stencil-load-op
				      stencil-store-op initial-layout final-layout)
  (let ((description-ptr (alloc-vulkan-object '(:struct VkAttachmentDescription))))
    (cffi:with-foreign-slots ((format samples loadOp storeOp stencilLoadOp stencilStoreOp
				      initialLayout finalLayout)
                              description-ptr (:struct VkAttachmentDescription))
      (setf format         img-format
            samples        img-samples
            loadOp         load-op
            storeOp        store-op
            stencilLoadOp  stencil-load-op
            stencilStoreOp stencil-store-op
            initialLayout  initial-layout
            finalLayout    final-layout))
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
    (cffi:with-foreign-slots ((attachment layout) attachment-ref-ptr (:struct VkAttachmentReference))
      (setf attachment _attachment
            layout     _layout))
    (values attachment-ref-ptr)))

;; Destroys an attachment reference structure
(defun destroy-attachment-reference (attachment-ref-ptr)
  (free-vulkan-object attachment-ref-ptr))

;; With attachment reference macro
(defwith with-attachment-reference
         create-attachment-reference
         destroy-attachment-reference)


;; Creates a subpass description structure
(defun create-subpass-description (pipeline-bind-point &key (input-attachments nil) (color-attachments nil)
							 (resolve-attachments nil)
                                                         (depth-stencil-attachment nil)
							 (preserve-attachments nil))
  (let ((input-attachments-ptr        (if input-attachments                                          
                                          (cffi:foreign-alloc '(:struct VkAttachmentReference)
							      :initial-contents
							      (mapcar (lambda (x)
									(cffi:mem-ref x
									  '(:struct VkAttachmentReference)))
                                                                      input-attachments))
                                          (cffi:null-pointer)))
        (color-attachments-ptr        (if color-attachments
                                          (cffi:foreign-alloc '(:struct VkAttachmentReference)
							      :initial-contents
							      (mapcar (lambda (x)
									(cffi:mem-ref x
									  '(:struct VkAttachmentReference)))
                                                                      color-attachments))
                                          (cffi:null-pointer)))
        (resolve-attachments-ptr      (if resolve-attachments
                                          (cffi:foreign-alloc '(:struct VkAttachmentReference)
							      :initial-contents
							      (mapcar (lambda (x)
									(cffi:mem-ref x
									  '(:struct VkAttachmentReference)))
                                                                      resolve-attachments))
                                          (cffi:null-pointer)))
        (depth-stencil-attachment-ptr (if depth-stencil-attachment
                                          depth-stencil-attachment
                                          (cffi:null-pointer)))
        (preserve-attachments-ptr     (if preserve-attachments
                                          (cffi:foreign-alloc :uint32 :initial-contents preserve-attachments)
                                          (cffi:null-pointer)))
        (subpass-description-ptr      (alloc-vulkan-object '(:struct VkSubpassDescription))))
    (cffi:with-foreign-slots ((pipelineBindPoint inputAttachmentCount pInputAttachments
					         colorAttachmentCount pColorAttachments
                                                 pResolveAttachments pDepthStencilAttachment
					         preserveAttachmentCount pPreserveAttachments)
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
  (cffi:with-foreign-slots ((pInputAttachments pColorAttachments pResolveAttachments
					       pDepthStencilAttachment pPreserveAttachments)
                            subpass-description-ptr (:struct VkSubpassDescription))
    (unless (cffi:null-pointer-p pInputAttachments)
      (cffi:foreign-free pInputAttachments))
    (unless (cffi:null-pointer-p pColorAttachments)
      (cffi:foreign-free pColorAttachments))
    (unless (cffi:null-pointer-p pResolveAttachments)
      (cffi:foreign-free pResolveAttachments))
    (unless (cffi:null-pointer-p pDepthStencilAttachment)
      (cffi:foreign-free pDepthStencilAttachment))
    (unless (cffi:null-pointer-p pPreserveAttachments)
      (cffi:foreign-free pPreserveAttachments)))
  (free-vulkan-object subpass-description-ptr))

;; With subpass description macro
(defwith with-subpass-description
         create-subpass-description
         destroy-subpass-description)


;; Creates a subpass dependency structure
(defun create-subpass-dependency (src-subpass dst-subpass src-stage-mask dst-stage-mask
				  src-access-mask dst-access-mask dependency-flags)
  (let ((subpass-dependency-ptr (alloc-vulkan-object '(:struct VkSubpassDependency))))
    (cffi:with-foreign-slots ((srcSubpass dstSubpass srcStageMask dstStageMask srcAccessMask
					  dstAccessMask dependencyFlags)
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
(defun create-render-pass-create-info (attachments subpasses &optional (dependencies nil))
  (let ((attachments-ptr (cffi:foreign-alloc '(:struct VkAttachmentDescription)
                                             :initial-contents
					     (mapcar (lambda (x)
						       (cffi:mem-ref x '(:struct VkAttachmentDescription)))
                                                     attachments)))
        (subpasses-ptr (cffi:foreign-alloc '(:struct VkSubpassDescription)
                                           :initial-contents
					   (mapcar (lambda (x)
						     (cffi:mem-ref x '(:struct VkSubpassDescription)))
                                                   subpasses)))
        (dependencies-ptr (if dependencies
                              (cffi:foreign-alloc '(:struct VkSubpassDependency)
                                                  :initial-contents
						  (mapcar (lambda (x)
							    (cffi:mem-ref x '(:struct VkSubpassDependency)))
                                                          dependencies))
                              (cffi:null-pointer)))
        (render-pass-info-ptr (alloc-vulkan-object '(:struct VkRenderPassCreateInfo))))
    (cffi:with-foreign-slots ((sType attachmentCount pAttachments subpassCount
				     pSubpasses dependencyCount pDependencies)
                              render-pass-info-ptr (:struct VkRenderPassCreateInfo))
      (setf sType           VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO
            attachmentCount (length attachments)
            pAttachments    attachments-ptr
            subpassCount    (length subpasses)
            pSubpasses      subpasses-ptr
            dependencyCount (length dependencies)
            pDependencies   dependencies-ptr))
    (values render-pass-info-ptr)))

;; Destroys a render pass create info structure
(defun destroy-render-pass-create-info (render-pass-info-ptr)
  (cffi:with-foreign-slots ((pAttachments pSubpasses pDependencies)
			    render-pass-info-ptr (:struct VkRenderPassCreateInfo))
    (cffi:foreign-free pAttachments)
    (cffi:foreign-free pSubpasses)
    (unless (cffi:null-pointer-p pDependencies)
      (cffi:foreign-free pDependencies)))
  (cffi:foreign-free render-pass-info-ptr))

;; With render pass create info macro
(defwith with-render-pass-create-info
         create-render-pass-create-info
         destroy-render-pass-create-info)


;; Creates a render pass
(defun create-render-pass (device attachments subpasses &optional (dependencies nil))
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



;;-------------------------------
;;----- do-render-pass macro ----
;;-------------------------------

;;; render-pass-creation  ::= (create-render-pass device attachment-assignment {attachment-assignment | subpass-assignment |
;;;                                                                             subpass-creation | dependency-creation*)
;;; attachment-assignment ::= var = attachment-creation
;;; subpass-assingment    ::= var = subpass-creation
;;; attachment-creation ::= (create-attachment img-format img-samples load-op store-op stencil-load-op
;;;                                           stencil-store-op initial-layout final-layout)
;;; subpass-creation    ::= (create-subpass pipeline-bind-point {key attachment-layout-list}*)
;;; key                 ::= {:input-attachments | :color-attachments | :resolve-attachments |
;;;                          :depth-stencil-attachment | :preserve-attachment
;;; attachment-layout-list ::= (attachment-layout*)
;;; attachment-layout   ::= (attachment layout)
;;; dependency-creation ::= (create-dependency src-subpass dst-subpass src-stage-mask dst-stage-mask src-access-mask
;;;                                            dst-access-mask dependency-flags)

(defun attachment-creation-p (code)
  (eq 'create-attachment (car code)))

(defun attachment-creation (code attachment-var)
  (values code `(destroy-attachment-description ,attachment-var)))

(defun attachment-layout-p (code)
  (and (equal (length code) 2)))

(defun attachment-layout (code attachment-vars)
  (let ((ref-var (gensym)))
    (values ref-var
            `(create-attachment-reference ,(position (car code) attachment-vars) ,(cadr code))
            `(destroy-attachment-reference ,ref-var))))

(defun attachment-layout-list-p (code)
  (and (listp code)
       (loop for att-lay in code
             always (attachment-layout-p att-lay))))

(defun attachment-layout-list (code attachment-vars)
  (loop for attachment in code
        for (ref-var constructor destructor) = (values-list (attachment-layout attachment attachment-vars))
        collect ref-var     into ref-vars
        collect constructor into constructors
        collect destructor  into destructors
        finally (return (values ref-vars constructors destructors))))

(defun key-p (code)
  (member code (list :input-attachments :color-attachments :resolve-attachments :depth-stencil-attachment :preserve-attachment)))

(defun subpass-creation-p (code)
  (and (eq 'create-subpass (car code))
       (iter (for rcode initially code then (cddr rcode))
             (if (null code)
                 (return t)
                 (multiple-value-bind (key-symbol att-list) (list (car rcode) (cadr rcode))
                   (always (and (key-p key-symbol)
                                (attachment-layout-list-p att-list))))))))


(defun subpass-creation (code attachment-vars subpass-var)
  (iter (for rcode initially (cddr code) then (cddr rcode))
        (if (not (null rcode))
            (multiple-value-bind (key att-lay-list) (list (car rcode) (cadr rcode))
              (multiple-value-bind (ref-vars ref-const ref-dest) (attachment-layout-list att-lay-list attachment-vars)
                (appending (list key ref-vars) into key-att-code)
                (appending ref-vars            into all-ref-vars)
                (appending ref-const           into all-ref-const)
                (appending ref-dest            into all-ref-dest)))
            (return (values `(,@all-ref-vars  ,subpass-var)
                            `(,@all-ref-const (create-subpass-description ,(cadr code) ,@key-att-code))
                            `(,@all-ref-dest  (destroy-subpass-description ,subpass-var)))))))

(defun attachment-assignment-p (code)
  (and (symbolp (car code))
       (eq '= (cadr code))
       (attachment-creation-p (caddr code))))

(defun attachment-assignment (code)
  (multiple-value-bind (constructor destructor) (attachment-creation (caddr code) (car code))
    (values (car code) constructor destructor)))

(defun subpass-assignment-p (code)
  (and (symbolp (car code))
       (eq '= (cadr code))
       (subpass-creation-p (caddr code))))

(defun subpass-assignment (code attachment-vars)
  (multiple-value-bind (vars constructors destructors) (subpass-creation (caddr code) attachment-vars (car code))
    (values (car code) vars constructors destructors)))

(defun dependency-creation-p (code)
  (eq 'create-dependency (car code)))

(defun dependency-creation (code subpass-vars)
  (let ((dependency-var (gensym)))
    (values dependency-var
            `(create-subpass-dependency ,(position (cadr code) subpass-vars) ,(position (caddr code) subpass-vars) ,@(cdddr code))
            `(destroy-subpass-dependency ,dependency-var))))

(defun render-pass-creation (device code)
  (iter (for rcode initially code then (cond ((attachment-assignment-p rcode) (cdddr rcode))
                                             ((subpass-assignment-p    rcode) (cdddr rcode))
                                             ((subpass-creation-p      rcode) (cdr   rcode))
                                             ((dependency-creation-p   rcode) (cdr   rcode))))
        (cond ((null rcode) (let ((render-var (gensym)))
                              `(let ,(mapcar #'list constructor-vars constructors)
                                 (let ((,render-var (create-render-pass ,device (list ,@attachment-vars) (list ,@subpass-vars)
                                                                        (list ,@dependency-vars))))
                                   `(progn ,@destructors)
                                   ,render-var))))
              ((attachment-assignment-p rcode) (multiple-value-bind (att-var att-const att-dest) (attachment-assignment rcode)
                                                 (collect att-var   into attachment-vars)
                                                 (collect att-var   into constructor-vars)
                                                 (collect att-const into constructors)
                                                 (collect att-dest  into destructors at beginning)))
              ((subpass-creation-p rcode)      (let ((subpass-var (gensym)))
                                                 (multiple-value-bind (vars const-list dest-list)
                                                                      (subpass-creation rcode attachment-vars subpass-var)
                                                   (collect   subpass-var         into subpass-vars)
                                                   (appending vars                into constructor-vars)
                                                   (appending const-list          into constructors)
                                                   (appending (reverse dest-list) into destructors at beginning)))) ;; Modificar para que no haga falta el reverse
              ((subpass-assignment-p rcode)    (multiple-value-bind (subpass-var vars const-list dest-list)
                                                                    (subpass-assignment rcode attachment-vars)
                                                 (collect   subpass-var         into subpass-vars)
                                                 (appending vars                into constructor-vars)
                                                 (appending const-list          into constructors)
                                                 (appending (reverse dest-list) into destructors at beginning)))  ;; Modificar para que no haga falta el reverse
              ((dependency-creation-p rcode)   (multiple-value-bind (dep-var constructor destructor)
                                                                    (dependency-creation rcode subpass-vars)
                                                 (collect dep-var     into dependency-vars)
                                                 (collect dep-var     into constructor-vars)
                                                 (collect constructor into constructors)
                                                 (collect destructor  into destructors at beginning)))
              (t (error "No valid expression into render-pass-creation")))))

(defmacro do-render-pass (device &rest args)
  (render-pass-creation device args))
