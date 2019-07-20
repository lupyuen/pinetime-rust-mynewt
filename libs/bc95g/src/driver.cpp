//  BC95-G Driver for Apache Mynewt.  Functions for creating the driver instance and performing BC95-G functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
//  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//  fixes response parsing bugs.  The patched file must be present in that location.
#include <os/os.h>
#include <sensor/sensor.h>
#include <console/console.h>
#include <sensor_network/sensor_network.h>
#include "bc95g/bc95g.h"
#include "bc95g/transport.h"
#include "util.h"
#include "ATParser.h"

static int register_transport(const char *network_device, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size);

//  Controller buffers.  TODO: Support multiple instances.
static char bc95g_tx_buffer[BC95G_TX_BUFFER_SIZE];  //  TX Buffer
static char bc95g_rx_buffer[BC95G_RX_BUFFER_SIZE];  //  RX Buffer
static char bc95g_parser_buffer[BC95G_PARSER_BUFFER_SIZE];  //  Buffer for ATParser
static bool first_open = true;  //  True if this is the first time opening the driver

//  Controller objects. TODO: Support multiple instances.
static BufferedSerial serial;
static ATParser parser;
static struct packet {
    struct packet *next;
    int id;
    uint32_t len;
    // data follows
} *packets, **packets_end;
//  static char ip_buffer[16];

//  Definition of BC95G Sensor Network Interface
static const struct sensor_network_interface network_iface = {
    SERVER_INTERFACE_TYPE,         //  uint8_t iface_type; Interface Type: Server or Collector
    BC95G_DEVICE,                  //  const char *network_device; Network device name.  Must be a static string.
    sizeof(struct bc95g_server),   //  uint8_t server_endpoint_size; Server Endpoint size
    register_transport,            //  int (*register_transport_func)(const char *network_device0, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size);  //  Register transport function
};

/////////////////////////////////////////////////////////
//  AT Functions. Refer to https://medium.com/@ly.lee/get-started-with-nb-iot-and-quectel-modules-6e7c581e0d61

enum CommandId {
    //  Sequence MUST match commands[] below.
    FIRST_COMMAND = 0,

    //  [0] Prepare to transmit
    NCONFIG,    //  configure
    QREGSWT,    //  huawei
    NRB,        //  reboot

    //  [1] Attach to network
    NBAND,          //  select band
    CFUN,           //  enable functions
    CFUN_QUERY,     //  query functions
    CEREG,          //  network registration
    CEREG_QUERY,    //  query registration
    CGATT,          //  attach network
    CGATT_QUERY,    //  query attach

    //  [2] Transmit message
    NSOCR,  //  allocate port
    NSOST,  //  transmit

    //  [3] Receive response
    NSORF,  //  receive msg
    NSOCL,  //  close port

    //  [4] Diagnostics
    CGPADDR,   //  IP address
    NUESTATS,  //  network stats
};

static const char *COMMANDS[] = {
    //  Sequence MUST match CommandId.
    "",  //  FIRST_COMMAND

    //  [0] Prepare to transmit
    "NCONFIG=AUTOCONNECT,FALSE",  //  NCONFIG: configure
    "QREGSWT=2",    //  QREGSWT: huawei
    "NRB",          //  NRB: reboot

    //  [1] Attach to network
    "NBAND=8",  //  NBAND: select band
    "CFUN=1",   //  CFUN: enable functions
    "CFUN?",    //  CFUN_QUERY: query functions
    "CEREG=0",  //  CEREG: network registration
    "CEREG?",   //  CEREG_QUERY: query registration
    "CGATT=1",  //  CGATT: attach network
    "CGATT?",   //  CGATT_QUERY: query attach

    //  [2] Transmit message
    "NSOCR=DGRAM,17,0,1",  //  NSOCR: allocate port
    "NSOST=%d,%s,%d,%d,%s,%d",  //  NSOST: transmit

    //  [3] Receive response
    "NSORF=1,%d",  //  NSORF: receive msg
    "NSOCL=1,%d",  //  NSOCL: close port

    //  [4] Diagnostics
    "CGPADDR",   //  CGPADDR: IP address
    "NUESTATS",  //  NUESTATS: network stats
};

