package wgpu;

import cpp.UInt32;
import cpp.Star;

/**
	A handle to a presentable surface.

	A `Surface` represents a platform-specific surface (e.g. a window) to which rendered images may be presented.
	A `Surface` may be created with `Surface.fromGLFW`.
**/
@:headerClassCode('
	WGPUSurfaceId native;
')
@:headerInclude('./wgpu.h')
class Surface {
	#if glfw
	/**
		Creates a surface from a raw window handle.
	**/
	public static function fromGLFW(nativeHandle:{
		windowsHWND:Star<cpp.Void>,
		macNSWindow:Star<cpp.Void>,
		linuxX11Display:Star<cpp.Void>,
		linuxX11Window:UInt32
	}):Surface {
		untyped __cpp__('
			wgpu::Surface surface = wgpu::Surface_obj::__alloc(HX_CTX);

			#ifdef GLFW_EXPOSE_NATIVE_WIN32
				HWND hwnd = (HWD)((cpp::Pointer<void>)nativeHandle->__Field(HX_("windowsHWND", 08, 81, 93, c4), hx::paccDynamic));
				HINSTANCE hinstance = GetModuleHandle(NULL);
				surface->native = wgpu_create_surface_from_windows_hwnd(hinstance, hwnd);
			#endif

			#ifdef GLFW_EXPOSE_NATIVE_COCOA
				id metal_layer = nullptr;
				NSWindow *ns_window = (NSWindow*)((cpp::Pointer<void>)nativeHandle->__Field(HX_("macNSWindow", a4, ff, 3b, be), hx::paccDynamic));
				[ns_window.contentView setWantsLayer:YES];
				metal_layer = [CAMetalLayer layer];
				[ns_window.contentView setLayer:metal_layer];
				surface->native = wgpu_create_surface_from_metal_layer(metal_layer);
			#endif

			#ifdef GLFW_EXPOSE_NATIVE_X11
				void *display = (void*)((cpp::Pointer<void>)nativeHandle->__Field(HX_("linuxX11Display", de, 5c, c5, 15), hx::paccDynamic));
				uint32_t window = (uint32_t)nativeHandle->__Field(HX_("linuxX11Window", d4, a8, 43, f8), hx::paccDynamic);
				surface->native = wgpu_create_surface_from_xlib((const void**)display, window);
			#endif
		');

		return untyped __cpp__('surface');
	}
	#end
}
