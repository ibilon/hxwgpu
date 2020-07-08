package wgpu;

@:allow(wgpu)
@:structInit
class RenderPassColorAttachmentDescriptor {
	public var attachment:TextureView;
	@:optional public var resolveTarget:Null<TextureView>;
	public var loadOp:LoadOp;
	public var storeOp:StoreOp;
	public var clearColor:Color;

	/**
		[Internal]

		@throws UseAfterDestroyException If `attachment` or `resolveTarget` (when present) were already destroyed.
	**/
	function validate():Void {
		attachment.validate();

		if (resolveTarget != null) {
			resolveTarget.validate();
		}
	}
}
