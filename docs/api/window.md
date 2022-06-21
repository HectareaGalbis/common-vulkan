
# window

## create-window

```lisp
(create-window name width height)
```

Creates a window named `name`, and with dimensions `width` and `height`.

* **name**: The name of the window.
* **width**: The width of the window.
* **height**: The height of the window.

## destroy-window

```lisp
(destroy-window window)
```

Destroys the specified window.

* **window**: The window to be destroyed.

## with-window

```lisp
(with-window (var name width height) &body body)
```

Wraps the body with the creation and destruction of a window. `var` is bound to the new window.

