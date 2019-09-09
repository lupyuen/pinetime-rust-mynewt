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

//  Controller buffers.  TODO: Support multiple instances.
static char gps_l70r_tx_buffer[GPS_L70R_TX_BUFFER_SIZE];  //  TX Buffer
static char gps_l70r_rx_buffer[GPS_L70R_RX_BUFFER_SIZE];  //  RX Buffer
static char gps_l70r_parser_buffer[GPS_L70R_PARSER_BUFFER_SIZE];  //  Buffer for ATParser
static bool first_open = true;  //  True if this is the first time opening the driver

//  Buffered serial port. TODO: Support multiple instances.
static BufferedSerial serial;

//  GPS parser.  TODO: Support multiple instances.
static TinyGPSPlus parser;

/////////////////////////////////////////////////////////
//  AT Functions

/// IDs of the AT commands
enum CommandId {
    //  Sequence MUST match commands[] below.
    FIRST_COMMAND = 0,

    //  [0] Prepare to transmit
    NCONFIG,    //  configure
    QREGSWT,    //  huawei
    NRB,        //  reboot

    //  [1] Attach to network
    NBAND,          //  select band
    CFUN_ENABLE,    //  enable network function
    CFUN_DISABLE,   //  disable network function
    CFUN_QUERY,     //  query functions
    CEREG,          //  network registration
    CEREG_QUERY,    //  query registration
    CGATT,          //  attach network
    CGATT_QUERY,    //  query attach

    //  [2] Transmit message
    NSOCR,   //  allocate port

    //  [3] Receive response
    NSORF,  //  receive msg
    NSOCL,  //  close port

    //  [4] Diagnostics
    CGPADDR,   //  IP address
    NUESTATS,  //  network stats
};

/// List of AT commands
static const char *COMMANDS[] = {
    //  Sequence MUST match CommandId.
    "",  //  FIRST_COMMAND

    //  [0] Prepare to transmit
    "NCONFIG=AUTOCONNECT,FALSE",  //  NCONFIG: configure
    "QREGSWT=2",    //  QREGSWT: huawei
    "NRB",          //  NRB: reboot

    //  [1] Attach to network
    "NBAND=%d", //  NBAND: select band
    "CFUN=1",   //  CFUN_ENABLE: enable network function
    "CFUN=0",   //  CFUN_DISABLE: disable network function
    "CFUN?",    //  CFUN_QUERY: query functions
    "CEREG=0",  //  CEREG: network registration
    "CEREG?",   //  CEREG_QUERY: query registration
    "CGATT=1",  //  CGATT: attach network
    "CGATT?",   //  CGATT_QUERY: query attach

    //  [2] Transmit message
    "NSOCR=DGRAM,17,0,1",  //  NSOCR: allocate port

    //  [3] Receive response
    "NSORF=1,%d",  //  NSORF: receive msg
    "NSOCL=%d",  //  NSOCL: close port

    //  [4] Diagnostics
    "CGPADDR",   //  CGPADDR: IP address
    "NUESTATS",  //  NUESTATS: network stats
};

/// Prefix for all commands: `AT+`
static const char ATP[] = "AT+";

/////////////////////////////////////////////////////////
//  Internal Functions

/// Initialise the buffers for the driver
static void internal_init(char *txbuf, uint32_t txbuf_size, char *rxbuf, uint32_t rxbuf_size, 
    char *parserbuf, uint32_t parserbuf_size, bool debug) {
    serial.init(txbuf, txbuf_size, rxbuf, rxbuf_size);
    parser.init(serial, parserbuf, parserbuf_size);
    packets = 0;
    packets_end = &packets;
    serial.baud(9600);  //  TODO: Increase the bitrate
    parser.debugOn(debug);
}

/// Configure the UART port
static void internal_configure(int uart) {
    serial.configure(uart);
}

/// Attach to the UART port
static void internal_attach(void (*func)(void *), void *arg) {
    serial.attach(func, arg);
}

/// Set the response timeout
static void internal_timeout(uint32_t timeout_ms) {
    parser.setTimeout(timeout_ms);
}

/////////////////////////////////////////////////////////
//  Send AT Commands

