#!/usr/bin/env bash
#  Build application

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

if [ -e bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf ]; then
    rm bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
fi

cargo build -v

#  Copy Rust app.
if [ -e bin/targets/bluepill_my_sensor/app/libs/rust_app/libs_rust_app.a ]; then
    cp target/thumbv7m-none-eabi/debug/libmylib.rlib bin/targets/bluepill_my_sensor/app/libs/rust_app/libs_rust_app.a
    touch bin/targets/bluepill_my_sensor/app/libs/rust_app/libs_rust_app.a
fi

#  Copy Rust libcore.
if [ -e bin/targets/bluepill_my_sensor/app/libs/rust_libcore/libs_rust_libcore.a ]; then

    if [ -e $HOME/.rustup/toolchains/nightly-2019-05-22-x86_64-apple-darwin/lib/rustlib/thumbv7m-none-eabi/lib/libcore-e6b0ad9835323d10.rlib ]; then
        cp $HOME/.rustup/toolchains/nightly-2019-05-22-x86_64-apple-darwin/lib/rustlib/thumbv7m-none-eabi/lib/libcore-e6b0ad9835323d10.rlib bin/targets/bluepill_my_sensor/app/libs/rust_libcore/libs_rust_libcore.a 
    fi

    # ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/thumbv7m-none-eabi/lib

    touch bin/targets/bluepill_my_sensor/app/libs/rust_libcore/libs_rust_libcore.a 
fi

set +e
arm-none-eabi-readelf -a --wide target/thumbv7m-none-eabi/debug/libmylib.rlib >libmylib.elf 2>&1
arm-none-eabi-objdump -t -S            --line-numbers --wide target/thumbv7m-none-eabi/debug/libmylib.rlib >libmylib.S 2>&1
arm-none-eabi-objdump -t -S --demangle --line-numbers --wide target/thumbv7m-none-eabi/debug/libmylib.rlib >libmylib-demangle.S 2>&1
set -e

#newt build -v -p bluepill_my_sensor
newt build bluepill_my_sensor
newt size -v bluepill_my_sensor

echo ✅ ◾ ️Done! 
