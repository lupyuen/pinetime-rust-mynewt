/* 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <assert.h>
#include <console/console.h>
#include "util.h"
#include "Controller.h"

extern "C" int debug_bc95g;

/*
[0] Prepare to transmit
NCONFIG
configure
QREGSWT
huawei
NRB
reboot

[1] Attach to network
NBAND
selectBand
CFUN
enableFunctions
CGATT
attachNetwork
CEREG
registration

[2] Transmit message
NOSCR
allocatePort
NSOST
transmit

[3] Receive Response
NSONMI
receiveNotify
NSORF
receiveMsg
NSOCL
closePort

[4] Diagnostics
CGPADDR
ipAddress
NETSTATS
networkStats
*/

void Controller::init(char *txbuf, uint32_t txbuf_size, char *rxbuf, uint32_t rxbuf_size, 
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

void Controller::configure(int uart) {
    _uart = uart;
    _serial.configure(uart);
}

void packet_handler(void *arg) {
    assert(arg != NULL);
    ((ESP8266 *)arg)->_packet_handler();
}

bool Controller::setEcho(bool echoEnabled) {
    //  Turn command echoing on or off.
    const char *_f = "setEcho";
    console_printf("%s%s %s...\n", _esp, _f, echoEnabled ? "on" : "off"); console_flush(); 
    for (int i = 0; i < 2; i++) {  //  Try twice in case of error...
        if (
            _parser.send(       //  Send echo on or off command.
                echoEnabled 
                ? "\r\nATE1"
                : "\r\nATE0"
            ) &&
            _parser.recv("OK")  //  Wait for OK response.
        ) {
            _log(_f, true);
            return true; 
        }
    }
    _log(_f, false);
    return false;
}

bool Controller::startup(int mode)
{
    //  only 3 valid modes
    if(mode < 1 || mode > 3) {
        return false;
    }
    bool success = 
        reset()            //  Restart the ESP8266 module.
        && setEcho(false)  //  Disable command echo to speed up response processing.
        && _parser.send("AT+CWMODE=%d", mode)  //  Set the mode to WiFi Client, WiFi Access Point, or both.
        && _parser.recv("OK")                  //  Wait for response.
        && _parser.send("AT+CIPMUX=1")         //  Allow multiple TCP/UDP connections.
        && _parser.recv("OK");                 //  Wait for response.
    _parser.oob("+IPD", packet_handler, this); //  Call the packet handler when network data is received.
    return success;
}

bool Controller::reset(void)
{
    //  debug_bc95g = 1;  ////
    const char *_f = "reset";    
    bool ret = false;
    console_printf("%s%s...\n", _esp, _f); console_flush(); 
    for (int i = 0; i < 2; i++) {
        if (
            _parser.send("\r\nAT+RST")
            && _parser.recv("OK")  //  Wait for response.
#ifndef TOOO
            && _parser.recv("ready")  //  TODO: Wait for response: "ready" or "[System Ready, Vendor:www.ai-thinker.com]"
            && _parser.recv("\r\n")   //  Wait for end of the line
#else
            && _parser.recv("jump")  //  Wait for last line of response: "jump to run user1 @ 1000"
            && _parser.recv("\r\n")  //  Wait for end of the line
#endif  //  TODO
        ) {
            _parser.flush();  //  Discard the rest of the response before sending next command.
            ret = true;
            break;
        }
    }
    _log(_f, ret);
    //  debug_bc95g = 0;  ////    
    return true;
}

bool Controller::dhcp(bool enabled, int mode)
{
    //only 3 valid modes
    if(mode < 0 || mode > 2) {
        return false;
    }

    return _parser.send("AT+CWDHCP=%d,%d", enabled?1:0, mode)
        && _parser.recv("OK");
}

bool Controller::connect(const char *ap, const char *passPhrase)
{
    const char *_f = "connect";
    console_printf("%s%s...\n", _esp, _f);  console_flush();
    bool ret = _parser.send("AT+CWJAP=\"%s\",\"%s\"", ap, passPhrase)
        && _parser.recv("OK");
    _log(_f, ret);  
    if (!ret) { console_printf("*** Check WIFI_SSID and WIFI_PASSWORD in targets/bluepill_my_sensor/syscfg.yml\n"); }
    console_flush();
    return ret;
}

bool Controller::disconnect(void)
{
    return _parser.send("AT+CWQAP") && _parser.recv("OK");
}

const char *Controller::getIPAddress(void)
{
    if (!(_parser.send("AT+CIFSR")
        && _parser.recv("+CIFSR:STAIP,\"%15[^\"]\"", _ip_buffer)
        && _parser.recv("OK"))) {
        return 0;
    }

    return _ip_buffer;
}

const char *Controller::getMACAddress(void)
{
    if (!(_parser.send("AT+CIFSR")
        && _parser.recv("+CIFSR:STAMAC,\"%17[^\"]\"", _mac_buffer)
        && _parser.recv("OK"))) {
        return 0;
    }

    return _mac_buffer;
}

const char *Controller::getGateway()
{
    if (!(_parser.send("AT+CIPSTA?")
        && _parser.recv("+CIPSTA:gateway:\"%15[^\"]\"", _gateway_buffer)
        && _parser.recv("OK"))) {
        return 0;
    }

    return _gateway_buffer;
}

const char *Controller::getNetmask()
{
    if (!(_parser.send("AT+CIPSTA?")
        && _parser.recv("+CIPSTA:netmask:\"%15[^\"]\"", _netmask_buffer)
        && _parser.recv("OK"))) {
        return 0;
    }

    return _netmask_buffer;
}

int8_t Controller::getRSSI()
{
    int8_t rssi;
    char bssid[18];

   if (!(_parser.send("AT+CWJAP?")
        && _parser.recv("+CWJAP:\"%*[^\"]\",\"%17[^\"]\"", bssid)
        && _parser.recv("OK"))) {
        return 0;
    }

    if (!(_parser.send("AT+CWLAP=\"\",\"%s\",", bssid)
        && _parser.recv("+CWLAP:(%*d,\"%*[^\"]\",%hhd,", &rssi)
        && _parser.recv("OK"))) {
        return 0;
    }

    return rssi;
}

bool Controller::isConnected(void)
{
    return getIPAddress() != 0;
}

int Controller::scan(nsapi_wifi_ap_t *res, unsigned limit, filter_func_t *filter_func)
{
    unsigned cnt = 0;
    nsapi_wifi_ap_t ap;
    const char *_f = "scan";
    console_printf("%s%s...\n", _esp, _f); console_flush();  ////
    if (!_parser.send("AT+CWLAP")) {
        return NSAPI_ERROR_DEVICE_ERROR;
    }
    //  debug_bc95g = 1;  ////
    while (recv_ap(&ap)) {
        //  Call the filter function to determine if we should record this access point.
        const bool filter = filter_func ? filter_func(&ap, cnt) : true;
        if (!filter) { continue; }  //  Caller says skip this access point.

        if (cnt < limit) {
            memcpy(&res[cnt], &ap, sizeof(ap));  //  Copy the access point.
        }
        cnt++;
        if (limit != 0 && cnt >= limit) {
            break;
        }
    }
    //  Wait for the end of the response.
    if (!_parser.recv("OK\r\n")) { cnt = 0; }
    //  debug_bc95g = 0;  ////
    _log(_f, cnt > 0);
    return cnt;
}

bool Controller::open(const char *type, int id, const char* addr, int port)
{
    const char *_f = "open";
    //IDs only 0-4
    if(id > 4) {
        return false;
    }
    console_printf("%s%s...\n", _esp, _f);  console_flush();
    bool ret = _parser.send("AT+CIPSTART=%d,\"%s\",\"%s\",%d", id, type, addr, port)
        && _parser.recv("OK");
    _log(_f, ret);
    return ret;
}

bool Controller::send(int id, const void *data, uint32_t amount)
{
    //  May take a second try if device is busy
    const char *_f = "send";
    console_printf("%s%s %u...\n", _esp, _f, (unsigned) amount);  console_flush();
    for (unsigned i = 0; i < 2; i++) {
        if (_parser.send("AT+CIPSEND=%d,%d", id, amount)
            && _parser.recv(">")
            && _parser.write((char*)data, (int)amount) >= 0 
            && _parser.recv("SEND OK")) {
            _log(_f, true);
            return true;
        }
    }
    _log(_f, false);
    return false;
}

bool Controller::sendMBuf(int id,  struct os_mbuf *m0)
{
    //  Send the chain of mbufs.
    uint32_t amount = OS_MBUF_PKTLEN(m0);  //  Length of the mbuf chain.
    const char *_f = "send mbuf";
    console_printf("%s%s %u...\n", _esp, _f, (unsigned) amount);  console_flush();
    //  May take a second try if device is busy
    for (unsigned i = 0; i < 2; i++) {
        if (_parser.send("AT+CIPSEND=%d,%d", id, amount)
            && _parser.recv(">")) {
            struct os_mbuf *m = m0;
            bool failed = false;
            while (m) {  //  For each mbuf in the list...
                const char *data = OS_MBUF_DATA(m, const char *);  //  Fetch the data.
                int size = m->om_len;  //  Fetch the size.
                console_dump((const uint8_t *) data, size); console_printf("\n");
                if (_parser.write(data, size) < 0) {   //  If the writing failed, retry.
                    failed = true;
                    break;
                }
                m = m->om_next.sle_next;   //  Fetch next mbuf in the list.
            }
            if (failed) { break; }
            if (!_parser.recv("SEND OK")) { break; }
            _log(_f, true);  console_flush();
            return true;
        }
    }
    _log(_f, false);
    return false;
}

void Controller::_packet_handler()
{
    int id;
    uint32_t amount;

    // parse out the packet
    if (!_parser.recv(",%d,%d:", &id, &amount)) {
        return;
    }

    struct packet *packet = (struct packet*)malloc(
            sizeof(struct packet) + amount);
    if (!packet) {
        return;
    }

    packet->id = id;
    packet->len = amount;
    packet->next = 0;

    if (!(_parser.read((char*)(packet + 1), amount))) {
        free(packet);
        return;
    }

    // append to packet list
    *_packets_end = packet;
    _packets_end = &packet->next;
}

int32_t Controller::recv(int id, void *data, uint32_t amount)
{
    while (true) {
        // check if any packets are ready for us
        for (struct packet **p = &_packets; *p; p = &(*p)->next) {
            if ((*p)->id == id) {
                struct packet *q = *p;

                if (q->len <= amount) { // Return and remove full packet
                    memcpy(data, q+1, q->len);

                    if (_packets_end == &(*p)->next) {
                        _packets_end = p;
                    }
                    *p = (*p)->next;

                    uint32_t len = q->len;
                    free(q);
                    return len;
                } else { // return only partial packet
                    memcpy(data, q+1, amount);

                    q->len -= amount;
                    memmove(q+1, (uint8_t*)(q+1) + amount, q->len);

                    return amount;
                }
            }
        }

        // Wait for inbound packet
        if (!_parser.recv("OK")) {
            return -1;
        }
    }
}

bool Controller::close(int id)
{
    //May take a second try if device is busy
    for (unsigned i = 0; i < 2; i++) {
        if (_parser.send("AT+CIPCLOSE=%d", id)
            && _parser.recv("OK")) {
            return true;
        }
    }

    return false;
}

void Controller::setTimeout(uint32_t timeout_ms)
{
    _parser.setTimeout(timeout_ms);
}

bool Controller::readable()
{
    return _serial.readable();
}

bool Controller::writeable()
{
    return _serial.writeable();
}

void Controller::attach(void (*func)(void *), void *arg)
{
    _serial.attach(func, arg);
}

bool Controller::recv_ap(nsapi_wifi_ap_t *ap)
{
    //  Parse the next line of WiFi AP info received, which looks like:
    //  +CWLAP:(3,"HP-Print-54-Officejet 0000",-74,"8c:dc:d4:00:00:00",1,-34,0)
    int sec = -1, channel = -1;
    memset(ap, 0, sizeof(nsapi_wifi_ap_t));

    //  Note: This parsing fails with the implementation of vsscanf() in Baselibc.  See vsscanf.c in this directory for the fixed implementation.
    bool ret = _parser.recv("+CWLAP:(%d,\"%32[^\"]\",%hhd,\"%hhx:%hhx:%hhx:%hhx:%hhx:%hhx\",%d", &sec, ap->ssid,
                            &ap->rssi, &ap->bssid[0], &ap->bssid[1], &ap->bssid[2], &ap->bssid[3], &ap->bssid[4],
                            &ap->bssid[5], &channel);  //  "&channel" was previously "&ap->channel", which is incorrect because "%d" assigns an int not uint8_t.
    ap->channel = (uint8_t) channel;
    ap->security = sec < 5 ? (nsapi_security_t)sec : NSAPI_SECURITY_UNKNOWN;
    console_printf(ret ? "" /* "ESP ap OK\n" */ : "%sap%s", _esp, _okfailed(false));  //  Don't flush here, we are still receiving data.
    return ret;
}