/// Return the command for the command ID.  Excludes the `AT+`.
static const char *get_command(struct gps_l70r *dev, enum CommandId id) {
    assert(id >= 0);
    assert(id < (sizeof(COMMANDS) / sizeof(COMMANDS[0])));  //  Invalid id
    const char *cmd = COMMANDS[id];
    dev->last_error = id;  //  Set command ID as the last error.
    return cmd;
}

/// Send `AT+`.
static bool send_atp(struct gps_l70r *dev) {
    return parser.write(ATP, sizeof(ATP) - 1) > 0;
}

/// Expect `OK` as the response for each command and query.
static bool expect_ok(struct gps_l70r *dev) {
    return parser.recv("OK");
}

/// Send an AT command with no parameters.
static bool send_command(struct gps_l70r *dev, enum CommandId id) {
    const char *cmd = get_command(dev, id);
    //debug_gps_l70r = 1;  ////
    bool res = (
        send_atp(dev) &&
        parser.send(cmd) &&
        expect_ok(dev)
    );
    //debug_gps_l70r = 0;  ////
    console_flush();
    return res;
}

///  Send an AT command with 1 int parameter e.g. `AT+NSOCL=1`
static bool send_command_int(struct gps_l70r *dev, enum CommandId id, int arg) {
    const char *cmd = get_command(dev, id);
    bool res = (
        send_atp(dev) &&
        parser.send(cmd, arg) &&
        expect_ok(dev)
    );
    //console_flush();
    return res;
}

/// Send an AT query like `AT+CGATT?` or `AT+CEREG?`. Parse the comma-delimited result and return the parsed result.
/// If `res1` is non-null and `res2` is null and the response is `=+CGATT:1` then `res1` is set to 1.
/// If `res1` and `res2` are both non-null and the response is `=+CEREG:0,1` then `res1` is set to 0 and `res2` is set to 1.
static bool send_query(struct gps_l70r *dev, enum CommandId id, int *res1, int *res2) {
    assert(res1);
    const char *cmd = get_command(dev, id);
    char cmd_response[17];  memset(cmd_response, 0, sizeof(cmd_response));
    *res1 = -1; 
    if (res2) { *res2 = -1; }
    //debug_gps_l70r = 1;  ////
    bool res = (
        send_atp(dev) &&
        //  For `recv()` format string, see http://www.cplusplus.com/reference/cstdio/scanf/
        parser.send(cmd) && (
            (res2 == NULL)  //  Expecting 1 or 2 results?
            //  If 1 result: Match a response like `=+CGATT:1`. `cmd_response` will be set to `CGATT` after matching `%16[^:]`
            ? parser.recv("+%16[^:]:%d", cmd_response, res1)  //  Note: cmd is max 16 chars
            //  If 2 results: Match a response like `=+CEREG:0,1`. `cmd_response` will be set to `CEREG` after matching `%16[^:]`
            : parser.recv("+%16[^:]:%d,%d", cmd_response, res1, res2)  //  Note: cmd is max 16 chars
            // : parser.recv("+CEREG:%d,%d", &arg1, &arg2)
        ) &&
        expect_ok(dev)
    );
    //debug_gps_l70r = 0;  ////
    console_flush();
    //asm("bkpt"); ////
    return res;
}

/// Send an AT query like `AT+NSOCR=DGRAM,17,0,1`. Return the parsed result, which contains 1 integer.
static bool send_query_int(struct gps_l70r *dev, enum CommandId id, int *result) {
    assert(result);
    const char *cmd = get_command(dev, id);
    *result = -1;
    //debug_gps_l70r = 1;  ////
    bool res = {
        send_atp(dev) &&
        parser.send(cmd) &&
        parser.recv("%d", result) &&
        expect_ok(dev)
    };
    //debug_gps_l70r = 0;  ////
    console_flush();
    //asm("bkpt"); ////
    return res;
}

/////////////////////////////////////////////////////////
//  Device Creation Functions

/// Return the GPS_L70R Config
static gps_l70r_cfg *cfg(struct gps_l70r *dev) { return &dev->cfg; }
static void gps_l70r_event(void *drv);

