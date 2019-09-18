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
#include <os/os.h>
#include <sensor/sensor.h>
#include <console/console.h>
#include <sensor_network/sensor_network.h>
#include <bsp/bsp.h>
#include <hal/hal_gpio.h>
#include <tiny_gps_plus/tiny_gps_plus.h>
#include <buffered_serial/buffered_serial.h>
#include "gps_l70r/gps_l70r.h"

/// Set this to 1 so that `power_sleep()` will not sleep when network is busy connecting.  Defined in apps/my_sensor_app/src/power.c
extern "C" int power_standby_wakeup();

//  Controller buffers.  TODO: Support multiple instances.
static char gps_l70r_tx_buffer[GPS_L70R_TX_BUFFER_SIZE];  //  TX Buffer
static char gps_l70r_rx_buffer[GPS_L70R_RX_BUFFER_SIZE];  //  RX Buffer
static char gps_l70r_parser_buffer[GPS_L70R_PARSER_BUFFER_SIZE];  //  Buffer for ATParser
static bool first_open = true;  //  True if this is the first time opening the driver

//  Buffered serial port. TODO: Support multiple instances.
static BufferedSerial serial;

//  GPS parser.  TODO: Support multiple instances.
TinyGPSPlus gps_parser;  //  Shared with sensor.cpp

static struct os_callout rx_callout;
static void rx_event(void *drv);
static void rx_callback(struct os_event *ev);
static const char *compute_checksum(const uint8_t *buf);
static char nibble_to_hex(uint8_t n);

/////////////////////////////////////////////////////////
//  GPS Commands. Refer to "L70-R Series GPS Protocol Specification"

/* Structure of MTK NMEA Packet
"$"           : Each NMEA message starts with ‘$’
"P"           : For proprietary message
"MTK"         : MTK proprietary message
"000" to "999": Packet Type
Data          : Data fields, delimited by comma
"*"           : End of data field
"00" to "FF"  : Checksum, 2 hex digits, Exclusive OR of all characters between "$" and "*"
<CR><LF>      : End of message
Example: $PMTK869,1,1*35<CR><LF>
*/

/// IDs of the GPS commands
enum CommandId {
    //  Sequence MUST match commands[] below.
    FIRST_COMMAND = 0,
    EASY_QUERY,
    EASY_ENABLE,
};

/// List of GPS commands. Exclude the leading "$PMTK" and the trailing "*" and checksum.
static const char *COMMANDS[] = {
    //  Sequence MUST match CommandId.
    "",          //  FIRST_COMMAND
    "869,0",     //  EASY_QUERY
    "869,1,%d",  //  EASY_ENABLE: 0 to disable EASY, 1 to enable EASY
};

/////////////////////////////////////////////////////////
//  Internal Functions

/// Initialise the buffers for the driver
static void internal_init(char *txbuf, uint32_t txbuf_size, char *rxbuf, uint32_t rxbuf_size, 
    char *parserbuf, uint32_t parserbuf_size, bool debug) {
    serial.init(txbuf, txbuf_size, rxbuf, rxbuf_size);
    serial.baud(9600);
}

/// Configure the UART port
static void internal_configure(int uart) {
    serial.configure(uart);
}

/// Attach callback to the UART port
static void internal_attach(void (*func)(void *), void *arg) {
    serial.attach(func, arg);
}

/////////////////////////////////////////////////////////
//  Send Commands

/// Return the GPS command for the command ID.  Excludes the leading "$PMTK" and the trailing "*" and checksum.
static const char *get_command(struct gps_l70r *dev, enum CommandId id) {
    assert(id >= 0);
    assert(id < (sizeof(COMMANDS) / sizeof(COMMANDS[0])));  //  Invalid id
    const char *cmd = COMMANDS[id];
    dev->last_error = id;  //  Set command ID as the last error.
    return cmd;
}

/// Send a GPS command with parameters substituted e.g. cmd=`869,1,1` will send `$PMTK869,1,1*35<CR><LF>`
static bool send_raw_command(struct gps_l70r *dev, const char *cmd) {
    static char raw_buf[64];
    assert(dev);  assert(cmd);  assert(strlen(cmd) + 16 < sizeof(raw_buf));
    //  Structure of MTK NMEA Packet...
    sprintf(raw_buf,
        //  "$"           : Each NMEA message starts with "$"
        "$"
        //  "P"           : For proprietary message
        "P"
        //  "MTK"         : MTK proprietary message
        "MTK"
        //  "000" to "999": Packet Type
        //  Data          : Data fields, delimited by comma
        "%s"
        ,
        cmd
    );
    const char *checksum = compute_checksum((const uint8_t *) raw_buf);  //  Compute the checksum based on the above fields
    //  "*"           : End of data field
    strcat(raw_buf, "*");
    //  "00" to "FF"  : Checksum, 2 hex digits, Exclusive OR of all characters between "$" and "*"
    strcat(raw_buf, checksum);
    //  <CR><LF>      : End of message
    strcat(raw_buf, "\r\n");
    console_printf("GPS> %s", raw_buf);

    //  Write to complete NMEA packet to the GPS UART
    bool res = serial.write(raw_buf, strlen(raw_buf));
    // console_flush();
    return res;
}

