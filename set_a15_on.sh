#!/bin/bash

function set {
    echo 1 | sudo tee /sys/devices/system/cpu/cpu$(echo $1)/online 
}

set "4"
set "5"
set "6"
set "7"

echo "Enabled A15 cores."

exit 0
