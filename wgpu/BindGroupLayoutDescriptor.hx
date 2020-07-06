package wgpu;

/**
	A description of a bind group layout.
**/
@:structInit
class BindGroupLayoutDescriptor {
	/**
		An optional label to apply to the bind group layout.

		This can be useful for debugging and performance analysis.
	**/
	@:optional public var label:Null<String>;

	public var bindings:Array<BindGroupLayoutEntry>;
}
