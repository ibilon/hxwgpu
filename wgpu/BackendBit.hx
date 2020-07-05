package wgpu;

enum abstract BackendBit(Int) {
	var Vulkan = 2;
	var Metal = 4;
	var DX12 = 8;
	var DX11 = 16;
	var GL = 32;
	var BrowserWebGPU = 64;

	/** Vulkan, Metal, DX12, BrowserWebGPU */
	var Primary = 78;

	/** DX11, GL **/
	var Secondary = 48;

	/** Primary, Secondary */
	var All = 126;
}
