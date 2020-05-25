package wgpu;

/**
	A description of a vertex buffer.
**/
@:structInit
class VertexBufferDescriptor {
	/** The stride, in bytes, between elements of this buffer. **/
	public var stride:UInt;

	public var stepMode:InputStepMode;

	/** The list of attributes which comprise a single vertex. **/
	public var attributes:Array<VertexAttributeDescriptor>;
}
