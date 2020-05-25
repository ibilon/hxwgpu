package wgpu;

@:structInit
class SwapChainDescriptor {
	public var usage:TextureUsage;
	public var format:TextureFormat;
	public var width:UInt;
	public var height:UInt;
	public var presentMode:PresentMode;
}
