package wgpu;

enum abstract BufferUsage(Int) {
	var MapRead = 1;
	var MapWrite = 2;
	var CopySrc = 4;
	var CopyDst = 8;
	var Index = 16;
	var Vertex = 32;
	var Uniform = 64;
	var Storage = 128;
	var Indirect = 256;

	/** The combination of all read-only usages. **/
	var ReadAll = 501;

	/** The combination of all write-only and read-write usages. **/
	var WriteAll = 138;

	/**
		The combination of all usages that the are guaranteed to be be ordered by the hardware.
		If a usage is not ordered, then even if it doesn't change between draw calls,
		there still need to be pipeline barriers inserted for synchronization.
	**/
	var Ordered = 511;

	@:op(A & B) static function and(lhs:BufferUsage, rhs:BufferUsage):BufferUsage;

	@:op(A | B) static function or(lhs:BufferUsage, rhs:BufferUsage):BufferUsage;
}
