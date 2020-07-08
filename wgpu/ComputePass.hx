package wgpu;

/**
	An in-progress recording of a compute pass.
**/
@:headerClassCode('
	WGPUComputePassId native;
')
@:headerInclude('./wgpu.h')
class ComputePass {
	/**
		Dispatches compute work operations.

		@param x The number of work group to dispatch in the x dimension.
		@param y The number of work group to dispatch in the y dimension.
		@param z The number of work group to dispatch in the z dimension.
	**/
	public function dispatch(x:Int, y:Int, z:Int):Void {
		untyped __cpp__('wgpu_compute_pass_dispatch(native, x, y, z)');
	}

	/**
		Indirectly dispatches compute work operations.

		@param indirectBuffer The disaptch is based on the contents of this buffer.
		@param indirectOffset The offset at which to start reading from `indirectBuffer`.
	**/
	public function dispatchIndirect(indirectBuffer:Buffer, indirectOffset:Int):Void {
		indirectBuffer.validate();
		untyped __cpp__('wgpu_compute_pass_dispatch_indirect(native, indirectBuffer->native, indirectOffset)');
	}

	public function endPass():Void {
		// TODO does this invalidate?
		untyped __cpp__('wgpu_compute_pass_end_pass(native)');
	}

	/**
		Sets the active bind group for a given bind group index.

		@throws UseAfterDestroyException If `bindGroup` was already destroyed.
	**/
	public function setBindGroup(index:Int, bindGroup:BindGroup, offsets:Array<Int>):Void {
		bindGroup.validate();

		untyped __cpp__('
			uint32_t *native_offsets = (uint32_t*)malloc(sizeof(*native_offsets) * offsets->length);

			for (unsigned int i = 0; i < offsets->length; ++i) {
				native_offsets[i] = (uint32_t)offsets->__get(i);
			}

			wgpu_compute_pass_set_bind_group(native, index, bindGroup->native, native_offsets, offsets->length);

			free(native_offsets);
		');

	}

	/**
		Sets the active compute pipeline.

		@param pipeline The compute pipeline to set active.
	**/
	public function setPipeline(pipeline:ComputePipeline):Void {
		untyped __cpp__('wgpu_compute_pass_set_pipeline(native, pipeline->native)');
	}
}
