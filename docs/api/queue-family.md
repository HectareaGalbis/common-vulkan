
# Queue family

## physical-device-queue-families

```lisp
(physical-device-queue-families physical-device &key (queue-flags (logior VK_QUEUE_GRAPHICS_BIT VK_QUEUE_TRANSFER_BIT)) 
                                                     (min-queue-count 0) (surface nil) (exclusive-flags nil)
                                                     (family-exceptions nil))
```

Returns a list of queue families from `physical-device` where every element must verify some requirements:

* `queue-flags`: The queue families must have at least this flags activated. 
* `min-queue-count`: The queue families must have at least `min-queue-count` queues.
* `surface`: The queue families must have presentation support to this surface.
* `exclusive-flags`: If `t`, the queue families must have activated only the `queue-flags` and no more.
* `family-exceptions`: The queue families in list are excluded from the returned list of queue families.

## physical-device-queue-family

```lisp
(physical-device-queue-family physical-device &key (queue-flags (logior VK_QUEUE_GRAPHICS_BIT VK_QUEUE_TRANSFER_BIT)) 
                                                   (min-queue-count 0) (surface nil) (exclusive-flags nil)
                                                   (family-exceptions nil))
```

Same as `physical-device-queue-families` but returns only the first queue family which verifies the requirements.
