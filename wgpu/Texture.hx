package wgpu;

import wgpu.errors.UseAfterDestroyException;

/**
	A handle to a texture on the GPU.
**/
@:allow(wgpu)
@:headerClassCode('
	WGPUTextureId native;
')
@:headerInclude('./wgpu.h')
class Texture {
	var destroyed = false;

	/**
		Creates a default view of this whole texture.

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	public function createDefaultView():TextureView {
		validate();

		untyped __cpp__('
			wgpu::TextureView textureView = wgpu::TextureView_obj::__alloc(HX_CTX);
			textureView->native = wgpu_texture_create_view(native, nullptr);
		');

		return untyped __cpp__('textureView');
	}

	/**
		Creates a view of this texture.

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	public function createView(textureViewDescriptor:TextureViewDescriptor):TextureView {
		validate();

		untyped __cpp__('
			WGPUTextureViewDescriptor desc = {
				label: hx::IsNull(textureViewDescriptor->label) ? nullptr : (const char*)textureViewDescriptor->label,
				format: (WGPUTextureFormat)textureViewDescriptor->format,
				dimension: (WGPUTextureViewDimension)textureViewDescriptor->dimension,
				aspect: (WGPUTextureAspect)textureViewDescriptor->aspect,
				base_mip_level: (uint32_t)textureViewDescriptor->baseMipLevel,
				level_count: (uint32_t)textureViewDescriptor->levelCount,
				base_array_layer: (uint32_t)textureViewDescriptor->baseArrayLayer,
				array_layer_count: (uint32_t)textureViewDescriptor->arrayLayerCount,
			};

			wgpu::TextureView textureView = wgpu::TextureView_obj::__alloc(HX_CTX);
			textureView->native = wgpu_texture_create_view(native, &desc);
		');

		return untyped __cpp__('textureView');
	}

	/**
		Destroy the texture.

		Using the instance after this will throw a `UseAfterDestroyException` exception.

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	public function destroy():Void {
		validate();
		untyped __cpp__('wgpu_texture_destroy(native)');
		destroyed = true;
	}

	/**
		[Internal]

		@throws UseAfterDestroyException If the instance was already destroyed.
	**/
	function validate():Void {
		if (destroyed) {
			throw new UseAfterDestroyException(this);
		}
	}
}
