
# Framebuffers

Create another class member to hold the framebuffers:

```lisp
(defclass hello-triangle-application ()
  (...
   (swap-chain-framebuffers :accessor swap-chain-framebuffers :initform nil)))
```

We'll create these new objects in a new function `create-framebuffers` that is called from `init-vulkan`:

```lisp
(defun create-framebuffers (app)
  ...)

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (create-surface app)
  (pick-physical-device app)
  (create-logical-device app)
  (create-swap-chain app)
  (create-image-views app)
  (create-render-pass app)
  (create-graphics-pipeline app)
  (create-framebuffers app))
```

We iterate through the image views and create framebuffers from them:

```lisp
(defun create-framebuffers (app)
  (loop for i from 0 below (length (swap-chain-image-views app))
	for swap-chain-image-view in (swap-chain-image-views app)
	collect (let ((attachments (list swap-chain-image-view)))
		  (cvk:with-framebuffer-create-info framebuffer-info (:sType cvk:VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO
								      :renderPass (render-pass app)
								      :attachmentCount 1
								      :pAttachments attachments
								      :width (cvk:extent-2d-width (swap-chain-extent app))
								      :height (cvk:extent-2d-height (swap-chain-extent app))
								      :layers 1)
		    (multiple-value-bind (swap-chain-framebuffer result) (cvk:create-framebuffer (device app) framebuffer-info nil)
		      (when (not (equal result cvk:VK_SUCCESS))
			(error "failed to create framebuffer!"))
		      (values swap-chain-framebuffer))))
	  into swap-chain-framebuffers
	finally (setf (swap-chain-framebuffers app) swap-chain-framebuffers)))
```

Finally, we should delete the framebuffers before the image views and render pass that they are based on:

```lisp
(defun cleanup (app)
  (loop for framebuffer in (swap-chain-framebuffers app)
	do (cvk:destroy-framebuffer (device app) framebuffer nil))
  ...)
```

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/framebuffers.lisp)

* **Next**: [Command buffers](https://hectarea1996.github.io/common-vulkan/guide/command-buffers.html)
* **Previous**: [Conclusion](https://hectarea1996.github.io/common-vulkan/guide/conclusion.html)
