#ifndef __GEOLOCATE_H__
#define __GEOLOCATE_H__

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

struct esp8266;
struct oc_server_handle;

//  Scan for WiFi access points in your area.  Send the MAC Address and signal strength of
//  the first 3 access points (or fewer) to thethings.io at the specified CoAP server and uri.  
//  dev is the ESP8266 device.  Return the number of access points transmitted.
//  Note: Don't enable this unless you understand the privacy implications. Your location may be accessible by others.
int geolocate(struct esp8266 *dev, struct oc_server_handle *server, const char *uri);

#ifdef __cplusplus
}
#endif

#endif  //  __GEOLOCATE_H__
