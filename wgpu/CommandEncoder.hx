package wgpu;

/**
	An object that encodes GPU operations.

	A `CommandEncoder` can record `RenderPass`, `ComputePass`, and transfer operations between driver-managed resources like `Buffer` and `Texture`.

	When finished recording, call `CommandEncoder.finish` to obtain a `CommandBuffer` which may be submitted for execution.
**/
@:cppFileCode('
	#ifndef INCLUDED_wgpu_Color
	#include <wgpu/Color.h>
	#endif
	#ifndef INCLUDED_wgpu_Origin3D
	#include <wgpu/Origin3D.h>
	#endif
	#ifndef INCLUDED_wgpu_RenderPassColorAttachmentDescriptor
	#include <wgpu/RenderPassColorAttachmentDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_RenderPassDepthStencilAttachmentDescriptor
	#include <wgpu/RenderPassDepthStencilAttachmentDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_Texture
	#include <wgpu/Texture.h>
	#endif
	#ifndef INCLUDED_wgpu_TextureView
	#include <wgpu/TextureView.h>
	#endif
')
@:headerClassCode('
	WGPUCommandEncoderId native;
')
@:headerInclude('./wgpu.h')
class CommandEncoder {
	/**
		Begins recording of a compute pass.

		This function returns a `ComputePass` object which records a single compute pass.
	**/
	public function beginComputePass():ComputePass {
		untyped __cpp__('
			wgpu::ComputePass computePass = wgpu::ComputePass_obj::__alloc(HX_CTX);
			computePass->native = wgpu_command_encoder_begin_compute_pass(native, nullptr);
		');

		return untyped __cpp__('computePass');
	}

	/**
		Begins recording of a render pass.

		This function returns a `RenderPass` object which records a single render pass.

		@throws UseAfterDestroyException If the `TextureView` in `renderPassDescriptor` were destroyed.
	**/
	public function beginRenderPass(renderPassDescriptor:RenderPassDescriptor):RenderPass {
		renderPassDescriptor.validate();

		untyped __cpp__('
			WGPURenderPassColorAttachmentDescriptor *color_attachments = (WGPURenderPassColorAttachmentDescriptor*)malloc(sizeof(*color_attachments) * renderPassDescriptor->colorAttachments->length);

			for (unsigned int i = 0; i < renderPassDescriptor->colorAttachments->length; ++i) {
				auto elem = renderPassDescriptor->colorAttachments->__get(i).StaticCast<wgpu::RenderPassColorAttachmentDescriptor>();

				color_attachments[i] = {
					attachment: elem->attachment->native,
					resolve_target: hx::IsNull(elem->resolveTarget) ? 0 : elem->resolveTarget->native,
					load_op: (WGPULoadOp)elem->loadOp,
					store_op: (WGPUStoreOp)elem->storeOp,
					clear_color: {
						r: (float)elem->clearColor->r,
						g: (float)elem->clearColor->g,
						b: (float)elem->clearColor->b,
						a: (float)elem->clearColor->a,
					},
				};
			}

			WGPURenderPassDepthStencilAttachmentDescriptor depth_stencil_attachment;

			if (!hx::IsNull(renderPassDescriptor->depthStencilAttachment)) {
				depth_stencil_attachment.attachment = renderPassDescriptor->depthStencilAttachment->attachment->native;
				depth_stencil_attachment.depth_load_op = (WGPULoadOp)renderPassDescriptor->depthStencilAttachment->depthLoadOp;
				depth_stencil_attachment.depth_store_op = (WGPUStoreOp)renderPassDescriptor->depthStencilAttachment->depthStoreOp;
				depth_stencil_attachment.clear_depth = (float)renderPassDescriptor->depthStencilAttachment->clearDepth;
				depth_stencil_attachment.stencil_load_op = (WGPULoadOp)renderPassDescriptor->depthStencilAttachment->stencilLoadOp;
				depth_stencil_attachment.stencil_store_op = (WGPUStoreOp)renderPassDescriptor->depthStencilAttachment->stencilStoreOp;
				depth_stencil_attachment.clear_stencil = (uint32_t)renderPassDescriptor->depthStencilAttachment->clearStencil;
			}

			WGPURenderPassDescriptor desc = {
				color_attachments: color_attachments,
				color_attachments_length: (uintptr_t)renderPassDescriptor->colorAttachments->length,
				depth_stencil_attachment: hx::IsNull(renderPassDescriptor->depthStencilAttachment) ? nullptr : &depth_stencil_attachment,
			};

			wgpu::RenderPass renderPass = wgpu::RenderPass_obj::__alloc(HX_CTX);
			renderPass->native = wgpu_command_encoder_begin_render_pass(native, &desc);

			free(color_attachments);
		');

		return untyped __cpp__('renderPass');
	}

	/**
		Copy data from one buffer to another.

		@throws UseAfterDestroyException If either `source` or `destination` were already destroyed.
	**/
	public function copyBufferToBuffer(source:Buffer, sourceOffset:Int, destination:Buffer, destinationOffset:Int, copySize:Int):Void {
		source.validate();
		destination.validate();
		untyped __cpp__('wgpu_command_encoder_copy_buffer_to_buffer(native, source->native, sourceOffset, destination->native, destinationOffset, copySize)');
	}

	/**
		Copy data from a buffer to a texture.

		@throws UseAfterDestroyException If either the `Buffer` from `source` or the `Texture` from `destination` were already destroyed.
	**/
	public function copyBufferToTexture(source:BufferCopyView, destination:TextureCopyView, copySize:Extent3D):Void {
		source.validate();
		destination.validate();

		untyped __cpp__('
			WGPUBufferCopyView native_source = {
				buffer: source->buffer->native,
				offset: (WGPUBufferAddress)source->offset,
				bytes_per_row: (uint32_t)source->bytesPerRow,
				rows_per_image: (uint32_t)source->rowsPerImage,
			};

			WGPUTextureCopyView native_destination = {
				texture: destination->texture->native,
				mip_level: (uint32_t)destination->mipLevel,
				array_layer: (uint32_t)destination->arrayLayer,
				origin: {
					x: (uint32_t)destination->origin->x,
					y: (uint32_t)destination->origin->y,
					z: (uint32_t)destination->origin->z,
				},
			};

			WGPUExtent3d native_copy_size = {
				width: (uint32_t)copySize->width,
				height: (uint32_t)copySize->height,
				depth: (uint32_t)copySize->depth,
			};

			wgpu_command_encoder_copy_buffer_to_texture(native, &native_source, &native_destination, native_copy_size);
		');

	}

	/**
		Copy data from a texture to a buffer.

		@throws UseAfterDestroyException If either the `Texture` from `source` or the `Buffer` from `destination` were already destroyed.
	**/
	public function copyTextureToBuffer(source:TextureCopyView, destination:BufferCopyView, copySize:Extent3D):Void {
		source.validate();
		destination.validate();

		untyped __cpp__('
			WGPUTextureCopyView native_source = {
				texture: source->texture->native,
				mip_level: (uint32_t)source->mipLevel,
				array_layer: (uint32_t)source->arrayLayer,
				origin: {
					x: (uint32_t)source->origin->x,
					y: (uint32_t)source->origin->y,
					z: (uint32_t)source->origin->z,
				},
			};

			WGPUBufferCopyView native_destination = {
				buffer: destination->buffer->native,
				offset: (WGPUBufferAddress)destination->offset,
				bytes_per_row: (uint32_t)destination->bytesPerRow,
				rows_per_image: (uint32_t)destination->rowsPerImage,
			};

			WGPUExtent3d native_copy_size = {
				width: (uint32_t)copySize->width,
				height: (uint32_t)copySize->height,
				depth: (uint32_t)copySize->depth,
			};

			wgpu_command_encoder_copy_texture_to_buffer(native, &native_source, &native_destination, native_copy_size);
		');

	}

	/**
		Copy data from one texture to another.

		@throws UseAfterDestroyException If the `Texture` from either `source` or `destination` were already destroyed.
	**/
	public function copyTextureToTexture(source:TextureCopyView, destination:TextureCopyView, copySize:Extent3D):Void {
		source.validate();
		destination.validate();

		untyped __cpp__('
			WGPUTextureCopyView native_source = {
				texture: source->texture->native,
				mip_level: (uint32_t)source->mipLevel,
				array_layer: (uint32_t)source->arrayLayer,
				origin: {
					x: (uint32_t)source->origin->x,
					y: (uint32_t)source->origin->y,
					z: (uint32_t)source->origin->z,
				},
			};

			WGPUTextureCopyView native_destination = {
				texture: destination->texture->native,
				mip_level: (uint32_t)destination->mipLevel,
				array_layer: (uint32_t)destination->arrayLayer,
				origin: {
					x: (uint32_t)destination->origin->x,
					y: (uint32_t)destination->origin->y,
					z: (uint32_t)destination->origin->z,
				},
			};

			WGPUExtent3d native_copy_size = {
				width: (uint32_t)copySize->width,
				height: (uint32_t)copySize->height,
				depth: (uint32_t)copySize->depth,
			};

			wgpu_command_encoder_copy_texture_to_texture(native, &native_source, &native_destination, native_copy_size);
		');

	}

	/**
		Finishes recording and returns a `CommandBuffer` that can be submitted for execution.
	**/
	public function finish():CommandBuffer {
		// TODO does this invalidate the instance?
		untyped __cpp__('
			wgpu::CommandBuffer commandBuffer = wgpu::CommandBuffer_obj::__alloc(HX_CTX);
			commandBuffer->native = wgpu_command_encoder_finish(native, nullptr);
		');

		return untyped __cpp__('commandBuffer');
	}
}
