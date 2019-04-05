//  Post sensor data to CoAP server with JSON or CBOR encoding.
//  Simpler version of oc_client_api that supports sensors and JSON.  Original version: repos\apache-mynewt-core\net\oic\src\api\oc_client_api.c
/*
    // Copyright (c) 2016 Intel Corporation
    //
    // Licensed under the Apache License, Version 2.0 (the "License");
    // you may not use this file except in compliance with the License.
    // You may obtain a copy of the License at
    //
    //      http://www.apache.org/licenses/LICENSE-2.0
    //
    // Unless required by applicable law or agreed to in writing, software
    // distributed under the License is distributed on an "AS IS" BASIS,
    // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    // See the License for the specific language governing permissions and
    // limitations under the License.
*/

#include <os/mynewt.h>
#include <oic/port/mynewt/config.h>
#include <oic/messaging/coap/coap.h>
#include <oic/oc_buffer.h>
#include <console/console.h>
#include "sensor_coap.h"

#define OC_CLIENT_CB_TIMEOUT_SECS COAP_RESPONSE_TIMEOUT

static struct os_mbuf *oc_c_message;
static struct os_mbuf *oc_c_rsp;
static coap_packet_t oc_c_request[1];

///////////////////////////////////////////////////////////////////////////////
//  CoAP Functions

static void handle_coap_response(oc_client_response_t *data) {
    console_printf("handle_coap\n"); console_flush();
}

static bool
dispatch_coap_request(void)
{
    int response_length = oc_rep_finalize();

    if (response_length) {
        oc_c_request->payload_m = oc_c_rsp;
        oc_c_request->payload_len = response_length;
        coap_set_header_content_format(oc_c_request, APPLICATION_CBOR);  //  TODO: Support JSON
    } else {
        os_mbuf_free_chain(oc_c_rsp);
    }
    oc_c_rsp = NULL;

    if (oc_c_message) {
        if (!coap_serialize_message(oc_c_request, oc_c_message)) {
            coap_send_message(oc_c_message, 0);
        } else {
            os_mbuf_free_chain(oc_c_message);
        }
        oc_c_message = NULL;
        return true;
    }
    return false;
}

static bool
prepare_coap_request(oc_client_cb_t *cb, oc_string_t *query)
{
    coap_message_type_t type = COAP_TYPE_NON;

    oc_c_rsp = os_msys_get_pkthdr(0, 0);
    if (!oc_c_rsp) {
        return false;
    }
    oc_c_message = oc_allocate_mbuf(&cb->server.endpoint);
    if (!oc_c_message) {
        goto free_rsp;
    }
    oc_rep_new(oc_c_rsp);

    coap_init_message(oc_c_request, type, cb->method, cb->mid);
    coap_set_header_accept(oc_c_request, APPLICATION_CBOR);  //  TODO
    coap_set_token(oc_c_request, cb->token, cb->token_len);
    coap_set_header_uri_path(oc_c_request, oc_string(cb->uri));
    if (cb->observe_seq != -1) {
        coap_set_header_observe(oc_c_request, cb->observe_seq);
    }
    if (query && oc_string_len(*query)) {
        coap_set_header_uri_query(oc_c_request, oc_string(*query));
    }
    if (cb->observe_seq == -1 && cb->qos == LOW_QOS) {
        os_callout_reset(&cb->callout,
          OC_CLIENT_CB_TIMEOUT_SECS * OS_TICKS_PER_SEC);
    }

    return true;
free_rsp:
    os_mbuf_free_chain(oc_c_rsp);
    oc_c_rsp = NULL;
    return false;
}

bool
init_sensor_post(oc_server_handle_t *server, const char *uri)
{
    assert(server);
    assert(uri);
    oc_qos_t qos = LOW_QOS;  //  Default to low QoS, no transactions.
    oc_response_handler_t handler = handle_coap_response;
    oc_client_cb_t *cb;
    bool status = false;

    cb = oc_ri_alloc_client_cb(uri, server, OC_POST, handler, qos);
    if (!cb) {
        return false;
    }
    status = prepare_coap_request(cb, NULL);
    return status;
}

bool
do_sensor_post(void)
{
    return dispatch_coap_request();
}

#ifdef COAP_JSON_ENCODING  //  If we are encoding the CoAP payload in JSON...

///////////////////////////////////////////////////////////////////////////////
//  JSON Encoding Functions

struct json_encoder coap_json_encoder;  //  Note: We don't support concurrent encoding of JSON messages.
struct json_value coap_json_value;

int coap_write_json(void *buf, char *data, int len) {
    console_printf("JSON: "); console_buffer(data, len); console_printf("\n"); console_flush();  ////
    return 0;
}

void json_rep_start_root_object(void) {
    //  Start the JSON represengtation.  Assume top level is object.
    //  --> {
    memset(&coap_json_encoder, 0, sizeof(coap_json_encoder));  //  Erase the encoder.
    coap_json_encoder.je_write = coap_write_json;
    int rc = json_encode_object_start(&coap_json_encoder);  assert(rc == 0);
}

void json_rep_end_root_object(void) {
    //  End the JSON represengtation.  Assume top level is object.
    //  {... --> {...}
    int rc = json_encode_object_finish(&coap_json_encoder);  assert(rc == 0);
}

#endif  //  COAP_JSON_ENCODING
