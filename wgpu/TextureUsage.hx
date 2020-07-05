package wgpu;

enum abstract TextureUsage(Int) {
	var CopySrc = 1;
	var CopyDst = 2;
	var Sampled = 4;
	var Storage = 8;
	var OutputAttachment = 16;

	/** The combination of all read-only usages. **/
	var ReadAll = 13;

	/** The combination of all write-only and read-write usages. **/
	var WriteAll = 28;

	/**
		The combination of all usages that the are guaranteed to be be ordered by the hardware.
		If a usage is not ordered, then even if it doesn't change between draw calls,
		there still need to be pipeline barriers inserted for synchronization.
	**/
	var Ordered = 31;
}
