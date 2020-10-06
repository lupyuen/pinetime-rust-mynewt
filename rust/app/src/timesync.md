# Bluetooth Time Sync, Rust Watch Faces and LVGL on PineTime Mynewt

![PineTime Smart Watch with Bluetooth Time Sync and Rust Watch Face](https://lupyuen.github.io/images/timesync-title.png)

Let's learn how PineTime syncs the time over Bluetooth LE... And how we build PineTime Watch Faces with Rust and LVGL.

# Time Sync over Bluetooth LE

TODO: Bluetooth LE Current Time Service, Discovering Bluetooth LE Services and Characteristics, Reading Bluetooth LE Characteristics, Decoding Bluetooth LE Current Time

[`apps/my_sensor_app/src/ble_main.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_main.c)

[`apps/my_sensor_app/src/ble_peer.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/ble_peer.c)

# Get the Time in C

TODO: os_timeval, clocktime and ISO format, [`my_sensor_app/src/watch_face.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/watch_face.c)

# Get the Time in Rust

TODO: WatchFaceTime, [`rust/app/src/watch_face.rs`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/watch_face.rs)

# Watch Face in C

TODO: Mynewt timer, [`my_sensor_app/src/watch_face.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/src/watch_face.c)

# Watch Face in Rust

TODO: Barebones watch face, LVGL styles, [`rust/app/src/watch_face.rs`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/watch_face.rs)

# Porting LVGL to Mynewt

TODO: SPI Driver for ST7789 Display Controller, [`pinetime_lvgl_mynewt`](https://gitlab.com/lupyuen/pinetime_lvgl_mynewt)

# Rust Wrapper for LVGL

TODO: Bindgen, Safe Wrapper Proc Macro, [`rust/lvgl`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/lvgl)

# What's Next

TODO: Bluetooth Time Sync, Rust Watch Faces and LVGL were developed and tested with Remote PineTime

[Check out my PineTime articles](https://lupyuen.github.io)

[RSS Feed](https://lupyuen.github.io/rss.xml)