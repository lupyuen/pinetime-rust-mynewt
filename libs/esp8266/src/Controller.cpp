//  Ported from https://os.mbed.com/teams/ESP8266/code/esp8266-driver/file/6946b0b9e323/ESP8266/ESP8266.cpp/
/* ESP8266 Example
 * Copyright (c) 2015 ARM Limited
 *
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
#include "esp8266/network.h"
#include "Controller.h"

extern "C" int debug_vrecv;  ////

void ESP8266::init(char *txbuf, uint32_t txbuf_size, char *rxbuf, uint32_t rxbuf_size, 
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

void ESP8266::configure(int uart) {
    _uart = uart;
    _serial.configure(uart);
}

void packet_handler(void *arg) {
    assert(arg != NULL);
    ((ESP8266 *)arg)->_packet_handler();
}

bool ESP8266::setEcho(bool echoEnabled) {
    //  Turn command echoing on or off.
    for (int i = 0; i < 2; i++) {  //  Try twice in case of error...
        if (
            _parser.send(       //  Send echo on or off command.
                echoEnabled 
                ? "\r\nATE1"
                : "\r\nATE0"
            ) &&
            _parser.recv("OK")  //  Wait for OK response.
        ) {
            console_printf("ESP setEcho OK\n"); console_flush(); return true; 
        }
    }
    console_printf("ESP setEcho FAILED\n"); console_flush(); 
    return false;
}

bool ESP8266::startup(int mode)
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

bool ESP8266::reset(void)
{
    //  debug_vrecv = 1;  ////    
    bool ret = false;
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
    console_printf(ret ? "ESP reset OK\n" : "ESP reset FAILED\n"); console_flush(); 
    //  debug_vrecv = 0;  ////    
    return true;
}

bool ESP8266::dhcp(bool enabled, int mode)
{
    //only 3 valid modes
    if(mode < 0 || mode > 2) {
        return false;
    }

    return _parser.send("AT+CWDHCP=%d,%d", enabled?1:0, mode)
        && _parser.recv("OK");
}

bool ESP8266::connect(const char *ap, const char *passPhrase)
{
    bool ret = _parser.send("AT+CWJAP=\"%s\",\"%s\"", ap, passPhrase)
        && _parser.recv("OK");
    console_printf(ret ? "ESP connect OK\n" : "ESP connect FAILED\n");  console_flush();
    return ret;
}

bool ESP8266::disconnect(void)
{
    return _parser.send("AT+CWQAP") && _parser.recv("OK");
}

const char *ESP8266::getIPAddress(void)
{
    if (!(_parser.send("AT+CIFSR")
        && _parser.recv("+CIFSR:STAIP,\"%15[^\"]\"", _ip_buffer)
        && _parser.recv("OK"))) {
        return 0;
    }

    return _ip_buffer;
}

const char *ESP8266::getMACAddress(void)
{
    if (!(_parser.send("AT+CIFSR")
        && _parser.recv("+CIFSR:STAMAC,\"%17[^\"]\"", _mac_buffer)
        && _parser.recv("OK"))) {
        return 0;
    }

    return _mac_buffer;
}

const char *ESP8266::getGateway()
{
    if (!(_parser.send("AT+CIPSTA?")
        && _parser.recv("+CIPSTA:gateway:\"%15[^\"]\"", _gateway_buffer)
        && _parser.recv("OK"))) {
        return 0;
    }

    return _gateway_buffer;
}

const char *ESP8266::getNetmask()
{
    if (!(_parser.send("AT+CIPSTA?")
        && _parser.recv("+CIPSTA:netmask:\"%15[^\"]\"", _netmask_buffer)
        && _parser.recv("OK"))) {
        return 0;
    }

    return _netmask_buffer;
}

int8_t ESP8266::getRSSI()
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

bool ESP8266::isConnected(void)
{
    return getIPAddress() != 0;
}

int ESP8266::scan(nsapi_wifi_ap_t *res, unsigned limit, filter_func_t *filter_func)
{
    unsigned cnt = 0;
    nsapi_wifi_ap_t ap;
    if (!_parser.send("AT+CWLAP")) {
        return NSAPI_ERROR_DEVICE_ERROR;
    }
    //  debug_vrecv = 1;  ////
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
    //  debug_vrecv = 0;  ////
    console_printf(cnt > 0 ? "ESP scan OK\n" : "ESP scan FAILED\n"); console_flush();  ////
    return cnt;
}

bool ESP8266::open(const char *type, int id, const char* addr, int port)
{
    //IDs only 0-4
    if(id > 4) {
        return false;
    }

    bool ret = _parser.send("AT+CIPSTART=%d,\"%s\",\"%s\",%d", id, type, addr, port)
        && _parser.recv("OK");
    console_printf(ret ? "ESP open OK\n" : "ESP open FAILED\n");  console_flush();
    return ret;
}

bool ESP8266::send(int id, const void *data, uint32_t amount)
{
    //  May take a second try if device is busy
    for (unsigned i = 0; i < 2; i++) {
        if (_parser.send("AT+CIPSEND=%d,%d", id, amount)
            && _parser.recv(">")
            && _parser.write((char*)data, (int)amount) >= 0 
            && _parser.recv("SEND OK")) {
            console_printf("ESP send OK: %u\n", (unsigned) amount);  console_flush();
            return true;
        }
    }
    console_printf("ESP send FAILED: %u\n", (unsigned) amount);  console_flush();
    return false;
}

bool ESP8266::sendMBuf(int id,  struct os_mbuf *m0)
{
    //  Send the chain of mbufs.
    uint32_t amount = OS_MBUF_PKTLEN(m0);  //  Length of the mbuf chain.
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
            console_printf("ESP send mbuf OK: %u\n", (unsigned) amount);  console_flush();
            return true;
        }
    }
    console_printf("ESP send mbuf FAILED: %u\n", (unsigned) amount);  console_flush();
    return false;
}

void ESP8266::_packet_handler()
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

int32_t ESP8266::recv(int id, void *data, uint32_t amount)
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

bool ESP8266::close(int id)
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

void ESP8266::setTimeout(uint32_t timeout_ms)
{
    _parser.setTimeout(timeout_ms);
}

bool ESP8266::readable()
{
    return _serial.readable();
}

bool ESP8266::writeable()
{
    return _serial.writeable();
}

void ESP8266::attach(void (*func)(void *), void *arg)
{
    _serial.attach(func, arg);
}

bool ESP8266::recv_ap(nsapi_wifi_ap_t *ap)
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
    console_printf(ret ? "ESP ap OK\n" : "ESP ap FAILED\n");  //  Don't flush here, we are still receiving data.
    return ret;
}

#ifdef NOTUSED  
    //  Test for vsscanf() end-of-match bug in Baselibc...
    int sec, rssi;
    int rc = sscanf(
        "+CWLAP:(3,\"HP-Print-54-Officejet 0000\",-74,"
        //  "\"8c:dc:d4:00:00:00\",1,-34,0)"
        ,
        "+CWLAP:(%d,\"%32[^\"]\",%d,"
        //  "\"%hhx:%hhx:%hhx:%hhx:%hhx:%hhx\",%d,"
        , 
        &sec, ap->ssid, &rssi 
        //  ,&ap->bssid[0], &ap->bssid[1], &ap->bssid[2], &ap->bssid[3], &ap->bssid[4], &ap->bssid[5], &channel
    );
    //  Should return rc=3, rssi=-74.  Buggy version of vsscanf() returns rc=2, rssi=some other value.
    console_printf("sscanf %d\n", rc);

    //  Test for vsscanf() ignore-match bug in Baselibc...
    int count = -1;
    int rc = sscanf(
        "+CWLAP:(3,\"HP\",-74,\"8c:dc:d4:00:00:00\",1,-34,0)"
        ,
        "+CWLAP:(%*d,\"%*32[^\"]\",%n"
        ,
        &count
    );
    //  Shoud return rc=0, count=15.  Buggy version of vsscanf() returns count<15
    console_printf("sscanf %d / %d\n", rc, count); console_flush();        
#endif  //  NOTUSED
