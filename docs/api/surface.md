
# surface

## create-surface

```lisp
(create-surface instance window)
```

Creates a surface for the specified window.

* **instance**: A vulkan instance.
* **window**: The window which the surface is created from.

## destroy-surface

```lisp
(destroy-surface surface)
```

Destroys a surface.

* **surface**: The surface to be destroyed.

## with-surface

```lisp
(with-surface (var instance window) &body body)
```

Wraps `body` with the creation and destruction of a surface. `var` is bound to the created surface.
