package wgpu;

import wgpu.errors.UseAfterDestroyException;

/**
	A handle to a texture on the GPU.
**/
@:headerClassCode('
	WGPUTextureId native;
')
@:headerInclude('./wgpu.h')
class Texture {
	var destroyed = false;

	// TODO missing functions

	/**
		Destroy the texture.

		Using the instance after this will throw a `UseAfterDestroyException` exception.

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	public function destroy():Void {
		validate();
		untyped __cpp__('wgpu_texture_destroy(native)');
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