/// Send a GPS command with no parameters e.g. `$PMTK869,0*??<CR><LF>`
static bool send_command(struct gps_l70r *dev, enum CommandId id) {
    assert(dev);
    const char *cmd = get_command(dev, id);
    bool res = send_raw_command(dev, cmd);
    // console_flush();
    return res;
}

/*
///  Send a GPS command with 1 int parameter e.g. `$PMTK869,1,1*35<CR><LF>`
static bool send_command_int(struct gps_l70r *dev, enum CommandId id, int arg) {
    static char cmd_buf[64];
    assert(dev);
    const char *cmd = get_command(dev, id);
    assert(cmd);  assert(strlen(cmd) + 16 < sizeof(cmd_buf));
    sprintf(cmd_buf, cmd, arg);
    bool res = send_raw_command(dev, cmd_buf);
    console_flush();
    return res;
}
*/

static const char *compute_checksum(const uint8_t *buf) {
    //  Return a string with 2 hex digits, that is the exclusive OR of all bytes in buf (excluding leading "$").
    assert(buf);
    //  Skip leading "$"
    if (buf[0] == '$') { buf++; }
    //  Exclusive OR the bytes
    uint8_t checksum = 0;
    for (;;) {
        if (*buf == 0) { break; }
        checksum = checksum ^ *buf;
        buf++;
    }
    //  Convert checksum to text.
    static char checksum_str[3];
    checksum_str[0] = nibble_to_hex(checksum >> 4);
    checksum_str[1] = nibble_to_hex(checksum & 0xf);
    checksum_str[2] = 0;
    return checksum_str;
}

/////////////////////////////////////////////////////////
//  Device Creation Functions

/// If first time we are opening the driver: Prepare the GPS_L70R transceiver for use.  Lock the UART port.
static int gps_l70r_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    if (!first_open) { console_printf("[\n"); return 0; }  ////
    first_open = false;
    console_printf("[\n");  ////
    assert(dev0);
    struct gps_l70r *dev = (struct gps_l70r *) dev0;
    struct gps_l70r_cfg *cfg = &dev->cfg;

    //  Set the buffers for the C++ instance. We pass in static buffers to avoid dynamic memory allocation (new, delete).
    internal_init(
        gps_l70r_tx_buffer, GPS_L70R_TX_BUFFER_SIZE,
        gps_l70r_rx_buffer, GPS_L70R_RX_BUFFER_SIZE,
        gps_l70r_parser_buffer, GPS_L70R_PARSER_BUFFER_SIZE,
        false
    );
    internal_configure(cfg->uart);         //  Configure the UART port.  0 means UART2, 1 means UART1.
    internal_attach(&rx_event, dev);    //  Set the callback for GPS_L70R events.
    return 0;
}

/// Shutdown the GPS transceiver.  Unlock the UART port.
static int gps_l70r_close(struct os_dev *dev0) {
    //  TODO: Undo driver.init(), driver.configure() and driver.attach()
    console_printf("]\n");  // console_flush();  ////
    assert(dev0);
    return 0;
}

int gps_l70r_init(struct os_dev *dev0, void *arg) {
    //  Configure the GPS driver.  Called by os_dev_create().  Return 0 if successful.
    struct gps_l70r *dev;
    int rc;
    if (!arg || !dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct gps_l70r *) dev0;  assert(dev);

    //  Configure the driver as a Mynewt Sensor so that it may be used with the Mynewt Sensor Framework
    rc = gps_l70r_sensor_init(dev, arg);  assert(rc == 0);

    //  Register the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, gps_l70r_open, gps_l70r_close);

    return (OS_OK);
err:
    return rc;
}

int gps_l70r_default_cfg(struct gps_l70r_cfg *cfg) {
    //  Copy the default GPS_L70R config into cfg.  Returns 0.
    memset(cfg, 0, sizeof(struct gps_l70r_cfg));  //  Zero the entire object.
    cfg->uart = MYNEWT_VAL(GPS_L70R_UART);  //  0 for UART2, 1 for UART1.

    //  Copy the default sensor config.
    int rc = gps_l70r_sensor_default_cfg(cfg);  assert(rc == 0);
    return 0;
}

