#include <os/os.h>
#include <sensor/sensor.h>
#include "ESP8266.h"
#include "esp8266_driver.h"

//  Use static buffers to avoid dynamic memory allocation (new, delete)
#define ESP8266_TX_BUFFER_SIZE 256
#define ESP8266_RX_BUFFER_SIZE 256
#define ESP8266_PARSER_BUFFER_SIZE 256

//  Various timeouts for different ESP8266 operations
#define ESP8266_CONNECT_TIMEOUT 15000
#define ESP8266_SEND_TIMEOUT    500
#define ESP8266_RECV_TIMEOUT    0
#define ESP8266_MISC_TIMEOUT    500

static char esp8266_tx_buffer[ESP8266_TX_BUFFER_SIZE];  //  TX Buffer
static char esp8266_rx_buffer[ESP8266_RX_BUFFER_SIZE];  //  RX Buffer
static char esp8266_parser_buffer[ESP8266_PARSER_BUFFER_SIZE];  //  Buffer for ATParser

//  #if MYNEWT_VAL(UART_0) && MYNEWT_VAL(ESP8266_OFB)
static ESP8266 driver(  //  TODO: Support multiple ESP8266 instances.
    esp8266_tx_buffer, ESP8266_TX_BUFFER_SIZE,
    esp8266_rx_buffer, ESP8266_RX_BUFFER_SIZE,
    esp8266_parser_buffer, ESP8266_PARSER_BUFFER_SIZE
);
static struct esp8266 esp8266;

static const struct sensor_itf uart_0_itf = {        
    SENSOR_ITF_UART, //  si_type: Sensor interface type
    0,               //  si_num: Sensor interface number    
    //  .si_type = SENSOR_ITF_UART,
    //  .si_num = 0,
};
//  #endif  //  MYNEWT_VAL(UART_0) && MYNEWT_VAL(ESP8266_OFB)

static int config_esp8266(void)
{
    int rc;
    struct os_dev *dev;
    struct esp8266_cfg cfg = {};
    dev = (struct os_dev *) os_dev_open("esp8266_0", OS_TIMEOUT_NEVER, NULL);
    assert(dev != NULL);
    rc = esp8266_config((struct esp8266 *) dev, &cfg);
    os_dev_close(dev);
    return rc;
}

void esp8266_sensor_dev_create(void)
{
    int rc;
    rc = os_dev_create((struct os_dev *) &esp8266, "esp8266_0",
        OS_DEV_INIT_PRIMARY, 0, esp8266_init, (void *) &uart_0_itf);
    assert(rc == 0);
    rc = config_esp8266();
    assert(rc == 0);
}

/////////////////////////////////////////////////////////
//  Sensor Creator Tasks

static void esp8266_event(void *drv);

/* Exports for the sensor API */
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

static const struct sensor_driver g_esp8266_sensor_driver = {
    esp8266_sensor_read,
    esp8266_sensor_get_config
};

static int esp8266_default_cfg(struct esp8266_cfg *cfg) {
    //  cfg->bc_iir = BME280_FILTER_OFF;
    return 0;
}

int esp8266_init(struct os_dev *dev0, void *arg) {
    //  Called by os_dev_create().  Register with Sensor Manager.
    struct esp8266 *dev;
    struct sensor *sensor;
    int rc;
    if (!arg || !dev0) { rc = SYS_ENODEV; goto err; }

    dev = (struct esp8266 *) dev0;
    rc = esp8266_default_cfg(&dev->cfg);
    if (rc) { goto err; }

    sensor = &dev->sensor;
#ifdef NOTUSED
    /* Initialise the stats entry */
    rc = stats_init(
        STATS_HDR(g_bme280stats),
        STATS_SIZE_INIT_PARMS(g_bme280stats, STATS_SIZE_32),
        STATS_NAME_INIT_PARMS(bme280_stat_section));
    SYSINIT_PANIC_ASSERT(rc == 0);
    /* Register the entry with the stats registry */
    rc = stats_register(dev->od_name, STATS_HDR(g_bme280stats));
    SYSINIT_PANIC_ASSERT(rc == 0);
#endif  //  NOTUSED
    rc = sensor_init(sensor, dev0);
    if (rc != 0) { goto err; }

    /* Add the driver with all the supported type */
    rc = sensor_set_driver(sensor, SENSOR_TYPE_NONE,
                           (struct sensor_driver *) &g_esp8266_sensor_driver);
    if (rc != 0) { goto err; }

    /* Set the interface */
    rc = sensor_set_interface(sensor, (sensor_itf *) arg);
    if (rc) { goto err; }

    //  Register with Sensor Manager.
    rc = sensor_mgr_register(sensor);
    if (rc != 0) { goto err; }
    return (0);
err:
    return (rc);
}

