package wgpu;

enum abstract StencilOperation(UInt) {
	var Keep = 0;
	var Zero = 1;
	var Replace = 2;
	var Invert = 3;
	var IncrementClamp = 4;
	var DecrementClamp = 5;
	var IncrementWrap = 6;
	var DecrementWrap = 7;
}
