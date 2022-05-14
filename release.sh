#!/bin/sh -e
# Script to automatically download the project including all submodules
# It then zips the hardware add-on and calculate the SHA-256 and file size
# This is used with the Arduino Boards Manager

hardware_add_on_path=avr
name=USBino

cp -a avr $name

rm -f "$name".zip

echo "ZIP hardware directory"
zip -rq "$name" "$name" # Zip the hardware add-on

echo "Remove hardware directory"
rm -rf "$name"

# Calculate SHA-256 and file size of hardware add-on used for "package_lauszus_sanguino_index.json"
echo \"checksum\": \"SHA-256:`shasum -a 256 $name.zip | awk '{print $1}'`\",
echo \"size\": \"`ls -l $name.zip | awk '{print $5}'`\",
