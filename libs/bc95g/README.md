# `bc95g`

Mynewt Driver for Quectel BC95-G NB-IoT transceiver module that implements the AT commands below as described in https://medium.com/@ly.lee/get-started-with-nb-iot-and-quectel-modules-6e7c581e0d61

**[0] Prepare to transmit**
- `NCONFIG`: configure <br>
- `QREGSWT`: huawei <br>
- `NRB`: reboot <br>

**[1] Attach to network**
- `NBAND`: select band <br>
- `CFUN`: enable functions <br>
- `CFUN?`: query functions <br>
- `CGATT`: attach network <br>
- `CGATT?`: query attach <br>
- `CEREG`: registration <br>
- `CEREG?`: query registration <br>

**[2] Transmit message**
- `NSOCR`: allocate port <br>
- `NSOST`: transmit <br>

**[3] Receive response**
- `NSORF`: receive msg <br>
- `NSOCL`: close port <br>

**[4] Diagnostics**
- `CGPADDR`: IP address <br>
- `NUESTATS`: network stats <br>

This driver also implements the CoAP transport for the `sensor_coap` library, located in the parent folder.

## Connecting Quectel BC95-G module to STM32 Blue Pill

| Blue Pill | BC95-G |
| :--- | :--- |
| `PA2 (UART2 TX2)`  | `RX`  |
| `PA3 (UART2 RX2)`  | `TX`  |
| `5V (ST-Link)`               | `VCC`  |
| `GND`              | `GND`  |

The module needs additional power or it will keep rebooting when we power on via `AT+CFUN=1`. I used the 5V power supply from ST-Link V2...

https://www.linkedin.com/feed/update/urn:li:activity:6558362381049790464
