package wgpu;

@:structInit
class TextureViewDescriptor {
	@:optional public var label:Null<String>;
	public var format:TextureFormat;
	public var dimension:TextureViewDimension;
	public var aspect:TextureAspect;
	public var baseMipLevel:Int;
	public var levelCount:Int;
	public var baseArrayLayer:Int;
	public var arrayLayerCount:Int;
}
