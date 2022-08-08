## VK_MAKE_API_VERSION

```lisp
(vk_make_api_version VARIANTMAJORMINORPATCH)
```

## VK_API_VERSION_VARIANT

```lisp
(vk_api_version_variant VERSION)
```

## VK_API_VERSION_MAJOR

```lisp
(vk_api_version_major VERSION)
```

## VK_API_VERSION_MINOR

```lisp
(vk_api_version_minor VERSION)
```

## VK_API_VERSION_PATCH

```lisp
(vk_api_version_patch VERSION)
```

## UINT64_MAX

```lisp
(defconstant uint64_max (1- (EXPT 2 64)))
```

## UINT32_MAX

```lisp
(defconstant uint32_max (1- (EXPT 2 32)))
```

## VK_NULL_HANDLE

```lisp
(defconstant vk_null_handle (NULL-POINTER))
```

## VK_API_VERSION_1_0

```lisp
(defconstant vk_api_version_1_0 (VK_MAKE_API_VERSION 0 1 0 0))
```

## VK_HEADER_VERSION

```lisp
(defconstant vk_header_version 216)
```

## VK_HEADER_VERSION_COMPLETE

```lisp
(defconstant vk_header_version_complete (VK_MAKE_API_VERSION 0 1 3
                                                             VK_HEADER_VERSION))
```

## VK_ATTACHMENT_UNUSED

```lisp
(defconstant vk_attachment_unused (- UINT32_MAX 0))
```

## VK_FALSE

```lisp
(defconstant vk_false 0)
```

## VK_LOD_CLAMP_NONE

```lisp
(defconstant vk_lod_clamp_none 1000.0)
```

## VK_QUEUE_FAMILY_IGNORED

```lisp
(defconstant vk_queue_family_ignored (- UINT32_MAX 0))
```

## VK_REMAINING_ARRAY_LAYERS

```lisp
(defconstant vk_remaining_array_layers (- UINT32_MAX 0))
```

## VK_REMAINING_MIP_LEVELS

```lisp
(defconstant vk_remaining_mip_levels (- UINT32_MAX 0))
```

## VK_SUBPASS_EXTERNAL

```lisp
(defconstant vk_subpass_external (- UINT32_MAX 0))
```

## VK_TRUE

```lisp
(defconstant vk_true 1)
```

## VK_WHOLE_SIZE

```lisp
(defconstant vk_whole_size (- UINT64_MAX 0))
```

## VK_MAX_MEMORY_TYPES

```lisp
(defconstant vk_max_memory_types 32)
```

## VK_MAX_PHYSICAL_DEVICE_NAME_SIZE

```lisp
(defconstant vk_max_physical_device_name_size 256)
```

## VK_UUID_SIZE

```lisp
(defconstant vk_uuid_size 16)
```

## VK_MAX_EXTENSION_NAME_SIZE

```lisp
(defconstant vk_max_extension_name_size 256)
```

## VK_MAX_DESCRIPTION_SIZE

```lisp
(defconstant vk_max_description_size 256)
```

## VK_MAX_MEMORY_HEAPS

```lisp
(defconstant vk_max_memory_heaps 16)
```

## VK_VERSION_1_1

```lisp
(defconstant vk_version_1_1 1)
```

## VK_API_VERSION_1_1

```lisp
(defconstant vk_api_version_1_1 (VK_MAKE_API_VERSION 0 1 1 0))
```

## VK_MAX_DEVICE_GROUP_SIZE

```lisp
(defconstant vk_max_device_group_size 32)
```

## VK_LUID_SIZE

```lisp
(defconstant vk_luid_size 8)
```

## VK_QUEUE_FAMILY_EXTERNAL

```lisp
(defconstant vk_queue_family_external (- UINT32_MAX 1))
```

## VK_VERSION_1_2

```lisp
(defconstant vk_version_1_2 1)
```

## VK_API_VERSION_1_2

```lisp
(defconstant vk_api_version_1_2 (VK_MAKE_API_VERSION 0 1 2 0))
```

## VK_MAX_DRIVER_NAME_SIZE

```lisp
(defconstant vk_max_driver_name_size 256)
```

## VK_MAX_DRIVER_INFO_SIZE

```lisp
(defconstant vk_max_driver_info_size 256)
```

## VK_VERSION_1_3

```lisp
(defconstant vk_version_1_3 1)
```

## VK_API_VERSION_1_3

```lisp
(defconstant vk_api_version_1_3 (VK_MAKE_API_VERSION 0 1 3 0))
```

## VK_PIPELINE_STAGE_2_NONE

```lisp
(defconstant vk_pipeline_stage_2_none 0)
```

## VK_PIPELINE_STAGE_2_NONE_KHR

```lisp
(defconstant vk_pipeline_stage_2_none_khr 0)
```

## VK_PIPELINE_STAGE_2_TOP_OF_PIPE_BIT

```lisp
(defconstant vk_pipeline_stage_2_top_of_pipe_bit 1)
```

## VK_PIPELINE_STAGE_2_TOP_OF_PIPE_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_top_of_pipe_bit_khr 1)
```

## VK_PIPELINE_STAGE_2_DRAW_INDIRECT_BIT

```lisp
(defconstant vk_pipeline_stage_2_draw_indirect_bit 2)
```

## VK_PIPELINE_STAGE_2_DRAW_INDIRECT_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_draw_indirect_bit_khr 2)
```

## VK_PIPELINE_STAGE_2_VERTEX_INPUT_BIT

```lisp
(defconstant vk_pipeline_stage_2_vertex_input_bit 4)
```

## VK_PIPELINE_STAGE_2_VERTEX_INPUT_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_vertex_input_bit_khr 4)
```

## VK_PIPELINE_STAGE_2_VERTEX_SHADER_BIT

```lisp
(defconstant vk_pipeline_stage_2_vertex_shader_bit 8)
```

## VK_PIPELINE_STAGE_2_VERTEX_SHADER_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_vertex_shader_bit_khr 8)
```

## VK_PIPELINE_STAGE_2_TESSELLATION_CONTROL_SHADER_BIT

```lisp
(defconstant vk_pipeline_stage_2_tessellation_control_shader_bit 10)
```

## VK_PIPELINE_STAGE_2_TESSELLATION_CONTROL_SHADER_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_tessellation_control_shader_bit_khr 10)
```

## VK_PIPELINE_STAGE_2_TESSELLATION_EVALUATION_SHADER_BIT

```lisp
(defconstant vk_pipeline_stage_2_tessellation_evaluation_shader_bit 20)
```

## VK_PIPELINE_STAGE_2_TESSELLATION_EVALUATION_SHADER_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_tessellation_evaluation_shader_bit_khr 20)
```

## VK_PIPELINE_STAGE_2_GEOMETRY_SHADER_BIT

```lisp
(defconstant vk_pipeline_stage_2_geometry_shader_bit 40)
```

## VK_PIPELINE_STAGE_2_GEOMETRY_SHADER_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_geometry_shader_bit_khr 40)
```

## VK_PIPELINE_STAGE_2_FRAGMENT_SHADER_BIT

```lisp
(defconstant vk_pipeline_stage_2_fragment_shader_bit 80)
```

## VK_PIPELINE_STAGE_2_FRAGMENT_SHADER_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_fragment_shader_bit_khr 80)
```

## VK_PIPELINE_STAGE_2_EARLY_FRAGMENT_TESTS_BIT

```lisp
(defconstant vk_pipeline_stage_2_early_fragment_tests_bit 100)
```

## VK_PIPELINE_STAGE_2_EARLY_FRAGMENT_TESTS_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_early_fragment_tests_bit_khr 100)
```

## VK_PIPELINE_STAGE_2_LATE_FRAGMENT_TESTS_BIT

```lisp
(defconstant vk_pipeline_stage_2_late_fragment_tests_bit 200)
```

## VK_PIPELINE_STAGE_2_LATE_FRAGMENT_TESTS_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_late_fragment_tests_bit_khr 200)
```

## VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT

```lisp
(defconstant vk_pipeline_stage_2_color_attachment_output_bit 400)
```

## VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_color_attachment_output_bit_khr 400)
```

## VK_PIPELINE_STAGE_2_COMPUTE_SHADER_BIT

```lisp
(defconstant vk_pipeline_stage_2_compute_shader_bit 800)
```

## VK_PIPELINE_STAGE_2_COMPUTE_SHADER_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_compute_shader_bit_khr 800)
```

## VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT

```lisp
(defconstant vk_pipeline_stage_2_all_transfer_bit 1000)
```

## VK_PIPELINE_STAGE_2_ALL_TRANSFER_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_all_transfer_bit_khr 1000)
```

## VK_PIPELINE_STAGE_2_TRANSFER_BIT

```lisp
(defconstant vk_pipeline_stage_2_transfer_bit 1000)
```

## VK_PIPELINE_STAGE_2_TRANSFER_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_transfer_bit_khr 1000)
```

## VK_PIPELINE_STAGE_2_BOTTOM_OF_PIPE_BIT

```lisp
(defconstant vk_pipeline_stage_2_bottom_of_pipe_bit 2000)
```

## VK_PIPELINE_STAGE_2_BOTTOM_OF_PIPE_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_bottom_of_pipe_bit_khr 2000)
```

## VK_PIPELINE_STAGE_2_HOST_BIT

```lisp
(defconstant vk_pipeline_stage_2_host_bit 4000)
```

## VK_PIPELINE_STAGE_2_HOST_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_host_bit_khr 4000)
```

## VK_PIPELINE_STAGE_2_ALL_GRAPHICS_BIT

```lisp
(defconstant vk_pipeline_stage_2_all_graphics_bit 8000)
```

## VK_PIPELINE_STAGE_2_ALL_GRAPHICS_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_all_graphics_bit_khr 8000)
```

## VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT

```lisp
(defconstant vk_pipeline_stage_2_all_commands_bit 10000)
```

## VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_all_commands_bit_khr 10000)
```

## VK_PIPELINE_STAGE_2_COPY_BIT

```lisp
(defconstant vk_pipeline_stage_2_copy_bit 100000000)
```

## VK_PIPELINE_STAGE_2_COPY_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_copy_bit_khr 100000000)
```

## VK_PIPELINE_STAGE_2_RESOLVE_BIT

```lisp
(defconstant vk_pipeline_stage_2_resolve_bit 200000000)
```

## VK_PIPELINE_STAGE_2_RESOLVE_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_resolve_bit_khr 200000000)
```

## VK_PIPELINE_STAGE_2_BLIT_BIT

```lisp
(defconstant vk_pipeline_stage_2_blit_bit 400000000)
```

## VK_PIPELINE_STAGE_2_BLIT_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_blit_bit_khr 400000000)
```

## VK_PIPELINE_STAGE_2_CLEAR_BIT

```lisp
(defconstant vk_pipeline_stage_2_clear_bit 800000000)
```

## VK_PIPELINE_STAGE_2_CLEAR_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_clear_bit_khr 800000000)
```

## VK_PIPELINE_STAGE_2_INDEX_INPUT_BIT

```lisp
(defconstant vk_pipeline_stage_2_index_input_bit 1000000000)
```

## VK_PIPELINE_STAGE_2_INDEX_INPUT_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_index_input_bit_khr 1000000000)
```

## VK_PIPELINE_STAGE_2_VERTEX_ATTRIBUTE_INPUT_BIT

```lisp
(defconstant vk_pipeline_stage_2_vertex_attribute_input_bit 2000000000)
```

## VK_PIPELINE_STAGE_2_VERTEX_ATTRIBUTE_INPUT_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_vertex_attribute_input_bit_khr 2000000000)
```

## VK_PIPELINE_STAGE_2_PRE_RASTERIZATION_SHADERS_BIT

```lisp
(defconstant vk_pipeline_stage_2_pre_rasterization_shaders_bit 4000000000)
```

## VK_PIPELINE_STAGE_2_PRE_RASTERIZATION_SHADERS_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_pre_rasterization_shaders_bit_khr 4000000000)
```

## VK_PIPELINE_STAGE_2_VIDEO_DECODE_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_video_decode_bit_khr 4000000)
```

## VK_PIPELINE_STAGE_2_VIDEO_ENCODE_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_video_encode_bit_khr 8000000)
```

## VK_PIPELINE_STAGE_2_TRANSFORM_FEEDBACK_BIT_EXT

```lisp
(defconstant vk_pipeline_stage_2_transform_feedback_bit_ext 1000000)
```

## VK_PIPELINE_STAGE_2_CONDITIONAL_RENDERING_BIT_EXT

```lisp
(defconstant vk_pipeline_stage_2_conditional_rendering_bit_ext 40000)
```

## VK_PIPELINE_STAGE_2_COMMAND_PREPROCESS_BIT_NV

```lisp
(defconstant vk_pipeline_stage_2_command_preprocess_bit_nv 20000)
```

## VK_PIPELINE_STAGE_2_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_fragment_shading_rate_attachment_bit_khr 400000)
```

## VK_PIPELINE_STAGE_2_SHADING_RATE_IMAGE_BIT_NV

```lisp
(defconstant vk_pipeline_stage_2_shading_rate_image_bit_nv 400000)
```

## VK_PIPELINE_STAGE_2_ACCELERATION_STRUCTURE_BUILD_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_acceleration_structure_build_bit_khr 2000000)
```

## VK_PIPELINE_STAGE_2_RAY_TRACING_SHADER_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_ray_tracing_shader_bit_khr 200000)
```

## VK_PIPELINE_STAGE_2_RAY_TRACING_SHADER_BIT_NV

```lisp
(defconstant vk_pipeline_stage_2_ray_tracing_shader_bit_nv 200000)
```

## VK_PIPELINE_STAGE_2_ACCELERATION_STRUCTURE_BUILD_BIT_NV

```lisp
(defconstant vk_pipeline_stage_2_acceleration_structure_build_bit_nv 2000000)
```

## VK_PIPELINE_STAGE_2_FRAGMENT_DENSITY_PROCESS_BIT_EXT

```lisp
(defconstant vk_pipeline_stage_2_fragment_density_process_bit_ext 800000)
```

## VK_PIPELINE_STAGE_2_TASK_SHADER_BIT_NV

```lisp
(defconstant vk_pipeline_stage_2_task_shader_bit_nv 80000)
```

## VK_PIPELINE_STAGE_2_MESH_SHADER_BIT_NV

```lisp
(defconstant vk_pipeline_stage_2_mesh_shader_bit_nv 100000)
```

## VK_PIPELINE_STAGE_2_SUBPASS_SHADING_BIT_HUAWEI

```lisp
(defconstant vk_pipeline_stage_2_subpass_shading_bit_huawei 8000000000)
```

## VK_PIPELINE_STAGE_2_INVOCATION_MASK_BIT_HUAWEI

```lisp
(defconstant vk_pipeline_stage_2_invocation_mask_bit_huawei 10000000000)
```

## VK_PIPELINE_STAGE_2_ACCELERATION_STRUCTURE_COPY_BIT_KHR

```lisp
(defconstant vk_pipeline_stage_2_acceleration_structure_copy_bit_khr 10000000)
```

## VK_ACCESS_2_NONE

```lisp
(defconstant vk_access_2_none 0)
```

## VK_ACCESS_2_NONE_KHR

```lisp
(defconstant vk_access_2_none_khr 0)
```

## VK_ACCESS_2_INDIRECT_COMMAND_READ_BIT

```lisp
(defconstant vk_access_2_indirect_command_read_bit 1)
```

## VK_ACCESS_2_INDIRECT_COMMAND_READ_BIT_KHR

```lisp
(defconstant vk_access_2_indirect_command_read_bit_khr 1)
```

## VK_ACCESS_2_INDEX_READ_BIT

```lisp
(defconstant vk_access_2_index_read_bit 2)
```

## VK_ACCESS_2_INDEX_READ_BIT_KHR

```lisp
(defconstant vk_access_2_index_read_bit_khr 2)
```

## VK_ACCESS_2_VERTEX_ATTRIBUTE_READ_BIT

```lisp
(defconstant vk_access_2_vertex_attribute_read_bit 4)
```

## VK_ACCESS_2_VERTEX_ATTRIBUTE_READ_BIT_KHR

```lisp
(defconstant vk_access_2_vertex_attribute_read_bit_khr 4)
```

## VK_ACCESS_2_UNIFORM_READ_BIT

```lisp
(defconstant vk_access_2_uniform_read_bit 8)
```

## VK_ACCESS_2_UNIFORM_READ_BIT_KHR

```lisp
(defconstant vk_access_2_uniform_read_bit_khr 8)
```

## VK_ACCESS_2_INPUT_ATTACHMENT_READ_BIT

```lisp
(defconstant vk_access_2_input_attachment_read_bit 10)
```

## VK_ACCESS_2_INPUT_ATTACHMENT_READ_BIT_KHR

```lisp
(defconstant vk_access_2_input_attachment_read_bit_khr 10)
```

## VK_ACCESS_2_SHADER_READ_BIT

```lisp
(defconstant vk_access_2_shader_read_bit 20)
```

## VK_ACCESS_2_SHADER_READ_BIT_KHR

```lisp
(defconstant vk_access_2_shader_read_bit_khr 20)
```

## VK_ACCESS_2_SHADER_WRITE_BIT

```lisp
(defconstant vk_access_2_shader_write_bit 40)
```

## VK_ACCESS_2_SHADER_WRITE_BIT_KHR

```lisp
(defconstant vk_access_2_shader_write_bit_khr 40)
```

## VK_ACCESS_2_COLOR_ATTACHMENT_READ_BIT

```lisp
(defconstant vk_access_2_color_attachment_read_bit 80)
```

## VK_ACCESS_2_COLOR_ATTACHMENT_READ_BIT_KHR

```lisp
(defconstant vk_access_2_color_attachment_read_bit_khr 80)
```

## VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT

```lisp
(defconstant vk_access_2_color_attachment_write_bit 100)
```

## VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT_KHR

```lisp
(defconstant vk_access_2_color_attachment_write_bit_khr 100)
```

## VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_READ_BIT

```lisp
(defconstant vk_access_2_depth_stencil_attachment_read_bit 200)
```

## VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_READ_BIT_KHR

```lisp
(defconstant vk_access_2_depth_stencil_attachment_read_bit_khr 200)
```

## VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT

```lisp
(defconstant vk_access_2_depth_stencil_attachment_write_bit 400)
```

## VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT_KHR

```lisp
(defconstant vk_access_2_depth_stencil_attachment_write_bit_khr 400)
```

## VK_ACCESS_2_TRANSFER_READ_BIT

```lisp
(defconstant vk_access_2_transfer_read_bit 800)
```

## VK_ACCESS_2_TRANSFER_READ_BIT_KHR

```lisp
(defconstant vk_access_2_transfer_read_bit_khr 800)
```

## VK_ACCESS_2_TRANSFER_WRITE_BIT

```lisp
(defconstant vk_access_2_transfer_write_bit 1000)
```

## VK_ACCESS_2_TRANSFER_WRITE_BIT_KHR

```lisp
(defconstant vk_access_2_transfer_write_bit_khr 1000)
```

## VK_ACCESS_2_HOST_READ_BIT

```lisp
(defconstant vk_access_2_host_read_bit 2000)
```

## VK_ACCESS_2_HOST_READ_BIT_KHR

```lisp
(defconstant vk_access_2_host_read_bit_khr 2000)
```

## VK_ACCESS_2_HOST_WRITE_BIT

```lisp
(defconstant vk_access_2_host_write_bit 4000)
```

## VK_ACCESS_2_HOST_WRITE_BIT_KHR

```lisp
(defconstant vk_access_2_host_write_bit_khr 4000)
```

## VK_ACCESS_2_MEMORY_READ_BIT

```lisp
(defconstant vk_access_2_memory_read_bit 8000)
```

## VK_ACCESS_2_MEMORY_READ_BIT_KHR

```lisp
(defconstant vk_access_2_memory_read_bit_khr 8000)
```

## VK_ACCESS_2_MEMORY_WRITE_BIT

```lisp
(defconstant vk_access_2_memory_write_bit 10000)
```

