package wgpu;

/**
	A view of a texture which can be used to copy to or from a buffer or another texture.
**/
@:allow(wgpu)
@:structInit
class TextureCopyView {
	/** The texture to be copied to or from. **/
	public var texture:Texture;

	/** The target mip level of the texture. **/
	public var mipLevel:Int;

	/** The target layer of the texture. **/
	public var arrayLayer:Int;

	/** The base texel of the texture in the selected mip_level. **/
	public var origin:Origin3D;

	/**
		[Internal]

		@throws UseAfterDestroyException If `texture` was already destroyed.
	**/
	function validate():Void {
		texture.validate();
	}
}
