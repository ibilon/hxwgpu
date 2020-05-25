package wgpu;

/**
	A handle to a swap chain.

	A `SwapChain` represents the image or series of images that will be presented to a `Surface`.
	A `SwapChain` may be created with `Device.createSwapChain`.
**/
@:headerClassCode('
	WGPUSwapChainId native;
')
@:headerInclude('./wgpu.h')
class SwapChain {
	/**
		Returns the next texture to be presented by the swapchain for drawing.
	**/
	public function getNextTexture():Null<SwapChainOutput> {
		untyped __cpp__('
			wgpu::SwapChainOutput swapChainOutput = wgpu::SwapChainOutput_obj::__alloc(HX_CTX);
			swapChainOutput->native = wgpu_swap_chain_get_next_texture(native);
			return swapChainOutput;
		');

		throw "unreacheable";
	}

	/**
		Present the texture acquired from `getNextTexture` to the associated `Surface`.
	**/
	public function present():Void {
		untyped __cpp__('
			wgpu_swap_chain_present(native);
		');
	}
}
