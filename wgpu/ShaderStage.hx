package wgpu;

enum abstract ShaderStage(Int) {
	var None = 0;
	var Vertex = 1;
	var Fragment = 2;
	var Compute = 4;

	@:op(A & B) static function and(lhs:ShaderStage, rhs:ShaderStage):ShaderStage;

	@:op(A | B) static function or(lhs:ShaderStage, rhs:ShaderStage):ShaderStage;
}
