package wgpu;

/**
	A handle to a texture view.

	A `TextureView` object describes a texture and associated metadata needed by a `RenderPipeline` or `BindGroup`.
**/
@:headerClassCode('
	WGPUTextureViewId native;
')
@:headerInclude('./wgpu.h')
class TextureView {
	public function destroy():Void {
		// TODO invalidate instance
		untyped __cpp__('
			wgpu_texture_view_destroy(native);
		');
	}
}
