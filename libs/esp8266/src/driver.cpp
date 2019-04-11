//  ESP8266 Driver for Apache Mynewt.  Functions for creating the driver instance and performing ESP8266 functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#include <os/os.h>
#include <sensor/sensor.h>
#include <console/console.h>
#include "Controller.h"
#include "esp8266/esp8266.h"

static ESP8266 controller;  //  The single ESP8266 controller instance.  TODO: Support multiple ESP8266 instances.
static char esp8266_tx_buffer[ESP8266_TX_BUFFER_SIZE];  //  TX Buffer
static char esp8266_rx_buffer[ESP8266_RX_BUFFER_SIZE];  //  RX Buffer
static char esp8266_parser_buffer[ESP8266_PARSER_BUFFER_SIZE];  //  Buffer for ATParser

/////////////////////////////////////////////////////////
//  Init Functions

int esp8266_default_cfg(struct esp8266_cfg *cfg) {
    //  Return the default config.
    memset(cfg, 0, sizeof(struct esp8266_cfg));  //  Zero the entire object.
    return 0;
}

/////////////////////////////////////////////////////////
//  Device Creation Functions

static void esp8266_event(void *drv);
static int internal_connect(struct esp8266 *dev);

static ESP8266 *drv(struct esp8266 *dev) { return (ESP8266 *)(dev->controller); }  //  Return the ESP8266 Controller
static esp8266_cfg *cfg(struct esp8266 *dev) { return &dev->cfg; }  //  Return the ESP8266 Config

#ifdef NOTUSED
    //  Exports for the sensor API
    static int esp8266_sensor_read(struct sensor *, sensor_type_t,
            sensor_data_func_t, void *, uint32_t) { return 0; }
    static int esp8266_sensor_get_config(struct sensor *, sensor_type_t type,
            struct sensor_cfg *cfg) {
        //  int rc;
        //  if (!(type & SENSOR_TYPE_PRESSURE)) { rc = SYS_EINVAL; goto err; }
        cfg->sc_valtype = SENSOR_VALUE_TYPE_FLOAT;
        return (0);
        //  err: return (rc);
    }

    //  ESP8266 Mynewt Sensor Driver
    static const struct sensor_driver g_esp8266_sensor_driver = {
        esp8266_sensor_read,
        esp8266_sensor_get_config
    };
#endif  //  NOTUSED

static int esp8266_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    //  Prepare the ESP8266 transceiver for use.  Lock the UART port.
    console_printf("esp8266_open\n");  ////
    assert(dev0);
    struct esp8266 *dev = (struct esp8266 *) dev0;
    struct esp8266_cfg *cfg = &dev->cfg;

    //  Assign the controller.
    dev->controller = &controller;

    //  Erase the socket info.
    memset(cfg->_ids, 0, sizeof(cfg->_ids));
    memset(cfg->_cbs, 0, sizeof(cfg->_cbs));

    //  Set the buffers for the C++ instance. We pass in static buffers to avoid dynamic memory allocation (new, delete).
    drv(dev)->init(
        esp8266_tx_buffer, ESP8266_TX_BUFFER_SIZE,
        esp8266_rx_buffer, ESP8266_RX_BUFFER_SIZE,
        esp8266_parser_buffer, ESP8266_PARSER_BUFFER_SIZE
    );
    drv(dev)->configure(dev->sensor.s_itf.si_num);  //  Configure the UART port.  0 means UART2.
    drv(dev)->attach(&esp8266_event, dev);          //  Set the callback for ESP8266 events.
    return 0;
}

static int esp8266_close(struct os_dev *dev0) {
    //  Shutdown the ESP8266 transceiver.  Unlock the UART port.
    //  TODO: Undo driver.init(), driver.configure() and driver.attach()
    console_printf("esp8266_close\n");  ////
    assert(dev0);
    return 0;
}

int esp8266_init(struct os_dev *dev0, void *arg) {
    //  Configure the ESP8266 transceiver.  Called by os_dev_create().
    struct esp8266 *dev;
    struct sensor *sensor;
    int rc;
    if (!arg || !dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct esp8266 *) dev0;  assert(dev);

    //  Register the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, esp8266_open, esp8266_close);
    return (OS_OK);
err:
    return rc;
}

int esp8266_config(struct esp8266 *drv, struct esp8266_cfg *cfg) {
    //  Apply the ESP8266 driver configuration.
    return 0;  //  Nothing to do.
}

/////////////////////////////////////////////////////////
//  ESP8266 Driver Interface based on https://os.mbed.com/teams/ESP8266/code/esp8266-driver/file/6946b0b9e323/ESP8266Interface.cpp/

