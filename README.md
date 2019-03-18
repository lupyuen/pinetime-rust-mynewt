<!--
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#  KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
-->

# How this sensor sample was created under macOS

Based on 

https://mynewt.apache.org/latest/tutorials/sensors/sensor_thingy_lis2dh12_onb.html

https://mynewt.apache.org/latest/tutorials/sensors/sensor_nrf52_bno055.html

```
cd /mnt/c/mynewt
newt new stm32bluepill-mynewt-sensor
cd stm32bluepill-mynewt-sensor
nano project.yml
Change
    vers: 1-latest
to
    vers: 0-dev

newt install
newt pkg new -t app apps/my_sensor_app
newt pkg new -t lib libs/semihosting_console

nano apps/my_sensor_app/pkg.yml
Add 
    - "@apache-mynewt-core/hw/sensor"
    - "@apache-mynewt-core/hw/sensor/creator"
Change
    - "@apache-mynewt-core/sys/console/full"
    - "@apache-mynewt-core/sys/log/full"
    - "@apache-mynewt-core/sys/stats/full"
to
    - "@apache-mynewt-core/sys/console/stub"
    - "@apache-mynewt-core/sys/log/stub"
    - "@apache-mynewt-core/sys/stats/stub"

newt target create bluepill_boot
newt target set bluepill_boot bsp=@apache-mynewt-core/hw/bsp/bluepill
newt target set bluepill_boot app=@apache-mynewt-core/apps/boot
newt target set bluepill_boot build_profile=optimized

newt target create bluepill_my_sensor
newt target set bluepill_my_sensor bsp=@apache-mynewt-core/hw/bsp/bluepill
newt target set bluepill_my_sensor app=apps/my_sensor_app
newt target set bluepill_my_sensor build_profile=debug

newt target set bluepill_my_sensor syscfg=SPI_0_MASTER=1:BME280_OFB=1:SENSOR_OIC=0:CONSOLE_RTT=0:CONSOLE_UART=0:LOG_CLI=0:LOG_LEVEL=255:STATS_CLI=0:SHELL_CMD_HELP=0:SHELL_OS_MODULE=0:SHELL_TASK=0

TODO: Edit repos/apache-mynewt-core/hw/sensor/creator/src/sensor_creator.c
Change to:
#if MYNEWT_VAL(SPI_0_MASTER) && MYNEWT_VAL(BME280_OFB)
static struct sensor_itf spi_0_itf_bme = {
    .si_type = SENSOR_ITF_SPI,
    .si_num = 0,
    //// TODO: .si_cs_pin = 3,
    .si_cs_pin = 4  ////  TODO
};
#endif

```

# Apache Blinky

## Overview

Apache Blinky is a skeleton for new Apache Mynewt projects.  The user downloads
this skeleton by issuing the "newt new" command (using Apache Newt).  Apache
blinky also contains an example app and target for use with Apache Mynewt to
help you get started.

## Building

Apache Blinky contains an example Apache Mynewt application called blinky.
When executed on suitably equipped hardware, this application repeatedly blinks
an LED.  The below procedure describes how to build this application for the
Apache Mynewt simulator.

1. Download and install Apache Newt.

You will need to download the Apache Newt tool, as documented in the [Getting Started Guide](https://mynewt.apache.org/latest/get_started/index.html).

2. Download the Apache Mynewt Core package (executed from the blinky directory).

```no-highlight
    $ newt install
```

3. Build the blinky app for the sim platform using the "my_blinky_sim" target
(executed from the blinky directory).

```no-highlight
    $ newt build my_blinky_sim
```

The Apache Newt tool should indicate the location of the generated blinky
executable.  Since the simulator does not have an LED to blink, this version of
blinky is not terribly exciting - a printed message indicating the current LED
state.  To learn how to build blinky for actual hardware, please see the
[Getting Started Guide](https://mynewt.apache.org/latest/get_started/index.html).
