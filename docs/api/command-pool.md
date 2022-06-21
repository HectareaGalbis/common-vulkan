# Command pool

## create-command-pool

```lisp
(create-command-pool device queue-family reset-buffers)
```

Creates a command pool from a `queue-family` in the `device`. 

* **device**: The device the the command pool is created from.
* **queue-family**: A queue family that the command family belongs to.
* **reset-buffers**: If `t`, the command buffers created from this pool will need to be re-recorded each time the buffer is about to be commited. If no re-recording is needed, then use `nil`.

## destroy-command-pool

```lisp
(destroy-command-pool command-pool device)
```

Destroys a command pool.

* **command-pool**: The command pool to be destroyed.
* **device**: The device that the command pool was created from.

## with-command-pool

```lisp
(with-command-pool var (device queue-family reset-buffers)
  &body body)
```

Wraps the body expressions with the creation and destruction of a commmand pool. The new command pool is bound to `var`. The args are passed to the constructor `create-command-pool`.
