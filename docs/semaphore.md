
# Semaphore

## create-semaphore

```lisp
(create-semaphore device)
```

Creates a vulkan semaphore.

* **device**: The device that the semaphore is created from.

## destroy-semaphore

```lisp
(destroy-semaphore semaphore device)
```

Destroys a vulkan semaphore.

* **semaphore**: The semaphore to be destroyed.
* **device**: The device that the semaphore was created from.

## with-semaphore

```lisp
(with-semaphore var (device)
  &body body)
```

Wraps the body expressions with the creation and destruction of a semaphore. The semaphore is bound to `var`.

* **device**: The device that the semaphore is created from.
