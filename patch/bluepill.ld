/* Patched for stm32bluepill-mynewt-sensor to reduce bootloader size
 * https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/master/patch/bluepill.ld 
 * repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

MEMORY
{
  /*  Must sync with scripts/flash-app.ocd, repos/apache-mynewt-core/hw/bsp/bluepill/bsp.yml  */
  FLASH (rx) :  ORIGIN = 0x08004000, LENGTH = 48K /* First image slot moved from 0x8008000 to 0x8004000. */
  RAM (rwx) :   ORIGIN = 0x20000000, LENGTH = 20K
}

/* This linker script is used for images and thus contains an image header */
_imghdr_size = 0x20;
