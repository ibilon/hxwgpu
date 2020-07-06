package wgpu;

@:structInit
class SamplerDescriptor {
	@:optional public var label:Null<String>;
	public var addressModeU:AddressMode;
	public var addressModeV:AddressMode;
	public var addressModeW:AddressMode;
	public var magFilter:FilterMode;
	public var minFilter:FilterMode;
	public var mipmapFilter:FilterMode;
	public var lodMinClamp:Float;
	public var lodMaxClamp:Float;
	public var compare:CompareFunction;
}
