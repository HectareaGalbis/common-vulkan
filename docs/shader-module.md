
# Shader module

## create-shader-module

```lisp
(create-shader-module device spv-file)
```

Creates a shader module.

* **device**: A device with which to create the shader module.
* **spv-file**: A compiled spv file.

## destroy-shader-module

```lisp
(destroy-shader-module module)
```

Destroys a shader module.

* **module**: The shader module to destroy.

## with-shader-module

```lisp
(with-shader-module var (device spv-file)
  &body body)
```

Wraps the body expressions with the creation and destruction of a shader module. The new module is bound to `var`. The args are passed to the constructor `create-shader-module`.
