#!/bin/bash

TARGET_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo "Base dir is: $TARGET_DIR"

TEENSY_DIR=$TARGET_DIR/arduino-1.0.5/hardware/teensy

curl -L "http://arduino.googlecode.com/files/arduino-1.0.5-src.tar.gz" | tar -xvzf - -C "$TARGET_DIR"

mkdir -p "$TEENSY_DIR"
curl -L "https://github.com/PaulStoffregen/cores/archive/1.17.tar.gz" | tar -xvzf - -C "$TEENSY_DIR"
mv "$TEENSY_DIR/cores-1.17" "$TEENSY_DIR/cores"
find "$TEENSY_DIR/cores" -type f -exec sed -ibak 's/defined(__AVR_AT90USB646__)/defined(__AVR_AT90USB646__) || defined(__AVR_AT90USB647__)/g' {} \;