/// If first time we are opening the driver: Prepare the GPS_L70R transceiver for use.  Lock the UART port.
static int gps_l70r_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    if (!first_open) { console_printf("[\n"); return 0; }  ////
    first_open = false;
    console_printf("[\n");  ////
    assert(dev0);
    struct gps_l70r *dev = (struct gps_l70r *) dev0;
    struct gps_l70r_cfg *cfg = &dev->cfg;

    //  Erase the socket info.
    memset(cfg->sockets, 0, sizeof(cfg->sockets));

    //  Set the buffers for the C++ instance. We pass in static buffers to avoid dynamic memory allocation (new, delete).
    internal_init(
        gps_l70r_tx_buffer, GPS_L70R_TX_BUFFER_SIZE,
        gps_l70r_rx_buffer, GPS_L70R_RX_BUFFER_SIZE,
        gps_l70r_parser_buffer, GPS_L70R_PARSER_BUFFER_SIZE,
        false
    );
    internal_configure(cfg->uart);         //  Configure the UART port.  0 means UART2, 1 means UART1.
    internal_attach(&gps_l70r_event, dev);    //  Set the callback for GPS_L70R events.
    return 0;
}

/// Shutdown the GPS_L70R transceiver.  Unlock the UART port.
static int gps_l70r_close(struct os_dev *dev0) {
    //  TODO: Undo driver.init(), driver.configure() and driver.attach()
    console_printf("]\n");  console_flush();  ////
    assert(dev0);
    return 0;
}

int gps_l70r_init(struct os_dev *dev0, void *arg) {
    //  Configure the GPS_L70R driver.  Called by os_dev_create().  Return 0 if successful.
    struct gps_l70r *dev;
    int rc;
    if (!arg || !dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct gps_l70r *) dev0;  assert(dev);

    //  Register the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, gps_l70r_open, gps_l70r_close);

    //  Register the Sensor Network Interface.
    rc = sensor_network_register_interface(&network_iface);
    assert(rc == 0);

    return (OS_OK);
err:
    return rc;
}

int gps_l70r_default_cfg(struct gps_l70r_cfg *cfg) {
    //  Copy the default GPS_L70R config into cfg.  Returns 0.
    memset(cfg, 0, sizeof(struct gps_l70r_cfg));  //  Zero the entire object.
    cfg->uart = MYNEWT_VAL(GPS_L70R_UART);  //  0 for UART2, 1 for UART1.
    return 0;
}

int gps_l70r_config(struct gps_l70r *drv, struct gps_l70r_cfg *cfg) {
    //  Copy the GPS_L70R driver configuration from cfg into drv.  Return 0 if successful.
    struct gps_l70r_cfg *drv_cfg = &drv->cfg;
    drv_cfg->uart = cfg->uart;    
    assert(drv_cfg->uart == MYNEWT_VAL(GPS_L70R_UART));
    internal_configure(drv_cfg->uart);  //  Configure the UART port.  0 means UART2, 1 means UART1.
    return 0;
}

static int register_transport(const char *network_device, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size) {
    //  Called by Sensor Network Interface to register the transport.
    assert(server_endpoint_size >= sizeof(struct gps_l70r_server));  //  Server Endpoint too small
    int rc = gps_l70r_register_transport(network_device, (struct gps_l70r_server *) server_endpoint, host, port);
    return rc;
}

/////////////////////////////////////////////////////////
//  GPS_L70R Driver Interface

int gps_l70r_start(void) {
    //  device_name is the GPS_L70R device name e.g. "gps_l70r_0".
    const char *device_name = GPS_L70R_DEVICE;
    assert(device_name);

    ////  TODO: Enable NB-IoT module at PA0.
    ////hal_gpio_init_out(MCU_GPIO_PORTA(0), 1);

    {   //  Lock the GPS_L70R driver for exclusive use.  Find the GPS_L70R device by name.
        network_is_busy = 1;  //  Tell the Task Scheduler not to sleep (because it causes dropped UART response)
        struct gps_l70r *dev = (struct gps_l70r *) os_dev_open(device_name, OS_TIMEOUT_NEVER, NULL);  //  GPS_L70R_DEVICE is "gps_l70r_0"
        assert(dev != NULL);

        if (!power_standby_wakeup()) {
            //  At power on, connect to NB-IoT network.  This may take a while to complete (or fail), thus we
            //  need to run this in the Network Task in background.  The Main Task will run the Event Loop
            //  to pass GPS_L70R events to this function.
            rc = gps_l70r_connect(dev);
            assert(rc == 0);
        }

        //  Close the GPS_L70R device when we are done.
        os_dev_close((struct os_dev *) dev);
        //  Unlock the GPS_L70R driver for exclusive use.
        network_is_busy = 0;  //  Tell the Task Scheduler it's OK to sleep.
    }

    //  Set the LED for output: PC13. TODO: Super Blue Pill uses a different pin for LED.
    hal_gpio_init_out(LED_BLINK_PIN, 1);

    return 0;
}

