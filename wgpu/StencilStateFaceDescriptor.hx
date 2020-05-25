package wgpu;

@:structInit
class StencilStateFaceDescriptor {
	public var compare:CompareFunction;
	public var failOp:StencilOperation;
	public var depthFailOp:StencilOperation;
	public var passOp:StencilOperation;
}
