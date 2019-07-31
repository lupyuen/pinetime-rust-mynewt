//  Compute geolocation by sending your WiFi access point info to Google Geolocation API.
//  Note: Don't enable this unless you understand the privacy implications. Your location may be accessible by others.
#ifndef __APP_GEOLOCATE_H__
#define __APP_GEOLOCATE_H__
#if MYNEWT_VAL(WIFI_GEOLOCATION)  //  If WiFi Geolocation is enabled...

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

struct esp8266;
struct oc_server_handle;

//  Scan for WiFi access points in your area.  Send the MAC Address and signal strength of
//  the first 3 access points (or fewer) to thethings.io at the specified CoAP server and uri.  
//  network_device is the ESP8266 device name e.g. "esp8266_0".  "device_str" is the random device ID string.
//  Return the number of access points transmitted.  Note: Don't enable WIFI_GEOLOCATION unless you 
//  understand the privacy implications. Your location may be accessible by others.
int geolocate(const char *network_device, struct oc_server_handle *server, const char *uri, const char *device_str);

#ifdef __cplusplus
}
#endif

#endif  //  MYNEWT_VAL(WIFI_GEOLOCATION)
#endif  //  __APP_GEOLOCATE_H__
