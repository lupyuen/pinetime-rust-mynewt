#!/usr/bin/env bash
#  Build application

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

if [ -e bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf ]; then
    rm bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
fi

cargo build -v

set +e
arm-none-eabi-readelf -a --wide target/thumbv7m-none-eabi/debug/libmylib.rlib >libmylib.elf
arm-none-eabi-objdump -t -S --demangle --line-numbers --wide target/thumbv7m-none-eabi/debug/libmylib.rlib >libmylib.S
set -e

if [ -e bin/targets/bluepill_my_sensor/app/libs/rust_app/libs_rust_app.a ]; then
    cp target/thumbv7m-none-eabi/debug/libmylib.rlib bin/targets/bluepill_my_sensor/app/libs/rust_app/libs_rust_app.a
    touch bin/targets/bluepill_my_sensor/app/libs/rust_app/libs_rust_app.a
fi

if [ -e bin/targets/bluepill_my_sensor/app/libs/rust_libcore/libs_rust_libcore.a ]; then
    cp libs/rust_libcore/src/libcore.rlib bin/targets/bluepill_my_sensor/app/libs/rust_libcore/libs_rust_libcore.a 
    touch bin/targets/bluepill_my_sensor/app/libs/rust_libcore/libs_rust_libcore.a 
fi

newt build -v -p bluepill_my_sensor
newt size -v bluepill_my_sensor

echo ✅ ◾ ️Done! 
