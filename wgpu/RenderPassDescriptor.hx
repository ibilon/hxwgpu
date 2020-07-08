package wgpu;

/**
	A description of all the attachments of a render pass.
**/
@:allow(wgpu)
@:structInit
class RenderPassDescriptor {
	/** The color attachments of the render pass. **/
	public var colorAttachments:Array<RenderPassColorAttachmentDescriptor>;

	/** The depth and stencil attachment of the render pass, if any. **/
	@:optional public var depthStencilAttachment:Null<RenderPassDepthStencilAttachmentDescriptor>;

	/**
		[Internal]

		@throws UseAfterDestroyException If `colorAttachments` or `depthStencilAttachment` isn't valid.
	**/
	function validate():Void {
		for (attachment in colorAttachments) {
			attachment.validate();
		}

		if (depthStencilAttachment != null) {
			depthStencilAttachment.attachment.validate();
		}
	}
}
