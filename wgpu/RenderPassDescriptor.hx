package wgpu;

/**
	A description of all the attachments of a render pass.
**/
@:structInit
class RenderPassDescriptor {
	/** The color attachments of the render pass. **/
	public var colorAttachments:Array<RenderPassColorAttachmentDescriptor>;

	/** The depth and stencil attachment of the render pass, if any. **/
	@:optional public var depthStencilAttachment:RenderPassDepthStencilAttachmentDescriptor;
}