int esp8266_scan(struct esp8266 *dev, nsapi_wifi_ap_t *res, unsigned limit, filter_func_t0 *filter_func) {
    //  Scan for WiFi access points. Assume that ESP8266::startup() has already been called.
    assert(dev);  assert(res);
    drv(dev)->setTimeout(ESP8266_SCAN_TIMEOUT);
    return drv(dev)->scan(res, limit, filter_func);
}

int esp8266_connect(struct esp8266 *dev, const char *ssid, const char *pass) {
    //  Connect to the WiFi access point with the SSID and password.
    assert(dev);  assert(ssid);  assert(pass);
    esp8266_set_credentials(dev, ssid, pass, NSAPI_SECURITY_UNKNOWN);  //  Save the credentials.
    return internal_connect(dev);  //  Connect with the saved credentials.
}

static int internal_connect(struct esp8266 *dev) {
    //  Connect to the WiFi access point with the saved SSID and password.
    drv(dev)->setTimeout(ESP8266_CONNECT_TIMEOUT);
    if (!drv(dev)->startup(3)) { return NSAPI_ERROR_DEVICE_ERROR; }
    if (!drv(dev)->dhcp(true, 1)) { return NSAPI_ERROR_DHCP_FAILURE; }
    if (!drv(dev)->connect(cfg(dev)->ap_ssid, cfg(dev)->ap_pass)) { return NSAPI_ERROR_NO_CONNECTION; }
    if (!drv(dev)->getIPAddress()) { return NSAPI_ERROR_DHCP_FAILURE; }
    return NSAPI_ERROR_OK;
}

int esp8266_set_credentials(struct esp8266 *dev, const char *ssid, const char *pass, nsapi_security_t security) {
    //  Save the credentials for the WiFi access point.
    memset(cfg(dev)->ap_ssid, 0, sizeof(cfg(dev)->ap_ssid));
    strncpy(cfg(dev)->ap_ssid, ssid, sizeof(cfg(dev)->ap_ssid));
    memset(cfg(dev)->ap_pass, 0, sizeof(cfg(dev)->ap_pass));
    strncpy(cfg(dev)->ap_pass, pass, sizeof(cfg(dev)->ap_pass));
    cfg(dev)->ap_sec = security;
    return 0;
}

static void esp8266_event(void *drv) {
    //  Callback for ESP8266 events.
#ifdef TODO
    for (int i = 0; i < ESP8266_SOCKET_COUNT; i++) {
        if (_cbs[i].callback) {
            _cbs[i].callback(_cbs[i].data);
        }
    }
#endif  //  TODO
}

int esp8266_disconnect(struct esp8266 *dev) {
    //  Disconnect from the WiFi access point.
    drv(dev)->setTimeout(ESP8266_MISC_TIMEOUT);
    if (!drv(dev)->disconnect()) {
        return NSAPI_ERROR_DEVICE_ERROR;
    }
    return NSAPI_ERROR_OK;
}

const char *esp8266_get_ip_address(struct esp8266 *dev) {
    return drv(dev)->getIPAddress();
}

const char *esp8266_get_mac_address(struct esp8266 *dev) {
    return drv(dev)->getMACAddress();
}

const char *esp8266_get_gateway(struct esp8266 *dev) {
    return drv(dev)->getGateway();
}

const char *esp8266_get_netmask(struct esp8266 *dev) {
    return drv(dev)->getNetmask();
}

int8_t esp8266_get_rssi(struct esp8266 *dev) {
    return drv(dev)->getRSSI();
}

int esp8266_socket_open(struct esp8266 *dev, void **handle, nsapi_protocol_t proto) {
    //  Look for an unused socket.
    int id = -1;
    for (int i = 0; i < ESP8266_SOCKET_COUNT; i++) {
        if (!cfg(dev)->_ids[i]) {
            id = i;
            cfg(dev)->_ids[i] = true;
            break;
        }
    }
    if (id == -1) { return NSAPI_ERROR_NO_SOCKET; }  //  No more sockets available.

    //  Allocate socket.
    struct esp8266_socket *socket = &cfg(dev)->_sockets[id];
    if (!socket) { return NSAPI_ERROR_NO_SOCKET; }
    socket->id = id;
    socket->proto = proto;
    socket->connected = false;
    *handle = socket;
    return 0;
}

int esp8266_socket_close(struct esp8266 *dev, void *handle) {
    //  Close the socket.
    struct esp8266_socket *socket = (struct esp8266_socket *)handle;
    int err = 0;
    drv(dev)->setTimeout(ESP8266_MISC_TIMEOUT);
    if (!drv(dev)->close(socket->id)) { err = NSAPI_ERROR_DEVICE_ERROR; }
    cfg(dev)->_ids[socket->id] = false;
    return err;
}

