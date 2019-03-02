#!/bin/bash

#function set {
#    echo "ondemand" | sudo tee /sys/devices/system/cpu/cpu$(echo $1)/cpufreq/scaling_governor
#}
#
#function get {
#    echo /sys/devices/system/cpu/cpu$(echo $1)/cpufreq/scaling_governor
#}
#
#echo "$($set 0)"
#echo "$($set 4)"
#
#echo "$($get "0") $($get "1") $($get "2") $($get "3")"
#echo "$($get "4") $($get "5") $($get "6") $($get "7")"

echo "ondemand" | tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "ondemand" | tee /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor

exit 0
