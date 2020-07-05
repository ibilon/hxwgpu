package wgpu;

@:structInit
class SwapChainDescriptor {
	public var usage:TextureUsage;
	public var format:TextureFormat;
	public var width:Int;
	public var height:Int;
	public var presentMode:PresentMode;
}
