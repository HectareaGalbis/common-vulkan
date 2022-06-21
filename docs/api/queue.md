# Queue

## device-queue

```lisp
(device-queue device queue-family queue-index)
```

Retrieve a queue from a `device` which belongs to `queue-family`.

* **device**: The device that the queue is retrieved from.
* **queue-family**: The queue family that the queue belongs to.
* **queue-index**: The index that the queue has in the `queue-family`.

## device-queues

```lisp
(device-queues device queue-family)
```

Retrieve all the queues from a `device` that belongs to `queue-family`.

* **device**: The device that the queues are retrieved from.
* **queue-family**: The queue family that the queues belong to.
