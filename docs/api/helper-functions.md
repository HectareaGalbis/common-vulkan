## create-spv-code

**create-spv-code**
```lisp
(create-spv-code file) => (values code size)
```

Read a spv file and return the code from it and the size of the code.

* *Parameters*:
  * *file*: `pathname designator`

* *Return:*
  * *code*: `spv code`
  * *size*: `uint`

* **Note**: The code must be freed by `destroy-spv-code`.

## destroy-spv-code

**destroy-spv-code**
```lisp
(destroy-spv-code code)
```

Destroy the spv code created by `create-spv-code`.

* *Parameters*:
  * *code*: `spv code`

**with-spv-code**
```lisp
(with-spv-code var (&rest args)
  &body body)
```
Wrap the body expressions with `create-spv-code` and `destroy-spv-code`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

## def-vulkan-struct

**def-vulkan-struct**
```lisp
(def-vulkan-struct NAME &BODY SLOTS)
```

Define a struct named `name`. Each member slot follows the syntax `(member-name member-type [:count count])`.
When `:count` is used the member will be an array of `count` elements. The possible types are: `:bool`, `:int`, `:uint`, `:float` and `:double`.
The struct will have its own constructor and destructor with names `create-name` and `destroy-name` respectively. Accessors are also defined
with the names `name-member-name`. For example: If the struct is named `vertex` and it has a member named `x` the accessor `vertex-x` will be
defined. If the member is an array because `:count` was used the accessor will accept an optional argument indicating the index of the element you
want to retrieve from. The accessors are `setf`-able. Also, a `with-name` macro is defined from the constructor and the destructor.

## vulkan-struct-size

**vulkan-struct-size**
```lisp
(vulkan-struct-size type) => size
```

Return the size in bytes of a vulkan struct. `type` is the symbol that denotes the vulkan struct type.

* *Parameters*:
  * *type*: `symbol`

* *Return:*
  * *size*: `integer`

## vulkan-struct-offset

**vulkan-struct-offset**
```lisp
(vulkan-struct-offset type slot) => offset
```

* *Parameters*:
  * *type*: `symbol`
  * *slot*: `symbol`

* *Return:*
  * *offset*: `integer`

## memcpy

**memcpy**
```lisp
(memcpy dst dst-type src src-type &OPTIONAL (size NIL))
```

Copy the contents from src to dst. `dst` can be a value of type `dst-type` or a list of `dst-type` elements.
In the same way, `src` can be a value of type `src-type` or a list of `src-type` elements. When `:pointer` is used
as a type the respectively value must be a pointer to C data. If `dst-type` and `src-type` are not `:pointer` the size
of copied data is the minimum of the size of `dst` and `src` data. If some of them is `:pointer` then the size is
determined by the other value and its type. If both are `:pointer` the size must be specified with `size`.
The possible types are: `:pointer`, `:bool`, `:int`, `:uint`, `:float` and `:double`.

* *Parameters*:
  * *dst*: `(or pointer int boolean integer float double Vulkan struct list)`
  * *src*: `(or pointer int boolean integer float double Vulkan struct list)`
  * *dst-type*: `(member '(pointer bool int uint float double))`
  * *src-type*: `(member '(pointer bool int uint float double))`
  * *size*: `integer`

