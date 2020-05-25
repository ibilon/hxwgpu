package wgpu;

// TODO missing functions: mapRead, mapWrite

/**
	A handle to a GPU-accessible buffer.
**/
@:headerClassCode('
	WGPUBufferId native;
')
@:headerInclude('./wgpu.h')
class Buffer {
	public function destroy():Void {
		untyped __cpp__('
			wgpu_buffer_destroy(native);
		');
	}

	/**
		Flushes any pending write operations and unmaps the buffer from host memory.
	**/
	public function unmap():Void {
		untyped __cpp__('
			wgpu_buffer_unmap(native);
		');
	}
}
