package wgpu;

/**
	Options for requesting adapter.
**/
@:structInit
class RequestAdapterOptions {
	/** Power preference for the adapter. **/
	public var powerPreference:PowerPreference;

	/** Surface that is required to be presentable with the requested adapter, if any. **/
	@:optional public var compatibleSurface:Surface;
}
