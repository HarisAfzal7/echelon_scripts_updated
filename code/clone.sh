#!/bin/bash

# Clone the first repository
git clone git@github.com:NofalAbdullah/EDC.git

# Clone the second repository
git clone git@github.com:NofalAbdullah/EchleonTelemetry.git -b ET_data_EGC

# cloning qgroundcontrol repository
git clone git@github.com:verituslabs-echelonai/qgroundcontrol.git -b echelonai_2024February_spike
set back = `pwd`
cd qgroundcontrol
git submodule init && git submodule update
cd libs/libevents/libevents/libs/cpp/parse/nlohmann_json
git submodule init && git submodule update
cd $back


echo "Repositories cloned successfully."
