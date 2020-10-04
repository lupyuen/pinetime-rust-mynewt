#!/usr/bin/env bash
#  macOS and Linux Bash script to build Rust application hosted on Mynewt OS

set -e  #  Exit when any command fails

set -x  #  Echo commands
mynewt_build_app=nrf52_my_sensor
rust_build_target=thumbv7em-none-eabihf
launch_config=launch-nrf52-pi.json

#  TODO: On macOS and x64 Linux: launch_config=launch-nrf52.json
set +x  #  Stop echo
echo ; echo "----- Building Rust app and Mynewt OS for $rust_build_target / $mynewt_build_app..." 

#  Rust build profile: debug or release
rust_build_profile=debug
#  rust_build_profile=release

#  Add toolchain to PATH.
#  export PATH="$PWD/xPacks/riscv-none-embed-gcc/8.2.0-3.1/bin:$PATH"

#  Location of the compiled ROM image.  We will remove this to force relinking the Rust app with Mynewt OS.
app_build=$PWD/bin/targets/$mynewt_build_app/app/apps/my_sensor_app/my_sensor_app.elf

#  Location of the compiled Rust app and external libraries.  The Rust compiler generates a *.rlib archive for the Rust app and each external Rust library here.
rust_build_dir=$PWD/target/$rust_build_target/$rust_build_profile

#  Location of the libs/rust_app stub library built by Mynewt.  We will replace this stub by the Rust app and external libraries.
rust_app_dir=$PWD/bin/targets/$mynewt_build_app/app/libs/rust_app
rust_app_dest=$rust_app_dir/libs_rust_app.a

#  Location of the libs/rust_libcore stub library built by Mynewt.  We will replace this stub by the Rust core library libcore.
rust_libcore_dir=$PWD/bin/targets/$mynewt_build_app/app/libs/rust_libcore
rust_libcore_dest=$rust_libcore_dir/libs_rust_libcore.a

#  Rust build options
rust_build_options="--target $rust_build_target"
if [ "$rust_build_profile" == 'release' ]; then
    # Build for release
    rust_build_options="--release $rust_build_options"
#  else 
    # Build for debug: No change in options
fi

#  Set build commands for the architecture
if [ "$rust_build_target" == 'riscv32imac-unknown-none-elf' ]; then
    # RISC-V build commands
    ar_cmd=riscv-none-embed-ar
    readelf_cmd=riscv-none-embed-readelf
    objdump_cmd=riscv-none-embed-objdump
else 
    # Arm build commands
    ar_cmd=arm-none-eabi-ar
    readelf_cmd=arm-none-eabi-readelf
    objdump_cmd=arm-none-eabi-objdump
fi

#  Copy debugger launch config
cp .vscode/$launch_config .vscode/launch.json

#  If this is the very first build, do the Mynewt build to generate the rust_app and rust_libcore stubs.  This build will not link successfully but it's OK.
if [ ! -e $rust_app_dest ]; then
    echo ; echo "----- Build Mynewt stubs for Rust app and Rust libcore (ignore error)"
    set +e
    set -x
    newt build $mynewt_build_app
    set +x
    set -e
fi

#  Delete the compiled ROM image to force the Mynewt build to relink the Rust app with Mynewt OS.
if [ -e $app_build ]; then
    rm $app_build
fi

#  Delete the compiled Rust app to force the Rust build to relink the Rust app.  Sometimes there are multiple copies of the compiled app, this deletes all copies.
rust_app_build=$rust_build_dir/libapp.a
for f in $rust_app_build
do
    if [ -e $f ]; then
        rm $f
    fi
done

#  Expand Rust macros for troubleshooting: logs/libmynewt-expanded.rs and libapp-expanded.rs
set +e  # Ignore errors
# pushd rust/mynewt ; cargo rustc $rust_build_options -- -Z unstable-options --pretty expanded > ../../logs/libmynewt-expanded.rs ; popd
# pushd rust/app    ; cargo rustc $rust_build_options -- -Z unstable-options --pretty expanded > ../../logs/libapp-expanded.rs    ; popd
set -e  # Stop on errors

#  Build the Rust app in "src" folder.
echo ; echo "----- Build Rust app" 
set -x
cargo build $rust_build_options
set +x

