package wgpu;

/**
	A handle to a texture on the GPU.
**/
@:headerClassCode('
	WGPUTextureId native;
')
@:headerInclude('./wgpu.h')
class Texture {
	// TODO missing functions
	public function destroy():Void {
		// TODO invalidate instance
		untyped __cpp__('
			wgpu_texture_destroy(native);
		');
	}
}
