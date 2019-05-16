# `remote_sensor`

Mynewt Driver for Remote Sensor.  The Remote Sensor driver is installed in the Collector Node.
It receives sensor data from Sensor Nodes via nRF24L01 encoded with CBOR.  

A Remote Sensor behaves like a local sensor, so Mynewt sensor listeners will work.

With Remote Sensor we may build a sensor data router on the Collector Node that receives sensor data from Sensor Nodes and transmits to a CoAP Server.
