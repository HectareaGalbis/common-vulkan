## create-spv-code

**create-spv-code**
```lisp
(create-spv-code file) => (values code size)
```

* *Parameters*:
  * *file*: `pathname designator`

* *Return:*
  * *code*: `spv code`
  * *size*: `uint`

## destroy-spv-code

**destroy-spv-code**
```lisp
(destroy-spv-code code)
```

* *Parameters*:
  * *code*: `spv code`

**with-spv-code**
```lisp
(with-spv-code var (&rest args)
  &body body)
```
Wrap the body expressions with `create-spv-code` and `destroy-spv-code`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

