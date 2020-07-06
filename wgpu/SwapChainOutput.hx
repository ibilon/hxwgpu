package wgpu;

/**
	A swap chain image that can be rendered to.
**/
@:headerClassCode('
	WGPUSwapChainOutput native;
')
@:headerInclude('./wgpu.h')
class SwapChainOutput {
	public var view(get, never):TextureView;

	function get_view():TextureView {
		untyped __cpp__('
			wgpu::TextureView textureView = wgpu::TextureView_obj::__alloc(HX_CTX);
			textureView->native = native.view_id;
		');

		return untyped __cpp__('textureView');
	}
}
