//  nRF24L01 Network Transport for Apache Mynewt.  This provides the OIC (Open Interconnect Consortium)
//  interface for the nRF24L01 Driver, so that we may compose and transmit CoAP requests using Mynewt's
//  OIC implementation.  More about Mynewt OIC: https://mynewt.apache.org/latest/os/modules/devmgmt/newtmgr.html
#include <os/os.h>
#include <console/console.h>
#include "nrf24l01/nrf24l01.h"
#include "nrf24l01/transport.h"

static void oc_tx_ucast(struct os_mbuf *m);
static uint8_t oc_ep_size(const struct oc_endpoint *oe);
static int oc_ep_has_conn(const struct oc_endpoint *);
static char *oc_ep_str(char *ptr, int maxlen, const struct oc_endpoint *);
static int oc_init(void);
static void oc_shutdown(void);
//  static void oc_event(struct os_event *ev);

static const char *network_device;     //  Name of the nRF24L01 device that will be used for transmitting CoAP messages e.g. "nrf24l01_0" 
static struct nrf24l01_server *server;  //  CoAP Server host and port.  We only support 1 server.
static uint8_t transport_id = -1;      //  Will contain the Transport ID allocated by Mynewt OIC.
static uint8_t nrf24l01_tx_buffer[NRF24L01_TRANSFER_SIZE];

//  Definition of nRF24L01 driver as a transport for CoAP.  Only 1 nRF24L01 driver instance supported.
static const struct oc_transport transport = {
    0,               //  uint8_t ot_flags;
    oc_ep_size,      //  uint8_t (*ot_ep_size)(const struct oc_endpoint *);
    oc_ep_has_conn,  //  int (*ot_ep_has_conn)(const struct oc_endpoint *);
    oc_tx_ucast,     //  void (*ot_tx_ucast)(struct os_mbuf *);
    NULL,  //  void (*ot_tx_mcast)(struct os_mbuf *);
    NULL,  //  enum oc_resource_properties *ot_get_trans_security)(const struct oc_endpoint *);
    oc_ep_str,    //  char *(*ot_ep_str)(char *ptr, int maxlen, const struct oc_endpoint *);
    oc_init,      //  int (*ot_init)(void);
    oc_shutdown,  //  void (*ot_shutdown)(void);
};

int nrf24l01_register_transport(const char *network_device0, struct nrf24l01_server *server0) {
    //  Register the nRF24L01 device as the transport for the specifed CoAP server.  
    //  network_device is the nRF24L01 device name e.g. "nrf24l01_0".  Return 0 if successful.
    assert(network_device0);  assert(server0);

    {   //  Lock the nRF24L01 driver for exclusive use.  Find the nRF24L01 device by name.
        struct nrf24l01 *dev = (struct nrf24l01 *) os_dev_open(network_device0, OS_TIMEOUT_NEVER, NULL);  //  network_device0 is "nrf24l01_0"
        assert(dev != NULL);

        //  Register nRF24L01 with Mynewt OIC to get Transport ID.
        transport_id = oc_transport_register(&transport);
        assert(transport_id >= 0);  //  Registration failed.

        //  Init the server endpoint before use.
        int rc = init_nrf24l01_server(server0);
        assert(rc == 0);

        //  nRF24L01 registered.  Remember the details.
        network_device = network_device0;
        server = server0;

        //  Close the nRF24L01 device when we are done.
        os_dev_close((struct os_dev *) dev);
    }   //  Unlock the nRF24L01 driver for exclusive use.
    return 0;
}

int init_nrf24l01_server(struct nrf24l01_server *server) {
    //  Init the server endpoint before use.  Returns 0.
    int rc = init_nrf24l01_endpoint(&server->endpoint);  assert(rc == 0);
    server->handle = (struct oc_server_handle *) server;
    return 0;
}

int init_nrf24l01_endpoint(struct nrf24l01_endpoint *endpoint) {
    //  Init the endpoint before use.  Returns 0.
    assert(transport_id >= 0);  //  Transport ID must be allocated by OIC.
    endpoint->ep.oe_type = transport_id;  //  Populate our transport ID so that OIC will call our functions.
    endpoint->ep.oe_flags = 0;
    return 0;
}

///////////////////////////////////////////////////////////////////////////////
//  OIC Callback Functions

