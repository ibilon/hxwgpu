package wgpu;

/**
	A complete description of a compute pipeline.
**/
@:structInit
class ComputePipelineDescriptor {
	/** The layout of bind groups for this pipeline. **/
	public var layout:PipelineLayout;

	/** The compiled compute stage and its entry point. **/
	public var computeStage:ProgrammableStageDescriptor;
}
