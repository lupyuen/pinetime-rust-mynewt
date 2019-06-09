# src: Rust Application Hosted On Mynewt

This Rust application polls the internal temperature sensor every 10 seconds and displays the results.

The application is compiled as a Rust library `libmylib.rlib`, which is injected into the Mynewt build.
