#!/bin/bash

# Check if the project directory is provided as a command-line argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <project_directory>"
    exit 1
fi
# Find the directory containing the project
PROJECT_DIR="$1"

# Debugging output
echo "Current directory: $(pwd)"
echo "Searching for 'EchlonTelemetry' directory..."

# Check if project directory was found
if [ -z "$PROJECT_DIR" ]; then
    echo "Error: Project directory 'qgroundcontrol' not found."
    echo "Directories searched:"
    find . -type d -name "qgroundcontrol" -print
    exit 1
fi

echo "Found project directory: $PROJECT_DIR"

# Rest of the script...

# Create a build directory if it doesn't exist
#mkdir -p build
cd $PROJECT_DIR
chmod a+x deploy/linux-fixup-rpaths.bash

# Run qmake to generate Makefile
# Check if any image with the specified name and tag is present

image_name="qgc-linux-docker"
tag="latest"

if sudo docker images --format '{{.Repository}}:{{.Tag}}' | grep -q "^$image_name:$tag$"; then
    mkdir build
    echo "Image $image_name:$tag already exists."
    sudo docker run --rm -v ${PWD}:/project/source -v ${PWD}/build:/project/build qgc-linux-docker:latest

else
    chmod a+x deploy/docker/install-qt-linux.sh
    echo "Image $image_name:$tag does not exist."
    sudo docker build --file ./deploy/docker/Dockerfile-build-linux -t qgc-linux-docker:latest .
    mkdir build
    sudo docker run --rm -v ${PWD}:/project/source -v ${PWD}/build:/project/build qgc-linux-docker:latest
fi

#~/Qt/5.15.2/gcc_64/bin/qmake -o Makefile "$PROJECT_DIR"
cd ..
cd build
FILE_DIR="$PROJECT_DIR/build/staging/."
echo "fpath $FILE_DIR"
cp -r "$FILE_DIR" .

# Check if qmake succeeded
#if [ $? -eq 0 ]; then
#    # Navigate to the build directory
#    
#
#    # Run make to build the project
#    make 
#
#    # Check if make succeeded
#    if [ $? -eq 0 ]; then
#        echo "Project built successfully."
#        cd ..
#        cd build
#        FILE_DIR="$PROJECT_DIR/build/staging/."
#        echo "fpath $FILE_DIR"
#	cp -r "$FILE_DIR" .
#    else
#        echo "Error: Make failed. Unable to build the project."
#        exit 1
#    fi
#else
#    echo "Error: qmake failed. Unable to generate Makefile."
#    exit 1
#fi
