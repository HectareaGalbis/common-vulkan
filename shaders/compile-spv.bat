
@echo off

if exist .\%1\%1.vert (C:\VulkanSDK\1.3.204.1\Bin\glslc.exe .\%1\%1.vert -o .\%1\vert.spv)
if exist .\%1\%1.frag (C:\VulkanSDK\1.3.204.1\Bin\glslc.exe .\%1\%1.frag -o .\%1\frag.spv)
if exist .\%1\%1.geom (C:\VulkanSDK\1.3.204.1\Bin\glslc.exe .\%1\%1.geom -o .\%1\geom.spv)