int gps_l70r_config(struct gps_l70r *drv, struct gps_l70r_cfg *cfg) {
    //  Copy the GPS_L70R driver configuration from cfg into drv.  Return 0 if successful.
    struct gps_l70r_cfg *drv_cfg = &drv->cfg;

    //  Configure the UART port.  0 means UART2, 1 means UART1.
    drv_cfg->uart = cfg->uart;    
    assert(drv_cfg->uart == MYNEWT_VAL(GPS_L70R_UART));
    internal_configure(drv_cfg->uart);

    //  Configure the GPS sensor.
    int rc = gps_l70r_sensor_config(drv, cfg);  assert(rc == 0);
    return 0;
}

/////////////////////////////////////////////////////////
//  GPS_L70R Driver Interface

int gps_l70r_start(void) {
    //  Start the GPS driver. Return 0 if successful.
    //  device_name is the GPS_L70R device name e.g. "gps_l70r_0".
    const char *device_name = GPS_L70R_DEVICE;
    assert(device_name);

    //  Init the callout to handle received UART data.
    os_callout_init(&rx_callout, os_eventq_dflt_get(), rx_callback, NULL);

#if MYNEWT_VAL(GPS_L70R_ENABLE_PIN) >= 0
    //  Enable GPS module: Set PA1 to high for Ghostyu L476 dev kit
    hal_gpio_init_out(MYNEWT_VAL(GPS_L70R_ENABLE_PIN), 0);
#endif  //  GPS_L70R_ENABLE_PIN

    {   //  Lock the GPS_L70R driver for exclusive use.  Find the GPS_L70R device by name.
        struct gps_l70r *dev = (struct gps_l70r *) os_dev_open(device_name, OS_TIMEOUT_NEVER, NULL);  //  GPS_L70R_DEVICE is "gps_l70r_0"
        assert(dev != NULL);

        if (!power_standby_wakeup()) {
            //  At power on, connect to NB-IoT network.  This may take a while to complete (or fail), thus we
            //  need to run this in the Network Task in background.  The Main Task will run the Event Loop
            //  to pass GPS_L70R events to this function.
            int rc = gps_l70r_connect(dev);
            assert(rc == 0);
        }

        //  Close the GPS_L70R device when we are done.
        os_dev_close((struct os_dev *) dev);
        //  Unlock the GPS_L70R driver for exclusive use.
    }

    //  Set the LED for output: PC13. TODO: Super Blue Pill uses a different pin for LED.
    hal_gpio_init_out(LED_BLINK_PIN, 1);

    return 0;
}

int gps_l70r_connect(struct gps_l70r *dev) {
    //  Connect to the GPS module. Return 0 if successful.
    serial.prime();  //  Start transmitting and receiving on UART port
    serial.write("\r\n\r\n", 4);
    send_command(dev, EASY_QUERY);  //  Get EASY status
    ////send_command_int(dev, EASY_ENABLE, 1);  //  Enable EASY to accelerate TTFF by predicting satellite navigation messages from received ephemeris
    return 0;
}

static void rx_event(void *drv) {
    //  Interrupt callback when we receive data on the GPS UART. Fire a callout to handle the received data.
    //  This is called by the Interrupt Service Routine, don't do any processing here.
    os_callout_reset(&rx_callout, 0);  //  Trigger the callout
}

static void rx_callback(struct os_event *ev) {
    //  Callout that is invoked we receive data on the GPS UART.  Parse the received data.
    while (serial.readable()) {
        int ch = serial.getc(0);  //  Note: this will block if there is nothing to read.
        gps_parser.encode(ch);  //  Parse the GPS data.
        // if (ch != '\r') { char buf[1]; buf[0] = (char) ch; console_buffer(buf, 1); } ////
        // if (ch == '\n') { console_flush(); } ////
    }
/*
    if (gps_parser.location.isUpdated()) {
        console_printf("*** lat: "); console_printdouble(gps_parser.location.lat());
        console_printf(" / lng: ");  console_printdouble(gps_parser.location.lng());
        console_printf(" / alt: ");  console_printfloat(gps_parser.altitude.meters());
        console_printf("\n"); // console_flush(); ////
    } else 
*/
    if (gps_parser.satellites.isUpdated()) {
        static uint32_t lastSat = 0;
        uint32_t sat = gps_parser.satellites.value();
        if (sat != lastSat) {
            lastSat = sat;
            console_printf("GPS satellites: %ld\n", sat); // console_flush(); ////
        }
    }
}

/// Given n=0..15, return '0'..'F'.
static char nibble_to_hex(uint8_t n) {
    return (n < 10)
        ? '0' + n
        : 'A' + n - 10;
}