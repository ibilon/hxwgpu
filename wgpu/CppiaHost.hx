package wgpu;

@:dox(hide)
@:noCompletion
class CppiaHost {
	static function main() {
		cpp.cppia.Host.runFile(Sys.args()[0]);
	}
}