static const char ATP[] = "AT+";

/////////////////////////////////////////////////////////
//  Internal Functions

static void internal_init(char *txbuf, uint32_t txbuf_size, char *rxbuf, uint32_t rxbuf_size, 
    char *parserbuf, uint32_t parserbuf_size, bool debug) {
    serial.init(txbuf, txbuf_size, rxbuf, rxbuf_size);
    parser.init(serial, parserbuf, parserbuf_size);
    packets = 0;
    packets_end = &packets;
    serial.baud(9600);  //  TODO: Increase the bitrate
    parser.debugOn(debug);
}

static void internal_configure(int uart) {
    serial.configure(uart);
}

static void internal_attach(void (*func)(void *), void *arg) {
    serial.attach(func, arg);
}

static void internal_timeout(uint32_t timeout_ms) {
    parser.setTimeout(timeout_ms);
}

/////////////////////////////////////////////////////////
//  Send AT Commands

static const char *get_command(struct bc95g *dev, enum CommandId id) {
    //  Return the command for the command ID.  Excludes the `AT+`.
    assert(id >= 0);
    assert(id < (sizeof(COMMANDS) / sizeof(COMMANDS[0])));  //  Invalid id
    const char *cmd = COMMANDS[id];
    dev->last_error = id;  //  Set command ID as the last error.
    return cmd;
}

static bool send_atp(struct bc95g *dev) {
    //  Send `AT+`.
    //  Wait a while between commands.
    os_time_delay(1 * OS_TICKS_PER_SEC); ////
    return parser.write(ATP, sizeof(ATP) - 1) > 0;
}

static bool expect_ok(struct bc95g *dev) {
    //  Expect `OK` as the response for each command and query.
    return parser.recv("OK");
}

static bool send_command(struct bc95g *dev, enum CommandId id) {
    //  Send an AT command with no parameters.
    const char *cmd = get_command(dev, id);
    //debug_bc95g = 1;  ////
    bool res = (
        send_atp(dev) &&
        parser.send(cmd) &&
        expect_ok(dev)
    );
    //debug_bc95g = 0;  ////
    console_flush();
    return res;
}

static bool send_command_int(struct bc95g *dev, enum CommandId id, int arg) {
    //  Send an AT command with 1 int parameter e.g. `AT+NSOCL=1`
    const char *cmd = get_command(dev, id);
    bool res = (
        send_atp(dev) &&
        parser.send(cmd, arg) &&
        expect_ok(dev)
    );
    //console_flush();
    return res;
}

#ifdef NOTUSED
static bool send_command_int_int(struct bc95g *dev, enum CommandId id, int arg1, int arg2) {
    //  Send an AT command with 2 int parameters e.g. `AT+NSORF=1,35`
    const char *cmd = get_command(dev, id);
    bool res = (
        send_atp(dev) &&
        parser.send(cmd, arg1, arg2) &&
        expect_ok(dev)
    );
    return res;
}
#endif  //  NOTUSED

static bool send_query(struct bc95g *dev, enum CommandId id, int *res1, int *res2) {
    //  Send an AT query like `AT+CGATT?` or `AT+CEREG?`. Parse the comma-delimited result and return the parsed result.
    //  If `res1` is non-null and `res2` is null and the response is `=+CGATT:1` then `res1` is set to 1.
    //  If `res1` and `res2` are both non-null and the response is `=+CEREG:0,1` then `res1` is set to 0 and `res2` is set to 1.
    assert(res1);
    const char *cmd = get_command(dev, id);
    char cmd_response[17];  memset(cmd_response, 0, sizeof(cmd_response));
    *res1 = -1; 
    if (res2) { *res2 = -1; }
    //debug_bc95g = 1;  ////
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
    //debug_bc95g = 0;  ////
    console_flush();
    //asm("bkpt"); ////
    return res;
}

