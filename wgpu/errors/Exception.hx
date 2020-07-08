package wgpu.errors;

/**
	Base exception class of WGPU.
**/
@:allow(wgpu)
class Exception {
	/** A message describing the error. **/
	public var message(default, null):String;

	/**
		[Internal]
	**/
	function new(message:String) {
		this.message = message;
	}

	/**
		[Internal]
	**/
	function toString():String {
		return message;
	}
}
