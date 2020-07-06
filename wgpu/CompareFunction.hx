package wgpu;

enum abstract CompareFunction(Int) {
	var Undefined = 0;
	var Never = 1;
	var Less = 2;
	var Equal = 3;
	var LessEqual = 4;
	var Greater = 5;
	var NotEqual = 6;
	var GreaterEqual = 7;
	var Always = 8;

	public function isTrivial():Bool {
		return (cast this) == Never || (cast this) == Always;
	}
}