## VK_ACCESS_2_MEMORY_WRITE_BIT_KHR

```lisp
(defconstant vk_access_2_memory_write_bit_khr 10000)
```

## VK_ACCESS_2_SHADER_SAMPLED_READ_BIT

```lisp
(defconstant vk_access_2_shader_sampled_read_bit 100000000)
```

## VK_ACCESS_2_SHADER_SAMPLED_READ_BIT_KHR

```lisp
(defconstant vk_access_2_shader_sampled_read_bit_khr 100000000)
```

## VK_ACCESS_2_SHADER_STORAGE_READ_BIT

```lisp
(defconstant vk_access_2_shader_storage_read_bit 200000000)
```

## VK_ACCESS_2_SHADER_STORAGE_READ_BIT_KHR

```lisp
(defconstant vk_access_2_shader_storage_read_bit_khr 200000000)
```

## VK_ACCESS_2_SHADER_STORAGE_WRITE_BIT

```lisp
(defconstant vk_access_2_shader_storage_write_bit 400000000)
```

## VK_ACCESS_2_SHADER_STORAGE_WRITE_BIT_KHR

```lisp
(defconstant vk_access_2_shader_storage_write_bit_khr 400000000)
```

## VK_ACCESS_2_VIDEO_DECODE_READ_BIT_KHR

```lisp
(defconstant vk_access_2_video_decode_read_bit_khr 800000000)
```

## VK_ACCESS_2_VIDEO_DECODE_WRITE_BIT_KHR

```lisp
(defconstant vk_access_2_video_decode_write_bit_khr 1000000000)
```

## VK_ACCESS_2_VIDEO_ENCODE_READ_BIT_KHR

```lisp
(defconstant vk_access_2_video_encode_read_bit_khr 2000000000)
```

## VK_ACCESS_2_VIDEO_ENCODE_WRITE_BIT_KHR

```lisp
(defconstant vk_access_2_video_encode_write_bit_khr 4000000000)
```

## VK_ACCESS_2_TRANSFORM_FEEDBACK_WRITE_BIT_EXT

```lisp
(defconstant vk_access_2_transform_feedback_write_bit_ext 2000000)
```

## VK_ACCESS_2_TRANSFORM_FEEDBACK_COUNTER_READ_BIT_EXT

```lisp
(defconstant vk_access_2_transform_feedback_counter_read_bit_ext 4000000)
```

## VK_ACCESS_2_TRANSFORM_FEEDBACK_COUNTER_WRITE_BIT_EXT

```lisp
(defconstant vk_access_2_transform_feedback_counter_write_bit_ext 8000000)
```

## VK_ACCESS_2_CONDITIONAL_RENDERING_READ_BIT_EXT

```lisp
(defconstant vk_access_2_conditional_rendering_read_bit_ext 100000)
```

## VK_ACCESS_2_COMMAND_PREPROCESS_READ_BIT_NV

```lisp
(defconstant vk_access_2_command_preprocess_read_bit_nv 20000)
```

## VK_ACCESS_2_COMMAND_PREPROCESS_WRITE_BIT_NV

```lisp
(defconstant vk_access_2_command_preprocess_write_bit_nv 40000)
```

## VK_ACCESS_2_FRAGMENT_SHADING_RATE_ATTACHMENT_READ_BIT_KHR

```lisp
(defconstant vk_access_2_fragment_shading_rate_attachment_read_bit_khr 800000)
```

## VK_ACCESS_2_SHADING_RATE_IMAGE_READ_BIT_NV

```lisp
(defconstant vk_access_2_shading_rate_image_read_bit_nv 800000)
```

## VK_ACCESS_2_ACCELERATION_STRUCTURE_READ_BIT_KHR

```lisp
(defconstant vk_access_2_acceleration_structure_read_bit_khr 200000)
```

## VK_ACCESS_2_ACCELERATION_STRUCTURE_WRITE_BIT_KHR

```lisp
(defconstant vk_access_2_acceleration_structure_write_bit_khr 400000)
```

## VK_ACCESS_2_ACCELERATION_STRUCTURE_READ_BIT_NV

```lisp
(defconstant vk_access_2_acceleration_structure_read_bit_nv 200000)
```

## VK_ACCESS_2_ACCELERATION_STRUCTURE_WRITE_BIT_NV

```lisp
(defconstant vk_access_2_acceleration_structure_write_bit_nv 400000)
```

## VK_ACCESS_2_FRAGMENT_DENSITY_MAP_READ_BIT_EXT

```lisp
(defconstant vk_access_2_fragment_density_map_read_bit_ext 1000000)
```

## VK_ACCESS_2_COLOR_ATTACHMENT_READ_NONCOHERENT_BIT_EXT

```lisp
(defconstant vk_access_2_color_attachment_read_noncoherent_bit_ext 80000)
```

## VK_ACCESS_2_INVOCATION_MASK_READ_BIT_HUAWEI

```lisp
(defconstant vk_access_2_invocation_mask_read_bit_huawei 8000000000)
```

## VK_ACCESS_2_SHADER_BINDING_TABLE_READ_BIT_KHR

```lisp
(defconstant vk_access_2_shader_binding_table_read_bit_khr 10000000000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_BIT

```lisp
(defconstant vk_format_feature_2_sampled_image_bit 1)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_BIT_KHR

```lisp
(defconstant vk_format_feature_2_sampled_image_bit_khr 1)
```

## VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT

```lisp
(defconstant vk_format_feature_2_storage_image_bit 2)
```

## VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT_KHR

```lisp
(defconstant vk_format_feature_2_storage_image_bit_khr 2)
```

## VK_FORMAT_FEATURE_2_STORAGE_IMAGE_ATOMIC_BIT

```lisp
(defconstant vk_format_feature_2_storage_image_atomic_bit 4)
```

## VK_FORMAT_FEATURE_2_STORAGE_IMAGE_ATOMIC_BIT_KHR

```lisp
(defconstant vk_format_feature_2_storage_image_atomic_bit_khr 4)
```

## VK_FORMAT_FEATURE_2_UNIFORM_TEXEL_BUFFER_BIT

```lisp
(defconstant vk_format_feature_2_uniform_texel_buffer_bit 8)
```

## VK_FORMAT_FEATURE_2_UNIFORM_TEXEL_BUFFER_BIT_KHR

```lisp
(defconstant vk_format_feature_2_uniform_texel_buffer_bit_khr 8)
```

## VK_FORMAT_FEATURE_2_STORAGE_TEXEL_BUFFER_BIT

```lisp
(defconstant vk_format_feature_2_storage_texel_buffer_bit 10)
```

## VK_FORMAT_FEATURE_2_STORAGE_TEXEL_BUFFER_BIT_KHR

```lisp
(defconstant vk_format_feature_2_storage_texel_buffer_bit_khr 10)
```

## VK_FORMAT_FEATURE_2_STORAGE_TEXEL_BUFFER_ATOMIC_BIT

```lisp
(defconstant vk_format_feature_2_storage_texel_buffer_atomic_bit 20)
```

## VK_FORMAT_FEATURE_2_STORAGE_TEXEL_BUFFER_ATOMIC_BIT_KHR

```lisp
(defconstant vk_format_feature_2_storage_texel_buffer_atomic_bit_khr 20)
```

## VK_FORMAT_FEATURE_2_VERTEX_BUFFER_BIT

```lisp
(defconstant vk_format_feature_2_vertex_buffer_bit 40)
```

## VK_FORMAT_FEATURE_2_VERTEX_BUFFER_BIT_KHR

```lisp
(defconstant vk_format_feature_2_vertex_buffer_bit_khr 40)
```

## VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BIT

```lisp
(defconstant vk_format_feature_2_color_attachment_bit 80)
```

## VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BIT_KHR

```lisp
(defconstant vk_format_feature_2_color_attachment_bit_khr 80)
```

## VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BLEND_BIT

```lisp
(defconstant vk_format_feature_2_color_attachment_blend_bit 100)
```

## VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BLEND_BIT_KHR

```lisp
(defconstant vk_format_feature_2_color_attachment_blend_bit_khr 100)
```

## VK_FORMAT_FEATURE_2_DEPTH_STENCIL_ATTACHMENT_BIT

```lisp
(defconstant vk_format_feature_2_depth_stencil_attachment_bit 200)
```

## VK_FORMAT_FEATURE_2_DEPTH_STENCIL_ATTACHMENT_BIT_KHR

```lisp
(defconstant vk_format_feature_2_depth_stencil_attachment_bit_khr 200)
```

## VK_FORMAT_FEATURE_2_BLIT_SRC_BIT

```lisp
(defconstant vk_format_feature_2_blit_src_bit 400)
```

## VK_FORMAT_FEATURE_2_BLIT_SRC_BIT_KHR

```lisp
(defconstant vk_format_feature_2_blit_src_bit_khr 400)
```

## VK_FORMAT_FEATURE_2_BLIT_DST_BIT

```lisp
(defconstant vk_format_feature_2_blit_dst_bit 800)
```

## VK_FORMAT_FEATURE_2_BLIT_DST_BIT_KHR