/// Callback for GPS_L70R events
static void gps_l70r_event(void *drv) {
#ifdef TODO
    for (int i = 0; i < GPS_L70R_SOCKET_COUNT; i++) {
        if (_cbs[i].callback) {
            _cbs[i].callback(_cbs[i].data);
        }
    }
#endif  //  TODO
}

/// Sleep for the specified number of seconds
static bool sleep(uint16_t seconds) {
    os_time_delay(seconds * OS_TICKS_PER_SEC);
    return true;
}

/// Wait for NB-IoT network registration
static bool wait_for_registration(struct gps_l70r *dev) {
    //  Set the LED for output: PC13. TODO: Super Blue Pill uses a different pin for LED.
    hal_gpio_init_out(LED_BLINK_PIN, 1);
    for (uint8_t i = 0; i < MAX_REGISTRATION_RETRIES; i++) {
        //  Response contains 2 integers: `code` and `status` e.g. `=+CEREG:0,1`
        int code = -1, status = -1;
        //  CEREG_QUERY: query registration
        bool res = send_query(dev, CEREG_QUERY, &code, &status);
        if (!res) { return false; }  //  If send failed, quit.
        assert(status >= 0);

        //  If registered to network, response should be `=+CEREG:0,1` i.e. `status` should be 1
        if (status == 1) { return true; }  //  If registered, exit.

        //  If not yet registered to network, `status` will be 2 and we should recheck in a while.
        //  Wait 2 seconds and retry.        
        hal_gpio_toggle(LED_BLINK_PIN);  //  Blink the LED.
        console_flush();
        sleep(2);
    }
    return false;  //  Not registered after retries, quit.
}

/// Wait for NB-IoT network to be attached
static bool wait_for_attach(struct gps_l70r *dev) {
    for (uint8_t i = 0; i < MAX_ATTACH_RETRIES; i++) {
        //  Response contains 1 integer: `state` e.g. `=+CGATT:1`
        int state = -1;
        //  CGATT_QUERY: query attach
        bool res = send_query(dev, CGATT_QUERY, &state, NULL);
        if (!res) { return false; }  //  If send failed, quit.
        assert(state >= 0);

        //  If attached to network, response should be `=+CGATT:1` i.e. `state` should be 1
        if (state == 1) { return true; }  //  If attached, exit.

        //  If not yet attached to network, `state` will be 0 and we should recheck in a while.
        //  Wait 2 seconds and retry.
        console_flush();
        sleep(2);
    }
    return false;  //  Not attached after retries, quit.
}

/// At startup, keep sending AT and wait for module to respond OK. This skips the ERROR response at startup.
static bool wait_for_ok(struct gps_l70r *dev) {
    bool res = false;
    //  Send ATE0 to disable echo and check for OK response.
    res = (
        parser.send("ATE0") &&
        parser.recv("OK")
    );
    //  If OK received, flush the response and continue to next command.
    if (res) { parser.flush(); return true; }

    //  Send ATE0 to disable echo and check for OK response.  Insert "\r\n" in case there was a previous command.
    res = (
        parser.send("\r\nATE0") &&
        parser.recv("OK")
    );
    //  If OK received, flush the response and continue to next command.
    if (res) { parser.flush(); return true; }

    for (uint8_t i = 0; i < 20; i++) {
        //  Send ATE0 to disable echo and check for OK response.
        res = (
            parser.send("ATE0") &&
            parser.recv("OK")
        );
        //  If OK received, flush the response and continue to next command.
        if (res) { parser.flush(); return true; }        
        //  Wait 1 second and retry.
        console_flush();
        sleep(1);
    }
    return false;  //  Can't get OK after 20 retries, quit.
}

