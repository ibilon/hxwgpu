package wgpu;

enum abstract PowerPreference(UInt) {
	var Default = 0;
	var LowPower = 1;
	var HighPerformance = 2;
}
