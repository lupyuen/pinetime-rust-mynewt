# src: Rust Application Hosted On Mynewt

This is the Rust application that runs on top of Mynewt OS.  The application is compiled as a Rust library `libmyapp.rlib`, which is injected into the Mynewt build.  The application was ported from the C version at [`/apps/my_sensor_app`](/apps/my_sensor_app)

[`lib.rs`](lib.rs): Main library module. Contains `main()`, called by Mynewt at startup, and the panic handler. Imports the modules below via the `mod` directive. See [_Debug Rust+Mynewt Firmware for PineTime on Raspberry Pi_](https://medium.com/@ly.lee/debug-rust-mynewt-firmware-for-pinetime-on-raspberry-pi-4b9ac2d093a9?source=friends_link&sk=edb508c31e43d3ec40ecd8554f3405f6)

[`display.rs`](display.rs): Graphics display application. Renders some graphics and text using the `embedded-graphics` library. See [_Optimising PineTime’s Display Driver with Rust and Mynewt_](https://medium.com/@ly.lee/optimising-pinetimes-display-driver-with-rust-and-mynewt-3ba269ea2f5c?source=friends_link&sk=4d2cbd2e6cd2343eed62d214814f7b81)

[`touch_sensor.rs`](touch_sensor.rs): Touchscreen driver for PineTime. See [_Building a Rust Driver for PineTime’s Touch Controller_](https://medium.com/@ly.lee/building-a-rust-driver-for-pinetimes-touch-controller-cbc1a5d5d3e9?source=friends_link&sk=d8cf73fc943d9c0e960627d768f309cb)

[`ui.rs`](ui.rs): druid UI application. Shows a button that may be tapped to increment a counter. See [_Porting [druid] Rust Widgets to PineTime Smart Watch_](https://medium.com/@ly.lee/porting-druid-rust-widgets-to-pinetime-smart-watch-7e1d5a5d977a?source=friends_link&sk=09b153c68483f7fa9e63350efd167b07)

[`visual.rs`](visual.rs): Visual Rust application. See [_Visual Rust for PineTime Smart Watch_](https://marketplace.visualstudio.com/items?itemName=LeeLupYuen.visual-embedded-rust)

[`chip8.rs`](chip8.rs): CHIP-8 Emulator in Rust. See [_CHIP-8 Game Emulator in Rust for PineTime Smart Watch_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/chip8)

[`chip8.md`](chip8.md): Markdown source for the article [_CHIP-8 Game Emulator in Rust for PineTime Smart Watch_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/chip8)

[View Rust Documentation](https://lupyuen.github.io/pinetime-rust-mynewt/)

## Obsolete Files

[`app_sensor.rs`](app_sensor.rs): Calls the [Mynewt Sensor Framework API](https://mynewt.apache.org/latest/os/modules/sensor_framework/sensor_framework.html) to poll the [STM32 internal temperature sensor](/libs/temp_stm32), and register a Listener Function that will be called after each poll.

[`gps_sensor.rs`](gps_sensor.rs): Calls the [Mynewt Sensor Framework API](https://mynewt.apache.org/latest/os/modules/sensor_framework/sensor_framework.html) to poll the [Quectel L70-R GPS module](/libs/gps_l70r), and register a Listener Function that will be called after each poll.

[`app_network.rs`](app_network.rs): Aggregate and transmit sensor data to CoAP Server via Quectel BC95 NB-IoT module. Called by the Listener Function after each poll of the internal temperature sensor and GPS sensor.

## Related Files

[`../Cargo.toml`](../Cargo.toml): Rust Build Settings

[`/.cargo`](/.cargo): Rust Target Settings

[`piet-embedded/piet-embedded-graphics/src/display.rs`](https://github.com/lupyuen/piet-embedded/blob/master/piet-embedded-graphics/src/display.rs): Display driver for PineTime

[`piet-embedded/piet-embedded-graphics/src/batch.rs`](https://github.com/lupyuen/piet-embedded/blob/master/piet-embedded-graphics/src/batch.rs): Batching SPI display requests for PineTime

[`/rust/mynewt/src/spi.rs`](/rust/mynewt/src/spi.rs): Non-Blocking SPI driver for PineTime