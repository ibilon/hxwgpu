package wgpu;

enum abstract PrimitiveTopology(Int) {
	var PointList = 0;
	var LineList = 1;
	var LineStrip = 2;
	var TriangleList = 3;
	var TriangleStrip = 4;
}
