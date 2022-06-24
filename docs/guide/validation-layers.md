
# Validation layers

## Using validation layers

The official tutorial creates a global variable. You do that too, but I prefer a function to retrieve the validation layers. To enable o disable the validation layers we do use a special global variable.

```lisp
(defconstant width 800)
(defconstant height 600)

(defun get-validation-layers ()
  (list "VK_LAYER_KHRONOS_validation"))

(defvar *enable-validation-layers* t)
```

Now we add the function `check-validation-layer-support` that checks if the layers are available. 
