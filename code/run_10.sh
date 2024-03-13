#!/bin/sh
sudo apt update -y
sudo apt install mosquitto -y
# Optional
sudo apt install mosquitto-clients -y

sudo systemctl start mosquitto
# Make the scripts executable
chmod +x *.sh

sudo apt install libgl1-mesa-dev -y
