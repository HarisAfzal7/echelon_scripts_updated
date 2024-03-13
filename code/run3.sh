
#!/bin/sh

# Create build directory
mkdir "$(pwd)"/build

# Run scripts simultaneously in background
./run_10.sh
./clone.sh
./install_qt_linux.sh

echo "waiting for qt to be installed"
# Wait for qt to be installed
wait

./buildEDC.sh "$(pwd)"/EDC
./buildET.sh "$(pwd)"/EchleonTelemetry &

./install_docker.sh &

echo "wating for the docker to be installed"
# Wait for docker to be installed
wait

./buildEGC.sh "$(pwd)"/qgroundcontrol &

./install_gazebo_and_px4.sh &

wait

./buildEGC.sh "$(pwd)"/qgroundcontrol

