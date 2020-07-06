package wgpu;

/**
	A handle to a sampler.

	A Sampler object defines how a pipeline will sample from a `TextureView`.

	Samplers define image filters (including anisotropy) and address (wrapping) modes, among other things.

	See the documentation for `SamplerDescriptor` for more information.
**/
@:headerClassCode('
	WGPUSamplerId native;
')
@:headerInclude('./wgpu.h')
class Sampler {}
