#!/bin/bash

function set {
    echo "performance" | sudo tee /sys/devices/system/cpu/cpu$(echo $1)/cpufreq/scaling_governor
}

function get {
    echo /sys/devices/system/cpu/cpu$(echo $1)/cpufreq/scaling_governor
}

set "0"
set "4"

echo $($get "0") $($get "1") $($get "2") $($get "3")
echo $($get "4") $($get "5") $($get "6") $($get "7")

done

exit 0
