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
//  Quectel L70-R GPS Driver for Apache Mynewt
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#ifndef __GPS_L70R_DRIVER_H__
#define __GPS_L70R_DRIVER_H__

#include <os/mynewt.h>
#include <sensor/sensor.h>

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define GPS_L70R_DEVICE "gps_l70r_0"  //  Name of the device

//  Use static buffers to avoid dynamic memory allocation (new, delete)
#define GPS_L70R_TX_BUFFER_SIZE      400  //  Must be large enough to hold sensor and geolocation CoAP UDP messages.
#define GPS_L70R_RX_BUFFER_SIZE      256
#define GPS_L70R_PARSER_BUFFER_SIZE  256

//  Various timeouts for different GPS operations, in milliseconds.
#define GPS_L70R_CONNECT_TIMEOUT     10000  //  10  seconds: Timeout for connecting to WiFi access point
#define GPS_L70R_SEND_TIMEOUT        10000  //  10  seconds: Timeout for sending a packet
#define GPS_L70R_RECV_TIMEOUT            0  //   0  seconds: Timeout for receiving a packet
#define GPS_L70R_SCAN_TIMEOUT        30000  //  30  seconds: Timeout for scanning WiFi access points
#define GPS_L70R_MISC_TIMEOUT         2000  //   2  seconds: Timeout for opening a socket

//  GPS Configuration
struct gps_l70r_cfg {
    sensor_type_t bc_s_mask;   //  Sensor data types that will be returned, i.e. Geolocation only
    int uart;                  //  UART port: 0 for UART2, 1 for UART0, 2 for UART3
};

//  GPS Device Instance for Mynewt
struct gps_l70r {
    struct os_dev dev;     //  Mynewt device
    struct sensor sensor;  //  Mynewt sensor
    struct gps_l70r_cfg cfg;  //  Sensor configuration    
    int last_error;           //  Last error encountered
};

//  Start the GPS driver. Return 0 if successful.
int gps_l70r_start(void);

//  Create the device instance and configure it.  Called by sysinit() during startup, defined in pkg.yml.
//  Implemented in creator.c as function DEVICE_CREATE().
void gps_l70r_create(void);

//  Copy the default GPS_L70R config into cfg.  Returns 0.
int gps_l70r_default_cfg(struct gps_l70r_cfg *cfg);

//  Configure the GPS driver.  Called by os_dev_create().  Return 0 if successful.
int gps_l70r_init(struct os_dev *dev0, void *arg);
    
//  Copy the GPS_L70R driver configuration from cfg into drv.  Return 0 if successful.
int gps_l70r_config(struct gps_l70r *drv, struct gps_l70r_cfg *cfg);  

//  Connect to the GPS module.  Return 0 if successful.
int gps_l70r_connect(struct gps_l70r *dev);  

//  Internal Sensor Functions

//  Configure the GPS driver as a Mynewt Sensor.  Return 0 if successful.
int gps_l70r_sensor_init(struct gps_l70r *dev, void *arg);

//  Copy the default sensor config into cfg.  Returns 0.
int gps_l70r_sensor_default_cfg(struct gps_l70r_cfg *cfg);

//  Configure the GPS sensor.  Return 0 if successful.
int gps_l70r_sensor_config(struct gps_l70r *dev, struct gps_l70r_cfg *cfg);

#ifdef __cplusplus
}
#endif

#endif /* __GPS_L70R_DRIVER_H__ */