static bool send_query_int(struct bc95g *dev, enum CommandId id, int *result) {
    //  Send an AT query like `AT+NSOCR=DGRAM,17,0,1`. Return the parsed result, which contains 1 integer.
    assert(result);
    const char *cmd = get_command(dev, id);
    *result = -1;
    //debug_bc95g = 1;  ////
    bool res = {
        send_atp(dev) &&
        parser.send(cmd) &&
        parser.recv("%d", result) &&
        expect_ok(dev)
    };
    //debug_bc95g = 0;  ////
    console_flush();
    //asm("bkpt"); ////
    return res;
}

/////////////////////////////////////////////////////////
//  Device Creation Functions

static void bc95g_event(void *drv);
static bc95g_cfg *cfg(struct bc95g *dev) { return &dev->cfg; }                 //  Return the BC95G Config

static int bc95g_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    //  If first time we are opening the driver: Prepare the BC95G transceiver for use.  Lock the UART port.
    if (!first_open) { console_printf("[\n"); return 0; }  ////
    first_open = false;
    console_printf("[\n");  ////
    assert(dev0);
    struct bc95g *dev = (struct bc95g *) dev0;
    struct bc95g_cfg *cfg = &dev->cfg;

    //  Erase the socket info.
    memset(cfg->sockets, 0, sizeof(cfg->sockets));

    //  Set the buffers for the C++ instance. We pass in static buffers to avoid dynamic memory allocation (new, delete).
    internal_init(
        bc95g_tx_buffer, BC95G_TX_BUFFER_SIZE,
        bc95g_rx_buffer, BC95G_RX_BUFFER_SIZE,
        bc95g_parser_buffer, BC95G_PARSER_BUFFER_SIZE,
        false
    );
    internal_configure(cfg->uart);         //  Configure the UART port.  0 means UART2.
    internal_attach(&bc95g_event, dev);    //  Set the callback for BC95G events.
    return 0;
}

static int bc95g_close(struct os_dev *dev0) {
    //  Shutdown the BC95G transceiver.  Unlock the UART port.
    //  TODO: Undo driver.init(), driver.configure() and driver.attach()
    console_printf("]\n");  console_flush();  ////
    assert(dev0);
    return 0;
}

int bc95g_init(struct os_dev *dev0, void *arg) {
    //  Configure the BC95G driver.  Called by os_dev_create().  Return 0 if successful.
    struct bc95g *dev;
    int rc;
    if (!arg || !dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct bc95g *) dev0;  assert(dev);

    //  Register the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, bc95g_open, bc95g_close);

    //  Register the Sensor Network Interface.
    rc = sensor_network_register_interface(&network_iface);
    assert(rc == 0);

    return (OS_OK);
err:
    return rc;
}

int bc95g_default_cfg(struct bc95g_cfg *cfg) {
    //  Copy the default BC95G config into cfg.  Returns 0.
    memset(cfg, 0, sizeof(struct bc95g_cfg));  //  Zero the entire object.
    cfg->uart = 0;  //  Default to UART number 0, which is UART2.
    return 0;
}

int bc95g_config(struct bc95g *drv, struct bc95g_cfg *cfg) {
    //  Apply the BC95G driver configuration.  Return 0 if successful.
    return 0;  //  Nothing to do.  We will apply the config in bc95g_open().
}

static int register_transport(const char *network_device, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size) {
    //  Called by Sensor Network Interface to register the transport.
    assert(server_endpoint_size >= sizeof(struct bc95g_server));  //  Server Endpoint too small
    int rc = bc95g_register_transport(network_device, (struct bc95g_server *) server_endpoint, host, port);
    return rc;
}

/////////////////////////////////////////////////////////
//  BC95G Driver Interface

