package wgpu;

/**
	An opaque handle to a pipeline layout.

	A `PipelineLayout` object describes the available binding groups of a pipeline.
**/
@:headerClassCode('
	WGPUPipelineLayoutId native;
')
@:headerInclude('./wgpu.h')
class PipelineLayout {}
