package wgpu;

@:structInit
class ColorStateDescriptor {
	public var format:TextureFormat;
	public var alphaBlend:BlendDescriptor;
	public var colorBlend:BlendDescriptor;
	public var writeMask:ColorWrite;
}
