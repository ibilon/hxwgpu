package wgpu;

@:structInit
class DepthStencilStateDescriptor {
	public var format:TextureFormat;
	public var depthWriteEnabled:Bool;
	public var depthCompare:CompareFunction;
	public var stencilFront:StencilStateFaceDescriptor;
	public var stencilBack:StencilStateFaceDescriptor;
	public var stencilReadMask:Int;
	public var stencilWriteMask:Int;

	public function needsStencilReference():Bool {
		return !stencilFront.compare.isTrivial() || !stencilBack.compare.isTrivial();
	}
}
