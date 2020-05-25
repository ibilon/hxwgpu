package wgpu;

enum abstract VertexFormat(UInt) {
	var Uchar2 = 0;
	var Uchar4 = 1;
	var Char2 = 2;
	var Char4 = 3;
	var Uchar2Norm = 4;
	var Uchar4Norm = 5;
	var Char2Norm = 6;
	var Char4Norm = 7;
	var Ushort2 = 8;
	var Ushort4 = 9;
	var Short2 = 10;
	var Short4 = 11;
	var Ushort2Norm = 12;
	var Ushort4Norm = 13;
	var Short2Norm = 14;
	var Short4Norm = 15;
	var Half2 = 16;
	var Half4 = 17;
	var Float = 18;
	var Float2 = 19;
	var Float3 = 20;
	var Float4 = 21;
	var Uint = 22;
	var Uint2 = 23;
	var Uint3 = 24;
	var Uint4 = 25;
	var Int = 26;
	var Int2 = 27;
	var Int3 = 28;
	var Int4 = 29;
}
