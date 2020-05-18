#!/usr/bin/env bash
#  Test Firmware Update over Bluetooth. Based on https://mynewt.apache.org/latest/tutorials/devmgmt/ota_upgrade_nrf52.html

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

# Build Newt Manager on Raspberry Pi
# cd ~/go
# mkdir -p src/mynewt.apache.org
# cd src/mynewt.apache.org/
# git clone https://github.com/apache/mynewt-newtmgr
# mv mynewt-newtmgr newtmgr
# cd newtmgr/newtmgr
# export GO111MODULE=on
# go build

# Run Newt Manager on Raspberry Pi
cd ~/go/src/mynewt.apache.org/newtmgr/newtmgr

# Step 1: Creating a Newtmgr Connection Profile
# PineTime sets and advertises "pinetime" as its bluetooth device name. 
# Run the newtmgr conn add command to create a newtmgr connection profile 
# that uses this peer name to communicate with the device over BLE:

sudo ./newtmgr conn add pinetime type=ble connstring="peer_name=pinetime"
# Connection profile pinetime successfully added

# Connect to PineTime and list firmware images
sudo ./newtmgr image list -c pinetime --loglevel debug

# Step 2: Uploading an Image to the Device
# We upload the new image.

sudo ./newtmgr image upload -c pinetime \
    ~/Downloads/my_sensor_app_1.1.img 

sudo ./newtmgr image list -c pinetime

# Step 3: Testing the Image
# The image is uploaded to the secondary slot but is not yet active. 
# We must run the newtmgr image test command to set the image status to pending 
# and reboot the device. When the device reboots, the bootloader copies this image 
# to the primary slot and runs the image.

# sudo ./newtmgr image test -c pinetime \
#     291ebc02a8c345911c96fdf4e7b9015a843697658fd6b5faa0eb257a23e93682

# sudo ./newtmgr image list -c pinetime

# echo Reboot PineTime now

# Step 4: Confirming the Image
# Run the newtmgr image confirm command to confirm and make the uploaded image permanent. 
# Since the uploaded image is currently the active image, we can confirm the image setup 
# without specifying the image hash value in the command:

# sudo ./newtmgr image confirm -c pinetime
