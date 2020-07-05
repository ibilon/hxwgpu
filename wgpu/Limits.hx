package wgpu;

@:headerInclude('./wgpu.h')
@:structInit
class Limits {
	public static var MAX_BIND_GROUPS(get, never):Int;

	static function get_MAX_BIND_GROUPS():Int {
		return untyped __cpp__("WGPUMAX_BIND_GROUPS");
	}

	public var maxBindGroups:Int;
}
