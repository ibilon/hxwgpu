package wgpu;

/**
	This is passed to `Device.poll` to control whether it should block or not.
**/
enum abstract Maintain(Int) {
	var Wait = 0;
	var Poll = 1;
}
