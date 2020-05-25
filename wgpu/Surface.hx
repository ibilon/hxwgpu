package wgpu;

/**
	A handle to a presentable surface.

	A `Surface` represents a platform-specific surface (e.g. a window) to which rendered images may be presented.
	A `Surface` may be created with `Surface.fromGLFW`.
**/
@:headerClassCode('
	WGPUSurfaceId native;
')
@:headerInclude('./wgpu.h')
#if glfw
@:cppFileCode('
	#ifndef GLFW_EXPOSE_NATIVE_X11
	#define GLFW_EXPOSE_NATIVE_X11
	#endif
	#include <GLFW/glfw3.h>
	#include <GLFW/glfw3native.h>
')
#end
class Surface {
	#if glfw
	/**
		Creates a surface from a raw window handle.
	**/
	public static function fromGLFW(window:cpp.Star<cpp.Void>):Surface {
		untyped __cpp__('
			Display *x11_display = glfwGetX11Display();
			Window x11_window = glfwGetX11Window((GLFWwindow*)window);

			wgpu::Surface surface = wgpu::Surface_obj::__alloc(HX_CTX);
			surface->native = wgpu_create_surface_from_xlib((const void**)x11_display, x11_window);
			return surface;
		');

		return null;
	}
	#end
}
