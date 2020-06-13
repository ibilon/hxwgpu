# (WIP) hxwgpu

![Build Status](https://github.com/ibilon/hxwgpu/workflows/Main/badge.svg)

API Documentation: <https://ibilon.github.io/hxwgpu/>

hxwgpu is a work in progress haxe/hxcpp wrapper around wgpu-native, allowing the use of the WebGPU API on desktop.

The library is null safe and compatible cppia, see `cppia_host.hxml` and the samples on how to use cppia.

Currently only tested on linux with X11.

Plans:

* Complete the API
* Test support with GLFW on windows and mac

## Building

hxwgpu requires building wgpu-native, which needs a working rust installation, see <https://github.com/gfx-rs/wgpu/wiki/Getting-Started#prerequisites> for more details on the requirements.

## Usage

Make sure to clone this repository with `--recursive`, or download the submodule with `git submodule update --init`.

The library follows the API from [wgpu-rs](https://github.com/gfx-rs/wgpu-rs/) with a couple exceptions:

* Functions and members use camelCase instead of snake_case
* `Adapter::request` is replaced with `new Adapter`
* `AdapterInfo` is not available
* `device.createBufferWithData` is replaced with `device.createBufferWithFloat32Data` and `device.createBufferWithUInt16Data`
* `Surface::create` is replaced with `Surface.fromGLFW` supporting the [hxglfw](https://github.com/ibilon/hxglfw) library

Samples are available at <https://github.com/ibilon/hxwgpu-samples/>.

## License

This library is [MIT licensed](https://github.com/ibilon/hxwgpu/blob/LICENSE.md),
wgpu-native is [MPL-2.0 licensed](https://github.com/gfx-rs/wgpu-native/blob/29c9b0942dc01159aa999c53396e79f48a3a2094/LICENSE)
and has [several dependencies](https://github.com/gfx-rs/wgpu-native/blob/29c9b0942dc01159aa999c53396e79f48a3a2094/Cargo.toml).