/// [Phase 0] Prepare to transmit
static bool prepare_to_transmit(struct gps_l70r *dev) {
    return (
        //  At startup, skip the ERROR response and wait for OK.
        wait_for_ok(dev) &&

        //  NCONFIG: configure
        send_command(dev, NCONFIG) &&
        //  QREGSWT: huawei
        send_command(dev, QREGSWT) &&
        //  NRB: reboot
        send_command(dev, NRB) &&

        //  Reboot will take longer than other commands. We wait then flush.
        parser.send("AT") &&
        expect_ok(dev) &&
        (parser.flush() == 0) &&

        //  NBAND: select band. Configure `NBIOT_BAND` in `targets/bluepill_my_sensor/syscfg.yml`
        send_command_int(dev, NBAND, MYNEWT_VAL(NBIOT_BAND))
    );
}

/// [Phase 1] Attach to network
static bool attach_to_network(struct gps_l70r *dev) {
    return (        
        //  At wakeup, skip the ERROR response and wait for OK.
        wait_for_ok(dev) &&

        //  CFUN_QUERY: query network function
        send_command(dev, CFUN_QUERY) &&

        //  CFUN_ENABLE: enable network function
        send_command(dev, CFUN_ENABLE) &&

        //  CGATT: attach network
        send_command(dev, CGATT) &&
        //send_command(dev, CGATT_QUERY) &&

        //  CEREG: network registration
        send_command(dev, CEREG) &&
        //send_command(dev, CEREG_QUERY) &&

        //  CEREG_QUERY: query registration
        wait_for_registration(dev) &&

        //  CGATT_QUERY: query attach
        wait_for_attach(dev) &&

        true
    );
}

int gps_l70r_connect(struct gps_l70r *dev) {
    //  Connect to the NB-IoT network.  Return 0 if successful.
    internal_timeout(GPS_L70R_CONNECT_TIMEOUT);
    return (
        //  [Phase 0] Prepare to transmit
        prepare_to_transmit(dev)
    ) ? 0 : dev->last_error;
}

int gps_l70r_attach(struct gps_l70r *dev) {
    //  Attach to the NB-IoT network.  Return 0 if successful.
    internal_timeout(GPS_L70R_CONNECT_TIMEOUT);
    return (        
        //  [Phase 1] Attach to network
        attach_to_network(dev)
    ) ? 0 : dev->last_error;
}

int gps_l70r_detach(struct gps_l70r *dev) {
    //  Detach from the NB-IoT network.  Return 0 if successful.
    internal_timeout(GPS_L70R_CONNECT_TIMEOUT);
    return (
        //  CFUN_DISABLE: disable network function
        send_command(dev, CFUN_DISABLE)
    ) ? 0 : dev->last_error;
}

int gps_l70r_socket_open(struct gps_l70r *dev, struct gps_l70r_socket **socket_ptr) {
    //  Allocate a socket and save to `socket_ptr`.  Return 0 if successful.
    //  [Phase 2A] Allocate port
    int local_port = 0;
    //  NSOCR: allocate port
    internal_timeout(GPS_L70R_MISC_TIMEOUT);
    bool res = send_query_int(dev, NSOCR, &local_port);
    if (!res) { return dev->last_error; }
    assert(local_port > 0);

    //  Store into first socket.
    gps_l70r_socket *socket = &cfg(dev)->sockets[0];
    socket->local_port = (uint16_t) local_port;
    *socket_ptr = socket;
    return 0;
}

int gps_l70r_socket_close(struct gps_l70r *dev, struct gps_l70r_socket *socket) {
    //  Close the socket.  Return 0 if successful.
    assert(socket && socket == &cfg(dev)->sockets[0]);
    internal_timeout(GPS_L70R_MISC_TIMEOUT);
    int local_port = socket->local_port;
    assert(local_port > 0);
    //  NSOCL: close port
    bool res = send_command_int(dev, NSOCL, local_port);
    if (!res) { return dev->last_error; }
    //  Erase the socket.
    memset(socket, 0, sizeof(gps_l70r_socket));
    return 0;
}

/// Given n=0..15, return '0'..'f'.
static char nibble_to_hex(uint8_t n) {
    return (n < 10)
        ? '0' + n
        : 'a' + n - 10;
}

