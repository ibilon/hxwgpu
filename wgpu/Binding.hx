package wgpu;

/**
	A bindable resource and the slot to bind it to.
**/
@:structInit
class Binding {
	public var binding:Int;
	public var resource:BindingResource;
}
