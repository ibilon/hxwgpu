package wgpu;

/**
	An opaque handle to a binding group layout.

	A `BindGroupLayout` is a handle to the GPU-side layout of a binding group.
	It can be used to create a `BindGroupDescriptor` object, which in turn can be used to create a `BindGroup` object with `Device.createBindGroup`.
	A series of `BindGroupLayout` can also be used to create a `PipelineLayoutDescriptor`, which can be used to create a `PipelineLayout`.
**/
@:headerClassCode('
	WGPUBindGroupLayoutId native;
')
@:headerInclude('./wgpu.h')
class BindGroupLayout {}
