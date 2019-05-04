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
//  Post sensor data to CoAP server with JSON or CBOR encoding.  We call the Mynewt OIC
//  interface to encode and transmit CoAP messages.  For ESP8266, the OIC interface
//  is implemented by esp8266/transport.h.  This is a simpler version of oc_client_api 
//  that supports sensors and JSON.  Original version: repos\apache-mynewt-core\net\oic\src\api\oc_client_api.c

#include <os/mynewt.h>
#include <oic/port/mynewt/config.h>
#include <oic/messaging/coap/coap.h>
#include <oic/oc_buffer.h>
#include <oic/oc_client_state.h>
#include <console/console.h>
#include "sensor_coap/sensor_coap.h"

#define OC_CLIENT_CB_TIMEOUT_SECS COAP_RESPONSE_TIMEOUT

static struct os_mbuf *oc_c_message;  //  Contains the CoAP headers.
static struct os_mbuf *oc_c_rsp;      //  Contains the CoAP payload body.
static coap_packet_t oc_c_request[1]; //  CoAP request.
static struct os_sem oc_sem;          //  Because the CoAP JSON / CBOR buffers are shared, use this semaphore to prevent two CoAP requests from being composed at the same time.
static bool oc_sensor_coap_ready = false;  //  True if the Sensor CoAP is ready for sending sensor data.
static int oc_content_format = 0;          //  CoAP Payload encoding format: APPLICATION_JSON or APPLICATION_CBOR

///////////////////////////////////////////////////////////////////////////////
//  CoAP Functions

void init_sensor_coap(void) {
    //  Init the Sensor CoAP module. Called by sysinit() during startup, defined in pkg.yml.
    os_error_t rc = os_sem_init(&oc_sem, 1);  //  Init to 1 token, so only 1 caller will be allowed.
    assert(rc == OS_OK);
    oc_sensor_coap_ready = true;
}

bool sensor_coap_ready(void) {
    //  Return true if the Sensor CoAP is ready for sending sensor data.
    return oc_sensor_coap_ready;
}

static void handle_coap_response(oc_client_response_t *data) {
    //  Handle CoAP response.
    console_printf("handle_coap\n");
}

static bool
dispatch_coap_request(void)
{
    //  Serialise the CoAP request and payload into the final mbuf format for transmitting.
    //  Forward the serialised mbuf to the background transmit task for transmitting.
    bool ret = false;
    assert(oc_content_format);
    int response_length = 
        (oc_content_format == APPLICATION_JSON) ? json_rep_finalize() :
        (oc_content_format == APPLICATION_CBOR) ? oc_rep_finalize() :
        assert(0);  //  Unknown CoAP content format.

    if (response_length) {
        oc_c_request->payload_m = oc_c_rsp;
        oc_c_request->payload_len = response_length;
        coap_set_header_content_format(oc_c_request, oc_content_format);  //  Either JSON or CBOR.
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

        //  Deallocate the client callback for the message ID.  We won't be processing the response from server.  
        //  TODO: Handle errors from server.
        oc_ri_remove_client_cb_by_mid(oc_c_request->mid);

        oc_c_message = NULL;
        ret = true;
    }
    os_error_t rc = os_sem_release(&oc_sem);  //  Request completed.  Release the semaphore for another request.
    assert(rc == OS_OK);
    return ret;
}

