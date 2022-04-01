
# Instance

## create-instance

```
(create-instance &optional (validation t))
```

Creates a vulkan instance.

* **validation**: `t` if validation layer must be enabled.

## destroy-instance

```
(destroy-instance instance)
```

Destroys an instance.

* **instance**: The instance to be destroyed.

## with-instance (macro)

```
(with-instance (var &optional (validation t)) &body body)
```

Wraps the body expressions with the creation and destruction of an instance. The `var` is bound to the created instance.

## get-vulkan-instance-enabled-layers

```
(get-instance-enabled-layers instance)
```

Retrieves the enabled layers from `instance`.

* **instance**: The instance the layers are retrieved from.

## get-vulkan-instance-enabled-extensions

```
(get-instance-extensions instance)
```

Retrieves the enabled extensions from `instance`.

* **instance**: The instance that the extensions are retrieved from.

