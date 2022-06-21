# Fence

## create-fence

```lisp
(create-fence device &key (signaled nil))
```

Creates a fence.

* **device**: The device that the fence is created from.
* **signaled**: If `nil`, the initial state of the fence will be unsignaled. Otherwise, it will be signaled.

## destroy-fence

```lisp
(destroy-fence fence device)
```

Destroys a fence.

* **fence**: The fence to be destroyed.
* **device**: The device that the fence was created from.

## with-fence

```lisp
(with-fence var (device &key (signaled nil))
  &body body)
```

Wraps the body expressions with a creation and destruction of a fence. The new fence is bound to `var`. The arguments are passed to the constructor `create-fence`.

## reset-fences

```lisp
(reset-fences device fences)
```

Resets all the fences from the list `fences` to the unsignaled state.

* **device**: The device that the fences were created from.
* **fences**: A list of fences that will be resetted to the unsignaled state.

## wait-for-fences

```lisp
(wait-for-fences device fences &key (wait-all t) (timeout UINT64_MAX))
```

Performs a wait operation on the fences from the list `fences`.

* **device**: The device that the fences were created from.
* **fences**: The list of fences that the wait operation will be performed on.
* **wait-all**: If `nil`, the wait operation last until just one fence switch to the signaled state. Otherwise, the wait last until all fences switch to the signaled state.
* **timeout**: In nanoseconds, the wait last until the waiting time reaches this time.
