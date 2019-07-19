//  BC95-G Driver for Apache Mynewt.  Functions for creating the driver instance and performing BC95-G functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
//  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//  fixes response parsing bugs.  The patched file must be present in that location.
#include <os/os.h>
#include <sensor/sensor.h>
#include <console/console.h>
#include <sensor_network/sensor_network.h>
#include "Controller.h"
#include "bc95g/bc95g.h"
#include "bc95g/transport.h"

static int register_transport(const char *network_device, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size);

static char bc95g_tx_buffer[BC95G_TX_BUFFER_SIZE];  //  TX Buffer
static char bc95g_rx_buffer[BC95G_RX_BUFFER_SIZE];  //  RX Buffer
static char bc95g_parser_buffer[BC95G_PARSER_BUFFER_SIZE];  //  Buffer for ATParser
static bool first_open = true;  //  True if this is the first time opening the driver

//  Definition of BC95G Sensor Network Interface
static const struct sensor_network_interface network_iface = {
    SERVER_INTERFACE_TYPE,         //  uint8_t iface_type; Interface Type: Server or Collector
    BC95G_DEVICE,                  //  const char *network_device; Network device name.  Must be a static string.
    sizeof(struct bc95g_server),   //  uint8_t server_endpoint_size; Server Endpoint size
    register_transport,            //  int (*register_transport_func)(const char *network_device0, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size);  //  Register transport function
};

/////////////////////////////////////////////////////////
//  AT Functions. Refer to https://medium.com/@ly.lee/get-started-with-nb-iot-and-quectel-modules-6e7c581e0d61

enum CommandID {
    //  Sequence MUST match commands[] below.
    //  [0] Prepare to transmit
    NCONFIG,    //  configure
    QREGSWT,    //  huawei
    NRB,        //  reboot

