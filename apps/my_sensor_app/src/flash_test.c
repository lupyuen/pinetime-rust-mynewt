/*
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
//  Based on https://github.com/apache/mynewt-core/blob/master/test/flash_test/src/flash_test.c
#include <inttypes.h>
#include "os/mynewt.h"
#include <console/console.h>
#include <hal/hal_bsp.h>
#include <hal/hal_flash.h>
#include <hal/hal_flash_int.h>
#include <stdio.h>
#include <string.h>

/// Flash testing commands
enum Command {
    READ_COMMAND = 1,
    WRITE_COMMAND,
    ERASE_COMMAND,
};

/// Names of the flash devices
const char *flash_device_names[] = {
    "Internal Flash ROM",
    "External SPI Flash",
};

/// Dump the sector map for the flash device: 0 for internal flash ROM, 1 for external SPI flash
int map_cmd(int devid) {
    const struct hal_flash *hf;
    int sec_cnt, i;
    console_printf("Sector Map for %s...\n", flash_device_names[devid]); console_flush();
    hf = hal_bsp_flash_dev(devid);
    if (!hf) {
        console_printf("Flash device not present\n");
        return -1;
    }
    console_printf("Flash %d at 0x%lx size 0x%lx with %d "
                                "sectors, alignment req %d bytes\n",
        devid,
        (long unsigned int) hf->hf_base_addr,
        (long unsigned int) hf->hf_size,
        hf->hf_sector_cnt,
        hf->hf_align);
    sec_cnt = hf->hf_sector_cnt;
    if (sec_cnt > 32) {
        sec_cnt = 32;
    }
    for (i = 0; i < sec_cnt; i++) {
        console_printf("  %d: %lx\n", i,
                (long unsigned int) hal_flash_sector_size(hf, i));
    }
    if (sec_cnt != hf->hf_sector_cnt) {
        console_printf("...  %d: %lx\n",
            hf->hf_sector_cnt - 1,
            (long unsigned int) hal_flash_sector_size(hf, hf->hf_sector_cnt - 1));
    }
    return 0;
}

//  flash <flash-id> read <offset> <size> -- reads bytes from flash
//  flash <flash-id> write <offset> <size> -- writes incrementing data pattern 0-8 to flash
//  flash <flash-id> erase <offset> <size> -- erases flash
int flash_cmd(enum Command cmd, int devid, uint32_t off, uint32_t sz) {
    //  Previously defaults to off = 0, sz = 1
    int sec_cnt, i, soff;
    char tmp_buf[32];
    char pr_str[80];
    switch(cmd) {
        case ERASE_COMMAND: {
            console_printf("Erase %s...\n", flash_device_names[devid]); console_flush();
            console_printf("Erase 0x%lx + %lx\n",
                (long unsigned int) off, (long unsigned int) sz);
            if (hal_flash_erase(devid, off, sz)) {
                console_printf("Flash erase failed\n");
            }
            console_printf("Done!\n");
            break;
        }
        case READ_COMMAND: {
            console_printf("Read %s...\n", flash_device_names[devid]); console_flush();
            console_printf("Read 0x%lx + %lx\n",
                (long unsigned int) off, (long unsigned int) sz);
            sz += off;
            while (off < sz) {
                sec_cnt = min(sizeof(tmp_buf), sz - off);
                if (hal_flash_read(devid, off, tmp_buf, sec_cnt)) {
                    console_printf("flash read failure at %lx\n",
                        (long unsigned int) off);
                    break;
                }
                for (i = 0, soff = 0; i < sec_cnt; i++) {
                    soff += snprintf(pr_str + soff, sizeof(pr_str) - soff,
                    "0x%02x ", tmp_buf[i] & 0xff);
                    if (i % 8 == 7) {
                        console_printf("  0x%04lx: %s\n",
                            (long unsigned int) off, pr_str);
                        soff = 0;
                        off += 8;
                    }
                }
                if (i % 8) {
                    console_printf("  0x%04lx: %s\n",
                        (long unsigned int) off, pr_str);
                    off += i;
                }
            }
            break;
        }
        case WRITE_COMMAND: {
            console_printf("Write %s...\n", flash_device_names[devid]); console_flush();
            console_printf("Write 0x%lx + %lx\n",
                (long unsigned int) off, (long unsigned int) sz);
            sz += off;
            for (i = 0; i < sizeof(tmp_buf); i++) {
                tmp_buf[i] = i + 1;
            }
            while (off < sz) {
                sec_cnt = min(sizeof(tmp_buf), sz - off);
                if (hal_flash_write(devid, off, tmp_buf, sec_cnt)) {
                    console_printf("flash write failure at %lx\n",
                        (long unsigned int) off);
                }
                off += sec_cnt;
            }
            console_printf("Done!\n");
            break;
        }
        default:
            assert(false);  //  Unknown command
            break;
    }
    return 0;
}

#define MAX_SPEED_TEST_SIZE 1024  //  Max number of bytes for speed test
static uint8_t data_buf[MAX_SPEED_TEST_SIZE];  //  Will read into this buffer for speed test

/// Returns # of ops done within 2 seconds. sz must not exceed MAX_SPEED_TEST_SIZE;
int flash_speed_test(int flash_dev, uint32_t addr, int sz, int move) {
    int rc, start_time, end_time;
    int cnt = 0, off = 0;
    assert(sz <= MAX_SPEED_TEST_SIZE);  //  sz must not exceed MAX_SPEED_TEST_SIZE
    //  Catch start of a tick.
    start_time = os_time_get();
    while (1) {
        end_time = os_time_get();
        if (end_time != start_time) {
            start_time = end_time;
            break;
        }
    }
    //  Measure for 2 secs.
    do {
        rc = hal_flash_read(flash_dev, addr + off, data_buf, sz);
        if (rc) {
            console_printf("hal_flash_read(%d, 0x%x, %d) = %d\n",
              flash_dev, (unsigned int)addr + off, (unsigned int)sz, rc);
            return -1;
        }
        if (move) {
            off++;
            if (off > 16) {
                off = 0;
            }
        }
        end_time = os_time_get();
        cnt++;
    } while (end_time - start_time < 2 * OS_TICKS_PER_SEC);
    return cnt;
}

/// Test flash speed
/// flash_speed <flash_id> <addr> <rd_sz>|range [move]
/// range=0 for size mode, range=1 for range mode, move=1 for move
int speed_cmd(int flash_dev, uint32_t addr, uint32_t sz, int range, int move) {
    int cnt, i;
    console_printf("Speed Test for %s...\n", flash_device_names[flash_dev]); console_flush();
    if (!range) {
        //  For size mode:
        console_printf(
            "Speed test, hal_flash_read(%d, 0x%x%s, %d)\n",
            flash_dev, (unsigned int)addr, move?"..":"", (unsigned int)sz);
        cnt = flash_speed_test(flash_dev, addr, sz, move);
        console_printf("%d\n", cnt >> 1);
    } else {
        //  For range mode:
        uint32_t sizes[] = {
            1, 2, 4, 8, 16, 24, 32, 48, 64, 96, 128, 192, 256
        };
        console_printf(
          "Speed test, hal_flash_read(%d, 0x%x%s, X)\n",
          flash_dev, (unsigned int)addr, move?"..":"");

        for (i = 0; i < sizeof(sizes) / sizeof(sizes[0]); i++) {
            cnt = flash_speed_test(flash_dev, addr, sizes[i], move);
            console_printf("%3d %d\n", (int)sizes[i], cnt >> 1);
            os_time_delay(OS_TICKS_PER_SEC / 8);
        }
    }
    return 0;
}

/// Test internal flash ROM and external SPI flash
int test_flash() {
    console_printf("Testing flash...\n"); console_flush();
    if (
        ///////////////////////////////////////////////////
        //  Dump Sector Map

        //  Dump sector map for internal flash ROM
        map_cmd(0) ||

        //  Dump sector map for external SPI flash
        map_cmd(1) ||

        ///////////////////////////////////////////////////
        //  Read Flash: Before erasing
        //  flash <flash-id> read <offset> <size> -- reads bytes from flash        

        //  Read internal flash ROM
        flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

        //  Read external SPI flash
        flash_cmd(READ_COMMAND, 1, 0x0, 32) ||

        ///////////////////////////////////////////////////
        //  Erase Flash: Sets all bits to 1
        //  flash <flash-id> erase <offset> <size> -- erases flash

        //  Erase external SPI flash
        flash_cmd(ERASE_COMMAND, 1, 0x0, 32) ||

        ///////////////////////////////////////////////////
        //  Read Flash: Shows all bits set to 1
        //  flash <flash-id> read <offset> <size> -- reads bytes from flash        

        //  Read internal flash ROM
        flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

        //  Read external SPI flash
        flash_cmd(READ_COMMAND, 1, 0x0, 32) ||

        ///////////////////////////////////////////////////
        //  Write Flash: Write 0x01, 0x02, 0x03, ... (Must erase before writing)
        //  flash <flash-id> write <offset> <size> -- writes incrementing data pattern 0-8 to flash

        //  Write external SPI flash
        flash_cmd(WRITE_COMMAND, 1, 0x0, 32) ||

        ///////////////////////////////////////////////////
        //  Read Flash: Shows 0x01, 0x02, 0x03, ...
        //  flash <flash-id> read <offset> <size> -- reads bytes from flash        

        //  Read internal flash ROM
        flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

        //  Read external SPI flash
        flash_cmd(READ_COMMAND, 1, 0x0, 32) ||

        ///////////////////////////////////////////////////
        //  Test Flash Speed
        //  flash_speed <flash_id> <addr> <rd_sz>|range [move]
        //  range=0 for size mode, range=1 for range mode, move=1 for move

        //  Internal flash ROM, size mode, no move
        speed_cmd(0, 0x0, 32, 0, 0) ||

        //  External SPI flash, size mode, no move
        speed_cmd(1, 0x0, 32, 0, 0) ||

        //  Internal flash ROM, range mode, no move
        //  speed_cmd(0, 0x0, 0, 1, 0) ||

        //  External SPI flash, range mode, no move
        //  speed_cmd(1, 0x0, 0, 1, 0) ||
        0
    ) { 
        console_printf("Flash failed\n"); console_flush();
        return -1;  //  Tests failed
    }
    console_printf("Flash OK\n"); console_flush();
    return 0;  //  Tests OK
}

/* Log:
TMP create temp_stub_0
NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
NET standalone node 
Testing flash...
Sector Map for Internal Flash ROM...
Flash 0 at 0x0 size 0x80000 with 128 sectors, alignment req 1 bytes
  0: 1000
  1: 1000
  2: 1000
  3: 1000
  4: 1000
  5: 1000
  6: 1000
  7: 1000
  8: 1000
  9: 1000
  10: 1000
  11: 1000
  12: 1000
  13: 1000
  14: 1000
  15: 1000
  16: 1000
  17: 1000
  18: 1000
  19: 1000
  20: 1000
  21: 1000
  22: 1000
  23: 1000
  24: 1000
  25: 1000
  26: 1000
  27: 1000
  28: 1000
  29: 1000
  30: 1000
  31: 1000
...  127: 1000
Sector Map for External SPI Flash...
Flash 1 at 0x0 size 0x400000 with 1024 sectors, alignment req 1 bytes
  0: 1000
  1: 1000
  2: 1000
  3: 1000
  4: 1000
  5: 1000
  6: 1000
  7: 1000
  8: 1000
  9: 1000
  10: 1000
  11: 1000
  12: 1000
  13: 1000
  14: 1000
  15: 1000
  16: 1000
  17: 1000
  18: 1000
  19: 1000
  20: 1000
  21: 1000
  22: 1000
  23: 1000
  24: 1000
  25: 1000
  26: 1000
  27: 1000
  28: 1000
  29: 1000
  30: 1000
  31: 1000
...  1023: 1000
Read Internal Flash ROM...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
  0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Read External SPI Flash...
Read 0x0 + 20
  0x0000: 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 
  0x0008: 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f 0x10 
  0x0010: 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 
  0x0018: 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f 0x20 
Erase External SPI Flash...
Erase 0x0 + 20
Done!
Read Internal Flash ROM...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
  0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Read External SPI Flash...
Read 0x0 + 20
  0x0000: 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 
  0x0008: 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 
  0x0010: 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 
  0x0018: 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 
Write External SPI Flash...
Write 0x0 + 20
Done!
Read Internal Flash ROM...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
  0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Read External SPI Flash...
Read 0x0 + 20
  0x0000: 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 
  0x0008: 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f 0x10 
  0x0010: 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 
  0x0018: 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f 0x20 
Flash OK
Rust test display
*/