package wgpu;

/**
	A description of a group of bindings and the resources to be bound.
**/
@:structInit
class BindGroupDescriptor {
	/**
		An optional label to apply to the bind group.

		This can be useful for debugging and performance analysis.
	**/
	@:optional public var label:Null<String>;

	/** The layout for this bind group. **/
	public var layout:BindGroupLayout;

	/** The resources to bind to this bind group. **/
	public var bindings:Array<Binding>;
}
