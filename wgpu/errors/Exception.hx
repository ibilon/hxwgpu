package wgpu.errors;

/**
	Base exception class of WGPU.
**/
@:allow(wgpu)
class Exception {
	/** A message describing the error. **/
	public var message(default, null):String;

	function new(message:String) {
		this.message = message;
	}

	function toString():String {
		return message;
	}
}
