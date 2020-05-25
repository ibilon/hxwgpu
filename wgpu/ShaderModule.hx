package wgpu;

/**
	A handle to a compiled shader module.

	A `ShaderModule` represents a compiled shader module on the GPU.
	It can be created by passing valid SPIR-V source code to `Device.createShaderModule`.
	Shader modules are used to define programmable stages of a pipeline.
**/
@:headerClassCode('
	WGPUShaderModuleId native;
')
@:headerInclude('./wgpu.h')
class ShaderModule {}
