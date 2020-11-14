# LVGLSwiftDemo

A proof-of-concept Swift SPM package / application utilising LVGL, the Lightweight & Versatile Graphics Library.

This relies on the CLVGLSwift wrapper library, which imports the following C libraries:

- [PureSwift/SDL](https://github.com/PureSwift/SDL): a Swift wrapper for [SDL2](https://www.libsdl.org), Simple DirectMedia Layer
- [lvgl/lvgl](http://github.com/lvgl/lvgl): [Lightweight & Versatile Graphics Library](https://lvgl.io)
- [mr-j-tree/lv_drivers](https://github.com/mr-j-tree/lv_drivers): A slightly tweaked version of [lvgl/lv_drivers](https://github.com/lvgl/lv_drivers) to accomodate differnet folder structure requirements of the Swift Package Manager)

LVGLSwiftDemo has only been tested on macOS. It requires Swift 5.3.
