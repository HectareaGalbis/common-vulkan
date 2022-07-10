
# Shader modules

Before starting, create the function `create-graphics-pipeline` and call it from `init-vulkan`.

```lisp
(defun shader-modules (app)
  ...
  )

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (create-surface app)
  (pick-physical-device app)
  (create-logical-device app)
  (create-swap-chain app)
  (create-image-views app)
  (create-graphics-pipeline app))
```

## Compiling the shaders

Create a directory called `shaders` in the root directory and store a `shader.vert` and a `shader.frag` files.

The contents of `shader.vert` should be:

```glsl
#version 450

layout(location = 0) out vec3 fragColor;

vec2 positions[3] = vec2[](
    vec2(0.0, -0.5),
    vec2(0.5, 0.5),
    vec2(-0.5, 0.5)
);

vec3 colors[3] = vec3[](
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0)
);

void main() {
    gl_Position = vec4(positions[gl_VertexIndex], 0.0, 1.0);
    fragColor = colors[gl_VertexIndex];
}
```

The contents of `shader.frag` should be:

```glsl
#version 450

layout(location = 0) in vec3 fragColor;

layout(location = 0) out vec4 outColor;

void main() {
    outColor = vec4(fragColor, 1.0);
}
```

Now we are going to compile these files into SPIR-V bytecode.

**Windows**

Create a `compile.bat` file with the following contents:

```
C:/VulkanSDK/x.x.x.x/Bin32/glslc.exe shader.vert -o vert.spv
C:/VulkanSDK/x.x.x.x/Bin32/glslc.exe shader.frag -o frag.spv
pause
```

Replace the path to `glslc.exe` with the path to where you installed the Vulkan SDK. Double click the file to run it.

**Linux**

Create a `compile.sh` file with the following contents:

```
/home/user/VulkanSDK/x.x.x.x/x86_64/bin/glslc shader.vert -o vert.spv
/home/user/VulkanSDK/x.x.x.x/x86_64/bin/glslc shader.frag -o frag.spv
```

Replace the path to `glslc` with the path to where you installed the Vulkan SDK. Make the script executable with `chmod +x compile.sh` and run it.

## Loading a shader

The `common-vulkan` library contains a helper function to read SPIR-V binary files. Also, these functions do a memory allocation in the C side, so we hace a `create-` and `destroy-` functions. We will use instead, the `with-` equivalent macro.

```lisp
(defun create-graphics-pipeline (app)
  (cvk:with-spv-code (vert-shader-code vert-size) ((asdf:system-relative-pathname "common-vulkan-guide"
                                                                                  "shaders/vert.spv"))
    (cvk:with-spv-code (frag-shader-code frag-size) ((asdf:system-relative-pathname "common-vulkan-guide"
                                                                                    "shaders/frag.spv"))
      ...
      )))
```

We have used `system-relative-pathname` to find the SPIR-V files. Note that `with-spv-code` returns two values, the code and its size.

## Creating shader modules

The code must be wrapped in a `VkShaderModule` object. Let's create a helper function `create-shader-module` to do that.

```lisp
(defun create-shader-module (app code size)
  ...
  )
```

First we need to create a `VkShaderModuleCreateInfo` structure.

```lisp
(defun create-shader-module (app code size)
  (cvk:with-shader-module-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
						   :codeSize size
						   :pCode code)
    ...
    ))
```

And then we use `create-shader-module` to create the `VkShaderModule`.

```lisp
(defun create-shader-module (app code size)
  (cvk:with-shader-module-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
						   :codeSize size
						   :pCode code)
    (multiple-value-bind (shader-module result) (cvk:create-shader-module (device app) create-info nil)
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to create shader module!"))
      shader-module)))
```

Note that we have used a `create-` function. Later we will use the `destroy-` function.

We will call `create-shader-module` in `create-graphics-pipeline`. Also, we will destroy the shader modules at the end of the `let` expression.

```lisp
(defun create-graphics-pipeline (app)
  (cvk:with-spv-code (vert-shader-code vert-size) ((asdf:system-relative-pathname "common-vulkan-guide" "shaders/vert.spv"))
    (cvk:with-spv-code (frag-shader-code frag-size) ((asdf:system-relative-pathname "common-vulkan-guide" "shaders/frag.spv"))
      (let ((vert-shader-module (create-shader-module app vert-shader-code vert-size))
	    (frag-shader-module (create-shader-module app frag-shader-code frag-size)))
	...
	(cvk:destroy-shader-module (device app) frag-shader-module nil)
	(cvk:destroy-shader-module (device app) vert-shader-module nil)))))
```

## Shader stage creation

We need to assign the shaders to a specific pipeline stage through `VkPipelineShaderStageCreateInfo`. Create them at the beginning of the `let` expression.

```lisp
(cvk:with-pipeline-shader-stage-create-info vert-shader-stage-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO
								    :stage cvk:VK_SHADER_STAGE_VERTEX_BIT
								    :module vert-shader-module
								    :pName "main")
  (cvk:with-pipeline-shader-stage-create-info frag-shader-stage-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO
								      :stage cvk:VK_SHADER_STAGE_FRAGMENT_BIT
								      :module frag-shader-module
								      :pName "main")
    (let ((shader-stages (list vert-shader-stage-info frag-shader-stage-info)))
      ...
      )))
```

We will continue in the next section.

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/shader-modules.lisp)

* **Next**: [Fixed functions](https://hectarea1996.github.io/common-vulkan/guide/fixed-functions.html)
* **Previous**: [Image views](https://hectarea1996.github.io/common-vulkan/guide/image-views.html)
