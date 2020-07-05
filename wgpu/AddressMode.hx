package wgpu;

enum abstract AddressMode(Int) {
	var ClampToEdge = 0;
	var Repeat = 1;
	var MirrorRepeat = 2;
}
