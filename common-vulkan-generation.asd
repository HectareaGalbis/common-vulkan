

(asdf:defsystem #:common-vulkan-generation
  :depends-on (#:cffi #:more-cffi #:cl-ppcre #:iterate)
  :components ((:file "generation/generate")))
