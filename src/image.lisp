
(in-package :cvk)

;;; -------------------
;;; ----- Structs -----
;;; -------------------

;; Constructor and destructor of the VkExtent3D structure
(mcffi:def-foreign-constructor-destructor extent-3d (:struct VkExtent3D)
  width
  height
  depth)

;; VkExtent3D getters and setters
(mcffi:def-foreign-accessors extent-3d (:struct VkExtent3D)
  width
  height
  depth)
