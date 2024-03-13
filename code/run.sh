#!/bin/bash
sudo apt update -y
sudo apt install mosquitto -y
# Optional
sudo apt install mosquitto-clients -y

sudo systemctl start mosquitto -y
# Make the scripts executable
chmod +x *.sh


sudo apt install libgl1-mesa-dev -y

# Execute clone.sh
./clone.sh
./install_qt_linux.sh
./install_gazebo_and_px4.sh
./install_docker.sh


# Check if clone.sh was successful
if [ $? -eq 0 ]; then
    echo "Clone successful, proceeding with buildEDC.sh and buildET.sh"
    mkdir build
    cd build
    rm -rf ./*
    cd ..
    # Execute buildEDC.sh
    ./buildEDC.sh $(pwd)/EDC
    ./buildET.sh $(pwd)/EchelonTelemetry
    ./buildEGC.sh $(pwd)/qgroundcontrol
    ./buildEGC.sh $(pwd)/qgroundcontrol
    cd build
    ./echlon_baseApp &
    ./PX4-Autopilot/Tools/simulation/gazebo-classic/sitl_multiple_run.sh -n 5 &
    
else
    echo "Clone failed, exiting script."
fi
