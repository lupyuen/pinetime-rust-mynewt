#!/usr/bin/env bash
#  Generate Rust bindings for LittlevGL (LVGL) C API. Install "bindgen" before running:
#  cargo install bindgen
#  Also install rustfmt when prompted
#  TODO: Remove derive[Debug]

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.
export RUST_BACKTRACE=1  #  Show Rust errors.

function generate_bindings() {
    #  Generate bindings for the module.
    local libname=$1     # Library name e.g. lvgl
    local modname=$2     # Module name e.g. core
    local submodname=$3  # Submodule name e.g. obj
    local headerfile=$4  # Header file e.g. apps/pinetime/bin/pkg/pinetime/lvgl/src/lv_core/lv_obj.h
    shift 4
    local whitelist="$@" # Whitelist Options: --raw-line, --blacklist-item, --whitelist-function, --whitelist-type, --whitelist-var
    echo "whitelist=$whitelist"

    local expandpath=rust/$libname/src/$modname/$submodname.rs
    local tmpexpandpath=rust/$libname/src/$modname/$submodname.tmp

    #  Generate Rust bindings for the expanded macros, based on `make --trace --jobs=1`.
    #  To generate Rust bindings for `static inline` functions: `-Dstatic="" -Dinline=""`.
    #  TODO: Ensure that output folder has been created
    bindgen \
        --verbose \
        --use-core \
        --ctypes-prefix "::cty" \
        --with-derive-default \
        --no-derive-copy \
        --no-derive-debug \
        --no-layout-tests \
        $whitelist \
        -o $tmpexpandpath \
        $headerfile \
        -- \
        -Dstatic="" \
        -Dinline="" \
        -Ibaselibc/include/ \
        -Iapps/pinetime/bin/pkg/pinetime/ \
        -Iapps/pinetime  \
        -DDEVELHELP \
        -Werror  \
        -DCPU_FAM_NRF52 \
        -mlittle-endian \
        -ffunction-sections \
        -fdata-sections \
        -fno-builtin \
        -fshort-enums \
        -ggdb \
        -g3 \
        -DCPU_MODEL_NRF52832XXAA  \
        -DCPU_ARCH_CORTEX_M4F  \
        -DRIOT_BOARD=BOARD_PINETIME  \
        -DRIOT_CPU=CPU_NRF52  \
        -DRIOT_MCU=MCU_NRF52 \
        -std=c99 \
        -fno-common \
        -DLV_CONF_INCLUDE_SIMPLE  \
        -DLV_LVGL_H_INCLUDE_SIMPLE  \
        -DNIMBLE_CFG_CONTROLLER=1  \
        -DMYNEWT_VAL_OS_CPUTIME_FREQ=32768  \
        -DMYNEWT_VAL_BLE_SM_LEGACY=0  \
        -DMYNEWT_VAL_BLE_SM_SC=1  \
        -DMYNEWT_VAL_BLE_SM_MITM=1  \
        -DMYNEWT_VAL_BLE_SM_BONDING=1  \
        -DMYNEWT_VAL_BLE_SM_MAX_PROCS=1  \
        -DMYNEWT_VAL_BLE_GATT_MAX_PROCS=8  \
        -DMYNEWT_VAL_BLE_L2CAP_MAX_CHANS=8  \
        -DMYNEWT_VAL_BLE_L2CAP_COC_MAX_NUM=1  \
        -DMYNEWT_VAL_BLE_STORE_MAX_BONDS=5 \
        -DMYNEWT_VAL_BLE_SM_OUR_KEY_DIST=0x6  \
        -DMYNEWT_VAL_BLE_SM_THEIR_KEY_DIST=0x6  \
        -DMYNEWT_VAL_MSYS_1_BLOCK_COUNT=32  \
        -DMYNEWT_VAL_MSYS_1_BLOCK_SIZE=292  \
        -DMYNEWT_VAL_BLE_EXT_ADV_MAX_SIZE=31  \
        -DMYNEWT_VAL_BLE_MAX_CONNECTIONS=1  \
        -DMYNEWT_VAL_BLE_MAX_PERIODIC_SYNCS=5 \
        -DMYNEWT_VAL_BLE_MULTI_ADV_INSTANCES=5  \
        -DMYNEWT_VAL_BLE_STORE_MAX_CCCDS=8  \
        -DMYNEWT_VAL_BLE_MAX_PERIODIC_SYNCS=5 \
        -DMYNEWT_VAL_BLE_MULTI_ADV_INSTANCES=5  \
        -DMYNEWT_VAL_BLE_LL_CFG_FEAT_LE_ENCRYPTION=1  \
        -DMYNEWT_VAL_BLE_LL_CFG_FEAT_LL_PRIVACY=1  \
        -DMYNEWT_VAL_BLE_LL_CFG_FEAT_DATA_LEN_EXT=1  \
        -DMYNEWT_VAL_BLE_LL_CFG_FEAT_LL_EXT_ADV=1  \
        -DMYNEWT_VAL_BLE_LL_SCHED_SCAN_AUX_PDU_LEN=41  \
        -DMYNEWT_VAL_BLE_LL_SCHED_SCAN_SYNC_PDU_LEN=32  \
        -DMYNEWT_VAL_BLE_SM_IO_CAP=BLE_HS_IO_DISPLAY_YESNO  \
        -DNIMBLE_HOST_STACKSIZE=3072  \
        -DVFS_FILE_BUFFER_SIZE=84  \
        -DVFS_DIR_BUFFER_SIZE=52  \
        -include 'apps/pinetime/bin/pinetime/riotbuild/riotbuild.h'   \
        -isystem /usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/newlib-nano  \
        -Iapps/pinetime/../../modules/include  \
        -Iapps/pinetime/../../modules/bleman/include  \
        -Iapps/pinetime/../../modules/gui/include  \
        -Iapps/pinetime/../../modules/controller/include  \
        -Iapps/pinetime/../../modules/fonts/include  \
        -Iapps/pinetime/../../modules/hal/include  \
        -Iapps/pinetime/../../modules/storage/include  \
        -Iapps/pinetime/../../modules/util/include  \
        -Iapps/pinetime/../../modules/widget/include  \
        -Iapps/pinetime/../../widgets/home_time/include  \
        -Iapps/pinetime/../../widgets/menu_tiles/include  \
        -Iapps/pinetime/../../widgets/sysinfo/include  \
        -Iapps/pinetime/../../widgets/face_notification/include  \
        -Iapps/pinetime/../../widgets/face_sports/include  \
        -IRIOT/core/include  \
        -IRIOT/drivers/include  \
        -IRIOT/sys/include  \
        -IRIOT/boards/pinetime/include  \
        -IRIOT/boards/common/nrf52/include  \
        -IRIOT/cpu/nrf52/include  \
        -IRIOT/cpu/nrf5x_common/include  \
        -IRIOT/cpu/cortexm_common/include  \
        -IRIOT/cpu/cortexm_common/include/vendor  \
        -IRIOT/sys/libc/include  \
        -Iapps/pinetime/bin/pkg/pinetime/littlefs  \
        -Iapps/pinetime/bin/pkg/pinetime/lvgl  \
        -IRIOT/pkg/nimble/contrib/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/nimble/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/porting/npl/riot/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/porting/nimble/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/nimble/controller/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/nimble/drivers/nrf52/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/nimble/host/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/nimble/host/store/ram/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/nimble/host/util/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/ext/tinycrypt/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/nimble/transport/ram/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/nimble/host/services/gap/include  \
        -Iapps/pinetime/bin/pkg/pinetime/nimble/nimble/host/services/gatt/include  \
        -Iapps/pinetime/../../modules/include  \
        -Iapps/pinetime/../../modules/bleman/include  \
        -Iapps/pinetime/../../modules/gui/include  \
        -Iapps/pinetime/../../modules/controller/include  \
        -Iapps/pinetime/../../modules/fonts/include  \
        -Iapps/pinetime/../../modules/hal/include  \
        -Iapps/pinetime/../../modules/storage/include  \
        -Iapps/pinetime/../../modules/util/include  \
        -Iapps/pinetime/../../modules/widget/include  \
        -Iapps/pinetime/../../widgets/home_time/include  \
        -Iapps/pinetime/../../widgets/menu_tiles/include  \
        -Iapps/pinetime/../../widgets/sysinfo/include  \
        -Iapps/pinetime/../../widgets/face_notification/include  \
        -Iapps/pinetime/../../widgets/face_sports/include  \
        -Iapps/pinetime/../../modules/bleman/include  \
        -Iapps/pinetime/../../modules/gui/include  \
        -Iapps/pinetime/../../modules/controller/include  \
        -Iapps/pinetime/../../modules/fonts/include  \
        -Iapps/pinetime/../../modules/hal/include  \
        -Iapps/pinetime/../../modules/storage/include  \
        -Iapps/pinetime/../../modules/util/include  \
        -Iapps/pinetime/../../modules/widget/include  \
        -IRIOT/sys/posix/include  \
        -IRIOT/drivers/cst816s/include  \
        -IRIOT/drivers/ili9341/include  \
        -DEND_OF_OPTIONS

    # Change extern "C"
    # to     #[lvgl_macros::safe_wrap(attr)] extern "C"
    # Change #[doc = " @param dev The device to open"]
    # to     #[doc = " - __`dev`__: The device to open"]
    # Change @return to Return
    # Change @code{.c} to ```c
    # Change @code{...} to ```
    # Change @endcode to ```
    # Change @note to __Note:__
    cat $tmpexpandpath \
        | sed 's/^extern "C" /#[lvgl_macros::safe_wrap(attr)] extern "C" /' \
        | sed 's/@param \([^ ][^ ]*\) /- __`\1`__: /' \
        | sed 's/@return /Return: /' \
        | sed 's/@code{.c}/```c/' \
        | sed 's/@code/```/' \
        | sed 's/@endcode/```/' \
        | sed 's/@note/__Note:__/' \
        >$expandpath
    rm $tmpexpandpath
}

