# src: Rust Application Hosted On Mynewt

This Rust application polls the internal temperature sensor every 10 seconds and displays the results.

The application is compiled as a Rust library `libmylib.rlib`, which is injected into the Mynewt build.

The application was ported from the C version at [`/apps/my_sensor_app`](/apps/my_sensor_app)

[`lib.rs`](lib.rs): Main library module. Contains `main()`, called by Mynewt at startup, and the panic handler. Imports the modules below via the `mod` directive.

[`base.rs`](base.rs): Common declarations

[`sensor.rs`](sensor.rs): Imports the [Mynewt Sensor Framework API](https://mynewt.apache.org/latest/os/modules/sensor_framework/sensor_framework.html). Contains custom sensor declarations.

[`listen_sensor.rs`](listen_sensor.rs): Calls the [Mynewt Sensor Framework API](https://mynewt.apache.org/latest/os/modules/sensor_framework/sensor_framework.html) to poll the [Blue Pill internal temperature sensor](/libs/temp_stm32) every 10 seconds, and register a Listener Function that will be called after each poll.

[`send_coap.rs`](send_coap.rs): Called by the Listener Function after each poll of the internal temperature sensor.

[View Rust Documentation](https://lupyuen.github.io/stm32bluepill-mynewt-sensor/rust/mylib/)

## Related Files

[`/Cargo.toml`](/Cargo.toml): Rust Build Settings

[`/.cargo`](/.cargo): Rust Target Settings
