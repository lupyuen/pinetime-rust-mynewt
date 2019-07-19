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

#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "ATParser.h"

/** ControllerInterface class.
    This is an interface to a Controller radio.
 */
class Controller
{
public:
    /** Create an Controller interface
     *  @param txbuf TX static buffer. Passing in the buffer avoids dynamic memory allocation (new, delete)
     *  @param txbuf_size TX buffer size
     *  @param rxbuf RX static buffer. Passing in the buffer avoids dynamic memory allocation (new, delete)
     *  @param txbuf_size RX buffer size
     *  @param parserbuf parser static buffer. Passing in the buffer avoids dynamic memory allocation (new, delete)
     *  @param parserbuf_size parser buffer size
     *  @param debug set to true to show debug messages
     */
    void init(char *txbuf, uint32_t txbuf_size, char *rxbuf, uint32_t rxbuf_size, char *parserbuf, uint32_t parserbuf_size, bool debug = false);

    /** Configure the Controller interface
     *  @param uart UART port number. For STM32 Blue Pill, 0 means UART2
     */
    void configure(int uart);

    bool sendCommand(enum CommandID cmdID);

    /** Enable or disable Controller command echo
     *  @param echoEnabled true if echo should be enabled
     */
    bool setEcho(bool echoEnabled);

    /**
    * Startup the Controller
    *
    * @param mode mode of WIFI 1-client, 2-host, 3-both
    * @return true only if Controller was setup correctly
    */
    bool startup(int mode);

    /**
    * Reset Controller
    *
    * @return true only if Controller resets successfully
    */
    bool reset(void);

    /**
    * Enable/Disable DHCP
    *
    * @param enabled DHCP enabled when true
    * @param mode mode of DHCP 0-softAP, 1-station, 2-both
    * @return true only if Controller enables/disables DHCP successfully
    */
    bool dhcp(bool enabled, int mode);

    /**
    * Connect Controller to AP
    *
    * @param ap the name of the AP
    * @param passPhrase the password of AP
    * @return true only if Controller is connected successfully
    */
    bool connect(const char *ap, const char *passPhrase);

    /**
    * Disconnect Controller from AP
    *
    * @return true only if Controller is disconnected successfully
    */
    bool disconnect(void);

    /**
    * Get the IP address of Controller
    *
    * @return null-teriminated IP address or null if no IP address is assigned
    */
    const char *getIPAddress(void);

    /**
    * Get the MAC address of Controller
    *
    * @return null-terminated MAC address or null if no MAC address is assigned
    */
    const char *getMACAddress(void);

     /** Get the local gateway
     *
     *  @return         Null-terminated representation of the local gateway
     *                  or null if no network mask has been recieved
     */
    const char *getGateway();

    /** Get the local network mask
     *
     *  @return         Null-terminated representation of the local network mask 
     *                  or null if no network mask has been recieved
     */
    const char *getNetmask();

    /* Return RSSI for active connection
     *
     * @return      Measured RSSI
     */
    int8_t getRSSI();

    /**
    * Check if Controller is conenected
    *
    * @return true only if the chip has an IP address
    */
    bool isConnected(void);

    /** Scan for available networks
     *
     * @param  ap    Pointer to allocated array to store discovered AP
     * @param  limit Size of allocated @a res array, or 0 to only count available AP
     * @param  filter_func Filter function will be called with the current AP and saved row count.  Return true if the AP should be saved.
     * @return       Number of entries in @a res, or if @a count was 0 number of available networks, negative on error
     *               see @a nsapi_error
     */
    int scan(nsapi_wifi_ap_t *res, unsigned limit, filter_func_t *filter_func = NULL);

    /**
    * Open a socketed connection
    *
    * @param type the type of socket to open "UDP" or "TCP"
    * @param id id to give the new socket, valid 0-4
    * @param port port to open connection with
    * @param addr the IP address of the destination
    * @return true only if socket opened successfully
    */
    bool open(const char *type, int id, const char* addr, int port);

    /**
    * Sends data to an open socket
    *
    * @param id id of socket to send to
    * @param data data to be sent
    * @param amount amount of data to be sent - max 1024
    * @return true only if data sent successfully
    */
    bool send(int id, const void *data, uint32_t amount);

    /**
    * Sends chain of mbufs to an open socket
    *
    * @param id id of socket to send to
    * @param m0 chain of mbufs to be sent
    * @return true only if data sent successfully
    */
    bool sendMBuf(int id,  struct os_mbuf *m0);

    /**
    * Receives data from an open socket
    *
    * @param id id to receive from
    * @param data placeholder for returned information
    * @param amount number of bytes to be received
    * @return the number of bytes received
    */
    int32_t recv(int id, void *data, uint32_t amount);

    /**
    * Closes a socket
    *
    * @param id id of socket to close, valid only 0-4
    * @return true only if socket is closed successfully
    */
    bool close(int id);

    /**
    * Allows timeout to be changed between commands
    *
    * @param timeout_ms timeout of the connection
    */
    void setTimeout(uint32_t timeout_ms);

    /**
    * Checks if data is available
    */
    bool readable();

    /**
    * Checks if data can be written
    */
    bool writeable();

    /**
    * Attach a function to call whenever network state has changed
    *
    * @param func A pointer to a void function, or 0 to set as none
    */
    void attach(void (*func)(void *), void *arg);

    void _packet_handler();
    int _uart;
private:
    BufferedSerial _serial;
    ATParser _parser;

    struct packet {
        struct packet *next;
        int id;
        uint32_t len;
        // data follows
    } *_packets, **_packets_end;
    bool recv_ap(nsapi_wifi_ap_t *ap);

    char _ip_buffer[16];
    char _gateway_buffer[16];
    char _netmask_buffer[16];
    char _mac_buffer[18];
};

#endif
