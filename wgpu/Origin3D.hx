package wgpu;

@:structInit
class Origin3D {
	public static var ZERO(get, never):Origin3D;

	static function get_ZERO():Origin3D {
		return {
			x: 0,
			y: 0,
			z: 0,
		};
	}

	public var x:Int;
	public var y:Int;
	public var z:Int;
}
