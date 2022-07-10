# Pipeline

## Structs

---

### VkPipelineShaderStageCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `Vulkan object`
* *flags*: `VkPipelineShaderStageCreateFlags`
* *stage*: `vkshaderstageflagbits`
* *module*: `VkShaderModule`
* *pName*: `string`
* *pSpecializationInfo*: `VkSpecializationInfo`

**create-pipeline-shader-stage-create-info**
```lisp
(create-pipeline-shader-stage-create-info &key
                                            (sType VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO)
                                            (pNext NIL)
                                            (flags 0)
                                            (stage 0)
                                            (module NIL)
                                            (pName NIL)
                                            (pSpecializationInfo NIL))
```

**destroy-pipeline-shader-stage-create-info**
```lisp
(destroy-pipeline-shader-stage-create-info obj)
```

**with-pipeline-shader-stage-create-info**
```lisp
(with-pipeline-shader-stage-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-shader-stage-create-info` and `destroy-pipeline-shader-stage-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(pipeline-shader-stage-create-info-sType obj) ; setf-able
(pipeline-shader-stage-create-info-pNext obj) ; setf-able
(pipeline-shader-stage-create-info-flags obj) ; setf-able
(pipeline-shader-stage-create-info-stage obj) ; setf-able
(pipeline-shader-stage-create-info-module obj) ; setf-able
(pipeline-shader-stage-create-info-pName obj) ; setf-able
(pipeline-shader-stage-create-info-pSpecializationInfo obj) ; setf-able
```

---

### VkPipelineDynamicStateCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `Vulkan object`
* *flags*: `vkpipelinedynamicstatecreateflags`
* *dynamicStateCount*: `uint32`
* *pDynamicStates*: `(list VkDynamicState)`

**create-pipeline-dynamic-state-create-info**
```lisp
(create-pipeline-dynamic-state-create-info &key
                                             (sType VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO)
                                             (pNext NIL)
                                             (flags 0)
                                             (dynamicStateCount 0)
                                             (pDynamicStates NIL))
```

**destroy-pipeline-dynamic-state-create-info**
```lisp
(destroy-pipeline-dynamic-state-create-info obj)
```

**with-pipeline-dynamic-state-create-info**
```lisp
(with-pipeline-dynamic-state-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-dynamic-state-create-info` and `destroy-pipeline-dynamic-state-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(pipeline-dynamic-state-create-info-sType obj) ; setf-able
(pipeline-dynamic-state-create-info-pNext obj) ; setf-able
(pipeline-dynamic-state-create-info-flags obj) ; setf-able
(pipeline-dynamic-state-create-info-dynamicStateCount obj) ; setf-able
(pipeline-dynamic-state-create-info-pDynamicStates obj &optional (index nil)) ; setf-able
```

---

### VkVertexInputBindingDescription

**Members**
* *binding*: `uint32`
* *stride*: `uint32`
* *inputRate*: `VkVertexInputRate`

**create-vertex-input-binding-description**
```lisp
(create-vertex-input-binding-description &key
                                           (binding 0)
                                           (stride 0)
                                           (inputRate 0))
```

**destroy-vertex-input-binding-description**
```lisp
(destroy-vertex-input-binding-description obj)
```

**with-vertex-input-binding-description**
```lisp
(with-vertex-input-binding-description var (&rest args)
  &body body)
```
Wrap the body expressions with `create-vertex-input-binding-description` and `destroy-vertex-input-binding-description`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(vertex-input-binding-description-binding obj) ; setf-able
(vertex-input-binding-description-stride obj) ; setf-able
(vertex-input-binding-description-inputRate obj) ; setf-able
```

---

### VkVertexInputAttributeDescription

**Members**
* *location*: `uint32`
* *binding*: `uint32`
* *format*: `VkFormat`
* *offset*: `uint32`

**create-vertex-input-attribute-description**
```lisp
(create-vertex-input-attribute-description &key
                                             (location 0)
                                             (binding 0)
                                             (format 0)
                                             (offset 0))
