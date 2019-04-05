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
#include "sensor_coap.h"

#define OC_CLIENT_CB_TIMEOUT_SECS COAP_RESPONSE_TIMEOUT

static struct os_mbuf *oc_c_message;
static coap_packet_t oc_c_request[1];

static bool
dispatch_coap_request(void)
{
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
    oc_c_message = oc_allocate_mbuf(&cb->server.endpoint);
    if (!oc_c_message) {
        goto free_rsp;
    }
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
    return false;
}

bool
init_sensor_post(const char *uri, oc_server_handle_t *server, const char *query,
             oc_response_handler_t handler, oc_qos_t qos)
{
    oc_client_cb_t *cb;
    bool status = false;
    oc_string_t q;

    cb = oc_ri_alloc_client_cb(uri, server, OC_POST, handler, qos);
    if (!cb) {
        return false;
    }

    if (query && strlen(query)) {
        oc_concat_strings(&q, "?", query);
        status = prepare_coap_request(cb, &q);
        oc_free_string(&q);
    } else {
        status = prepare_coap_request(cb, NULL);
    }

    return status;
}

bool
do_sensor_post(void)
{
    return dispatch_coap_request();
}