#  Export the metadata for the Rust build.
cargo metadata --format-version 1 >logs/libapp.json

#  Create rustlib, the library that contains the compiled Rust app and its dependencies (except libcore).  Create in temp folder named "tmprustlib"
echo ; echo "----- Consolidate Rust app and crates"
if [ -d tmprustlib ]; then
    rm -r tmprustlib
fi
if [ ! -d tmprustlib ]; then
    mkdir tmprustlib
fi
pushd tmprustlib >/dev/null

#  Extract the object (*.o) files in the compiled Rust output.
rust_build=$rust_build_dir/libapp.a
for f in $rust_build
do
    if [ -e $f ]; then
        #  echo "$ar_cmd x $f"
        $ar_cmd x $f >/dev/null 2>&1
    fi
done

#  Archive the object (*.o) files into rustlib.a.
#  echo "$ar_cmd r rustlib.a *.o"
$ar_cmd r rustlib.a *.o >/dev/null 2>&1

#  Overwrite libs_rust_app.a in the Mynewt build by rustlib.a.  libs_rust_app.a was originally created from libs/rust_app.
if [ ! -d $rust_app_dir ]; then
    mkdir -p $rust_app_dir
fi
set -x
cp $PWD/rustlib.a $rust_app_dest
set +x

#  Update the timestamp on libs_rust_app.a so that Mynewt build won't overwrite the Rust app we have copied.
$ar_cmd s $rust_app_dest

#  Dump the ELF and disassembly for the compiled Rust application and libraries (except libcore)
#  $objdump_cmd -t -S            --line-numbers --wide rustlib.a >../logs/rustlib.S 2>&1
#  $objdump_cmd -t -S --demangle --line-numbers --wide rustlib.a >../logs/rustlib-demangle.S 2>&1

#  Return to the parent directory.
popd >/dev/null

#  Copy Rust libcore to libs_rust_libcore.a, which is originally generated by libs/rust_libcore.
echo ; echo "----- Copy Rust libcore" 
#  Get the Rust compiler sysroot e.g. /Users/Luppy/.rustup/toolchains/nightly-2019-05-22-x86_64-apple-darwin
rust_sysroot=`rustc --print sysroot --target $rust_build_target`
#  Get the libcore file in the sysroot.
rust_libcore_src=$rust_sysroot/lib/rustlib/$rust_build_target/lib/libcore-*.rlib
#  Copy libcore to the Mynewt build folder.
if [ ! -d $rust_libcore_dir ]; then
    mkdir -p $rust_libcore_dir
fi
if [ -e $rust_libcore_dest ]; then
    rm $rust_libcore_dest
fi
for f in $rust_libcore_src
do
    set -x
    cp $f $rust_libcore_dest
    set +x
done

#  Update the timestamp on libs_rust_libcore.a so that Mynewt build won't overwrite the Rust libcore we have copied.
$ar_cmd s $rust_libcore_dest

#  Dump the ELF and disassembly for the compiled Rust application.
#  set +e
#  $readelf_cmd -a --wide target/$rust_build_target/$rust_build_profile/libapp.rlib >logs/libapp.elf 2>&1
#  $objdump_cmd -t -S            --line-numbers --wide target/$rust_build_target/$rust_build_profile/libapp.rlib >logs/libapp.S 2>&1
#  $objdump_cmd -t -S --demangle --line-numbers --wide target/$rust_build_target/$rust_build_profile/libapp.rlib >logs/libapp-demangle.S 2>&1
#  set -e

#  Run the Mynewt build, which will link with the Rust app, Rust libraries and libcore.
#  For verbose build: newt build -v -p $mynewt_build_app
echo ; echo "----- Build Mynewt and link with Rust app" 
set -x
newt build $mynewt_build_app

#  Display the image size.
newt size -v $mynewt_build_app
set +x

#  Create the image
scripts/nrf52/image-app.sh

#  Copy the disassembly and linker map to the logs folder.
cp bin/targets/$mynewt_build_app/app/apps/my_sensor_app/my_sensor_app.elf.lst logs
cp bin/targets/$mynewt_build_app/app/apps/my_sensor_app/my_sensor_app.elf.map logs

