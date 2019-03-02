#!/bin/bash

function set {
    echo 0 | sudo tee /sys/devices/system/cpu/cpu$(echo $1)/online 
}

set "4"
set "5"
set "6"
set "7"

echo "Disabled A15 cores."

exit 0