int esp8266_socket_connect(struct esp8266 *dev, void *handle, const char *host, uint16_t port) {
    //  Connect the socket to the host and port via UDP or TCP.
    //  Note: Host must point to a static string that will never change.
    struct esp8266_socket *socket = (struct esp8266_socket *)handle;
    drv(dev)->setTimeout(ESP8266_MISC_TIMEOUT);
    const char *proto = (socket->proto == NSAPI_UDP) ? "UDP" : "TCP";
    if (!drv(dev)->open(proto, socket->id, host, port)) {
        return NSAPI_ERROR_DEVICE_ERROR;
    }
    socket->connected = true;
    return 0;
}

int esp8266_socket_send(struct esp8266 *dev, void *handle, const void *data, unsigned size) {
    //  Send the byte buffer to the socket.
    struct esp8266_socket *socket = (struct esp8266_socket *)handle;
    drv(dev)->setTimeout(ESP8266_SEND_TIMEOUT);
    if (!drv(dev)->send(socket->id, data, size)) {
        return NSAPI_ERROR_DEVICE_ERROR;
    }
    return size;
}

int esp8266_socket_send_mbuf(struct esp8266 *dev, void *handle, struct os_mbuf *m) {
    //  Send the chain of mbufs to the socket.
    struct esp8266_socket *socket = (struct esp8266_socket *)handle;
    drv(dev)->setTimeout(ESP8266_SEND_TIMEOUT);
    if (!drv(dev)->sendMBuf(socket->id, m)) {
        return NSAPI_ERROR_DEVICE_ERROR;
    }
    int size = OS_MBUF_PKTLEN(m);  //  Length of the mbuf chain.
    return size;
}

int esp8266_socket_sendto(struct esp8266 *dev, void *handle, const char *host, uint16_t port, const void *data, unsigned size) {
    //  Send the byte buffer to the host and port.
    //  Note: Host must point to a static string that will never change.
    struct esp8266_socket *socket = (struct esp8266_socket *)handle;
    if (socket->connected && (socket->host != host || socket->port != port)) {  //  If connected but sending to a different destination...
        drv(dev)->setTimeout(ESP8266_MISC_TIMEOUT);
        if (!drv(dev)->close(socket->id)) { return NSAPI_ERROR_DEVICE_ERROR; }
        socket->connected = false;
    }
    if (!socket->connected) {
        int err = esp8266_socket_connect(dev, socket, host, port);
        if (err < 0) { return err; }
        socket->host = host;
        socket->port = port;
    }
    return esp8266_socket_send(dev, socket, data, size);
}

void esp8266_socket_attach(struct esp8266 *dev, void *handle, void (*callback)(void *), void *data) {
    //  Attach a callback to a socket.
    struct esp8266_socket *socket = (struct esp8266_socket *)handle;    
    cfg(dev)->_cbs[socket->id].callback = callback;
    cfg(dev)->_cbs[socket->id].data = data;
}

#ifdef TODO  //  Not ported yet from mbed to Mynewt.

    int esp8266_socket_bind(void *handle, const SocketAddress &address)
    {
        return NSAPI_ERROR_UNSUPPORTED;
    }

    int esp8266_socket_listen(void *handle, int backlog)
    {
        return NSAPI_ERROR_UNSUPPORTED;
    }
        
    int esp8266_socket_accept(void *server, void **socket, SocketAddress *addr)
    {
        return NSAPI_ERROR_UNSUPPORTED;
    }

    int esp8266_socket_recv(void *handle, void *data, unsigned size)
    {
        struct esp8266_socket *socket = (struct esp8266_socket *)handle;
        drv(dev)->setTimeout(ESP8266_RECV_TIMEOUT);
    
        int32_t recv = drv(dev)->recv(socket->id, data, size);
        if (recv < 0) {
            return NSAPI_ERROR_WOULD_BLOCK;
        }
    
        return recv;
    }

    int esp8266_socket_recvfrom(void *handle, SocketAddress *addr, void *data, unsigned size)
    {
        struct esp8266_socket *socket = (struct esp8266_socket *)handle;
        int ret = socket_recv(socket, data, size);
        if (ret >= 0 && addr) {
            *addr = socket->addr;
        }

        return ret;
    }

    void esp8266_event() {
        for (int i = 0; i < ESP8266_SOCKET_COUNT; i++) {
            if (_cbs[i].callback) {
                _cbs[i].callback(_cbs[i].data);
            }
        }
    }

#endif  //  TODO