static bool
prepare_coap_request(oc_client_cb_t *cb, oc_string_t *query)
{
    //  Prepare a new CoAP request for transmitting sensor data.
    coap_message_type_t type = COAP_TYPE_NON;

    oc_c_rsp = os_msys_get_pkthdr(0, 0);
    if (!oc_c_rsp) {
        return false;
    }
    oc_c_message = oc_allocate_mbuf(&cb->server.endpoint);
    if (!oc_c_message) {
        goto free_rsp;
    }
    
    if (oc_content_format == APPLICATION_JSON) { json_rep_new(oc_c_rsp); }
    else if (oc_content_format == APPLICATION_CBOR) { oc_rep_new(oc_c_rsp); }
    else { assert(0); }  //  Unknown CoAP content format.

    coap_init_message(oc_c_request, type, cb->method, cb->mid);
    coap_set_header_accept(oc_c_request, COAP_CONTENT_FORMAT);  //  Either JSON or CBOR.
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
init_sensor_post(struct oc_server_handle *server, const char *uri, int coap_content_format)
{
    //  Create a new sensor post request to send to CoAP server.
    assert(oc_sensor_coap_ready);  assert(server);  assert(uri);
#ifdef COAP_CONTENT_FORMAT
    //  If content format is not specified, select the default.
    if (coap_content_format == 0) { coap_content_format = COAP_CONTENT_FORMAT; }
#endif  //  COAP_CONTENT_FORMAT
    assert(coap_content_format != 0);  //  CoAP Content Format not specified

    //  Lock the semaphore for preparing the CoAP request.
    os_error_t rc = os_sem_pend(&oc_sem, OS_TIMEOUT_NEVER);  //  Allow only 1 task to be creating a sensor request at any time.
    assert(rc == OS_OK);

    oc_content_format = coap_content_format;
    oc_qos_t qos = LOW_QOS;  //  Default to low QoS, no transactions.
    oc_response_handler_t handler = handle_coap_response;
    oc_client_cb_t *cb;
    bool status = false;

    cb = oc_ri_alloc_client_cb(uri, server, OC_POST, handler, qos);
    if (!cb) {
        rc = os_sem_release(&oc_sem);  //  Failed.  Release the semaphore.
        assert(rc == OS_OK);
        return false;
    }
    status = prepare_coap_request(cb, NULL);
    return status;
}

bool
do_sensor_post(void)
{
    //  Send the sensor post request to CoAP server.
    return dispatch_coap_request();
}

#if MYNEWT_VAL(COAP_JSON_ENCODING)  //  If we are encoding the CoAP payload in JSON...

///////////////////////////////////////////////////////////////////////////////
//  JSON Encoding Functions

struct json_encoder coap_json_encoder;  //  Note: We don't support concurrent encoding of JSON messages.
struct json_value coap_json_value;
static struct os_mbuf *coap_json_mbuf;  //  The mbuf that contains the outgoing CoAP payload.

int json_write_mbuf(void *buf, char *data, int len) {
    //  Write the JSON to the mbuf for the outgoing CoAP message.
    assert(coap_json_mbuf);
    assert(data);
    //  console_printf("json "); console_buffer(data, len); console_printf("\n");  ////
    int rc = os_mbuf_append(coap_json_mbuf, data, len);  assert(rc == 0);
    if (rc) { return -1; }
    return 0;
}

void json_rep_new(struct os_mbuf *m) {
    //  Prepare to write a new JSON CoAP payload into the mbuf.
    assert(m);
    json_rep_reset();  //  Erase the JSON encoder.
    coap_json_mbuf = m;
}

void json_rep_reset(void) {
    //  Close the current JSON CoAP payload.  Erase the JSON encoder.
    coap_json_mbuf = NULL;
    memset(&coap_json_encoder, 0, sizeof(coap_json_encoder));  //  Erase the encoder.
    coap_json_encoder.je_write = json_write_mbuf;
}

int json_rep_finalize(void) {
    //  Finalise the payload and return the payload size.
    assert(coap_json_mbuf);
    int size = OS_MBUF_PKTLEN(coap_json_mbuf);
#define DUMP_COAP
#ifdef DUMP_COAP
    console_printf("CP> payload size %d\n", size); struct os_mbuf *m = coap_json_mbuf;
    while (m) {
        console_buffer((const char *) (m->om_databuf + m->om_pkthdr_len), m->om_len);
        m = m->om_next.sle_next;
    } console_printf("\n");
#endif  //  DUMP_COAP

    json_rep_reset();
    return size;
}

void json_rep_start_root_object(void) {
    //  Start the JSON representation.  Assume top level is object.
    //  --> {
    int rc = json_encode_object_start(&coap_json_encoder);  assert(rc == 0);
}

void json_rep_end_root_object(void) {
    //  End the JSON representation.  Assume top level is object.
    //  {... --> {...}
    int rc = json_encode_object_finish(&coap_json_encoder);  assert(rc == 0);
}

static int json_encode_value_ext(struct json_encoder *encoder, struct json_value *jv);
static void split_float(float f, bool *neg, int *i, int *d);

int
json_encode_object_entry_ext(struct json_encoder *encoder, char *key,
        struct json_value *val)
{
    //  Extended version of json_encode_object_entry that handles floats.  Original version: repos\apache-mynewt-core\encoding\json\src\json_encode.c
    int rc;

    if (encoder->je_wr_commas) {
        encoder->je_write(encoder->je_arg, ",", sizeof(",")-1);
        encoder->je_wr_commas = 0;
    }
    /* Write the key entry */
    encoder->je_write(encoder->je_arg, "\"", sizeof("\"")-1);
    encoder->je_write(encoder->je_arg, key, strlen(key));
    encoder->je_write(encoder->je_arg, "\": ", sizeof("\": ")-1);

    rc = json_encode_value_ext(encoder, val);
    if (rc != 0) {
        goto err;
    }
    encoder->je_wr_commas = 1;

    return (0);
err:
    return (rc);
}

static int
json_encode_value_ext(struct json_encoder *encoder, struct json_value *jv)
{
    //  Extended version of json_encode_value_ext that handles floats.  Original version: repos\apache-mynewt-core\encoding\json\src\json_encode.c
    int rc;
    int len;

    switch (jv->jv_type) {
        case JSON_VALUE_TYPE_EXT_FLOAT: {
            //  Encode the float with 2 decimal places.
            bool neg; int i, d;
            float f = jv->jv_val.fl;
            split_float(f, &neg, &i, &d);  //  Split the float into neg, integer and decimal parts (two decimal places)
            len = sprintf(
                encoder->je_encode_buf,
                "%s%d.%02d",
                neg ? "-" : "",  //  Sign
                i, //  Integer part
                d  //  2 decimal places
            );
            encoder->je_write(encoder->je_arg, encoder->je_encode_buf, len);
            break;
        }
        default:
            rc = -1;
            goto err;
    }


    return (0);
err:
    return (rc);
}

static void split_float(float f, bool *neg, int *i, int *d) {
    //  Split the float f into 3 parts: neg is true if negative, the absolute integer part i, and the decimal part d, with 2 decimal places.
    *neg = (f < 0.0f);                    //  True if f is negative
    float f_abs = *neg ? -f : f;          //  Absolute value of f
    *i = (int) f_abs;                     //  Integer part
    *d = ((int) (100.0f * f_abs)) % 100;  //  Two decimal places
}

#endif  //  MYNEWT_VAL(COAP_JSON_ENCODING)
