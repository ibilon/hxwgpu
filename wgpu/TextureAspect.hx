package wgpu;

enum abstract TextureAspect(Int) {
	var All = 0;
	var StencilOnly = 1;
	var DepthOnly = 2;
}
