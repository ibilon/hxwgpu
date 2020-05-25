package wgpu;

@:headerInclude('./wgpu.h')
@:structInit
class Limits {
	public static var MAX_BIND_GROUPS(get, never):UInt;

	static function get_MAX_BIND_GROUPS():UInt {
		return untyped __cpp__("WGPUMAX_BIND_GROUPS");
	}

	public var maxBindGroups:UInt;
}
