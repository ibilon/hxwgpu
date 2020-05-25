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

	public function new(format:TextureFormat, depthWriteEnabled:Bool, depthCompare:CompareFunction, stencilFront:StencilStateFaceDescriptor,
			stencilBack:StencilStateFaceDescriptor, stencilReadMask:UInt, stencilWriteMask:UInt) {
		this.format = format;
		this.depthWriteEnabled = depthWriteEnabled;
		this.depthCompare = depthCompare;
		this.stencilFront = stencilFront;
		this.stencilBack = stencilBack;
		this.stencilReadMask = stencilReadMask;
		this.stencilWriteMask = stencilWriteMask;
	}
}
