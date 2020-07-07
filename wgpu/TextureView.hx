package wgpu;

import wgpu.errors.UseAfterDestroyException;

/**
	A handle to a texture view.

	A `TextureView` object describes a texture and associated metadata needed by a `RenderPipeline` or `BindGroup`.
**/
@:allow(wgpu)
@:headerClassCode('
	WGPUTextureViewId native;
')
@:headerInclude('./wgpu.h')
class TextureView {
	var destroyed:Bool = false;

	/**
		Destroy the texture view.

		Using the instance after this will throw a `UseAfterDestroyException` exception.

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	public function destroy():Void {
		validate();
		untyped __cpp__('wgpu_texture_view_destroy(native)'); // TODO Native exception leak: Can't destroy a swapchain image for swapChain.getNextTexture().view.destroy()
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
