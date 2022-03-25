
# Instance

## Instance structure

```lisp
(defstruct instance
  vk-instance
  layers
  extensions)
```

Represents a vulkan instance.

* **vk-instance**: Pointer to vulkan instance.
* **layers**: List of layer names enabled.
* **extensions**: List of extension names enabled.

## 
