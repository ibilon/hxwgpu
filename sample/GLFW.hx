import cpp.ConstCharStar;
import cpp.Star;

@:include("GLFW/glfw3native.h")
@:unreflective
@:native("Display")
extern class Display {}

@:include("GLFW/glfw3.h")
@:unreflective
@:native("GLFWwindow")
extern class GLFWwindow {}

@:include("GLFW/glfw3native.h")
@:unreflective
@:native("Window")
extern class Window {}

@:include("GLFW/glfw3.h")
@:include("GLFW/glfw3native.h")
@:buildXml('
<files id="haxe">
	<compilerflag value="-DGLFW_EXPOSE_NATIVE_X11" if="linux" />
</files>
<target id="haxe">
	<lib name="-lglfw" />
</target>
')
extern class GLFW {
	@:native("glfwInit") @:extern static function glfwInit():Bool;
	@:native("glfwCreateWindow") @:extern static function glfwCreateWindow(w:Int, h:Int, t:ConstCharStar, a:Int, b:Int):Star<GLFWwindow>;
	@:native("glfwWindowHint") @:extern static function glfwWindowHint(k:Int, v:Int):Void;
	@:native("glfwGetX11Display") @:extern static function glfwGetX11Display():Star<Display>;
	@:native("glfwGetX11Window") @:extern static function glfwGetX11Window(w:Star<GLFWwindow>):Window;
	@:native("glfwWindowShouldClose") @:extern static function glfwWindowShouldClose(w:Star<GLFWwindow>):Bool;
	@:native("glfwPollEvents") @:extern static function glfwPollEvents():Void;
	@:native("glfwDestroyWindow") @:extern static function glfwDestroyWindow(w:Star<GLFWwindow>):Void;
	@:native("glfwTerminate") @:extern static function glfwTerminate():Void;

	@:native("GLFW_CLIENT_API") @:extern static var GLFW_CLIENT_API:Int;
	@:native("GLFW_NO_API") @:extern static var GLFW_NO_API:Int;
}
