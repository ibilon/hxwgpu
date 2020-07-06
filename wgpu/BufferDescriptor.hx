package wgpu;

/**
	A description of a buffer.
**/
@:structInit
class BufferDescriptor {
	/**
		An optional label to apply to the buffer.

		This can be useful for debugging and performance analysis.
	**/
	@:optional public var label:Null<String>;

	/** The size of the buffer (in bytes). **/
	public var size:Int;

	/** All possible ways the buffer can be used. **/
	public var usage:BufferUsage;
}
