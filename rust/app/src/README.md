# src: Rust Application Hosted On Mynewt

This is the Rust application that runs on top of Mynewt OS.  The application is compiled as a Rust library `libmyapp.rlib`, which is injected into the Mynewt build.  The application was ported from the C version at [`/apps/my_sensor_app`](/apps/my_sensor_app)

[`lib.rs`](lib.rs): Main library module. Contains `main()`, called by Mynewt at startup, and the panic handler. Imports the modules below via the `mod` directive.

[`display.rs`](display.rs): Graphics display application. Renders some graphics and text using the `embedded-graphics` library.

[`ui.rs`](ui.rs): druid UI application. Shows a button that may be tapped to increment a counter.

[`app_sensor.rs`](app_sensor.rs): Calls the [Mynewt Sensor Framework API](https://mynewt.apache.org/latest/os/modules/sensor_framework/sensor_framework.html) to poll the [STM32 internal temperature sensor](/libs/temp_stm32), and register a Listener Function that will be called after each poll.

[`gps_sensor.rs`](gps_sensor.rs): Calls the [Mynewt Sensor Framework API](https://mynewt.apache.org/latest/os/modules/sensor_framework/sensor_framework.html) to poll the [Quectel L70-R GPS module](/libs/gps_l70r), and register a Listener Function that will be called after each poll.

[`app_network.rs`](app_network.rs): Aggregate and transmit sensor data to CoAP Server via Quectel BC95 NB-IoT module. Called by the Listener Function after each poll of the internal temperature sensor and GPS sensor.

[View Rust Documentation](https://lupyuen.github.io/stm32bluepill-mynewt-sensor/rust/mylib/)

## Related Files

[`/Cargo.toml`](/Cargo.toml): Rust Build Settings

[`/.cargo`](/.cargo): Rust Target Settings
