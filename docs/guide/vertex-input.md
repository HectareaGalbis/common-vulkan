
# Vertex input description

## Vertex shader

First change the vertex buffer:

```
#version 450

layout(location = 0) in vec2 inPosition;
layout(location = 1) in vec3 inColor;

layout(location = 0) out vec3 fragColor;

void main() {
    gl_Position = vec4(inPosition, 0.0, 1.0);
    fragColor = inColor;
}
```

## Vertex data

Before moving on we must know hot to define data that will be passed to Vulkan. Remember that Vulkan is a C api and it wants pointers that point to data. Also it must know the size in bytes of the data to be passed. This library provides the macro `def-vulkan-struct` in order to define the data and to be able to retrieve its size and other related stuff. If you want more info check out the [helper functions API](https://hectarea1996.github.io/common-vulkan/api/helper-functions#def-vulkan-struct.html).

Create a new structure called `vertex`:

```Lisp
(cvk:def-vulkan-struct vertex
  (pos :float :count 2)
  (color :float :count 3))
```

Now create a list of vertices:

```Lisp
(defparameter vertices (list (create-vertex :pos '(0.0 -0.5)
                                            :color '(1.0 0.0 0.0))
                             (create-vertex :pos '(0.5 0.5)
                                            :color '(0.0 1.0 0.0))
			                 (create-vertex :pos '(-0.5 0.5)
					                        :color '(0.0 0.0 1.0))))
```

See that we are using `create-vertex`. You know already that it means we need to use the `destroy-` counterpart to free each vertex. However, we are defining a global variable. Think about when `vertices` is initialized. After starting the REPL you will load the code file. It is in that moment when the `vertices` is initialized and each `vertex` struct is created. When the file is completely loaded you will execute the `main` function. If we destroy the vertices in the `main` function you won't be able to run it again because the vertices are not longer available. If you want to recreate them you need to reload the file. So, I prefer not to free them. Another option is create a function that create the vertex and another one to delete them.

## Binding descriptions

We are going to create a function to create a `VkVertexInputDescription`:

```Lisp
(defun create-binding-description ()
  (cvk:create-vertex-input-binding-description :binding 0
					                           :stride (cvk:sizeof 'vertex)
					                           :inputRate cvk:VK_VERTEX_INPUT_RATE_VERTEX))
```

We use `sizeof` to get the size of a `vertex` struct.

## Attribute descriptions

We need also two `VkVertexInputAttributeDescription` structures:

```Lisp
(defun create-attribute-descriptions ()
  (list (cvk:create-vertex-input-attribute-description :binding 0
	                        					       :location 0
	                        					       :format cvk:VK_FORMAT_R32G32_SFLOAT
	                        					       :offset (cvk:offsetof 'vertex 'pos))
	    (cvk:create-vertex-input-attribute-description :binding 0
	                        					       :location 1
	                        					       :format cvk:VK_FORMAT_R32G32_SFLOAT
	                        					       :offset (cvk:offsetof 'vertex 'color))))
```

We use `offsetof` to get the offset of a struct member.

## Pipeline vertex input

We need to change the `create-graphics-pipeline` to accept the vertex data. Modify the `vertex-input-info` struct:

```Lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
      ...
	(let ((binding-description (create-binding-description))
	      (attribute-descriptions (create-attribute-descriptions))))
    (cvk:with-pipeline-vertex-input-state-create-info vertex-input-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO
									                                     :vertexBindingDescriptionCount 1
									                                     :pVertexBindingDescriptions (list binding-description)
									                                     :vertexAttributeDescriptionCount (length attribute-descriptions)
									                                     :pVertexAttributeDescriptions attribute-descriptions))
    ...))
```

We need to destroy the data after creating the pipeline:

```Lisp
(defun create-graphics-pipeline (app)
  (uiop:nest
      ...
    (multiple-value-bind (graphics-pipelines result) ...)
    (progn
      (when (not (equal result cvk:VK_SUCCESS))
	    (error "failed to create graphics pipeline!"))
      (setf (graphics-pipeline app) (car graphics-pipelines))
      (cvk:destroy-vertex-input-binding-description binding-description)
      (loop for attribute-description in attribute-descriptions
	    do (cvk:destroy-vertex-input-attribute-description attribute-description))
      ...)))
```
If you try to run the program now it will throw some errors. The reason is we need to bind the vertex buffer to the binding. The next step is to create a vertex buffer and move the vertex data to it.

* [main.lisp](https://github.com/Hectarea1996/common-vulkan-guide/blob/main/code-guide/vertex-input.lisp)

* **Next**: [Vertex buffer creation](https://hectarea1996.github.io/common-vulkan/guide/vertex-buffer.html)
* **Previous**: [Swap chain recreation](https://hectarea1996.github.io/common-vulkan/guide/swap-chain-recreation.html)
