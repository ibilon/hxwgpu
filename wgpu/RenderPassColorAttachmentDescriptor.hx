package wgpu;

@:structInit
class RenderPassColorAttachmentDescriptor {
	public var attachment:TextureView;
	@:optional public var resolveTarget:TextureView;
	public var loadOp:LoadOp;
	public var storeOp:StoreOp;
	public var clearColor:Color;
}
