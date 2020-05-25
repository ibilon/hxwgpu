package wgpu;

/**
	A description of a programmable pipeline stage.
**/
@:structInit
class ProgrammableStageDescriptor {
	/** The compiled shader module for this stage. **/
	public var module:ShaderModule;

	/** The name of the entry point in the compiled shader. **/
	public var entryPoint:String;
}
