#!/bin/bash

PATH=/opt/Qt/5.15.2/gcc_64/bin:$PATH

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
    echo "Error: Project directory 'EchlonTelemetry' not found."
    echo "Directories searched:"
    find . -type d -name "EchlonTelemetry" -print
    exit 1
fi

echo "Found project directory: $PROJECT_DIR"

# Rest of the script...

# Create a build directory if it doesn't exist
#mkdir -p build
cd EchleonTelemetry
# Run qmake to generate Makefile
qmake -o Makefile "$PROJECT_DIR"

# Check if qmake succeeded
if [ $? -eq 0 ]; then
    # Navigate to the build directory
    

    # Run make to build the project
    make 

    # Check if make succeeded
    if [ $? -eq 0 ]; then
        echo "Project built successfully."
        cd ..
        cd build
        FILE_DIR="$PROJECT_DIR/Drone_Tele_chart"
        echo "fpath $FILE_DIR"
	cp "$FILE_DIR" .
    else
        echo "Error: Make failed. Unable to build the project."
        exit 1
    fi
else
    echo "Error: qmake failed. Unable to generate Makefile."
    exit 1
fi
