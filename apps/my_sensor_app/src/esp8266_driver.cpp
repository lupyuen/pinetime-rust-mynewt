#include <os/os.h>
#include <sensor/sensor.h>

struct esp8266_cfg {
};

struct esp8266 {
    struct os_dev dev;
    struct sensor sensor;
    struct esp8266_cfg cfg;
};

static struct esp8266 esp8266;

//  #if MYNEWT_VAL(UART_0)
static const struct sensor_itf uart_0_itf = {        
    SENSOR_ITF_UART, //  si_type: Sensor interface type
    0,               //  si_num: Sensor interface number    
    //  .si_type = SENSOR_ITF_UART,
    //  .si_num = 0,
};
//  #endif

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
    assert(rc == 0);
    rc = os_dev_create((struct os_dev *) &esp8266, "esp8266_0",
        OS_DEV_INIT_PRIMARY, 0, esp8266_init, (void *) &uart_0_itf);
    assert(rc == 0);
    rc = config_esp8266();
    assert(rc == 0);
}

/////////////////////////////////////////////////////////

int esp8266_init(struct os_dev *dev, void *arg) {
}

int esp8266_config(struct esp8266 *drv, struct esp8266_cfg *cfg) {
_esp(tx, rx, debug)
        memset(_ids, 0, sizeof(_ids));
        memset(_cbs, 0, sizeof(_cbs));

        _esp.attach(this, &ESP8266Interface::event);
}

//  int drv2605_trigger_rom(struct sensor_itf *itf);

#ifdef NOTUSED

    // Various timeouts for different ESP8266 operations
    #define ESP8266_CONNECT_TIMEOUT 15000
    #define ESP8266_SEND_TIMEOUT    500
    #define ESP8266_RECV_TIMEOUT    0
    #define ESP8266_MISC_TIMEOUT    500

    // ESP8266Interface implementation
    ESP8266Interface::ESP8266Interface(PinName tx, PinName rx, bool debug)
        : _esp(tx, rx, debug)
    {
        memset(_ids, 0, sizeof(_ids));
        memset(_cbs, 0, sizeof(_cbs));

        _esp.attach(this, &ESP8266Interface::event);
    }

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