```

**destroy-vertex-input-attribute-description**
```lisp
(destroy-vertex-input-attribute-description obj)
```

**with-vertex-input-attribute-description**
```lisp
(with-vertex-input-attribute-description var (&rest args)
  &body body)
```
Wrap the body expressions with `create-vertex-input-attribute-description` and `destroy-vertex-input-attribute-description`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(vertex-input-attribute-description-location obj) ; setf-able
(vertex-input-attribute-description-binding obj) ; setf-able
(vertex-input-attribute-description-format obj) ; setf-able
(vertex-input-attribute-description-offset obj) ; setf-able
```

---

### VkPipelineVertexInputStateCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `Vulkan object`
* *flags*: `VkPipelineVertexInputStateCreateFlags`
* *vertexBindingDescriptionCount*: `uint32`
* *pVertexBindingDescriptions*: `(list VkVertexInputBindingDescription)`
* *vertexAttributeDescriptionCount*: `uint32`
* *pVertexAttributeDescriptions*: `(list VkVertexInputAttributeDescription)`

**create-pipeline-vertex-input-state-create-info**
```lisp
(create-pipeline-vertex-input-state-create-info &key
                                                  (sType VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO)
                                                  (pNext NIL)
                                                  (flags 0)
                                                  (vertexBindingDescriptionCount 0)
                                                  (pVertexBindingDescriptions NIL)
                                                  (vertexAttributeDescriptionCount 0)
                                                  (pVertexAttributeDescriptions NIL))
```

**destroy-pipeline-vertex-input-state-create-info**
```lisp
(destroy-pipeline-vertex-input-state-create-info obj)
```

**with-pipeline-vertex-input-state-create-info**
```lisp
(with-pipeline-vertex-input-state-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-vertex-input-state-create-info` and `destroy-pipeline-vertex-input-state-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(pipeline-vertex-input-state-create-info-sType obj) ; setf-able
(pipeline-vertex-input-state-create-info-pNext obj) ; setf-able
(pipeline-vertex-input-state-create-info-flags obj) ; setf-able
(pipeline-vertex-input-state-create-info-vertexBindingDescriptionCount obj) ; setf-able
(pipeline-vertex-input-state-create-info-pVertexBindingDescriptions obj &optional (index
                                                                                   nil)) ; setf-able
(pipeline-vertex-input-state-create-info-vertexAttributeDescriptionCount obj) ; setf-able
(pipeline-vertex-input-state-create-info-pVertexAttributeDescriptions obj &optional (index
                                                                                     nil)) ; setf-able
```

---

### VkPipelineInputAssemblyStateCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `Vulkan object`
* *flags*: `VkPipelineInputAssemblyStateCreateFlags`
* *topology*: `VkPrimitiveTopology`
* *primitiveRestartEnable*: `boolean`

**create-pipeline-input-assembly-state-create-info**
```lisp
(create-pipeline-input-assembly-state-create-info &key
                                                    (sType VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO)
                                                    (pNext NIL)
                                                    (flags 0)
                                                    (topology 0)
                                                    (primitiveRestartEnable 0))
```

**destroy-pipeline-input-assembly-state-create-info**
```lisp
(destroy-pipeline-input-assembly-state-create-info obj)
```

**with-pipeline-input-assembly-state-create-info**
```lisp
(with-pipeline-input-assembly-state-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-input-assembly-state-create-info` and `destroy-pipeline-input-assembly-state-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(pipeline-input-assembly-state-create-info-sType obj) ; setf-able
(pipeline-input-assembly-state-create-info-pNext obj) ; setf-able
(pipeline-input-assembly-state-create-info-flags obj) ; setf-able
(pipeline-input-assembly-state-create-info-topology obj) ; setf-able
(pipeline-input-assembly-state-create-info-primitiveRestartEnable obj) ; setf-able
```

---

### VkPipelineViewportStateCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `Vulkan object`
* *flags*: `VkPipelineViewportStateCreateFlags`
* *viewportCount*: `uint32`
* *pViewports*: `(list VkViewport)`
* *scissorCount*: `uint32`
* *pScissors*: `(list VkRect2D)`

