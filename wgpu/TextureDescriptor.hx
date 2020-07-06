package wgpu;

/**
	A description of a texture.
**/
@:structInit
class TextureDescriptor {
	/**
		An optional label to apply to the texture.

		This can be useful for debugging and performance analysis.
	**/
	@:optional public var label:Null<String>;

	/** The size of the texture. **/
	public var size:Extent3D;

	/** The array layer count. **/
	public var arrayLayerCount:Int;

	/** The mip level count. **/
	public var mipLevelCount:Int;

	/** The sample count. **/
	public var sampleCount:Int;

	/** The texture dimension. **/
	public var dimension:TextureDimension;

	/** The texture format. **/
	public var format:TextureFormat;

	/** All possible ways the texture can be used. **/
	public var usage:TextureUsage;
}
