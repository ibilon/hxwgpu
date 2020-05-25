package wgpu;

/**
	An opaque handle to a binding group.

	A `BindGroup` represents the set of resources bound to the bindings described by a `BindGroupLayout`.
	It can be created with `Device.createBindGroup`.
	A `BindGroup` can be bound to a particular `RenderPass` with `RenderPass.setBindGroup`, or to a `ComputePass` with `ComputePass.setBindGroup`.
**/
@:headerClassCode('
	WGPUBindGroupId native;
')
@:headerInclude('./wgpu.h')
class BindGroup {
	public function destroy():Void {
		untyped __cpp__('
			wgpu_bind_group_destroy(native);
		');
	}
}
