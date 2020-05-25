package wgpu;

enum abstract BlendFactor(UInt) {
	var Zero = 0;
	var One = 1;
	var SrcColor = 2;
	var OneMinusSrcColor = 3;
	var SrcAlpha = 4;
	var OneMinusSrcAlpha = 5;
	var DstColor = 6;
	var OneMinusDstColor = 7;
	var DstAlpha = 8;
	var OneMinusDstAlpha = 9;
	var SrcAlphaSaturated = 10;
	var BlendColor = 11;
	var OneMinusBlendColor = 12;
}
