package wgpu;

@:structInit
class RenderPassDepthStencilAttachmentDescriptor {
	public var attachment:TextureView;
	public var depthLoadOp:LoadOp;
	public var depthStoreOp:StoreOp;
	public var clearDepth:Float;
	public var stencilLoadOp:LoadOp;
	public var stencilStoreOp:StoreOp;
	public var clearStencil:UInt;
}
