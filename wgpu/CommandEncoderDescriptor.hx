package wgpu;

/**
	A description of a command encoder.
**/
@:structInit
class CommandEncoderDescriptor {
	/** An optional label to apply to the command encoder. This can be useful for debugging and performance analysis. **/
	@:optional public var label:Null<String>;
}
