package wgpu.errors;

/**
	Cannot destroy the texture from the swapchain.
**/
@:allow(wgpu)
class CantDestroySwapChainTextureException extends Exception {
	/** The texture view that can't be destroyed. **/
	public var textureView(default, null):TextureView;

	/**
		[Internal]
	**/
	function new(textureView:TextureView) {
		this.textureView = textureView;
		super("Cannot destroy the texture from the swapchain");
	}
}
