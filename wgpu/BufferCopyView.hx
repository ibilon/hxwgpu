package wgpu;

/**
	A view of a buffer which can be used to copy to or from a texture.
**/
@:allow(wgpu)
@:structInit
class BufferCopyView {
	/** The buffer to be copied to or from. **/
	public var buffer:Buffer;

	/** The offset in bytes from the start of the buffer. **/
	public var offset:Int;

	/**
		The size in bytes of a single row of the texture.

		In the future this must be a multiple of 256 bytes, however the requirement is currently unimplemented.
	**/
	public var bytesPerRow:Int;

	/**
		The height in texels of the imaginary texture view overlaid on the buffer.

		Must be zero for copies where copy_size.depth == 1
	**/
	public var rowsPerImage:Int;

	/**
		[Internal]

		@throws UseAfterDestroyException If `buffer` was already destroyed.
	**/
	function validate():Void {
		buffer.validate();
	}
}
