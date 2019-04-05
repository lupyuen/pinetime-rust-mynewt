#ifndef __SENSOR_COAP_H__
#define __SENSOR_COAP_H__
#include <oic/oc_api.h>

#ifdef __cplusplus
extern "C" {
#endif

//  Create a new sensor post request to send to CoAP server.
bool init_sensor_post(const char *uri, oc_server_handle_t *server, const char *query,
    oc_response_handler_t handler, oc_qos_t qos);

//  Send the sensor post request to CoAP server.
bool do_sensor_post(void);

#ifdef __cplusplus
}
#endif

#endif  //  __SENSOR_COAP_H__
