package wgpu;

// TODO missing functions: many + drop/destroy
import haxe.ds.ReadOnlyArray;
import sys.io.File;

/**
	An open connection to a graphics and/or compute device.

	The `Device` is the responsible for the creation of most rendering and compute resources, as well as exposing `Queue` objects.
**/
@:cppFileCode('
	#ifndef INCLUDED_wgpu_BindGroupLayout
	#include <wgpu/BindGroupLayout.h>
	#endif
	#ifndef INCLUDED_wgpu_BlendDescriptor
	#include <wgpu/BlendDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_ColorStateDescriptor
	#include <wgpu/ColorStateDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_DepthStencilStateDescriptor
	#include <wgpu/DepthStencilStateDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_ProgrammableStageDescriptor
	#include <wgpu/ProgrammableStageDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_RasterizationStateDescriptor
	#include <wgpu/RasterizationStateDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_StencilStateFaceDescriptor
	#include <wgpu/StencilStateFaceDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_VertexAttributeDescriptor
	#include <wgpu/VertexAttributeDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_VertexBufferDescriptor
	#include <wgpu/VertexBufferDescriptor.h>
	#endif
	#ifndef INCLUDED_wgpu_VertexStateDescriptor
	#include <wgpu/VertexStateDescriptor.h>
	#endif
')
@:cppNamespaceCode('
	WGPUBufferId wgpu::Device_obj::create_buffer_with_data(const uint8_t *data, const unsigned int size, const WGPUBufferUsage usage) {
		WGPUBufferDescriptor desc = {
			label: nullptr,
			size: size,
			usage: usage,
		};

		uint8_t *buffer_data;
		WGPUBufferId buffer = wgpu_device_create_buffer_mapped(native, &desc, &buffer_data);
		memcpy(buffer_data, data, size);

		return buffer;
	}
')
@:headerClassCode('
	WGPUDeviceId native;

	WGPUBufferId create_buffer_with_data(const uint8_t *data, const unsigned int size, const WGPUBufferUsage usage);
')
@:headerInclude('./wgpu.h')
class Device {
	public function createBufferWithFloat32Data(data:ReadOnlyArray<Float>, usage:BufferUsage):Buffer {
		untyped __cpp__('
			float *native_data = (float*)malloc(sizeof(*native_data) * data->length);

			for (unsigned int i = 0; i < data->length; ++i) {
				native_data[i] = (float)data->__get(i);
			}

			wgpu::Buffer buffer = wgpu::Buffer_obj::__alloc(HX_CTX);
			buffer->native = create_buffer_with_data((uint8_t*)native_data, data->length * 4, (WGPUBufferUsage)usage);

			free(native_data);
		');

		return untyped __cpp__('buffer');
	}

	public function createBufferWithUInt16Data(data:ReadOnlyArray<Int>, usage:BufferUsage):Buffer {
		untyped __cpp__('
			uint16_t *native_data = (uint16_t*)malloc(sizeof(*native_data) * data->length);

			for (unsigned int i = 0; i < data->length; ++i) {
				native_data[i] = (uint16_t)data->__get(i);
			}

			wgpu::Buffer buffer = wgpu::Buffer_obj::__alloc(HX_CTX);
			buffer->native = create_buffer_with_data((uint8_t*)native_data, data->length * 2, (WGPUBufferUsage)usage);

			free(native_data);
		');

		return untyped __cpp__('buffer');
	}

	public function createBufferWithUInt32Data(data:ReadOnlyArray<Int>, usage:BufferUsage):Buffer {
		untyped __cpp__('
			uint32_t *native_data = (uint32_t*)malloc(sizeof(*native_data) * data->length);

			for (unsigned int i = 0; i < data->length; ++i) {
				native_data[i] = (uint32_t)data->__get(i);
			}

			wgpu::Buffer buffer = wgpu::Buffer_obj::__alloc(HX_CTX);
			buffer->native = create_buffer_with_data((uint8_t*)native_data, data->length * 4, (WGPUBufferUsage)usage);

			free(native_data);
		');

		return untyped __cpp__('buffer');
	}

	public function createCommandEncoder(commandEncoderDescriptor:CommandEncoderDescriptor):CommandEncoder {
		untyped __cpp__('
			WGPUCommandEncoderDescriptor desc = {
				label: hx::IsNull(commandEncoderDescriptor->label) ? nullptr : (const char*)commandEncoderDescriptor->label,
			};

			wgpu::CommandEncoder commandEncoder = wgpu::CommandEncoder_obj::__alloc(HX_CTX);
			commandEncoder->native = wgpu_device_create_command_encoder(native, &desc);
		');

		return untyped __cpp__('commandEncoder');
	}

	public function createPipelineLayout(pipelineLayoutDescriptor:PipelineLayoutDescriptor):PipelineLayout {
		untyped __cpp__('
			WGPUBindGroupLayoutId *bind_group_layouts = (WGPUBindGroupLayoutId*)malloc(sizeof(*bind_group_layouts) * pipelineLayoutDescriptor->bindGroupLayouts->length);

			for (unsigned int i = 0; i < pipelineLayoutDescriptor->bindGroupLayouts->length; ++i) {
				bind_group_layouts[i] = pipelineLayoutDescriptor->bindGroupLayouts->__get(i).StaticCast<wgpu::BindGroupLayout>()->native;
			}

			WGPUPipelineLayoutDescriptor desc = {
				bind_group_layouts: bind_group_layouts,
				bind_group_layouts_length: (uintptr_t)pipelineLayoutDescriptor->bindGroupLayouts->length,
			};

			wgpu::PipelineLayout pipelineLayout = wgpu::PipelineLayout_obj::__alloc(HX_CTX);
			pipelineLayout->native = wgpu_device_create_pipeline_layout(native, &desc);

			free(bind_group_layouts);
		');

		return untyped __cpp__('pipelineLayout');
	}

	public function createRenderPipeline(renderPipelineDescriptor:RenderPipelineDescriptor):RenderPipeline {
		untyped __cpp__('
			WGPUProgrammableStageDescriptor fragment_stage;

			if (!hx::IsNull(renderPipelineDescriptor->fragmentStage)) {
				fragment_stage.module = renderPipelineDescriptor->fragmentStage->module->native;
				fragment_stage.entry_point = renderPipelineDescriptor->fragmentStage->entryPoint;
			}

			WGPURasterizationStateDescriptor rasterization_state;

			if (!hx::IsNull(renderPipelineDescriptor->rasterizationState)) {
				rasterization_state.front_face = (WGPUFrontFace)renderPipelineDescriptor->rasterizationState->frontFace;
				rasterization_state.cull_mode = (WGPUCullMode)renderPipelineDescriptor->rasterizationState->cullMode;
				rasterization_state.depth_bias = (int32_t)renderPipelineDescriptor->rasterizationState->depthBias;
				rasterization_state.depth_bias_slope_scale = (float)renderPipelineDescriptor->rasterizationState->depthBiasSlopeScale;
				rasterization_state.depth_bias_clamp = (float)renderPipelineDescriptor->rasterizationState->depthBiasClamp;
			}

			WGPUColorStateDescriptor *color_states = (WGPUColorStateDescriptor*)malloc(sizeof(*color_states) * renderPipelineDescriptor->colorStates->length);

			for (unsigned int i = 0; i < renderPipelineDescriptor->colorStates->length; ++i) {
				auto elem = renderPipelineDescriptor->colorStates->__get(i).StaticCast<wgpu::ColorStateDescriptor>();

				color_states[i] = {
					format: (WGPUTextureFormat)elem->format,
					alpha_blend: {
						src_factor: (WGPUBlendFactor)elem->alphaBlend->srcFactor,
						dst_factor: (WGPUBlendFactor)elem->alphaBlend->dstFactor,
						operation: (WGPUBlendOperation)elem->alphaBlend->operation,
					},
					color_blend: {
						src_factor: (WGPUBlendFactor)elem->colorBlend->srcFactor,
						dst_factor: (WGPUBlendFactor)elem->colorBlend->dstFactor,
						operation: (WGPUBlendOperation)elem->colorBlend->operation,
					},
					write_mask: (WGPUColorWrite)elem->writeMask,
				};
			}

			WGPUDepthStencilStateDescriptor depth_stencil_state;

			if (!hx::IsNull(renderPipelineDescriptor->depthStencilState)) {
				depth_stencil_state.format = (WGPUTextureFormat)renderPipelineDescriptor->depthStencilState->format;
				depth_stencil_state.depth_write_enabled = renderPipelineDescriptor->depthStencilState->depthWriteEnabled;
				depth_stencil_state.depth_compare = (WGPUCompareFunction)renderPipelineDescriptor->depthStencilState->depthCompare;
				depth_stencil_state.stencil_front = {
					compare: (WGPUCompareFunction)renderPipelineDescriptor->depthStencilState->stencilFront->compare,
					fail_op: (WGPUStencilOperation)renderPipelineDescriptor->depthStencilState->stencilFront->failOp,
					depth_fail_op: (WGPUStencilOperation)renderPipelineDescriptor->depthStencilState->stencilFront->depthFailOp,
					pass_op: (WGPUStencilOperation)renderPipelineDescriptor->depthStencilState->stencilFront->passOp,
				};
				depth_stencil_state.stencil_back = {
					compare: (WGPUCompareFunction)renderPipelineDescriptor->depthStencilState->stencilBack->compare,
					fail_op: (WGPUStencilOperation)renderPipelineDescriptor->depthStencilState->stencilBack->failOp,
					depth_fail_op: (WGPUStencilOperation)renderPipelineDescriptor->depthStencilState->stencilBack->depthFailOp,
					pass_op: (WGPUStencilOperation)renderPipelineDescriptor->depthStencilState->stencilBack->passOp,
				};
				depth_stencil_state.stencil_read_mask = (uint32_t)renderPipelineDescriptor->depthStencilState->stencilReadMask;
				depth_stencil_state.stencil_write_mask = (uint32_t)renderPipelineDescriptor->depthStencilState->stencilWriteMask;
			}

			WGPUVertexBufferLayoutDescriptor *vertex_buffers = (WGPUVertexBufferLayoutDescriptor*)malloc(sizeof(*vertex_buffers) * renderPipelineDescriptor->vertexState->vertexBuffers->length);
			WGPUVertexAttributeDescriptor **attributes = (WGPUVertexAttributeDescriptor**)malloc(sizeof(*attributes) * renderPipelineDescriptor->vertexState->vertexBuffers->length);

			for (unsigned int i = 0; i < renderPipelineDescriptor->vertexState->vertexBuffers->length; ++i) {
				auto elem = renderPipelineDescriptor->vertexState->vertexBuffers->__get(i).StaticCast<wgpu::VertexBufferDescriptor>();

				attributes[i] = (WGPUVertexAttributeDescriptor*)malloc(sizeof(**attributes) * elem->attributes->length);

				for (unsigned int j = 0; j < elem->attributes->length; ++j) {
					auto sub_elem = elem->attributes->__get(j).StaticCast<wgpu::VertexAttributeDescriptor>();

					attributes[i][j] = {
						offset: (WGPUBufferAddress)sub_elem->offset,
						format: (WGPUVertexFormat)sub_elem->format,
						shader_location: (WGPUShaderLocation)sub_elem->shaderLocation,
					};
				}

				vertex_buffers[i] = {
					array_stride: (WGPUBufferAddress)elem->stride,
					step_mode: (WGPUInputStepMode)elem->stepMode,
					attributes: attributes[i],
					attributes_length: (uintptr_t)elem->attributes->length,
				};
			}

			WGPURenderPipelineDescriptor desc = {
				layout: renderPipelineDescriptor->layout->native,
				vertex_stage: {
					module: renderPipelineDescriptor->vertexStage->module->native,
					entry_point: renderPipelineDescriptor->vertexStage->entryPoint,
				},
				fragment_stage: hx::IsNull(renderPipelineDescriptor->fragmentStage) ? nullptr : &fragment_stage,
				primitive_topology: (WGPUPrimitiveTopology)renderPipelineDescriptor->primitiveTopology,
				rasterization_state: hx::IsNull(renderPipelineDescriptor->rasterizationState) ? nullptr : &rasterization_state,
				color_states: color_states,
				color_states_length: (uintptr_t)renderPipelineDescriptor->colorStates->length,
				depth_stencil_state: hx::IsNull(renderPipelineDescriptor->depthStencilState) ? nullptr : &depth_stencil_state,
				vertex_state: {
					index_format: (WGPUIndexFormat)renderPipelineDescriptor->vertexState->indexFormat,
					vertex_buffers: vertex_buffers,
					vertex_buffers_length: (uintptr_t)renderPipelineDescriptor->vertexState->vertexBuffers->length,
				},
				sample_count: (uint32_t)renderPipelineDescriptor->sampleCount,
				sample_mask: (uint32_t)renderPipelineDescriptor->sampleMask,
				alpha_to_coverage_enabled: renderPipelineDescriptor->alphaToCoverageEnabled,
			};

			wgpu::RenderPipeline renderPipeline = wgpu::RenderPipeline_obj::__alloc(HX_CTX);
			renderPipeline->native = wgpu_device_create_render_pipeline(native, &desc);

			for (unsigned int i = 0; i < renderPipelineDescriptor->vertexState->vertexBuffers->length; ++i) {
				free(attributes[i]);
			}

			free(attributes);
			free(vertex_buffers);
			free(color_states);
		');

		return untyped __cpp__('renderPipeline');
	}

	public function createShaderModule(data:ReadOnlyArray<Int>):ShaderModule {
		untyped __cpp__('
			uint32_t *native_data = (uint32_t*)malloc(sizeof(*native_data) * data->length);

			for (unsigned int i = 0; i < data->length; ++i) {
				native_data[i] = (uint32_t)data->__get(i);
			}

			WGPUShaderModuleDescriptor desc = {
				code: {
					bytes: native_data,
					length: (uintptr_t)data->length,
				}
			};

			wgpu::ShaderModule shaderModule = wgpu::ShaderModule_obj::__alloc(HX_CTX);
			shaderModule->native = wgpu_device_create_shader_module(native, &desc);

			free(native_data);
		');

		return untyped __cpp__('shaderModule');
	}

	public function createShaderModuleFromFile(path:String):ShaderModule {
		final rawData = File.getBytes(path);
		final data = new Array<Int>();

		for (i in 0...Std.int(rawData.length / 4)) {
			data.push(rawData.getInt32(i * 4));
		}

		return createShaderModule(data);
	}

	public function createSwapChain(surface:Surface, swapChainDescriptor:SwapChainDescriptor):SwapChain {
		untyped __cpp__('
			WGPUSwapChainDescriptor desc = {
				usage: (WGPUTextureUsage)swapChainDescriptor->usage,
				format: (WGPUTextureFormat)swapChainDescriptor->format,
				width: (uint32_t)swapChainDescriptor->width,
				height: (uint32_t)swapChainDescriptor->height,
				present_mode: (WGPUPresentMode)swapChainDescriptor->presentMode,
			};

			wgpu::SwapChain swapChain = wgpu::SwapChain_obj::__alloc(HX_CTX);
			swapChain->native = wgpu_device_create_swap_chain(native, surface->native, &desc);
		');

		return untyped __cpp__('swapChain');
	}

	public function getDefaultQueue():Queue {
		untyped __cpp__('
			wgpu::Queue queue = wgpu::Queue_obj::__alloc(HX_CTX);
			queue->native = wgpu_device_get_default_queue(native);
		');

		return untyped __cpp__('queue');
	}
}