int esp8266_config(struct esp8266 *drv, struct esp8266_cfg *cfg) {
    //  TODO: memset(_ids, 0, sizeof(_ids));
    //  TODO: memset(_cbs, 0, sizeof(_cbs));
    driver.configure(drv->sensor.s_itf.si_num);  //  Configure the UART port.  0 means UART2.
    driver.attach(&esp8266_event, drv);  //  Set the callback for ESP8266 events.
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

int esp8266_scan(struct sensor_itf *itf, nsapi_wifi_ap_t *res, unsigned limit) {
    driver.setTimeout(ESP8266_CONNECT_TIMEOUT);
    if (!driver.startup(3)) { return NSAPI_ERROR_DEVICE_ERROR; }  //  Start in WiFi Client mode.
    return driver.scan(res, limit);
}

#ifdef NOTUSED

    int ESP8266Interface::connect(const char *ssid, const char *pass, nsapi_security_t security,
                                            uint8_t channel)
    {
        if (channel != 0) {
            return NSAPI_ERROR_UNSUPPORTED;
        }

        set_credentials(ssid, pass, security);
        return connect();
    }

    int ESP8266Interface::connect()
    {
        _esp.setTimeout(ESP8266_CONNECT_TIMEOUT);

        if (!_esp.startup(3)) {
            return NSAPI_ERROR_DEVICE_ERROR;
        }

        if (!_esp.dhcp(true, 1)) {
            return NSAPI_ERROR_DHCP_FAILURE;
        }

        if (!_esp.connect(ap_ssid, ap_pass)) {
            return NSAPI_ERROR_NO_CONNECTION;
        }

        if (!_esp.getIPAddress()) {
            return NSAPI_ERROR_DHCP_FAILURE;
        }

        return NSAPI_ERROR_OK;
    }

    int ESP8266Interface::set_credentials(const char *ssid, const char *pass, nsapi_security_t security)
    {
        memset(ap_ssid, 0, sizeof(ap_ssid));
        strncpy(ap_ssid, ssid, sizeof(ap_ssid));

        memset(ap_pass, 0, sizeof(ap_pass));
        strncpy(ap_pass, pass, sizeof(ap_pass));

        ap_sec = security;

        return 0;
    }

    int ESP8266Interface::set_channel(uint8_t channel)
    {
        return NSAPI_ERROR_UNSUPPORTED;
    }


    int ESP8266Interface::disconnect()
    {
        _esp.setTimeout(ESP8266_MISC_TIMEOUT);

        if (!_esp.disconnect()) {
            return NSAPI_ERROR_DEVICE_ERROR;
        }

        return NSAPI_ERROR_OK;
    }

    const char *ESP8266Interface::get_ip_address()
    {
        return _esp.getIPAddress();
    }

    const char *ESP8266Interface::get_mac_address()
    {
        return _esp.getMACAddress();
    }

    const char *ESP8266Interface::get_gateway()
    {
        return _esp.getGateway();
    }

    const char *ESP8266Interface::get_netmask()
    {
        return _esp.getNetmask();
    }

    int8_t ESP8266Interface::get_rssi()
    {
        return _esp.getRSSI();
    }

    int ESP8266Interface::scan(WiFiAccessPoint *res, unsigned count)
    {
        return _esp.scan(res, count);
    }

    struct esp8266_socket {
        int id;
        nsapi_protocol_t proto;
        bool connected;
        SocketAddress addr;
    };

    int ESP8266Interface::socket_open(void **handle, nsapi_protocol_t proto)
    {
        // Look for an unused socket
        int id = -1;
    
        for (int i = 0; i < ESP8266_SOCKET_COUNT; i++) {
            if (!_ids[i]) {
                id = i;
                _ids[i] = true;
                break;
            }
        }
    
        if (id == -1) {
            return NSAPI_ERROR_NO_SOCKET;
        }
        
        struct esp8266_socket *socket = new struct esp8266_socket;
        if (!socket) {
            return NSAPI_ERROR_NO_SOCKET;
        }
        
        socket->id = id;
        socket->proto = proto;
        socket->connected = false;
        *handle = socket;
        return 0;
    }

    int ESP8266Interface::socket_close(void *handle)
    {
        struct esp8266_socket *socket = (struct esp8266_socket *)handle;
        int err = 0;
        _esp.setTimeout(ESP8266_MISC_TIMEOUT);
    
        if (!_esp.close(socket->id)) {
            err = NSAPI_ERROR_DEVICE_ERROR;
        }

        _ids[socket->id] = false;
        delete socket;
        return err;
    }

    int ESP8266Interface::socket_bind(void *handle, const SocketAddress &address)
    {
        return NSAPI_ERROR_UNSUPPORTED;
    }

    int ESP8266Interface::socket_listen(void *handle, int backlog)
    {
        return NSAPI_ERROR_UNSUPPORTED;
    }

    int ESP8266Interface::socket_connect(void *handle, const SocketAddress &addr)
    {
        struct esp8266_socket *socket = (struct esp8266_socket *)handle;
        _esp.setTimeout(ESP8266_MISC_TIMEOUT);

        const char *proto = (socket->proto == NSAPI_UDP) ? "UDP" : "TCP";
        if (!_esp.open(proto, socket->id, addr.get_ip_address(), addr.get_port())) {
            return NSAPI_ERROR_DEVICE_ERROR;
        }
        
        socket->connected = true;
        return 0;
    }
        
    int ESP8266Interface::socket_accept(void *server, void **socket, SocketAddress *addr)
    {
        return NSAPI_ERROR_UNSUPPORTED;
    }

    int ESP8266Interface::socket_send(void *handle, const void *data, unsigned size)
    {
        struct esp8266_socket *socket = (struct esp8266_socket *)handle;
        _esp.setTimeout(ESP8266_SEND_TIMEOUT);
    
        if (!_esp.send(socket->id, data, size)) {
            return NSAPI_ERROR_DEVICE_ERROR;
        }
    
        return size;
    }

    int ESP8266Interface::socket_recv(void *handle, void *data, unsigned size)
    {
        struct esp8266_socket *socket = (struct esp8266_socket *)handle;
        _esp.setTimeout(ESP8266_RECV_TIMEOUT);
    
        int32_t recv = _esp.recv(socket->id, data, size);
        if (recv < 0) {
            return NSAPI_ERROR_WOULD_BLOCK;
        }
    
        return recv;
    }

    int ESP8266Interface::socket_sendto(void *handle, const SocketAddress &addr, const void *data, unsigned size)
    {
        struct esp8266_socket *socket = (struct esp8266_socket *)handle;

        if (socket->connected && socket->addr != addr) {
            _esp.setTimeout(ESP8266_MISC_TIMEOUT);
            if (!_esp.close(socket->id)) {
                return NSAPI_ERROR_DEVICE_ERROR;
            }
            socket->connected = false;
        }

        if (!socket->connected) {
            int err = socket_connect(socket, addr);
            if (err < 0) {
                return err;
            }
            socket->addr = addr;
        }
        
        return socket_send(socket, data, size);
    }

    int ESP8266Interface::socket_recvfrom(void *handle, SocketAddress *addr, void *data, unsigned size)
    {
        struct esp8266_socket *socket = (struct esp8266_socket *)handle;
        int ret = socket_recv(socket, data, size);
        if (ret >= 0 && addr) {
            *addr = socket->addr;
        }

        return ret;
    }

    void ESP8266Interface::socket_attach(void *handle, void (*callback)(void *), void *data)
    {
        struct esp8266_socket *socket = (struct esp8266_socket *)handle;    
        _cbs[socket->id].callback = callback;
        _cbs[socket->id].data = data;
    }

    void ESP8266Interface::event() {
        for (int i = 0; i < ESP8266_SOCKET_COUNT; i++) {
            if (_cbs[i].callback) {
                _cbs[i].callback(_cbs[i].data);
            }
        }
    }

#endif  //  NOTUSED
