package wgpu;

@:headerInclude('./wgpu.h')
class WGPU {
	/** The version of wgpu-native used. **/
	public static var version(get, never):{major:Int, minor:Int, patch:Int};

	static function get_version():{major:Int, minor:Int, patch:Int} {
		var version:Int = untyped __cpp__('wgpu_get_version()');

		return {
			major: version >> 16,
			minor: (version >> 8) & 0xFF,
			patch: version & 0xFF,
		};
	}
}