**create-pipeline-viewport-state-create-info**
```lisp
(create-pipeline-viewport-state-create-info &key
                                              (sType VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO)
                                              (pNext NIL)
                                              (flags 0)
                                              (viewportCount 0)
                                              (pViewports NIL)
                                              (scissorCount 0)
                                              (pScissors NIL))
```

**destroy-pipeline-viewport-state-create-info**
```lisp
(destroy-pipeline-viewport-state-create-info obj)
```

**with-pipeline-viewport-state-create-info**
```lisp
(with-pipeline-viewport-state-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-viewport-state-create-info` and `destroy-pipeline-viewport-state-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(pipeline-viewport-state-create-info-sType obj) ; setf-able
(pipeline-viewport-state-create-info-pNext obj) ; setf-able
(pipeline-viewport-state-create-info-flags obj) ; setf-able
(pipeline-viewport-state-create-info-viewportCount obj) ; setf-able
(pipeline-viewport-state-create-info-pViewports obj &optional (index nil)) ; setf-able
(pipeline-viewport-state-create-info-scissorCount obj) ; setf-able
(pipeline-viewport-state-create-info-pScissors obj &optional (index nil)) ; setf-able
```

---

### VkPipelineRasterizationStateCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `Vulkan object`
* *flags*: `VkPipelineRasterizationStateCreateFlags`
* *depthClampEnable*: `VkBool32`
* *rasterizerDiscardEnable*: `VkBool32`
* *polygonMode*: `VkPolygonMode`
* *cullMode*: `VkCullModeFlags`
* *frontFace*: `VkFrontFace`
* *depthBiasEnable*: `VkBool32`
* *depthBiasConstantFactor*: `float`
* *depthBiasClamp*: `float`
* *depthBiasSlopeFactor*: `float`
* *lineWidth*: `float`

**create-pipeline-rasterization-state-create-info**
```lisp
(create-pipeline-rasterization-state-create-info &key
                                                   (sType VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO)
                                                   (pNext NIL)
                                                   (flags 0)
                                                   (depthClampEnable 0)
                                                   (rasterizerDiscardEnable 0)
                                                   (polygonMode 0)
                                                   (cullMode 0)
                                                   (frontFace 0)
                                                   (depthBiasEnable 0)
                                                   (depthBiasConstantFactor 0)
                                                   (depthBiasClamp 0)
                                                   (depthBiasSlopeFactor 0)
                                                   (lineWidth 0))
```

**destroy-pipeline-rasterization-state-create-info**
```lisp
(destroy-pipeline-rasterization-state-create-info obj)
```

**with-pipeline-rasterization-state-create-info**
```lisp
(with-pipeline-rasterization-state-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-rasterization-state-create-info` and `destroy-pipeline-rasterization-state-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(pipeline-rasterization-state-create-info-sType obj) ; setf-able
(pipeline-rasterization-state-create-info-pNext obj) ; setf-able
(pipeline-rasterization-state-create-info-flags obj) ; setf-able
(pipeline-rasterization-state-create-info-depthClampEnable obj) ; setf-able
(pipeline-rasterization-state-create-info-rasterizerDiscardEnable obj) ; setf-able
(pipeline-rasterization-state-create-info-polygonMode obj) ; setf-able
(pipeline-rasterization-state-create-info-cullMode obj) ; setf-able
(pipeline-rasterization-state-create-info-frontFace obj) ; setf-able
(pipeline-rasterization-state-create-info-depthBiasEnable obj) ; setf-able
(pipeline-rasterization-state-create-info-depthBiasConstantFactor obj) ; setf-able
(pipeline-rasterization-state-create-info-depthBiasClamp obj) ; setf-able
(pipeline-rasterization-state-create-info-depthBiasSlopeFactor obj) ; setf-able
(pipeline-rasterization-state-create-info-lineWidth obj) ; setf-able
```

---

### VkPipelineMultisampleStateCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `Vulkan object`
* *flags*: `VkPipelineMultisampleStateCreateFlags`
* *rasterizationSamples*: `VkSampleCountFlagBits`
* *sampleShadingEnable*: `VkBool32`
* *minSampleShading*: `float`
* *pSampleMask*: `(list VkSampleMask)`
* *alphaToCoverageEnable*: `VkBool32`
* *alphaToOneEnable*: `VkBool32`

