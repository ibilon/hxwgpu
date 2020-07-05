package wgpu;

enum abstract ColorWrite(Int) {
	var Red = 1;
	var Green = 2;
	var Blue = 4;
	var Alpha = 8;
	var Color = 7;
	var All = 15;
}
