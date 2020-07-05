package wgpu;

// TODO missing functions: many

/**
	An in-progress recording of a render pass.
**/
@:headerClassCode('
	WGPURenderPassId native;
')
@:headerInclude('./wgpu.h')
class RenderPass {
	/**
		Draws primitives from the active vertex buffer(s).

		The active vertex buffers can be set with `RenderPass.setVertexBuffers`.
	**/
	public function draw(verticesStart:Int, verticesEnd:Int, instancesStart:Int, instancesEnd:Int):Void {
		untyped __cpp__('
			wgpu_render_pass_draw(native, verticesEnd - verticesStart, instancesEnd - instancesStart, verticesStart, instancesStart);
		');
	}

	/**
		Draws indexed primitives using the active index buffer and the active vertex buffers.

		The active index buffer can be set with `RenderPass.setIndexBuffer`, while the active vertex buffers can be set with `RenderPass.setVertexBuffers`.
	**/
	public function drawIndexed(indicesStart:Int, indicesEnd:Int, baseVertex:Int, instancesStart:Int, instancesEnd:Int):Void {
		untyped __cpp__('
			wgpu_render_pass_draw_indexed(native, indicesEnd - indicesStart, instancesEnd - indicesStart, indicesStart, baseVertex, instancesStart);
		');
	}

	public function endPass():Void {
		untyped __cpp__('
			wgpu_render_pass_end_pass(native);
		');
	}

	/**
		Sets the active index buffer.

		Subsequent calls to `drawIndexed` on this `RenderPass` will use `buffer` as the source index buffer.

		If `size` == 0, the remaining part of the buffer is considered.
	**/
	public function setIndexBuffer(buffer:Buffer, offset:Int, size:Int):Void {
		untyped __cpp__('
			wgpu_render_pass_set_index_buffer(native, buffer->native, offset, size);
		');
	}

	/**
		Sets the active render pipeline.

		Subsequent draw calls will exhibit the behavior defined by `pipeline`.
	**/
	public function setPipeline(renderPipeline:RenderPipeline):Void {
		untyped __cpp__('
			wgpu_render_pass_set_pipeline(native, renderPipeline->native);
		');
	}

	/**
		Assign a vertex buffer to a slot.

		Subsequent calls to `draw` and `drawIndexed` on this `RenderPass` will use `buffer` as one of the source vertex buffers.

		The `slot` refers to the index of the matching descriptor in `RenderPipelineDescriptor.vertex_buffers`.

		If `size` == 0, the remaining part of the buffer is considered.
	**/
	public function setVertexBuffer(slot:Int, buffer:Buffer, offset:Int, size:Int):Void {
		untyped __cpp__('
			wgpu_render_pass_set_vertex_buffer(native, slot, buffer->native, offset, size);
		');
	}
}