```lisp
(defconstant vk_format_feature_2_blit_dst_bit_khr 800)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_LINEAR_BIT

```lisp
(defconstant vk_format_feature_2_sampled_image_filter_linear_bit 1000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_LINEAR_BIT_KHR

```lisp
(defconstant vk_format_feature_2_sampled_image_filter_linear_bit_khr 1000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_CUBIC_BIT

```lisp
(defconstant vk_format_feature_2_sampled_image_filter_cubic_bit 2000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_CUBIC_BIT_EXT

```lisp
(defconstant vk_format_feature_2_sampled_image_filter_cubic_bit_ext 2000)
```

## VK_FORMAT_FEATURE_2_TRANSFER_SRC_BIT

```lisp
(defconstant vk_format_feature_2_transfer_src_bit 4000)
```

## VK_FORMAT_FEATURE_2_TRANSFER_SRC_BIT_KHR

```lisp
(defconstant vk_format_feature_2_transfer_src_bit_khr 4000)
```

## VK_FORMAT_FEATURE_2_TRANSFER_DST_BIT

```lisp
(defconstant vk_format_feature_2_transfer_dst_bit 8000)
```

## VK_FORMAT_FEATURE_2_TRANSFER_DST_BIT_KHR

```lisp
(defconstant vk_format_feature_2_transfer_dst_bit_khr 8000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_MINMAX_BIT

```lisp
(defconstant vk_format_feature_2_sampled_image_filter_minmax_bit 10000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_MINMAX_BIT_KHR

```lisp
(defconstant vk_format_feature_2_sampled_image_filter_minmax_bit_khr 10000)
```

## VK_FORMAT_FEATURE_2_MIDPOINT_CHROMA_SAMPLES_BIT

```lisp
(defconstant vk_format_feature_2_midpoint_chroma_samples_bit 20000)
```

## VK_FORMAT_FEATURE_2_MIDPOINT_CHROMA_SAMPLES_BIT_KHR

```lisp
(defconstant vk_format_feature_2_midpoint_chroma_samples_bit_khr 20000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT

```lisp
(defconstant vk_format_feature_2_sampled_image_ycbcr_conversion_linear_filter_bit 40000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT_KHR

```lisp
(defconstant vk_format_feature_2_sampled_image_ycbcr_conversion_linear_filter_bit_khr 40000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT

```lisp
(defconstant vk_format_feature_2_sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit 80000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT_KHR

```lisp
(defconstant vk_format_feature_2_sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit_khr 80000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT

```lisp
(defconstant vk_format_feature_2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit 100000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT_KHR

```lisp
(defconstant vk_format_feature_2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit_khr 100000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT

```lisp
(defconstant vk_format_feature_2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit 200000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT_KHR

```lisp
(defconstant vk_format_feature_2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit_khr 200000)
```

## VK_FORMAT_FEATURE_2_DISJOINT_BIT

```lisp
(defconstant vk_format_feature_2_disjoint_bit 400000)
```

## VK_FORMAT_FEATURE_2_DISJOINT_BIT_KHR

```lisp
(defconstant vk_format_feature_2_disjoint_bit_khr 400000)
```

## VK_FORMAT_FEATURE_2_COSITED_CHROMA_SAMPLES_BIT

```lisp
(defconstant vk_format_feature_2_cosited_chroma_samples_bit 800000)
```

## VK_FORMAT_FEATURE_2_COSITED_CHROMA_SAMPLES_BIT_KHR

```lisp
(defconstant vk_format_feature_2_cosited_chroma_samples_bit_khr 800000)
```

## VK_FORMAT_FEATURE_2_STORAGE_READ_WITHOUT_FORMAT_BIT

```lisp
(defconstant vk_format_feature_2_storage_read_without_format_bit 80000000)
```

## VK_FORMAT_FEATURE_2_STORAGE_READ_WITHOUT_FORMAT_BIT_KHR

```lisp
(defconstant vk_format_feature_2_storage_read_without_format_bit_khr 80000000)
```

## VK_FORMAT_FEATURE_2_STORAGE_WRITE_WITHOUT_FORMAT_BIT

```lisp
(defconstant vk_format_feature_2_storage_write_without_format_bit 100000000)
```

## VK_FORMAT_FEATURE_2_STORAGE_WRITE_WITHOUT_FORMAT_BIT_KHR

```lisp
(defconstant vk_format_feature_2_storage_write_without_format_bit_khr 100000000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_DEPTH_COMPARISON_BIT

```lisp
(defconstant vk_format_feature_2_sampled_image_depth_comparison_bit 200000000)
```

## VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_DEPTH_COMPARISON_BIT_KHR

```lisp
(defconstant vk_format_feature_2_sampled_image_depth_comparison_bit_khr 200000000)
```

## VK_FORMAT_FEATURE_2_VIDEO_DECODE_OUTPUT_BIT_KHR

```lisp
(defconstant vk_format_feature_2_video_decode_output_bit_khr 2000000)
```

## VK_FORMAT_FEATURE_2_VIDEO_DECODE_DPB_BIT_KHR

```lisp
(defconstant vk_format_feature_2_video_decode_dpb_bit_khr 4000000)
```

## VK_FORMAT_FEATURE_2_ACCELERATION_STRUCTURE_VERTEX_BUFFER_BIT_KHR

```lisp
(defconstant vk_format_feature_2_acceleration_structure_vertex_buffer_bit_khr 20000000)
```

## VK_FORMAT_FEATURE_2_FRAGMENT_DENSITY_MAP_BIT_EXT

```lisp
(defconstant vk_format_feature_2_fragment_density_map_bit_ext 1000000)
```

## VK_FORMAT_FEATURE_2_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR

```lisp
(defconstant vk_format_feature_2_fragment_shading_rate_attachment_bit_khr 40000000)
```

## VK_FORMAT_FEATURE_2_VIDEO_ENCODE_INPUT_BIT_KHR

```lisp
(defconstant vk_format_feature_2_video_encode_input_bit_khr 8000000)
```

## VK_FORMAT_FEATURE_2_VIDEO_ENCODE_DPB_BIT_KHR

```lisp
(defconstant vk_format_feature_2_video_encode_dpb_bit_khr 10000000)
```

## VK_FORMAT_FEATURE_2_LINEAR_COLOR_ATTACHMENT_BIT_NV

```lisp
(defconstant vk_format_feature_2_linear_color_attachment_bit_nv 4000000000)
```

## VK_KHR_surface

```lisp
(defconstant vk_khr_surface 1)
```

## VK_KHR_SURFACE_SPEC_VERSION

```lisp
(defconstant vk_khr_surface_spec_version 25)
```

## VK_KHR_SURFACE_EXTENSION_NAME

```lisp
(defconstant vk_khr_surface_extension_name VK_KHR_surface)
```

## VK_KHR_swapchain

```lisp
(defconstant vk_khr_swapchain 1)
```

## VK_KHR_SWAPCHAIN_SPEC_VERSION

```lisp
(defconstant vk_khr_swapchain_spec_version 70)
```

## VK_KHR_SWAPCHAIN_EXTENSION_NAME

```lisp
(defconstant vk_khr_swapchain_extension_name VK_KHR_swapchain)
```

## VK_KHR_display

```lisp
(defconstant vk_khr_display 1)
```

## VK_KHR_DISPLAY_SPEC_VERSION

```lisp
(defconstant vk_khr_display_spec_version 23)
```

## VK_KHR_DISPLAY_EXTENSION_NAME

```lisp
(defconstant vk_khr_display_extension_name VK_KHR_display)
```

## VK_KHR_display_swapchain

```lisp
(defconstant vk_khr_display_swapchain 1)
```

## VK_KHR_DISPLAY_SWAPCHAIN_SPEC_VERSION

```lisp
(defconstant vk_khr_display_swapchain_spec_version 10)
```

## VK_KHR_DISPLAY_SWAPCHAIN_EXTENSION_NAME

```lisp
(defconstant vk_khr_display_swapchain_extension_name VK_KHR_display_swapchain)
```

## VK_KHR_sampler_mirror_clamp_to_edge

```lisp
(defconstant vk_khr_sampler_mirror_clamp_to_edge 1)
```

## VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_SPEC_VERSION

```lisp
(defconstant vk_khr_sampler_mirror_clamp_to_edge_spec_version 3)
```

## VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_EXTENSION_NAME

```lisp
(defconstant vk_khr_sampler_mirror_clamp_to_edge_extension_name VK_KHR_sampler_mirror_clamp_to_edge)
```

## VK_KHR_dynamic_rendering

```lisp
(defconstant vk_khr_dynamic_rendering 1)
```

## VK_KHR_DYNAMIC_RENDERING_SPEC_VERSION

```lisp
(defconstant vk_khr_dynamic_rendering_spec_version 1)
```

## VK_KHR_DYNAMIC_RENDERING_EXTENSION_NAME

```lisp
(defconstant vk_khr_dynamic_rendering_extension_name VK_KHR_dynamic_rendering)
```

## VK_KHR_multiview

```lisp
(defconstant vk_khr_multiview 1)
```

## VK_KHR_MULTIVIEW_SPEC_VERSION

```lisp
(defconstant vk_khr_multiview_spec_version 1)
```

## VK_KHR_MULTIVIEW_EXTENSION_NAME

```lisp
(defconstant vk_khr_multiview_extension_name VK_KHR_multiview)
```

## VK_KHR_get_physical_device_properties2

```lisp
(defconstant vk_khr_get_physical_device_properties2 1)
```

## VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_SPEC_VERSION

```lisp
(defconstant vk_khr_get_physical_device_properties_2_spec_version 2)
```

## VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME

```lisp
(defconstant vk_khr_get_physical_device_properties_2_extension_name VK_KHR_get_physical_device_properties2)
```

## VK_KHR_device_group

```lisp
(defconstant vk_khr_device_group 1)
```

## VK_KHR_DEVICE_GROUP_SPEC_VERSION

```lisp
(defconstant vk_khr_device_group_spec_version 4)
```

## VK_KHR_DEVICE_GROUP_EXTENSION_NAME

```lisp
(defconstant vk_khr_device_group_extension_name VK_KHR_device_group)
```

## VK_KHR_shader_draw_parameters

```lisp
(defconstant vk_khr_shader_draw_parameters 1)
```

## VK_KHR_SHADER_DRAW_PARAMETERS_SPEC_VERSION

```lisp
(defconstant vk_khr_shader_draw_parameters_spec_version 1)
```

## VK_KHR_SHADER_DRAW_PARAMETERS_EXTENSION_NAME

```lisp
(defconstant vk_khr_shader_draw_parameters_extension_name VK_KHR_shader_draw_parameters)
```

## VK_KHR_maintenance1

```lisp
(defconstant vk_khr_maintenance1 1)
```

## VK_KHR_MAINTENANCE_1_SPEC_VERSION

```lisp
(defconstant vk_khr_maintenance_1_spec_version 2)
```

## VK_KHR_MAINTENANCE_1_EXTENSION_NAME

```lisp
(defconstant vk_khr_maintenance_1_extension_name VK_KHR_maintenance1)
```

## VK_KHR_MAINTENANCE1_SPEC_VERSION

```lisp
(defconstant vk_khr_maintenance1_spec_version VK_KHR_MAINTENANCE_1_SPEC_VERSION)
```

## VK_KHR_MAINTENANCE1_EXTENSION_NAME

```lisp
(defconstant vk_khr_maintenance1_extension_name VK_KHR_MAINTENANCE_1_EXTENSION_NAME)
```

## VK_KHR_device_group_creation

```lisp
(defconstant vk_khr_device_group_creation 1)
```

## VK_KHR_DEVICE_GROUP_CREATION_SPEC_VERSION

```lisp
(defconstant vk_khr_device_group_creation_spec_version 1)
```

## VK_KHR_DEVICE_GROUP_CREATION_EXTENSION_NAME

```lisp
(defconstant vk_khr_device_group_creation_extension_name VK_KHR_device_group_creation)
```

## VK_MAX_DEVICE_GROUP_SIZE_KHR

```lisp
(defconstant vk_max_device_group_size_khr VK_MAX_DEVICE_GROUP_SIZE)
```

## VK_KHR_external_memory_capabilities

```lisp
(defconstant vk_khr_external_memory_capabilities 1)
```

## VK_KHR_EXTERNAL_MEMORY_CAPABILITIES_SPEC_VERSION

```lisp
(defconstant vk_khr_external_memory_capabilities_spec_version 1)
```

## VK_KHR_EXTERNAL_MEMORY_CAPABILITIES_EXTENSION_NAME

```lisp
(defconstant vk_khr_external_memory_capabilities_extension_name VK_KHR_external_memory_capabilities)
```

## VK_LUID_SIZE_KHR

```lisp
(defconstant vk_luid_size_khr VK_LUID_SIZE)
```

## VK_KHR_external_memory

```lisp
(defconstant vk_khr_external_memory 1)
```

## VK_KHR_EXTERNAL_MEMORY_SPEC_VERSION

```lisp
(defconstant vk_khr_external_memory_spec_version 1)
```

## VK_KHR_EXTERNAL_MEMORY_EXTENSION_NAME

```lisp
(defconstant vk_khr_external_memory_extension_name VK_KHR_external_memory)
```

## VK_QUEUE_FAMILY_EXTERNAL_KHR

```lisp
(defconstant vk_queue_family_external_khr VK_QUEUE_FAMILY_EXTERNAL)
```

## VK_KHR_external_memory_fd

```lisp
(defconstant vk_khr_external_memory_fd 1)
```

## VK_KHR_EXTERNAL_MEMORY_FD_SPEC_VERSION

```lisp
(defconstant vk_khr_external_memory_fd_spec_version 1)
```

## VK_KHR_EXTERNAL_MEMORY_FD_EXTENSION_NAME

```lisp
(defconstant vk_khr_external_memory_fd_extension_name VK_KHR_external_memory_fd)
```

## VK_KHR_external_semaphore_capabilities

```lisp
(defconstant vk_khr_external_semaphore_capabilities 1)
```

## VK_KHR_EXTERNAL_SEMAPHORE_CAPABILITIES_SPEC_VERSION

```lisp
(defconstant vk_khr_external_semaphore_capabilities_spec_version 1)
```

## VK_KHR_EXTERNAL_SEMAPHORE_CAPABILITIES_EXTENSION_NAME

```lisp
(defconstant vk_khr_external_semaphore_capabilities_extension_name VK_KHR_external_semaphore_capabilities)
```

## VK_KHR_external_semaphore

```lisp
(defconstant vk_khr_external_semaphore 1)
```

## VK_KHR_EXTERNAL_SEMAPHORE_SPEC_VERSION

```lisp
(defconstant vk_khr_external_semaphore_spec_version 1)
```

## VK_KHR_EXTERNAL_SEMAPHORE_EXTENSION_NAME

```lisp
(defconstant vk_khr_external_semaphore_extension_name VK_KHR_external_semaphore)
```

## VK_KHR_external_semaphore_fd

```lisp
(defconstant vk_khr_external_semaphore_fd 1)
```

## VK_KHR_EXTERNAL_SEMAPHORE_FD_SPEC_VERSION

```lisp
(defconstant vk_khr_external_semaphore_fd_spec_version 1)
```

## VK_KHR_EXTERNAL_SEMAPHORE_FD_EXTENSION_NAME

```lisp
(defconstant vk_khr_external_semaphore_fd_extension_name VK_KHR_external_semaphore_fd)
```

## VK_KHR_push_descriptor

```lisp
(defconstant vk_khr_push_descriptor 1)
```

## VK_KHR_PUSH_DESCRIPTOR_SPEC_VERSION

```lisp
(defconstant vk_khr_push_descriptor_spec_version 2)
```

## VK_KHR_PUSH_DESCRIPTOR_EXTENSION_NAME

```lisp
(defconstant vk_khr_push_descriptor_extension_name VK_KHR_push_descriptor)
```

## VK_KHR_shader_float16_int8

```lisp
(defconstant vk_khr_shader_float16_int8 1)
```

## VK_KHR_SHADER_FLOAT16_INT8_SPEC_VERSION

```lisp
(defconstant vk_khr_shader_float16_int8_spec_version 1)
```

## VK_KHR_SHADER_FLOAT16_INT8_EXTENSION_NAME

```lisp
(defconstant vk_khr_shader_float16_int8_extension_name VK_KHR_shader_float16_int8)
```

## VK_KHR_16bit_storage

```lisp
(defconstant vk_khr_16bit_storage 1)
```

## VK_KHR_16BIT_STORAGE_SPEC_VERSION

```lisp
(defconstant vk_khr_16bit_storage_spec_version 1)
```

## VK_KHR_16BIT_STORAGE_EXTENSION_NAME

```lisp
(defconstant vk_khr_16bit_storage_extension_name VK_KHR_16bit_storage)
```

## VK_KHR_incremental_present

```lisp
(defconstant vk_khr_incremental_present 1)
```

## VK_KHR_INCREMENTAL_PRESENT_SPEC_VERSION

```lisp
(defconstant vk_khr_incremental_present_spec_version 2)
```

## VK_KHR_INCREMENTAL_PRESENT_EXTENSION_NAME

```lisp
(defconstant vk_khr_incremental_present_extension_name VK_KHR_incremental_present)
```

## VK_KHR_descriptor_update_template

```lisp
(defconstant vk_khr_descriptor_update_template 1)
```

## VK_KHR_DESCRIPTOR_UPDATE_TEMPLATE_SPEC_VERSION

```lisp
(defconstant vk_khr_descriptor_update_template_spec_version 1)
```

## VK_KHR_DESCRIPTOR_UPDATE_TEMPLATE_EXTENSION_NAME

```lisp
(defconstant vk_khr_descriptor_update_template_extension_name VK_KHR_descriptor_update_template)
```

## VK_KHR_imageless_framebuffer

```lisp
(defconstant vk_khr_imageless_framebuffer 1)
```

## VK_KHR_IMAGELESS_FRAMEBUFFER_SPEC_VERSION

```lisp
(defconstant vk_khr_imageless_framebuffer_spec_version 1)
```

## VK_KHR_IMAGELESS_FRAMEBUFFER_EXTENSION_NAME

```lisp
(defconstant vk_khr_imageless_framebuffer_extension_name VK_KHR_imageless_framebuffer)
```

## VK_KHR_create_renderpass2

```lisp
(defconstant vk_khr_create_renderpass2 1)
```

## VK_KHR_CREATE_RENDERPASS_2_SPEC_VERSION

```lisp
(defconstant vk_khr_create_renderpass_2_spec_version 1)
```

## VK_KHR_CREATE_RENDERPASS_2_EXTENSION_NAME

```lisp
(defconstant vk_khr_create_renderpass_2_extension_name VK_KHR_create_renderpass2)
```

## VK_KHR_shared_presentable_image

```lisp
(defconstant vk_khr_shared_presentable_image 1)
```

## VK_KHR_SHARED_PRESENTABLE_IMAGE_SPEC_VERSION

```lisp
(defconstant vk_khr_shared_presentable_image_spec_version 1)
```

## VK_KHR_SHARED_PRESENTABLE_IMAGE_EXTENSION_NAME

```lisp
(defconstant vk_khr_shared_presentable_image_extension_name VK_KHR_shared_presentable_image)
```

## VK_KHR_external_fence_capabilities

```lisp
(defconstant vk_khr_external_fence_capabilities 1)
```

## VK_KHR_EXTERNAL_FENCE_CAPABILITIES_SPEC_VERSION

```lisp
(defconstant vk_khr_external_fence_capabilities_spec_version 1)
```

## VK_KHR_EXTERNAL_FENCE_CAPABILITIES_EXTENSION_NAME

```lisp
(defconstant vk_khr_external_fence_capabilities_extension_name VK_KHR_external_fence_capabilities)
```

## VK_KHR_external_fence

```lisp
(defconstant vk_khr_external_fence 1)
```

## VK_KHR_EXTERNAL_FENCE_SPEC_VERSION

```lisp
(defconstant vk_khr_external_fence_spec_version 1)
```

## VK_KHR_EXTERNAL_FENCE_EXTENSION_NAME

```lisp
(defconstant vk_khr_external_fence_extension_name VK_KHR_external_fence)
```

## VK_KHR_external_fence_fd

```lisp
(defconstant vk_khr_external_fence_fd 1)
```

## VK_KHR_EXTERNAL_FENCE_FD_SPEC_VERSION

```lisp
(defconstant vk_khr_external_fence_fd_spec_version 1)
```

## VK_KHR_EXTERNAL_FENCE_FD_EXTENSION_NAME

```lisp
(defconstant vk_khr_external_fence_fd_extension_name VK_KHR_external_fence_fd)
```

## VK_KHR_performance_query

```lisp
(defconstant vk_khr_performance_query 1)
```

## VK_KHR_PERFORMANCE_QUERY_SPEC_VERSION

```lisp
(defconstant vk_khr_performance_query_spec_version 1)
```

## VK_KHR_PERFORMANCE_QUERY_EXTENSION_NAME

```lisp
(defconstant vk_khr_performance_query_extension_name VK_KHR_performance_query)
```

## VK_KHR_maintenance2

```lisp
(defconstant vk_khr_maintenance2 1)
```

## VK_KHR_MAINTENANCE_2_SPEC_VERSION

```lisp
(defconstant vk_khr_maintenance_2_spec_version 1)
```

## VK_KHR_MAINTENANCE_2_EXTENSION_NAME

```lisp
(defconstant vk_khr_maintenance_2_extension_name VK_KHR_maintenance2)
```

## VK_KHR_MAINTENANCE2_SPEC_VERSION

```lisp
(defconstant vk_khr_maintenance2_spec_version VK_KHR_MAINTENANCE_2_SPEC_VERSION)
```

## VK_KHR_MAINTENANCE2_EXTENSION_NAME

```lisp
(defconstant vk_khr_maintenance2_extension_name VK_KHR_MAINTENANCE_2_EXTENSION_NAME)
```

## VK_KHR_get_surface_capabilities2

```lisp
(defconstant vk_khr_get_surface_capabilities2 1)
```

## VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION

```lisp
(defconstant vk_khr_get_surface_capabilities_2_spec_version 1)
```

## VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME

```lisp
(defconstant vk_khr_get_surface_capabilities_2_extension_name VK_KHR_get_surface_capabilities2)
```

## VK_KHR_variable_pointers

```lisp
(defconstant vk_khr_variable_pointers 1)
```

## VK_KHR_VARIABLE_POINTERS_SPEC_VERSION

```lisp
(defconstant vk_khr_variable_pointers_spec_version 1)
```

## VK_KHR_VARIABLE_POINTERS_EXTENSION_NAME

```lisp
(defconstant vk_khr_variable_pointers_extension_name VK_KHR_variable_pointers)
```

## VK_KHR_get_display_properties2

```lisp
(defconstant vk_khr_get_display_properties2 1)
```

## VK_KHR_GET_DISPLAY_PROPERTIES_2_SPEC_VERSION

```lisp
(defconstant vk_khr_get_display_properties_2_spec_version 1)
```

## VK_KHR_GET_DISPLAY_PROPERTIES_2_EXTENSION_NAME

```lisp
(defconstant vk_khr_get_display_properties_2_extension_name VK_KHR_get_display_properties2)
```

## VK_KHR_dedicated_allocation

```lisp
(defconstant vk_khr_dedicated_allocation 1)
```

## VK_KHR_DEDICATED_ALLOCATION_SPEC_VERSION

```lisp
(defconstant vk_khr_dedicated_allocation_spec_version 3)
```

## VK_KHR_DEDICATED_ALLOCATION_EXTENSION_NAME

```lisp
(defconstant vk_khr_dedicated_allocation_extension_name VK_KHR_dedicated_allocation)
```

## VK_KHR_storage_buffer_storage_class

```lisp
(defconstant vk_khr_storage_buffer_storage_class 1)
```

## VK_KHR_STORAGE_BUFFER_STORAGE_CLASS_SPEC_VERSION

```lisp
(defconstant vk_khr_storage_buffer_storage_class_spec_version 1)
```

## VK_KHR_STORAGE_BUFFER_STORAGE_CLASS_EXTENSION_NAME

```lisp
(defconstant vk_khr_storage_buffer_storage_class_extension_name VK_KHR_storage_buffer_storage_class)
```

## VK_KHR_relaxed_block_layout

```lisp
(defconstant vk_khr_relaxed_block_layout 1)
```

## VK_KHR_RELAXED_BLOCK_LAYOUT_SPEC_VERSION

```lisp
(defconstant vk_khr_relaxed_block_layout_spec_version 1)
```

## VK_KHR_RELAXED_BLOCK_LAYOUT_EXTENSION_NAME

```lisp
(defconstant vk_khr_relaxed_block_layout_extension_name VK_KHR_relaxed_block_layout)
```

## VK_KHR_get_memory_requirements2

```lisp
(defconstant vk_khr_get_memory_requirements2 1)
```

## VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION

```lisp
(defconstant vk_khr_get_memory_requirements_2_spec_version 1)
```

## VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME

```lisp
(defconstant vk_khr_get_memory_requirements_2_extension_name VK_KHR_get_memory_requirements2)
```

## VK_KHR_image_format_list

```lisp
(defconstant vk_khr_image_format_list 1)
```

## VK_KHR_IMAGE_FORMAT_LIST_SPEC_VERSION

```lisp
(defconstant vk_khr_image_format_list_spec_version 1)
```

## VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME

```lisp
(defconstant vk_khr_image_format_list_extension_name VK_KHR_image_format_list)
```

## VK_KHR_sampler_ycbcr_conversion

```lisp
(defconstant vk_khr_sampler_ycbcr_conversion 1)
```

## VK_KHR_SAMPLER_YCBCR_CONVERSION_SPEC_VERSION

```lisp
(defconstant vk_khr_sampler_ycbcr_conversion_spec_version 14)
```

## VK_KHR_SAMPLER_YCBCR_CONVERSION_EXTENSION_NAME

```lisp
(defconstant vk_khr_sampler_ycbcr_conversion_extension_name VK_KHR_sampler_ycbcr_conversion)
```

## VK_KHR_bind_memory2

```lisp
(defconstant vk_khr_bind_memory2 1)
```

## VK_KHR_BIND_MEMORY_2_SPEC_VERSION

```lisp
(defconstant vk_khr_bind_memory_2_spec_version 1)
```

## VK_KHR_BIND_MEMORY_2_EXTENSION_NAME

```lisp
(defconstant vk_khr_bind_memory_2_extension_name VK_KHR_bind_memory2)
```

## VK_KHR_maintenance3

```lisp
(defconstant vk_khr_maintenance3 1)
```

## VK_KHR_MAINTENANCE_3_SPEC_VERSION

```lisp
(defconstant vk_khr_maintenance_3_spec_version 1)
```

## VK_KHR_MAINTENANCE_3_EXTENSION_NAME

```lisp
(defconstant vk_khr_maintenance_3_extension_name VK_KHR_maintenance3)
```

## VK_KHR_MAINTENANCE3_SPEC_VERSION

```lisp
(defconstant vk_khr_maintenance3_spec_version VK_KHR_MAINTENANCE_3_SPEC_VERSION)
```

## VK_KHR_MAINTENANCE3_EXTENSION_NAME

```lisp
(defconstant vk_khr_maintenance3_extension_name VK_KHR_MAINTENANCE_3_EXTENSION_NAME)
```

## VK_KHR_draw_indirect_count

```lisp
(defconstant vk_khr_draw_indirect_count 1)
```

## VK_KHR_DRAW_INDIRECT_COUNT_SPEC_VERSION

```lisp
(defconstant vk_khr_draw_indirect_count_spec_version 1)
```

## VK_KHR_DRAW_INDIRECT_COUNT_EXTENSION_NAME

```lisp
(defconstant vk_khr_draw_indirect_count_extension_name VK_KHR_draw_indirect_count)
```

## VK_KHR_shader_subgroup_extended_types

```lisp
(defconstant vk_khr_shader_subgroup_extended_types 1)
```

## VK_KHR_SHADER_SUBGROUP_EXTENDED_TYPES_SPEC_VERSION

```lisp
(defconstant vk_khr_shader_subgroup_extended_types_spec_version 1)
```

## VK_KHR_SHADER_SUBGROUP_EXTENDED_TYPES_EXTENSION_NAME

```lisp
(defconstant vk_khr_shader_subgroup_extended_types_extension_name VK_KHR_shader_subgroup_extended_types)
```

## VK_KHR_8bit_storage

```lisp
(defconstant vk_khr_8bit_storage 1)
```

## VK_KHR_8BIT_STORAGE_SPEC_VERSION

```lisp
(defconstant vk_khr_8bit_storage_spec_version 1)
```

## VK_KHR_8BIT_STORAGE_EXTENSION_NAME

```lisp
(defconstant vk_khr_8bit_storage_extension_name VK_KHR_8bit_storage)
```

## VK_KHR_shader_atomic_int64

```lisp
(defconstant vk_khr_shader_atomic_int64 1)
```

## VK_KHR_SHADER_ATOMIC_INT64_SPEC_VERSION

```lisp
(defconstant vk_khr_shader_atomic_int64_spec_version 1)
```

## VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME

```lisp
(defconstant vk_khr_shader_atomic_int64_extension_name VK_KHR_shader_atomic_int64)
```

## VK_KHR_shader_clock

```lisp
(defconstant vk_khr_shader_clock 1)
```

## VK_KHR_SHADER_CLOCK_SPEC_VERSION

```lisp
(defconstant vk_khr_shader_clock_spec_version 1)
```

## VK_KHR_SHADER_CLOCK_EXTENSION_NAME

```lisp
(defconstant vk_khr_shader_clock_extension_name VK_KHR_shader_clock)
```

## VK_KHR_global_priority

```lisp
(defconstant vk_khr_global_priority 1)
```

## VK_MAX_GLOBAL_PRIORITY_SIZE_KHR

```lisp
(defconstant vk_max_global_priority_size_khr 16)
```

## VK_KHR_GLOBAL_PRIORITY_SPEC_VERSION

```lisp
(defconstant vk_khr_global_priority_spec_version 1)
```

## VK_KHR_GLOBAL_PRIORITY_EXTENSION_NAME

```lisp
(defconstant vk_khr_global_priority_extension_name VK_KHR_global_priority)
```

## VK_KHR_driver_properties

```lisp
(defconstant vk_khr_driver_properties 1)
```

## VK_KHR_DRIVER_PROPERTIES_SPEC_VERSION

```lisp
(defconstant vk_khr_driver_properties_spec_version 1)
```

## VK_KHR_DRIVER_PROPERTIES_EXTENSION_NAME

```lisp
(defconstant vk_khr_driver_properties_extension_name VK_KHR_driver_properties)
```

## VK_MAX_DRIVER_NAME_SIZE_KHR

```lisp
(defconstant vk_max_driver_name_size_khr VK_MAX_DRIVER_NAME_SIZE)
```

## VK_MAX_DRIVER_INFO_SIZE_KHR

```lisp
(defconstant vk_max_driver_info_size_khr VK_MAX_DRIVER_INFO_SIZE)
```

## VK_KHR_shader_float_controls

```lisp
(defconstant vk_khr_shader_float_controls 1)
```

## VK_KHR_SHADER_FLOAT_CONTROLS_SPEC_VERSION

```lisp
(defconstant vk_khr_shader_float_controls_spec_version 4)
```

## VK_KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME

```lisp
(defconstant vk_khr_shader_float_controls_extension_name VK_KHR_shader_float_controls)
```

## VK_KHR_depth_stencil_resolve

```lisp
(defconstant vk_khr_depth_stencil_resolve 1)
```

## VK_KHR_DEPTH_STENCIL_RESOLVE_SPEC_VERSION

```lisp
(defconstant vk_khr_depth_stencil_resolve_spec_version 1)
```

## VK_KHR_DEPTH_STENCIL_RESOLVE_EXTENSION_NAME

```lisp
(defconstant vk_khr_depth_stencil_resolve_extension_name VK_KHR_depth_stencil_resolve)
```

## VK_KHR_swapchain_mutable_format

```lisp
(defconstant vk_khr_swapchain_mutable_format 1)
```

## VK_KHR_SWAPCHAIN_MUTABLE_FORMAT_SPEC_VERSION

```lisp
(defconstant vk_khr_swapchain_mutable_format_spec_version 1)
```

## VK_KHR_SWAPCHAIN_MUTABLE_FORMAT_EXTENSION_NAME

```lisp
(defconstant vk_khr_swapchain_mutable_format_extension_name VK_KHR_swapchain_mutable_format)
```

## VK_KHR_timeline_semaphore

```lisp
(defconstant vk_khr_timeline_semaphore 1)
```

## VK_KHR_TIMELINE_SEMAPHORE_SPEC_VERSION

```lisp
(defconstant vk_khr_timeline_semaphore_spec_version 2)
```

## VK_KHR_TIMELINE_SEMAPHORE_EXTENSION_NAME

```lisp
(defconstant vk_khr_timeline_semaphore_extension_name VK_KHR_timeline_semaphore)
```

## VK_KHR_vulkan_memory_model

```lisp
(defconstant vk_khr_vulkan_memory_model 1)
```

## VK_KHR_VULKAN_MEMORY_MODEL_SPEC_VERSION

```lisp
(defconstant vk_khr_vulkan_memory_model_spec_version 3)
```

## VK_KHR_VULKAN_MEMORY_MODEL_EXTENSION_NAME

```lisp
(defconstant vk_khr_vulkan_memory_model_extension_name VK_KHR_vulkan_memory_model)
```

## VK_KHR_shader_terminate_invocation

```lisp
(defconstant vk_khr_shader_terminate_invocation 1)
```

## VK_KHR_SHADER_TERMINATE_INVOCATION_SPEC_VERSION

```lisp
(defconstant vk_khr_shader_terminate_invocation_spec_version 1)
```

## VK_KHR_SHADER_TERMINATE_INVOCATION_EXTENSION_NAME

```lisp
(defconstant vk_khr_shader_terminate_invocation_extension_name VK_KHR_shader_terminate_invocation)
```

## VK_KHR_fragment_shading_rate

```lisp
(defconstant vk_khr_fragment_shading_rate 1)
```

## VK_KHR_FRAGMENT_SHADING_RATE_SPEC_VERSION

```lisp
(defconstant vk_khr_fragment_shading_rate_spec_version 2)
```

## VK_KHR_FRAGMENT_SHADING_RATE_EXTENSION_NAME

```lisp
(defconstant vk_khr_fragment_shading_rate_extension_name VK_KHR_fragment_shading_rate)
```

## VK_KHR_spirv_1_4

```lisp
(defconstant vk_khr_spirv_1_4 1)
```

## VK_KHR_SPIRV_1_4_SPEC_VERSION

```lisp
(defconstant vk_khr_spirv_1_4_spec_version 1)
```

## VK_KHR_SPIRV_1_4_EXTENSION_NAME

```lisp
(defconstant vk_khr_spirv_1_4_extension_name VK_KHR_spirv_1_4)
```

## VK_KHR_surface_protected_capabilities

```lisp
(defconstant vk_khr_surface_protected_capabilities 1)
```

## VK_KHR_SURFACE_PROTECTED_CAPABILITIES_SPEC_VERSION

```lisp
(defconstant vk_khr_surface_protected_capabilities_spec_version 1)
```

## VK_KHR_SURFACE_PROTECTED_CAPABILITIES_EXTENSION_NAME

```lisp
(defconstant vk_khr_surface_protected_capabilities_extension_name VK_KHR_surface_protected_capabilities)
```

## VK_KHR_separate_depth_stencil_layouts

```lisp
(defconstant vk_khr_separate_depth_stencil_layouts 1)
```

## VK_KHR_SEPARATE_DEPTH_STENCIL_LAYOUTS_SPEC_VERSION

```lisp
(defconstant vk_khr_separate_depth_stencil_layouts_spec_version 1)
```

## VK_KHR_SEPARATE_DEPTH_STENCIL_LAYOUTS_EXTENSION_NAME

```lisp
(defconstant vk_khr_separate_depth_stencil_layouts_extension_name VK_KHR_separate_depth_stencil_layouts)
```

## VK_KHR_present_wait

```lisp
(defconstant vk_khr_present_wait 1)
```

## VK_KHR_PRESENT_WAIT_SPEC_VERSION

```lisp
(defconstant vk_khr_present_wait_spec_version 1)
```

## VK_KHR_PRESENT_WAIT_EXTENSION_NAME

```lisp
(defconstant vk_khr_present_wait_extension_name VK_KHR_present_wait)
```

## VK_KHR_uniform_buffer_standard_layout

```lisp
(defconstant vk_khr_uniform_buffer_standard_layout 1)
```

## VK_KHR_UNIFORM_BUFFER_STANDARD_LAYOUT_SPEC_VERSION

```lisp
(defconstant vk_khr_uniform_buffer_standard_layout_spec_version 1)
```

## VK_KHR_UNIFORM_BUFFER_STANDARD_LAYOUT_EXTENSION_NAME

```lisp
(defconstant vk_khr_uniform_buffer_standard_layout_extension_name VK_KHR_uniform_buffer_standard_layout)
```

## VK_KHR_buffer_device_address

```lisp
(defconstant vk_khr_buffer_device_address 1)
```

## VK_KHR_BUFFER_DEVICE_ADDRESS_SPEC_VERSION

```lisp
(defconstant vk_khr_buffer_device_address_spec_version 1)
```

## VK_KHR_BUFFER_DEVICE_ADDRESS_EXTENSION_NAME

```lisp
(defconstant vk_khr_buffer_device_address_extension_name VK_KHR_buffer_device_address)
```

## VK_KHR_deferred_host_operations

```lisp
(defconstant vk_khr_deferred_host_operations 1)
```

## VK_KHR_DEFERRED_HOST_OPERATIONS_SPEC_VERSION

```lisp
(defconstant vk_khr_deferred_host_operations_spec_version 4)
```

## VK_KHR_DEFERRED_HOST_OPERATIONS_EXTENSION_NAME

```lisp
(defconstant vk_khr_deferred_host_operations_extension_name VK_KHR_deferred_host_operations)
```

## VK_KHR_pipeline_executable_properties

```lisp
(defconstant vk_khr_pipeline_executable_properties 1)
```

## VK_KHR_PIPELINE_EXECUTABLE_PROPERTIES_SPEC_VERSION

```lisp
(defconstant vk_khr_pipeline_executable_properties_spec_version 1)
```

## VK_KHR_PIPELINE_EXECUTABLE_PROPERTIES_EXTENSION_NAME

```lisp
(defconstant vk_khr_pipeline_executable_properties_extension_name VK_KHR_pipeline_executable_properties)
```

## VK_KHR_shader_integer_dot_product

```lisp
(defconstant vk_khr_shader_integer_dot_product 1)
```

## VK_KHR_SHADER_INTEGER_DOT_PRODUCT_SPEC_VERSION

```lisp
(defconstant vk_khr_shader_integer_dot_product_spec_version 1)
```

## VK_KHR_SHADER_INTEGER_DOT_PRODUCT_EXTENSION_NAME

```lisp
(defconstant vk_khr_shader_integer_dot_product_extension_name VK_KHR_shader_integer_dot_product)
```

## VK_KHR_pipeline_library

```lisp
(defconstant vk_khr_pipeline_library 1)
```

## VK_KHR_PIPELINE_LIBRARY_SPEC_VERSION

```lisp
(defconstant vk_khr_pipeline_library_spec_version 1)
```

## VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME

```lisp
(defconstant vk_khr_pipeline_library_extension_name VK_KHR_pipeline_library)
```

## VK_KHR_shader_non_semantic_info

```lisp
(defconstant vk_khr_shader_non_semantic_info 1)
```

## VK_KHR_SHADER_NON_SEMANTIC_INFO_SPEC_VERSION

```lisp
(defconstant vk_khr_shader_non_semantic_info_spec_version 1)
```

## VK_KHR_SHADER_NON_SEMANTIC_INFO_EXTENSION_NAME

```lisp
(defconstant vk_khr_shader_non_semantic_info_extension_name VK_KHR_shader_non_semantic_info)
```

## VK_KHR_present_id

```lisp
(defconstant vk_khr_present_id 1)
```

## VK_KHR_PRESENT_ID_SPEC_VERSION

```lisp
(defconstant vk_khr_present_id_spec_version 1)
```

## VK_KHR_PRESENT_ID_EXTENSION_NAME

```lisp
(defconstant vk_khr_present_id_extension_name VK_KHR_present_id)
```

## VK_KHR_synchronization2

```lisp
(defconstant vk_khr_synchronization2 1)
```

## VK_KHR_SYNCHRONIZATION_2_SPEC_VERSION

```lisp
(defconstant vk_khr_synchronization_2_spec_version 1)
```

## VK_KHR_SYNCHRONIZATION_2_EXTENSION_NAME

```lisp
(defconstant vk_khr_synchronization_2_extension_name VK_KHR_synchronization2)
```

## VK_KHR_fragment_shader_barycentric

```lisp
(defconstant vk_khr_fragment_shader_barycentric 1)
```

## VK_KHR_FRAGMENT_SHADER_BARYCENTRIC_SPEC_VERSION

```lisp
(defconstant vk_khr_fragment_shader_barycentric_spec_version 1)
```

## VK_KHR_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME

```lisp
(defconstant vk_khr_fragment_shader_barycentric_extension_name VK_KHR_fragment_shader_barycentric)
```

## VK_KHR_shader_subgroup_uniform_control_flow

```lisp
(defconstant vk_khr_shader_subgroup_uniform_control_flow 1)
```

## VK_KHR_SHADER_SUBGROUP_UNIFORM_CONTROL_FLOW_SPEC_VERSION

```lisp
(defconstant vk_khr_shader_subgroup_uniform_control_flow_spec_version 1)
```

## VK_KHR_SHADER_SUBGROUP_UNIFORM_CONTROL_FLOW_EXTENSION_NAME

```lisp
(defconstant vk_khr_shader_subgroup_uniform_control_flow_extension_name VK_KHR_shader_subgroup_uniform_control_flow)
```

## VK_KHR_zero_initialize_workgroup_memory

```lisp
(defconstant vk_khr_zero_initialize_workgroup_memory 1)
```

## VK_KHR_ZERO_INITIALIZE_WORKGROUP_MEMORY_SPEC_VERSION

```lisp
(defconstant vk_khr_zero_initialize_workgroup_memory_spec_version 1)
```

## VK_KHR_ZERO_INITIALIZE_WORKGROUP_MEMORY_EXTENSION_NAME

```lisp
(defconstant vk_khr_zero_initialize_workgroup_memory_extension_name VK_KHR_zero_initialize_workgroup_memory)
```

## VK_KHR_workgroup_memory_explicit_layout

```lisp
(defconstant vk_khr_workgroup_memory_explicit_layout 1)
```

## VK_KHR_WORKGROUP_MEMORY_EXPLICIT_LAYOUT_SPEC_VERSION

```lisp
(defconstant vk_khr_workgroup_memory_explicit_layout_spec_version 1)
```

## VK_KHR_WORKGROUP_MEMORY_EXPLICIT_LAYOUT_EXTENSION_NAME

```lisp
(defconstant vk_khr_workgroup_memory_explicit_layout_extension_name VK_KHR_workgroup_memory_explicit_layout)
```

## VK_KHR_copy_commands2

```lisp
(defconstant vk_khr_copy_commands2 1)
```

## VK_KHR_COPY_COMMANDS_2_SPEC_VERSION

```lisp
(defconstant vk_khr_copy_commands_2_spec_version 1)
```

## VK_KHR_COPY_COMMANDS_2_EXTENSION_NAME

```lisp
(defconstant vk_khr_copy_commands_2_extension_name VK_KHR_copy_commands2)
```

## VK_KHR_format_feature_flags2

```lisp
(defconstant vk_khr_format_feature_flags2 1)
```

## VK_KHR_FORMAT_FEATURE_FLAGS_2_SPEC_VERSION

```lisp
(defconstant vk_khr_format_feature_flags_2_spec_version 1)
```

## VK_KHR_FORMAT_FEATURE_FLAGS_2_EXTENSION_NAME

```lisp
(defconstant vk_khr_format_feature_flags_2_extension_name VK_KHR_format_feature_flags2)
```

## VK_KHR_ray_tracing_maintenance1

```lisp
(defconstant vk_khr_ray_tracing_maintenance1 1)
```

## VK_KHR_RAY_TRACING_MAINTENANCE_1_SPEC_VERSION

```lisp
(defconstant vk_khr_ray_tracing_maintenance_1_spec_version 1)
```

## VK_KHR_RAY_TRACING_MAINTENANCE_1_EXTENSION_NAME

```lisp
(defconstant vk_khr_ray_tracing_maintenance_1_extension_name VK_KHR_ray_tracing_maintenance1)
```

## VK_KHR_portability_enumeration

```lisp
(defconstant vk_khr_portability_enumeration 1)
```

## VK_KHR_PORTABILITY_ENUMERATION_SPEC_VERSION

```lisp
(defconstant vk_khr_portability_enumeration_spec_version 1)
```

## VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME

```lisp
(defconstant vk_khr_portability_enumeration_extension_name VK_KHR_portability_enumeration)
```

## VK_KHR_maintenance4

```lisp
(defconstant vk_khr_maintenance4 1)
```

## VK_KHR_MAINTENANCE_4_SPEC_VERSION

```lisp
(defconstant vk_khr_maintenance_4_spec_version 2)
```

## VK_KHR_MAINTENANCE_4_EXTENSION_NAME

```lisp
(defconstant vk_khr_maintenance_4_extension_name VK_KHR_maintenance4)
```

## VK_EXT_debug_report

```lisp
(defconstant vk_ext_debug_report 1)
```

## VK_EXT_DEBUG_REPORT_SPEC_VERSION

```lisp
(defconstant vk_ext_debug_report_spec_version 10)
```

## VK_EXT_DEBUG_REPORT_EXTENSION_NAME

```lisp
(defconstant vk_ext_debug_report_extension_name VK_EXT_debug_report)
```

## VK_NV_glsl_shader

```lisp
(defconstant vk_nv_glsl_shader 1)
```

## VK_NV_GLSL_SHADER_SPEC_VERSION

```lisp
(defconstant vk_nv_glsl_shader_spec_version 1)
```

## VK_NV_GLSL_SHADER_EXTENSION_NAME

```lisp
(defconstant vk_nv_glsl_shader_extension_name VK_NV_glsl_shader)
```

## VK_EXT_depth_range_unrestricted

```lisp
(defconstant vk_ext_depth_range_unrestricted 1)
```

## VK_EXT_DEPTH_RANGE_UNRESTRICTED_SPEC_VERSION

```lisp
(defconstant vk_ext_depth_range_unrestricted_spec_version 1)
```

## VK_EXT_DEPTH_RANGE_UNRESTRICTED_EXTENSION_NAME

```lisp
(defconstant vk_ext_depth_range_unrestricted_extension_name VK_EXT_depth_range_unrestricted)
```

## VK_IMG_filter_cubic

```lisp
(defconstant vk_img_filter_cubic 1)
```

## VK_IMG_FILTER_CUBIC_SPEC_VERSION

```lisp
(defconstant vk_img_filter_cubic_spec_version 1)
```

## VK_IMG_FILTER_CUBIC_EXTENSION_NAME

```lisp
(defconstant vk_img_filter_cubic_extension_name VK_IMG_filter_cubic)
```

## VK_AMD_rasterization_order

```lisp
(defconstant vk_amd_rasterization_order 1)
```

## VK_AMD_RASTERIZATION_ORDER_SPEC_VERSION

```lisp
(defconstant vk_amd_rasterization_order_spec_version 1)
```

## VK_AMD_RASTERIZATION_ORDER_EXTENSION_NAME

```lisp
(defconstant vk_amd_rasterization_order_extension_name VK_AMD_rasterization_order)
```

## VK_AMD_shader_trinary_minmax

```lisp
(defconstant vk_amd_shader_trinary_minmax 1)
```

## VK_AMD_SHADER_TRINARY_MINMAX_SPEC_VERSION

```lisp
(defconstant vk_amd_shader_trinary_minmax_spec_version 1)
```

## VK_AMD_SHADER_TRINARY_MINMAX_EXTENSION_NAME

```lisp
(defconstant vk_amd_shader_trinary_minmax_extension_name VK_AMD_shader_trinary_minmax)
```

## VK_AMD_shader_explicit_vertex_parameter

```lisp
(defconstant vk_amd_shader_explicit_vertex_parameter 1)
```

## VK_AMD_SHADER_EXPLICIT_VERTEX_PARAMETER_SPEC_VERSION

```lisp
(defconstant vk_amd_shader_explicit_vertex_parameter_spec_version 1)
```

## VK_AMD_SHADER_EXPLICIT_VERTEX_PARAMETER_EXTENSION_NAME

```lisp
(defconstant vk_amd_shader_explicit_vertex_parameter_extension_name VK_AMD_shader_explicit_vertex_parameter)
```

## VK_EXT_debug_marker

```lisp
(defconstant vk_ext_debug_marker 1)
```

## VK_EXT_DEBUG_MARKER_SPEC_VERSION

```lisp
(defconstant vk_ext_debug_marker_spec_version 4)
```

## VK_EXT_DEBUG_MARKER_EXTENSION_NAME

```lisp
(defconstant vk_ext_debug_marker_extension_name VK_EXT_debug_marker)
```

## VK_AMD_gcn_shader

```lisp
(defconstant vk_amd_gcn_shader 1)
```

## VK_AMD_GCN_SHADER_SPEC_VERSION

```lisp
(defconstant vk_amd_gcn_shader_spec_version 1)
```

## VK_AMD_GCN_SHADER_EXTENSION_NAME

```lisp
(defconstant vk_amd_gcn_shader_extension_name VK_AMD_gcn_shader)
```

## VK_NV_dedicated_allocation

```lisp
(defconstant vk_nv_dedicated_allocation 1)
```

## VK_NV_DEDICATED_ALLOCATION_SPEC_VERSION

```lisp
(defconstant vk_nv_dedicated_allocation_spec_version 1)
```

## VK_NV_DEDICATED_ALLOCATION_EXTENSION_NAME

```lisp
(defconstant vk_nv_dedicated_allocation_extension_name VK_NV_dedicated_allocation)
```

## VK_EXT_transform_feedback

```lisp
(defconstant vk_ext_transform_feedback 1)
```

## VK_EXT_TRANSFORM_FEEDBACK_SPEC_VERSION

```lisp
(defconstant vk_ext_transform_feedback_spec_version 1)
```

## VK_EXT_TRANSFORM_FEEDBACK_EXTENSION_NAME

```lisp
(defconstant vk_ext_transform_feedback_extension_name VK_EXT_transform_feedback)
```

## VK_NVX_binary_import

```lisp
(defconstant vk_nvx_binary_import 1)
```

## VK_NVX_BINARY_IMPORT_SPEC_VERSION

```lisp
(defconstant vk_nvx_binary_import_spec_version 1)
```

## VK_NVX_BINARY_IMPORT_EXTENSION_NAME

```lisp
(defconstant vk_nvx_binary_import_extension_name VK_NVX_binary_import)
```

## VK_NVX_image_view_handle

```lisp
(defconstant vk_nvx_image_view_handle 1)
```

## VK_NVX_IMAGE_VIEW_HANDLE_SPEC_VERSION

```lisp
(defconstant vk_nvx_image_view_handle_spec_version 2)
```

## VK_NVX_IMAGE_VIEW_HANDLE_EXTENSION_NAME

```lisp
(defconstant vk_nvx_image_view_handle_extension_name VK_NVX_image_view_handle)
```

## VK_AMD_draw_indirect_count

```lisp
(defconstant vk_amd_draw_indirect_count 1)
```

## VK_AMD_DRAW_INDIRECT_COUNT_SPEC_VERSION

```lisp
(defconstant vk_amd_draw_indirect_count_spec_version 2)
```

## VK_AMD_DRAW_INDIRECT_COUNT_EXTENSION_NAME

```lisp
(defconstant vk_amd_draw_indirect_count_extension_name VK_AMD_draw_indirect_count)
```

## VK_AMD_negative_viewport_height

```lisp
(defconstant vk_amd_negative_viewport_height 1)
```

## VK_AMD_NEGATIVE_VIEWPORT_HEIGHT_SPEC_VERSION

```lisp
(defconstant vk_amd_negative_viewport_height_spec_version 1)
```

## VK_AMD_NEGATIVE_VIEWPORT_HEIGHT_EXTENSION_NAME

```lisp
(defconstant vk_amd_negative_viewport_height_extension_name VK_AMD_negative_viewport_height)
```

## VK_AMD_gpu_shader_half_float

```lisp
(defconstant vk_amd_gpu_shader_half_float 1)
```

## VK_AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION

```lisp
(defconstant vk_amd_gpu_shader_half_float_spec_version 2)
```

## VK_AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME

```lisp
(defconstant vk_amd_gpu_shader_half_float_extension_name VK_AMD_gpu_shader_half_float)
```

## VK_AMD_shader_ballot

```lisp
(defconstant vk_amd_shader_ballot 1)
```

## VK_AMD_SHADER_BALLOT_SPEC_VERSION

```lisp
(defconstant vk_amd_shader_ballot_spec_version 1)
```

## VK_AMD_SHADER_BALLOT_EXTENSION_NAME

```lisp
(defconstant vk_amd_shader_ballot_extension_name VK_AMD_shader_ballot)
```

## VK_AMD_texture_gather_bias_lod

```lisp
(defconstant vk_amd_texture_gather_bias_lod 1)
```

## VK_AMD_TEXTURE_GATHER_BIAS_LOD_SPEC_VERSION

```lisp
(defconstant vk_amd_texture_gather_bias_lod_spec_version 1)
```

## VK_AMD_TEXTURE_GATHER_BIAS_LOD_EXTENSION_NAME

```lisp
(defconstant vk_amd_texture_gather_bias_lod_extension_name VK_AMD_texture_gather_bias_lod)
```

## VK_AMD_shader_info

```lisp
(defconstant vk_amd_shader_info 1)
```

## VK_AMD_SHADER_INFO_SPEC_VERSION

```lisp
(defconstant vk_amd_shader_info_spec_version 1)
```

## VK_AMD_SHADER_INFO_EXTENSION_NAME

```lisp
(defconstant vk_amd_shader_info_extension_name VK_AMD_shader_info)
```

## VK_AMD_shader_image_load_store_lod

```lisp
(defconstant vk_amd_shader_image_load_store_lod 1)
```

## VK_AMD_SHADER_IMAGE_LOAD_STORE_LOD_SPEC_VERSION

```lisp
(defconstant vk_amd_shader_image_load_store_lod_spec_version 1)
```

## VK_AMD_SHADER_IMAGE_LOAD_STORE_LOD_EXTENSION_NAME

```lisp
(defconstant vk_amd_shader_image_load_store_lod_extension_name VK_AMD_shader_image_load_store_lod)
```

## VK_NV_corner_sampled_image

```lisp
(defconstant vk_nv_corner_sampled_image 1)
```

## VK_NV_CORNER_SAMPLED_IMAGE_SPEC_VERSION

```lisp
(defconstant vk_nv_corner_sampled_image_spec_version 2)
```

## VK_NV_CORNER_SAMPLED_IMAGE_EXTENSION_NAME

```lisp
(defconstant vk_nv_corner_sampled_image_extension_name VK_NV_corner_sampled_image)
```

## VK_IMG_format_pvrtc

```lisp
(defconstant vk_img_format_pvrtc 1)
```

## VK_IMG_FORMAT_PVRTC_SPEC_VERSION

```lisp
(defconstant vk_img_format_pvrtc_spec_version 1)
```

## VK_IMG_FORMAT_PVRTC_EXTENSION_NAME

```lisp
(defconstant vk_img_format_pvrtc_extension_name VK_IMG_format_pvrtc)
```

## VK_NV_external_memory_capabilities

```lisp
(defconstant vk_nv_external_memory_capabilities 1)
```

## VK_NV_EXTERNAL_MEMORY_CAPABILITIES_SPEC_VERSION

```lisp
(defconstant vk_nv_external_memory_capabilities_spec_version 1)
```

## VK_NV_EXTERNAL_MEMORY_CAPABILITIES_EXTENSION_NAME

```lisp
(defconstant vk_nv_external_memory_capabilities_extension_name VK_NV_external_memory_capabilities)
```

## VK_NV_external_memory

```lisp
(defconstant vk_nv_external_memory 1)
```

## VK_NV_EXTERNAL_MEMORY_SPEC_VERSION

```lisp
(defconstant vk_nv_external_memory_spec_version 1)
```

## VK_NV_EXTERNAL_MEMORY_EXTENSION_NAME

```lisp
(defconstant vk_nv_external_memory_extension_name VK_NV_external_memory)
```

## VK_EXT_validation_flags

```lisp
(defconstant vk_ext_validation_flags 1)
```

## VK_EXT_VALIDATION_FLAGS_SPEC_VERSION

```lisp
(defconstant vk_ext_validation_flags_spec_version 2)
```

## VK_EXT_VALIDATION_FLAGS_EXTENSION_NAME

```lisp
(defconstant vk_ext_validation_flags_extension_name VK_EXT_validation_flags)
```

## VK_EXT_shader_subgroup_ballot

```lisp
(defconstant vk_ext_shader_subgroup_ballot 1)
```

## VK_EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION

```lisp
(defconstant vk_ext_shader_subgroup_ballot_spec_version 1)
```

## VK_EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME

```lisp
(defconstant vk_ext_shader_subgroup_ballot_extension_name VK_EXT_shader_subgroup_ballot)
```

## VK_EXT_shader_subgroup_vote

```lisp
(defconstant vk_ext_shader_subgroup_vote 1)
```

## VK_EXT_SHADER_SUBGROUP_VOTE_SPEC_VERSION

```lisp
(defconstant vk_ext_shader_subgroup_vote_spec_version 1)
```

## VK_EXT_SHADER_SUBGROUP_VOTE_EXTENSION_NAME

```lisp
(defconstant vk_ext_shader_subgroup_vote_extension_name VK_EXT_shader_subgroup_vote)
```

## VK_EXT_texture_compression_astc_hdr

```lisp
(defconstant vk_ext_texture_compression_astc_hdr 1)
```

## VK_EXT_TEXTURE_COMPRESSION_ASTC_HDR_SPEC_VERSION

```lisp
(defconstant vk_ext_texture_compression_astc_hdr_spec_version 1)
```

## VK_EXT_TEXTURE_COMPRESSION_ASTC_HDR_EXTENSION_NAME

```lisp
(defconstant vk_ext_texture_compression_astc_hdr_extension_name VK_EXT_texture_compression_astc_hdr)
```

## VK_EXT_astc_decode_mode

```lisp
(defconstant vk_ext_astc_decode_mode 1)
```

## VK_EXT_ASTC_DECODE_MODE_SPEC_VERSION

```lisp
(defconstant vk_ext_astc_decode_mode_spec_version 1)
```

## VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME

```lisp
(defconstant vk_ext_astc_decode_mode_extension_name VK_EXT_astc_decode_mode)
```

## VK_EXT_conditional_rendering

```lisp
(defconstant vk_ext_conditional_rendering 1)
```

## VK_EXT_CONDITIONAL_RENDERING_SPEC_VERSION

```lisp
(defconstant vk_ext_conditional_rendering_spec_version 2)
```

## VK_EXT_CONDITIONAL_RENDERING_EXTENSION_NAME

```lisp
(defconstant vk_ext_conditional_rendering_extension_name VK_EXT_conditional_rendering)
```

## VK_NV_clip_space_w_scaling

```lisp
(defconstant vk_nv_clip_space_w_scaling 1)
```

## VK_NV_CLIP_SPACE_W_SCALING_SPEC_VERSION

```lisp
(defconstant vk_nv_clip_space_w_scaling_spec_version 1)
```

## VK_NV_CLIP_SPACE_W_SCALING_EXTENSION_NAME

```lisp
(defconstant vk_nv_clip_space_w_scaling_extension_name VK_NV_clip_space_w_scaling)
```

## VK_EXT_direct_mode_display

```lisp
(defconstant vk_ext_direct_mode_display 1)
```

## VK_EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION

```lisp
(defconstant vk_ext_direct_mode_display_spec_version 1)
```

## VK_EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME

```lisp
(defconstant vk_ext_direct_mode_display_extension_name VK_EXT_direct_mode_display)
```

## VK_EXT_display_surface_counter

```lisp
(defconstant vk_ext_display_surface_counter 1)
```

## VK_EXT_DISPLAY_SURFACE_COUNTER_SPEC_VERSION

```lisp
(defconstant vk_ext_display_surface_counter_spec_version 1)
```

## VK_EXT_DISPLAY_SURFACE_COUNTER_EXTENSION_NAME

```lisp
(defconstant vk_ext_display_surface_counter_extension_name VK_EXT_display_surface_counter)
```

## VK_EXT_display_control

```lisp
(defconstant vk_ext_display_control 1)
```

## VK_EXT_DISPLAY_CONTROL_SPEC_VERSION

```lisp
(defconstant vk_ext_display_control_spec_version 1)
```

## VK_EXT_DISPLAY_CONTROL_EXTENSION_NAME

```lisp
(defconstant vk_ext_display_control_extension_name VK_EXT_display_control)
```

## VK_GOOGLE_display_timing

```lisp
(defconstant vk_google_display_timing 1)
```

## VK_GOOGLE_DISPLAY_TIMING_SPEC_VERSION

```lisp
(defconstant vk_google_display_timing_spec_version 1)
```

## VK_GOOGLE_DISPLAY_TIMING_EXTENSION_NAME

```lisp
(defconstant vk_google_display_timing_extension_name VK_GOOGLE_display_timing)
```

## VK_NV_sample_mask_override_coverage

```lisp
(defconstant vk_nv_sample_mask_override_coverage 1)
```

## VK_NV_SAMPLE_MASK_OVERRIDE_COVERAGE_SPEC_VERSION

```lisp
(defconstant vk_nv_sample_mask_override_coverage_spec_version 1)
```

## VK_NV_SAMPLE_MASK_OVERRIDE_COVERAGE_EXTENSION_NAME

```lisp
(defconstant vk_nv_sample_mask_override_coverage_extension_name VK_NV_sample_mask_override_coverage)
```

## VK_NV_geometry_shader_passthrough

```lisp
(defconstant vk_nv_geometry_shader_passthrough 1)
```

## VK_NV_GEOMETRY_SHADER_PASSTHROUGH_SPEC_VERSION

```lisp
(defconstant vk_nv_geometry_shader_passthrough_spec_version 1)
```

## VK_NV_GEOMETRY_SHADER_PASSTHROUGH_EXTENSION_NAME

```lisp
(defconstant vk_nv_geometry_shader_passthrough_extension_name VK_NV_geometry_shader_passthrough)
```

## VK_NV_viewport_array2

```lisp
(defconstant vk_nv_viewport_array2 1)
```

## VK_NV_VIEWPORT_ARRAY_2_SPEC_VERSION

```lisp
(defconstant vk_nv_viewport_array_2_spec_version 1)
```

## VK_NV_VIEWPORT_ARRAY_2_EXTENSION_NAME

```lisp
(defconstant vk_nv_viewport_array_2_extension_name VK_NV_viewport_array2)
```

## VK_NV_VIEWPORT_ARRAY2_SPEC_VERSION

```lisp
(defconstant vk_nv_viewport_array2_spec_version VK_NV_VIEWPORT_ARRAY_2_SPEC_VERSION)
```

## VK_NV_VIEWPORT_ARRAY2_EXTENSION_NAME

```lisp
(defconstant vk_nv_viewport_array2_extension_name VK_NV_VIEWPORT_ARRAY_2_EXTENSION_NAME)
```

## VK_NVX_multiview_per_view_attributes

```lisp
(defconstant vk_nvx_multiview_per_view_attributes 1)
```

## VK_NVX_MULTIVIEW_PER_VIEW_ATTRIBUTES_SPEC_VERSION

```lisp
(defconstant vk_nvx_multiview_per_view_attributes_spec_version 1)
```

## VK_NVX_MULTIVIEW_PER_VIEW_ATTRIBUTES_EXTENSION_NAME

```lisp
(defconstant vk_nvx_multiview_per_view_attributes_extension_name VK_NVX_multiview_per_view_attributes)
```

## VK_NV_viewport_swizzle

```lisp
(defconstant vk_nv_viewport_swizzle 1)
```

## VK_NV_VIEWPORT_SWIZZLE_SPEC_VERSION

```lisp
(defconstant vk_nv_viewport_swizzle_spec_version 1)
```

## VK_NV_VIEWPORT_SWIZZLE_EXTENSION_NAME

```lisp
(defconstant vk_nv_viewport_swizzle_extension_name VK_NV_viewport_swizzle)
```

## VK_EXT_discard_rectangles

```lisp
(defconstant vk_ext_discard_rectangles 1)
```

## VK_EXT_DISCARD_RECTANGLES_SPEC_VERSION

```lisp
(defconstant vk_ext_discard_rectangles_spec_version 1)
```

## VK_EXT_DISCARD_RECTANGLES_EXTENSION_NAME

```lisp
(defconstant vk_ext_discard_rectangles_extension_name VK_EXT_discard_rectangles)
```

## VK_EXT_conservative_rasterization

```lisp
(defconstant vk_ext_conservative_rasterization 1)
```

## VK_EXT_CONSERVATIVE_RASTERIZATION_SPEC_VERSION

```lisp
(defconstant vk_ext_conservative_rasterization_spec_version 1)
```

## VK_EXT_CONSERVATIVE_RASTERIZATION_EXTENSION_NAME

```lisp
(defconstant vk_ext_conservative_rasterization_extension_name VK_EXT_conservative_rasterization)
```

## VK_EXT_depth_clip_enable

```lisp
(defconstant vk_ext_depth_clip_enable 1)
```

## VK_EXT_DEPTH_CLIP_ENABLE_SPEC_VERSION

```lisp
(defconstant vk_ext_depth_clip_enable_spec_version 1)
```

## VK_EXT_DEPTH_CLIP_ENABLE_EXTENSION_NAME

```lisp
(defconstant vk_ext_depth_clip_enable_extension_name VK_EXT_depth_clip_enable)
```

## VK_EXT_swapchain_colorspace

```lisp
(defconstant vk_ext_swapchain_colorspace 1)
```

## VK_EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION

```lisp
(defconstant vk_ext_swapchain_color_space_spec_version 4)
```

## VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME

```lisp
(defconstant vk_ext_swapchain_color_space_extension_name VK_EXT_swapchain_colorspace)
```

## VK_EXT_hdr_metadata

```lisp
(defconstant vk_ext_hdr_metadata 1)
```

## VK_EXT_HDR_METADATA_SPEC_VERSION

```lisp
(defconstant vk_ext_hdr_metadata_spec_version 2)
```

## VK_EXT_HDR_METADATA_EXTENSION_NAME

```lisp
(defconstant vk_ext_hdr_metadata_extension_name VK_EXT_hdr_metadata)
```

## VK_EXT_external_memory_dma_buf

```lisp
(defconstant vk_ext_external_memory_dma_buf 1)
```

## VK_EXT_EXTERNAL_MEMORY_DMA_BUF_SPEC_VERSION

```lisp
(defconstant vk_ext_external_memory_dma_buf_spec_version 1)
```

## VK_EXT_EXTERNAL_MEMORY_DMA_BUF_EXTENSION_NAME

```lisp
(defconstant vk_ext_external_memory_dma_buf_extension_name VK_EXT_external_memory_dma_buf)
```

## VK_EXT_queue_family_foreign

```lisp
(defconstant vk_ext_queue_family_foreign 1)
```

## VK_EXT_QUEUE_FAMILY_FOREIGN_SPEC_VERSION

```lisp
(defconstant vk_ext_queue_family_foreign_spec_version 1)
```

## VK_EXT_QUEUE_FAMILY_FOREIGN_EXTENSION_NAME

```lisp
(defconstant vk_ext_queue_family_foreign_extension_name VK_EXT_queue_family_foreign)
```

## VK_QUEUE_FAMILY_FOREIGN_EXT

```lisp
(defconstant vk_queue_family_foreign_ext (- UINT32_MAX 2))
```

## VK_EXT_debug_utils

```lisp
(defconstant vk_ext_debug_utils 1)
```

## VK_EXT_DEBUG_UTILS_SPEC_VERSION

```lisp
(defconstant vk_ext_debug_utils_spec_version 2)
```

## VK_EXT_DEBUG_UTILS_EXTENSION_NAME

```lisp
(defconstant vk_ext_debug_utils_extension_name VK_EXT_debug_utils)
```

## VK_EXT_sampler_filter_minmax

```lisp
(defconstant vk_ext_sampler_filter_minmax 1)
```

## VK_EXT_SAMPLER_FILTER_MINMAX_SPEC_VERSION

```lisp
(defconstant vk_ext_sampler_filter_minmax_spec_version 2)
```

## VK_EXT_SAMPLER_FILTER_MINMAX_EXTENSION_NAME

```lisp
(defconstant vk_ext_sampler_filter_minmax_extension_name VK_EXT_sampler_filter_minmax)
```

## VK_AMD_gpu_shader_int16

```lisp
(defconstant vk_amd_gpu_shader_int16 1)
```

## VK_AMD_GPU_SHADER_INT16_SPEC_VERSION

```lisp
(defconstant vk_amd_gpu_shader_int16_spec_version 2)
```

## VK_AMD_GPU_SHADER_INT16_EXTENSION_NAME

```lisp
(defconstant vk_amd_gpu_shader_int16_extension_name VK_AMD_gpu_shader_int16)
```

## VK_AMD_mixed_attachment_samples

```lisp
(defconstant vk_amd_mixed_attachment_samples 1)
```

## VK_AMD_MIXED_ATTACHMENT_SAMPLES_SPEC_VERSION

```lisp
(defconstant vk_amd_mixed_attachment_samples_spec_version 1)
```

## VK_AMD_MIXED_ATTACHMENT_SAMPLES_EXTENSION_NAME

```lisp
(defconstant vk_amd_mixed_attachment_samples_extension_name VK_AMD_mixed_attachment_samples)
```

## VK_AMD_shader_fragment_mask

```lisp
(defconstant vk_amd_shader_fragment_mask 1)
```

## VK_AMD_SHADER_FRAGMENT_MASK_SPEC_VERSION

```lisp
(defconstant vk_amd_shader_fragment_mask_spec_version 1)
```

## VK_AMD_SHADER_FRAGMENT_MASK_EXTENSION_NAME

```lisp
(defconstant vk_amd_shader_fragment_mask_extension_name VK_AMD_shader_fragment_mask)
```

## VK_EXT_inline_uniform_block

```lisp
(defconstant vk_ext_inline_uniform_block 1)
```

## VK_EXT_INLINE_UNIFORM_BLOCK_SPEC_VERSION

```lisp
(defconstant vk_ext_inline_uniform_block_spec_version 1)
```

## VK_EXT_INLINE_UNIFORM_BLOCK_EXTENSION_NAME

```lisp
(defconstant vk_ext_inline_uniform_block_extension_name VK_EXT_inline_uniform_block)
```

## VK_EXT_shader_stencil_export

```lisp
(defconstant vk_ext_shader_stencil_export 1)
```

## VK_EXT_SHADER_STENCIL_EXPORT_SPEC_VERSION

```lisp
(defconstant vk_ext_shader_stencil_export_spec_version 1)
```

## VK_EXT_SHADER_STENCIL_EXPORT_EXTENSION_NAME

```lisp
(defconstant vk_ext_shader_stencil_export_extension_name VK_EXT_shader_stencil_export)
```

## VK_EXT_sample_locations

```lisp
(defconstant vk_ext_sample_locations 1)
```

## VK_EXT_SAMPLE_LOCATIONS_SPEC_VERSION

```lisp
(defconstant vk_ext_sample_locations_spec_version 1)
```

## VK_EXT_SAMPLE_LOCATIONS_EXTENSION_NAME

```lisp
(defconstant vk_ext_sample_locations_extension_name VK_EXT_sample_locations)
```

## VK_EXT_blend_operation_advanced

```lisp
(defconstant vk_ext_blend_operation_advanced 1)
```

## VK_EXT_BLEND_OPERATION_ADVANCED_SPEC_VERSION

```lisp
(defconstant vk_ext_blend_operation_advanced_spec_version 2)
```

## VK_EXT_BLEND_OPERATION_ADVANCED_EXTENSION_NAME

```lisp
(defconstant vk_ext_blend_operation_advanced_extension_name VK_EXT_blend_operation_advanced)
```

## VK_NV_fragment_coverage_to_color

```lisp
(defconstant vk_nv_fragment_coverage_to_color 1)
```

## VK_NV_FRAGMENT_COVERAGE_TO_COLOR_SPEC_VERSION

```lisp
(defconstant vk_nv_fragment_coverage_to_color_spec_version 1)
```

## VK_NV_FRAGMENT_COVERAGE_TO_COLOR_EXTENSION_NAME

```lisp
(defconstant vk_nv_fragment_coverage_to_color_extension_name VK_NV_fragment_coverage_to_color)
```

## VK_NV_framebuffer_mixed_samples

```lisp
(defconstant vk_nv_framebuffer_mixed_samples 1)
```

## VK_NV_FRAMEBUFFER_MIXED_SAMPLES_SPEC_VERSION

```lisp
(defconstant vk_nv_framebuffer_mixed_samples_spec_version 1)
```

## VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME

```lisp
(defconstant vk_nv_framebuffer_mixed_samples_extension_name VK_NV_framebuffer_mixed_samples)
```

## VK_NV_fill_rectangle

```lisp
(defconstant vk_nv_fill_rectangle 1)
```

## VK_NV_FILL_RECTANGLE_SPEC_VERSION

```lisp
(defconstant vk_nv_fill_rectangle_spec_version 1)
```

## VK_NV_FILL_RECTANGLE_EXTENSION_NAME

```lisp
(defconstant vk_nv_fill_rectangle_extension_name VK_NV_fill_rectangle)
```

## VK_NV_shader_sm_builtins

```lisp
(defconstant vk_nv_shader_sm_builtins 1)
```

## VK_NV_SHADER_SM_BUILTINS_SPEC_VERSION

```lisp
(defconstant vk_nv_shader_sm_builtins_spec_version 1)
```

## VK_NV_SHADER_SM_BUILTINS_EXTENSION_NAME

```lisp
(defconstant vk_nv_shader_sm_builtins_extension_name VK_NV_shader_sm_builtins)
```

## VK_EXT_post_depth_coverage

```lisp
(defconstant vk_ext_post_depth_coverage 1)
```

## VK_EXT_POST_DEPTH_COVERAGE_SPEC_VERSION

```lisp
(defconstant vk_ext_post_depth_coverage_spec_version 1)
```

## VK_EXT_POST_DEPTH_COVERAGE_EXTENSION_NAME

```lisp
(defconstant vk_ext_post_depth_coverage_extension_name VK_EXT_post_depth_coverage)
```

## VK_EXT_image_drm_format_modifier

```lisp
(defconstant vk_ext_image_drm_format_modifier 1)
```

## VK_EXT_IMAGE_DRM_FORMAT_MODIFIER_SPEC_VERSION

```lisp
(defconstant vk_ext_image_drm_format_modifier_spec_version 2)
```

## VK_EXT_IMAGE_DRM_FORMAT_MODIFIER_EXTENSION_NAME

```lisp
(defconstant vk_ext_image_drm_format_modifier_extension_name VK_EXT_image_drm_format_modifier)
```

## VK_EXT_validation_cache

```lisp
(defconstant vk_ext_validation_cache 1)
```

## VK_EXT_VALIDATION_CACHE_SPEC_VERSION

```lisp
(defconstant vk_ext_validation_cache_spec_version 1)
```

## VK_EXT_VALIDATION_CACHE_EXTENSION_NAME

```lisp
(defconstant vk_ext_validation_cache_extension_name VK_EXT_validation_cache)
```

## VK_EXT_descriptor_indexing

```lisp
(defconstant vk_ext_descriptor_indexing 1)
```

## VK_EXT_DESCRIPTOR_INDEXING_SPEC_VERSION

```lisp
(defconstant vk_ext_descriptor_indexing_spec_version 2)
```

## VK_EXT_DESCRIPTOR_INDEXING_EXTENSION_NAME

```lisp
(defconstant vk_ext_descriptor_indexing_extension_name VK_EXT_descriptor_indexing)
```

## VK_EXT_shader_viewport_index_layer

```lisp
(defconstant vk_ext_shader_viewport_index_layer 1)
```

## VK_EXT_SHADER_VIEWPORT_INDEX_LAYER_SPEC_VERSION

```lisp
(defconstant vk_ext_shader_viewport_index_layer_spec_version 1)
```

## VK_EXT_SHADER_VIEWPORT_INDEX_LAYER_EXTENSION_NAME

```lisp
(defconstant vk_ext_shader_viewport_index_layer_extension_name VK_EXT_shader_viewport_index_layer)
```

## VK_NV_shading_rate_image

```lisp
(defconstant vk_nv_shading_rate_image 1)
```

## VK_NV_SHADING_RATE_IMAGE_SPEC_VERSION

```lisp
(defconstant vk_nv_shading_rate_image_spec_version 3)
```

## VK_NV_SHADING_RATE_IMAGE_EXTENSION_NAME

```lisp
(defconstant vk_nv_shading_rate_image_extension_name VK_NV_shading_rate_image)
```

## VK_NV_ray_tracing

```lisp
(defconstant vk_nv_ray_tracing 1)
```

## VK_NV_RAY_TRACING_SPEC_VERSION

```lisp
(defconstant vk_nv_ray_tracing_spec_version 3)
```

## VK_NV_RAY_TRACING_EXTENSION_NAME

```lisp
(defconstant vk_nv_ray_tracing_extension_name VK_NV_ray_tracing)
```

## VK_SHADER_UNUSED_KHR

```lisp
(defconstant vk_shader_unused_khr (- UINT32_MAX 0))
```

## VK_SHADER_UNUSED_NV

```lisp
(defconstant vk_shader_unused_nv VK_SHADER_UNUSED_KHR)
```

## VK_NV_representative_fragment_test

```lisp
(defconstant vk_nv_representative_fragment_test 1)
```

## VK_NV_REPRESENTATIVE_FRAGMENT_TEST_SPEC_VERSION

```lisp
(defconstant vk_nv_representative_fragment_test_spec_version 2)
```

## VK_NV_REPRESENTATIVE_FRAGMENT_TEST_EXTENSION_NAME

```lisp
(defconstant vk_nv_representative_fragment_test_extension_name VK_NV_representative_fragment_test)
```

## VK_EXT_filter_cubic

```lisp
(defconstant vk_ext_filter_cubic 1)
```

## VK_EXT_FILTER_CUBIC_SPEC_VERSION

```lisp
(defconstant vk_ext_filter_cubic_spec_version 3)
```

## VK_EXT_FILTER_CUBIC_EXTENSION_NAME

```lisp
(defconstant vk_ext_filter_cubic_extension_name VK_EXT_filter_cubic)
```

## VK_QCOM_render_pass_shader_resolve

```lisp
(defconstant vk_qcom_render_pass_shader_resolve 1)
```

## VK_QCOM_RENDER_PASS_SHADER_RESOLVE_SPEC_VERSION

```lisp
(defconstant vk_qcom_render_pass_shader_resolve_spec_version 4)
```

## VK_QCOM_RENDER_PASS_SHADER_RESOLVE_EXTENSION_NAME

```lisp
(defconstant vk_qcom_render_pass_shader_resolve_extension_name VK_QCOM_render_pass_shader_resolve)
```

## VK_EXT_global_priority

```lisp
(defconstant vk_ext_global_priority 1)
```

## VK_EXT_GLOBAL_PRIORITY_SPEC_VERSION

```lisp
(defconstant vk_ext_global_priority_spec_version 2)
```

## VK_EXT_GLOBAL_PRIORITY_EXTENSION_NAME

```lisp
(defconstant vk_ext_global_priority_extension_name VK_EXT_global_priority)
```

## VK_EXT_external_memory_host

```lisp
(defconstant vk_ext_external_memory_host 1)
```

## VK_EXT_EXTERNAL_MEMORY_HOST_SPEC_VERSION

```lisp
(defconstant vk_ext_external_memory_host_spec_version 1)
```

## VK_EXT_EXTERNAL_MEMORY_HOST_EXTENSION_NAME

```lisp
(defconstant vk_ext_external_memory_host_extension_name VK_EXT_external_memory_host)
```

## VK_AMD_buffer_marker

```lisp
(defconstant vk_amd_buffer_marker 1)
```

## VK_AMD_BUFFER_MARKER_SPEC_VERSION

```lisp
(defconstant vk_amd_buffer_marker_spec_version 1)
```

## VK_AMD_BUFFER_MARKER_EXTENSION_NAME

```lisp
(defconstant vk_amd_buffer_marker_extension_name VK_AMD_buffer_marker)
```

## VK_AMD_pipeline_compiler_control

```lisp
(defconstant vk_amd_pipeline_compiler_control 1)
```

## VK_AMD_PIPELINE_COMPILER_CONTROL_SPEC_VERSION

```lisp
(defconstant vk_amd_pipeline_compiler_control_spec_version 1)
```

## VK_AMD_PIPELINE_COMPILER_CONTROL_EXTENSION_NAME

```lisp
(defconstant vk_amd_pipeline_compiler_control_extension_name VK_AMD_pipeline_compiler_control)
```

## VK_EXT_calibrated_timestamps

```lisp
(defconstant vk_ext_calibrated_timestamps 1)
```

## VK_EXT_CALIBRATED_TIMESTAMPS_SPEC_VERSION

```lisp
(defconstant vk_ext_calibrated_timestamps_spec_version 2)
```

## VK_EXT_CALIBRATED_TIMESTAMPS_EXTENSION_NAME

```lisp
(defconstant vk_ext_calibrated_timestamps_extension_name VK_EXT_calibrated_timestamps)
```

## VK_AMD_shader_core_properties

```lisp
(defconstant vk_amd_shader_core_properties 1)
```

## VK_AMD_SHADER_CORE_PROPERTIES_SPEC_VERSION

```lisp
(defconstant vk_amd_shader_core_properties_spec_version 2)
```

## VK_AMD_SHADER_CORE_PROPERTIES_EXTENSION_NAME

```lisp
(defconstant vk_amd_shader_core_properties_extension_name VK_AMD_shader_core_properties)
```

## VK_AMD_memory_overallocation_behavior

```lisp
(defconstant vk_amd_memory_overallocation_behavior 1)
```

## VK_AMD_MEMORY_OVERALLOCATION_BEHAVIOR_SPEC_VERSION

```lisp
(defconstant vk_amd_memory_overallocation_behavior_spec_version 1)
```

## VK_AMD_MEMORY_OVERALLOCATION_BEHAVIOR_EXTENSION_NAME

```lisp
(defconstant vk_amd_memory_overallocation_behavior_extension_name VK_AMD_memory_overallocation_behavior)
```

## VK_EXT_vertex_attribute_divisor

```lisp
(defconstant vk_ext_vertex_attribute_divisor 1)
```

## VK_EXT_VERTEX_ATTRIBUTE_DIVISOR_SPEC_VERSION

```lisp
(defconstant vk_ext_vertex_attribute_divisor_spec_version 3)
```

## VK_EXT_VERTEX_ATTRIBUTE_DIVISOR_EXTENSION_NAME

```lisp
(defconstant vk_ext_vertex_attribute_divisor_extension_name VK_EXT_vertex_attribute_divisor)
```

## VK_EXT_pipeline_creation_feedback

```lisp
(defconstant vk_ext_pipeline_creation_feedback 1)
```

## VK_EXT_PIPELINE_CREATION_FEEDBACK_SPEC_VERSION

```lisp
(defconstant vk_ext_pipeline_creation_feedback_spec_version 1)
```

## VK_EXT_PIPELINE_CREATION_FEEDBACK_EXTENSION_NAME

```lisp
(defconstant vk_ext_pipeline_creation_feedback_extension_name VK_EXT_pipeline_creation_feedback)
```

## VK_NV_shader_subgroup_partitioned

```lisp
(defconstant vk_nv_shader_subgroup_partitioned 1)
```

## VK_NV_SHADER_SUBGROUP_PARTITIONED_SPEC_VERSION

```lisp
(defconstant vk_nv_shader_subgroup_partitioned_spec_version 1)
```

## VK_NV_SHADER_SUBGROUP_PARTITIONED_EXTENSION_NAME

```lisp
(defconstant vk_nv_shader_subgroup_partitioned_extension_name VK_NV_shader_subgroup_partitioned)
```

## VK_NV_compute_shader_derivatives

```lisp
(defconstant vk_nv_compute_shader_derivatives 1)
```

## VK_NV_COMPUTE_SHADER_DERIVATIVES_SPEC_VERSION

```lisp
(defconstant vk_nv_compute_shader_derivatives_spec_version 1)
```

## VK_NV_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME

```lisp
(defconstant vk_nv_compute_shader_derivatives_extension_name VK_NV_compute_shader_derivatives)
```

## VK_NV_mesh_shader

```lisp
(defconstant vk_nv_mesh_shader 1)
```

## VK_NV_MESH_SHADER_SPEC_VERSION

```lisp
(defconstant vk_nv_mesh_shader_spec_version 1)
```

## VK_NV_MESH_SHADER_EXTENSION_NAME

```lisp
(defconstant vk_nv_mesh_shader_extension_name VK_NV_mesh_shader)
```

## VK_NV_fragment_shader_barycentric

```lisp
(defconstant vk_nv_fragment_shader_barycentric 1)
```

## VK_NV_FRAGMENT_SHADER_BARYCENTRIC_SPEC_VERSION

```lisp
(defconstant vk_nv_fragment_shader_barycentric_spec_version 1)
```

## VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME

```lisp
(defconstant vk_nv_fragment_shader_barycentric_extension_name VK_NV_fragment_shader_barycentric)
```

## VK_NV_shader_image_footprint

```lisp
(defconstant vk_nv_shader_image_footprint 1)
```

## VK_NV_SHADER_IMAGE_FOOTPRINT_SPEC_VERSION

```lisp
(defconstant vk_nv_shader_image_footprint_spec_version 2)
```

## VK_NV_SHADER_IMAGE_FOOTPRINT_EXTENSION_NAME

```lisp
(defconstant vk_nv_shader_image_footprint_extension_name VK_NV_shader_image_footprint)
```

## VK_NV_scissor_exclusive

```lisp
(defconstant vk_nv_scissor_exclusive 1)
```

## VK_NV_SCISSOR_EXCLUSIVE_SPEC_VERSION

```lisp
(defconstant vk_nv_scissor_exclusive_spec_version 1)
```

## VK_NV_SCISSOR_EXCLUSIVE_EXTENSION_NAME

```lisp
(defconstant vk_nv_scissor_exclusive_extension_name VK_NV_scissor_exclusive)
```

## VK_NV_device_diagnostic_checkpoints

```lisp
(defconstant vk_nv_device_diagnostic_checkpoints 1)
```

## VK_NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_SPEC_VERSION

```lisp
(defconstant vk_nv_device_diagnostic_checkpoints_spec_version 2)
```

## VK_NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_EXTENSION_NAME

```lisp
(defconstant vk_nv_device_diagnostic_checkpoints_extension_name VK_NV_device_diagnostic_checkpoints)
```

## VK_INTEL_shader_integer_functions2

```lisp
(defconstant vk_intel_shader_integer_functions2 1)
```

## VK_INTEL_SHADER_INTEGER_FUNCTIONS_2_SPEC_VERSION

```lisp
(defconstant vk_intel_shader_integer_functions_2_spec_version 1)
```

## VK_INTEL_SHADER_INTEGER_FUNCTIONS_2_EXTENSION_NAME

```lisp
(defconstant vk_intel_shader_integer_functions_2_extension_name VK_INTEL_shader_integer_functions2)
```

## VK_INTEL_performance_query

```lisp
(defconstant vk_intel_performance_query 1)
```

## VK_INTEL_PERFORMANCE_QUERY_SPEC_VERSION

```lisp
(defconstant vk_intel_performance_query_spec_version 2)
```

## VK_INTEL_PERFORMANCE_QUERY_EXTENSION_NAME

```lisp
(defconstant vk_intel_performance_query_extension_name VK_INTEL_performance_query)
```

## VK_EXT_pci_bus_info

```lisp
(defconstant vk_ext_pci_bus_info 1)
```

## VK_EXT_PCI_BUS_INFO_SPEC_VERSION

```lisp
(defconstant vk_ext_pci_bus_info_spec_version 2)
```

## VK_EXT_PCI_BUS_INFO_EXTENSION_NAME

```lisp
(defconstant vk_ext_pci_bus_info_extension_name VK_EXT_pci_bus_info)
```

## VK_AMD_display_native_hdr

```lisp
(defconstant vk_amd_display_native_hdr 1)
```

## VK_AMD_DISPLAY_NATIVE_HDR_SPEC_VERSION

```lisp
(defconstant vk_amd_display_native_hdr_spec_version 1)
```

## VK_AMD_DISPLAY_NATIVE_HDR_EXTENSION_NAME

```lisp
(defconstant vk_amd_display_native_hdr_extension_name VK_AMD_display_native_hdr)
```

## VK_EXT_fragment_density_map

```lisp
(defconstant vk_ext_fragment_density_map 1)
```

## VK_EXT_FRAGMENT_DENSITY_MAP_SPEC_VERSION

```lisp
(defconstant vk_ext_fragment_density_map_spec_version 2)
```

## VK_EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME

```lisp
(defconstant vk_ext_fragment_density_map_extension_name VK_EXT_fragment_density_map)
```

## VK_EXT_scalar_block_layout

```lisp
(defconstant vk_ext_scalar_block_layout 1)
```

## VK_EXT_SCALAR_BLOCK_LAYOUT_SPEC_VERSION

```lisp
(defconstant vk_ext_scalar_block_layout_spec_version 1)
```

## VK_EXT_SCALAR_BLOCK_LAYOUT_EXTENSION_NAME

```lisp
(defconstant vk_ext_scalar_block_layout_extension_name VK_EXT_scalar_block_layout)
```

## VK_GOOGLE_hlsl_functionality1

```lisp
(defconstant vk_google_hlsl_functionality1 1)
```

## VK_GOOGLE_HLSL_FUNCTIONALITY_1_SPEC_VERSION

```lisp
(defconstant vk_google_hlsl_functionality_1_spec_version 1)
```

## VK_GOOGLE_HLSL_FUNCTIONALITY_1_EXTENSION_NAME

```lisp
(defconstant vk_google_hlsl_functionality_1_extension_name VK_GOOGLE_hlsl_functionality1)
```

## VK_GOOGLE_HLSL_FUNCTIONALITY1_SPEC_VERSION

```lisp
(defconstant vk_google_hlsl_functionality1_spec_version VK_GOOGLE_HLSL_FUNCTIONALITY_1_SPEC_VERSION)
```

## VK_GOOGLE_HLSL_FUNCTIONALITY1_EXTENSION_NAME

```lisp
(defconstant vk_google_hlsl_functionality1_extension_name VK_GOOGLE_HLSL_FUNCTIONALITY_1_EXTENSION_NAME)
```

## VK_GOOGLE_decorate_string

```lisp
(defconstant vk_google_decorate_string 1)
```

## VK_GOOGLE_DECORATE_STRING_SPEC_VERSION

```lisp
(defconstant vk_google_decorate_string_spec_version 1)
```

## VK_GOOGLE_DECORATE_STRING_EXTENSION_NAME

```lisp
(defconstant vk_google_decorate_string_extension_name VK_GOOGLE_decorate_string)
```

## VK_EXT_subgroup_size_control

```lisp
(defconstant vk_ext_subgroup_size_control 1)
```

## VK_EXT_SUBGROUP_SIZE_CONTROL_SPEC_VERSION

```lisp
(defconstant vk_ext_subgroup_size_control_spec_version 2)
```

## VK_EXT_SUBGROUP_SIZE_CONTROL_EXTENSION_NAME

```lisp
(defconstant vk_ext_subgroup_size_control_extension_name VK_EXT_subgroup_size_control)
```

## VK_AMD_shader_core_properties2

```lisp
(defconstant vk_amd_shader_core_properties2 1)
```

## VK_AMD_SHADER_CORE_PROPERTIES_2_SPEC_VERSION

```lisp
(defconstant vk_amd_shader_core_properties_2_spec_version 1)
```

## VK_AMD_SHADER_CORE_PROPERTIES_2_EXTENSION_NAME

```lisp
(defconstant vk_amd_shader_core_properties_2_extension_name VK_AMD_shader_core_properties2)
```

## VK_AMD_device_coherent_memory

```lisp
(defconstant vk_amd_device_coherent_memory 1)
```

## VK_AMD_DEVICE_COHERENT_MEMORY_SPEC_VERSION

```lisp
(defconstant vk_amd_device_coherent_memory_spec_version 1)
```

## VK_AMD_DEVICE_COHERENT_MEMORY_EXTENSION_NAME

```lisp
(defconstant vk_amd_device_coherent_memory_extension_name VK_AMD_device_coherent_memory)
```

## VK_EXT_shader_image_atomic_int64

```lisp
(defconstant vk_ext_shader_image_atomic_int64 1)
```

## VK_EXT_SHADER_IMAGE_ATOMIC_INT64_SPEC_VERSION

```lisp
(defconstant vk_ext_shader_image_atomic_int64_spec_version 1)
```

## VK_EXT_SHADER_IMAGE_ATOMIC_INT64_EXTENSION_NAME

```lisp
(defconstant vk_ext_shader_image_atomic_int64_extension_name VK_EXT_shader_image_atomic_int64)
```

## VK_EXT_memory_budget

```lisp
(defconstant vk_ext_memory_budget 1)
```

## VK_EXT_MEMORY_BUDGET_SPEC_VERSION

```lisp
(defconstant vk_ext_memory_budget_spec_version 1)
```

## VK_EXT_MEMORY_BUDGET_EXTENSION_NAME

```lisp
(defconstant vk_ext_memory_budget_extension_name VK_EXT_memory_budget)
```

## VK_EXT_memory_priority

```lisp
(defconstant vk_ext_memory_priority 1)
```

## VK_EXT_MEMORY_PRIORITY_SPEC_VERSION

```lisp
(defconstant vk_ext_memory_priority_spec_version 1)
```

## VK_EXT_MEMORY_PRIORITY_EXTENSION_NAME

```lisp
(defconstant vk_ext_memory_priority_extension_name VK_EXT_memory_priority)
```

## VK_NV_dedicated_allocation_image_aliasing

```lisp
(defconstant vk_nv_dedicated_allocation_image_aliasing 1)
```

## VK_NV_DEDICATED_ALLOCATION_IMAGE_ALIASING_SPEC_VERSION

```lisp
(defconstant vk_nv_dedicated_allocation_image_aliasing_spec_version 1)
```

## VK_NV_DEDICATED_ALLOCATION_IMAGE_ALIASING_EXTENSION_NAME

```lisp
(defconstant vk_nv_dedicated_allocation_image_aliasing_extension_name VK_NV_dedicated_allocation_image_aliasing)
```

## VK_EXT_buffer_device_address

```lisp
(defconstant vk_ext_buffer_device_address 1)
```

## VK_EXT_BUFFER_DEVICE_ADDRESS_SPEC_VERSION

```lisp
(defconstant vk_ext_buffer_device_address_spec_version 2)
```

## VK_EXT_BUFFER_DEVICE_ADDRESS_EXTENSION_NAME

```lisp
(defconstant vk_ext_buffer_device_address_extension_name VK_EXT_buffer_device_address)
```

## VK_EXT_tooling_info

```lisp
(defconstant vk_ext_tooling_info 1)
```

## VK_EXT_TOOLING_INFO_SPEC_VERSION

```lisp
(defconstant vk_ext_tooling_info_spec_version 1)
```

## VK_EXT_TOOLING_INFO_EXTENSION_NAME

```lisp
(defconstant vk_ext_tooling_info_extension_name VK_EXT_tooling_info)
```

## VK_EXT_separate_stencil_usage

```lisp
(defconstant vk_ext_separate_stencil_usage 1)
```

## VK_EXT_SEPARATE_STENCIL_USAGE_SPEC_VERSION

```lisp
(defconstant vk_ext_separate_stencil_usage_spec_version 1)
```

## VK_EXT_SEPARATE_STENCIL_USAGE_EXTENSION_NAME

```lisp
(defconstant vk_ext_separate_stencil_usage_extension_name VK_EXT_separate_stencil_usage)
```

## VK_EXT_validation_features

```lisp
(defconstant vk_ext_validation_features 1)
```

## VK_EXT_VALIDATION_FEATURES_SPEC_VERSION

```lisp
(defconstant vk_ext_validation_features_spec_version 5)
```

## VK_EXT_VALIDATION_FEATURES_EXTENSION_NAME

```lisp
(defconstant vk_ext_validation_features_extension_name VK_EXT_validation_features)
```

## VK_NV_cooperative_matrix

```lisp
(defconstant vk_nv_cooperative_matrix 1)
```

## VK_NV_COOPERATIVE_MATRIX_SPEC_VERSION

```lisp
(defconstant vk_nv_cooperative_matrix_spec_version 1)
```

## VK_NV_COOPERATIVE_MATRIX_EXTENSION_NAME

```lisp
(defconstant vk_nv_cooperative_matrix_extension_name VK_NV_cooperative_matrix)
```

## VK_NV_coverage_reduction_mode

```lisp
(defconstant vk_nv_coverage_reduction_mode 1)
```

## VK_NV_COVERAGE_REDUCTION_MODE_SPEC_VERSION

```lisp
(defconstant vk_nv_coverage_reduction_mode_spec_version 1)
```

## VK_NV_COVERAGE_REDUCTION_MODE_EXTENSION_NAME

```lisp
(defconstant vk_nv_coverage_reduction_mode_extension_name VK_NV_coverage_reduction_mode)
```

## VK_EXT_fragment_shader_interlock

```lisp
(defconstant vk_ext_fragment_shader_interlock 1)
```

## VK_EXT_FRAGMENT_SHADER_INTERLOCK_SPEC_VERSION

```lisp
(defconstant vk_ext_fragment_shader_interlock_spec_version 1)
```

## VK_EXT_FRAGMENT_SHADER_INTERLOCK_EXTENSION_NAME

```lisp
(defconstant vk_ext_fragment_shader_interlock_extension_name VK_EXT_fragment_shader_interlock)
```

## VK_EXT_ycbcr_image_arrays

```lisp
(defconstant vk_ext_ycbcr_image_arrays 1)
```

## VK_EXT_YCBCR_IMAGE_ARRAYS_SPEC_VERSION

```lisp
(defconstant vk_ext_ycbcr_image_arrays_spec_version 1)
```

## VK_EXT_YCBCR_IMAGE_ARRAYS_EXTENSION_NAME

```lisp
(defconstant vk_ext_ycbcr_image_arrays_extension_name VK_EXT_ycbcr_image_arrays)
```

## VK_EXT_provoking_vertex

```lisp
(defconstant vk_ext_provoking_vertex 1)
```

## VK_EXT_PROVOKING_VERTEX_SPEC_VERSION

```lisp
(defconstant vk_ext_provoking_vertex_spec_version 1)
```

## VK_EXT_PROVOKING_VERTEX_EXTENSION_NAME

```lisp
(defconstant vk_ext_provoking_vertex_extension_name VK_EXT_provoking_vertex)
```

## VK_EXT_headless_surface

```lisp
(defconstant vk_ext_headless_surface 1)
```

## VK_EXT_HEADLESS_SURFACE_SPEC_VERSION

```lisp
(defconstant vk_ext_headless_surface_spec_version 1)
```

## VK_EXT_HEADLESS_SURFACE_EXTENSION_NAME

```lisp
(defconstant vk_ext_headless_surface_extension_name VK_EXT_headless_surface)
```

## VK_EXT_line_rasterization

```lisp
(defconstant vk_ext_line_rasterization 1)
```

## VK_EXT_LINE_RASTERIZATION_SPEC_VERSION

```lisp
(defconstant vk_ext_line_rasterization_spec_version 1)
```

## VK_EXT_LINE_RASTERIZATION_EXTENSION_NAME

```lisp
(defconstant vk_ext_line_rasterization_extension_name VK_EXT_line_rasterization)
```

## VK_EXT_shader_atomic_float

```lisp
(defconstant vk_ext_shader_atomic_float 1)
```

## VK_EXT_SHADER_ATOMIC_FLOAT_SPEC_VERSION

```lisp
(defconstant vk_ext_shader_atomic_float_spec_version 1)
```

## VK_EXT_SHADER_ATOMIC_FLOAT_EXTENSION_NAME

```lisp
(defconstant vk_ext_shader_atomic_float_extension_name VK_EXT_shader_atomic_float)
```

## VK_EXT_host_query_reset

```lisp
(defconstant vk_ext_host_query_reset 1)
```

## VK_EXT_HOST_QUERY_RESET_SPEC_VERSION

```lisp
(defconstant vk_ext_host_query_reset_spec_version 1)
```

## VK_EXT_HOST_QUERY_RESET_EXTENSION_NAME

```lisp
(defconstant vk_ext_host_query_reset_extension_name VK_EXT_host_query_reset)
```

## VK_EXT_index_type_uint8

```lisp
(defconstant vk_ext_index_type_uint8 1)
```

## VK_EXT_INDEX_TYPE_UINT8_SPEC_VERSION

```lisp
(defconstant vk_ext_index_type_uint8_spec_version 1)
```

## VK_EXT_INDEX_TYPE_UINT8_EXTENSION_NAME

```lisp
(defconstant vk_ext_index_type_uint8_extension_name VK_EXT_index_type_uint8)
```

## VK_EXT_extended_dynamic_state

```lisp
(defconstant vk_ext_extended_dynamic_state 1)
```

## VK_EXT_EXTENDED_DYNAMIC_STATE_SPEC_VERSION

```lisp
(defconstant vk_ext_extended_dynamic_state_spec_version 1)
```

## VK_EXT_EXTENDED_DYNAMIC_STATE_EXTENSION_NAME

```lisp
(defconstant vk_ext_extended_dynamic_state_extension_name VK_EXT_extended_dynamic_state)
```

## VK_EXT_shader_atomic_float2

```lisp
(defconstant vk_ext_shader_atomic_float2 1)
```

## VK_EXT_SHADER_ATOMIC_FLOAT_2_SPEC_VERSION

```lisp
(defconstant vk_ext_shader_atomic_float_2_spec_version 1)
```

## VK_EXT_SHADER_ATOMIC_FLOAT_2_EXTENSION_NAME

```lisp
(defconstant vk_ext_shader_atomic_float_2_extension_name VK_EXT_shader_atomic_float2)
```

## VK_EXT_shader_demote_to_helper_invocation

```lisp
(defconstant vk_ext_shader_demote_to_helper_invocation 1)
```

## VK_EXT_SHADER_DEMOTE_TO_HELPER_INVOCATION_SPEC_VERSION

```lisp
(defconstant vk_ext_shader_demote_to_helper_invocation_spec_version 1)
```

## VK_EXT_SHADER_DEMOTE_TO_HELPER_INVOCATION_EXTENSION_NAME

```lisp
(defconstant vk_ext_shader_demote_to_helper_invocation_extension_name VK_EXT_shader_demote_to_helper_invocation)
```

## VK_NV_device_generated_commands

```lisp
(defconstant vk_nv_device_generated_commands 1)
```

## VK_NV_DEVICE_GENERATED_COMMANDS_SPEC_VERSION

```lisp
(defconstant vk_nv_device_generated_commands_spec_version 3)
```

## VK_NV_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME

```lisp
(defconstant vk_nv_device_generated_commands_extension_name VK_NV_device_generated_commands)
```

## VK_NV_inherited_viewport_scissor

```lisp
(defconstant vk_nv_inherited_viewport_scissor 1)
```

## VK_NV_INHERITED_VIEWPORT_SCISSOR_SPEC_VERSION

```lisp
(defconstant vk_nv_inherited_viewport_scissor_spec_version 1)
```

## VK_NV_INHERITED_VIEWPORT_SCISSOR_EXTENSION_NAME

```lisp
(defconstant vk_nv_inherited_viewport_scissor_extension_name VK_NV_inherited_viewport_scissor)
```

## VK_EXT_texel_buffer_alignment

```lisp
(defconstant vk_ext_texel_buffer_alignment 1)
```

## VK_EXT_TEXEL_BUFFER_ALIGNMENT_SPEC_VERSION

```lisp
(defconstant vk_ext_texel_buffer_alignment_spec_version 1)
```

## VK_EXT_TEXEL_BUFFER_ALIGNMENT_EXTENSION_NAME

```lisp
(defconstant vk_ext_texel_buffer_alignment_extension_name VK_EXT_texel_buffer_alignment)
```

## VK_QCOM_render_pass_transform

```lisp
(defconstant vk_qcom_render_pass_transform 1)
```

## VK_QCOM_RENDER_PASS_TRANSFORM_SPEC_VERSION

```lisp
(defconstant vk_qcom_render_pass_transform_spec_version 2)
```

## VK_QCOM_RENDER_PASS_TRANSFORM_EXTENSION_NAME

```lisp
(defconstant vk_qcom_render_pass_transform_extension_name VK_QCOM_render_pass_transform)
```

## VK_EXT_device_memory_report

```lisp
(defconstant vk_ext_device_memory_report 1)
```

## VK_EXT_DEVICE_MEMORY_REPORT_SPEC_VERSION

```lisp
(defconstant vk_ext_device_memory_report_spec_version 2)
```

## VK_EXT_DEVICE_MEMORY_REPORT_EXTENSION_NAME

```lisp
(defconstant vk_ext_device_memory_report_extension_name VK_EXT_device_memory_report)
```

## VK_EXT_acquire_drm_display

```lisp
(defconstant vk_ext_acquire_drm_display 1)
```

## VK_EXT_ACQUIRE_DRM_DISPLAY_SPEC_VERSION

```lisp
(defconstant vk_ext_acquire_drm_display_spec_version 1)
```

## VK_EXT_ACQUIRE_DRM_DISPLAY_EXTENSION_NAME

```lisp
(defconstant vk_ext_acquire_drm_display_extension_name VK_EXT_acquire_drm_display)
```

## VK_EXT_robustness2

```lisp
(defconstant vk_ext_robustness2 1)
```

## VK_EXT_ROBUSTNESS_2_SPEC_VERSION

```lisp
(defconstant vk_ext_robustness_2_spec_version 1)
```

## VK_EXT_ROBUSTNESS_2_EXTENSION_NAME

```lisp
(defconstant vk_ext_robustness_2_extension_name VK_EXT_robustness2)
```

## VK_EXT_custom_border_color

```lisp
(defconstant vk_ext_custom_border_color 1)
```

## VK_EXT_CUSTOM_BORDER_COLOR_SPEC_VERSION

```lisp
(defconstant vk_ext_custom_border_color_spec_version 12)
```

## VK_EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME

```lisp
(defconstant vk_ext_custom_border_color_extension_name VK_EXT_custom_border_color)
```

## VK_GOOGLE_user_type

```lisp
(defconstant vk_google_user_type 1)
```

## VK_GOOGLE_USER_TYPE_SPEC_VERSION

```lisp
(defconstant vk_google_user_type_spec_version 1)
```

## VK_GOOGLE_USER_TYPE_EXTENSION_NAME

```lisp
(defconstant vk_google_user_type_extension_name VK_GOOGLE_user_type)
```

## VK_EXT_private_data

```lisp
(defconstant vk_ext_private_data 1)
```

## VK_EXT_PRIVATE_DATA_SPEC_VERSION

```lisp
(defconstant vk_ext_private_data_spec_version 1)
```

## VK_EXT_PRIVATE_DATA_EXTENSION_NAME

```lisp
(defconstant vk_ext_private_data_extension_name VK_EXT_private_data)
```

## VK_EXT_pipeline_creation_cache_control

```lisp
(defconstant vk_ext_pipeline_creation_cache_control 1)
```

## VK_EXT_PIPELINE_CREATION_CACHE_CONTROL_SPEC_VERSION

```lisp
(defconstant vk_ext_pipeline_creation_cache_control_spec_version 3)
```

## VK_EXT_PIPELINE_CREATION_CACHE_CONTROL_EXTENSION_NAME

```lisp
(defconstant vk_ext_pipeline_creation_cache_control_extension_name VK_EXT_pipeline_creation_cache_control)
```

## VK_NV_device_diagnostics_config

```lisp
(defconstant vk_nv_device_diagnostics_config 1)
```

## VK_NV_DEVICE_DIAGNOSTICS_CONFIG_SPEC_VERSION

```lisp
(defconstant vk_nv_device_diagnostics_config_spec_version 2)
```

## VK_NV_DEVICE_DIAGNOSTICS_CONFIG_EXTENSION_NAME

```lisp
(defconstant vk_nv_device_diagnostics_config_extension_name VK_NV_device_diagnostics_config)
```

## VK_QCOM_render_pass_store_ops

```lisp
(defconstant vk_qcom_render_pass_store_ops 1)
```

## VK_QCOM_RENDER_PASS_STORE_OPS_SPEC_VERSION

```lisp
(defconstant vk_qcom_render_pass_store_ops_spec_version 2)
```

## VK_QCOM_RENDER_PASS_STORE_OPS_EXTENSION_NAME

```lisp
(defconstant vk_qcom_render_pass_store_ops_extension_name VK_QCOM_render_pass_store_ops)
```

## VK_EXT_graphics_pipeline_library

```lisp
(defconstant vk_ext_graphics_pipeline_library 1)
```

## VK_EXT_GRAPHICS_PIPELINE_LIBRARY_SPEC_VERSION

```lisp
(defconstant vk_ext_graphics_pipeline_library_spec_version 1)
```

## VK_EXT_GRAPHICS_PIPELINE_LIBRARY_EXTENSION_NAME

```lisp
(defconstant vk_ext_graphics_pipeline_library_extension_name VK_EXT_graphics_pipeline_library)
```

## VK_AMD_shader_early_and_late_fragment_tests

```lisp
(defconstant vk_amd_shader_early_and_late_fragment_tests 1)
```

## VK_AMD_SHADER_EARLY_AND_LATE_FRAGMENT_TESTS_SPEC_VERSION

```lisp
(defconstant vk_amd_shader_early_and_late_fragment_tests_spec_version 1)
```

## VK_AMD_SHADER_EARLY_AND_LATE_FRAGMENT_TESTS_EXTENSION_NAME

```lisp
(defconstant vk_amd_shader_early_and_late_fragment_tests_extension_name VK_AMD_shader_early_and_late_fragment_tests)
```

## VK_NV_fragment_shading_rate_enums

```lisp
(defconstant vk_nv_fragment_shading_rate_enums 1)
```

## VK_NV_FRAGMENT_SHADING_RATE_ENUMS_SPEC_VERSION

```lisp
(defconstant vk_nv_fragment_shading_rate_enums_spec_version 1)
```

## VK_NV_FRAGMENT_SHADING_RATE_ENUMS_EXTENSION_NAME

```lisp
(defconstant vk_nv_fragment_shading_rate_enums_extension_name VK_NV_fragment_shading_rate_enums)
```

## VK_NV_ray_tracing_motion_blur

```lisp
(defconstant vk_nv_ray_tracing_motion_blur 1)
```

## VK_NV_RAY_TRACING_MOTION_BLUR_SPEC_VERSION

```lisp
(defconstant vk_nv_ray_tracing_motion_blur_spec_version 1)
```

## VK_NV_RAY_TRACING_MOTION_BLUR_EXTENSION_NAME

```lisp
(defconstant vk_nv_ray_tracing_motion_blur_extension_name VK_NV_ray_tracing_motion_blur)
```

## VK_EXT_ycbcr_2plane_444_formats

```lisp
(defconstant vk_ext_ycbcr_2plane_444_formats 1)
```

## VK_EXT_YCBCR_2PLANE_444_FORMATS_SPEC_VERSION

```lisp
(defconstant vk_ext_ycbcr_2plane_444_formats_spec_version 1)
```

## VK_EXT_YCBCR_2PLANE_444_FORMATS_EXTENSION_NAME

```lisp
(defconstant vk_ext_ycbcr_2plane_444_formats_extension_name VK_EXT_ycbcr_2plane_444_formats)
```

## VK_EXT_fragment_density_map2

```lisp
(defconstant vk_ext_fragment_density_map2 1)
```

## VK_EXT_FRAGMENT_DENSITY_MAP_2_SPEC_VERSION

```lisp
(defconstant vk_ext_fragment_density_map_2_spec_version 1)
```

## VK_EXT_FRAGMENT_DENSITY_MAP_2_EXTENSION_NAME

```lisp
(defconstant vk_ext_fragment_density_map_2_extension_name VK_EXT_fragment_density_map2)
```

## VK_QCOM_rotated_copy_commands

```lisp
(defconstant vk_qcom_rotated_copy_commands 1)
```

## VK_QCOM_ROTATED_COPY_COMMANDS_SPEC_VERSION

```lisp
(defconstant vk_qcom_rotated_copy_commands_spec_version 1)
```

## VK_QCOM_ROTATED_COPY_COMMANDS_EXTENSION_NAME

```lisp
(defconstant vk_qcom_rotated_copy_commands_extension_name VK_QCOM_rotated_copy_commands)
```

## VK_EXT_image_robustness

```lisp
(defconstant vk_ext_image_robustness 1)
```

## VK_EXT_IMAGE_ROBUSTNESS_SPEC_VERSION

```lisp
(defconstant vk_ext_image_robustness_spec_version 1)
```

## VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME

```lisp
(defconstant vk_ext_image_robustness_extension_name VK_EXT_image_robustness)
```

## VK_EXT_image_compression_control

```lisp
(defconstant vk_ext_image_compression_control 1)
```

## VK_EXT_IMAGE_COMPRESSION_CONTROL_SPEC_VERSION

```lisp
(defconstant vk_ext_image_compression_control_spec_version 1)
```

## VK_EXT_IMAGE_COMPRESSION_CONTROL_EXTENSION_NAME

```lisp
(defconstant vk_ext_image_compression_control_extension_name VK_EXT_image_compression_control)
```

## VK_EXT_4444_formats

```lisp
(defconstant vk_ext_4444_formats 1)
```

## VK_EXT_4444_FORMATS_SPEC_VERSION

```lisp
(defconstant vk_ext_4444_formats_spec_version 1)
```

## VK_EXT_4444_FORMATS_EXTENSION_NAME

```lisp
(defconstant vk_ext_4444_formats_extension_name VK_EXT_4444_formats)
```

## VK_ARM_rasterization_order_attachment_access

```lisp
(defconstant vk_arm_rasterization_order_attachment_access 1)
```

## VK_ARM_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_SPEC_VERSION

```lisp
(defconstant vk_arm_rasterization_order_attachment_access_spec_version 1)
```

## VK_ARM_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_EXTENSION_NAME

```lisp
(defconstant vk_arm_rasterization_order_attachment_access_extension_name VK_ARM_rasterization_order_attachment_access)
```

## VK_EXT_rgba10x6_formats

```lisp
(defconstant vk_ext_rgba10x6_formats 1)
```

## VK_EXT_RGBA10X6_FORMATS_SPEC_VERSION

```lisp
(defconstant vk_ext_rgba10x6_formats_spec_version 1)
```

## VK_EXT_RGBA10X6_FORMATS_EXTENSION_NAME

```lisp
(defconstant vk_ext_rgba10x6_formats_extension_name VK_EXT_rgba10x6_formats)
```

## VK_NV_acquire_winrt_display

```lisp
(defconstant vk_nv_acquire_winrt_display 1)
```

## VK_NV_ACQUIRE_WINRT_DISPLAY_SPEC_VERSION

```lisp
(defconstant vk_nv_acquire_winrt_display_spec_version 1)
```

## VK_NV_ACQUIRE_WINRT_DISPLAY_EXTENSION_NAME

```lisp
(defconstant vk_nv_acquire_winrt_display_extension_name VK_NV_acquire_winrt_display)
```

## VK_VALVE_mutable_descriptor_type

```lisp
(defconstant vk_valve_mutable_descriptor_type 1)
```

## VK_VALVE_MUTABLE_DESCRIPTOR_TYPE_SPEC_VERSION

```lisp
(defconstant vk_valve_mutable_descriptor_type_spec_version 1)
```

## VK_VALVE_MUTABLE_DESCRIPTOR_TYPE_EXTENSION_NAME

```lisp
(defconstant vk_valve_mutable_descriptor_type_extension_name VK_VALVE_mutable_descriptor_type)
```

## VK_EXT_vertex_input_dynamic_state

```lisp
(defconstant vk_ext_vertex_input_dynamic_state 1)
```

## VK_EXT_VERTEX_INPUT_DYNAMIC_STATE_SPEC_VERSION

```lisp
(defconstant vk_ext_vertex_input_dynamic_state_spec_version 2)
```

## VK_EXT_VERTEX_INPUT_DYNAMIC_STATE_EXTENSION_NAME

```lisp
(defconstant vk_ext_vertex_input_dynamic_state_extension_name VK_EXT_vertex_input_dynamic_state)
```

## VK_EXT_physical_device_drm

```lisp
(defconstant vk_ext_physical_device_drm 1)
```

## VK_EXT_PHYSICAL_DEVICE_DRM_SPEC_VERSION

```lisp
(defconstant vk_ext_physical_device_drm_spec_version 1)
```

## VK_EXT_PHYSICAL_DEVICE_DRM_EXTENSION_NAME

```lisp
(defconstant vk_ext_physical_device_drm_extension_name VK_EXT_physical_device_drm)
```

## VK_EXT_depth_clip_control

```lisp
(defconstant vk_ext_depth_clip_control 1)
```

## VK_EXT_DEPTH_CLIP_CONTROL_SPEC_VERSION

```lisp
(defconstant vk_ext_depth_clip_control_spec_version 1)
```

## VK_EXT_DEPTH_CLIP_CONTROL_EXTENSION_NAME

```lisp
(defconstant vk_ext_depth_clip_control_extension_name VK_EXT_depth_clip_control)
```

## VK_EXT_primitive_topology_list_restart

```lisp
(defconstant vk_ext_primitive_topology_list_restart 1)
```

## VK_EXT_PRIMITIVE_TOPOLOGY_LIST_RESTART_SPEC_VERSION

```lisp
(defconstant vk_ext_primitive_topology_list_restart_spec_version 1)
```

## VK_EXT_PRIMITIVE_TOPOLOGY_LIST_RESTART_EXTENSION_NAME

```lisp
(defconstant vk_ext_primitive_topology_list_restart_extension_name VK_EXT_primitive_topology_list_restart)
```

## VK_HUAWEI_subpass_shading

```lisp
(defconstant vk_huawei_subpass_shading 1)
```

## VK_HUAWEI_SUBPASS_SHADING_SPEC_VERSION

```lisp
(defconstant vk_huawei_subpass_shading_spec_version 2)
```

## VK_HUAWEI_SUBPASS_SHADING_EXTENSION_NAME

```lisp
(defconstant vk_huawei_subpass_shading_extension_name VK_HUAWEI_subpass_shading)
```

## VK_HUAWEI_invocation_mask

```lisp
(defconstant vk_huawei_invocation_mask 1)
```

## VK_HUAWEI_INVOCATION_MASK_SPEC_VERSION

```lisp
(defconstant vk_huawei_invocation_mask_spec_version 1)
```

## VK_HUAWEI_INVOCATION_MASK_EXTENSION_NAME

```lisp
(defconstant vk_huawei_invocation_mask_extension_name VK_HUAWEI_invocation_mask)
```

## VK_NV_external_memory_rdma

```lisp
(defconstant vk_nv_external_memory_rdma 1)
```

## VK_NV_EXTERNAL_MEMORY_RDMA_SPEC_VERSION

```lisp
(defconstant vk_nv_external_memory_rdma_spec_version 1)
```

## VK_NV_EXTERNAL_MEMORY_RDMA_EXTENSION_NAME

```lisp
(defconstant vk_nv_external_memory_rdma_extension_name VK_NV_external_memory_rdma)
```

## VK_EXT_pipeline_properties

```lisp
(defconstant vk_ext_pipeline_properties 1)
```

## VK_EXT_PIPELINE_PROPERTIES_SPEC_VERSION

```lisp
(defconstant vk_ext_pipeline_properties_spec_version 1)
```

## VK_EXT_PIPELINE_PROPERTIES_EXTENSION_NAME

```lisp
(defconstant vk_ext_pipeline_properties_extension_name VK_EXT_pipeline_properties)
```

## VK_EXT_extended_dynamic_state2

```lisp
(defconstant vk_ext_extended_dynamic_state2 1)
```

## VK_EXT_EXTENDED_DYNAMIC_STATE_2_SPEC_VERSION

```lisp
(defconstant vk_ext_extended_dynamic_state_2_spec_version 1)
```

## VK_EXT_EXTENDED_DYNAMIC_STATE_2_EXTENSION_NAME

```lisp
(defconstant vk_ext_extended_dynamic_state_2_extension_name VK_EXT_extended_dynamic_state2)
```

## VK_EXT_color_write_enable

```lisp
(defconstant vk_ext_color_write_enable 1)
```

## VK_EXT_COLOR_WRITE_ENABLE_SPEC_VERSION

```lisp
(defconstant vk_ext_color_write_enable_spec_version 1)
```

## VK_EXT_COLOR_WRITE_ENABLE_EXTENSION_NAME

```lisp
(defconstant vk_ext_color_write_enable_extension_name VK_EXT_color_write_enable)
```

## VK_EXT_primitives_generated_query

```lisp
(defconstant vk_ext_primitives_generated_query 1)
```

## VK_EXT_PRIMITIVES_GENERATED_QUERY_SPEC_VERSION

```lisp
(defconstant vk_ext_primitives_generated_query_spec_version 1)
```

## VK_EXT_PRIMITIVES_GENERATED_QUERY_EXTENSION_NAME

```lisp
(defconstant vk_ext_primitives_generated_query_extension_name VK_EXT_primitives_generated_query)
```

## VK_EXT_global_priority_query

```lisp
(defconstant vk_ext_global_priority_query 1)
```

## VK_EXT_GLOBAL_PRIORITY_QUERY_SPEC_VERSION

```lisp
(defconstant vk_ext_global_priority_query_spec_version 1)
```

## VK_EXT_GLOBAL_PRIORITY_QUERY_EXTENSION_NAME

```lisp
(defconstant vk_ext_global_priority_query_extension_name VK_EXT_global_priority_query)
```

## VK_MAX_GLOBAL_PRIORITY_SIZE_EXT

```lisp
(defconstant vk_max_global_priority_size_ext VK_MAX_GLOBAL_PRIORITY_SIZE_KHR)
```

## VK_EXT_image_view_min_lod

```lisp
(defconstant vk_ext_image_view_min_lod 1)
```

## VK_EXT_IMAGE_VIEW_MIN_LOD_SPEC_VERSION

```lisp
(defconstant vk_ext_image_view_min_lod_spec_version 1)
```

## VK_EXT_IMAGE_VIEW_MIN_LOD_EXTENSION_NAME

```lisp
(defconstant vk_ext_image_view_min_lod_extension_name VK_EXT_image_view_min_lod)
```

## VK_EXT_multi_draw

```lisp
(defconstant vk_ext_multi_draw 1)
```

## VK_EXT_MULTI_DRAW_SPEC_VERSION

```lisp
(defconstant vk_ext_multi_draw_spec_version 1)
```

## VK_EXT_MULTI_DRAW_EXTENSION_NAME

```lisp
(defconstant vk_ext_multi_draw_extension_name VK_EXT_multi_draw)
```

## VK_EXT_image_2d_view_of_3d

```lisp
(defconstant vk_ext_image_2d_view_of_3d 1)
```

## VK_EXT_IMAGE_2D_VIEW_OF_3D_SPEC_VERSION

```lisp
(defconstant vk_ext_image_2d_view_of_3d_spec_version 1)
```

## VK_EXT_IMAGE_2D_VIEW_OF_3D_EXTENSION_NAME

```lisp
(defconstant vk_ext_image_2d_view_of_3d_extension_name VK_EXT_image_2d_view_of_3d)
```

## VK_EXT_load_store_op_none

```lisp
(defconstant vk_ext_load_store_op_none 1)
```

## VK_EXT_LOAD_STORE_OP_NONE_SPEC_VERSION

```lisp
(defconstant vk_ext_load_store_op_none_spec_version 1)
```

## VK_EXT_LOAD_STORE_OP_NONE_EXTENSION_NAME

```lisp
(defconstant vk_ext_load_store_op_none_extension_name VK_EXT_load_store_op_none)
```

## VK_EXT_border_color_swizzle

```lisp
(defconstant vk_ext_border_color_swizzle 1)
```

## VK_EXT_BORDER_COLOR_SWIZZLE_SPEC_VERSION

```lisp
(defconstant vk_ext_border_color_swizzle_spec_version 1)
```

## VK_EXT_BORDER_COLOR_SWIZZLE_EXTENSION_NAME

```lisp
(defconstant vk_ext_border_color_swizzle_extension_name VK_EXT_border_color_swizzle)
```

## VK_EXT_pageable_device_local_memory

```lisp
(defconstant vk_ext_pageable_device_local_memory 1)
```

## VK_EXT_PAGEABLE_DEVICE_LOCAL_MEMORY_SPEC_VERSION

```lisp
(defconstant vk_ext_pageable_device_local_memory_spec_version 1)
```

## VK_EXT_PAGEABLE_DEVICE_LOCAL_MEMORY_EXTENSION_NAME

```lisp
(defconstant vk_ext_pageable_device_local_memory_extension_name VK_EXT_pageable_device_local_memory)
```

## VK_VALVE_descriptor_set_host_mapping

```lisp
(defconstant vk_valve_descriptor_set_host_mapping 1)
```

## VK_VALVE_DESCRIPTOR_SET_HOST_MAPPING_SPEC_VERSION

```lisp
(defconstant vk_valve_descriptor_set_host_mapping_spec_version 1)
```

## VK_VALVE_DESCRIPTOR_SET_HOST_MAPPING_EXTENSION_NAME

```lisp
(defconstant vk_valve_descriptor_set_host_mapping_extension_name VK_VALVE_descriptor_set_host_mapping)
```

## VK_QCOM_fragment_density_map_offset

```lisp
(defconstant vk_qcom_fragment_density_map_offset 1)
```

## VK_QCOM_FRAGMENT_DENSITY_MAP_OFFSET_SPEC_VERSION

```lisp
(defconstant vk_qcom_fragment_density_map_offset_spec_version 1)
```

## VK_QCOM_FRAGMENT_DENSITY_MAP_OFFSET_EXTENSION_NAME

```lisp
(defconstant vk_qcom_fragment_density_map_offset_extension_name VK_QCOM_fragment_density_map_offset)
```

## VK_NV_linear_color_attachment

```lisp
(defconstant vk_nv_linear_color_attachment 1)
```

## VK_NV_LINEAR_COLOR_ATTACHMENT_SPEC_VERSION

```lisp
(defconstant vk_nv_linear_color_attachment_spec_version 1)
```

## VK_NV_LINEAR_COLOR_ATTACHMENT_EXTENSION_NAME

```lisp
(defconstant vk_nv_linear_color_attachment_extension_name VK_NV_linear_color_attachment)
```

## VK_GOOGLE_surfaceless_query

```lisp
(defconstant vk_google_surfaceless_query 1)
```

## VK_GOOGLE_SURFACELESS_QUERY_SPEC_VERSION

```lisp
(defconstant vk_google_surfaceless_query_spec_version 1)
```

## VK_GOOGLE_SURFACELESS_QUERY_EXTENSION_NAME

```lisp
(defconstant vk_google_surfaceless_query_extension_name VK_GOOGLE_surfaceless_query)
```

## VK_EXT_image_compression_control_swapchain

```lisp
(defconstant vk_ext_image_compression_control_swapchain 1)
```

## VK_EXT_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_SPEC_VERSION

```lisp
(defconstant vk_ext_image_compression_control_swapchain_spec_version 1)
```

## VK_EXT_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_EXTENSION_NAME

```lisp
(defconstant vk_ext_image_compression_control_swapchain_extension_name VK_EXT_image_compression_control_swapchain)
```

## VK_EXT_subpass_merge_feedback

```lisp
(defconstant vk_ext_subpass_merge_feedback 1)
```

## VK_EXT_SUBPASS_MERGE_FEEDBACK_SPEC_VERSION

```lisp
(defconstant vk_ext_subpass_merge_feedback_spec_version 2)
```

## VK_EXT_SUBPASS_MERGE_FEEDBACK_EXTENSION_NAME

```lisp
(defconstant vk_ext_subpass_merge_feedback_extension_name VK_EXT_subpass_merge_feedback)
```

## VK_KHR_acceleration_structure

```lisp
(defconstant vk_khr_acceleration_structure 1)
```

## VK_KHR_ACCELERATION_STRUCTURE_SPEC_VERSION

```lisp
(defconstant vk_khr_acceleration_structure_spec_version 13)
```

## VK_KHR_ACCELERATION_STRUCTURE_EXTENSION_NAME

```lisp
(defconstant vk_khr_acceleration_structure_extension_name VK_KHR_acceleration_structure)
```

## VK_KHR_ray_tracing_pipeline

```lisp
(defconstant vk_khr_ray_tracing_pipeline 1)
```

## VK_KHR_RAY_TRACING_PIPELINE_SPEC_VERSION

```lisp
(defconstant vk_khr_ray_tracing_pipeline_spec_version 1)
```

## VK_KHR_RAY_TRACING_PIPELINE_EXTENSION_NAME

```lisp
(defconstant vk_khr_ray_tracing_pipeline_extension_name VK_KHR_ray_tracing_pipeline)
```

## VK_KHR_ray_query

```lisp
(defconstant vk_khr_ray_query 1)
```

## VK_KHR_RAY_QUERY_SPEC_VERSION

```lisp
(defconstant vk_khr_ray_query_spec_version 1)
```

## VK_KHR_RAY_QUERY_EXTENSION_NAME

```lisp
(defconstant vk_khr_ray_query_extension_name VK_KHR_ray_query)
```