**create-pipeline-multisample-state-create-info**
```lisp
(create-pipeline-multisample-state-create-info &key
                                                 (sType VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO)
                                                 (pNext NIL)
                                                 (flags 0)
                                                 (rasterizationSamples 0)
                                                 (sampleShadingEnable 0)
                                                 (minSampleShading 0)
                                                 (pSampleMask NIL)
                                                 (alphaToCoverageEnable 0)
                                                 (alphaToOneEnable 0))
```

**destroy-pipeline-multisample-state-create-info**
```lisp
(destroy-pipeline-multisample-state-create-info obj)
```

**with-pipeline-multisample-state-create-info**
```lisp
(with-pipeline-multisample-state-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-multisample-state-create-info` and `destroy-pipeline-multisample-state-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(pipeline-multisample-state-create-info-sType obj) ; setf-able
(pipeline-multisample-state-create-info-pNext obj) ; setf-able
(pipeline-multisample-state-create-info-flags obj) ; setf-able
(pipeline-multisample-state-create-info-rasterizationSamples obj) ; setf-able
(pipeline-multisample-state-create-info-sampleShadingEnable obj) ; setf-able
(pipeline-multisample-state-create-info-minSampleShading obj) ; setf-able
(pipeline-multisample-state-create-info-pSampleMask obj &optional (index nil)) ; setf-able
(pipeline-multisample-state-create-info-alphaToCoverageEnable obj) ; setf-able
(pipeline-multisample-state-create-info-alphaToOneEnable obj) ; setf-able
```

---

### VkPipelineColorBlendAttachmentState

**Members**
* *blendEnable*: `VkBool32`
* *srcColorBlendFactor*: `VkBlendFactor`
* *dstColorBlendFactor*: `VkBlendFactor`
* *colorBlendOp*: `VkBlendOp`
* *srcAlphaBlendFactor*: `VkBlendFactor`
* *dstAlphaBlendFactor*: `VkBlendFactor`
* *alphaBlendOp*: `VkBlendOp`
* *colorWriteMask*: `VkColorComponentFlags`

**create-pipeline-color-blend-attachment-state**
```lisp
(create-pipeline-color-blend-attachment-state &key
                                                (blendEnable 0)
                                                (srcColorBlendFactor 0)
                                                (dstColorBlendFactor 0)
                                                (colorBlendOp 0)
                                                (srcAlphaBlendFactor 0)
                                                (dstAlphaBlendFactor 0)
                                                (alphaBlendOp 0)
                                                (colorWriteMask 0))
```

**destroy-pipeline-color-blend-attachment-state**
```lisp
(destroy-pipeline-color-blend-attachment-state obj)
```

**with-pipeline-color-blend-attachment-state**
```lisp
(with-pipeline-color-blend-attachment-state var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-color-blend-attachment-state` and `destroy-pipeline-color-blend-attachment-state`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(pipeline-color-blend-attachment-state-blendEnable obj) ; setf-able
(pipeline-color-blend-attachment-state-srcColorBlendFactor obj) ; setf-able
(pipeline-color-blend-attachment-state-dstColorBlendFactor obj) ; setf-able
(pipeline-color-blend-attachment-state-colorBlendOp obj) ; setf-able
(pipeline-color-blend-attachment-state-srcAlphaBlendFactor obj) ; setf-able
(pipeline-color-blend-attachment-state-dstAlphaBlendFactor obj) ; setf-able
(pipeline-color-blend-attachment-state-alphaBlendOp obj) ; setf-able
(pipeline-color-blend-attachment-state-colorWriteMask obj) ; setf-able
```

---

### VkPipelineColorBlendStateCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `Vulkan object`
* *flags*: `VkPipelineColorBlendStateCreateFlags`
* *logicOpEnable*: `VkBool32`
* *logicOp*: `VkLogicOp`
* *attachmentCount*: `uint32`
* *pAttachments*: `(list VkPipelineColorBlendAttachmentState)`
* *blendConstants*: `(list float)`

**create-pipeline-color-blend-state-create-info**
```lisp
(create-pipeline-color-blend-state-create-info &key
                                                 (sType VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO)
                                                 (pNext NIL)
                                                 (flags 0)
                                                 (logicOpEnable 0)
                                                 (logicOp 0)
                                                 (attachmentCount 0)
                                                 (pAttachments NIL)
                                                 (blendConstants 0))
