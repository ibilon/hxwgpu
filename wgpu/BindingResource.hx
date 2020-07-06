package wgpu;

/**
	A resource that can be bound to a pipeline.
**/
enum BindingResource {
	Buffer(buffer:Buffer, start:Int, end:Int);
	Sampler(sampler:Sampler);
	TextureView(textureView:TextureView);
}
