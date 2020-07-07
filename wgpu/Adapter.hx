package wgpu;

import wgpu.errors.UseAfterDestroyException;

// TODO static function enumerate and function getInfo aren't available in wgpu-native

/**
	A handle to a physical graphics and/or compute device.

	An `Adapter` can be used to open a connection to the corresponding device on the host system, yielding a `Device` object.
**/
@:build(wgpu.AdapterBuilder.build())
@:cppFileCode('
	#ifndef INCLUDED_wgpu_Extensions
	#include <wgpu/Extensions.h>
	#endif
	#ifndef INCLUDED_wgpu_Limits
	#include <wgpu/Limits.h>
	#endif
	#ifndef INCLUDED_wgpu_Surface
	#include <wgpu/Surface.h>
	#endif
')
@:cppNamespaceCode('
	static void request_adapter_callback(WGPUAdapterId received, void *userdata) {
		*(WGPUAdapterId*)userdata = received;
	}
')
@:headerClassCode('
	WGPUAdapterId native;
')
@:headerInclude('./wgpu.h')
class Adapter {
	var destroyed:Bool = false;

	/**
		Retrieves an `Adapter` which matches the given options.

		Some options are "soft", so treated as non-mandatory. Others are "hard".

		If no adapters are found that suffice all the "hard" options, None is returned.
	**/
	public function new(options:RequestAdapterOptions, backends:BackendBit) {
		// TODO what happens if no adapter match?
		untyped __cpp__('
			WGPURequestAdapterOptions desc = {
				power_preference: (WGPUPowerPreference)options->powerPreference,
				compatible_surface: hx::IsNull(options->compatibleSurface) ? 0 : options->compatibleSurface->native,
			};

			wgpu_request_adapter_async(&desc, backends, request_adapter_callback, (void*)&native);
		');

	}

	/**
		Destroy the adapter.

		Using the instance after this will throw a `UseAfterDestroyException` exception.

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	public function destroy():Void {
		validate();
		untyped __cpp__('wgpu_adapter_destroy(native)');
		destroyed = true;
	}

	/**
		Requests a connection to a physical device, creating a logical device.

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	public function requestDevice(deviceDescriptor:DeviceDescriptor):Device {
		validate();

		untyped __cpp__('
			WGPUDeviceDescriptor desc = {
				extensions: {
					anisotropic_filtering: deviceDescriptor->extensions->anisotropicFiltering,
				},
				limits: {
					max_bind_groups: (uint32_t)deviceDescriptor->limits->maxBindGroups,
				}
			};

			wgpu::Device device = wgpu::Device_obj::__alloc(HX_CTX);
			device->native = wgpu_adapter_request_device(native, &desc, nullptr);
		');

		return untyped __cpp__('device');
	}

	/**
		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	function validate():Void {
		if (destroyed) {
			throw new UseAfterDestroyException(this);
		}
	}
}
