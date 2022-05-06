# Swapchain

## create-swapchain

```lisp
(create-swapchain physical-device device surface present-families width height)
```

Creates a swapchain.

* **physical-device**: A physical device used to retrieve some information in order to create the swapchain.
* **device**: A device created from the `physical-device` and used to create the swapchain.
* **surface**: The surface onto which the swapchain will present the images.
* **present-families**: These are the families that have access to the images of the swapchain.
* **width**: The width of the swapchain images. This value could be adjusted according to the limits of the `surface`.
* **height**: The height of the swapchain image. This value could be adjusted according to the limits of the `surface`.

## destroy-swapchain

```lisp
(destroy-swapchain swapchain device)
```

Destroys a swapchain.

* **swapchain**: The swapchain to be destroyed.
* **device**: The device used to create the swapchain.

## with-swapchain

```lisp
(with-swapchain var (physical-device device surface present-families width height)
  &body body)
```

Wraps the body expressions with the creation and destruction of a swapchain. The new swapchain is bound to `var`. The args are passed to the constructor `create-swapchain`.

## acquire-next-image

```lisp
(acquire-next-image device swapchain &key (semaphore nil) (fence nil))
```

Returns the index of the next available image of the swapchain. 

* **device**: The device that the swapchain was created from.
* **swapchain**: The swapchain to retrieve the image index.
* **semaphore**: If not `nil`, the semaphore will be signaled when the operation ends.
* **fence**: If not `nil`, the fence will be signaled when the operation ends.

## present-swapchain

```lisp
(present-swapchain queue swapchain image-index &key (sem-or-sems nil))
```

Queue an image for presentation.

* **queue**: The queue where the command will be committed. It must be capable of present an image.
* **swapchain**: The swapchain that contains the image to be presented.
* **image-index**: The index of the image to be presented.
* **sem-or-sems**: If not `nil`, this can be a semaphore or a list of semaphores. The operation will wait for each semaphore before trying to present the image.




