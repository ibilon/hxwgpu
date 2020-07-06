package wgpu;

@:structAccess
class DepthStencilStateDescriptor {
	public var format:TextureFormat;
	public var depthWriteEnabled:Bool;
	public var depthCompare:CompareFunction;
	public var stencilFront:StencilStateFaceDescriptor;
	public var stencilBack:StencilStateFaceDescriptor;
	public var stencilReadMask:Int;
	public var stencilWriteMask:Int;

	public function new(format:TextureFormat, depthWriteEnabled:Bool, depthCompare:CompareFunction, stencilFront:StencilStateFaceDescriptor,
			stencilBack:StencilStateFaceDescriptor, stencilReadMask:Int, stencilWriteMask:Int) {
		this.format = format;
		this.depthWriteEnabled = depthWriteEnabled;
		this.depthCompare = depthCompare;
		this.stencilFront = stencilFront;
		this.stencilBack = stencilBack;
		this.stencilReadMask = stencilReadMask;
		this.stencilWriteMask = stencilWriteMask;
	}

	public function needsStencilReference():Bool {
		return !stencilFront.compare.isTrivial() || !stencilBack.compare.isTrivial();
	}
}
