package wgpu;

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
		untyped __cpp__('wgpu_render_pass_draw(native, verticesEnd - verticesStart, instancesEnd - instancesStart, verticesStart, instancesStart)');
	}

	/**
		Draws indexed primitives using the active index buffer and the active vertex buffers.

		The active index buffer can be set with `RenderPass.setIndexBuffer`, while the active vertex buffers can be set with `RenderPass.setVertexBuffers`.
	**/
	public function drawIndexed(indicesStart:Int, indicesEnd:Int, baseVertex:Int, instancesStart:Int, instancesEnd:Int):Void {
		untyped __cpp__('wgpu_render_pass_draw_indexed(native, indicesEnd - indicesStart, instancesEnd - indicesStart, indicesStart, baseVertex, instancesStart)');
	}

	/**
		Draws indexed primitives using the active index buffer and the active vertex buffers, based on the contents of the `indirectBuffer`.

		The active index buffer can be set with `RenderPass.setIndexBuffer`, while the active vertex buffers can be set with `RenderPass.setVertexBuffers`.

		@throws UseAfterDestroyException If `indirectBuffer` was already destroyed.
	**/
	public function drawIndexedIndirect(indirectBuffer:Buffer, indirectOffset:Int):Void {
		indirectBuffer.validate();
		untyped __cpp__('wgpu_render_pass_draw_indexed_indirect(native, indirectBuffer->native, indirectOffset)');
	}

	/**
		Draws primitives from the active vertex buffer(s) based on the contents of the `indirectBuffer`.

		The active vertex buffers can be set with `RenderPass.setVertexBuffers`.

		@throws UseAfterDestroyException If `indirectBuffer` was already destroyed.
	**/
	public function drawIndirect(indirectBuffer:Buffer, indirectOffset:Int):Void {
		indirectBuffer.validate();
		untyped __cpp__('wgpu_render_pass_draw_indirect(native, indirectBuffer->native, indirectOffset)');
	}

	public function endPass():Void {
		// TODO does this invalidate the instance?
		untyped __cpp__('wgpu_render_pass_end_pass(native)');
	}

	/**
		Sets the active bind group for a given bind group index.

		@throws UseAfterDestroyException If `bindGroup` was already destroyed.
	**/
	public function setBindGroup(index:Int, bindGroup:BindGroup, offsets:Array<Int>):Void {
		bindGroup.validate();

		untyped __cpp__('
			uint32_t *native_offsets = (uint32_t*)malloc(sizeof(*native_offsets) * offsets->length);

			for (unsigned int i = 0; i < offsets->length; ++i) {
				native_offsets[i] = (uint32_t)offsets->__get(i);
			}

			wgpu_render_pass_set_bind_group(native, index, bindGroup->native, native_offsets, offsets->length);

			free(native_offsets);
		');

	}

	public function setBlendColor(color:Color):Void {
		untyped __cpp__('
			WGPUColor native_color = {
				r: color->r,
				g: color->g,
				b: color->b,
				a: color->a,
			};

			wgpu_render_pass_set_blend_color(native, &native_color);
		');

	}

	/**
		Sets the active index buffer.

		Subsequent calls to `drawIndexed` on this `RenderPass` will use `buffer` as the source index buffer.

		If `size` == 0, the remaining part of the buffer is considered.

		@throws UseAfterDestroyException If `buffer` was destroyed.
	**/
	public function setIndexBuffer(buffer:Buffer, offset:Int, size:Int):Void {
		buffer.validate();
		untyped __cpp__('wgpu_render_pass_set_index_buffer(native, buffer->native, offset, size)');
	}

	/**
		Sets the active render pipeline.

		Subsequent draw calls will exhibit the behavior defined by `pipeline`.
	**/
	public function setPipeline(renderPipeline:RenderPipeline):Void {
		untyped __cpp__('wgpu_render_pass_set_pipeline(native, renderPipeline->native)');
	}

	/**
		Sets the scissor region.

		Subsequent draw calls will discard any fragments that fall outside this region.
	**/
	public function setScissorRect(x:Int, y:Int, width:Int, height:Int):Void {
		untyped __cpp__('wgpu_render_pass_set_scissor_rect(native, x, y, width, height)');
	}

	/**
		Sets the stencil reference.

		Subsequent stencil tests will test against this value.
	**/
	public function setStencilReference(reference:Int):Void {
		untyped __cpp__('wgpu_render_pass_set_stencil_reference(native, reference)');
	}

	/**
		Assign a vertex buffer to a slot.

		Subsequent calls to `draw` and `drawIndexed` on this `RenderPass` will use `buffer` as one of the source vertex buffers.

		The `slot` refers to the index of the matching descriptor in `RenderPipelineDescriptor.vertex_buffers`.

		If `size` == 0, the remaining part of the buffer is considered.

		@throws UseAfterDestroyException If `buffer` was destroyed.
	**/
	public function setVertexBuffer(slot:Int, buffer:Buffer, offset:Int, size:Int):Void {
		buffer.validate();
		untyped __cpp__('wgpu_render_pass_set_vertex_buffer(native, slot, buffer->native, offset, size)');
	}

	/**
		Sets the viewport region.

		Subsequent draw calls will draw any fragments in this region.
	**/
	public function setViewport(x:Float, y:Float, width:Float, height:Float, minDepth:Float, maxDepth:Float):Void {
		untyped __cpp__('wgpu_render_pass_set_viewport(native, x, y, width, height, minDepth, maxDepth)');
	}
}
