package wgpu;

@:structInit
class BlendDescriptor {
	public static var REPLACE(get, never):BlendDescriptor;

	static function get_REPLACE():BlendDescriptor {
		return {
			srcFactor: One,
			dstFactor: Zero,
			operation: Add,
		};
	}

	public var srcFactor:BlendFactor;
	public var dstFactor:BlendFactor;
	public var operation:BlendOperation;

	public function usesColor():Bool {
		return switch ([srcFactor, dstFactor]) {
			case [BlendColor, _], [OneMinusBlendColor, _], [_, BlendColor], [_, OneMinusBlendColor]:
				true;
			default:
				false;
		}
	}
}
