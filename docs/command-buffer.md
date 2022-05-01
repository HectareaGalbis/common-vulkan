
# Command buffer

## create-command-buffer

```lisp
(create-command-buffer device command-pool &key (secondary-buffer nil))
```

Creates a command buffer from a `command-pool`. 

* **device**: The device that the command-pool was created from.
* **command-pool**: The command pool that the command buffer will be created from.
* **secondary-buffer**: If `nil`, the command buffer will be primary. Otherwise, it will be secondary.

## destroy-command-buffer

```lisp
(destroy-command-buffer command-buffer device command-pool)
```

Destroys a command buffer.

* **command-buffer**: The command buffer to be destroyed.
* **device**: The device that the command pool was created from.
* **command-pool**: The command pool that the command-buffer was created from.

## with-command-buffer

```lisp
(with-command-buffer var (device command-pool &key (secondary-buffer nil))
  &body body)
```

Wraps the body expressions with a creation and destruction of a command buffer. The new command buffer is bound to `var`. The args are passed to the constructor `create-command-buffer`.

## reset-command-buffer

```lisp
(reset-command-buffer command-buffer)
```

Resets a command buffer to the initial state.

* **command-buffer**: The command buffer to be resetted.

## begin-command-buffer

```lisp
(begin-command-buffer command-buffer usage-flags)
```

Starts recording a command buffer.

* **command-buffer**: The command buffer where to record the commands.
* **usage-flags**: Specifies the behaviour of the command buffer. This is a bitmask of [VkCommandBufferUsageFlagBits](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkCommandBufferUsageFlagBits.html).

## end-command-buffer

```lisp
(end-command-buffer command-buffer)
```

Finishes recording a command buffer.

* **command-buffer**: The command buffer to complete recording.








