
# Device

## create-vk-device

```lisp
(create-vk-device physical-device queue-families &key (extensions nil) (features nil))
```

Creates a logical device from `physical-device`. Also creates the queues from `queue-families`. Lastly, it enables the `extensions` and `features`.

* **physical-device**: The physical device which the device is created from.
* **queue-families**: The queue families to create in the device.
* **extensions**: The extensions to be enabled.
* **features**: The features to be enabled. 

## destroy-vk-device

```lisp
(destroy-vk-device device)
```

Destroys a logical device.

* **device**: The device to be destroyed.

## with-vk-device

```lisp
(with-vk-device (var physical-device queue-families &key (extensions nil) (features nil)) 
  &body body)
```

Wraps the body expressions with the creation and destruction of a logical device. `var` is bound to the created device and the arguments are supplied to the constructor.
