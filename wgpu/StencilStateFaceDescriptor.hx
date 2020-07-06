package wgpu;

@:structInit
class StencilStateFaceDescriptor {
	public static var IGNORE(get, never):StencilStateFaceDescriptor;

	static function get_IGNORE():StencilStateFaceDescriptor {
		return {
			compare: Always,
			failOp: Keep,
			depthFailOp: Keep,
			passOp: Keep,
		};
	}

	public var compare:CompareFunction;
	public var failOp:StencilOperation;
	public var depthFailOp:StencilOperation;
	public var passOp:StencilOperation;
}
