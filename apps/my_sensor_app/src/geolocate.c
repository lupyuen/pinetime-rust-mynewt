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

    //  Scan for nearby WiFi access points and take the first 3 (or fewer) access points.
    //  TODO: If ESP8266 is connected to a mobile hotspot, we should remove the mobile hotspot access point from the list.
    int rc = esp8266_scan(itf, wifi_aps, MAX_WIFI_AP); assert(rc > 0 && rc <= MAX_WIFI_AP);

    //  Wait 5 seconds to clear the remaining ESP8266 input beyond the first 3 access points.
    os_time_delay(5 * OS_TICKS_PER_SEC);

    //  Send the first 3 access points (or fewer) to thethings.io, which will call Google Geolocation API.
    send_wifi_access_points(server, uri, wifi_aps, rc);  
    return rc;
}

static char buf[20];  //  Buffer for JSON keys and values.  Long enough to hold a MAC address like "00:25:9c:cf:1c:ac"

static void send_wifi_access_points(struct oc_server_handle *server, const char *uri, 
    const nsapi_wifi_ap_t *access_points, int length) {
    //  Send the list of WiFI access point info (MAC Address and Signal Strength)
    //  over CoAP to specified thethings.io server and uri.  The CoAP body should look like:
    //  {"values":[
    //    {"key":"ssid0", "value":"00:25:9c:cf:1c:ac"},
    //    {"key":"rssi0", "value":-43.0},
    //    {"key":"ssid1", "value":"00:25:9c:cf:1c:ad"},
    //    {"key":"rssi1", "value":-43.0},
    //    {"key":"ssid2", "value":"00:25:9c:cf:1c:ae"},
    //    {"key":"rssi2", "value":-43.0}
    //  ]}
    //  We use float instead of int for rssi because int doesn't support negative values.

    //  Create a CoAP request.
    assert(server);  assert(uri);  assert(length > 0);
    int rc = init_sensor_post(server, uri);  assert(rc != 0);

    //  Populate the CoAP request body in JSON format.
    int i;
    rep_start_root_object();                              //  Create the root.
        rep_set_array(root, values);                      //  Create "values" as an array of objects.
            for (i = 0; i < length; i++) {                //  Loop for the 3 access points (or fewer)...
                const nsapi_wifi_ap_t *ap = access_points + i;
                //  Write the item {"key":"ssid1", "value":"00:25:9c:cf:1c:ac"}
                rep_object_array_start_item(values);       //  Create a new item in the "values" array.
                    sprintf(buf, "ssid%d", i);             //  e.g. ssid0
                    rep_set_text_string(values, key, buf); //  Set the key.

                    sprintf(buf, 
                        "%02x:%02x:%02x:%02x:%02x:%02x",   //  e.g. 00:25:9c:cf:1c:ac
                        ap->bssid[0], ap->bssid[1], ap->bssid[2],
                        ap->bssid[3], ap->bssid[4], ap->bssid[5]);
                    rep_set_text_string(values, value, buf); //  Set the value.
                rep_object_array_end_item(values);         //  Close the item in the "values" array.

                //  Write the item {"key":"rssi1", "value":-43}
                rep_object_array_start_item(values);       //  Create a new item in the "values" array.
                    sprintf(buf, "rssi%d", i);             //  e.g. rssi0
                    rep_set_text_string(values, key, buf); //  Set the key.
                    rep_set_double(values, value, ap->rssi);  //  Set the value, e.g. -43
                rep_object_array_end_item(values);         //  Close the item in the "values" array.
            }
        rep_close_array(root, values);                    //  Close the "values" array.
    rep_end_root_object();                                //  Close the root.

    //  Forward the CoAP request to the CoAP Background Task for transmission.
    rc = do_sensor_post();  assert(rc != 0);
    console_printf("  > send wifi ap\n");
}
