//  Compute geolocation by sending your WiFi access point info to Google Geolocation API.
//  Note: Don't enable this unless you understand the privacy implications. Your location may be accessible by others.

#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#if MYNEWT_VAL(WIFI_GEOLOCATION)  //  If WiFi Geolocation is enabled...

#include <os/os.h>
#include <console/console.h>
#include <sensor_coap/sensor_coap.h>
#include <esp8266/esp8266.h>
#include "geolocate.h"

#define MAX_WIFI_AP 3  //  Scan at most 3 WiFi access points.
#define ANY -1         //  Wildcard in a MAC address pattern that matches any value for a byte.
#define LAST_MAC_PATTERN { 0, 0, 0, 0, 0, 0 }  //  skip_ssid must end with LAST_MAC_PATTERN

typedef int16_t mac_pattern[6];  //  MAC address pattern for filtering out unwanted SSID MAC addresses.

//  Skip SSIDs that match these MAC addresses.  Add your mobile hotspots here because they 
//  are not useful for WiFi geolocation.  ANY is a wildcard that matches any value for a byte.
static mac_pattern skip_ssid[] = {
    { 0xfc, 0xe9, 0x98, ANY, ANY, ANY },  //  Exclude my iPhone hotspot, which has address fc:39:98:*:*:*
    { 0x00, 0x87, 0x01, ANY, ANY, ANY },  //  Exclude Samsung mobile hotspots, which have address 00:87:01:*:*:*
    LAST_MAC_PATTERN
};

static nsapi_wifi_ap_t wifi_aps[MAX_WIFI_AP];  //  List of scanned WiFi access points.

static void write_wifi_access_points(const nsapi_wifi_ap_t *access_points, int length);
static bool filter_func(nsapi_wifi_ap_t *ap, unsigned count);
static bool mac_matches_pattern(uint8_t bssid[6], mac_pattern *pattern);
static bool similar_mac(uint8_t bssid1[6], uint8_t bssid2[6]);

int geolocate(struct esp8266 *dev, struct oc_server_handle *server, const char *uri) {
    //  Scan for WiFi access points in your area.  Send the MAC Address and signal strength of
    //  the first 3 access points (or fewer) to thethings.io at the specified CoAP server and uri.  
    //  dev is the ESP8266 device.  Return the number of access points transmitted.
    //  Note: Don't enable this unless you understand the privacy implications. Your location may be accessible by others.
    assert(dev);  assert(server);  assert(uri);

    //  Create a CoAP request.  This will call a semaphore to block other tasks from creating a CoAP request.
    int rc = init_sensor_post(server, uri);  assert(rc != 0);

    //  Scan for nearby WiFi access points and take the first 3 (or fewer) access points.
    //  If ESP8266 is connected to a mobile hotspot, we should remove the mobile hotspot access point from the list.
    rc = esp8266_scan(dev, wifi_aps, MAX_WIFI_AP, filter_func); assert(rc > 0 && rc <= MAX_WIFI_AP);

    //  Send the first 3 access points (or fewer) to thethings.io, which will call Google Geolocation API.
    if (rc > 0) { write_wifi_access_points(wifi_aps, rc); }

    //  Forward the CoAP request to the CoAP Background Task for transmission.  This will release a semaphore to allow other tasks to create CoAP requests.
    rc = do_sensor_post();  assert(rc != 0);
    console_printf("  > send wifi ap\n");
    return rc;
}

static bool filter_func(nsapi_wifi_ap_t *ap, unsigned count) {
    //  Filter function will be called with the current AP and saved row count.  Return true if the AP should be saved.
    //  (1) We skip the SSID MAC if it matches any skip_ssid pattern.
    //  (2) We skip SSID MACs that look similar, e.g. they differ only in the first and last bytes.  Similar SSID MACs
    //  probably belong to the same WiFi router configured with multiple addresses.
    int i;
    for (i = 0; ; i++) {  //  Match against all skip_ssid patterns...
        mac_pattern *pattern = &skip_ssid[i];
        if (!pattern[0][0] && !pattern[0][1] && !pattern[0][2] && !pattern[0][3] && !pattern[0][4] && !pattern[0][5]) { break; }  //  LAST_MAC_PATTERN
        if (mac_matches_pattern(ap->bssid, pattern)) { return false; }  //  Matches the skip_ssid pattern, don't save.
    }
    for (i = 0; i < count; i++) {  //  Compare with all saved SSID MAC addresses...
        uint8_t *saved_bssid = wifi_aps[i].bssid;
        if (similar_mac(ap->bssid, saved_bssid)) { return false; }  //  Similar to a saved SSID MAC address, don't save.
    }
    return true;  //  Save this AP since it doesn't match any skip_ssid and it's not similar to saved APs.
}

