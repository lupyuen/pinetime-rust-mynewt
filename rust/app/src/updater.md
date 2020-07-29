```bash
rm xpack-openocd-0.10.0-14-linux-arm64.tar.gz
wget https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-14/xpack-openocd-0.10.0-14-linux-arm64.tar.gz
tar -xf xpack-openocd-0.10.0-14-linux-arm64.tar.gz
rm xpack-openocd-0.10.0-14-linux-arm64.tar.gz
mv xpack-openocd-0.10.0-14 xpack-openocd

xpack-openocd/bin/openocd
```

Download xPack OpenOCD from

https://xpack.github.io/openocd/install/

macOS:

https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-14/xpack-openocd-0.10.0-14-darwin-x64.tar.gz

Linux Arm32:

https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-14/xpack-openocd-0.10.0-14-linux-arm.tar.gz

Linux Arm64:

https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-14/xpack-openocd-0.10.0-14-linux-arm64.tar.gz

Linux x32:

https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-14/xpack-openocd-0.10.0-14-linux-x32.tar.gz

Linux x64:

https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-14/xpack-openocd-0.10.0-14-linux-x64.tar.gz

Win32:

https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-14/xpack-openocd-0.10.0-14-win32-x32.zip

Win64:

https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-14/xpack-openocd-0.10.0-14-win32-x64.zip

openocd-spi

```bash
dialog --menu "What would you like to flash to PineTime today?" 0 0 0 1 "Latest Bootloader" 2 "Latest Firmware (FreeRTOS)" 3 "Download from URL" 4 "Downloaded file"
```
