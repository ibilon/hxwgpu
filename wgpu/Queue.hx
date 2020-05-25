package wgpu;

/**
	A handle to a command queue on a device.

	A `Queue` executes recorded `CommandBuffer` objects.
**/
@:headerClassCode('
	WGPUQueueId native;
')
@:headerInclude('./wgpu.h')
class Queue {
	/** Submits a series of finished command buffers for execution. **/
	public function submit(commandBuffers:Array<CommandBuffer>):Void {
		untyped __cpp__('
			WGPUCommandBufferId *command_buffers = (WGPUCommandBufferId*)malloc(sizeof(*command_buffers) * commandBuffers->length);

			for (unsigned int i = 0; i < commandBuffers->length; ++i) {
				command_buffers[i] = commandBuffers->__get(i).StaticCast<wgpu::CommandBuffer>()->native;
			}

			wgpu_queue_submit(native, command_buffers, commandBuffers->length);

			free(command_buffers);
		');

	}
}
