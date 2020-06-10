package wgpu;

// TODO missing functions: beginComputePass, copyBufferToBuffer, copyBufferToTexture, copyTextureToBuffer, copyTextureToTexture

/**
	An object that encodes GPU operations.

	A `CommandEncoder` can record `RenderPass`, `ComputePass`, and transfer operations between driver-managed resources like `Buffer` and `Texture`.

	When finished recording, call `CommandEncoder.finish` to obtain a `CommandBuffer` which may be submitted for execution.
**/
@:cppFileCode('
	#ifndef INCLUDED_wgpu_Color
	#include <wgpu/Color.h>
	#endif
	#ifndef INCLUDED_wgpu_RenderPassColorAttachmentDescriptor
	#include <wgpu/RenderPassColorAttachmentDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_RenderPassDepthStencilAttachmentDescriptor
	#include <wgpu/RenderPassDepthStencilAttachmentDescriptor.h>
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
		Begins recording of a render pass.

		This function returns a `RenderPass` object which records a single render pass.
	**/
	public function beginRenderPass(renderPassDescriptor:RenderPassDescriptor):RenderPass {
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
			return renderPass;
		');

		throw "unreachable";
	}

	/**
		Finishes recording and returns a `CommandBuffer` that can be submitted for execution.
	**/
	public function finish():CommandBuffer {
		untyped __cpp__('
			wgpu::CommandBuffer commandBuffer = wgpu::CommandBuffer_obj::__alloc(HX_CTX);
			commandBuffer->native = wgpu_command_encoder_finish(native, nullptr);
			return commandBuffer;
		');

		throw "unreachable";
	}
}
