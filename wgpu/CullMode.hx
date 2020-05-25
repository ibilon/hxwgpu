package wgpu;

enum abstract CullMode(UInt) {
	var None = 0;
	var Front = 1;
	var Back = 2;
}
