//  Compute geolocation by sending your WiFi access point info to Google Geolocation API.
//  Note: Don't enable this unless you understand the privacy implications. Your location may be accessible by others.
#include <os/os.h>
#include <console/console.h>
#include "sensor_coap.h"
#include "esp8266_driver.h"
#include "geolocate.h"

#define MAX_WIFI_AP 3  //  Scan at most 3 WiFi access points.

static nsapi_wifi_ap_t wifi_aps[MAX_WIFI_AP];  //  List of scanned WiFi access points.

static void send_wifi_access_points(struct oc_server_handle *server, const char *uri, 
    const nsapi_wifi_ap_t *access_points, int length);

int geolocate(struct sensor_itf *itf, struct oc_server_handle *server, const char *uri) {
    //  Scan for WiFi access points in your area.  Send the MAC Address and signal strength of
    //  the first 3 access points to thethings.io.  itf is the ESP8266 interface.
    //  Return the number of access points transmitted.
    //  Note: Don't enable this unless you understand the privacy implications. Your location may be accessible by others.
    int rc = esp8266_scan(itf, wifi_aps, MAX_WIFI_AP); assert(rc > 0 && rc <= MAX_WIFI_AP);
    os_time_delay(5 * OS_TICKS_PER_SEC);  //  Wait 5 seconds to clear the remaining ESP8266 input.
    send_wifi_access_points(server, uri, wifi_aps, rc);

    //    "macAddress": "00:25:9c:cf:1c:ac", "signalStrength": -43,
    console_printf("*** %02x\n", 0xa);
    return rc;
}

static void send_wifi_access_points(struct oc_server_handle *server, const char *uri, 
    const nsapi_wifi_ap_t *access_points, int length) {
    //  Send the list of WiFI access point info (MAC Address and Signal Strength)
    //  over CoAP to specified thethings.io server and uri.  The CoAP body should look like:
    //  {"values":[
    //    {"key":"macAddress",     "value":"00:25:9c:cf:1c:ac"},
    //    {"key":"signalStrength", "value":-43}
    //  ]}

    //  Create a CoAP request.
    assert(server);  assert(uri);  assert(length > 0);
    int rc = init_sensor_post(server, uri);  assert(rc != 0);

    //  Populate the CoAP request body in JSON format.
    int i;
    rep_start_root_object();                              //  Create the root.
        rep_set_array(root, values);                      //  Create "values" as an array of objects.
            for (i = 0; i < length; i++) {
                const nsapi_wifi_ap_t *ap = access_points + i;
                rep_object_array_start_item(values);          //  Create a new item in the "values" array.
                    //  Each child of "values" is an object with the sensor values.
                    rep_set_text_string(values, key, "macAddress");  //  Set the key.
                    rep_set_int     (values, value, "TODO");    //  Set the value.
                rep_object_array_end_item(values);            //  Close the item in the "values" array.

                rep_object_array_start_item(values);          //  Create a new item in the "values" array.
                    //  Each child of "values" is an object with the sensor values.
                    rep_set_text_string(values, key, "signalStrength");  //  Set the key.
                    rep_set_int     (values, value, ap->rssi);    //  Set the value.
                rep_object_array_end_item(values);            //  Close the item in the "values" array.
            }
        rep_close_array(root, values);                    //  Close the "values" array.
    rep_end_root_object();                                //  Close the root.

    //  Forward the CoAP request to the CoAP Background Task for transmission.
    rc = do_sensor_post();  assert(rc != 0);
    console_printf("  > send wifi ap\n");
}
