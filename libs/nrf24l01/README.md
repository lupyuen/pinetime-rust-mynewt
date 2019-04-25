# nrf24l01

Mynewt driver for Nordic Semiconductor nRF24L01 and nRF24L01+.

Ported from mbed to Mynewt:

https://os.mbed.com/users/Owen/code/nRF24L01P/file/8ae48233b4e4/nRF24L01P.cpp/


According to https://devzone.nordicsemi.com/f/nordic-q-a/828/nrf24l01-compatibility-with-nrf24l01...

    "Yes, nRF24L01 is compatible with nRF24L01+ both ways. The nRF24L01+ has better receiver sensitivity than the nRF24L01, only the nRF24L01+ features the 250kbps data speed mode, and only the nRF24L01 has a LNA gain setting. As long as you don't use the 250 kbps data speed mode on the nRF24L01+, you will be able to establish a link between a nRF24L01+ and a nRF24L01.

    To communicate between them, NRF24L01+ and NRF24L01 must work in ShockBurst mode,so EN_AA=0 and ARC=0; As to the date rate, you can choose either 250Kbps or 1Mbps."
