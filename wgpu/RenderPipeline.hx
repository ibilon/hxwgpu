package wgpu;

/**
	A handle to a rendering (graphics) pipeline.

	A `RenderPipeline` object represents a graphics pipeline and its stages, bindings, vertex buffers and targets.

	A `RenderPipeline` may be created with `Device.createRenderPipeline`.
**/
@:headerClassCode('
	WGPURenderPipelineId native;
')
@:headerInclude('./wgpu.h')
class RenderPipeline {}
