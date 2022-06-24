
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

```lisp
(defun check-validation-layer-support ()
  (cvk:with-enumerate-instance-layer-properties available-layers ()
    
    ))
```

Like in the preovious chapter with extension properties, we can't use `enumerate-instance-layer-properties` directly because of the memory allocation it does. We use `with-enumeration-instance-layer-properties` that manage that memory for us. Now, we need check if all of the layers in `(get-validation-layers)` exist in `available-layers`.

```lisp
(defun check-validation-layer-support ()
  (cvk:with-enumerate-instance-layer-properties available-layers ()
    (loop for layer-name in (get-validation-layers)
	        always (loop for layer-properties in available-layers
			                 thereis (string= layer-name (cvk:layer-properties-layerName layer-properties))))))

```