```

**destroy-pipeline-color-blend-state-create-info**
```lisp
(destroy-pipeline-color-blend-state-create-info obj)
```

**with-pipeline-color-blend-state-create-info**
```lisp
(with-pipeline-color-blend-state-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-color-blend-state-create-info` and `destroy-pipeline-color-blend-state-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(pipeline-color-blend-state-create-info-sType obj) ; setf-able
(pipeline-color-blend-state-create-info-pNext obj) ; setf-able
(pipeline-color-blend-state-create-info-flags obj) ; setf-able
(pipeline-color-blend-state-create-info-logicOpEnable obj) ; setf-able
(pipeline-color-blend-state-create-info-logicOp obj) ; setf-able
(pipeline-color-blend-state-create-info-attachmentCount obj) ; setf-able
(pipeline-color-blend-state-create-info-pAttachments obj &optional (index nil)) ; setf-able
(pipeline-color-blend-state-create-info-blendConstants obj &optional (index nil)) ; setf-able
```

---

### VkPipelineLayoutCreateInfo

**Members**
* *sType*: `VkStructureType`
* *pNext*: `Vulkan object`
* *flags*: `VkPipelineLayoutCreateFlags`
* *setLayoutCount*: `uint32`
* *pSetLayouts*: `(list VkDescriptorSetLayout)`
* *pushConstantRangeCount*: `uint32`
* *pPushConstantRanges*: `(list VkDescriptorSetLayout)`

**create-pipeline-layout-create-info**
```lisp
(create-pipeline-layout-create-info &key
                                      (sType VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO)
                                      (pNext NIL)
                                      (flags 0)
                                      (setLayoutCount 0)
                                      (pSetLayouts 0)
                                      (pushConstantRangeCount 0)
                                      (pPushConstantRanges 0))
```

**destroy-pipeline-layout-create-info**
```lisp
(destroy-pipeline-layout-create-info obj)
```

**with-pipeline-layout-create-info**
```lisp
(with-pipeline-layout-create-info var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-layout-create-info` and `destroy-pipeline-layout-create-info`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

**Accessors**
```lisp
(pipeline-layout-create-info-sType obj) ; setf-able
(pipeline-layout-create-info-pNext obj) ; setf-able
(pipeline-layout-create-info-flags obj) ; setf-able
(pipeline-layout-create-info-setLayoutCount obj) ; setf-able
(pipeline-layout-create-info-pSetLayouts obj &optional (index nil)) ; setf-able
(pipeline-layout-create-info-pushConstantRangeCount obj) ; setf-able
(pipeline-layout-create-info-pPushConstantRanges obj &optional (index nil)) ; setf-able
```

## Functions

---

### vkCreatePipelineLayout

**create-pipeline-layout**
```lisp
(create-pipeline-layout device pCreateInfo pAllocator) => (values pPipelineLayout result)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pCreateInfo*: `VkPipelineLayoutCreateInfo`
  * *pAllocator*: `VkAllocationCallbacks`

* *Return:*
  * *pPipelineLayout*: `VkPipelineLayout`
  * *result*: `VkResult`

---

### vkDestroyPipelineLayout

**destroy-pipeline-layout**
```lisp
(destroy-pipeline-layout device pipelineLayout pAllocator)
```

* *Parameters*:
  * *device*: `VkDevice`
  * *pipelineLayout*: `VkPipelineLayout`
  * *pAllocator*: `VkAllocationCallbacks`

---

### with-pipeline-layout

**with-pipeline-layout**
```lisp
(with-pipeline-layout var (&rest args)
  &body body)
```
Wrap the body expressions with `create-pipeline-layout` and `destroy-pipeline-layout`. The new object(s) is(are) bound to `var`. The arguments `args` are passed to the constructor.

