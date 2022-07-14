
(in-package :cvk)

(mcffi:def-foreign-enum "VkResult" doc-file 
    success 0
    not-ready 1
    timeout 2
    event-set 3
    event-reset 4
    incomplete 5
    error-out-of-host-memory -1
    error-out-of-device-memory -2
    error-initialization-failed -3
    error-device-lost -4
    error-memory-map-failed -5
    error-layer-not-present -6
    error-extension-not-present -7
    error-feature-not-present -8
    error-incompatible-driver -9
    error-too-many-objects -10
    error-format-not-supported -11
    error-fragmented-pool -12
    error-unknown -13
    error-out-of-pool-memory -1000069000
    error-invalid-external-handle -1000072003
    error-fragmentation -1000161000
    error-invalid-opaque-capture-address -1000257000
    pipeline-compile-required 1000297000
    error-surface-lost-khr -1000000000
    error-native-window-in-use-khr -1000000001
    suboptimal-khr 1000001003
    error-out-of-date-khr -1000001004
    error-incompatible-display-khr -1000003001
    error-validation-failed-ext -1000011001
    error-invalid-shader-nv -1000012000
    error-invalid-drm-format-modifier-plane-layout-ext -1000158000
    error-not-permitted-khr -1000174001
    error-full-screen-exclusive-mode-lost-ext -1000255000
    thread-idle-khr 1000268000
    thread-done-khr 1000268001
    operation-deferred-khr 1000268002
    operation-not-deferred-khr 1000268003
    error-compression-exhausted-ext -1000338000
    error-out-of-pool-memory-khr error-out-of-pool-memory
    error-invalid-external-handle-khr error-invalid-external-handle
    error-fragmentation-ext error-fragmentation
    error-not-permitted-ext error-not-permitted-khr
    error-invalid-device-address-ext error-invalid-opaque-capture-address
    error-invalid-opaque-capture-address-khr error-invalid-opaque-capture-address
    pipeline-compile-required-ext pipeline-compile-required
    error-pipeline-compile-required-ext pipeline-compile-required
    result-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkStructureType" doc-file 
    structure-type-application-info 0
    structure-type-instance-create-info 1
    structure-type-device-queue-create-info 2
    structure-type-device-create-info 3
    structure-type-submit-info 4
    structure-type-memory-allocate-info 5
    structure-type-mapped-memory-range 6
    structure-type-bind-sparse-info 7
    structure-type-fence-create-info 8
    structure-type-semaphore-create-info 9
    structure-type-event-create-info 10
    structure-type-query-pool-create-info 11
    structure-type-buffer-create-info 12
    structure-type-buffer-view-create-info 13
    structure-type-image-create-info 14
    structure-type-image-view-create-info 15
    structure-type-shader-module-create-info 16
    structure-type-pipeline-cache-create-info 17
    structure-type-pipeline-shader-stage-create-info 18
    structure-type-pipeline-vertex-input-state-create-info 19
    structure-type-pipeline-input-assembly-state-create-info 20
    structure-type-pipeline-tessellation-state-create-info 21
    structure-type-pipeline-viewport-state-create-info 22
    structure-type-pipeline-rasterization-state-create-info 23
    structure-type-pipeline-multisample-state-create-info 24
    structure-type-pipeline-depth-stencil-state-create-info 25
    structure-type-pipeline-color-blend-state-create-info 26
    structure-type-pipeline-dynamic-state-create-info 27
    structure-type-graphics-pipeline-create-info 28
    structure-type-compute-pipeline-create-info 29
    structure-type-pipeline-layout-create-info 30
    structure-type-sampler-create-info 31
    structure-type-descriptor-set-layout-create-info 32
    structure-type-descriptor-pool-create-info 33
    structure-type-descriptor-set-allocate-info 34
    structure-type-write-descriptor-set 35
    structure-type-copy-descriptor-set 36
    structure-type-framebuffer-create-info 37
    structure-type-render-pass-create-info 38
    structure-type-command-pool-create-info 39
    structure-type-command-buffer-allocate-info 40
    structure-type-command-buffer-inheritance-info 41
    structure-type-command-buffer-begin-info 42
    structure-type-render-pass-begin-info 43
    structure-type-buffer-memory-barrier 44
    structure-type-image-memory-barrier 45
    structure-type-memory-barrier 46
    structure-type-loader-instance-create-info 47
    structure-type-loader-device-create-info 48
    structure-type-physical-device-subgroup-properties 1000094000
    structure-type-bind-buffer-memory-info 1000157000
    structure-type-bind-image-memory-info 1000157001
    structure-type-physical-device-16bit-storage-features 1000083000
    structure-type-memory-dedicated-requirements 1000127000
    structure-type-memory-dedicated-allocate-info 1000127001
    structure-type-memory-allocate-flags-info 1000060000
    structure-type-device-group-render-pass-begin-info 1000060003
    structure-type-device-group-command-buffer-begin-info 1000060004
    structure-type-device-group-submit-info 1000060005
    structure-type-device-group-bind-sparse-info 1000060006
    structure-type-bind-buffer-memory-device-group-info 1000060013
    structure-type-bind-image-memory-device-group-info 1000060014
    structure-type-physical-device-group-properties 1000070000
    structure-type-device-group-device-create-info 1000070001
    structure-type-buffer-memory-requirements-info-2 1000146000
    structure-type-image-memory-requirements-info-2 1000146001
    structure-type-image-sparse-memory-requirements-info-2 1000146002
    structure-type-memory-requirements-2 1000146003
    structure-type-sparse-image-memory-requirements-2 1000146004
    structure-type-physical-device-features-2 1000059000
    structure-type-physical-device-properties-2 1000059001
    structure-type-format-properties-2 1000059002
    structure-type-image-format-properties-2 1000059003
    structure-type-physical-device-image-format-info-2 1000059004
    structure-type-queue-family-properties-2 1000059005
    structure-type-physical-device-memory-properties-2 1000059006
    structure-type-sparse-image-format-properties-2 1000059007
    structure-type-physical-device-sparse-image-format-info-2 1000059008
    structure-type-physical-device-point-clipping-properties 1000117000
    structure-type-render-pass-input-attachment-aspect-create-info 1000117001
    structure-type-image-view-usage-create-info 1000117002
    structure-type-pipeline-tessellation-domain-origin-state-create-info 1000117003
    structure-type-render-pass-multiview-create-info 1000053000
    structure-type-physical-device-multiview-features 1000053001
    structure-type-physical-device-multiview-properties 1000053002
    structure-type-physical-device-variable-pointers-features 1000120000
    structure-type-protected-submit-info 1000145000
    structure-type-physical-device-protected-memory-features 1000145001
    structure-type-physical-device-protected-memory-properties 1000145002
    structure-type-device-queue-info-2 1000145003
    structure-type-sampler-ycbcr-conversion-create-info 1000156000
    structure-type-sampler-ycbcr-conversion-info 1000156001
    structure-type-bind-image-plane-memory-info 1000156002
    structure-type-image-plane-memory-requirements-info 1000156003
    structure-type-physical-device-sampler-ycbcr-conversion-features 1000156004
    structure-type-sampler-ycbcr-conversion-image-format-properties 1000156005
    structure-type-descriptor-update-template-create-info 1000085000
    structure-type-physical-device-external-image-format-info 1000071000
    structure-type-external-image-format-properties 1000071001
    structure-type-physical-device-external-buffer-info 1000071002
    structure-type-external-buffer-properties 1000071003
    structure-type-physical-device-id-properties 1000071004
    structure-type-external-memory-buffer-create-info 1000072000
    structure-type-external-memory-image-create-info 1000072001
    structure-type-export-memory-allocate-info 1000072002
    structure-type-physical-device-external-fence-info 1000112000
    structure-type-external-fence-properties 1000112001
    structure-type-export-fence-create-info 1000113000
    structure-type-export-semaphore-create-info 1000077000
    structure-type-physical-device-external-semaphore-info 1000076000
    structure-type-external-semaphore-properties 1000076001
    structure-type-physical-device-maintenance-3-properties 1000168000
    structure-type-descriptor-set-layout-support 1000168001
    structure-type-physical-device-shader-draw-parameters-features 1000063000
    structure-type-physical-device-vulkan-1-1-features 49
    structure-type-physical-device-vulkan-1-1-properties 50
    structure-type-physical-device-vulkan-1-2-features 51
    structure-type-physical-device-vulkan-1-2-properties 52
    structure-type-image-format-list-create-info 1000147000
    structure-type-attachment-description-2 1000109000
    structure-type-attachment-reference-2 1000109001
    structure-type-subpass-description-2 1000109002
    structure-type-subpass-dependency-2 1000109003
    structure-type-render-pass-create-info-2 1000109004
    structure-type-subpass-begin-info 1000109005
    structure-type-subpass-end-info 1000109006
    structure-type-physical-device-8bit-storage-features 1000177000
    structure-type-physical-device-driver-properties 1000196000
    structure-type-physical-device-shader-atomic-int64-features 1000180000
    structure-type-physical-device-shader-float16-int8-features 1000082000
    structure-type-physical-device-float-controls-properties 1000197000
    structure-type-descriptor-set-layout-binding-flags-create-info 1000161000
    structure-type-physical-device-descriptor-indexing-features 1000161001
    structure-type-physical-device-descriptor-indexing-properties 1000161002
    structure-type-descriptor-set-variable-descriptor-count-allocate-info 1000161003
    structure-type-descriptor-set-variable-descriptor-count-layout-support 1000161004
    structure-type-physical-device-depth-stencil-resolve-properties 1000199000
    structure-type-subpass-description-depth-stencil-resolve 1000199001
    structure-type-physical-device-scalar-block-layout-features 1000221000
    structure-type-image-stencil-usage-create-info 1000246000
    structure-type-physical-device-sampler-filter-minmax-properties 1000130000
    structure-type-sampler-reduction-mode-create-info 1000130001
    structure-type-physical-device-vulkan-memory-model-features 1000211000
    structure-type-physical-device-imageless-framebuffer-features 1000108000
    structure-type-framebuffer-attachments-create-info 1000108001
    structure-type-framebuffer-attachment-image-info 1000108002
    structure-type-render-pass-attachment-begin-info 1000108003
    structure-type-physical-device-uniform-buffer-standard-layout-features 1000253000
    structure-type-physical-device-shader-subgroup-extended-types-features 1000175000
    structure-type-physical-device-separate-depth-stencil-layouts-features 1000241000
    structure-type-attachment-reference-stencil-layout 1000241001
    structure-type-attachment-description-stencil-layout 1000241002
    structure-type-physical-device-host-query-reset-features 1000261000
    structure-type-physical-device-timeline-semaphore-features 1000207000
    structure-type-physical-device-timeline-semaphore-properties 1000207001
    structure-type-semaphore-type-create-info 1000207002
    structure-type-timeline-semaphore-submit-info 1000207003
    structure-type-semaphore-wait-info 1000207004
    structure-type-semaphore-signal-info 1000207005
    structure-type-physical-device-buffer-device-address-features 1000257000
    structure-type-buffer-device-address-info 1000244001
    structure-type-buffer-opaque-capture-address-create-info 1000257002
    structure-type-memory-opaque-capture-address-allocate-info 1000257003
    structure-type-device-memory-opaque-capture-address-info 1000257004
    structure-type-physical-device-vulkan-1-3-features 53
    structure-type-physical-device-vulkan-1-3-properties 54
    structure-type-pipeline-creation-feedback-create-info 1000192000
    structure-type-physical-device-shader-terminate-invocation-features 1000215000
    structure-type-physical-device-tool-properties 1000245000
    structure-type-physical-device-shader-demote-to-helper-invocation-features 1000276000
    structure-type-physical-device-private-data-features 1000295000
    structure-type-device-private-data-create-info 1000295001
    structure-type-private-data-slot-create-info 1000295002
    structure-type-physical-device-pipeline-creation-cache-control-features 1000297000
    structure-type-memory-barrier-2 1000314000
    structure-type-buffer-memory-barrier-2 1000314001
    structure-type-image-memory-barrier-2 1000314002
    structure-type-dependency-info 1000314003
    structure-type-submit-info-2 1000314004
    structure-type-semaphore-submit-info 1000314005
    structure-type-command-buffer-submit-info 1000314006
    structure-type-physical-device-synchronization-2-features 1000314007
    structure-type-physical-device-zero-initialize-workgroup-memory-features 1000325000
    structure-type-physical-device-image-robustness-features 1000335000
    structure-type-copy-buffer-info-2 1000337000
    structure-type-copy-image-info-2 1000337001
    structure-type-copy-buffer-to-image-info-2 1000337002
    structure-type-copy-image-to-buffer-info-2 1000337003
    structure-type-blit-image-info-2 1000337004
    structure-type-resolve-image-info-2 1000337005
    structure-type-buffer-copy-2 1000337006
    structure-type-image-copy-2 1000337007
    structure-type-image-blit-2 1000337008
    structure-type-buffer-image-copy-2 1000337009
    structure-type-image-resolve-2 1000337010
    structure-type-physical-device-subgroup-size-control-properties 1000225000
    structure-type-pipeline-shader-stage-required-subgroup-size-create-info 1000225001
    structure-type-physical-device-subgroup-size-control-features 1000225002
    structure-type-physical-device-inline-uniform-block-features 1000138000
    structure-type-physical-device-inline-uniform-block-properties 1000138001
    structure-type-write-descriptor-set-inline-uniform-block 1000138002
    structure-type-descriptor-pool-inline-uniform-block-create-info 1000138003
    structure-type-physical-device-texture-compression-astc-hdr-features 1000066000
    structure-type-rendering-info 1000044000
    structure-type-rendering-attachment-info 1000044001
    structure-type-pipeline-rendering-create-info 1000044002
    structure-type-physical-device-dynamic-rendering-features 1000044003
    structure-type-command-buffer-inheritance-rendering-info 1000044004
    structure-type-physical-device-shader-integer-dot-product-features 1000280000
    structure-type-physical-device-shader-integer-dot-product-properties 1000280001
    structure-type-physical-device-texel-buffer-alignment-properties 1000281001
    structure-type-format-properties-3 1000360000
    structure-type-physical-device-maintenance-4-features 1000413000
    structure-type-physical-device-maintenance-4-properties 1000413001
    structure-type-device-buffer-memory-requirements 1000413002
    structure-type-device-image-memory-requirements 1000413003
    structure-type-swapchain-create-info-khr 1000001000
    structure-type-present-info-khr 1000001001
    structure-type-device-group-present-capabilities-khr 1000060007
    structure-type-image-swapchain-create-info-khr 1000060008
    structure-type-bind-image-memory-swapchain-info-khr 1000060009
    structure-type-acquire-next-image-info-khr 1000060010
    structure-type-device-group-present-info-khr 1000060011
    structure-type-device-group-swapchain-create-info-khr 1000060012
    structure-type-display-mode-create-info-khr 1000002000
    structure-type-display-surface-create-info-khr 1000002001
    structure-type-display-present-info-khr 1000003000
    structure-type-xlib-surface-create-info-khr 1000004000
    structure-type-xcb-surface-create-info-khr 1000005000
    structure-type-wayland-surface-create-info-khr 1000006000
    structure-type-android-surface-create-info-khr 1000008000
    structure-type-win32-surface-create-info-khr 1000009000
    structure-type-debug-report-callback-create-info-ext 1000011000
    structure-type-pipeline-rasterization-state-rasterization-order-amd 1000018000
    structure-type-debug-marker-object-name-info-ext 1000022000
    structure-type-debug-marker-object-tag-info-ext 1000022001
    structure-type-debug-marker-marker-info-ext 1000022002
    structure-type-video-profile-khr 1000023000
    structure-type-video-capabilities-khr 1000023001
    structure-type-video-picture-resource-khr 1000023002
    structure-type-video-get-memory-properties-khr 1000023003
    structure-type-video-bind-memory-khr 1000023004
    structure-type-video-session-create-info-khr 1000023005
    structure-type-video-session-parameters-create-info-khr 1000023006
    structure-type-video-session-parameters-update-info-khr 1000023007
    structure-type-video-begin-coding-info-khr 1000023008
    structure-type-video-end-coding-info-khr 1000023009
    structure-type-video-coding-control-info-khr 1000023010
    structure-type-video-reference-slot-khr 1000023011
    structure-type-video-queue-family-properties-2-khr 1000023012
    structure-type-video-profiles-khr 1000023013
    structure-type-physical-device-video-format-info-khr 1000023014
    structure-type-video-format-properties-khr 1000023015
    structure-type-queue-family-query-result-status-properties-2-khr 1000023016
    structure-type-video-decode-info-khr 1000024000
    structure-type-video-decode-capabilities-khr 1000024001
    structure-type-dedicated-allocation-image-create-info-nv 1000026000
    structure-type-dedicated-allocation-buffer-create-info-nv 1000026001
    structure-type-dedicated-allocation-memory-allocate-info-nv 1000026002
    structure-type-physical-device-transform-feedback-features-ext 1000028000
    structure-type-physical-device-transform-feedback-properties-ext 1000028001
    structure-type-pipeline-rasterization-state-stream-create-info-ext 1000028002
    structure-type-cu-module-create-info-nvx 1000029000
    structure-type-cu-function-create-info-nvx 1000029001
    structure-type-cu-launch-info-nvx 1000029002
    structure-type-image-view-handle-info-nvx 1000030000
    structure-type-image-view-address-properties-nvx 1000030001
    structure-type-video-encode-h264-capabilities-ext 1000038000
    structure-type-video-encode-h264-session-parameters-create-info-ext 1000038001
    structure-type-video-encode-h264-session-parameters-add-info-ext 1000038002
    structure-type-video-encode-h264-vcl-frame-info-ext 1000038003
    structure-type-video-encode-h264-dpb-slot-info-ext 1000038004
    structure-type-video-encode-h264-nalu-slice-ext 1000038005
    structure-type-video-encode-h264-emit-picture-parameters-ext 1000038006
    structure-type-video-encode-h264-profile-ext 1000038007
    structure-type-video-encode-h264-rate-control-info-ext 1000038008
    structure-type-video-encode-h264-rate-control-layer-info-ext 1000038009
    structure-type-video-encode-h264-reference-lists-ext 1000038010
    structure-type-video-encode-h265-capabilities-ext 1000039000
    structure-type-video-encode-h265-session-parameters-create-info-ext 1000039001
    structure-type-video-encode-h265-session-parameters-add-info-ext 1000039002
    structure-type-video-encode-h265-vcl-frame-info-ext 1000039003
    structure-type-video-encode-h265-dpb-slot-info-ext 1000039004
    structure-type-video-encode-h265-nalu-slice-segment-ext 1000039005
    structure-type-video-encode-h265-emit-picture-parameters-ext 1000039006
    structure-type-video-encode-h265-profile-ext 1000039007
    structure-type-video-encode-h265-reference-lists-ext 1000039008
    structure-type-video-encode-h265-rate-control-info-ext 1000039009
    structure-type-video-encode-h265-rate-control-layer-info-ext 1000039010
    structure-type-video-decode-h264-capabilities-ext 1000040000
    structure-type-video-decode-h264-picture-info-ext 1000040001
    structure-type-video-decode-h264-mvc-ext 1000040002
    structure-type-video-decode-h264-profile-ext 1000040003
    structure-type-video-decode-h264-session-parameters-create-info-ext 1000040004
    structure-type-video-decode-h264-session-parameters-add-info-ext 1000040005
    structure-type-video-decode-h264-dpb-slot-info-ext 1000040006
    structure-type-texture-lod-gather-format-properties-amd 1000041000
    structure-type-rendering-fragment-shading-rate-attachment-info-khr 1000044006
    structure-type-rendering-fragment-density-map-attachment-info-ext 1000044007
    structure-type-attachment-sample-count-info-amd 1000044008
    structure-type-multiview-per-view-attributes-info-nvx 1000044009
    structure-type-stream-descriptor-surface-create-info-ggp 1000049000
    structure-type-physical-device-corner-sampled-image-features-nv 1000050000
    structure-type-external-memory-image-create-info-nv 1000056000
    structure-type-export-memory-allocate-info-nv 1000056001
    structure-type-import-memory-win32-handle-info-nv 1000057000
    structure-type-export-memory-win32-handle-info-nv 1000057001
    structure-type-win32-keyed-mutex-acquire-release-info-nv 1000058000
    structure-type-validation-flags-ext 1000061000
    structure-type-vi-surface-create-info-nn 1000062000
    structure-type-image-view-astc-decode-mode-ext 1000067000
    structure-type-physical-device-astc-decode-features-ext 1000067001
    structure-type-import-memory-win32-handle-info-khr 1000073000
    structure-type-export-memory-win32-handle-info-khr 1000073001
    structure-type-memory-win32-handle-properties-khr 1000073002
    structure-type-memory-get-win32-handle-info-khr 1000073003
    structure-type-import-memory-fd-info-khr 1000074000
    structure-type-memory-fd-properties-khr 1000074001
    structure-type-memory-get-fd-info-khr 1000074002
    structure-type-win32-keyed-mutex-acquire-release-info-khr 1000075000
    structure-type-import-semaphore-win32-handle-info-khr 1000078000
    structure-type-export-semaphore-win32-handle-info-khr 1000078001
    structure-type-d3d12-fence-submit-info-khr 1000078002
    structure-type-semaphore-get-win32-handle-info-khr 1000078003
    structure-type-import-semaphore-fd-info-khr 1000079000
    structure-type-semaphore-get-fd-info-khr 1000079001
    structure-type-physical-device-push-descriptor-properties-khr 1000080000
    structure-type-command-buffer-inheritance-conditional-rendering-info-ext 1000081000
    structure-type-physical-device-conditional-rendering-features-ext 1000081001
    structure-type-conditional-rendering-begin-info-ext 1000081002
    structure-type-present-regions-khr 1000084000
    structure-type-pipeline-viewport-w-scaling-state-create-info-nv 1000087000
    structure-type-surface-capabilities-2-ext 1000090000
    structure-type-display-power-info-ext 1000091000
    structure-type-device-event-info-ext 1000091001
    structure-type-display-event-info-ext 1000091002
    structure-type-swapchain-counter-create-info-ext 1000091003
    structure-type-present-times-info-google 1000092000
    structure-type-physical-device-multiview-per-view-attributes-properties-nvx 1000097000
    structure-type-pipeline-viewport-swizzle-state-create-info-nv 1000098000
    structure-type-physical-device-discard-rectangle-properties-ext 1000099000
    structure-type-pipeline-discard-rectangle-state-create-info-ext 1000099001
    structure-type-physical-device-conservative-rasterization-properties-ext 1000101000
    structure-type-pipeline-rasterization-conservative-state-create-info-ext 1000101001
    structure-type-physical-device-depth-clip-enable-features-ext 1000102000
    structure-type-pipeline-rasterization-depth-clip-state-create-info-ext 1000102001
    structure-type-hdr-metadata-ext 1000105000
    structure-type-shared-present-surface-capabilities-khr 1000111000
    structure-type-import-fence-win32-handle-info-khr 1000114000
    structure-type-export-fence-win32-handle-info-khr 1000114001
    structure-type-fence-get-win32-handle-info-khr 1000114002
    structure-type-import-fence-fd-info-khr 1000115000
    structure-type-fence-get-fd-info-khr 1000115001
    structure-type-physical-device-performance-query-features-khr 1000116000
    structure-type-physical-device-performance-query-properties-khr 1000116001
    structure-type-query-pool-performance-create-info-khr 1000116002
    structure-type-performance-query-submit-info-khr 1000116003
    structure-type-acquire-profiling-lock-info-khr 1000116004
    structure-type-performance-counter-khr 1000116005
    structure-type-performance-counter-description-khr 1000116006
    structure-type-physical-device-surface-info-2-khr 1000119000
    structure-type-surface-capabilities-2-khr 1000119001
    structure-type-surface-format-2-khr 1000119002
    structure-type-display-properties-2-khr 1000121000
    structure-type-display-plane-properties-2-khr 1000121001
    structure-type-display-mode-properties-2-khr 1000121002
    structure-type-display-plane-info-2-khr 1000121003
    structure-type-display-plane-capabilities-2-khr 1000121004
    structure-type-ios-surface-create-info-mvk 1000122000
    structure-type-macos-surface-create-info-mvk 1000123000
    structure-type-debug-utils-object-name-info-ext 1000128000
    structure-type-debug-utils-object-tag-info-ext 1000128001
    structure-type-debug-utils-label-ext 1000128002
    structure-type-debug-utils-messenger-callback-data-ext 1000128003
    structure-type-debug-utils-messenger-create-info-ext 1000128004
    structure-type-android-hardware-buffer-usage-android 1000129000
    structure-type-android-hardware-buffer-properties-android 1000129001
    structure-type-android-hardware-buffer-format-properties-android 1000129002
    structure-type-import-android-hardware-buffer-info-android 1000129003
    structure-type-memory-get-android-hardware-buffer-info-android 1000129004
    structure-type-external-format-android 1000129005
    structure-type-android-hardware-buffer-format-properties-2-android 1000129006
    structure-type-sample-locations-info-ext 1000143000
    structure-type-render-pass-sample-locations-begin-info-ext 1000143001
    structure-type-pipeline-sample-locations-state-create-info-ext 1000143002
    structure-type-physical-device-sample-locations-properties-ext 1000143003
    structure-type-multisample-properties-ext 1000143004
    structure-type-physical-device-blend-operation-advanced-features-ext 1000148000
    structure-type-physical-device-blend-operation-advanced-properties-ext 1000148001
    structure-type-pipeline-color-blend-advanced-state-create-info-ext 1000148002
    structure-type-pipeline-coverage-to-color-state-create-info-nv 1000149000
    structure-type-write-descriptor-set-acceleration-structure-khr 1000150007
    structure-type-acceleration-structure-build-geometry-info-khr 1000150000
    structure-type-acceleration-structure-device-address-info-khr 1000150002
    structure-type-acceleration-structure-geometry-aabbs-data-khr 1000150003
    structure-type-acceleration-structure-geometry-instances-data-khr 1000150004
    structure-type-acceleration-structure-geometry-triangles-data-khr 1000150005
    structure-type-acceleration-structure-geometry-khr 1000150006
    structure-type-acceleration-structure-version-info-khr 1000150009
    structure-type-copy-acceleration-structure-info-khr 1000150010
    structure-type-copy-acceleration-structure-to-memory-info-khr 1000150011
    structure-type-copy-memory-to-acceleration-structure-info-khr 1000150012
    structure-type-physical-device-acceleration-structure-features-khr 1000150013
    structure-type-physical-device-acceleration-structure-properties-khr 1000150014
    structure-type-acceleration-structure-create-info-khr 1000150017
    structure-type-acceleration-structure-build-sizes-info-khr 1000150020
    structure-type-physical-device-ray-tracing-pipeline-features-khr 1000347000
    structure-type-physical-device-ray-tracing-pipeline-properties-khr 1000347001
    structure-type-ray-tracing-pipeline-create-info-khr 1000150015
    structure-type-ray-tracing-shader-group-create-info-khr 1000150016
    structure-type-ray-tracing-pipeline-interface-create-info-khr 1000150018
    structure-type-physical-device-ray-query-features-khr 1000348013
    structure-type-pipeline-coverage-modulation-state-create-info-nv 1000152000
    structure-type-physical-device-shader-sm-builtins-features-nv 1000154000
    structure-type-physical-device-shader-sm-builtins-properties-nv 1000154001
    structure-type-drm-format-modifier-properties-list-ext 1000158000
    structure-type-physical-device-image-drm-format-modifier-info-ext 1000158002
    structure-type-image-drm-format-modifier-list-create-info-ext 1000158003
    structure-type-image-drm-format-modifier-explicit-create-info-ext 1000158004
    structure-type-image-drm-format-modifier-properties-ext 1000158005
    structure-type-drm-format-modifier-properties-list-2-ext 1000158006
    structure-type-validation-cache-create-info-ext 1000160000
    structure-type-shader-module-validation-cache-create-info-ext 1000160001
    structure-type-physical-device-portability-subset-features-khr 1000163000
    structure-type-physical-device-portability-subset-properties-khr 1000163001
    structure-type-pipeline-viewport-shading-rate-image-state-create-info-nv 1000164000
    structure-type-physical-device-shading-rate-image-features-nv 1000164001
    structure-type-physical-device-shading-rate-image-properties-nv 1000164002
    structure-type-pipeline-viewport-coarse-sample-order-state-create-info-nv 1000164005
    structure-type-ray-tracing-pipeline-create-info-nv 1000165000
    structure-type-acceleration-structure-create-info-nv 1000165001
    structure-type-geometry-nv 1000165003
    structure-type-geometry-triangles-nv 1000165004
    structure-type-geometry-aabb-nv 1000165005
    structure-type-bind-acceleration-structure-memory-info-nv 1000165006
    structure-type-write-descriptor-set-acceleration-structure-nv 1000165007
    structure-type-acceleration-structure-memory-requirements-info-nv 1000165008
    structure-type-physical-device-ray-tracing-properties-nv 1000165009
    structure-type-ray-tracing-shader-group-create-info-nv 1000165011
    structure-type-acceleration-structure-info-nv 1000165012
    structure-type-physical-device-representative-fragment-test-features-nv 1000166000
    structure-type-pipeline-representative-fragment-test-state-create-info-nv 1000166001
    structure-type-physical-device-image-view-image-format-info-ext 1000170000
    structure-type-filter-cubic-image-view-image-format-properties-ext 1000170001
    structure-type-import-memory-host-pointer-info-ext 1000178000
    structure-type-memory-host-pointer-properties-ext 1000178001
    structure-type-physical-device-external-memory-host-properties-ext 1000178002
    structure-type-physical-device-shader-clock-features-khr 1000181000
    structure-type-pipeline-compiler-control-create-info-amd 1000183000
    structure-type-calibrated-timestamp-info-ext 1000184000
    structure-type-physical-device-shader-core-properties-amd 1000185000
    structure-type-video-decode-h265-capabilities-ext 1000187000
    structure-type-video-decode-h265-session-parameters-create-info-ext 1000187001
    structure-type-video-decode-h265-session-parameters-add-info-ext 1000187002
    structure-type-video-decode-h265-profile-ext 1000187003
    structure-type-video-decode-h265-picture-info-ext 1000187004
    structure-type-video-decode-h265-dpb-slot-info-ext 1000187005
    structure-type-device-queue-global-priority-create-info-khr 1000174000
    structure-type-physical-device-global-priority-query-features-khr 1000388000
    structure-type-queue-family-global-priority-properties-khr 1000388001
    structure-type-device-memory-overallocation-create-info-amd 1000189000
    structure-type-physical-device-vertex-attribute-divisor-properties-ext 1000190000
    structure-type-pipeline-vertex-input-divisor-state-create-info-ext 1000190001
    structure-type-physical-device-vertex-attribute-divisor-features-ext 1000190002
    structure-type-present-frame-token-ggp 1000191000
    structure-type-physical-device-compute-shader-derivatives-features-nv 1000201000
    structure-type-physical-device-mesh-shader-features-nv 1000202000
    structure-type-physical-device-mesh-shader-properties-nv 1000202001
    structure-type-physical-device-shader-image-footprint-features-nv 1000204000
    structure-type-pipeline-viewport-exclusive-scissor-state-create-info-nv 1000205000
    structure-type-physical-device-exclusive-scissor-features-nv 1000205002
    structure-type-checkpoint-data-nv 1000206000
    structure-type-queue-family-checkpoint-properties-nv 1000206001
    structure-type-physical-device-shader-integer-functions-2-features-intel 1000209000
    structure-type-query-pool-performance-query-create-info-intel 1000210000
    structure-type-initialize-performance-api-info-intel 1000210001
    structure-type-performance-marker-info-intel 1000210002
    structure-type-performance-stream-marker-info-intel 1000210003
    structure-type-performance-override-info-intel 1000210004
    structure-type-performance-configuration-acquire-info-intel 1000210005
    structure-type-physical-device-pci-bus-info-properties-ext 1000212000
    structure-type-display-native-hdr-surface-capabilities-amd 1000213000
    structure-type-swapchain-display-native-hdr-create-info-amd 1000213001
    structure-type-imagepipe-surface-create-info-fuchsia 1000214000
    structure-type-metal-surface-create-info-ext 1000217000
    structure-type-physical-device-fragment-density-map-features-ext 1000218000
    structure-type-physical-device-fragment-density-map-properties-ext 1000218001
    structure-type-render-pass-fragment-density-map-create-info-ext 1000218002
    structure-type-fragment-shading-rate-attachment-info-khr 1000226000
    structure-type-pipeline-fragment-shading-rate-state-create-info-khr 1000226001
    structure-type-physical-device-fragment-shading-rate-properties-khr 1000226002
    structure-type-physical-device-fragment-shading-rate-features-khr 1000226003
    structure-type-physical-device-fragment-shading-rate-khr 1000226004
    structure-type-physical-device-shader-core-properties-2-amd 1000227000
    structure-type-physical-device-coherent-memory-features-amd 1000229000
    structure-type-physical-device-shader-image-atomic-int64-features-ext 1000234000
    structure-type-physical-device-memory-budget-properties-ext 1000237000
    structure-type-physical-device-memory-priority-features-ext 1000238000
    structure-type-memory-priority-allocate-info-ext 1000238001
    structure-type-surface-protected-capabilities-khr 1000239000
    structure-type-physical-device-dedicated-allocation-image-aliasing-features-nv 1000240000
    structure-type-physical-device-buffer-device-address-features-ext 1000244000
    structure-type-buffer-device-address-create-info-ext 1000244002
    structure-type-validation-features-ext 1000247000
    structure-type-physical-device-present-wait-features-khr 1000248000
    structure-type-physical-device-cooperative-matrix-features-nv 1000249000
    structure-type-cooperative-matrix-properties-nv 1000249001
    structure-type-physical-device-cooperative-matrix-properties-nv 1000249002
    structure-type-physical-device-coverage-reduction-mode-features-nv 1000250000
    structure-type-pipeline-coverage-reduction-state-create-info-nv 1000250001
    structure-type-framebuffer-mixed-samples-combination-nv 1000250002
    structure-type-physical-device-fragment-shader-interlock-features-ext 1000251000
    structure-type-physical-device-ycbcr-image-arrays-features-ext 1000252000
    structure-type-physical-device-provoking-vertex-features-ext 1000254000
    structure-type-pipeline-rasterization-provoking-vertex-state-create-info-ext 1000254001
    structure-type-physical-device-provoking-vertex-properties-ext 1000254002
    structure-type-surface-full-screen-exclusive-info-ext 1000255000
    structure-type-surface-capabilities-full-screen-exclusive-ext 1000255002
    structure-type-surface-full-screen-exclusive-win32-info-ext 1000255001
    structure-type-headless-surface-create-info-ext 1000256000
    structure-type-physical-device-line-rasterization-features-ext 1000259000
    structure-type-pipeline-rasterization-line-state-create-info-ext 1000259001
    structure-type-physical-device-line-rasterization-properties-ext 1000259002
    structure-type-physical-device-shader-atomic-float-features-ext 1000260000
    structure-type-physical-device-index-type-uint8-features-ext 1000265000
    structure-type-physical-device-extended-dynamic-state-features-ext 1000267000
    structure-type-physical-device-pipeline-executable-properties-features-khr 1000269000
    structure-type-pipeline-info-khr 1000269001
    structure-type-pipeline-executable-properties-khr 1000269002
    structure-type-pipeline-executable-info-khr 1000269003
    structure-type-pipeline-executable-statistic-khr 1000269004
    structure-type-pipeline-executable-internal-representation-khr 1000269005
    structure-type-physical-device-shader-atomic-float-2-features-ext 1000273000
    structure-type-physical-device-device-generated-commands-properties-nv 1000277000
    structure-type-graphics-shader-group-create-info-nv 1000277001
    structure-type-graphics-pipeline-shader-groups-create-info-nv 1000277002
    structure-type-indirect-commands-layout-token-nv 1000277003
    structure-type-indirect-commands-layout-create-info-nv 1000277004
    structure-type-generated-commands-info-nv 1000277005
    structure-type-generated-commands-memory-requirements-info-nv 1000277006
    structure-type-physical-device-device-generated-commands-features-nv 1000277007
    structure-type-physical-device-inherited-viewport-scissor-features-nv 1000278000
    structure-type-command-buffer-inheritance-viewport-scissor-info-nv 1000278001
    structure-type-physical-device-texel-buffer-alignment-features-ext 1000281000
    structure-type-command-buffer-inheritance-render-pass-transform-info-qcom 1000282000
    structure-type-render-pass-transform-begin-info-qcom 1000282001
    structure-type-physical-device-device-memory-report-features-ext 1000284000
    structure-type-device-device-memory-report-create-info-ext 1000284001
    structure-type-device-memory-report-callback-data-ext 1000284002
    structure-type-physical-device-robustness-2-features-ext 1000286000
    structure-type-physical-device-robustness-2-properties-ext 1000286001
    structure-type-sampler-custom-border-color-create-info-ext 1000287000
    structure-type-physical-device-custom-border-color-properties-ext 1000287001
    structure-type-physical-device-custom-border-color-features-ext 1000287002
    structure-type-pipeline-library-create-info-khr 1000290000
    structure-type-present-id-khr 1000294000
    structure-type-physical-device-present-id-features-khr 1000294001
    structure-type-video-encode-info-khr 1000299000
    structure-type-video-encode-rate-control-info-khr 1000299001
    structure-type-video-encode-rate-control-layer-info-khr 1000299002
    structure-type-video-encode-capabilities-khr 1000299003
    structure-type-physical-device-diagnostics-config-features-nv 1000300000
    structure-type-device-diagnostics-config-create-info-nv 1000300001
    structure-type-queue-family-checkpoint-properties-2-nv 1000314008
    structure-type-checkpoint-data-2-nv 1000314009
    structure-type-physical-device-graphics-pipeline-library-features-ext 1000320000
    structure-type-physical-device-graphics-pipeline-library-properties-ext 1000320001
    structure-type-graphics-pipeline-library-create-info-ext 1000320002
    structure-type-physical-device-shader-early-and-late-fragment-tests-features-amd 1000321000
    structure-type-physical-device-fragment-shader-barycentric-features-khr 1000203000
    structure-type-physical-device-fragment-shader-barycentric-properties-khr 1000322000
    structure-type-physical-device-shader-subgroup-uniform-control-flow-features-khr 1000323000
    structure-type-physical-device-fragment-shading-rate-enums-properties-nv 1000326000
    structure-type-physical-device-fragment-shading-rate-enums-features-nv 1000326001
    structure-type-pipeline-fragment-shading-rate-enum-state-create-info-nv 1000326002
    structure-type-acceleration-structure-geometry-motion-triangles-data-nv 1000327000
    structure-type-physical-device-ray-tracing-motion-blur-features-nv 1000327001
    structure-type-acceleration-structure-motion-info-nv 1000327002
    structure-type-physical-device-ycbcr-2-plane-444-formats-features-ext 1000330000
    structure-type-physical-device-fragment-density-map-2-features-ext 1000332000
    structure-type-physical-device-fragment-density-map-2-properties-ext 1000332001
    structure-type-copy-command-transform-info-qcom 1000333000
    structure-type-physical-device-workgroup-memory-explicit-layout-features-khr 1000336000
    structure-type-physical-device-image-compression-control-features-ext 1000338000
    structure-type-image-compression-control-ext 1000338001
    structure-type-subresource-layout-2-ext 1000338002
    structure-type-image-subresource-2-ext 1000338003
    structure-type-image-compression-properties-ext 1000338004
    structure-type-physical-device-4444-formats-features-ext 1000340000
    structure-type-physical-device-rasterization-order-attachment-access-features-arm 1000342000
    structure-type-physical-device-rgba10x6-formats-features-ext 1000344000
    structure-type-directfb-surface-create-info-ext 1000346000
    structure-type-physical-device-mutable-descriptor-type-features-valve 1000351000
    structure-type-mutable-descriptor-type-create-info-valve 1000351002
    structure-type-physical-device-vertex-input-dynamic-state-features-ext 1000352000
    structure-type-vertex-input-binding-description-2-ext 1000352001
    structure-type-vertex-input-attribute-description-2-ext 1000352002
    structure-type-physical-device-drm-properties-ext 1000353000
    structure-type-physical-device-depth-clip-control-features-ext 1000355000
    structure-type-pipeline-viewport-depth-clip-control-create-info-ext 1000355001
    structure-type-physical-device-primitive-topology-list-restart-features-ext 1000356000
    structure-type-import-memory-zircon-handle-info-fuchsia 1000364000
    structure-type-memory-zircon-handle-properties-fuchsia 1000364001
    structure-type-memory-get-zircon-handle-info-fuchsia 1000364002
    structure-type-import-semaphore-zircon-handle-info-fuchsia 1000365000
    structure-type-semaphore-get-zircon-handle-info-fuchsia 1000365001
    structure-type-buffer-collection-create-info-fuchsia 1000366000
    structure-type-import-memory-buffer-collection-fuchsia 1000366001
    structure-type-buffer-collection-image-create-info-fuchsia 1000366002
    structure-type-buffer-collection-properties-fuchsia 1000366003
    structure-type-buffer-constraints-info-fuchsia 1000366004
    structure-type-buffer-collection-buffer-create-info-fuchsia 1000366005
    structure-type-image-constraints-info-fuchsia 1000366006
    structure-type-image-format-constraints-info-fuchsia 1000366007
    structure-type-sysmem-color-space-fuchsia 1000366008
    structure-type-buffer-collection-constraints-info-fuchsia 1000366009
    structure-type-subpass-shading-pipeline-create-info-huawei 1000369000
    structure-type-physical-device-subpass-shading-features-huawei 1000369001
    structure-type-physical-device-subpass-shading-properties-huawei 1000369002
    structure-type-physical-device-invocation-mask-features-huawei 1000370000
    structure-type-memory-get-remote-address-info-nv 1000371000
    structure-type-physical-device-external-memory-rdma-features-nv 1000371001
    structure-type-pipeline-properties-identifier-ext 1000372000
    structure-type-physical-device-pipeline-properties-features-ext 1000372001
    structure-type-physical-device-extended-dynamic-state-2-features-ext 1000377000
    structure-type-screen-surface-create-info-qnx 1000378000
    structure-type-physical-device-color-write-enable-features-ext 1000381000
    structure-type-pipeline-color-write-create-info-ext 1000381001
    structure-type-physical-device-primitives-generated-query-features-ext 1000382000
    structure-type-physical-device-ray-tracing-maintenance-1-features-khr 1000386000
    structure-type-physical-device-image-view-min-lod-features-ext 1000391000
    structure-type-image-view-min-lod-create-info-ext 1000391001
    structure-type-physical-device-multi-draw-features-ext 1000392000
    structure-type-physical-device-multi-draw-properties-ext 1000392001
    structure-type-physical-device-image-2d-view-of-3d-features-ext 1000393000
    structure-type-physical-device-border-color-swizzle-features-ext 1000411000
    structure-type-sampler-border-color-component-mapping-create-info-ext 1000411001
    structure-type-physical-device-pageable-device-local-memory-features-ext 1000412000
    structure-type-physical-device-descriptor-set-host-mapping-features-valve 1000420000
    structure-type-descriptor-set-binding-reference-valve 1000420001
    structure-type-descriptor-set-layout-host-mapping-info-valve 1000420002
    structure-type-physical-device-fragment-density-map-offset-features-qcom 1000425000
    structure-type-physical-device-fragment-density-map-offset-properties-qcom 1000425001
    structure-type-subpass-fragment-density-map-offset-end-info-qcom 1000425002
    structure-type-physical-device-linear-color-attachment-features-nv 1000430000
    structure-type-physical-device-image-compression-control-swapchain-features-ext 1000437000
    structure-type-physical-device-subpass-merge-feedback-features-ext 1000458000
    structure-type-render-pass-creation-control-ext 1000458001
    structure-type-render-pass-creation-feedback-create-info-ext 1000458002
    structure-type-render-pass-subpass-feedback-create-info-ext 1000458003
    structure-type-physical-device-variable-pointer-features structure-type-physical-device-variable-pointers-features
    structure-type-physical-device-shader-draw-parameter-features structure-type-physical-device-shader-draw-parameters-features
    structure-type-debug-report-create-info-ext structure-type-debug-report-callback-create-info-ext
    structure-type-rendering-info-khr structure-type-rendering-info
    structure-type-rendering-attachment-info-khr structure-type-rendering-attachment-info
    structure-type-pipeline-rendering-create-info-khr structure-type-pipeline-rendering-create-info
    structure-type-physical-device-dynamic-rendering-features-khr structure-type-physical-device-dynamic-rendering-features
    structure-type-command-buffer-inheritance-rendering-info-khr structure-type-command-buffer-inheritance-rendering-info
    structure-type-attachment-sample-count-info-nv structure-type-attachment-sample-count-info-amd
    structure-type-render-pass-multiview-create-info-khr structure-type-render-pass-multiview-create-info
    structure-type-physical-device-multiview-features-khr structure-type-physical-device-multiview-features
    structure-type-physical-device-multiview-properties-khr structure-type-physical-device-multiview-properties
    structure-type-physical-device-features-2-khr structure-type-physical-device-features-2
    structure-type-physical-device-properties-2-khr structure-type-physical-device-properties-2
    structure-type-format-properties-2-khr structure-type-format-properties-2
    structure-type-image-format-properties-2-khr structure-type-image-format-properties-2
    structure-type-physical-device-image-format-info-2-khr structure-type-physical-device-image-format-info-2
    structure-type-queue-family-properties-2-khr structure-type-queue-family-properties-2
    structure-type-physical-device-memory-properties-2-khr structure-type-physical-device-memory-properties-2
    structure-type-sparse-image-format-properties-2-khr structure-type-sparse-image-format-properties-2
    structure-type-physical-device-sparse-image-format-info-2-khr structure-type-physical-device-sparse-image-format-info-2
    structure-type-memory-allocate-flags-info-khr structure-type-memory-allocate-flags-info
    structure-type-device-group-render-pass-begin-info-khr structure-type-device-group-render-pass-begin-info
    structure-type-device-group-command-buffer-begin-info-khr structure-type-device-group-command-buffer-begin-info
    structure-type-device-group-submit-info-khr structure-type-device-group-submit-info
    structure-type-device-group-bind-sparse-info-khr structure-type-device-group-bind-sparse-info
    structure-type-bind-buffer-memory-device-group-info-khr structure-type-bind-buffer-memory-device-group-info
    structure-type-bind-image-memory-device-group-info-khr structure-type-bind-image-memory-device-group-info
    structure-type-physical-device-texture-compression-astc-hdr-features-ext structure-type-physical-device-texture-compression-astc-hdr-features
    structure-type-physical-device-group-properties-khr structure-type-physical-device-group-properties
    structure-type-device-group-device-create-info-khr structure-type-device-group-device-create-info
    structure-type-physical-device-external-image-format-info-khr structure-type-physical-device-external-image-format-info
    structure-type-external-image-format-properties-khr structure-type-external-image-format-properties
    structure-type-physical-device-external-buffer-info-khr structure-type-physical-device-external-buffer-info
    structure-type-external-buffer-properties-khr structure-type-external-buffer-properties
    structure-type-physical-device-id-properties-khr structure-type-physical-device-id-properties
    structure-type-external-memory-buffer-create-info-khr structure-type-external-memory-buffer-create-info
    structure-type-external-memory-image-create-info-khr structure-type-external-memory-image-create-info
    structure-type-export-memory-allocate-info-khr structure-type-export-memory-allocate-info
    structure-type-physical-device-external-semaphore-info-khr structure-type-physical-device-external-semaphore-info
    structure-type-external-semaphore-properties-khr structure-type-external-semaphore-properties
    structure-type-export-semaphore-create-info-khr structure-type-export-semaphore-create-info
    structure-type-physical-device-shader-float16-int8-features-khr structure-type-physical-device-shader-float16-int8-features
    structure-type-physical-device-float16-int8-features-khr structure-type-physical-device-shader-float16-int8-features
    structure-type-physical-device-16bit-storage-features-khr structure-type-physical-device-16bit-storage-features
    structure-type-descriptor-update-template-create-info-khr structure-type-descriptor-update-template-create-info
    structure-type-surface-capabilities2-ext structure-type-surface-capabilities-2-ext
    structure-type-physical-device-imageless-framebuffer-features-khr structure-type-physical-device-imageless-framebuffer-features
    structure-type-framebuffer-attachments-create-info-khr structure-type-framebuffer-attachments-create-info
    structure-type-framebuffer-attachment-image-info-khr structure-type-framebuffer-attachment-image-info
    structure-type-render-pass-attachment-begin-info-khr structure-type-render-pass-attachment-begin-info
    structure-type-attachment-description-2-khr structure-type-attachment-description-2
    structure-type-attachment-reference-2-khr structure-type-attachment-reference-2
    structure-type-subpass-description-2-khr structure-type-subpass-description-2
    structure-type-subpass-dependency-2-khr structure-type-subpass-dependency-2
    structure-type-render-pass-create-info-2-khr structure-type-render-pass-create-info-2
    structure-type-subpass-begin-info-khr structure-type-subpass-begin-info
    structure-type-subpass-end-info-khr structure-type-subpass-end-info
    structure-type-physical-device-external-fence-info-khr structure-type-physical-device-external-fence-info
    structure-type-external-fence-properties-khr structure-type-external-fence-properties
    structure-type-export-fence-create-info-khr structure-type-export-fence-create-info
    structure-type-physical-device-point-clipping-properties-khr structure-type-physical-device-point-clipping-properties
    structure-type-render-pass-input-attachment-aspect-create-info-khr structure-type-render-pass-input-attachment-aspect-create-info
    structure-type-image-view-usage-create-info-khr structure-type-image-view-usage-create-info
    structure-type-pipeline-tessellation-domain-origin-state-create-info-khr structure-type-pipeline-tessellation-domain-origin-state-create-info
    structure-type-physical-device-variable-pointers-features-khr structure-type-physical-device-variable-pointers-features
    structure-type-physical-device-variable-pointer-features-khr structure-type-physical-device-variable-pointers-features-khr
    structure-type-memory-dedicated-requirements-khr structure-type-memory-dedicated-requirements
    structure-type-memory-dedicated-allocate-info-khr structure-type-memory-dedicated-allocate-info
    structure-type-physical-device-sampler-filter-minmax-properties-ext structure-type-physical-device-sampler-filter-minmax-properties
    structure-type-sampler-reduction-mode-create-info-ext structure-type-sampler-reduction-mode-create-info
    structure-type-physical-device-inline-uniform-block-features-ext structure-type-physical-device-inline-uniform-block-features
    structure-type-physical-device-inline-uniform-block-properties-ext structure-type-physical-device-inline-uniform-block-properties
    structure-type-write-descriptor-set-inline-uniform-block-ext structure-type-write-descriptor-set-inline-uniform-block
    structure-type-descriptor-pool-inline-uniform-block-create-info-ext structure-type-descriptor-pool-inline-uniform-block-create-info
    structure-type-buffer-memory-requirements-info-2-khr structure-type-buffer-memory-requirements-info-2
    structure-type-image-memory-requirements-info-2-khr structure-type-image-memory-requirements-info-2
    structure-type-image-sparse-memory-requirements-info-2-khr structure-type-image-sparse-memory-requirements-info-2
    structure-type-memory-requirements-2-khr structure-type-memory-requirements-2
    structure-type-sparse-image-memory-requirements-2-khr structure-type-sparse-image-memory-requirements-2
    structure-type-image-format-list-create-info-khr structure-type-image-format-list-create-info
    structure-type-sampler-ycbcr-conversion-create-info-khr structure-type-sampler-ycbcr-conversion-create-info
    structure-type-sampler-ycbcr-conversion-info-khr structure-type-sampler-ycbcr-conversion-info
    structure-type-bind-image-plane-memory-info-khr structure-type-bind-image-plane-memory-info
    structure-type-image-plane-memory-requirements-info-khr structure-type-image-plane-memory-requirements-info
    structure-type-physical-device-sampler-ycbcr-conversion-features-khr structure-type-physical-device-sampler-ycbcr-conversion-features
    structure-type-sampler-ycbcr-conversion-image-format-properties-khr structure-type-sampler-ycbcr-conversion-image-format-properties
    structure-type-bind-buffer-memory-info-khr structure-type-bind-buffer-memory-info
    structure-type-bind-image-memory-info-khr structure-type-bind-image-memory-info
    structure-type-descriptor-set-layout-binding-flags-create-info-ext structure-type-descriptor-set-layout-binding-flags-create-info
    structure-type-physical-device-descriptor-indexing-features-ext structure-type-physical-device-descriptor-indexing-features
    structure-type-physical-device-descriptor-indexing-properties-ext structure-type-physical-device-descriptor-indexing-properties
    structure-type-descriptor-set-variable-descriptor-count-allocate-info-ext structure-type-descriptor-set-variable-descriptor-count-allocate-info
    structure-type-descriptor-set-variable-descriptor-count-layout-support-ext structure-type-descriptor-set-variable-descriptor-count-layout-support
    structure-type-physical-device-maintenance-3-properties-khr structure-type-physical-device-maintenance-3-properties
    structure-type-descriptor-set-layout-support-khr structure-type-descriptor-set-layout-support
    structure-type-device-queue-global-priority-create-info-ext structure-type-device-queue-global-priority-create-info-khr
    structure-type-physical-device-shader-subgroup-extended-types-features-khr structure-type-physical-device-shader-subgroup-extended-types-features
    structure-type-physical-device-8bit-storage-features-khr structure-type-physical-device-8bit-storage-features
    structure-type-physical-device-shader-atomic-int64-features-khr structure-type-physical-device-shader-atomic-int64-features
    structure-type-pipeline-creation-feedback-create-info-ext structure-type-pipeline-creation-feedback-create-info
    structure-type-physical-device-driver-properties-khr structure-type-physical-device-driver-properties
    structure-type-physical-device-float-controls-properties-khr structure-type-physical-device-float-controls-properties
    structure-type-physical-device-depth-stencil-resolve-properties-khr structure-type-physical-device-depth-stencil-resolve-properties
    structure-type-subpass-description-depth-stencil-resolve-khr structure-type-subpass-description-depth-stencil-resolve
    structure-type-physical-device-fragment-shader-barycentric-features-nv structure-type-physical-device-fragment-shader-barycentric-features-khr
    structure-type-physical-device-timeline-semaphore-features-khr structure-type-physical-device-timeline-semaphore-features
    structure-type-physical-device-timeline-semaphore-properties-khr structure-type-physical-device-timeline-semaphore-properties
    structure-type-semaphore-type-create-info-khr structure-type-semaphore-type-create-info
    structure-type-timeline-semaphore-submit-info-khr structure-type-timeline-semaphore-submit-info
    structure-type-semaphore-wait-info-khr structure-type-semaphore-wait-info
    structure-type-semaphore-signal-info-khr structure-type-semaphore-signal-info
    structure-type-query-pool-create-info-intel structure-type-query-pool-performance-query-create-info-intel
    structure-type-physical-device-vulkan-memory-model-features-khr structure-type-physical-device-vulkan-memory-model-features
    structure-type-physical-device-shader-terminate-invocation-features-khr structure-type-physical-device-shader-terminate-invocation-features
    structure-type-physical-device-scalar-block-layout-features-ext structure-type-physical-device-scalar-block-layout-features
    structure-type-physical-device-subgroup-size-control-properties-ext structure-type-physical-device-subgroup-size-control-properties
    structure-type-pipeline-shader-stage-required-subgroup-size-create-info-ext structure-type-pipeline-shader-stage-required-subgroup-size-create-info
    structure-type-physical-device-subgroup-size-control-features-ext structure-type-physical-device-subgroup-size-control-features
    structure-type-physical-device-separate-depth-stencil-layouts-features-khr structure-type-physical-device-separate-depth-stencil-layouts-features
    structure-type-attachment-reference-stencil-layout-khr structure-type-attachment-reference-stencil-layout
    structure-type-attachment-description-stencil-layout-khr structure-type-attachment-description-stencil-layout
    structure-type-physical-device-buffer-address-features-ext structure-type-physical-device-buffer-device-address-features-ext
    structure-type-buffer-device-address-info-ext structure-type-buffer-device-address-info
    structure-type-physical-device-tool-properties-ext structure-type-physical-device-tool-properties
    structure-type-image-stencil-usage-create-info-ext structure-type-image-stencil-usage-create-info
    structure-type-physical-device-uniform-buffer-standard-layout-features-khr structure-type-physical-device-uniform-buffer-standard-layout-features
    structure-type-physical-device-buffer-device-address-features-khr structure-type-physical-device-buffer-device-address-features
    structure-type-buffer-device-address-info-khr structure-type-buffer-device-address-info
    structure-type-buffer-opaque-capture-address-create-info-khr structure-type-buffer-opaque-capture-address-create-info
    structure-type-memory-opaque-capture-address-allocate-info-khr structure-type-memory-opaque-capture-address-allocate-info
    structure-type-device-memory-opaque-capture-address-info-khr structure-type-device-memory-opaque-capture-address-info
    structure-type-physical-device-host-query-reset-features-ext structure-type-physical-device-host-query-reset-features
    structure-type-physical-device-shader-demote-to-helper-invocation-features-ext structure-type-physical-device-shader-demote-to-helper-invocation-features
    structure-type-physical-device-shader-integer-dot-product-features-khr structure-type-physical-device-shader-integer-dot-product-features
    structure-type-physical-device-shader-integer-dot-product-properties-khr structure-type-physical-device-shader-integer-dot-product-properties
    structure-type-physical-device-texel-buffer-alignment-properties-ext structure-type-physical-device-texel-buffer-alignment-properties
    structure-type-physical-device-private-data-features-ext structure-type-physical-device-private-data-features
    structure-type-device-private-data-create-info-ext structure-type-device-private-data-create-info
    structure-type-private-data-slot-create-info-ext structure-type-private-data-slot-create-info
    structure-type-physical-device-pipeline-creation-cache-control-features-ext structure-type-physical-device-pipeline-creation-cache-control-features
    structure-type-memory-barrier-2-khr structure-type-memory-barrier-2
    structure-type-buffer-memory-barrier-2-khr structure-type-buffer-memory-barrier-2
    structure-type-image-memory-barrier-2-khr structure-type-image-memory-barrier-2
    structure-type-dependency-info-khr structure-type-dependency-info
    structure-type-submit-info-2-khr structure-type-submit-info-2
    structure-type-semaphore-submit-info-khr structure-type-semaphore-submit-info
    structure-type-command-buffer-submit-info-khr structure-type-command-buffer-submit-info
    structure-type-physical-device-synchronization-2-features-khr structure-type-physical-device-synchronization-2-features
    structure-type-physical-device-zero-initialize-workgroup-memory-features-khr structure-type-physical-device-zero-initialize-workgroup-memory-features
    structure-type-physical-device-image-robustness-features-ext structure-type-physical-device-image-robustness-features
    structure-type-copy-buffer-info-2-khr structure-type-copy-buffer-info-2
    structure-type-copy-image-info-2-khr structure-type-copy-image-info-2
    structure-type-copy-buffer-to-image-info-2-khr structure-type-copy-buffer-to-image-info-2
    structure-type-copy-image-to-buffer-info-2-khr structure-type-copy-image-to-buffer-info-2
    structure-type-blit-image-info-2-khr structure-type-blit-image-info-2
    structure-type-resolve-image-info-2-khr structure-type-resolve-image-info-2
    structure-type-buffer-copy-2-khr structure-type-buffer-copy-2
    structure-type-image-copy-2-khr structure-type-image-copy-2
    structure-type-image-blit-2-khr structure-type-image-blit-2
    structure-type-buffer-image-copy-2-khr structure-type-buffer-image-copy-2
    structure-type-image-resolve-2-khr structure-type-image-resolve-2
    structure-type-format-properties-3-khr structure-type-format-properties-3
    structure-type-pipeline-info-ext structure-type-pipeline-info-khr
    structure-type-physical-device-global-priority-query-features-ext structure-type-physical-device-global-priority-query-features-khr
    structure-type-queue-family-global-priority-properties-ext structure-type-queue-family-global-priority-properties-khr
    structure-type-physical-device-maintenance-4-features-khr structure-type-physical-device-maintenance-4-features
    structure-type-physical-device-maintenance-4-properties-khr structure-type-physical-device-maintenance-4-properties
    structure-type-device-buffer-memory-requirements-khr structure-type-device-buffer-memory-requirements
    structure-type-device-image-memory-requirements-khr structure-type-device-image-memory-requirements
    structure-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineCacheHeaderVersion" doc-file 
    pipeline-cache-header-version-one 1
    pipeline-cache-header-version-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkImageLayout" doc-file 
    image-layout-undefined 0
    image-layout-general 1
    image-layout-color-attachment-optimal 2
    image-layout-depth-stencil-attachment-optimal 3
    image-layout-depth-stencil-read-only-optimal 4
    image-layout-shader-read-only-optimal 5
    image-layout-transfer-src-optimal 6
    image-layout-transfer-dst-optimal 7
    image-layout-preinitialized 8
    image-layout-depth-read-only-stencil-attachment-optimal 1000117000
    image-layout-depth-attachment-stencil-read-only-optimal 1000117001
    image-layout-depth-attachment-optimal 1000241000
    image-layout-depth-read-only-optimal 1000241001
    image-layout-stencil-attachment-optimal 1000241002
    image-layout-stencil-read-only-optimal 1000241003
    image-layout-read-only-optimal 1000314000
    image-layout-attachment-optimal 1000314001
    image-layout-present-src-khr 1000001002
    image-layout-video-decode-dst-khr 1000024000
    image-layout-video-decode-src-khr 1000024001
    image-layout-video-decode-dpb-khr 1000024002
    image-layout-shared-present-khr 1000111000
    image-layout-fragment-density-map-optimal-ext 1000218000
    image-layout-fragment-shading-rate-attachment-optimal-khr 1000164003
    image-layout-video-encode-dst-khr 1000299000
    image-layout-video-encode-src-khr 1000299001
    image-layout-video-encode-dpb-khr 1000299002
    image-layout-depth-read-only-stencil-attachment-optimal-khr image-layout-depth-read-only-stencil-attachment-optimal
    image-layout-depth-attachment-stencil-read-only-optimal-khr image-layout-depth-attachment-stencil-read-only-optimal
    image-layout-shading-rate-optimal-nv image-layout-fragment-shading-rate-attachment-optimal-khr
    image-layout-depth-attachment-optimal-khr image-layout-depth-attachment-optimal
    image-layout-depth-read-only-optimal-khr image-layout-depth-read-only-optimal
    image-layout-stencil-attachment-optimal-khr image-layout-stencil-attachment-optimal
    image-layout-stencil-read-only-optimal-khr image-layout-stencil-read-only-optimal
    image-layout-read-only-optimal-khr image-layout-read-only-optimal
    image-layout-attachment-optimal-khr image-layout-attachment-optimal
    image-layout-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkObjectType" doc-file 
    object-type-unknown 0
    object-type-instance 1
    object-type-physical-device 2
    object-type-device 3
    object-type-queue 4
    object-type-semaphore 5
    object-type-command-buffer 6
    object-type-fence 7
    object-type-device-memory 8
    object-type-buffer 9
    object-type-image 10
    object-type-event 11
    object-type-query-pool 12
    object-type-buffer-view 13
    object-type-image-view 14
    object-type-shader-module 15
    object-type-pipeline-cache 16
    object-type-pipeline-layout 17
    object-type-render-pass 18
    object-type-pipeline 19
    object-type-descriptor-set-layout 20
    object-type-sampler 21
    object-type-descriptor-pool 22
    object-type-descriptor-set 23
    object-type-framebuffer 24
    object-type-command-pool 25
    object-type-sampler-ycbcr-conversion 1000156000
    object-type-descriptor-update-template 1000085000
    object-type-private-data-slot 1000295000
    object-type-surface-khr 1000000000
    object-type-swapchain-khr 1000001000
    object-type-display-khr 1000002000
    object-type-display-mode-khr 1000002001
    object-type-debug-report-callback-ext 1000011000
    object-type-video-session-khr 1000023000
    object-type-video-session-parameters-khr 1000023001
    object-type-cu-module-nvx 1000029000
    object-type-cu-function-nvx 1000029001
    object-type-debug-utils-messenger-ext 1000128000
    object-type-acceleration-structure-khr 1000150000
    object-type-validation-cache-ext 1000160000
    object-type-acceleration-structure-nv 1000165000
    object-type-performance-configuration-intel 1000210000
    object-type-deferred-operation-khr 1000268000
    object-type-indirect-commands-layout-nv 1000277000
    object-type-buffer-collection-fuchsia 1000366000
    object-type-descriptor-update-template-khr object-type-descriptor-update-template
    object-type-sampler-ycbcr-conversion-khr object-type-sampler-ycbcr-conversion
    object-type-private-data-slot-ext object-type-private-data-slot
    object-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkVendorId" doc-file 
    vendor-id-viv #x10001
    vendor-id-vsi #x10002
    vendor-id-kazan #x10003
    vendor-id-codeplay #x10004
    vendor-id-mesa #x10005
    vendor-id-pocl #x10006
    vendor-id-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSystemAllocationScope" doc-file 
    system-allocation-scope-command 0
    system-allocation-scope-object 1
    system-allocation-scope-cache 2
    system-allocation-scope-device 3
    system-allocation-scope-instance 4
    system-allocation-scope-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkInternalAllocationType" doc-file 
    internal-allocation-type-executable 0
    internal-allocation-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkFormat" doc-file 
    format-undefined 0
    format-r4g4-unorm-pack8 1
    format-r4g4b4a4-unorm-pack16 2
    format-b4g4r4a4-unorm-pack16 3
    format-r5g6b5-unorm-pack16 4
    format-b5g6r5-unorm-pack16 5
    format-r5g5b5a1-unorm-pack16 6
    format-b5g5r5a1-unorm-pack16 7
    format-a1r5g5b5-unorm-pack16 8
    format-r8-unorm 9
    format-r8-snorm 10
    format-r8-uscaled 11
    format-r8-sscaled 12
    format-r8-uint 13
    format-r8-sint 14
    format-r8-srgb 15
    format-r8g8-unorm 16
    format-r8g8-snorm 17
    format-r8g8-uscaled 18
    format-r8g8-sscaled 19
    format-r8g8-uint 20
    format-r8g8-sint 21
    format-r8g8-srgb 22
    format-r8g8b8-unorm 23
    format-r8g8b8-snorm 24
    format-r8g8b8-uscaled 25
    format-r8g8b8-sscaled 26
    format-r8g8b8-uint 27
    format-r8g8b8-sint 28
    format-r8g8b8-srgb 29
    format-b8g8r8-unorm 30
    format-b8g8r8-snorm 31
    format-b8g8r8-uscaled 32
    format-b8g8r8-sscaled 33
    format-b8g8r8-uint 34
    format-b8g8r8-sint 35
    format-b8g8r8-srgb 36
    format-r8g8b8a8-unorm 37
    format-r8g8b8a8-snorm 38
    format-r8g8b8a8-uscaled 39
    format-r8g8b8a8-sscaled 40
    format-r8g8b8a8-uint 41
    format-r8g8b8a8-sint 42
    format-r8g8b8a8-srgb 43
    format-b8g8r8a8-unorm 44
    format-b8g8r8a8-snorm 45
    format-b8g8r8a8-uscaled 46
    format-b8g8r8a8-sscaled 47
    format-b8g8r8a8-uint 48
    format-b8g8r8a8-sint 49
    format-b8g8r8a8-srgb 50
    format-a8b8g8r8-unorm-pack32 51
    format-a8b8g8r8-snorm-pack32 52
    format-a8b8g8r8-uscaled-pack32 53
    format-a8b8g8r8-sscaled-pack32 54
    format-a8b8g8r8-uint-pack32 55
    format-a8b8g8r8-sint-pack32 56
    format-a8b8g8r8-srgb-pack32 57
    format-a2r10g10b10-unorm-pack32 58
    format-a2r10g10b10-snorm-pack32 59
    format-a2r10g10b10-uscaled-pack32 60
    format-a2r10g10b10-sscaled-pack32 61
    format-a2r10g10b10-uint-pack32 62
    format-a2r10g10b10-sint-pack32 63
    format-a2b10g10r10-unorm-pack32 64
    format-a2b10g10r10-snorm-pack32 65
    format-a2b10g10r10-uscaled-pack32 66
    format-a2b10g10r10-sscaled-pack32 67
    format-a2b10g10r10-uint-pack32 68
    format-a2b10g10r10-sint-pack32 69
    format-r16-unorm 70
    format-r16-snorm 71
    format-r16-uscaled 72
    format-r16-sscaled 73
    format-r16-uint 74
    format-r16-sint 75
    format-r16-sfloat 76
    format-r16g16-unorm 77
    format-r16g16-snorm 78
    format-r16g16-uscaled 79
    format-r16g16-sscaled 80
    format-r16g16-uint 81
    format-r16g16-sint 82
    format-r16g16-sfloat 83
    format-r16g16b16-unorm 84
    format-r16g16b16-snorm 85
    format-r16g16b16-uscaled 86
    format-r16g16b16-sscaled 87
    format-r16g16b16-uint 88
    format-r16g16b16-sint 89
    format-r16g16b16-sfloat 90
    format-r16g16b16a16-unorm 91
    format-r16g16b16a16-snorm 92
    format-r16g16b16a16-uscaled 93
    format-r16g16b16a16-sscaled 94
    format-r16g16b16a16-uint 95
    format-r16g16b16a16-sint 96
    format-r16g16b16a16-sfloat 97
    format-r32-uint 98
    format-r32-sint 99
    format-r32-sfloat 100
    format-r32g32-uint 101
    format-r32g32-sint 102
    format-r32g32-sfloat 103
    format-r32g32b32-uint 104
    format-r32g32b32-sint 105
    format-r32g32b32-sfloat 106
    format-r32g32b32a32-uint 107
    format-r32g32b32a32-sint 108
    format-r32g32b32a32-sfloat 109
    format-r64-uint 110
    format-r64-sint 111
    format-r64-sfloat 112
    format-r64g64-uint 113
    format-r64g64-sint 114
    format-r64g64-sfloat 115
    format-r64g64b64-uint 116
    format-r64g64b64-sint 117
    format-r64g64b64-sfloat 118
    format-r64g64b64a64-uint 119
    format-r64g64b64a64-sint 120
    format-r64g64b64a64-sfloat 121
    format-b10g11r11-ufloat-pack32 122
    format-e5b9g9r9-ufloat-pack32 123
    format-d16-unorm 124
    format-x8-d24-unorm-pack32 125
    format-d32-sfloat 126
    format-s8-uint 127
    format-d16-unorm-s8-uint 128
    format-d24-unorm-s8-uint 129
    format-d32-sfloat-s8-uint 130
    format-bc1-rgb-unorm-block 131
    format-bc1-rgb-srgb-block 132
    format-bc1-rgba-unorm-block 133
    format-bc1-rgba-srgb-block 134
    format-bc2-unorm-block 135
    format-bc2-srgb-block 136
    format-bc3-unorm-block 137
    format-bc3-srgb-block 138
    format-bc4-unorm-block 139
    format-bc4-snorm-block 140
    format-bc5-unorm-block 141
    format-bc5-snorm-block 142
    format-bc6h-ufloat-block 143
    format-bc6h-sfloat-block 144
    format-bc7-unorm-block 145
    format-bc7-srgb-block 146
    format-etc2-r8g8b8-unorm-block 147
    format-etc2-r8g8b8-srgb-block 148
    format-etc2-r8g8b8a1-unorm-block 149
    format-etc2-r8g8b8a1-srgb-block 150
    format-etc2-r8g8b8a8-unorm-block 151
    format-etc2-r8g8b8a8-srgb-block 152
    format-eac-r11-unorm-block 153
    format-eac-r11-snorm-block 154
    format-eac-r11g11-unorm-block 155
    format-eac-r11g11-snorm-block 156
    format-astc-4x4-unorm-block 157
    format-astc-4x4-srgb-block 158
    format-astc-5x4-unorm-block 159
    format-astc-5x4-srgb-block 160
    format-astc-5x5-unorm-block 161
    format-astc-5x5-srgb-block 162
    format-astc-6x5-unorm-block 163
    format-astc-6x5-srgb-block 164
    format-astc-6x6-unorm-block 165
    format-astc-6x6-srgb-block 166
    format-astc-8x5-unorm-block 167
    format-astc-8x5-srgb-block 168
    format-astc-8x6-unorm-block 169
    format-astc-8x6-srgb-block 170
    format-astc-8x8-unorm-block 171
    format-astc-8x8-srgb-block 172
    format-astc-10x5-unorm-block 173
    format-astc-10x5-srgb-block 174
    format-astc-10x6-unorm-block 175
    format-astc-10x6-srgb-block 176
    format-astc-10x8-unorm-block 177
    format-astc-10x8-srgb-block 178
    format-astc-10x10-unorm-block 179
    format-astc-10x10-srgb-block 180
    format-astc-12x10-unorm-block 181
    format-astc-12x10-srgb-block 182
    format-astc-12x12-unorm-block 183
    format-astc-12x12-srgb-block 184
    format-g8b8g8r8-422-unorm 1000156000
    format-b8g8r8g8-422-unorm 1000156001
    format-g8-b8-r8-3plane-420-unorm 1000156002
    format-g8-b8r8-2plane-420-unorm 1000156003
    format-g8-b8-r8-3plane-422-unorm 1000156004
    format-g8-b8r8-2plane-422-unorm 1000156005
    format-g8-b8-r8-3plane-444-unorm 1000156006
    format-r10x6-unorm-pack16 1000156007
    format-r10x6g10x6-unorm-2pack16 1000156008
    format-r10x6g10x6b10x6a10x6-unorm-4pack16 1000156009
    format-g10x6b10x6g10x6r10x6-422-unorm-4pack16 1000156010
    format-b10x6g10x6r10x6g10x6-422-unorm-4pack16 1000156011
    format-g10x6-b10x6-r10x6-3plane-420-unorm-3pack16 1000156012
    format-g10x6-b10x6r10x6-2plane-420-unorm-3pack16 1000156013
    format-g10x6-b10x6-r10x6-3plane-422-unorm-3pack16 1000156014
    format-g10x6-b10x6r10x6-2plane-422-unorm-3pack16 1000156015
    format-g10x6-b10x6-r10x6-3plane-444-unorm-3pack16 1000156016
    format-r12x4-unorm-pack16 1000156017
    format-r12x4g12x4-unorm-2pack16 1000156018
    format-r12x4g12x4b12x4a12x4-unorm-4pack16 1000156019
    format-g12x4b12x4g12x4r12x4-422-unorm-4pack16 1000156020
    format-b12x4g12x4r12x4g12x4-422-unorm-4pack16 1000156021
    format-g12x4-b12x4-r12x4-3plane-420-unorm-3pack16 1000156022
    format-g12x4-b12x4r12x4-2plane-420-unorm-3pack16 1000156023
    format-g12x4-b12x4-r12x4-3plane-422-unorm-3pack16 1000156024
    format-g12x4-b12x4r12x4-2plane-422-unorm-3pack16 1000156025
    format-g12x4-b12x4-r12x4-3plane-444-unorm-3pack16 1000156026
    format-g16b16g16r16-422-unorm 1000156027
    format-b16g16r16g16-422-unorm 1000156028
    format-g16-b16-r16-3plane-420-unorm 1000156029
    format-g16-b16r16-2plane-420-unorm 1000156030
    format-g16-b16-r16-3plane-422-unorm 1000156031
    format-g16-b16r16-2plane-422-unorm 1000156032
    format-g16-b16-r16-3plane-444-unorm 1000156033
    format-g8-b8r8-2plane-444-unorm 1000330000
    format-g10x6-b10x6r10x6-2plane-444-unorm-3pack16 1000330001
    format-g12x4-b12x4r12x4-2plane-444-unorm-3pack16 1000330002
    format-g16-b16r16-2plane-444-unorm 1000330003
    format-a4r4g4b4-unorm-pack16 1000340000
    format-a4b4g4r4-unorm-pack16 1000340001
    format-astc-4x4-sfloat-block 1000066000
    format-astc-5x4-sfloat-block 1000066001
    format-astc-5x5-sfloat-block 1000066002
    format-astc-6x5-sfloat-block 1000066003
    format-astc-6x6-sfloat-block 1000066004
    format-astc-8x5-sfloat-block 1000066005
    format-astc-8x6-sfloat-block 1000066006
    format-astc-8x8-sfloat-block 1000066007
    format-astc-10x5-sfloat-block 1000066008
    format-astc-10x6-sfloat-block 1000066009
    format-astc-10x8-sfloat-block 1000066010
    format-astc-10x10-sfloat-block 1000066011
    format-astc-12x10-sfloat-block 1000066012
    format-astc-12x12-sfloat-block 1000066013
    format-pvrtc1-2bpp-unorm-block-img 1000054000
    format-pvrtc1-4bpp-unorm-block-img 1000054001
    format-pvrtc2-2bpp-unorm-block-img 1000054002
    format-pvrtc2-4bpp-unorm-block-img 1000054003
    format-pvrtc1-2bpp-srgb-block-img 1000054004
    format-pvrtc1-4bpp-srgb-block-img 1000054005
    format-pvrtc2-2bpp-srgb-block-img 1000054006
    format-pvrtc2-4bpp-srgb-block-img 1000054007
    format-astc-4x4-sfloat-block-ext format-astc-4x4-sfloat-block
    format-astc-5x4-sfloat-block-ext format-astc-5x4-sfloat-block
    format-astc-5x5-sfloat-block-ext format-astc-5x5-sfloat-block
    format-astc-6x5-sfloat-block-ext format-astc-6x5-sfloat-block
    format-astc-6x6-sfloat-block-ext format-astc-6x6-sfloat-block
    format-astc-8x5-sfloat-block-ext format-astc-8x5-sfloat-block
    format-astc-8x6-sfloat-block-ext format-astc-8x6-sfloat-block
    format-astc-8x8-sfloat-block-ext format-astc-8x8-sfloat-block
    format-astc-10x5-sfloat-block-ext format-astc-10x5-sfloat-block
    format-astc-10x6-sfloat-block-ext format-astc-10x6-sfloat-block
    format-astc-10x8-sfloat-block-ext format-astc-10x8-sfloat-block
    format-astc-10x10-sfloat-block-ext format-astc-10x10-sfloat-block
    format-astc-12x10-sfloat-block-ext format-astc-12x10-sfloat-block
    format-astc-12x12-sfloat-block-ext format-astc-12x12-sfloat-block
    format-g8b8g8r8-422-unorm-khr format-g8b8g8r8-422-unorm
    format-b8g8r8g8-422-unorm-khr format-b8g8r8g8-422-unorm
    format-g8-b8-r8-3plane-420-unorm-khr format-g8-b8-r8-3plane-420-unorm
    format-g8-b8r8-2plane-420-unorm-khr format-g8-b8r8-2plane-420-unorm
    format-g8-b8-r8-3plane-422-unorm-khr format-g8-b8-r8-3plane-422-unorm
    format-g8-b8r8-2plane-422-unorm-khr format-g8-b8r8-2plane-422-unorm
    format-g8-b8-r8-3plane-444-unorm-khr format-g8-b8-r8-3plane-444-unorm
    format-r10x6-unorm-pack16-khr format-r10x6-unorm-pack16
    format-r10x6g10x6-unorm-2pack16-khr format-r10x6g10x6-unorm-2pack16
    format-r10x6g10x6b10x6a10x6-unorm-4pack16-khr format-r10x6g10x6b10x6a10x6-unorm-4pack16
    format-g10x6b10x6g10x6r10x6-422-unorm-4pack16-khr format-g10x6b10x6g10x6r10x6-422-unorm-4pack16
    format-b10x6g10x6r10x6g10x6-422-unorm-4pack16-khr format-b10x6g10x6r10x6g10x6-422-unorm-4pack16
    format-g10x6-b10x6-r10x6-3plane-420-unorm-3pack16-khr format-g10x6-b10x6-r10x6-3plane-420-unorm-3pack16
    format-g10x6-b10x6r10x6-2plane-420-unorm-3pack16-khr format-g10x6-b10x6r10x6-2plane-420-unorm-3pack16
    format-g10x6-b10x6-r10x6-3plane-422-unorm-3pack16-khr format-g10x6-b10x6-r10x6-3plane-422-unorm-3pack16
    format-g10x6-b10x6r10x6-2plane-422-unorm-3pack16-khr format-g10x6-b10x6r10x6-2plane-422-unorm-3pack16
    format-g10x6-b10x6-r10x6-3plane-444-unorm-3pack16-khr format-g10x6-b10x6-r10x6-3plane-444-unorm-3pack16
    format-r12x4-unorm-pack16-khr format-r12x4-unorm-pack16
    format-r12x4g12x4-unorm-2pack16-khr format-r12x4g12x4-unorm-2pack16
    format-r12x4g12x4b12x4a12x4-unorm-4pack16-khr format-r12x4g12x4b12x4a12x4-unorm-4pack16
    format-g12x4b12x4g12x4r12x4-422-unorm-4pack16-khr format-g12x4b12x4g12x4r12x4-422-unorm-4pack16
    format-b12x4g12x4r12x4g12x4-422-unorm-4pack16-khr format-b12x4g12x4r12x4g12x4-422-unorm-4pack16
    format-g12x4-b12x4-r12x4-3plane-420-unorm-3pack16-khr format-g12x4-b12x4-r12x4-3plane-420-unorm-3pack16
    format-g12x4-b12x4r12x4-2plane-420-unorm-3pack16-khr format-g12x4-b12x4r12x4-2plane-420-unorm-3pack16
    format-g12x4-b12x4-r12x4-3plane-422-unorm-3pack16-khr format-g12x4-b12x4-r12x4-3plane-422-unorm-3pack16
    format-g12x4-b12x4r12x4-2plane-422-unorm-3pack16-khr format-g12x4-b12x4r12x4-2plane-422-unorm-3pack16
    format-g12x4-b12x4-r12x4-3plane-444-unorm-3pack16-khr format-g12x4-b12x4-r12x4-3plane-444-unorm-3pack16
    format-g16b16g16r16-422-unorm-khr format-g16b16g16r16-422-unorm
    format-b16g16r16g16-422-unorm-khr format-b16g16r16g16-422-unorm
    format-g16-b16-r16-3plane-420-unorm-khr format-g16-b16-r16-3plane-420-unorm
    format-g16-b16r16-2plane-420-unorm-khr format-g16-b16r16-2plane-420-unorm
    format-g16-b16-r16-3plane-422-unorm-khr format-g16-b16-r16-3plane-422-unorm
    format-g16-b16r16-2plane-422-unorm-khr format-g16-b16r16-2plane-422-unorm
    format-g16-b16-r16-3plane-444-unorm-khr format-g16-b16-r16-3plane-444-unorm
    format-g8-b8r8-2plane-444-unorm-ext format-g8-b8r8-2plane-444-unorm
    format-g10x6-b10x6r10x6-2plane-444-unorm-3pack16-ext format-g10x6-b10x6r10x6-2plane-444-unorm-3pack16
    format-g12x4-b12x4r12x4-2plane-444-unorm-3pack16-ext format-g12x4-b12x4r12x4-2plane-444-unorm-3pack16
    format-g16-b16r16-2plane-444-unorm-ext format-g16-b16r16-2plane-444-unorm
    format-a4r4g4b4-unorm-pack16-ext format-a4r4g4b4-unorm-pack16
    format-a4b4g4r4-unorm-pack16-ext format-a4b4g4r4-unorm-pack16
    format-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkImageTiling" doc-file 
    image-tiling-optimal 0
    image-tiling-linear 1
    image-tiling-drm-format-modifier-ext 1000158000
    image-tiling-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkImageType" doc-file 
    image-type-1d 0
    image-type-2d 1
    image-type-3d 2
    image-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPhysicalDeviceType" doc-file 
    physical-device-type-other 0
    physical-device-type-integrated-gpu 1
    physical-device-type-discrete-gpu 2
    physical-device-type-virtual-gpu 3
    physical-device-type-cpu 4
    physical-device-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkQueryType" doc-file 
    query-type-occlusion 0
    query-type-pipeline-statistics 1
    query-type-timestamp 2
    query-type-result-status-only-khr 1000023000
    query-type-transform-feedback-stream-ext 1000028004
    query-type-performance-query-khr 1000116000
    query-type-acceleration-structure-compacted-size-khr 1000150000
    query-type-acceleration-structure-serialization-size-khr 1000150001
    query-type-acceleration-structure-compacted-size-nv 1000165000
    query-type-performance-query-intel 1000210000
    query-type-video-encode-bitstream-buffer-range-khr 1000299000
    query-type-primitives-generated-ext 1000382000
    query-type-acceleration-structure-serialization-bottom-level-pointers-khr 1000386000
    query-type-acceleration-structure-size-khr 1000386001
    query-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSharingMode" doc-file 
    sharing-mode-exclusive 0
    sharing-mode-concurrent 1
    sharing-mode-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkComponentSwizzle" doc-file 
    component-swizzle-identity 0
    component-swizzle-zero 1
    component-swizzle-one 2
    component-swizzle-r 3
    component-swizzle-g 4
    component-swizzle-b 5
    component-swizzle-a 6
    component-swizzle-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkImageViewType" doc-file 
    image-view-type-1d 0
    image-view-type-2d 1
    image-view-type-3d 2
    image-view-type-cube 3
    image-view-type-1d-array 4
    image-view-type-2d-array 5
    image-view-type-cube-array 6
    image-view-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkBlendFactor" doc-file 
    blend-factor-zero 0
    blend-factor-one 1
    blend-factor-src-color 2
    blend-factor-one-minus-src-color 3
    blend-factor-dst-color 4
    blend-factor-one-minus-dst-color 5
    blend-factor-src-alpha 6
    blend-factor-one-minus-src-alpha 7
    blend-factor-dst-alpha 8
    blend-factor-one-minus-dst-alpha 9
    blend-factor-constant-color 10
    blend-factor-one-minus-constant-color 11
    blend-factor-constant-alpha 12
    blend-factor-one-minus-constant-alpha 13
    blend-factor-src-alpha-saturate 14
    blend-factor-src1-color 15
    blend-factor-one-minus-src1-color 16
    blend-factor-src1-alpha 17
    blend-factor-one-minus-src1-alpha 18
    blend-factor-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkBlendOp" doc-file 
    blend-op-add 0
    blend-op-subtract 1
    blend-op-reverse-subtract 2
    blend-op-min 3
    blend-op-max 4
    blend-op-zero-ext 1000148000
    blend-op-src-ext 1000148001
    blend-op-dst-ext 1000148002
    blend-op-src-over-ext 1000148003
    blend-op-dst-over-ext 1000148004
    blend-op-src-in-ext 1000148005
    blend-op-dst-in-ext 1000148006
    blend-op-src-out-ext 1000148007
    blend-op-dst-out-ext 1000148008
    blend-op-src-atop-ext 1000148009
    blend-op-dst-atop-ext 1000148010
    blend-op-xor-ext 1000148011
    blend-op-multiply-ext 1000148012
    blend-op-screen-ext 1000148013
    blend-op-overlay-ext 1000148014
    blend-op-darken-ext 1000148015
    blend-op-lighten-ext 1000148016
    blend-op-colordodge-ext 1000148017
    blend-op-colorburn-ext 1000148018
    blend-op-hardlight-ext 1000148019
    blend-op-softlight-ext 1000148020
    blend-op-difference-ext 1000148021
    blend-op-exclusion-ext 1000148022
    blend-op-invert-ext 1000148023
    blend-op-invert-rgb-ext 1000148024
    blend-op-lineardodge-ext 1000148025
    blend-op-linearburn-ext 1000148026
    blend-op-vividlight-ext 1000148027
    blend-op-linearlight-ext 1000148028
    blend-op-pinlight-ext 1000148029
    blend-op-hardmix-ext 1000148030
    blend-op-hsl-hue-ext 1000148031
    blend-op-hsl-saturation-ext 1000148032
    blend-op-hsl-color-ext 1000148033
    blend-op-hsl-luminosity-ext 1000148034
    blend-op-plus-ext 1000148035
    blend-op-plus-clamped-ext 1000148036
    blend-op-plus-clamped-alpha-ext 1000148037
    blend-op-plus-darker-ext 1000148038
    blend-op-minus-ext 1000148039
    blend-op-minus-clamped-ext 1000148040
    blend-op-contrast-ext 1000148041
    blend-op-invert-ovg-ext 1000148042
    blend-op-red-ext 1000148043
    blend-op-green-ext 1000148044
    blend-op-blue-ext 1000148045
    blend-op-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCompareOp" doc-file 
    compare-op-never 0
    compare-op-less 1
    compare-op-equal 2
    compare-op-less-or-equal 3
    compare-op-greater 4
    compare-op-not-equal 5
    compare-op-greater-or-equal 6
    compare-op-always 7
    compare-op-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDynamicState" doc-file 
    dynamic-state-viewport 0
    dynamic-state-scissor 1
    dynamic-state-line-width 2
    dynamic-state-depth-bias 3
    dynamic-state-blend-constants 4
    dynamic-state-depth-bounds 5
    dynamic-state-stencil-compare-mask 6
    dynamic-state-stencil-write-mask 7
    dynamic-state-stencil-reference 8
    dynamic-state-cull-mode 1000267000
    dynamic-state-front-face 1000267001
    dynamic-state-primitive-topology 1000267002
    dynamic-state-viewport-with-count 1000267003
    dynamic-state-scissor-with-count 1000267004
    dynamic-state-vertex-input-binding-stride 1000267005
    dynamic-state-depth-test-enable 1000267006
    dynamic-state-depth-write-enable 1000267007
    dynamic-state-depth-compare-op 1000267008
    dynamic-state-depth-bounds-test-enable 1000267009
    dynamic-state-stencil-test-enable 1000267010
    dynamic-state-stencil-op 1000267011
    dynamic-state-rasterizer-discard-enable 1000377001
    dynamic-state-depth-bias-enable 1000377002
    dynamic-state-primitive-restart-enable 1000377004
    dynamic-state-viewport-w-scaling-nv 1000087000
    dynamic-state-discard-rectangle-ext 1000099000
    dynamic-state-sample-locations-ext 1000143000
    dynamic-state-ray-tracing-pipeline-stack-size-khr 1000347000
    dynamic-state-viewport-shading-rate-palette-nv 1000164004
    dynamic-state-viewport-coarse-sample-order-nv 1000164006
    dynamic-state-exclusive-scissor-nv 1000205001
    dynamic-state-fragment-shading-rate-khr 1000226000
    dynamic-state-line-stipple-ext 1000259000
    dynamic-state-vertex-input-ext 1000352000
    dynamic-state-patch-control-points-ext 1000377000
    dynamic-state-logic-op-ext 1000377003
    dynamic-state-color-write-enable-ext 1000381000
    dynamic-state-cull-mode-ext dynamic-state-cull-mode
    dynamic-state-front-face-ext dynamic-state-front-face
    dynamic-state-primitive-topology-ext dynamic-state-primitive-topology
    dynamic-state-viewport-with-count-ext dynamic-state-viewport-with-count
    dynamic-state-scissor-with-count-ext dynamic-state-scissor-with-count
    dynamic-state-vertex-input-binding-stride-ext dynamic-state-vertex-input-binding-stride
    dynamic-state-depth-test-enable-ext dynamic-state-depth-test-enable
    dynamic-state-depth-write-enable-ext dynamic-state-depth-write-enable
    dynamic-state-depth-compare-op-ext dynamic-state-depth-compare-op
    dynamic-state-depth-bounds-test-enable-ext dynamic-state-depth-bounds-test-enable
    dynamic-state-stencil-test-enable-ext dynamic-state-stencil-test-enable
    dynamic-state-stencil-op-ext dynamic-state-stencil-op
    dynamic-state-rasterizer-discard-enable-ext dynamic-state-rasterizer-discard-enable
    dynamic-state-depth-bias-enable-ext dynamic-state-depth-bias-enable
    dynamic-state-primitive-restart-enable-ext dynamic-state-primitive-restart-enable
    dynamic-state-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkFrontFace" doc-file 
    front-face-counter-clockwise 0
    front-face-clockwise 1
    front-face-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkVertexInputRate" doc-file 
    vertex-input-rate-vertex 0
    vertex-input-rate-instance 1
    vertex-input-rate-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPrimitiveTopology" doc-file 
    primitive-topology-point-list 0
    primitive-topology-line-list 1
    primitive-topology-line-strip 2
    primitive-topology-triangle-list 3
    primitive-topology-triangle-strip 4
    primitive-topology-triangle-fan 5
    primitive-topology-line-list-with-adjacency 6
    primitive-topology-line-strip-with-adjacency 7
    primitive-topology-triangle-list-with-adjacency 8
    primitive-topology-triangle-strip-with-adjacency 9
    primitive-topology-patch-list 10
    primitive-topology-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPolygonMode" doc-file 
    polygon-mode-fill 0
    polygon-mode-line 1
    polygon-mode-point 2
    polygon-mode-fill-rectangle-nv 1000153000
    polygon-mode-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkStencilOp" doc-file 
    stencil-op-keep 0
    stencil-op-zero 1
    stencil-op-replace 2
    stencil-op-increment-and-clamp 3
    stencil-op-decrement-and-clamp 4
    stencil-op-invert 5
    stencil-op-increment-and-wrap 6
    stencil-op-decrement-and-wrap 7
    stencil-op-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkLogicOp" doc-file 
    logic-op-clear 0
    logic-op-and 1
    logic-op-and-reverse 2
    logic-op-copy 3
    logic-op-and-inverted 4
    logic-op-no-op 5
    logic-op-xor 6
    logic-op-or 7
    logic-op-nor 8
    logic-op-equivalent 9
    logic-op-invert 10
    logic-op-or-reverse 11
    logic-op-copy-inverted 12
    logic-op-or-inverted 13
    logic-op-nand 14
    logic-op-set 15
    logic-op-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkBorderColor" doc-file 
    border-color-float-transparent-black 0
    border-color-int-transparent-black 1
    border-color-float-opaque-black 2
    border-color-int-opaque-black 3
    border-color-float-opaque-white 4
    border-color-int-opaque-white 5
    border-color-float-custom-ext 1000287003
    border-color-int-custom-ext 1000287004
    border-color-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkFilter" doc-file 
    filter-nearest 0
    filter-linear 1
    filter-cubic-img 1000015000
    filter-cubic-ext filter-cubic-img
    filter-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSamplerAddressMode" doc-file 
    sampler-address-mode-repeat 0
    sampler-address-mode-mirrored-repeat 1
    sampler-address-mode-clamp-to-edge 2
    sampler-address-mode-clamp-to-border 3
    sampler-address-mode-mirror-clamp-to-edge 4
    sampler-address-mode-mirror-clamp-to-edge-khr sampler-address-mode-mirror-clamp-to-edge
    sampler-address-mode-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSamplerMipmapMode" doc-file 
    sampler-mipmap-mode-nearest 0
    sampler-mipmap-mode-linear 1
    sampler-mipmap-mode-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDescriptorType" doc-file 
    descriptor-type-sampler 0
    descriptor-type-combined-image-sampler 1
    descriptor-type-sampled-image 2
    descriptor-type-storage-image 3
    descriptor-type-uniform-texel-buffer 4
    descriptor-type-storage-texel-buffer 5
    descriptor-type-uniform-buffer 6
    descriptor-type-storage-buffer 7
    descriptor-type-uniform-buffer-dynamic 8
    descriptor-type-storage-buffer-dynamic 9
    descriptor-type-input-attachment 10
    descriptor-type-inline-uniform-block 1000138000
    descriptor-type-acceleration-structure-khr 1000150000
    descriptor-type-acceleration-structure-nv 1000165000
    descriptor-type-mutable-valve 1000351000
    descriptor-type-inline-uniform-block-ext descriptor-type-inline-uniform-block
    descriptor-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAttachmentLoadOp" doc-file 
    attachment-load-op-load 0
    attachment-load-op-clear 1
    attachment-load-op-dont-care 2
    attachment-load-op-none-ext 1000400000
    attachment-load-op-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAttachmentStoreOp" doc-file 
    attachment-store-op-store 0
    attachment-store-op-dont-care 1
    attachment-store-op-none 1000301000
    attachment-store-op-none-khr attachment-store-op-none
    attachment-store-op-none-qcom attachment-store-op-none
    attachment-store-op-none-ext attachment-store-op-none
    attachment-store-op-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineBindPoint" doc-file 
    pipeline-bind-point-graphics 0
    pipeline-bind-point-compute 1
    pipeline-bind-point-ray-tracing-khr 1000165000
    pipeline-bind-point-subpass-shading-huawei 1000369003
    pipeline-bind-point-ray-tracing-nv pipeline-bind-point-ray-tracing-khr
    pipeline-bind-point-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCommandBufferLevel" doc-file 
    command-buffer-level-primary 0
    command-buffer-level-secondary 1
    command-buffer-level-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkIndexType" doc-file 
    index-type-uint16 0
    index-type-uint32 1
    index-type-none-khr 1000165000
    index-type-uint8-ext 1000265000
    index-type-none-nv index-type-none-khr
    index-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSubpassContents" doc-file 
    subpass-contents-inline 0
    subpass-contents-secondary-command-buffers 1
    subpass-contents-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAccessFlagBits" doc-file 
    access-indirect-command-read-bit #x00000001
    access-index-read-bit #x00000002
    access-vertex-attribute-read-bit #x00000004
    access-uniform-read-bit #x00000008
    access-input-attachment-read-bit #x00000010
    access-shader-read-bit #x00000020
    access-shader-write-bit #x00000040
    access-color-attachment-read-bit #x00000080
    access-color-attachment-write-bit #x00000100
    access-depth-stencil-attachment-read-bit #x00000200
    access-depth-stencil-attachment-write-bit #x00000400
    access-transfer-read-bit #x00000800
    access-transfer-write-bit #x00001000
    access-host-read-bit #x00002000
    access-host-write-bit #x00004000
    access-memory-read-bit #x00008000
    access-memory-write-bit #x00010000
    access-none 0
    access-transform-feedback-write-bit-ext #x02000000
    access-transform-feedback-counter-read-bit-ext #x04000000
    access-transform-feedback-counter-write-bit-ext #x08000000
    access-conditional-rendering-read-bit-ext #x00100000
    access-color-attachment-read-noncoherent-bit-ext #x00080000
    access-acceleration-structure-read-bit-khr #x00200000
    access-acceleration-structure-write-bit-khr #x00400000
    access-fragment-density-map-read-bit-ext #x01000000
    access-fragment-shading-rate-attachment-read-bit-khr #x00800000
    access-command-preprocess-read-bit-nv #x00020000
    access-command-preprocess-write-bit-nv #x00040000
    access-shading-rate-image-read-bit-nv access-fragment-shading-rate-attachment-read-bit-khr
    access-acceleration-structure-read-bit-nv access-acceleration-structure-read-bit-khr
    access-acceleration-structure-write-bit-nv access-acceleration-structure-write-bit-khr
    access-none-khr access-none
    access-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkImageAspectFlagBits" doc-file 
    image-aspect-color-bit #x00000001
    image-aspect-depth-bit #x00000002
    image-aspect-stencil-bit #x00000004
    image-aspect-metadata-bit #x00000008
    image-aspect-plane-0-bit #x00000010
    image-aspect-plane-1-bit #x00000020
    image-aspect-plane-2-bit #x00000040
    image-aspect-none 0
    image-aspect-memory-plane-0-bit-ext #x00000080
    image-aspect-memory-plane-1-bit-ext #x00000100
    image-aspect-memory-plane-2-bit-ext #x00000200
    image-aspect-memory-plane-3-bit-ext #x00000400
    image-aspect-plane-0-bit-khr image-aspect-plane-0-bit
    image-aspect-plane-1-bit-khr image-aspect-plane-1-bit
    image-aspect-plane-2-bit-khr image-aspect-plane-2-bit
    image-aspect-none-khr image-aspect-none
    image-aspect-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkFormatFeatureFlagBits" doc-file 
    format-feature-sampled-image-bit #x00000001
    format-feature-storage-image-bit #x00000002
    format-feature-storage-image-atomic-bit #x00000004
    format-feature-uniform-texel-buffer-bit #x00000008
    format-feature-storage-texel-buffer-bit #x00000010
    format-feature-storage-texel-buffer-atomic-bit #x00000020
    format-feature-vertex-buffer-bit #x00000040
    format-feature-color-attachment-bit #x00000080
    format-feature-color-attachment-blend-bit #x00000100
    format-feature-depth-stencil-attachment-bit #x00000200
    format-feature-blit-src-bit #x00000400
    format-feature-blit-dst-bit #x00000800
    format-feature-sampled-image-filter-linear-bit #x00001000
    format-feature-transfer-src-bit #x00004000
    format-feature-transfer-dst-bit #x00008000
    format-feature-midpoint-chroma-samples-bit #x00020000
    format-feature-sampled-image-ycbcr-conversion-linear-filter-bit #x00040000
    format-feature-sampled-image-ycbcr-conversion-separate-reconstruction-filter-bit #x00080000
    format-feature-sampled-image-ycbcr-conversion-chroma-reconstruction-explicit-bit #x00100000
    format-feature-sampled-image-ycbcr-conversion-chroma-reconstruction-explicit-forceable-bit #x00200000
    format-feature-disjoint-bit #x00400000
    format-feature-cosited-chroma-samples-bit #x00800000
    format-feature-sampled-image-filter-minmax-bit #x00010000
    format-feature-sampled-image-filter-cubic-bit-img #x00002000
    format-feature-video-decode-output-bit-khr #x02000000
    format-feature-video-decode-dpb-bit-khr #x04000000
    format-feature-acceleration-structure-vertex-buffer-bit-khr #x20000000
    format-feature-fragment-density-map-bit-ext #x01000000
    format-feature-fragment-shading-rate-attachment-bit-khr #x40000000
    format-feature-video-encode-input-bit-khr #x08000000
    format-feature-video-encode-dpb-bit-khr #x10000000
    format-feature-transfer-src-bit-khr format-feature-transfer-src-bit
    format-feature-transfer-dst-bit-khr format-feature-transfer-dst-bit
    format-feature-sampled-image-filter-minmax-bit-ext format-feature-sampled-image-filter-minmax-bit
    format-feature-midpoint-chroma-samples-bit-khr format-feature-midpoint-chroma-samples-bit
    format-feature-sampled-image-ycbcr-conversion-linear-filter-bit-khr format-feature-sampled-image-ycbcr-conversion-linear-filter-bit
    format-feature-sampled-image-ycbcr-conversion-separate-reconstruction-filter-bit-khr format-feature-sampled-image-ycbcr-conversion-separate-reconstruction-filter-bit
    format-feature-sampled-image-ycbcr-conversion-chroma-reconstruction-explicit-bit-khr format-feature-sampled-image-ycbcr-conversion-chroma-reconstruction-explicit-bit
    format-feature-sampled-image-ycbcr-conversion-chroma-reconstruction-explicit-forceable-bit-khr format-feature-sampled-image-ycbcr-conversion-chroma-reconstruction-explicit-forceable-bit
    format-feature-disjoint-bit-khr format-feature-disjoint-bit
    format-feature-cosited-chroma-samples-bit-khr format-feature-cosited-chroma-samples-bit
    format-feature-sampled-image-filter-cubic-bit-ext format-feature-sampled-image-filter-cubic-bit-img
    format-feature-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkImageCreateFlagBits" doc-file 
    image-create-sparse-binding-bit #x00000001
    image-create-sparse-residency-bit #x00000002
    image-create-sparse-aliased-bit #x00000004
    image-create-mutable-format-bit #x00000008
    image-create-cube-compatible-bit #x00000010
    image-create-alias-bit #x00000400
    image-create-split-instance-bind-regions-bit #x00000040
    image-create-2d-array-compatible-bit #x00000020
    image-create-block-texel-view-compatible-bit #x00000080
    image-create-extended-usage-bit #x00000100
    image-create-protected-bit #x00000800
    image-create-disjoint-bit #x00000200
    image-create-corner-sampled-bit-nv #x00002000
    image-create-sample-locations-compatible-depth-bit-ext #x00001000
    image-create-subsampled-bit-ext #x00004000
    image-create-2d-view-compatible-bit-ext #x00020000
    image-create-fragment-density-map-offset-bit-qcom #x00008000
    image-create-split-instance-bind-regions-bit-khr image-create-split-instance-bind-regions-bit
    image-create-2d-array-compatible-bit-khr image-create-2d-array-compatible-bit
    image-create-block-texel-view-compatible-bit-khr image-create-block-texel-view-compatible-bit
    image-create-extended-usage-bit-khr image-create-extended-usage-bit
    image-create-disjoint-bit-khr image-create-disjoint-bit
    image-create-alias-bit-khr image-create-alias-bit
    image-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSampleCountFlagBits" doc-file 
    sample-count-1-bit #x00000001
    sample-count-2-bit #x00000002
    sample-count-4-bit #x00000004
    sample-count-8-bit #x00000008
    sample-count-16-bit #x00000010
    sample-count-32-bit #x00000020
    sample-count-64-bit #x00000040
    sample-count-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkImageUsageFlagBits" doc-file 
    image-usage-transfer-src-bit #x00000001
    image-usage-transfer-dst-bit #x00000002
    image-usage-sampled-bit #x00000004
    image-usage-storage-bit #x00000008
    image-usage-color-attachment-bit #x00000010
    image-usage-depth-stencil-attachment-bit #x00000020
    image-usage-transient-attachment-bit #x00000040
    image-usage-input-attachment-bit #x00000080
    image-usage-video-decode-dst-bit-khr #x00000400
    image-usage-video-decode-src-bit-khr #x00000800
    image-usage-video-decode-dpb-bit-khr #x00001000
    image-usage-fragment-density-map-bit-ext #x00000200
    image-usage-fragment-shading-rate-attachment-bit-khr #x00000100
    image-usage-video-encode-dst-bit-khr #x00002000
    image-usage-video-encode-src-bit-khr #x00004000
    image-usage-video-encode-dpb-bit-khr #x00008000
    image-usage-invocation-mask-bit-huawei #x00040000
    image-usage-shading-rate-image-bit-nv image-usage-fragment-shading-rate-attachment-bit-khr
    image-usage-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkInstanceCreateFlagBits" doc-file 
    instance-create-enumerate-portability-bit-khr #x00000001
    instance-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkMemoryHeapFlagBits" doc-file 
    memory-heap-device-local-bit #x00000001
    memory-heap-multi-instance-bit #x00000002
    memory-heap-multi-instance-bit-khr memory-heap-multi-instance-bit
    memory-heap-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkMemoryPropertyFlagBits" doc-file 
    memory-property-device-local-bit #x00000001
    memory-property-host-visible-bit #x00000002
    memory-property-host-coherent-bit #x00000004
    memory-property-host-cached-bit #x00000008
    memory-property-lazily-allocated-bit #x00000010
    memory-property-protected-bit #x00000020
    memory-property-device-coherent-bit-amd #x00000040
    memory-property-device-uncached-bit-amd #x00000080
    memory-property-rdma-capable-bit-nv #x00000100
    memory-property-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkQueueFlagBits" doc-file 
    queue-graphics-bit #x00000001
    queue-compute-bit #x00000002
    queue-transfer-bit #x00000004
    queue-sparse-binding-bit #x00000008
    queue-protected-bit #x00000010
    queue-video-decode-bit-khr #x00000020
    queue-video-encode-bit-khr #x00000040
    queue-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDeviceQueueCreateFlagBits" doc-file 
    device-queue-create-protected-bit #x00000001
    device-queue-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineStageFlagBits" doc-file 
    pipeline-stage-top-of-pipe-bit #x00000001
    pipeline-stage-draw-indirect-bit #x00000002
    pipeline-stage-vertex-input-bit #x00000004
    pipeline-stage-vertex-shader-bit #x00000008
    pipeline-stage-tessellation-control-shader-bit #x00000010
    pipeline-stage-tessellation-evaluation-shader-bit #x00000020
    pipeline-stage-geometry-shader-bit #x00000040
    pipeline-stage-fragment-shader-bit #x00000080
    pipeline-stage-early-fragment-tests-bit #x00000100
    pipeline-stage-late-fragment-tests-bit #x00000200
    pipeline-stage-color-attachment-output-bit #x00000400
    pipeline-stage-compute-shader-bit #x00000800
    pipeline-stage-transfer-bit #x00001000
    pipeline-stage-bottom-of-pipe-bit #x00002000
    pipeline-stage-host-bit #x00004000
    pipeline-stage-all-graphics-bit #x00008000
    pipeline-stage-all-commands-bit #x00010000
    pipeline-stage-none 0
    pipeline-stage-transform-feedback-bit-ext #x01000000
    pipeline-stage-conditional-rendering-bit-ext #x00040000
    pipeline-stage-acceleration-structure-build-bit-khr #x02000000
    pipeline-stage-ray-tracing-shader-bit-khr #x00200000
    pipeline-stage-task-shader-bit-nv #x00080000
    pipeline-stage-mesh-shader-bit-nv #x00100000
    pipeline-stage-fragment-density-process-bit-ext #x00800000
    pipeline-stage-fragment-shading-rate-attachment-bit-khr #x00400000
    pipeline-stage-command-preprocess-bit-nv #x00020000
    pipeline-stage-shading-rate-image-bit-nv pipeline-stage-fragment-shading-rate-attachment-bit-khr
    pipeline-stage-ray-tracing-shader-bit-nv pipeline-stage-ray-tracing-shader-bit-khr
    pipeline-stage-acceleration-structure-build-bit-nv pipeline-stage-acceleration-structure-build-bit-khr
    pipeline-stage-none-khr pipeline-stage-none
    pipeline-stage-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSparseMemoryBindFlagBits" doc-file 
    sparse-memory-bind-metadata-bit #x00000001
    sparse-memory-bind-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSparseImageFormatFlagBits" doc-file 
    sparse-image-format-single-miptail-bit #x00000001
    sparse-image-format-aligned-mip-size-bit #x00000002
    sparse-image-format-nonstandard-block-size-bit #x00000004
    sparse-image-format-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkFenceCreateFlagBits" doc-file 
    fence-create-signaled-bit #x00000001
    fence-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkEventCreateFlagBits" doc-file 
    event-create-device-only-bit #x00000001
    event-create-device-only-bit-khr event-create-device-only-bit
    event-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkQueryPipelineStatisticFlagBits" doc-file 
    query-pipeline-statistic-input-assembly-vertices-bit #x00000001
    query-pipeline-statistic-input-assembly-primitives-bit #x00000002
    query-pipeline-statistic-vertex-shader-invocations-bit #x00000004
    query-pipeline-statistic-geometry-shader-invocations-bit #x00000008
    query-pipeline-statistic-geometry-shader-primitives-bit #x00000010
    query-pipeline-statistic-clipping-invocations-bit #x00000020
    query-pipeline-statistic-clipping-primitives-bit #x00000040
    query-pipeline-statistic-fragment-shader-invocations-bit #x00000080
    query-pipeline-statistic-tessellation-control-shader-patches-bit #x00000100
    query-pipeline-statistic-tessellation-evaluation-shader-invocations-bit #x00000200
    query-pipeline-statistic-compute-shader-invocations-bit #x00000400
    query-pipeline-statistic-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkQueryResultFlagBits" doc-file 
    query-result-64-bit #x00000001
    query-result-wait-bit #x00000002
    query-result-with-availability-bit #x00000004
    query-result-partial-bit #x00000008
    query-result-with-status-bit-khr #x00000010
    query-result-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkBufferCreateFlagBits" doc-file 
    buffer-create-sparse-binding-bit #x00000001
    buffer-create-sparse-residency-bit #x00000002
    buffer-create-sparse-aliased-bit #x00000004
    buffer-create-protected-bit #x00000008
    buffer-create-device-address-capture-replay-bit #x00000010
    buffer-create-device-address-capture-replay-bit-ext buffer-create-device-address-capture-replay-bit
    buffer-create-device-address-capture-replay-bit-khr buffer-create-device-address-capture-replay-bit
    buffer-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkBufferUsageFlagBits" doc-file 
    buffer-usage-transfer-src-bit #x00000001
    buffer-usage-transfer-dst-bit #x00000002
    buffer-usage-uniform-texel-buffer-bit #x00000004
    buffer-usage-storage-texel-buffer-bit #x00000008
    buffer-usage-uniform-buffer-bit #x00000010
    buffer-usage-storage-buffer-bit #x00000020
    buffer-usage-index-buffer-bit #x00000040
    buffer-usage-vertex-buffer-bit #x00000080
    buffer-usage-indirect-buffer-bit #x00000100
    buffer-usage-shader-device-address-bit #x00020000
    buffer-usage-video-decode-src-bit-khr #x00002000
    buffer-usage-video-decode-dst-bit-khr #x00004000
    buffer-usage-transform-feedback-buffer-bit-ext #x00000800
    buffer-usage-transform-feedback-counter-buffer-bit-ext #x00001000
    buffer-usage-conditional-rendering-bit-ext #x00000200
    buffer-usage-acceleration-structure-build-input-read-only-bit-khr #x00080000
    buffer-usage-acceleration-structure-storage-bit-khr #x00100000
    buffer-usage-shader-binding-table-bit-khr #x00000400
    buffer-usage-video-encode-dst-bit-khr #x00008000
    buffer-usage-video-encode-src-bit-khr #x00010000
    buffer-usage-ray-tracing-bit-nv buffer-usage-shader-binding-table-bit-khr
    buffer-usage-shader-device-address-bit-ext buffer-usage-shader-device-address-bit
    buffer-usage-shader-device-address-bit-khr buffer-usage-shader-device-address-bit
    buffer-usage-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkImageViewCreateFlagBits" doc-file 
    image-view-create-fragment-density-map-dynamic-bit-ext #x00000001
    image-view-create-fragment-density-map-deferred-bit-ext #x00000002
    image-view-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineCacheCreateFlagBits" doc-file 
    pipeline-cache-create-externally-synchronized-bit #x00000001
    pipeline-cache-create-externally-synchronized-bit-ext pipeline-cache-create-externally-synchronized-bit
    pipeline-cache-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkColorComponentFlagBits" doc-file 
    color-component-r-bit #x00000001
    color-component-g-bit #x00000002
    color-component-b-bit #x00000004
    color-component-a-bit #x00000008
    color-component-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineCreateFlagBits" doc-file 
    pipeline-create-disable-optimization-bit #x00000001
    pipeline-create-allow-derivatives-bit #x00000002
    pipeline-create-derivative-bit #x00000004
    pipeline-create-view-index-from-device-index-bit #x00000008
    pipeline-create-dispatch-base-bit #x00000010
    pipeline-create-fail-on-pipeline-compile-required-bit #x00000100
    pipeline-create-early-return-on-failure-bit #x00000200
    pipeline-create-rendering-fragment-shading-rate-attachment-bit-khr #x00200000
    pipeline-create-rendering-fragment-density-map-attachment-bit-ext #x00400000
    pipeline-create-ray-tracing-no-null-any-hit-shaders-bit-khr #x00004000
    pipeline-create-ray-tracing-no-null-closest-hit-shaders-bit-khr #x00008000
    pipeline-create-ray-tracing-no-null-miss-shaders-bit-khr #x00010000
    pipeline-create-ray-tracing-no-null-intersection-shaders-bit-khr #x00020000
    pipeline-create-ray-tracing-skip-triangles-bit-khr #x00001000
    pipeline-create-ray-tracing-skip-aabbs-bit-khr #x00002000
    pipeline-create-ray-tracing-shader-group-handle-capture-replay-bit-khr #x00080000
    pipeline-create-defer-compile-bit-nv #x00000020
    pipeline-create-capture-statistics-bit-khr #x00000040
    pipeline-create-capture-internal-representations-bit-khr #x00000080
    pipeline-create-indirect-bindable-bit-nv #x00040000
    pipeline-create-library-bit-khr #x00000800
    pipeline-create-retain-link-time-optimization-info-bit-ext #x00800000
    pipeline-create-link-time-optimization-bit-ext #x00000400
    pipeline-create-ray-tracing-allow-motion-bit-nv #x00100000
    pipeline-create-dispatch-base pipeline-create-dispatch-base-bit
    pipeline-rasterization-state-create-fragment-shading-rate-attachment-bit-khr pipeline-create-rendering-fragment-shading-rate-attachment-bit-khr
    pipeline-rasterization-state-create-fragment-density-map-attachment-bit-ext pipeline-create-rendering-fragment-density-map-attachment-bit-ext
    pipeline-create-view-index-from-device-index-bit-khr pipeline-create-view-index-from-device-index-bit
    pipeline-create-dispatch-base-khr pipeline-create-dispatch-base
    pipeline-create-fail-on-pipeline-compile-required-bit-ext pipeline-create-fail-on-pipeline-compile-required-bit
    pipeline-create-early-return-on-failure-bit-ext pipeline-create-early-return-on-failure-bit
    pipeline-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineShaderStageCreateFlagBits" doc-file 
    pipeline-shader-stage-create-allow-varying-subgroup-size-bit #x00000001
    pipeline-shader-stage-create-require-full-subgroups-bit #x00000002
    pipeline-shader-stage-create-allow-varying-subgroup-size-bit-ext pipeline-shader-stage-create-allow-varying-subgroup-size-bit
    pipeline-shader-stage-create-require-full-subgroups-bit-ext pipeline-shader-stage-create-require-full-subgroups-bit
    pipeline-shader-stage-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkShaderStageFlagBits" doc-file 
    shader-stage-vertex-bit #x00000001
    shader-stage-tessellation-control-bit #x00000002
    shader-stage-tessellation-evaluation-bit #x00000004
    shader-stage-geometry-bit #x00000008
    shader-stage-fragment-bit #x00000010
    shader-stage-compute-bit #x00000020
    shader-stage-all-graphics #x0000001F
    shader-stage-all #x7FFFFFFF
    shader-stage-raygen-bit-khr #x00000100
    shader-stage-any-hit-bit-khr #x00000200
    shader-stage-closest-hit-bit-khr #x00000400
    shader-stage-miss-bit-khr #x00000800
    shader-stage-intersection-bit-khr #x00001000
    shader-stage-callable-bit-khr #x00002000
    shader-stage-task-bit-nv #x00000040
    shader-stage-mesh-bit-nv #x00000080
    shader-stage-subpass-shading-bit-huawei #x00004000
    shader-stage-raygen-bit-nv shader-stage-raygen-bit-khr
    shader-stage-any-hit-bit-nv shader-stage-any-hit-bit-khr
    shader-stage-closest-hit-bit-nv shader-stage-closest-hit-bit-khr
    shader-stage-miss-bit-nv shader-stage-miss-bit-khr
    shader-stage-intersection-bit-nv shader-stage-intersection-bit-khr
    shader-stage-callable-bit-nv shader-stage-callable-bit-khr
    shader-stage-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCullModeFlagBits" doc-file 
    cull-mode-none 0
    cull-mode-front-bit #x00000001
    cull-mode-back-bit #x00000002
    cull-mode-front-and-back #x00000003
    cull-mode-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineDepthStencilStateCreateFlagBits" doc-file 
    pipeline-depth-stencil-state-create-rasterization-order-attachment-depth-access-bit-arm #x00000001
    pipeline-depth-stencil-state-create-rasterization-order-attachment-stencil-access-bit-arm #x00000002
    pipeline-depth-stencil-state-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineColorBlendStateCreateFlagBits" doc-file 
    pipeline-color-blend-state-create-rasterization-order-attachment-access-bit-arm #x00000001
    pipeline-color-blend-state-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineLayoutCreateFlagBits" doc-file 
    pipeline-layout-create-independent-sets-bit-ext #x00000002
    pipeline-layout-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSamplerCreateFlagBits" doc-file 
    sampler-create-subsampled-bit-ext #x00000001
    sampler-create-subsampled-coarse-reconstruction-bit-ext #x00000002
    sampler-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDescriptorPoolCreateFlagBits" doc-file 
    descriptor-pool-create-free-descriptor-set-bit #x00000001
    descriptor-pool-create-update-after-bind-bit #x00000002
    descriptor-pool-create-host-only-bit-valve #x00000004
    descriptor-pool-create-update-after-bind-bit-ext descriptor-pool-create-update-after-bind-bit
    descriptor-pool-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDescriptorSetLayoutCreateFlagBits" doc-file 
    descriptor-set-layout-create-update-after-bind-pool-bit #x00000002
    descriptor-set-layout-create-push-descriptor-bit-khr #x00000001
    descriptor-set-layout-create-host-only-pool-bit-valve #x00000004
    descriptor-set-layout-create-update-after-bind-pool-bit-ext descriptor-set-layout-create-update-after-bind-pool-bit
    descriptor-set-layout-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAttachmentDescriptionFlagBits" doc-file 
    attachment-description-may-alias-bit #x00000001
    attachment-description-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDependencyFlagBits" doc-file 
    dependency-by-region-bit #x00000001
    dependency-device-group-bit #x00000004
    dependency-view-local-bit #x00000002
    dependency-view-local-bit-khr dependency-view-local-bit
    dependency-device-group-bit-khr dependency-device-group-bit
    dependency-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkFramebufferCreateFlagBits" doc-file 
    framebuffer-create-imageless-bit #x00000001
    framebuffer-create-imageless-bit-khr framebuffer-create-imageless-bit
    framebuffer-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkRenderPassCreateFlagBits" doc-file 
    render-pass-create-transform-bit-qcom #x00000002
    render-pass-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSubpassDescriptionFlagBits" doc-file 
    subpass-description-per-view-attributes-bit-nvx #x00000001
    subpass-description-per-view-position-x-only-bit-nvx #x00000002
    subpass-description-fragment-region-bit-qcom #x00000004
    subpass-description-shader-resolve-bit-qcom #x00000008
    subpass-description-rasterization-order-attachment-color-access-bit-arm #x00000010
    subpass-description-rasterization-order-attachment-depth-access-bit-arm #x00000020
    subpass-description-rasterization-order-attachment-stencil-access-bit-arm #x00000040
    subpass-description-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCommandPoolCreateFlagBits" doc-file 
    command-pool-create-transient-bit #x00000001
    command-pool-create-reset-command-buffer-bit #x00000002
    command-pool-create-protected-bit #x00000004
    command-pool-create-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCommandPoolResetFlagBits" doc-file 
    command-pool-reset-release-resources-bit #x00000001
    command-pool-reset-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCommandBufferUsageFlagBits" doc-file 
    command-buffer-usage-one-time-submit-bit #x00000001
    command-buffer-usage-render-pass-continue-bit #x00000002
    command-buffer-usage-simultaneous-use-bit #x00000004
    command-buffer-usage-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkQueryControlFlagBits" doc-file 
    query-control-precise-bit #x00000001
    query-control-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCommandBufferResetFlagBits" doc-file 
    command-buffer-reset-release-resources-bit #x00000001
    command-buffer-reset-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkStencilFaceFlagBits" doc-file 
    stencil-face-front-bit #x00000001
    stencil-face-back-bit #x00000002
    stencil-face-front-and-back #x00000003
    stencil-front-and-back stencil-face-front-and-back
    stencil-face-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPointClippingBehavior" doc-file 
    point-clipping-behavior-all-clip-planes 0
    point-clipping-behavior-user-clip-planes-only 1
    point-clipping-behavior-all-clip-planes-khr point-clipping-behavior-all-clip-planes
    point-clipping-behavior-user-clip-planes-only-khr point-clipping-behavior-user-clip-planes-only
    point-clipping-behavior-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkTessellationDomainOrigin" doc-file 
    tessellation-domain-origin-upper-left 0
    tessellation-domain-origin-lower-left 1
    tessellation-domain-origin-upper-left-khr tessellation-domain-origin-upper-left
    tessellation-domain-origin-lower-left-khr tessellation-domain-origin-lower-left
    tessellation-domain-origin-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSamplerYcbcrModelConversion" doc-file 
    sampler-ycbcr-model-conversion-rgb-identity 0
    sampler-ycbcr-model-conversion-ycbcr-identity 1
    sampler-ycbcr-model-conversion-ycbcr-709 2
    sampler-ycbcr-model-conversion-ycbcr-601 3
    sampler-ycbcr-model-conversion-ycbcr-2020 4
    sampler-ycbcr-model-conversion-rgb-identity-khr sampler-ycbcr-model-conversion-rgb-identity
    sampler-ycbcr-model-conversion-ycbcr-identity-khr sampler-ycbcr-model-conversion-ycbcr-identity
    sampler-ycbcr-model-conversion-ycbcr-709-khr sampler-ycbcr-model-conversion-ycbcr-709
    sampler-ycbcr-model-conversion-ycbcr-601-khr sampler-ycbcr-model-conversion-ycbcr-601
    sampler-ycbcr-model-conversion-ycbcr-2020-khr sampler-ycbcr-model-conversion-ycbcr-2020
    sampler-ycbcr-model-conversion-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSamplerYcbcrRange" doc-file 
    sampler-ycbcr-range-itu-full 0
    sampler-ycbcr-range-itu-narrow 1
    sampler-ycbcr-range-itu-full-khr sampler-ycbcr-range-itu-full
    sampler-ycbcr-range-itu-narrow-khr sampler-ycbcr-range-itu-narrow
    sampler-ycbcr-range-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkChromaLocation" doc-file 
    chroma-location-cosited-even 0
    chroma-location-midpoint 1
    chroma-location-cosited-even-khr chroma-location-cosited-even
    chroma-location-midpoint-khr chroma-location-midpoint
    chroma-location-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDescriptorUpdateTemplateType" doc-file 
    descriptor-update-template-type-descriptor-set 0
    descriptor-update-template-type-push-descriptors-khr 1
    descriptor-update-template-type-descriptor-set-khr descriptor-update-template-type-descriptor-set
    descriptor-update-template-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSubgroupFeatureFlagBits" doc-file 
    subgroup-feature-basic-bit #x00000001
    subgroup-feature-vote-bit #x00000002
    subgroup-feature-arithmetic-bit #x00000004
    subgroup-feature-ballot-bit #x00000008
    subgroup-feature-shuffle-bit #x00000010
    subgroup-feature-shuffle-relative-bit #x00000020
    subgroup-feature-clustered-bit #x00000040
    subgroup-feature-quad-bit #x00000080
    subgroup-feature-partitioned-bit-nv #x00000100
    subgroup-feature-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPeerMemoryFeatureFlagBits" doc-file 
    peer-memory-feature-copy-src-bit #x00000001
    peer-memory-feature-copy-dst-bit #x00000002
    peer-memory-feature-generic-src-bit #x00000004
    peer-memory-feature-generic-dst-bit #x00000008
    peer-memory-feature-copy-src-bit-khr peer-memory-feature-copy-src-bit
    peer-memory-feature-copy-dst-bit-khr peer-memory-feature-copy-dst-bit
    peer-memory-feature-generic-src-bit-khr peer-memory-feature-generic-src-bit
    peer-memory-feature-generic-dst-bit-khr peer-memory-feature-generic-dst-bit
    peer-memory-feature-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkMemoryAllocateFlagBits" doc-file 
    memory-allocate-device-mask-bit #x00000001
    memory-allocate-device-address-bit #x00000002
    memory-allocate-device-address-capture-replay-bit #x00000004
    memory-allocate-device-mask-bit-khr memory-allocate-device-mask-bit
    memory-allocate-device-address-bit-khr memory-allocate-device-address-bit
    memory-allocate-device-address-capture-replay-bit-khr memory-allocate-device-address-capture-replay-bit
    memory-allocate-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkExternalMemoryHandleTypeFlagBits" doc-file 
    external-memory-handle-type-opaque-fd-bit #x00000001
    external-memory-handle-type-opaque-win32-bit #x00000002
    external-memory-handle-type-opaque-win32-kmt-bit #x00000004
    external-memory-handle-type-d3d11-texture-bit #x00000008
    external-memory-handle-type-d3d11-texture-kmt-bit #x00000010
    external-memory-handle-type-d3d12-heap-bit #x00000020
    external-memory-handle-type-d3d12-resource-bit #x00000040
    external-memory-handle-type-dma-buf-bit-ext #x00000200
    external-memory-handle-type-android-hardware-buffer-bit-android #x00000400
    external-memory-handle-type-host-allocation-bit-ext #x00000080
    external-memory-handle-type-host-mapped-foreign-memory-bit-ext #x00000100
    external-memory-handle-type-zircon-vmo-bit-fuchsia #x00000800
    external-memory-handle-type-rdma-address-bit-nv #x00001000
    external-memory-handle-type-opaque-fd-bit-khr external-memory-handle-type-opaque-fd-bit
    external-memory-handle-type-opaque-win32-bit-khr external-memory-handle-type-opaque-win32-bit
    external-memory-handle-type-opaque-win32-kmt-bit-khr external-memory-handle-type-opaque-win32-kmt-bit
    external-memory-handle-type-d3d11-texture-bit-khr external-memory-handle-type-d3d11-texture-bit
    external-memory-handle-type-d3d11-texture-kmt-bit-khr external-memory-handle-type-d3d11-texture-kmt-bit
    external-memory-handle-type-d3d12-heap-bit-khr external-memory-handle-type-d3d12-heap-bit
    external-memory-handle-type-d3d12-resource-bit-khr external-memory-handle-type-d3d12-resource-bit
    external-memory-handle-type-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkExternalMemoryFeatureFlagBits" doc-file 
    external-memory-feature-dedicated-only-bit #x00000001
    external-memory-feature-exportable-bit #x00000002
    external-memory-feature-importable-bit #x00000004
    external-memory-feature-dedicated-only-bit-khr external-memory-feature-dedicated-only-bit
    external-memory-feature-exportable-bit-khr external-memory-feature-exportable-bit
    external-memory-feature-importable-bit-khr external-memory-feature-importable-bit
    external-memory-feature-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkExternalFenceHandleTypeFlagBits" doc-file 
    external-fence-handle-type-opaque-fd-bit #x00000001
    external-fence-handle-type-opaque-win32-bit #x00000002
    external-fence-handle-type-opaque-win32-kmt-bit #x00000004
    external-fence-handle-type-sync-fd-bit #x00000008
    external-fence-handle-type-opaque-fd-bit-khr external-fence-handle-type-opaque-fd-bit
    external-fence-handle-type-opaque-win32-bit-khr external-fence-handle-type-opaque-win32-bit
    external-fence-handle-type-opaque-win32-kmt-bit-khr external-fence-handle-type-opaque-win32-kmt-bit
    external-fence-handle-type-sync-fd-bit-khr external-fence-handle-type-sync-fd-bit
    external-fence-handle-type-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkExternalFenceFeatureFlagBits" doc-file 
    external-fence-feature-exportable-bit #x00000001
    external-fence-feature-importable-bit #x00000002
    external-fence-feature-exportable-bit-khr external-fence-feature-exportable-bit
    external-fence-feature-importable-bit-khr external-fence-feature-importable-bit
    external-fence-feature-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkFenceImportFlagBits" doc-file 
    fence-import-temporary-bit #x00000001
    fence-import-temporary-bit-khr fence-import-temporary-bit
    fence-import-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSemaphoreImportFlagBits" doc-file 
    semaphore-import-temporary-bit #x00000001
    semaphore-import-temporary-bit-khr semaphore-import-temporary-bit
    semaphore-import-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkExternalSemaphoreHandleTypeFlagBits" doc-file 
    external-semaphore-handle-type-opaque-fd-bit #x00000001
    external-semaphore-handle-type-opaque-win32-bit #x00000002
    external-semaphore-handle-type-opaque-win32-kmt-bit #x00000004
    external-semaphore-handle-type-d3d12-fence-bit #x00000008
    external-semaphore-handle-type-sync-fd-bit #x00000010
    external-semaphore-handle-type-zircon-event-bit-fuchsia #x00000080
    external-semaphore-handle-type-d3d11-fence-bit external-semaphore-handle-type-d3d12-fence-bit
    external-semaphore-handle-type-opaque-fd-bit-khr external-semaphore-handle-type-opaque-fd-bit
    external-semaphore-handle-type-opaque-win32-bit-khr external-semaphore-handle-type-opaque-win32-bit
    external-semaphore-handle-type-opaque-win32-kmt-bit-khr external-semaphore-handle-type-opaque-win32-kmt-bit
    external-semaphore-handle-type-d3d12-fence-bit-khr external-semaphore-handle-type-d3d12-fence-bit
    external-semaphore-handle-type-sync-fd-bit-khr external-semaphore-handle-type-sync-fd-bit
    external-semaphore-handle-type-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkExternalSemaphoreFeatureFlagBits" doc-file 
    external-semaphore-feature-exportable-bit #x00000001
    external-semaphore-feature-importable-bit #x00000002
    external-semaphore-feature-exportable-bit-khr external-semaphore-feature-exportable-bit
    external-semaphore-feature-importable-bit-khr external-semaphore-feature-importable-bit
    external-semaphore-feature-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDriverId" doc-file 
    driver-id-amd-proprietary 1
    driver-id-amd-open-source 2
    driver-id-mesa-radv 3
    driver-id-nvidia-proprietary 4
    driver-id-intel-proprietary-windows 5
    driver-id-intel-open-source-mesa 6
    driver-id-imagination-proprietary 7
    driver-id-qualcomm-proprietary 8
    driver-id-arm-proprietary 9
    driver-id-google-swiftshader 10
    driver-id-ggp-proprietary 11
    driver-id-broadcom-proprietary 12
    driver-id-mesa-llvmpipe 13
    driver-id-moltenvk 14
    driver-id-coreavi-proprietary 15
    driver-id-juice-proprietary 16
    driver-id-verisilicon-proprietary 17
    driver-id-mesa-turnip 18
    driver-id-mesa-v3dv 19
    driver-id-mesa-panvk 20
    driver-id-samsung-proprietary 21
    driver-id-mesa-venus 22
    driver-id-amd-proprietary-khr driver-id-amd-proprietary
    driver-id-amd-open-source-khr driver-id-amd-open-source
    driver-id-mesa-radv-khr driver-id-mesa-radv
    driver-id-nvidia-proprietary-khr driver-id-nvidia-proprietary
    driver-id-intel-proprietary-windows-khr driver-id-intel-proprietary-windows
    driver-id-intel-open-source-mesa-khr driver-id-intel-open-source-mesa
    driver-id-imagination-proprietary-khr driver-id-imagination-proprietary
    driver-id-qualcomm-proprietary-khr driver-id-qualcomm-proprietary
    driver-id-arm-proprietary-khr driver-id-arm-proprietary
    driver-id-google-swiftshader-khr driver-id-google-swiftshader
    driver-id-ggp-proprietary-khr driver-id-ggp-proprietary
    driver-id-broadcom-proprietary-khr driver-id-broadcom-proprietary
    driver-id-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkShaderFloatControlsIndependence" doc-file 
    shader-float-controls-independence-32-bit-only 0
    shader-float-controls-independence-all 1
    shader-float-controls-independence-none 2
    shader-float-controls-independence-32-bit-only-khr shader-float-controls-independence-32-bit-only
    shader-float-controls-independence-all-khr shader-float-controls-independence-all
    shader-float-controls-independence-none-khr shader-float-controls-independence-none
    shader-float-controls-independence-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSamplerReductionMode" doc-file 
    sampler-reduction-mode-weighted-average 0
    sampler-reduction-mode-min 1
    sampler-reduction-mode-max 2
    sampler-reduction-mode-weighted-average-ext sampler-reduction-mode-weighted-average
    sampler-reduction-mode-min-ext sampler-reduction-mode-min
    sampler-reduction-mode-max-ext sampler-reduction-mode-max
    sampler-reduction-mode-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSemaphoreType" doc-file 
    semaphore-type-binary 0
    semaphore-type-timeline 1
    semaphore-type-binary-khr semaphore-type-binary
    semaphore-type-timeline-khr semaphore-type-timeline
    semaphore-type-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkResolveModeFlagBits" doc-file 
    resolve-mode-none 0
    resolve-mode-sample-zero-bit #x00000001
    resolve-mode-average-bit #x00000002
    resolve-mode-min-bit #x00000004
    resolve-mode-max-bit #x00000008
    resolve-mode-none-khr resolve-mode-none
    resolve-mode-sample-zero-bit-khr resolve-mode-sample-zero-bit
    resolve-mode-average-bit-khr resolve-mode-average-bit
    resolve-mode-min-bit-khr resolve-mode-min-bit
    resolve-mode-max-bit-khr resolve-mode-max-bit
    resolve-mode-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDescriptorBindingFlagBits" doc-file 
    descriptor-binding-update-after-bind-bit #x00000001
    descriptor-binding-update-unused-while-pending-bit #x00000002
    descriptor-binding-partially-bound-bit #x00000004
    descriptor-binding-variable-descriptor-count-bit #x00000008
    descriptor-binding-update-after-bind-bit-ext descriptor-binding-update-after-bind-bit
    descriptor-binding-update-unused-while-pending-bit-ext descriptor-binding-update-unused-while-pending-bit
    descriptor-binding-partially-bound-bit-ext descriptor-binding-partially-bound-bit
    descriptor-binding-variable-descriptor-count-bit-ext descriptor-binding-variable-descriptor-count-bit
    descriptor-binding-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSemaphoreWaitFlagBits" doc-file 
    semaphore-wait-any-bit #x00000001
    semaphore-wait-any-bit-khr semaphore-wait-any-bit
    semaphore-wait-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineCreationFeedbackFlagBits" doc-file 
    pipeline-creation-feedback-valid-bit #x00000001
    pipeline-creation-feedback-application-pipeline-cache-hit-bit #x00000002
    pipeline-creation-feedback-base-pipeline-acceleration-bit #x00000004
    pipeline-creation-feedback-valid-bit-ext pipeline-creation-feedback-valid-bit
    pipeline-creation-feedback-application-pipeline-cache-hit-bit-ext pipeline-creation-feedback-application-pipeline-cache-hit-bit
    pipeline-creation-feedback-base-pipeline-acceleration-bit-ext pipeline-creation-feedback-base-pipeline-acceleration-bit
    pipeline-creation-feedback-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkToolPurposeFlagBits" doc-file 
    tool-purpose-validation-bit #x00000001
    tool-purpose-profiling-bit #x00000002
    tool-purpose-tracing-bit #x00000004
    tool-purpose-additional-features-bit #x00000008
    tool-purpose-modifying-features-bit #x00000010
    tool-purpose-debug-reporting-bit-ext #x00000020
    tool-purpose-debug-markers-bit-ext #x00000040
    tool-purpose-validation-bit-ext tool-purpose-validation-bit
    tool-purpose-profiling-bit-ext tool-purpose-profiling-bit
    tool-purpose-tracing-bit-ext tool-purpose-tracing-bit
    tool-purpose-additional-features-bit-ext tool-purpose-additional-features-bit
    tool-purpose-modifying-features-bit-ext tool-purpose-modifying-features-bit
    tool-purpose-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSubmitFlagBits" doc-file 
    submit-protected-bit #x00000001
    submit-protected-bit-khr submit-protected-bit
    submit-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkRenderingFlagBits" doc-file 
    rendering-contents-secondary-command-buffers-bit #x00000001
    rendering-suspending-bit #x00000002
    rendering-resuming-bit #x00000004
    rendering-contents-secondary-command-buffers-bit-khr rendering-contents-secondary-command-buffers-bit
    rendering-suspending-bit-khr rendering-suspending-bit
    rendering-resuming-bit-khr rendering-resuming-bit
    rendering-flag-bits-max-enum #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPresentModeKHR" doc-file 
    present-mode-immediate-khr 0
    present-mode-mailbox-khr 1
    present-mode-fifo-khr 2
    present-mode-fifo-relaxed-khr 3
    present-mode-shared-demand-refresh-khr 1000111000
    present-mode-shared-continuous-refresh-khr 1000111001
    present-mode-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkColorSpaceKHR" doc-file 
    color-space-srgb-nonlinear-khr 0
    color-space-display-p3-nonlinear-ext 1000104001
    color-space-extended-srgb-linear-ext 1000104002
    color-space-display-p3-linear-ext 1000104003
    color-space-dci-p3-nonlinear-ext 1000104004
    color-space-bt709-linear-ext 1000104005
    color-space-bt709-nonlinear-ext 1000104006
    color-space-bt2020-linear-ext 1000104007
    color-space-hdr10-st2084-ext 1000104008
    color-space-dolbyvision-ext 1000104009
    color-space-hdr10-hlg-ext 1000104010
    color-space-adobergb-linear-ext 1000104011
    color-space-adobergb-nonlinear-ext 1000104012
    color-space-pass-through-ext 1000104013
    color-space-extended-srgb-nonlinear-ext 1000104014
    color-space-display-native-amd 1000213000
    colorspace-srgb-nonlinear-khr color-space-srgb-nonlinear-khr
    color-space-dci-p3-linear-ext color-space-display-p3-linear-ext
    color-space-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSurfaceTransformFlagBitsKHR" doc-file 
    surface-transform-identity-bit-khr #x00000001
    surface-transform-rotate-90-bit-khr #x00000002
    surface-transform-rotate-180-bit-khr #x00000004
    surface-transform-rotate-270-bit-khr #x00000008
    surface-transform-horizontal-mirror-bit-khr #x00000010
    surface-transform-horizontal-mirror-rotate-90-bit-khr #x00000020
    surface-transform-horizontal-mirror-rotate-180-bit-khr #x00000040
    surface-transform-horizontal-mirror-rotate-270-bit-khr #x00000080
    surface-transform-inherit-bit-khr #x00000100
    surface-transform-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCompositeAlphaFlagBitsKHR" doc-file 
    composite-alpha-opaque-bit-khr #x00000001
    composite-alpha-pre-multiplied-bit-khr #x00000002
    composite-alpha-post-multiplied-bit-khr #x00000004
    composite-alpha-inherit-bit-khr #x00000008
    composite-alpha-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSwapchainCreateFlagBitsKHR" doc-file 
    swapchain-create-split-instance-bind-regions-bit-khr #x00000001
    swapchain-create-protected-bit-khr #x00000002
    swapchain-create-mutable-format-bit-khr #x00000004
    swapchain-create-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDeviceGroupPresentModeFlagBitsKHR" doc-file 
    device-group-present-mode-local-bit-khr #x00000001
    device-group-present-mode-remote-bit-khr #x00000002
    device-group-present-mode-sum-bit-khr #x00000004
    device-group-present-mode-local-multi-device-bit-khr #x00000008
    device-group-present-mode-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDisplayPlaneAlphaFlagBitsKHR" doc-file 
    display-plane-alpha-opaque-bit-khr #x00000001
    display-plane-alpha-global-bit-khr #x00000002
    display-plane-alpha-per-pixel-bit-khr #x00000004
    display-plane-alpha-per-pixel-premultiplied-bit-khr #x00000008
    display-plane-alpha-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPerformanceCounterUnitKHR" doc-file 
    performance-counter-unit-generic-khr 0
    performance-counter-unit-percentage-khr 1
    performance-counter-unit-nanoseconds-khr 2
    performance-counter-unit-bytes-khr 3
    performance-counter-unit-bytes-per-second-khr 4
    performance-counter-unit-kelvin-khr 5
    performance-counter-unit-watts-khr 6
    performance-counter-unit-volts-khr 7
    performance-counter-unit-amps-khr 8
    performance-counter-unit-hertz-khr 9
    performance-counter-unit-cycles-khr 10
    performance-counter-unit-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPerformanceCounterScopeKHR" doc-file 
    performance-counter-scope-command-buffer-khr 0
    performance-counter-scope-render-pass-khr 1
    performance-counter-scope-command-khr 2
    query-scope-command-buffer-khr performance-counter-scope-command-buffer-khr
    query-scope-render-pass-khr performance-counter-scope-render-pass-khr
    query-scope-command-khr performance-counter-scope-command-khr
    performance-counter-scope-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPerformanceCounterStorageKHR" doc-file 
    performance-counter-storage-int32-khr 0
    performance-counter-storage-int64-khr 1
    performance-counter-storage-uint32-khr 2
    performance-counter-storage-uint64-khr 3
    performance-counter-storage-float32-khr 4
    performance-counter-storage-float64-khr 5
    performance-counter-storage-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPerformanceCounterDescriptionFlagBitsKHR" doc-file 
    performance-counter-description-performance-impacting-bit-khr #x00000001
    performance-counter-description-concurrently-impacted-bit-khr #x00000002
    performance-counter-description-performance-impacting-khr performance-counter-description-performance-impacting-bit-khr
    performance-counter-description-concurrently-impacted-khr performance-counter-description-concurrently-impacted-bit-khr
    performance-counter-description-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAcquireProfilingLockFlagBitsKHR" doc-file 
    acquire-profiling-lock-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkQueueGlobalPriorityKHR" doc-file 
    queue-global-priority-low-khr 128
    queue-global-priority-medium-khr 256
    queue-global-priority-high-khr 512
    queue-global-priority-realtime-khr 1024
    queue-global-priority-low-ext queue-global-priority-low-khr
    queue-global-priority-medium-ext queue-global-priority-medium-khr
    queue-global-priority-high-ext queue-global-priority-high-khr
    queue-global-priority-realtime-ext queue-global-priority-realtime-khr
    queue-global-priority-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkFragmentShadingRateCombinerOpKHR" doc-file 
    fragment-shading-rate-combiner-op-keep-khr 0
    fragment-shading-rate-combiner-op-replace-khr 1
    fragment-shading-rate-combiner-op-min-khr 2
    fragment-shading-rate-combiner-op-max-khr 3
    fragment-shading-rate-combiner-op-mul-khr 4
    fragment-shading-rate-combiner-op-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineExecutableStatisticFormatKHR" doc-file 
    pipeline-executable-statistic-format-bool32-khr 0
    pipeline-executable-statistic-format-int64-khr 1
    pipeline-executable-statistic-format-uint64-khr 2
    pipeline-executable-statistic-format-float64-khr 3
    pipeline-executable-statistic-format-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDebugReportObjectTypeEXT" doc-file 
    debug-report-object-type-unknown-ext 0
    debug-report-object-type-instance-ext 1
    debug-report-object-type-physical-device-ext 2
    debug-report-object-type-device-ext 3
    debug-report-object-type-queue-ext 4
    debug-report-object-type-semaphore-ext 5
    debug-report-object-type-command-buffer-ext 6
    debug-report-object-type-fence-ext 7
    debug-report-object-type-device-memory-ext 8
    debug-report-object-type-buffer-ext 9
    debug-report-object-type-image-ext 10
    debug-report-object-type-event-ext 11
    debug-report-object-type-query-pool-ext 12
    debug-report-object-type-buffer-view-ext 13
    debug-report-object-type-image-view-ext 14
    debug-report-object-type-shader-module-ext 15
    debug-report-object-type-pipeline-cache-ext 16
    debug-report-object-type-pipeline-layout-ext 17
    debug-report-object-type-render-pass-ext 18
    debug-report-object-type-pipeline-ext 19
    debug-report-object-type-descriptor-set-layout-ext 20
    debug-report-object-type-sampler-ext 21
    debug-report-object-type-descriptor-pool-ext 22
    debug-report-object-type-descriptor-set-ext 23
    debug-report-object-type-framebuffer-ext 24
    debug-report-object-type-command-pool-ext 25
    debug-report-object-type-surface-khr-ext 26
    debug-report-object-type-swapchain-khr-ext 27
    debug-report-object-type-debug-report-callback-ext-ext 28
    debug-report-object-type-display-khr-ext 29
    debug-report-object-type-display-mode-khr-ext 30
    debug-report-object-type-validation-cache-ext-ext 33
    debug-report-object-type-sampler-ycbcr-conversion-ext 1000156000
    debug-report-object-type-descriptor-update-template-ext 1000085000
    debug-report-object-type-cu-module-nvx-ext 1000029000
    debug-report-object-type-cu-function-nvx-ext 1000029001
    debug-report-object-type-acceleration-structure-khr-ext 1000150000
    debug-report-object-type-acceleration-structure-nv-ext 1000165000
    debug-report-object-type-buffer-collection-fuchsia-ext 1000366000
    debug-report-object-type-debug-report-ext debug-report-object-type-debug-report-callback-ext-ext
    debug-report-object-type-validation-cache-ext debug-report-object-type-validation-cache-ext-ext
    debug-report-object-type-descriptor-update-template-khr-ext debug-report-object-type-descriptor-update-template-ext
    debug-report-object-type-sampler-ycbcr-conversion-khr-ext debug-report-object-type-sampler-ycbcr-conversion-ext
    debug-report-object-type-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDebugReportFlagBitsEXT" doc-file 
    debug-report-information-bit-ext #x00000001
    debug-report-warning-bit-ext #x00000002
    debug-report-performance-warning-bit-ext #x00000004
    debug-report-error-bit-ext #x00000008
    debug-report-debug-bit-ext #x00000010
    debug-report-flag-bits-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkRasterizationOrderAMD" doc-file 
    rasterization-order-strict-amd 0
    rasterization-order-relaxed-amd 1
    rasterization-order-max-enum-amd #x7FFFFFFF)

(mcffi:def-foreign-enum "VkShaderInfoTypeAMD" doc-file 
    shader-info-type-statistics-amd 0
    shader-info-type-binary-amd 1
    shader-info-type-disassembly-amd 2
    shader-info-type-max-enum-amd #x7FFFFFFF)

(mcffi:def-foreign-enum "VkExternalMemoryHandleTypeFlagBitsNV" doc-file 
    external-memory-handle-type-opaque-win32-bit-nv #x00000001
    external-memory-handle-type-opaque-win32-kmt-bit-nv #x00000002
    external-memory-handle-type-d3d11-image-bit-nv #x00000004
    external-memory-handle-type-d3d11-image-kmt-bit-nv #x00000008
    external-memory-handle-type-flag-bits-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkExternalMemoryFeatureFlagBitsNV" doc-file 
    external-memory-feature-dedicated-only-bit-nv #x00000001
    external-memory-feature-exportable-bit-nv #x00000002
    external-memory-feature-importable-bit-nv #x00000004
    external-memory-feature-flag-bits-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkValidationCheckEXT" doc-file 
    validation-check-all-ext 0
    validation-check-shaders-ext 1
    validation-check-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkConditionalRenderingFlagBitsEXT" doc-file 
    conditional-rendering-inverted-bit-ext #x00000001
    conditional-rendering-flag-bits-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSurfaceCounterFlagBitsEXT" doc-file 
    surface-counter-vblank-bit-ext #x00000001
    surface-counter-vblank-ext surface-counter-vblank-bit-ext
    surface-counter-flag-bits-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDisplayPowerStateEXT" doc-file 
    display-power-state-off-ext 0
    display-power-state-suspend-ext 1
    display-power-state-on-ext 2
    display-power-state-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDeviceEventTypeEXT" doc-file 
    device-event-type-display-hotplug-ext 0
    device-event-type-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDisplayEventTypeEXT" doc-file 
    display-event-type-first-pixel-out-ext 0
    display-event-type-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkViewportCoordinateSwizzleNV" doc-file 
    viewport-coordinate-swizzle-positive-x-nv 0
    viewport-coordinate-swizzle-negative-x-nv 1
    viewport-coordinate-swizzle-positive-y-nv 2
    viewport-coordinate-swizzle-negative-y-nv 3
    viewport-coordinate-swizzle-positive-z-nv 4
    viewport-coordinate-swizzle-negative-z-nv 5
    viewport-coordinate-swizzle-positive-w-nv 6
    viewport-coordinate-swizzle-negative-w-nv 7
    viewport-coordinate-swizzle-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDiscardRectangleModeEXT" doc-file 
    discard-rectangle-mode-inclusive-ext 0
    discard-rectangle-mode-exclusive-ext 1
    discard-rectangle-mode-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkConservativeRasterizationModeEXT" doc-file 
    conservative-rasterization-mode-disabled-ext 0
    conservative-rasterization-mode-overestimate-ext 1
    conservative-rasterization-mode-underestimate-ext 2
    conservative-rasterization-mode-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDebugUtilsMessageSeverityFlagBitsEXT" doc-file 
    debug-utils-message-severity-verbose-bit-ext #x00000001
    debug-utils-message-severity-info-bit-ext #x00000010
    debug-utils-message-severity-warning-bit-ext #x00000100
    debug-utils-message-severity-error-bit-ext #x00001000
    debug-utils-message-severity-flag-bits-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDebugUtilsMessageTypeFlagBitsEXT" doc-file 
    debug-utils-message-type-general-bit-ext #x00000001
    debug-utils-message-type-validation-bit-ext #x00000002
    debug-utils-message-type-performance-bit-ext #x00000004
    debug-utils-message-type-flag-bits-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkBlendOverlapEXT" doc-file 
    blend-overlap-uncorrelated-ext 0
    blend-overlap-disjoint-ext 1
    blend-overlap-conjoint-ext 2
    blend-overlap-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCoverageModulationModeNV" doc-file 
    coverage-modulation-mode-none-nv 0
    coverage-modulation-mode-rgb-nv 1
    coverage-modulation-mode-alpha-nv 2
    coverage-modulation-mode-rgba-nv 3
    coverage-modulation-mode-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkValidationCacheHeaderVersionEXT" doc-file 
    validation-cache-header-version-one-ext 1
    validation-cache-header-version-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkShadingRatePaletteEntryNV" doc-file 
    shading-rate-palette-entry-no-invocations-nv 0
    shading-rate-palette-entry-16-invocations-per-pixel-nv 1
    shading-rate-palette-entry-8-invocations-per-pixel-nv 2
    shading-rate-palette-entry-4-invocations-per-pixel-nv 3
    shading-rate-palette-entry-2-invocations-per-pixel-nv 4
    shading-rate-palette-entry-1-invocation-per-pixel-nv 5
    shading-rate-palette-entry-1-invocation-per-2x1-pixels-nv 6
    shading-rate-palette-entry-1-invocation-per-1x2-pixels-nv 7
    shading-rate-palette-entry-1-invocation-per-2x2-pixels-nv 8
    shading-rate-palette-entry-1-invocation-per-4x2-pixels-nv 9
    shading-rate-palette-entry-1-invocation-per-2x4-pixels-nv 10
    shading-rate-palette-entry-1-invocation-per-4x4-pixels-nv 11
    shading-rate-palette-entry-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCoarseSampleOrderTypeNV" doc-file 
    coarse-sample-order-type-default-nv 0
    coarse-sample-order-type-custom-nv 1
    coarse-sample-order-type-pixel-major-nv 2
    coarse-sample-order-type-sample-major-nv 3
    coarse-sample-order-type-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkRayTracingShaderGroupTypeKHR" doc-file 
    ray-tracing-shader-group-type-general-khr 0
    ray-tracing-shader-group-type-triangles-hit-group-khr 1
    ray-tracing-shader-group-type-procedural-hit-group-khr 2
    ray-tracing-shader-group-type-general-nv ray-tracing-shader-group-type-general-khr
    ray-tracing-shader-group-type-triangles-hit-group-nv ray-tracing-shader-group-type-triangles-hit-group-khr
    ray-tracing-shader-group-type-procedural-hit-group-nv ray-tracing-shader-group-type-procedural-hit-group-khr
    ray-tracing-shader-group-type-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkGeometryTypeKHR" doc-file 
    geometry-type-triangles-khr 0
    geometry-type-aabbs-khr 1
    geometry-type-instances-khr 2
    geometry-type-triangles-nv geometry-type-triangles-khr
    geometry-type-aabbs-nv geometry-type-aabbs-khr
    geometry-type-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAccelerationStructureTypeKHR" doc-file 
    acceleration-structure-type-top-level-khr 0
    acceleration-structure-type-bottom-level-khr 1
    acceleration-structure-type-generic-khr 2
    acceleration-structure-type-top-level-nv acceleration-structure-type-top-level-khr
    acceleration-structure-type-bottom-level-nv acceleration-structure-type-bottom-level-khr
    acceleration-structure-type-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCopyAccelerationStructureModeKHR" doc-file 
    copy-acceleration-structure-mode-clone-khr 0
    copy-acceleration-structure-mode-compact-khr 1
    copy-acceleration-structure-mode-serialize-khr 2
    copy-acceleration-structure-mode-deserialize-khr 3
    copy-acceleration-structure-mode-clone-nv copy-acceleration-structure-mode-clone-khr
    copy-acceleration-structure-mode-compact-nv copy-acceleration-structure-mode-compact-khr
    copy-acceleration-structure-mode-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAccelerationStructureMemoryRequirementsTypeNV" doc-file 
    acceleration-structure-memory-requirements-type-object-nv 0
    acceleration-structure-memory-requirements-type-build-scratch-nv 1
    acceleration-structure-memory-requirements-type-update-scratch-nv 2
    acceleration-structure-memory-requirements-type-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkGeometryFlagBitsKHR" doc-file 
    geometry-opaque-bit-khr #x00000001
    geometry-no-duplicate-any-hit-invocation-bit-khr #x00000002
    geometry-opaque-bit-nv geometry-opaque-bit-khr
    geometry-no-duplicate-any-hit-invocation-bit-nv geometry-no-duplicate-any-hit-invocation-bit-khr
    geometry-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkGeometryInstanceFlagBitsKHR" doc-file 
    geometry-instance-triangle-facing-cull-disable-bit-khr #x00000001
    geometry-instance-triangle-flip-facing-bit-khr #x00000002
    geometry-instance-force-opaque-bit-khr #x00000004
    geometry-instance-force-no-opaque-bit-khr #x00000008
    geometry-instance-triangle-front-counterclockwise-bit-khr geometry-instance-triangle-flip-facing-bit-khr
    geometry-instance-triangle-cull-disable-bit-nv geometry-instance-triangle-facing-cull-disable-bit-khr
    geometry-instance-triangle-front-counterclockwise-bit-nv geometry-instance-triangle-front-counterclockwise-bit-khr
    geometry-instance-force-opaque-bit-nv geometry-instance-force-opaque-bit-khr
    geometry-instance-force-no-opaque-bit-nv geometry-instance-force-no-opaque-bit-khr
    geometry-instance-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkBuildAccelerationStructureFlagBitsKHR" doc-file 
    build-acceleration-structure-allow-update-bit-khr #x00000001
    build-acceleration-structure-allow-compaction-bit-khr #x00000002
    build-acceleration-structure-prefer-fast-trace-bit-khr #x00000004
    build-acceleration-structure-prefer-fast-build-bit-khr #x00000008
    build-acceleration-structure-low-memory-bit-khr #x00000010
    build-acceleration-structure-motion-bit-nv #x00000020
    build-acceleration-structure-allow-update-bit-nv build-acceleration-structure-allow-update-bit-khr
    build-acceleration-structure-allow-compaction-bit-nv build-acceleration-structure-allow-compaction-bit-khr
    build-acceleration-structure-prefer-fast-trace-bit-nv build-acceleration-structure-prefer-fast-trace-bit-khr
    build-acceleration-structure-prefer-fast-build-bit-nv build-acceleration-structure-prefer-fast-build-bit-khr
    build-acceleration-structure-low-memory-bit-nv build-acceleration-structure-low-memory-bit-khr
    build-acceleration-structure-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPipelineCompilerControlFlagBitsAMD" doc-file 
    pipeline-compiler-control-flag-bits-max-enum-amd #x7FFFFFFF)

(mcffi:def-foreign-enum "VkTimeDomainEXT" doc-file 
    time-domain-device-ext 0
    time-domain-clock-monotonic-ext 1
    time-domain-clock-monotonic-raw-ext 2
    time-domain-query-performance-counter-ext 3
    time-domain-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkMemoryOverallocationBehaviorAMD" doc-file 
    memory-overallocation-behavior-default-amd 0
    memory-overallocation-behavior-allowed-amd 1
    memory-overallocation-behavior-disallowed-amd 2
    memory-overallocation-behavior-max-enum-amd #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPerformanceConfigurationTypeINTEL" doc-file 
    performance-configuration-type-command-queue-metrics-discovery-activated-intel 0
    performance-configuration-type-max-enum-intel #x7FFFFFFF)

(mcffi:def-foreign-enum "VkQueryPoolSamplingModeINTEL" doc-file 
    query-pool-sampling-mode-manual-intel 0
    query-pool-sampling-mode-max-enum-intel #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPerformanceOverrideTypeINTEL" doc-file 
    performance-override-type-null-hardware-intel 0
    performance-override-type-flush-gpu-caches-intel 1
    performance-override-type-max-enum-intel #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPerformanceParameterTypeINTEL" doc-file 
    performance-parameter-type-hw-counters-supported-intel 0
    performance-parameter-type-stream-marker-valid-bits-intel 1
    performance-parameter-type-max-enum-intel #x7FFFFFFF)

(mcffi:def-foreign-enum "VkPerformanceValueTypeINTEL" doc-file 
    performance-value-type-uint32-intel 0
    performance-value-type-uint64-intel 1
    performance-value-type-float-intel 2
    performance-value-type-bool-intel 3
    performance-value-type-string-intel 4
    performance-value-type-max-enum-intel #x7FFFFFFF)

(mcffi:def-foreign-enum "VkShaderCorePropertiesFlagBitsAMD" doc-file 
    shader-core-properties-flag-bits-max-enum-amd #x7FFFFFFF)

(mcffi:def-foreign-enum "VkValidationFeatureEnableEXT" doc-file 
    validation-feature-enable-gpu-assisted-ext 0
    validation-feature-enable-gpu-assisted-reserve-binding-slot-ext 1
    validation-feature-enable-best-practices-ext 2
    validation-feature-enable-debug-printf-ext 3
    validation-feature-enable-synchronization-validation-ext 4
    validation-feature-enable-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkValidationFeatureDisableEXT" doc-file 
    validation-feature-disable-all-ext 0
    validation-feature-disable-shaders-ext 1
    validation-feature-disable-thread-safety-ext 2
    validation-feature-disable-api-parameters-ext 3
    validation-feature-disable-object-lifetimes-ext 4
    validation-feature-disable-core-checks-ext 5
    validation-feature-disable-unique-handles-ext 6
    validation-feature-disable-shader-validation-cache-ext 7
    validation-feature-disable-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkComponentTypeNV" doc-file 
    component-type-float16-nv 0
    component-type-float32-nv 1
    component-type-float64-nv 2
    component-type-sint8-nv 3
    component-type-sint16-nv 4
    component-type-sint32-nv 5
    component-type-sint64-nv 6
    component-type-uint8-nv 7
    component-type-uint16-nv 8
    component-type-uint32-nv 9
    component-type-uint64-nv 10
    component-type-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkScopeNV" doc-file 
    scope-device-nv 1
    scope-workgroup-nv 2
    scope-subgroup-nv 3
    scope-queue-family-nv 5
    scope-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkCoverageReductionModeNV" doc-file 
    coverage-reduction-mode-merge-nv 0
    coverage-reduction-mode-truncate-nv 1
    coverage-reduction-mode-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkProvokingVertexModeEXT" doc-file 
    provoking-vertex-mode-first-vertex-ext 0
    provoking-vertex-mode-last-vertex-ext 1
    provoking-vertex-mode-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkLineRasterizationModeEXT" doc-file 
    line-rasterization-mode-default-ext 0
    line-rasterization-mode-rectangular-ext 1
    line-rasterization-mode-bresenham-ext 2
    line-rasterization-mode-rectangular-smooth-ext 3
    line-rasterization-mode-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkIndirectCommandsTokenTypeNV" doc-file 
    indirect-commands-token-type-shader-group-nv 0
    indirect-commands-token-type-state-flags-nv 1
    indirect-commands-token-type-index-buffer-nv 2
    indirect-commands-token-type-vertex-buffer-nv 3
    indirect-commands-token-type-push-constant-nv 4
    indirect-commands-token-type-draw-indexed-nv 5
    indirect-commands-token-type-draw-nv 6
    indirect-commands-token-type-draw-tasks-nv 7
    indirect-commands-token-type-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkIndirectStateFlagBitsNV" doc-file 
    indirect-state-flag-frontface-bit-nv #x00000001
    indirect-state-flag-bits-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkIndirectCommandsLayoutUsageFlagBitsNV" doc-file 
    indirect-commands-layout-usage-explicit-preprocess-bit-nv #x00000001
    indirect-commands-layout-usage-indexed-sequences-bit-nv #x00000002
    indirect-commands-layout-usage-unordered-sequences-bit-nv #x00000004
    indirect-commands-layout-usage-flag-bits-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDeviceMemoryReportEventTypeEXT" doc-file 
    device-memory-report-event-type-allocate-ext 0
    device-memory-report-event-type-free-ext 1
    device-memory-report-event-type-import-ext 2
    device-memory-report-event-type-unimport-ext 3
    device-memory-report-event-type-allocation-failed-ext 4
    device-memory-report-event-type-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkDeviceDiagnosticsConfigFlagBitsNV" doc-file 
    device-diagnostics-config-enable-shader-debug-info-bit-nv #x00000001
    device-diagnostics-config-enable-resource-tracking-bit-nv #x00000002
    device-diagnostics-config-enable-automatic-checkpoints-bit-nv #x00000004
    device-diagnostics-config-enable-shader-error-reporting-bit-nv #x00000008
    device-diagnostics-config-flag-bits-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkGraphicsPipelineLibraryFlagBitsEXT" doc-file 
    graphics-pipeline-library-vertex-input-interface-bit-ext #x00000001
    graphics-pipeline-library-pre-rasterization-shaders-bit-ext #x00000002
    graphics-pipeline-library-fragment-shader-bit-ext #x00000004
    graphics-pipeline-library-fragment-output-interface-bit-ext #x00000008
    graphics-pipeline-library-flag-bits-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkFragmentShadingRateTypeNV" doc-file 
    fragment-shading-rate-type-fragment-size-nv 0
    fragment-shading-rate-type-enums-nv 1
    fragment-shading-rate-type-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkFragmentShadingRateNV" doc-file 
    fragment-shading-rate-1-invocation-per-pixel-nv 0
    fragment-shading-rate-1-invocation-per-1x2-pixels-nv 1
    fragment-shading-rate-1-invocation-per-2x1-pixels-nv 4
    fragment-shading-rate-1-invocation-per-2x2-pixels-nv 5
    fragment-shading-rate-1-invocation-per-2x4-pixels-nv 6
    fragment-shading-rate-1-invocation-per-4x2-pixels-nv 9
    fragment-shading-rate-1-invocation-per-4x4-pixels-nv 10
    fragment-shading-rate-2-invocations-per-pixel-nv 11
    fragment-shading-rate-4-invocations-per-pixel-nv 12
    fragment-shading-rate-8-invocations-per-pixel-nv 13
    fragment-shading-rate-16-invocations-per-pixel-nv 14
    fragment-shading-rate-no-invocations-nv 15
    fragment-shading-rate-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAccelerationStructureMotionInstanceTypeNV" doc-file 
    acceleration-structure-motion-instance-type-static-nv 0
    acceleration-structure-motion-instance-type-matrix-motion-nv 1
    acceleration-structure-motion-instance-type-srt-motion-nv 2
    acceleration-structure-motion-instance-type-max-enum-nv #x7FFFFFFF)

(mcffi:def-foreign-enum "VkImageCompressionFlagBitsEXT" doc-file 
    image-compression-default-ext 0
    image-compression-fixed-rate-default-ext #x00000001
    image-compression-fixed-rate-explicit-ext #x00000002
    image-compression-disabled-ext #x00000004
    image-compression-flag-bits-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkImageCompressionFixedRateFlagBitsEXT" doc-file 
    image-compression-fixed-rate-none-ext 0
    image-compression-fixed-rate-1bpc-bit-ext #x00000001
    image-compression-fixed-rate-2bpc-bit-ext #x00000002
    image-compression-fixed-rate-3bpc-bit-ext #x00000004
    image-compression-fixed-rate-4bpc-bit-ext #x00000008
    image-compression-fixed-rate-5bpc-bit-ext #x00000010
    image-compression-fixed-rate-6bpc-bit-ext #x00000020
    image-compression-fixed-rate-7bpc-bit-ext #x00000040
    image-compression-fixed-rate-8bpc-bit-ext #x00000080
    image-compression-fixed-rate-9bpc-bit-ext #x00000100
    image-compression-fixed-rate-10bpc-bit-ext #x00000200
    image-compression-fixed-rate-11bpc-bit-ext #x00000400
    image-compression-fixed-rate-12bpc-bit-ext #x00000800
    image-compression-fixed-rate-13bpc-bit-ext #x00001000
    image-compression-fixed-rate-14bpc-bit-ext #x00002000
    image-compression-fixed-rate-15bpc-bit-ext #x00004000
    image-compression-fixed-rate-16bpc-bit-ext #x00008000
    image-compression-fixed-rate-17bpc-bit-ext #x00010000
    image-compression-fixed-rate-18bpc-bit-ext #x00020000
    image-compression-fixed-rate-19bpc-bit-ext #x00040000
    image-compression-fixed-rate-20bpc-bit-ext #x00080000
    image-compression-fixed-rate-21bpc-bit-ext #x00100000
    image-compression-fixed-rate-22bpc-bit-ext #x00200000
    image-compression-fixed-rate-23bpc-bit-ext #x00400000
    image-compression-fixed-rate-24bpc-bit-ext #x00800000
    image-compression-fixed-rate-flag-bits-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkSubpassMergeStatusEXT" doc-file 
    subpass-merge-status-merged-ext 0
    subpass-merge-status-disallowed-ext 1
    subpass-merge-status-not-merged-side-effects-ext 2
    subpass-merge-status-not-merged-samples-mismatch-ext 3
    subpass-merge-status-not-merged-views-mismatch-ext 4
    subpass-merge-status-not-merged-aliasing-ext 5
    subpass-merge-status-not-merged-dependencies-ext 6
    subpass-merge-status-not-merged-incompatible-input-attachment-ext 7
    subpass-merge-status-not-merged-too-many-attachments-ext 8
    subpass-merge-status-not-merged-insufficient-storage-ext 9
    subpass-merge-status-not-merged-depth-stencil-count-ext 10
    subpass-merge-status-not-merged-resolve-attachment-reuse-ext 11
    subpass-merge-status-not-merged-single-subpass-ext 12
    subpass-merge-status-not-merged-unspecified-ext 13
    subpass-merge-status-max-enum-ext #x7FFFFFFF)

(mcffi:def-foreign-enum "VkBuildAccelerationStructureModeKHR" doc-file 
    build-acceleration-structure-mode-build-khr 0
    build-acceleration-structure-mode-update-khr 1
    build-acceleration-structure-mode-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAccelerationStructureBuildTypeKHR" doc-file 
    acceleration-structure-build-type-host-khr 0
    acceleration-structure-build-type-device-khr 1
    acceleration-structure-build-type-host-or-device-khr 2
    acceleration-structure-build-type-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAccelerationStructureCompatibilityKHR" doc-file 
    acceleration-structure-compatibility-compatible-khr 0
    acceleration-structure-compatibility-incompatible-khr 1
    acceleration-structure-compatibility-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkAccelerationStructureCreateFlagBitsKHR" doc-file 
    acceleration-structure-create-device-address-capture-replay-bit-khr #x00000001
    acceleration-structure-create-motion-bit-nv #x00000004
    acceleration-structure-create-flag-bits-max-enum-khr #x7FFFFFFF)

(mcffi:def-foreign-enum "VkShaderGroupShaderKHR" doc-file 
    shader-group-shader-general-khr 0
    shader-group-shader-closest-hit-khr 1
    shader-group-shader-any-hit-khr 2
    shader-group-shader-intersection-khr 3
    shader-group-shader-max-enum-khr #x7FFFFFFF)
