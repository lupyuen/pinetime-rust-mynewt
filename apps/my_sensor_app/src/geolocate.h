//  Compute geolocation by sending your WiFi access point info to Google Geolocation API.
//  Note: Don't enable this unless you understand the privacy implications. Your location may be accessible by others.
#ifndef __GEOLOCATE_H__
#define __GEOLOCATE_H__
#if MYNEWT_VAL(WIFI_GEOLOCATION)  //  If WiFi Geolocation is enabled...

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

struct esp8266;
struct oc_server_handle;

//  Scan for WiFi access points in your area.  Send the MAC Address and signal strength of
//  the first 3 access points (or fewer) to thethings.io at the specified CoAP server and uri.  
//  dev is the ESP8266 device.  Return the number of access points transmitted.
//  The caller must have locked the ESP8266 driver via os_dev_open() to prevent concurrent access.
//  Note: Don't enable this unless you understand the privacy implications. Your location may be accessible by others.
int geolocate(struct esp8266 *dev, struct oc_server_handle *server, const char *uri);

#ifdef __cplusplus
}
#endif

#endif  //  MYNEWT_VAL(WIFI_GEOLOCATION)
#endif  //  __GEOLOCATE_H__