static void bc95g_event(void *drv) {
    //  Callback for BC95G events.
#ifdef TODO
    for (int i = 0; i < BC95G_SOCKET_COUNT; i++) {
        if (_cbs[i].callback) {
            _cbs[i].callback(_cbs[i].data);
        }
    }
#endif  //  TODO
}

static bool sleep(uint16_t seconds) {
    os_time_delay(seconds * OS_TICKS_PER_SEC);
    return true;
}

static bool wait_for_registration(struct bc95g *dev) {
    //  CEREG_QUERY: query registration
    for (uint8_t i = 0; i < 10; i++) {
        //  Response contains 2 integers: `code` and `status` e.g. `=+CEREG:0,1`
        int code = -1, status = -1;
        bool res = send_query(dev, CEREG_QUERY, &code, &status);
        if (!res) { return false; }  //  If send failed, quit.
        assert(status >= 0);

        //  If registered to network, response should be `=+CEREG:0,1` i.e. `status` should be 1
        if (status == 1) { return true; }  //  If registered, exit.

        //  If not yet registered to network, `status` will be 2 and we should recheck in a while.
        //  Wait 2 seconds.
        sleep(2);
    }
    return false;  //  Not registered after 5 retries, quit.
}

static bool wait_for_attach(struct bc95g *dev) {
    //  CGATT_QUERY: query attach
    for (uint8_t i = 0; i < 10; i++) {
        //  Response contains 1 integer: `state` e.g. `=+CGATT:1`
        int state = -1;
        bool res = send_query(dev, CGATT_QUERY, &state, NULL);
        if (!res) { return false; }  //  If send failed, quit.
        assert(state >= 0);

        //  If attached to network, response should be `=+CGATT:1` i.e. `state` should be 1
        if (state == 1) { return true; }  //  If attached, exit.

        //  If not yet attached to network, `state` will be 0 and we should recheck in a while.
        //  Wait 2 seconds.
        sleep(2);
    }
    return false;  //  Not attached after 10 retries, quit.
}

static bool prepare_to_transmit(struct bc95g *dev) {
    //  [Phase 0] Prepare to transmit
    return (
        //  Ignore the intial message.
        parser.send("AT") &&
        expect_ok(dev) &&

        //  Ignore the intial message.
        parser.send("AT") &&
        expect_ok(dev) &&

        //  Ignore the intial message.
        parser.send("AT") &&
        expect_ok(dev) &&

        //  NCONFIG: configure
        send_command(dev, NCONFIG) &&
        //  QREGSWT: huawei
        send_command(dev, QREGSWT) &&
        //  NRB: reboot
        send_command(dev, NRB) &&

        //  Reboot will take longer than other commands. We wait then flush.
        parser.send("AT") &&
        expect_ok(dev) &&
        (parser.flush() == 0)
    );
}

static bool attach_to_network(struct bc95g *dev) {
    //  [Phase 1] Attach to network
    return (        
        //  NBAND: select band
        send_command(dev, NBAND) &&

        //  CFUN: enable functions
        send_command(dev, CFUN) &&
        //parser.send("AT") && expect_ok(dev) && sleep(5) &&

        send_command(dev, CFUN_QUERY) &&
        //parser.send("AT") && expect_ok(dev) && sleep(5) &&

        //  CGATT: attach network
        send_command(dev, CGATT) &&
        //parser.send("AT") && expect_ok(dev) && sleep(5) &&

        send_command(dev, CGATT_QUERY) &&
        //parser.send("AT") && expect_ok(dev) && sleep(5) &&

        //  CEREG: network registration
        send_command(dev, CEREG) &&
        //parser.send("AT") && expect_ok(dev) && sleep(5) &&

        send_command(dev, CEREG_QUERY) &&
        //parser.send("AT") && expect_ok(dev) && sleep(5) &&

        //  CEREG_QUERY: query registration
        wait_for_registration(dev) &&

        //  CGATT_QUERY: query attach
        wait_for_attach(dev) &&

        true
    );
}

