package wgpu;

@:structAccess
class DepthStencilStateDescriptor {
	public var format:TextureFormat;
	public var depthWriteEnabled:Bool;
	public var depthCompare:CompareFunction;
	public var stencilFront:StencilStateFaceDescriptor;
	public var stencilBack:StencilStateFaceDescriptor;
	public var stencilReadMask:UInt;
	public var stencilWriteMask:UInt;
}
