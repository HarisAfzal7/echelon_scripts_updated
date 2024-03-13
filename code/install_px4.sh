#!/bin/sh

#GCC (armhf)
sudo apt-get install -y gcc-8-arm-linux-gnueabihf g++-8-arm-linux-gnueabihf

#Set them as default:
sudo update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-8 100 --slave /usr/bin/arm-linux-gnueabihf-g++ arm-linux-gnueabihf-g++ /usr/bin/arm-linux-gnueabihf-g++-8
sudo update-alternatives --config arm-linux-gnueabihf-gcc

#GCC (aarch64)

#If you want to build PX4 for ARM64 devices, this section is required.
#apt-get install -y gcc-8-aarch64-linux-gnu g++-8-aarch64-linux-gnu
#update-alternatives --install /usr/bin/aarch64-linux-gnu-gcc aarch64-linux-gnu-gcc /usr/bin/aarch64-linux-gnu-gcc-8 100 --slave /usr/#bin/aarch64-linux-gnu-g++ aarch64-linux-gnu-g++ /usr/bin/aarch64-linux-gnu-g++-8
#update-alternatives --config aarch64-linux-gnu-gcc


#Clang (optional)

#First install GCC (needed to use clang).

#We recommend you to get clang from the Ubuntu software repository, as shown below:

apt-get install clang

#Example below for building PX4 firmware out of tree, using CMake.

cd $(pwd)/PX4-Autopilot
mkdir build/px4_raspberrypi_default_clang
cd build/px4_raspberrypi_default_clang
cmake \
-G"Unix Makefiles" \
-DCONFIG=px4_raspberrypi_default \
-UCMAKE_C_COMPILER \
-DCMAKE_C_COMPILER=clang \
-UCMAKE_CXX_COMPILER \
-DCMAKE_CXX_COMPILER=clang++ \
../..
make