    //  [1] Attach to network
    NBAND,          //  select band
    CFUN,           //  enable functions
    CGATT,          //  attach network
    CGATT_QUERY,    //  query attach
    CEREG_QUERY,    //  query registration

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

static const char *commands[] = {
    //  Sequence MUST match CommandID.
    //  [0] Prepare to transmit
    "NCONFIG=AUTOCONNECT,FALSE",  //  NCONFIG: configure
    "QREGSWT=2",    //  QREGSWT: huawei
    "NRB",          //  NRB: reboot

    //  [1] Attach to network
    "NBAND=8",  //  NBAND: select band
    "CFUN=1",   //  CFUN: enable functions
    "CGATT=1",  //  CGATT: attach network
    "CGATT?",   //  CGATT_QUERY: query attach
    "CEREG?",   //  CEREG_QUERY: query registration

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

/////////////////////////////////////////////////////////
//  Internal Functions

static void internal_init(char *txbuf, uint32_t txbuf_size, char *rxbuf, uint32_t rxbuf_size, 
    char *parserbuf, uint32_t parserbuf_size, bool debug)
{
    _uart = 0;
    _serial.init(txbuf, txbuf_size, rxbuf, rxbuf_size);
    _parser.init(_serial, parserbuf, parserbuf_size);
    _packets = 0;
    _packets_end = &_packets;
    _serial.baud(115200);
    _parser.debugOn(debug);
}

static void internal_configure(int uart) {
    _uart = uart;
    _serial.configure(uart);
}

static void internal_attach(void (*func)(void *), void *arg) {
    _serial.attach(func, arg);
}

static void internal_timeout(uint32_t timeout_ms) {
    _parser.setTimeout(timeout_ms);
}

/////////////////////////////////////////////////////////
//  Device Creation Functions

static void bc95g_event(void *drv);
static BC95G *drv(struct bc95g *dev) { return (BC95G *)(dev->controller); }  //  Return the BC95G Controller
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
    memset(cfg->_ids, 0, sizeof(cfg->_ids));
    memset(cfg->_cbs, 0, sizeof(cfg->_cbs));

    //  Set the buffers for the C++ instance. We pass in static buffers to avoid dynamic memory allocation (new, delete).
    internal_init(
        bc95g_tx_buffer, BC95G_TX_BUFFER_SIZE,
        bc95g_rx_buffer, BC95G_RX_BUFFER_SIZE,
        bc95g_parser_buffer, BC95G_PARSER_BUFFER_SIZE
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

int bc95g_disconnect(struct bc95g *dev) {
    //  Disconnect from the WiFi access point.  Return 0 if successful.
    internal_timeout(BC95G_MISC_TIMEOUT);
    if (!internal_disconnect()) {
        return NSAPI_ERROR_DEVICE_ERROR;
    }
    return NSAPI_ERROR_OK;
}

int bc95g_socket_open(struct bc95g *dev, void **handle, nsapi_protocol_t proto) {
    //  Allocate a socket.  Return 0 if successful.
    int id = -1;
    for (int i = 0; i < BC95G_SOCKET_COUNT; i++) {
        if (!cfg(dev)->_ids[i]) {
            id = i;
            cfg(dev)->_ids[i] = true;
            break;
        }
    }
    if (id == -1) { return NSAPI_ERROR_NO_SOCKET; }  //  No more sockets available.

    //  Init the socket.
    struct bc95g_socket *socket = &cfg(dev)->_sockets[id];
    if (!socket) { return NSAPI_ERROR_NO_SOCKET; }
    socket->id = id;
    socket->proto = proto;
    socket->connected = false;
    *handle = socket;
    return 0;
}

int bc95g_socket_close(struct bc95g *dev, void *handle) {
    //  Close the socket.  Return 0 if successful.
    struct bc95g_socket *socket = (struct bc95g_socket *)handle;
    int err = 0;
    internal_timeout(BC95G_MISC_TIMEOUT);
    if (!internal_close(socket->id)) { err = NSAPI_ERROR_DEVICE_ERROR; }
    cfg(dev)->_ids[socket->id] = false;
    return err;
}

int bc95g_socket_connect(struct bc95g *dev, void *handle, const char *host, uint16_t port) {
    //  Connect the socket to the host and port via UDP or TCP.  Return 0 if successful.
    //  Note: Host must point to a static string that will never change.
    struct bc95g_socket *socket = (struct bc95g_socket *)handle;
    internal_timeout(BC95G_MISC_TIMEOUT);
    const char *proto = (socket->proto == NSAPI_UDP) ? "UDP" : "TCP";
    if (!internal_open(proto, socket->id, host, port)) {
        return NSAPI_ERROR_DEVICE_ERROR;
    }
    socket->connected = true;
    return 0;
}

int bc95g_socket_send(struct bc95g *dev, void *handle, const void *data, unsigned size) {
    //  Send the byte buffer to the socket.  Return number of bytes sent.
    struct bc95g_socket *socket = (struct bc95g_socket *)handle;
    internal_timeout(BC95G_SEND_TIMEOUT);
    if (!internal_send(socket->id, data, size)) {
        return NSAPI_ERROR_DEVICE_ERROR;
    }
    return size;
}

int bc95g_socket_send_mbuf(struct bc95g *dev, void *handle, struct os_mbuf *m) {
    //  Send the chain of mbufs to the socket.  Return number of bytes sent.
    struct bc95g_socket *socket = (struct bc95g_socket *)handle;
    internal_timeout(BC95G_SEND_TIMEOUT);
    if (!internal_sendMBuf(socket->id, m)) {
        return NSAPI_ERROR_DEVICE_ERROR;
    }
    int size = OS_MBUF_PKTLEN(m);  //  Length of the mbuf chain.
    return size;
}

int bc95g_socket_sendto(struct bc95g *dev, void *handle, const char *host, uint16_t port, const void *data, unsigned size) {
    //  Send the byte buffer to the host and port.  Return number of bytes sent.
    //  Note: Host must point to a static string that will never change.
    struct bc95g_socket *socket = (struct bc95g_socket *)handle;
    if (socket->connected && (socket->host != host || socket->port != port)) {  //  If connected but sending to a different destination...
        internal_timeout(BC95G_MISC_TIMEOUT);
        if (!internal_close(socket->id)) { return NSAPI_ERROR_DEVICE_ERROR; }
        socket->connected = false;
    }
    if (!socket->connected) {
        int err = bc95g_socket_connect(dev, socket, host, port);
        if (err < 0) { return err; }
        socket->host = host;
        socket->port = port;
    }
    return bc95g_socket_send(dev, socket, data, size);
}

void bc95g_socket_attach(struct bc95g *dev, void *handle, void (*callback)(void *), void *data) {
    //  Attach a callback to a socket.
    struct bc95g_socket *socket = (struct bc95g_socket *)handle;    
    cfg(dev)->_cbs[socket->id].callback = callback;
    cfg(dev)->_cbs[socket->id].data = data;
}

const char *bc95g_get_ip_address(struct bc95g *dev) {
    //  Get the client IP address.
    return internal_getIPAddress();
}