static int nrf24l01_tx_mbuf(struct nrf24l01 *dev, struct os_mbuf *mbuf) {
    //  Transmit the mbuf chain: CoAP Payload only, not the CoAP Header.  Return the number of bytes transmitted.
    //  TODO: First mbuf is CoAP Header, skip it.  Transmit the second mbuf with the CoAP Payload.
    //  TODO: Set packet size
    int rc = 0;
    struct os_mbuf *m = mbuf;
    int mbuf_num = 0;
    while (m) {  //  For each mbuf in the list...
        const char *data = OS_MBUF_DATA(m, const char *);  //  Fetch the data.
        int size = m->om_len;  //  Fetch the size.
        console_printf("nrf %s len %02d: ", (mbuf_num == 0 ? "header" : "payload"), size);
        console_dump((const uint8_t *) data, size); console_printf("\n");
        if (mbuf_num == 1) {  //  If this is the second mbuf, i.e. the payload...
            //  Transmit the mbuf.
            if (size <= 0 || size > NRF24L01_TRANSFER_SIZE) { rc = 0; break; }  //  Too small or too big, quit.

            //  Zero the buffer.  Copy into the buffer.
            memset(nrf24l01_tx_buffer, 0, NRF24L01_TRANSFER_SIZE);
            memcpy(nrf24l01_tx_buffer, data, size);

            //  TODO Remove: Set the tx counter in last byte.
            static uint8_t tx_count = 0;  nrf24l01_tx_buffer[NRF24L01_TRANSFER_SIZE - 1] = tx_count++;  ////

            //  On Sensor Node: Transmit the data to Collector Node.
            rc = nrf24l01_send(dev, nrf24l01_tx_buffer, NRF24L01_TRANSFER_SIZE);
            assert(rc != -1);
            break;
        }
        mbuf_num++;
        m = m->om_next.sle_next;   //  Fetch next mbuf in the list.
    }
    console_flush();
    return rc;
}

/* mbuf should contain:
Header:
58 02 00 01 00 00 16 4a 27 2a e2 39 b2 76 32 06 74 68 69 6e 67 73 0d 1e 49 56 52 69 42 43 63 52 36 48 50 70 5f 43 63 5a 49 46 66 4f 5a 46 78 7a 5f 69 7a 6e 69 35 78 63 5f 4b 4f 2d 6b 67 53 41 32 59 38 11 3c 51 3c ff 
Payload:
bf 63 22 74 22 19 0f a0 ff 
*/

static void oc_tx_ucast(struct os_mbuf *m) {
    //  Transmit the chain of mbufs to the network.  First mbuf is CoAP header, remaining mbufs contain the CoAP payload.

    //  Find the endpoint header.  Should be the end of the packet header of the first packet.
    assert(m);  assert(OS_MBUF_USRHDR_LEN(m) >= sizeof(struct nrf24l01_endpoint));
    struct nrf24l01_endpoint *endpoint = (struct nrf24l01_endpoint *) OC_MBUF_ENDPOINT(m);

    assert(endpoint);  assert(endpoint->host);  assert(endpoint->port);  //  Host and endpoint should be in the endpoint.
    assert(server);  assert(endpoint->host == server->endpoint.host);  assert(endpoint->port == server->endpoint.port);  //  We only support 1 server connection. Must match the message endpoint.
    assert(network_device);
    int rc;

    {   //  Lock the nRF24L01 driver for exclusive use.  Find the nRF24L01 device by name.
        struct nrf24l01 *dev = (struct nrf24l01 *) os_dev_open(network_device, OS_TIMEOUT_NEVER, NULL);  //  network_device is "nrf24l01_0"
        assert(dev != NULL);
        console_printf("nrf tx mbuf\n");

        //  Transmit the CoAP Payload only, not the CoAP Header.
        rc = nrf24l01_tx_mbuf(dev, m);  
        assert(rc > 0);

        //  Close the nRF24L01 device when we are done.
        os_dev_close((struct os_dev *) dev);
    }   //  Unlock the nRF24L01 driver for exclusive use.

    //  After sending, free the chain of mbufs.
    rc = os_mbuf_free_chain(m);  assert(rc == 0);
}

static uint8_t oc_ep_size(const struct oc_endpoint *oe) {
    //  Return the size of the endpoint.  OIC will allocate space to store this endpoint in the transmitted mbuf.
    return sizeof(struct nrf24l01_endpoint);
}

static int oc_ep_has_conn(const struct oc_endpoint *oe) {
    //  Return true if the endpoint is connected.  We always return false.
    console_printf("oc_ep_has_conn\n");
    return 0;
}

static char *oc_ep_str(char *ptr, int maxlen, const struct oc_endpoint *oe) {
    //  Log the endpoint message.
    console_printf("oc_ep_str\n");
#ifdef NOTUSED
    const struct oc_endpoint_ip *oe_ip = (const struct oc_endpoint_ip *)oe;
    int len;
    mn_inet_ntop(MN_PF_INET, oe_ip->v4.address, ptr, maxlen);
    len = strlen(ptr);
    snprintf(ptr + len, maxlen - len, "-%u", oe_ip->port);
    return ptr;
#endif  //  NOTUSED
    strcpy(ptr, "TODO:oc_ep_str");
    return ptr;
}

static int oc_init(void) {
    //  Init the endpoint.
    console_printf("oc_init\n");
    return 0;
}

static void oc_shutdown(void) {
    //  Shutdown the endpoint.
    console_printf("oc_shutdown\n");
}
