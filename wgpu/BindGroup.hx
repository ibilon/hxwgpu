package wgpu;

import wgpu.errors.UseAfterDestroyException;

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
	var destroyed:Bool = false;

	/**
		Destroy the bing group.

		Using the instance after this will throw a `UseAfterDestroyException` exception.

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	public function destroy():Void {
		validate();
		untyped __cpp__('wgpu_bind_group_destroy(native)');
		destroyed = true;
	}

	/**
		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	function validate():Void {
		if (destroyed) {
			throw new UseAfterDestroyException(this);
		}
	}
}
