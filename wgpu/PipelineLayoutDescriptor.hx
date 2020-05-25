package wgpu;

/**
	A description of a pipeline layout.

	A `PipelineLayoutDescriptor` can be passed to `Device.createPipelineLayout` to obtain a `PipelineLayout`.
**/
@:structInit
class PipelineLayoutDescriptor {
	public var bindGroupLayouts:Array<BindGroupLayout>;
}
