# Shader module

## Structs

---

### VkShaderModuleCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `Vulkan object`
* *flags*: `VkShaderModuleCreateFlags`
* *codeSize*: `size`
* *pCode*: `spv code`

**create-shader-module-create-info**
```lisp
(create-shader-module-create-info &key
                                    (sType VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO)
                                    (pNext NIL)
                                    (flags 0)
                                    (codeSize 0)
                                    (pCode 0))
```

**destroy-shader-module-create-info**
```lisp
(destroy-shader-module-create-info obj)
```

**with-shader-module-create-info**
```lisp
(with-shader-module-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-shader-module-create-info` and `destroy-shader-module-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(shader-module-create-info-sType obj) ; setf-able
(shader-module-create-info-pNext obj) ; setf-able
(shader-module-create-info-flags obj) ; setf-able
(shader-module-create-info-codeSize obj) ; setf-able
(shader-module-create-info-pCode obj) ; setf-able
```

## Functions

---

### vkCreateShaderModule

**create-shader-module**
```lisp
(create-shader-module device pCreateInfo pAllocator) => (values pShaderModule result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkShaderModuleCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pShaderModule*: `VkShaderModule`
  * *result*: `VkResult`

---

### vkDestroyShaderModule

**destroy-shader-module**
```lisp
(destroy-shader-module device shaderModule pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *shaderModule*: `VkShaderModule`
  * *pAllocator*: `VkAllocationCallbacks`

---

### with-shader-module

**with-shader-module**
```lisp
(with-shader-module var (&rest args)
  &body body)
```
Wrap the body expressions with `create-shader-module` and `destroy-shader-module`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