static bool mac_matches_pattern(uint8_t bssid[6], mac_pattern *pattern) {
    //  Return true if the SSID MAC matches the MAC address pattern.
    //  console_printf("match pattern "); console_dump(bssid, 6); console_printf("\n");
    int i;
    for (i = 0; i < 6; i++) {
        if (pattern[0][i] == ANY) { continue; }
        if (bssid[i] != pattern[0][i]) { return false; }
    }
    return true;
}

static bool similar_mac(uint8_t bssid1[6], uint8_t bssid2[6]) {
    //  Return true if the two SSID MACs are identical except the first and last bytes.
    //  console_printf("similar mac "); console_dump(bssid1, 6); console_printf(" / "); console_dump(bssid2, 6);  console_printf("\n");
    if (bssid1[1] == bssid2[1] && bssid1[2] == bssid2[2] &&
        bssid1[3] == bssid2[3] && bssid1[4] == bssid2[4]) { return true; }
    return false;
}

static char key_buf[10];    //  Buffer for JSON keys.  Long enough to hold a key like "ssid0"
static char value_buf[20];  //  Buffer for JSON values.  Long enough to hold a MAC address like "00:25:9c:cf:1c:ac"

static void write_wifi_access_points(const nsapi_wifi_ap_t *access_points, int length) {
    //  Write the CoAP JSON payload with the list of WiFi access points (MAC Address and Signal Strength).  It should look like:
    //  {"values":[
    //    {"key":"ssid0", "value":"00:25:9c:cf:1c:ac"},
    //    {"key":"rssi0", "value":-43.0},
    //    {"key":"ssid1", "value":"00:25:9c:cf:1c:ad"},
    //    {"key":"rssi1", "value":-43.0},
    //    {"key":"ssid2", "value":"00:25:9c:cf:1c:ae"},
    //    {"key":"rssi2", "value":-43.0}
    //  ]}
    //  We use float instead of int for rssi because int doesn't support negative values.
    int i, len;
#ifdef NOTUSED
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
#else

#define CP_ROOT(children) { \
    rep_start_root_object();  \
    { children; } \
    rep_end_root_object(); \
}

#define CP_ARRAY(object, key, children) { \
    rep_set_array(object, key);  \
    { children; } \
    rep_close_array(object, key); \
}

#define CP_ITEM(key, children) { \
    rep_object_array_start_item(key);  \
    { children; } \
    rep_object_array_end_item(key); \
}

#define CP_ITEM_STR(object, key0, value0) { \
    CP_ITEM(object, { \
        rep_set_text_string(object, key, key0); \
        rep_set_text_string(object, value, value0); \
    }) \
}

#define CP_ITEM_FLOAT(object, key0, value0) { \
    CP_ITEM(object, { \
        rep_set_text_string(object, key, key0); \
        rep_set_float(      object, value, value0); \
    }) \
}

    CP_ROOT({  //  Create the root.
        CP_ARRAY(root, values, {  //  Create "values" as an array of objects.
            for (i = 0; i < length; i++) {             //  Loop for the 3 access points (or fewer)...
                const nsapi_wifi_ap_t *ap = access_points + i;
                //  Append to the "values" array 2 items:
                //    {"key":"ssid0", "value":"00:25:9c:cf:1c:ac"}
                //    {"key":"rssi0", "value":-43}

                ///////////////////////////////////////
                //  First Item: ssid...
                len = sprintf(key_buf, "ssid%d", i);   //  Compose key "ssid0"
                assert(len < sizeof(key_buf));       
                len = sprintf(value_buf, 
                    "%02x:%02x:%02x:%02x:%02x:%02x",   //  Compose value "00:25:9c:cf:1c:ac"
                    ap->bssid[0], ap->bssid[1], ap->bssid[2],
                    ap->bssid[3], ap->bssid[4], ap->bssid[5]);  assert(len < sizeof(value_buf));

                //  Append to the "values" array: {"key":"ssid0", "value":"00:25:9c:cf:1c:ac"}
                CP_ITEM_STR(values, key_buf, value_buf);

                ///////////////////////////////////////
                //  Second Item: rssi...
                len = sprintf(key_buf, "rssi%d", i);  //  Compose key "rssi0"
                assert(len < sizeof(key_buf));

                //  Append to the "values" array: {"key":"rssi0", "value":-43}
                CP_ITEM_FLOAT(values, key_buf, ap->rssi);  //  Can't use int because it doesn't support negative numbers.
                
            }  //  End For
        });  //  End CP_ARRAY: Close the "values" array.
    });  //  End CP_ROOT: Close the root.

#endif  //  NOTUSED
}

#endif  //  MYNEWT_VAL(WIFI_GEOLOCATION)
