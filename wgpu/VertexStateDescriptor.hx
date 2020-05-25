package wgpu;

/**
	The vertex input state for a render pipeline.
**/
@:structInit
class VertexStateDescriptor {
	/** The format of any index buffers used with this pipeline. **/
	public var indexFormat:IndexFormat;

	/** The format of any vertex buffers used with this pipeline. **/
	public var vertexBuffers:Array<VertexBufferDescriptor>;
}
