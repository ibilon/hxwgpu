package wgpu;

import wgpu.errors.UseAfterDestroyException;

// TODO missing functions: mapRead, mapWrite

/**
	A handle to a GPU-accessible buffer.
**/
@:allow(wgpu)
@:headerClassCode('
	WGPUBufferId native;
')
@:headerInclude('./wgpu.h')
class Buffer {
	var destroyed:Bool = false;

	/**
		Destroy the buffer.

		Using the instance after this will throw a `UseAfterDestroyException` exception.

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	public function destroy():Void {
		validate();
		untyped __cpp__('wgpu_buffer_destroy(native)');
		destroyed = true;
	}

	/**
		Flushes any pending write operations and unmaps the buffer from host memory.

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	public function unmap():Void {
		validate();
		untyped __cpp__('wgpu_buffer_unmap(native)');
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