#  Define the library name
libname=lvgl
headerprefix=apps/pinetime/bin/pkg/pinetime

function generate_bindings_core() {
    #  Add whitelist and blacklist for for lv_core/lv_obj
    local modname=core
    local submodname=obj
    local headerfile=$headerprefix/$libname/src/lv_$modname/lv_$submodname.h
    local whitelistname=lv_
    local whitelist=`cat << EOF
        --raw-line use \
        --raw-line super::*; \
        --whitelist-function (?i)${whitelistname}.* \
        --whitelist-type     (?i)${whitelistname}.* \
        --whitelist-var      (?i)${whitelistname}.*
EOF
`
    #  Generate the bindings for lv_core/lv_obj: libname, modname, submodname, headerfile, whitelist
    generate_bindings $libname $modname $submodname $headerfile $whitelist
}

function generate_bindings_objx() {
    #  Add whitelist and blacklist for for lv_objx/lv_label
    local modname=objx
    local submodname=label
    local headerfile=$headerprefix/$libname/src/lv_$modname/lv_$submodname.h
    local whitelistname=lv_label
    local whitelist=`cat << EOF
        --raw-line use \
        --raw-line super::*; \
        --whitelist-function (?i)${whitelistname}.* \
        --whitelist-type     (?i)${whitelistname}.* \
        --whitelist-var      (?i)${whitelistname}.* \
        --blacklist-item     _lv_obj_t \
        --blacklist-item     lv_style_t
EOF
`
    #  Generate the bindings for lv_objx/lv_label: libname, modname, submodname, headerfile, whitelist
    generate_bindings $libname $modname $submodname $headerfile $whitelist
}

