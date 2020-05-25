package wgpu;

enum abstract PrimitiveTopology(UInt) {
	var PointList = 0;
	var LineList = 1;
	var LineStrip = 2;
	var TriangleList = 3;
	var TriangleStrip = 4;
}
