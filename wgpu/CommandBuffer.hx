package wgpu;

/**
	An opaque handle to a command buffer on the GPU.

	A `CommandBuffer` represents a complete sequence of commands that may be submitted to a command queue with `Queue.submit`.
	A `CommandBuffer` is obtained by recording a series of commands to a `CommandEncoder` and then calling `CommandEncoder.finish`.
**/
@:headerClassCode('
	WGPUCommandBufferId native;
')
@:headerInclude('./wgpu.h')
class CommandBuffer {}
