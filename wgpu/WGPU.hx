package wgpu;

@:headerInclude('./wgpu.h')
class WGPU {
	/** The version of wgpu-native used. **/
	public static var version(get, never):{major:Int, minor:Int, patch:Int};

	static function get_version():{major:Int, minor:Int, patch:Int} {
		untyped __cpp__('
			unsigned int version = wgpu_get_version();
			return Dynamic(hx::Anon_obj::Create(3)
				->setFixed(0, HX_("major", 39, bd, 1b, 03), version >> 16)
				->setFixed(1, HX_("minor", 35, 7b, 68, 08), (version >> 8) & 0xFF)
				->setFixed(2, HX_("patch", c8, 06, 57, bd), version & 0xFF)
			);
		');

		throw "unreachable";
	}
}
