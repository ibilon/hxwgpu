package wgpu;

enum abstract PresentMode(UInt) {
	/**
		The presentation engine does **not** wait for a vertical blanking period and the request is presented immediately.
		This is a low-latency presentation mode, but visible tearing may be observed.
		Will fallback to `Fifo` if unavailable on the selected platform and backend.
		Not optimal for mobile.
	**/
	var Immediate = 0;

	/**
		The presentation engine waits for the next vertical blanking period to update the current image, but frames may be submitted without delay.
		This is a low-latency presentation mode and visible tearing will **not** be observed.
		Will fallback to `Fifo` if unavailable on the selected platform and backend.
		Not optimal for mobile.
	**/
	var Mailbox = 1;

	/**
		The presentation engine waits for the next vertical blanking period to update the current image.
		The framerate will be capped at the display refresh rate, corresponding to the VSync.
		Tearing cannot be observed. Optimal for mobile.
	**/
	var Fifo = 2;
}