int bc95g_connect(struct bc95g *dev) {
    //  Connect to the NB-IoT network.  Return 0 if successful.
    internal_timeout(BC95G_CONNECT_TIMEOUT);
    return (
        //  [Phase 0] Prepare to transmit
        prepare_to_transmit(dev) &&

        //  [Phase 1] Attach to network
        attach_to_network(dev)
    ) ? 0 : dev->last_error;
}

int bc95g_socket_open(struct bc95g *dev, struct bc95g_socket **socket_ptr) {
    //  Allocate a socket and save to `socket_ptr`.  Return 0 if successful.
    //  [Phase 2A] Allocate port
    int local_port = 0;
    //  NSOCR: allocate port
    internal_timeout(BC95G_MISC_TIMEOUT);
    bool res = send_query_int(dev, NSOCR, &local_port);
    if (!res) { return dev->last_error; }
    assert(local_port > 0);

    //  Store into first socket.
    bc95g_socket *socket = &cfg(dev)->sockets[0];
    socket->local_port = (uint16_t) local_port;
    *socket_ptr = socket;
    return 0;
}

int bc95g_socket_close(struct bc95g *dev, struct bc95g_socket *socket) {
    //  Close the socket.  Return 0 if successful.
    assert(socket && socket == &cfg(dev)->sockets[0]);
    internal_timeout(BC95G_MISC_TIMEOUT);
    int local_port = socket->local_port;
    assert(local_port > 0);
    //  NSOCL: close port
    bool res = send_command_int(dev, NSOCL, local_port);
    if (!res) { return dev->last_error; }
    //  Erase the socket.
    memset(socket, 0, sizeof(bc95g_socket));
    return 0;
}

static char nibble_to_hex(uint8_t n) {
    //  Given n=0..15, return '0'..'f'.
    return (n < 10)
        ? '0' + n
        : 'a' + n - 10;
}

static bool send_hex(struct bc95g *dev, const uint8_t *data, uint16_t size) {
    //  Send the data as hex digits.
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

static bool send_data(struct bc95g *dev, const uint8_t *data, uint16_t length, struct os_mbuf *mbuf) {
    //  Send the data buffer if non-null, or the chain of mbufs.
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

static int send_tx_command(struct bc95g *dev, struct bc95g_socket *socket, const char *host, uint16_t port, 
    const uint8_t *data, uint16_t length, uint8_t sequence, struct os_mbuf *mbuf) {
    //  Transmit the data buffer if non-null, or the chain of mbufs.  Return number of bytes sent.
    uint16_t local_port = socket->local_port;
    int local_port_response = -1, length_response = -1;
    internal_timeout(BC95G_SEND_TIMEOUT);
    bool res = (
        send_atp(dev) &&  //  Will pause between commands.
        parser.printf("NSOST=%d,%s,%d,%d,",
            local_port, host, port, length) &&
        send_data(dev, data, length, mbuf) &&
        parser.send(",%d", sequence) &&
        parser.recv("%d,%d", &local_port_response, &length_response) &&
        parser.recv("OK")
    );
    return res ? length : 0;
}

int bc95g_socket_tx(struct bc95g *dev, struct bc95g_socket *socket, const char *host, uint16_t port, const uint8_t *data, uint16_t length, uint8_t sequence) {
    //  Transmit the buffer through the socket.  `length` is the number of bytes in `data`.  `sequence` is a running message sequence number 1 to 255.  Return number of bytes transmitted.
    return send_tx_command(dev, socket, host, port, data, length, sequence, NULL);
}

int bc95g_socket_tx_mbuf(struct bc95g *dev, struct bc95g_socket *socket, const char *host, uint16_t port, uint8_t sequence, struct os_mbuf *mbuf) {
    //  Transmit the chain of mbufs through the socket.  `sequence` is a running message sequence number 1 to 255.  Return number of bytes transmitted.
    uint16_t length = OS_MBUF_PKTLEN(mbuf);  //  Length of the mbuf chain.
    return send_tx_command(dev, socket, host, port, NULL, length, sequence, mbuf);
}
