
(in-package :cvk)


(mcffi:with-doc-file (doc-file (asdf:system-relative-pathname "common-vulkan" "docs/api/helper-functions.md"))


  (mcffi:def-foreign-function doc-file create-spv-code create-spv-code (file)
    (declare-types ("pathname designator" file) :return ("spv code" code) ("uint" size))
    (with-open-file (stream file :direction :input :element-type '(unsigned-byte 8))
      (let ((buffer (make-array 1024 :element-type '(unsigned-byte 8) :fill-pointer 0 :adjustable t)))
	(loop for byte = (read-byte stream nil)
	      while byte
	      do (vector-push-extend byte buffer))
	(let ((code (cffi:foreign-alloc :uint8 :initial-contents buffer)))
	  (values code (fill-pointer buffer))))))


  (mcffi:def-foreign-function doc-file destroy-spv-code destroy-spv-code (code)
    (declare-types ("spv code" code))
    (cffi:foreign-free code))


  (mcffi:defwith doc-file with-spv-code
    create-spv-code
    destroy-spv-code))
