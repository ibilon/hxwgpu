package wgpu;

/**
	A description of a single binding inside a bind group.
**/
@:structInit
class BindGroupLayoutEntry {
	public var binding:Int;
	public var visibility:ShaderStage;
	public var type:BindingType;
}
