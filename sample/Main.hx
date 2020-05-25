import GLFW.*;
import wgpu.*;

class Main {
	static function main() {
		if (!glfwInit()) {
			trace("Cannot initialize glfw");
			Sys.exit(1);
		}

		final WINDOW_WIDTH = 1280;
		final WINDOW_HEIGHT = 720;

		glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
		final window = glfwCreateWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "Test WGPU native from Haxe", 0, 0);

		if (window == null) {
			trace("Cannot create window");
			Sys.exit(1);
		}

		trace(WGPU.version);

		final surface = Surface.fromGLFW(cast window);

		final adapter = new Adapter({
			powerPreference: HighPerformance,
			compatibleSurface: surface,
		}, Primary);

		final device = adapter.requestDevice({
			extensions: {
				anisotropicFiltering: true,
			},
			limits: {
				maxBindGroups: Limits.MAX_BIND_GROUPS,
			}
		});

		final queue = device.getDefaultQueue();

		final swapChainDescriptor:SwapChainDescriptor = {
			usage: OutputAttachment,
			format: Bgra8UnormSrgb,
			width: WINDOW_WIDTH,
			height: WINDOW_HEIGHT,
			presentMode: Mailbox,
		};

		final swapChain = device.createSwapChain(surface, swapChainDescriptor);

		final vertices = [
			 0.5,  0.5,
			 0.5, -0.5,
			-0.5, -0.5,
			-0.5,  0.5,
		];

		final indices = [
			0, 3, 1,
			1, 3, 2,
		];

		final vertexBuffer = device.createBufferWithFloat32Data(vertices, Vertex);
		final indexBuffer = device.createBufferWithUInt16Data(indices, Index);

		final vertexShader = device.createShaderModuleFromFile("sample/res/triangle.vert.spv");
		final fragmentShader = device.createShaderModuleFromFile("sample/res/triangle.frag.spv");

		final renderPipelineLayout = device.createPipelineLayout({
			bindGroupLayouts: [],
		});

		final renderPipeline = device.createRenderPipeline({
			layout: renderPipelineLayout,
			vertexStage: {
				module: vertexShader,
				entryPoint: "main",
			},
			fragmentStage: {
				module: fragmentShader,
				entryPoint: "main",
			},
			rasterizationState: {
				frontFace: Ccw,
				cullMode: Back,
				depthBias: 0,
				depthBiasSlopeScale: 0.0,
				depthBiasClamp: 0.0,
			},
			primitiveTopology: TriangleList,
			colorStates: [
				{
					format: swapChainDescriptor.format,
					alphaBlend: BlendDescriptor.REPLACE,
					colorBlend: BlendDescriptor.REPLACE,
					writeMask: All,
				},
			],
			vertexState: {
				indexFormat: UInt16,
				vertexBuffers: [
					{
						stride: 4 * 2,
						stepMode: Vertex,
						attributes: [
							{
								offset: 0,
								format: Float2,
								shaderLocation: 0,
							},
						],
					},
				],
			},
			sampleCount: 1,
			sampleMask: ~0,
			alphaToCoverageEnabled: false,
		});

		while (!glfwWindowShouldClose(window)) {
			final outputTexture = swapChain.getNextTexture();

			if (outputTexture == null) {
				trace("Cannot acquire next swap chain texture");
				Sys.exit(1);
			}

			final commandEncoder = device.createCommandEncoder({
				label: null,
			});

			final renderPass = commandEncoder.beginRenderPass({
				colorAttachments: [
					{
						attachment: outputTexture.view,
						resolveTarget: null,
						loadOp: Clear,
						storeOp: Store,
						clearColor: {
							r: 0.0,
							g: 0.0,
							b: 0.0,
							a: 1.0,
						},
					},
				],
				depthStencilAttachment: null,
			});

			renderPass.setPipeline(renderPipeline);

			renderPass.setVertexBuffer(0, vertexBuffer, 0, 0);
			renderPass.setIndexBuffer(indexBuffer, 0, 0);
			renderPass.drawIndexed(0, indices.length, 0, 0, 1);

			renderPass.endPass();

			queue.submit([commandEncoder.finish()]);
			swapChain.present();

			glfwPollEvents();
		}

		glfwDestroyWindow(window);
		glfwTerminate();
	}
}