#  Typical Mynewt build options:
#  arm-none-eabi-gcc -DAPP_NAME=my_sensor_app -DAPP_my_sensor_app -DARCH_NAME=cortex_m4 -DARCH_cortex_m4 
#  -DBSP_NAME=stm32l4 -DBSP_stm32l4 -DFLOAT_SUPPORT -DHAL_ADC_MODULE_ENABLED -DMYNEWT=1 -DSECURE=0 
#  -DSTM32L476xx 
#  -Irepos/apache-mynewt-core/net/oic/include/oic -Irepos/apache-mynewt-core/net/oic/src/port/mynewt 
#  -Og -Wall -Werror -fdata-sections -ffunction-sections -fno-exceptions 
#  -ggdb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -mthumb-interwork -std=c99 
#  -Iapps/my_sensor_app/include -Iapps/my_sensor_app/include/my_sensor_app/arch/cortex_m4 
#  -Iapps/my_sensor_app/src -Iapps/my_sensor_app/src/arch/cortex_m4 
#  -Ibin/targets/stm32l4_my_sensor/generated/include -Ihw/bsp/stm32l4/include -Ihw/bsp/stm32l4/include/bsp 
#  -Ihw/bsp/stm32l4/include/stm32l4/arch/cortex_m4 -Ihw/bsp/stm32l4/src -Ihw/bsp/stm32l4/src/arch/cortex_m4 
#  -Ilibs/adc_stm32l4/include -Ilibs/adc_stm32l4/include/adc_stm32l4/arch/cortex_m4 
#  -Ilibs/buffered_serial/include -Ilibs/buffered_serial/include/buffered_serial/arch/cortex_m4 
#  -Ilibs/custom_sensor/include -Ilibs/custom_sensor/include/custom_sensor/arch/cortex_m4 
#  -Ilibs/gps_l70r/include -Ilibs/gps_l70r/include/gps_l70r/arch/cortex_m4 -Ilibs/mynewt_rust/include 
#  -Ilibs/mynewt_rust/include/mynewt_rust/arch/cortex_m4 -Ilibs/rust_app/include 
#  -Ilibs/rust_app/include/rust_app/arch/cortex_m4 -Ilibs/rust_libcore/include 
#  -Ilibs/rust_libcore/include/rust_libcore/arch/cortex_m4 -Ilibs/semihosting_console/include -Ilibs/semihosting_console/include/semihosting_console/arch/cortex_m4 -Ilibs/sensor_coap/include -Ilibs/sensor_coap/include/sensor_coap/arch/cortex_m4 -Ilibs/sensor_network/include -Ilibs/sensor_network/include/sensor_network/arch/cortex_m4 -Ilibs/temp_stm32/include -Ilibs/temp_stm32/include/temp_stm32/arch/cortex_m4 -Ilibs/tiny_gps_plus/include -Ilibs/tiny_gps_plus/include/tiny_gps_plus/arch/cortex_m4 -Irepos/apache-mynewt-core/encoding/cborattr/include -Irepos/apache-mynewt-core/encoding/cborattr/include/cborattr/arch/cortex_m4 -Irepos/apache-mynewt-core/encoding/json/include -Irepos/apache-mynewt-core/encoding/json/include/json/arch/cortex_m4 -Irepos/apache-mynewt-core/encoding/tinycbor/include -Irepos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/arch/cortex_m4 -Irepos/apache-mynewt-core/hw/cmsis-core/include -Irepos/apache-mynewt-core/hw/cmsis-core/include/cmsis-core/arch/cortex_m4 -Irepos/apache-mynewt-core/hw/cmsis-core/src/ext -Irepos/apache-mynewt-core/hw/drivers/adc/include -Irepos/apache-mynewt-core/hw/drivers/adc/include/adc/arch/cortex_m4 -Irepos/apache-mynewt-core/hw/drivers/uart/include -Irepos/apache-mynewt-core/hw/drivers/uart/include/uart/arch/cortex_m4 -Irepos/apache-mynewt-core/hw/drivers/uart/uart_hal/include -Irepos/apache-mynewt-core/hw/drivers/uart/uart_hal/include/uart_hal/arch/cortex_m4 -Irepos/apache-mynewt-core/hw/hal/include -Irepos/apache-mynewt-core/hw/hal/include/hal/arch/cortex_m4 -Irepos/apache-mynewt-core/hw/mcu/stm/stm32_common/include -Irepos/apache-mynewt-core/hw/mcu/stm/stm32_common/include/stm32_common/arch/cortex_m4 -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/include -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/include/stm32l4xx/arch/cortex_m4 -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/CMSIS -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/CMSIS/Device -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/CMSIS/Device/ST -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/CMSIS/Device/ST/STM32L4xx -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/CMSIS/Device/ST/STM32L4xx/Include -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/CMSIS/Device/ST/STM32L4xx/Source -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/CMSIS/Device/ST/STM32L4xx/Source/Templates -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/CMSIS/Device/ST/STM32L4xx/Source/Templates/gcc -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/STM32L4xx_HAL_Driver -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/STM32L4xx_HAL_Driver/Inc -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/STM32L4xx_HAL_Driver/Src -Irepos/apache-mynewt-core/hw/mcu/stm/stm32l4xx/src/ext/Drivers/STM32L4xx_HAL_Driver/Src/Legacy -Irepos/apache-mynewt-core/hw/sensor/creator/include -Irepos/apache-mynewt-core/hw/sensor/creator/include/creator/arch/cortex_m4 -Irepos/apache-mynewt-core/hw/sensor/include -Irepos/apache-mynewt-core/hw/sensor/include/sensor/arch/cortex_m4 -Irepos/apache-mynewt-core/kernel/os/include -Irepos/apache-mynewt-core/kernel/os/include/os/arch/cortex_m4 -Irepos/apache-mynewt-core/libc/baselibc/include -Irepos/apache-mynewt-core/libc/baselibc/include/baselibc/arch/cortex_m4 -Irepos/apache-mynewt-core/net/oic/include -Irepos/apache-mynewt-core/net/oic/include/oic/arch/cortex_m4 -Irepos/apache-mynewt-core/net/oic/src -Irepos/apache-mynewt-core/net/oic/src/arch/cortex_m4 -Irepos/apache-mynewt-core/sys/defs/include -Irepos/apache-mynewt-core/sys/defs/include/defs/arch/cortex_m4 -Irepos/apache-mynewt-core/sys/flash_map/include -Irepos/apache-mynewt-core/sys/flash_map/include/flash_map/arch/cortex_m4 -Irepos/apache-mynewt-core/sys/log/common/include -Irepos/apache-mynewt-core/sys/log/common/include/common/arch/cortex_m4 -Irepos/apache-mynewt-core/sys/log/modlog/include -Irepos/apache-mynewt-core/sys/log/modlog/include/modlog/arch/cortex_m4 -Irepos/apache-mynewt-core/sys/log/stub/include -Irepos/apache-mynewt-core/sys/log/stub/include/stub/arch/cortex_m4 -Irepos/apache-mynewt-core/sys/mfg/include -Irepos/apache-mynewt-core/sys/mfg/include/mfg/arch/cortex_m4 -Irepos/apache-mynewt-core/sys/stats/stub/include -Irepos/apache-mynewt-core/sys/stats/stub/include/stub/arch/cortex_m4 -Irepos/apache-mynewt-core/sys/sys/include -Irepos/apache-mynewt-core/sys/sys/include/sys/arch/cortex_m4 -Irepos/apache-mynewt-core/sys/sysdown/include -Irepos/apache-mynewt-core/sys/sysdown/include/sysdown/arch/cortex_m4 -Irepos/apache-mynewt-core/sys/sysinit/include -Irepos/apache-mynewt-core/sys/sysinit/include/sysinit/arch/cortex_m4 -Irepos/apache-mynewt-core/util/mem/include -Irepos/apache-mynewt-core/util/mem/include/mem/arch/cortex_m4 -Irepos/apache-mynewt-core/util/rwlock/include -Irepos/apache-mynewt-core/util/rwlock/include/rwlock/arch/cortex_m4 -Itargets/stm32l4_my_sensor/include -Itargets/stm32l4_my_sensor/include/stm32l4_my_sensor/arch/cortex_m4 -Itargets/stm32l4_my_sensor/src -Itargets/stm32l4_my_sensor/src/arch/cortex_m4 -c -o /Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/bin/targets/stm32l4_my_sensor/app/net/oic/repos/apache-mynewt-core/net/oic/src/api/oc_rep.o repos/apache-mynewt-core/net/oic/src/api/oc_rep.c