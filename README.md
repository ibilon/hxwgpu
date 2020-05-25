# (WIP) hxwgpu

![Build Status](https://github.com/ibilon/hxwgpu/workflows/Main/badge.svg)

API Documentation: <https://ibilon.github.io/hxwgpu/>

hxwgpu is a work in progress Haxe/hxcpp wrapper around wgpu-native, allowing the use of the WebGPU API on desktop.

Currently only tested on linux with X11.

Plans:

* Complete the API
* Build a cppia host
* Make the library null safe
* Support GLFW on windows and mac
* Add support for the js target using the web browser's WebGPU API

## Building

hxwgpu requires building wgpu-native, which needs a working rust installation, see <https://github.com/gfx-rs/wgpu/wiki/Getting-Started#prerequisites> for more details on the requirements.

Alternatively it's possible to use a prebuilt binary:

* Download the binary from https://github.com/Korijn/wgpu-bin/releases corresponding to the correct version for the submodule
* Copy the library to the `build` folder
* Create (or modify) a `build/hash.txt` file containing the hash from the current commit of the wgpu-native submodule

## Usage

Make sure to clone this repository with `--recursive`, or download the submodule with `git submodule update --init`.

The library follows the API from [wgpu-rs](https://github.com/gfx-rs/wgpu-rs/) with a couple exceptions:

* Functions and members use camelCase instead of snake_case
* `Adapter::request` is replaced with `new Adapter`
* `AdapterInfo` is not available
* `device.createBufferWithData` is replaced with `device.createBufferWithFloat32Data` and `device.createBufferWithUInt16Data`
* `Surface::create` is replaced with `Surface.fromGLFW`

A small example is available in `sample/`, it requires the glfw3 library to be installed.

* Compile it with `haxe sample/build.hxml`
* Compile the shaders with
  * `glslangValidator -V -S frag -o sample/res/triangle.frag.spv sample/res/triangle.frag.glsl`
  * `glslangValidator -V -S vert -o sample/res/triangle.vert.spv sample/res/triangle.vert.glsl`
* Run it with `sample/build/Main-debug`

## License

This library is [MIT licensed](https://github.com/ibilon/hxwgpu/blob/LICENSE.md),
wgpu-native is [MPL-2.0 licensed](https://github.com/gfx-rs/wgpu-native/blob/29c9b0942dc01159aa999c53396e79f48a3a2094/LICENSE)
and has [several dependencies](https://github.com/gfx-rs/wgpu-native/blob/29c9b0942dc01159aa999c53396e79f48a3a2094/Cargo.toml).
