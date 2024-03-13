#!/bin/sh

mkdir $(pwd)/build

./run_10.sh

./clone.sh

./install_qt_linux.sh

./install_gazebo_and_px4.sh

./install_docker.sh

./buildEDC.sh $(pwd)/EDC

./buildET.sh $(pwd)/EchleonTelemetry

./buildEGC.sh $(pwd)/qgroundcontrol

./buildEGC.sh $(pwd)/qgroundcontrol
