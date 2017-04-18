#!/bin/sh

# clear previous commands
clear

# search AppleSmartBattery temperature sensor from I/O Kit
temperature=$(ioreg -rn AppleSmartBattery | grep Temperature | cut -d '=' -f 2)

# calculation for temperature (Celsius)
temp_final=$(echo "scale=2; $temperature/100" | bc)

# output
echo " "
echo "----- Apple Smart Battery -----"
echo "Battery Temperature: $temp_final degrees Celsius"
echo " "

# quit
read -n 1 -sp "Press any key to exit..."
echo " "
osascript -e 'quit app "Terminal"'
killall Terminal