#  Generate bindings for lv_core
generate_bindings_core

#draw
#font
#hal
#misc

#  Generate bindings for lv_objx
generate_bindings_objx

#themes

exit

#  TODO: Adapt for LVGL
function NOTUSED_generate_bindings_hw() {
    #  Generate bindings for hw/*
    #  libname: sensor
    local libname=$1
    #  srcname: sensor
    local srcname=$2
    #  prefixname: sensor
    local prefixname=$3
    if [ "$libname" == 'sensor' ]; then
        #  modname looks like hw/sensor/bindings.rs
        local modname=hw/$libname/bindings
        #  libdir looks like hw/sensor
        local libdir=hw/$libname
        #  libcmd looks like
        #  bin/targets/bluepill_my_sensor/app/hw/sensor/repos/apache-mynewt-core/hw/sensor/src/sensor.o.cmd
        local libcmd=bin/targets/*_my_sensor/app/$libdir/repos/apache-mynewt-core/$libdir/src/$srcname.o.cmd
    elif [ "$libname" == 'hal' ]; then
        #  modname looks like hw/hal.rs
        local modname=hw/$libname
        #  libdir looks like hw/hal
        local libdir=hw/$libname
        #  libcmd looks like
        #  bin/targets/nrf52_my_sensor/app/libs/mynewt_rust/libs/mynewt_rust/src/hal.o.cmd
        local libcmd=bin/targets/*_my_sensor/app/libs/mynewt_rust/libs/mynewt_rust/src/$srcname.o.cmd
    else
        #  modname looks like hw/xxx.rs
        local modname=hw/$libname
        #  libdir looks like hw/xxx
        local libdir=hw/$libname
        #  libcmd looks like
        #  bin/targets/bluepill_my_sensor/app/hw/sensor/repos/apache-mynewt-core/hw/sensor/src/sensor.o.cmd
        local libcmd=bin/targets/*_my_sensor/app/$libdir/repos/apache-mynewt-core/$libdir/src/$srcname.o.cmd
    fi
    #  Add whitelist and blacklist.
    local whitelist=`cat << EOF
        --raw-line use \
        --raw-line super::*; \
        --blacklist-item     os_callout \
        --blacklist-item     os_dev	\
        --blacklist-item     os_dev_handlers \
        --blacklist-item     os_event \
        --blacklist-item     os_eventq \
        --blacklist-item     os_memblock \
        --blacklist-item     os_mempool \
        --blacklist-item     os_mutex \
        --blacklist-item     os_sanity_check \
        --blacklist-item     os_task \
        --blacklist-item     os_timeval \
        --blacklist-item     os_timezone \
        --whitelist-function (?i)${prefixname}.* \
        --whitelist-type     (?i)${prefixname}.* \
        --whitelist-var      (?i)${prefixname}.*
EOF
`
    generate_bindings $libname $modname $libdir $libcmd $whitelist
}

#  Sample gcc command from `make --trace --jobs=1`
arm-none-eabi-gcc \
    -DRIOT_FILE_RELATIVE=\"/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/lvgl/src/lv_objx/lv_label.c\" \
    -DRIOT_FILE_NOPATH=\"lv_label.c\" \
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime 
    -DPINETIME_VERSION=\"6145f3d\" 
    -DDEVELHELP -Werror 
    -DCPU_FAM_NRF52 -mno-thumb
    -interwork -mcpu=cortex-m4 -mlittle-endian -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -ffunction-sections -fdata-sections -fno-builtin -fshort-enums -ggdb -g3 -Os 
    -DCPU_MODEL_NRF52832XXAA 
    -DCPU_ARCH_CORTEX_M4F 
    -DRIOT_APPLICATION=\"PineTime\" 
    -DBOARD_PINETIME=\"pinetime\" 
    -DRIOT_BOARD=BOARD_PINETIME 
    -DCPU_NRF52=\"nrf52\" 
    -DRIOT_CPU=CPU_NRF52 
    -DMCU_NRF52=\"nrf52\" 
    -DRIOT_MCU=MCU_NRF52 -std=c99 -fno-common -Wall -Wextra -Wmissing
    -include-dirs -fno-delete-null-pointer-checks -fdiagnostics-color -Wstrict-prototypes -Wold-style-definition -gz -Wformat=2 -Wformat-overflow -Wformat-truncation -Wno-pedantic -Wno-unused-parameter -Wno-sign-compare -Wno-cast-function-type 
    -DLV_CONF_INCLUDE_SIMPLE 
    -DLV_LVGL_H_INCLUDE_SIMPLE 
    -DNIMBLE_CFG_CONTROLLER=1 
    -DMYNEWT_VAL_OS_CPUTIME_FREQ=32768 
    -DMYNEWT_VAL_BLE_SM_LEGACY=0 
    -DMYNEWT_VAL_BLE_SM_SC=1 
    -DMYNEWT_VAL_BLE_SM_MITM=1 
    -DMYNEWT_VAL_BLE_SM_BONDING=1 
    -DMYNEWT_VAL_BLE_SM_MAX_PROCS=1 
    -DMYNEWT_VAL_BLE_GATT_MAX_PROCS=8 
    -DMYNEWT_VAL_BLE_L2CAP_MAX_CHANS=8 
    -DMYNEWT_VAL_BLE_L2CAP_COC_MAX_NUM=1 
    -DMYNEWT_VAL_BLE_STORE_MAX_BONDS=5 
    -DMYNEWT_VAL_BLE_SM_OUR_KEY_DIST=0x6 
    -DMYNEWT_VAL_BLE_SM_THEIR_KEY_DIST=0x6 
    -DMYNEWT_VAL_MSYS_1_BLOCK_COUNT=32 
    -DMYNEWT_VAL_MSYS_1_BLOCK_SIZE=292 
    -DMYNEWT_VAL_BLE_EXT_ADV_MAX_SIZE=31 
    -DMYNEWT_VAL_BLE_MAX_CONNECTIONS=1 
    -DMYNEWT_VAL_BLE_MAX_PERIODIC_SYNCS=5 
    -DMYNEWT_VAL_BLE_MULTI_ADV_INSTANCES=5 
    -DMYNEWT_VAL_BLE_STORE_MAX_CCCDS=8 
    -DMYNEWT_VAL_BLE_MAX_PERIODIC_SYNCS=5 
    -DMYNEWT_VAL_BLE_MULTI_ADV_INSTANCES=5 
    -DMYNEWT_VAL_BLE_LL_CFG_FEAT_LE_ENCRYPTION=1 
    -DMYNEWT_VAL_BLE_LL_CFG_FEAT_LL_PRIVACY=1 
    -DMYNEWT_VAL_BLE_LL_CFG_FEAT_DATA_LEN_EXT=1 
    -DMYNEWT_VAL_BLE_LL_CFG_FEAT_LL_EXT_ADV=1 
    -DMYNEWT_VAL_BLE_LL_SCHED_SCAN_AUX_PDU_LEN=41 
    -DMYNEWT_VAL_BLE_LL_SCHED_SCAN_SYNC_PDU_LEN=32 
    -DMYNEWT_VAL_BLE_SM_IO_CAP=BLE_HS_IO_DISPLAY_YESNO 
    -DNIMBLE_HOST_STACKSIZE=3072 
    -DVFS_FILE_BUFFER_SIZE=84 
    -DVFS_DIR_BUFFER_SIZE=52 
    -include '/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pinetime/riotbuild/riotbuild.h'  
    -isystem /usr/local/Cellar/arm-none-eabi-gcc/7-2018-q2-update/gcc/arm-none-eabi/include/newlib-nano 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/bleman/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/gui/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/controller/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/fonts/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/hal/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/storage/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/util/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/widget/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../widgets/home_time/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../widgets/menu_tiles/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../widgets/sysinfo/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../widgets/face_notification/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../widgets/face_sports/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/core/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/drivers/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/sys/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/boards/pinetime/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/boards/common/nrf52/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/cpu/nrf52/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/cpu/nrf5x_common/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/cpu/cortexm_common/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/cpu/cortexm_common/include/vendor 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/sys/libc/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/littlefs 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/lvgl 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/pkg/nimble/contrib/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/nimble/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/porting/npl/riot/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/porting/nimble/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/nimble/controller/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/nimble/drivers/nrf52/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/nimble/host/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/nimble/host/store/ram/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/nimble/host/util/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/ext/tinycrypt/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/nimble/transport/ram/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/nimble/host/services/gap/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/nimble/nimble/host/services/gatt/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/bleman/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/gui/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/controller/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/fonts/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/hal/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/storage/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/util/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/widget/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../widgets/home_time/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../widgets/menu_tiles/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../widgets/sysinfo/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../widgets/face_notification/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../widgets/face_sports/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/bleman/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/gui/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/controller/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/fonts/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/hal/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/storage/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/util/include 
    -I/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/../../modules/widget/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/sys/posix/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/drivers/cst816s/include 
    -I/Users/Luppy/PineTime/PineTime-apps/RIOT/drivers/ili9341/include 
    -MQ '/Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pinetime/lvgl_objx/lv_label.o' 
    -MD -MP -c 
    -o /Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pinetime/lvgl_objx/lv_label.o 
    /Users/Luppy/PineTime/PineTime-apps/apps/pinetime/bin/pkg/pinetime/lvgl/src/lv_objx/lv_label.c

→ bindgen --help
bindgen 0.49.2
Generates Rust bindings from C/C++ headers.

USAGE:
    bindgen [FLAGS] [OPTIONS] <header> -- <clang-args>...

FLAGS:
        --block-extern-crate                     Use extern crate instead of use for block.
        --builtins                               Output bindings for builtin definitions, e.g. __builtin_va_list.
        --conservative-inline-namespaces         Conservatively generate inline namespaces to avoid name conflicts.
        --disable-name-namespacing
            Disable namespacing via mangling, causing bindgen to generate names like "Baz" instead of "foo_bar_Baz" for
            an input name "foo::bar::Baz".
        --distrust-clang-mangling                Do not trust the libclang-provided mangling
        --dump-preprocessed-input
            Preprocess and dump the input header files to disk. Useful when debugging bindgen, using C-Reduce, or when
            filing issues. The resulting file will be named something like `__bindgen.i` or `__bindgen.ii`.
        --emit-clang-ast                         Output the Clang AST for debugging purposes.
        --emit-ir                                Output our internal IR for debugging purposes.
        --enable-cxx-namespaces                  Enable support for C++ namespaces.
        --enable-function-attribute-detection
            Enables detecting unexposed attributes in functions (slow).
                                   Used to generate #[must_use] annotations.
        --generate-block                         Generate block signatures instead of void pointers.
        --generate-inline-functions              Generate inline functions.
    -h, --help                                   Prints help information
        --ignore-functions
            Do not generate bindings for functions or methods. This is useful when you only care about struct layouts.

        --ignore-methods                         Do not generate bindings for methods.
        --impl-debug                             Create Debug implementation, if it can not be derived automatically.
        --impl-partialeq
            Create PartialEq implementation, if it can not be derived automatically.

        --no-convert-floats                      Do not automatically convert floats to f32/f64.
        --no-derive-copy                         Avoid deriving Copy on any type.
        --no-derive-debug                        Avoid deriving Debug on any type.
        --no-doc-comments
            Avoid including doc comments in the output, see: https://github.com/rust-lang/rust-bindgen/issues/426

        --no-include-path-detection              Do not try to detect default include paths
        --no-layout-tests                        Avoid generating layout tests for any type.
        --no-prepend-enum-name                   Do not prepend the enum name to bitfield or constant variants.
        --no-record-matches
            Do not record matching items in the regex sets. This disables reporting of unused items.

        --no-recursive-whitelist
            Disable whitelisting types recursively. This will cause bindgen to emit Rust code that won't compile! See
            the `bindgen::Builder::whitelist_recursively` method's documentation for details.
        --no-rustfmt-bindings                    Do not format the generated bindings with rustfmt.
        --objc-extern-crate                      Use extern crate instead of use for objc.
        --rustfmt-bindings
            Format the generated bindings with rustfmt. DEPRECATED: --rustfmt-bindings is now enabled by default.
            Disable with --no-rustfmt-bindings.
        --time-phases                            Time the different bindgen phases and print to stderr
        --unstable-rust                          Generate unstable Rust code (deprecated; use --rust-target instead).
        --use-array-pointers-in-arguments        Use `*const [T; size]` instead of `*const T` for C arrays
        --use-core                               Use types from Rust core instead of std.
        --use-msvc-mangling                      MSVC C++ ABI mangling. DEPRECATED: Has no effect.
    -V, --version                                Prints version information
        --verbose                                Print verbose error messages.
        --with-derive-default                    Derive Default on any type.
        --with-derive-eq
            Derive eq on any type. Enable this option also enables --with-derive-partialeq

        --with-derive-hash                       Derive hash on any type.
        --with-derive-ord
            Derive ord on any type. Enable this option also enables --with-derive-partialord

        --with-derive-partialeq                  Derive partialeq on any type.
        --with-derive-partialord                 Derive partialord on any type.

OPTIONS:
        --bitfield-enum <regex>...             Mark any enum whose name matches <regex> as a set of bitfield flags.
        --blacklist-function <function>...     Mark <function> as hidden.
        --blacklist-item <item>...             Mark <item> as hidden.
        --blacklist-type <type>...             Mark <type> as hidden.
        --constified-enum <regex>...           Mark any enum whose name matches <regex> as a series of constants.
        --constified-enum-module <regex>...    Mark any enum whose name matches <regex> as a module of constants.
        --ctypes-prefix <prefix>               Use the given prefix before raw types instead of ::std::os::raw.
        --default-enum-style <variant>         The default style of code used to generate enums. [default: consts]
                                               [possible values: consts, moduleconsts, bitfield, rust]
        --emit-ir-graphviz <path>              Dump graphviz dot file.
        --generate <generate>                  Generate only given items, split by commas. Valid values are
                                               "functions","types", "vars", "methods", "constructors" and "destructors".
        --no-copy <regex>...                   Avoid deriving Copy for types matching <regex>.
        --no-hash <regex>...                   Avoid deriving Hash for types matching <regex>.
        --no-partialeq <regex>...              Avoid deriving PartialEq for types matching <regex>.
        --opaque-type <type>...                Mark <type> as opaque.
    -o, --output <output>                      Write Rust bindings to <output>.
        --raw-line <raw-line>...               Add a raw line of Rust code at the beginning of output.
        --rust-target <rust-target>            Version of the Rust compiler to target. Valid options are: ["1.0",
                                               "1.19", "1.20", "1.21", "1.25", "1.26", "1.27", "1.28", "1.33",
                                               "nightly"]. Defaults to "1.33".
        --rustfmt-configuration-file <path>    The absolute path to the rustfmt configuration file. The configuration
                                               file will be used for formatting the bindings. This parameter is
                                               incompatible with --no-rustfmt-bindings.
        --rustified-enum <regex>...            Mark any enum whose name matches <regex> as a Rust enum.
        --whitelist-function <regex>...        Whitelist all the free-standing functions matching <regex>. Other non-
                                               whitelisted functions will not be generated.
        --whitelist-type <regex>...            Only generate types matching <regex>. Other non-whitelisted types will
                                               not be generated.
        --whitelist-var <regex>...             Whitelist all the free-standing variables matching <regex>. Other non-
                                               whitelisted variables will not be generated.

ARGS:
    <header>           C or C++ header file
    <clang-args>...