/// Send the data as hex digits.
static bool send_hex(struct gps_l70r *dev, const uint8_t *data, uint16_t size) {
    console_dump(data, size); console_printf("\n");
    char hex[2];
    for (uint16_t i = 0; i < size; i++) {
        uint8_t b = data[i];
        hex[0] = nibble_to_hex(b >> 4);
        hex[1] = nibble_to_hex(b & 0xf);
        int res = parser.write(hex, 2);
        if (res <= 0) { return false; }
    }
    return true;
}

/// Send the `data` buffer if `data` is non-null, or the chain of mbufs.
static bool send_data(struct gps_l70r *dev, const uint8_t *data, uint16_t length, struct os_mbuf *mbuf) {
    if (data && length > 0) {
        //  Send the data buffer as hex digits.
        return send_hex(dev, data, length);
    }
    //  Send the mbuf chain.
    assert(mbuf);
    uint32_t chain_size = OS_MBUF_PKTLEN(mbuf);  //  Length of the mbuf chain.
    const char *_f = "send mbuf";
    console_printf("%s%s %u...\n", _nbt, _f, (unsigned) chain_size);  console_flush();
    struct os_mbuf *m = mbuf;
    bool result = true;
    while (m) {  //  Send each mbuf in the chain.
        const uint8_t *data = OS_MBUF_DATA(m, const uint8_t *);  //  Fetch the mbuf data.
        uint16_t size = m->om_len;  //  Fetch the size for the single mbuf.
        bool res = send_hex(dev, data, size);
        if (!res) { result = false; break; }
        m = m->om_next.sle_next;   //  Fetch next mbuf in the list.
    }
    _log(_f, result);
    return result;
}

/// Transmit the `data` buffer if `data` is non-null, or the chain of mbufs.  Return number of bytes sent.
static int send_tx_command(struct gps_l70r *dev, struct gps_l70r_socket *socket, const char *host, uint16_t port, 
    const uint8_t *data, uint16_t length, uint8_t sequence, struct os_mbuf *mbuf) {
    uint16_t local_port = socket->local_port;
    int local_port_response = -1, length_response = -1;
#ifdef TRANSMIT_FLAGS
    console_printf("AT> NSOSTF=%d,%s,%d,%s,%d,\n", local_port, host, port, TRANSMIT_FLAGS, length);
#else
    console_printf("AT> NSOST=%d,%s,%d,%d,\n",     local_port, host, port, length);
#endif  //  TRANSMIT_FLAGS
    internal_timeout(GPS_L70R_SEND_TIMEOUT);
    bool res = (
        send_atp(dev) &&  //  Will pause between commands.
#ifdef TRANSMIT_FLAGS
        parser.printf("NSOSTF=%d,%s,%d,%s,%d,",
            local_port, host, port, TRANSMIT_FLAGS, length) &&
#else
        parser.printf("NSOST=%d,%s,%d,%d,",
            local_port, host, port, length) &&
#endif  //  TRANSMIT_FLAGS
        send_data(dev, data, length, mbuf) &&
        parser.send(",%d", sequence) &&
        parser.recv("%d,%d", &local_port_response, &length_response) &&
        parser.recv("OK")
    );
    return res ? length : 0;
}

int gps_l70r_socket_tx(struct gps_l70r *dev, struct gps_l70r_socket *socket, const char *host, uint16_t port, const uint8_t *data, uint16_t length, uint8_t sequence) {
    //  Transmit the buffer through the socket.  `length` is the number of bytes in `data`.  `sequence` is a running message sequence number 1 to 255.  Return number of bytes transmitted.
    return send_tx_command(dev, socket, host, port, data, length, sequence, NULL);
}

int gps_l70r_socket_tx_mbuf(struct gps_l70r *dev, struct gps_l70r_socket *socket, const char *host, uint16_t port, uint8_t sequence, struct os_mbuf *mbuf) {
    //  Transmit the chain of mbufs through the socket.  `sequence` is a running message sequence number 1 to 255.  Return number of bytes transmitted.
    uint16_t length = OS_MBUF_PKTLEN(mbuf);  //  Length of the mbuf chain.
    return send_tx_command(dev, socket, host, port, NULL, length, sequence, mbuf);
}
