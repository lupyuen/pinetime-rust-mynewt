//  Compute geolocation by sending your WiFi access point info to Google Geolocation API.
//  Note: Don't enable this unless you understand the privacy implications. Your location may be accessible by others.

//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>      //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
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
    { 0x2c, 0x4d, 0x54, ANY, ANY, ANY },  //  Exclude Asus mobile hotspots
    LAST_MAC_PATTERN
};

static nsapi_wifi_ap_t wifi_aps[MAX_WIFI_AP];  //  List of scanned WiFi access points.

static void write_wifi_access_points(const char *device, const nsapi_wifi_ap_t *access_points, int length);
static bool filter_func(nsapi_wifi_ap_t *ap, unsigned count);
static bool mac_matches_pattern(uint8_t bssid[6], mac_pattern *pattern);
static bool similar_mac(uint8_t bssid1[6], uint8_t bssid2[6]);

int geolocate(const char *network_device, const char *uri, const char *device_str) {
    //  Scan for WiFi access points in your area.  Send the MAC Address and signal strength of
    //  the first 3 access points (or fewer) to thethings.io at the specified CoAP server and uri.  
    //  network_device is the ESP8266 device name e.g. "esp8266_0".  "device_str" is the random device ID string.
    //  Return the number of access points transmitted.  Note: Don't enable WIFI_GEOLOCATION unless you 
    //  understand the privacy implications. Your location may be accessible by others.
    console_printf("GEO start\n");  ////
    assert(network_device);  assert(server);  assert(uri);  assert(device_str);  int rc, count;

    {   //  Lock the ESP8266 driver for exclusive use.  Find the ESP8266 device by name.
        struct esp8266 *dev = (struct esp8266 *) os_dev_open(network_device, OS_TIMEOUT_NEVER, NULL);  //  ESP8266_DEVICE is "esp8266_0"
        assert(dev != NULL);

        //  Scan for nearby WiFi access points and take the first 3 (or fewer) access points.
        //  The filter_func() should reject access points that have very similar MAC address (probably same router).
        //  It should also reject mobile access points that are not suitable for geolocation.
        count = esp8266_scan(dev, wifi_aps, MAX_WIFI_AP, filter_func); assert(count >= 0 && count <= MAX_WIFI_AP);    

        //  Close the ESP8266 device when we are done.
        os_dev_close((struct os_dev *) dev);
        //  Unlock the ESP8266 driver for exclusive use.
    }

    if (count == 0) { return 0; }  //  Exit if no access points to send.

    //  Start composing the CoAP message with the WiFi access point data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    rc = init_server_post(NULL);  assert(rc != 0);

    //  Compose the CoAP Payload in JSON with the first 3 access points or fewer, depending on how many
    //  access points were actually stored during the call to esp8266_scan() above.
    write_wifi_access_points(device_str, wifi_aps, count);

    //  Post the CoAP message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    rc = do_server_post();  assert(rc != 0);
    console_printf("GEO view your geolocation at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n", device_str);

    //  The CoAP Background Task will call oc_tx_ucast() in the ESP8266 driver to 
    //  transmit the message: libs/esp8266/src/transport.cpp

    //  When thethings.io receives the access point data, it will call the Google Geolocation API
    //  to compute the latitude and longitude.  The geolocation will be shown on a map.  See
    //  https://github.com/lupyuen/thethingsio-wifi-geolocation
    //  https://github.com/lupyuen/gcloud-wifi-geolocation
    return rc;
}

