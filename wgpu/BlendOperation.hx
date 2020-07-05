package wgpu;

enum abstract BlendOperation(Int) {
	var Add = 0;
	var Subtract = 1;
	var ReverseSubtract = 2;
	var Min = 3;
	var Max = 4;
}
