package wgpu;

/**
	A complete description of a render (graphics) pipeline.
**/
@:structInit
class RenderPipelineDescriptor {
	/** The layout of bind groups for this pipeline. **/
	public var layout:PipelineLayout;

	/** The compiled vertex stage and its entry point. **/
	public var vertexStage:ProgrammableStageDescriptor;

	/** The compiled fragment stage and its entry point, if any. **/
	@:optional public var fragmentStage:ProgrammableStageDescriptor;

	/** The compiled fragment stage and its entry point, if any. **/
	@:optional public var rasterizationState:RasterizationStateDescriptor;

	/** The primitive topology used to interpret vertices. **/
	public var primitiveTopology:PrimitiveTopology;

	/** The effect of draw calls on the color aspect of the output target. **/
	public var colorStates:Array<ColorStateDescriptor>;

	/** The effect of draw calls on the depth and stencil aspects of the output target, if any. **/
	@:optional public var depthStencilState:DepthStencilStateDescriptor;

	/** The vertex input state for this pipeline. **/
	public var vertexState:VertexStateDescriptor;

	/** The number of samples calculated per pixel (for MSAA). **/
	public var sampleCount:UInt;

	/** Bitmask that restricts the samples of a pixel modified by this pipeline. **/
	public var sampleMask:UInt;

	/**
		When enabled, produces another sample mask per pixel based on the alpha output value, that is ANDed with the sample_mask and the primitive coverage to restrict the set of samples affected by a primitive. The implicit mask produced for alpha of zero is guaranteed to be zero, and for alpha of one is guaranteed to be all 1-s.
	**/
	public var alphaToCoverageEnabled:Bool;
}
