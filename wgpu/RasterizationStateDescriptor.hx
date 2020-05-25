package wgpu;

@:structInit
class RasterizationStateDescriptor {
	public var frontFace:FrontFace;
	public var cullMode:CullMode;
	public var depthBias:Int;
	public var depthBiasSlopeScale:Float;
	public var depthBiasClamp:Float;
}
