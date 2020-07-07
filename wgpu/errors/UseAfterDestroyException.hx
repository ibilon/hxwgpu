package wgpu.errors;

/**
	Instance used after being destroyed.
**/
@:allow(wgpu)
class UseAfterDestroyException<T> extends Exception {
	/** The instance used after being destroyed. **/
	public var instance(default, null):T;

	function new(instance:T) {
		this.instance = instance;
		super("Instance used after being destroyed");
	}

	override function toString():String {
		return 'Instance of ${Type.getClassName(Type.getClass(instance))} used after being destroyed';
	}
}
