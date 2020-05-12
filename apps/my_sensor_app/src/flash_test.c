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

enum Command {
    MAP_COMMAND = 1,
    READ_COMMAND,
    WRITE_COMMAND,
    ERASE_COMMAND,
    SPEED_COMMAND,
};

/// Dump the sector map for the flash device: 0 for internal flash ROM, 1 for external SPI flash
static int dump_cmd(int devid) {
    const struct hal_flash *hf;
    int sec_cnt, i, soff;
    char *eptr;
    char tmp_buf[32];
    char pr_str[80];
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

//  flash [flash-id] -- dumps sector map
//  flash <flash-id> read <offset> <size> -- reads bytes from flash
//  flash <flash-id> write <offset> <size> -- writes incrementing data pattern 0-8 to flash
//  flash <flash-id> erase <offset> <size> -- erases flash
static int flash_cmd(enum Command cmd, int devid, uint32_t off, uint32_t sz) {
    //  Previously defaults to off = 0, sz = 1
    const struct hal_flash *hf;
    int sec_cnt, i, soff;
    char *eptr;
    char tmp_buf[32];
    char pr_str[80];
    switch(cmd) {
        ERASE_COMMAND: {
            console_printf("Erase 0x%lx + %lx\n",
                (long unsigned int) off, (long unsigned int) sz);
            if (hal_flash_erase(devid, off, sz)) {
                console_printf("Flash erase failed\n");
            }
            console_printf("Done!\n");
            break;
        }
        READ_COMMAND: {
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
                        console_printf("  0x%lx: %s\n",
                            (long unsigned int) off, pr_str);
                        soff = 0;
                        off += 8;
                    }
                }
                if (i % 8) {
                    console_printf("  0x%lx: %s\n",
                        (long unsigned int) off, pr_str);
                    off += i;
                }
            }
            break;
        }
        WRITE_COMMAND: {
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
            break;
    }
    return 0;
}

//  Returns # of ops done within 2 seconds.
int flash_speed_test(int flash_dev, uint32_t addr, int sz, int move) {
    int rc, start_time, end_time;
    int cnt = 0, off = 0;
    void *data_buf;

    data_buf = malloc(sz);
    if (!data_buf) {
        return -1;
    }
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
    free(data_buf);
    return cnt;
}

//  flash_speed <flash_id> <addr> <rd_sz>|range [move]
static int flash_speed_test_cli() {
    char *ep;
    int flash_dev;
    uint32_t addr, sz;
    int move, cnt, i;

    //  flash_dev = strtoul(argv[1], &ep, 10);
    //  addr = strtoul(argv[2], &ep, 0);

    i = 1;  //  For range
    //  i = 0;  //  For size
    move = 1;
    //  move = 0;

    if (i == 0) {
        //  For size
        //  sz = strtoul(argv[3], &ep, 0);
        console_printf(
          "Speed test, hal_flash_read(%d, 0x%x%s, %d)\n",
          flash_dev, (unsigned int)addr, move?"..":"", (unsigned int)sz);
        cnt = flash_speed_test(flash_dev, addr, sz, move);
        console_printf("%d\n", cnt >> 1);
    } else {
        //  For range
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
