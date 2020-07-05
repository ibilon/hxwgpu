package wgpu;

enum BindingType {
	UniformBuffer(isDynamic:Bool);
	StorageBuffer(isDynamic:Bool, readOnly:Bool);
	Sampler(comparison:Bool);
	SampledTexture(dimension:TextureViewDimension, componentType:TextureComponentType, multisampled:Bool);
	StorageTexture(dimension:TextureViewDimension, componentType:TextureComponentType, format:TextureFormat, readOnly:Bool);
}