static bool filter_func(nsapi_wifi_ap_t *ap, unsigned count) {
    //  Filter function will be called with the current access point and the number of saved access points so far.  
    //  Return true if the access point should be saved.
    //  (1) We skip the SSID MAC if it matches any skip_ssid pattern.  This skips mobile hotspots, which are
    //      not useful for geolocation
    //  (2) We skip SSID MACs that look similar, e.g. they differ only in the first and last bytes.  Similar SSID MACs
    //      probably belong to the same WiFi router configured with multiple addresses.
    int i;
    for (i = 0; ; i++) {  //  Match against all skip_ssid patterns...
        mac_pattern *pattern = &skip_ssid[i];
        if (!pattern[0][0] && !pattern[0][1] && !pattern[0][2] && !pattern[0][3] && !pattern[0][4] && !pattern[0][5]) { break; }  //  LAST_MAC_PATTERN
        if (mac_matches_pattern(ap->bssid, pattern)) {  //  Matches the skip_ssid pattern, don't save.
            console_printf("GEO skip match   %s\n", ap->ssid); ////
            return false; 
        }
    }
    for (i = 0; i < count; i++) {  //  Compare with all saved SSID MAC addresses...
        uint8_t *saved_bssid = wifi_aps[i].bssid;
        if (similar_mac(ap->bssid, saved_bssid)) {  //  Similar to a saved SSID MAC address, don't save.
            console_printf("GEO skip similar %s\n", ap->ssid); ////
            return false; 
        }
    }
    console_printf("GEO save #%d      %s\n", count, ap->ssid); ////
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

static void write_wifi_access_points(const char *device_str, const nsapi_wifi_ap_t *access_points, int length) {
    //  Write the CoAP JSON payload with the device ID and the list of WiFi access points (MAC Address and Signal Strength).  
    //  Length is the number of entries populated in "access_points".  "device_str" is the random device ID string.
    //  The CoAP Payload should look like:
    //  {"values":[
    //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
    //    {"key":"ssid0",  "value":"00:25:9c:cf:1c:ac"},
    //    {"key":"rssi0",  "value":-43.0},
    //    {"key":"ssid1",  "value":"00:25:9c:cf:1c:ad"},
    //    {"key":"rssi1",  "value":-43.0},
    //    {"key":"ssid2",  "value":"00:25:9c:cf:1c:ae"},
    //    {"key":"rssi2",  "value":-43.0}
    //  ]}
    //  We use float instead of int for rssi because int doesn't support negative values.
    assert(device_str);  assert(access_points);  assert(length > 0);
    int i, len;
    //  Compose the CoAP Payload in JSON using the CP macros.  Also works for CBOR.
    CP_ROOT({                               //  Create the payload root
        CP_ARRAY(root, values, {            //  Create "values" as an array of items under the root

            ///////////////////////////////////////
            //  Append to the "values" array:
            //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"}
            CP_ITEM_STR(values, "device", device_str);

            for (i = 0; i < length; i++) {  //  For each of the 3 WiFi access points (or fewer)...
                const nsapi_wifi_ap_t *ap = access_points + i;  //  Fetch the WiFi access point

                ///////////////////////////////////////
                //  Append to the "values" array 2 items:
                //    {"key":"ssid0", "value":"00:25:9c:cf:1c:ac"}
                //    {"key":"rssi0", "value":-43}

                ///////////////////////////////////////
                //  First Array Item: ssidX
                len = sprintf(key_buf, "ssid%d", i);   //  Compose key "ssid0"
                assert(len < sizeof(key_buf));       
                len = sprintf(value_buf, 
                    "%02x:%02x:%02x:%02x:%02x:%02x",   //  Compose value "00:25:9c:cf:1c:ac"
                    ap->bssid[0], ap->bssid[1], ap->bssid[2],
                    ap->bssid[3], ap->bssid[4], ap->bssid[5]);  assert(len < sizeof(value_buf));

                //  Append to the "values" array: {"key":"ssid0", "value":"00:25:9c:cf:1c:ac"}
                CP_ITEM_STR(values, key_buf, value_buf);

                ///////////////////////////////////////
                //  Second Array Item: rssiX
                len = sprintf(key_buf, "rssi%d", i);       //  Compose key "rssi0"
                assert(len < sizeof(key_buf));

                //  Append to the "values" array: {"key":"rssi0", "value":-43}
                CP_ITEM_FLOAT(values, key_buf, ap->rssi);  //  Can't use int because it doesn't support negative numbers

            }   //  End for each WiFi access point
        });     //  End CP_ARRAY: Close the "values" array
    });         //  End CP_ROOT:  Close the payload root

}

#endif  //  MYNEWT_VAL(WIFI_GEOLOCATION)

#ifdef NOTUSED
    //  Previous code without the CP Macros
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
#endif  //  NOTUSED
