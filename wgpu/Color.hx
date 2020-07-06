package wgpu;

@:structInit
class Color {
	public static var TRANSPARENT(get, never):Color;
	public static var BLACK(get, never):Color;
	public static var WHITE(get, never):Color;
	public static var RED(get, never):Color;
	public static var GREEN(get, never):Color;
	public static var BLUE(get, never):Color;

	static function get_TRANSPARENT():Color {
		return {
			r: 0.0,
			g: 0.0,
			b: 0.0,
			a: 0.0,
		};
	}

	static function get_BLACK():Color {
		return {
			r: 0.0,
			g: 0.0,
			b: 0.0,
			a: 1.0,
		};
	}

	static function get_WHITE():Color {
		return {
			r: 1.0,
			g: 1.0,
			b: 1.0,
			a: 1.0,
		};
	}

	static function get_RED():Color {
		return {
			r: 1.0,
			g: 0.0,
			b: 0.0,
			a: 1.0,
		};
	}

	static function get_GREEN():Color {
		return {
			r: 0.0,
			g: 1.0,
			b: 0.0,
			a: 1.0,
		};
	}

	static function get_BLUE():Color {
		return {
			r: 0.0,
			g: 0.0,
			b: 1.0,
			a: 1.0,
		};
	}

	public var r:Float;
	public var g:Float;
	public var b:Float;
	public var a:Float;
}
