#!/bin/bash

default='\e[39m'

function freq {
    value="$(cat /sys/devices/system/cpu/cpu$(echo $1)/cpufreq/cpuinfo_cur_freq)"
    value=$(echo "scale=1;$value/1000000" | bc -q | sed s/^\\./0./g)
    
    max='\e[95m'
    normal='\e[96m'
    idle='\e[94m'

    if [ $1 -ge 4 ]
        then
            if [ $value == '2.0' ]
                then
                    color=$max
                elif [ $(echo "$value <= 1" | bc) -eq 1 ]
                    then
                        color=$idle
                else
                    color=$normal
            fi
        else
            if [ $value == '1.4' ]
                then
                    color=$max
                elif [ $(echo "$value <= .5" | bc) -eq 1 ]
                    then
                        color=$idle
                else
                    color=$normal
            fi
    fi
    
    echo -e "$color$value$default GHz"
}

function temp {
    value="$(cat /sys/devices/virtual/thermal/thermal_zone$(echo $1)/temp)"
    value=$(echo "$value/1000" | bc)

    hot='\e[91m'
    work='\e[93m'
    cool='\e[92m'

    
    if [ $value -ge 85 ]
        then
            color=$hot
        elif [ $value -ge 75 ]
            then
                color=$work
        else
            color=$cool
    fi
    
    echo -e " $color$value$default \xe2\x84\x83  "
}

for (( ; ; ))
do

result=$default'\ncpu_freq.sh'
result=$result$'\n'
result=$result$'\n Device:  Odroid XU3'
result=$result$'\n Chip:    Samsung Exynos 5422'
result=$result$'\n CPU:     4x Cortex A7 1.4 GHz'
result=$result$'\n          4x Cortex A15 2.0 GHz'
result=$result$'\n GPU:     Mali-T628 MP6'
result=$result$'\n'
result=$result$'\n +---+---------+---------+---------+---------+'
result=$result$'\n A7  | '$(freq "0")$' | '$(freq "1")$' | '$(freq "2")$' | '$(freq "3")$' |'
result=$result$'\n +---+---------+---------+---------x---------+'
result=$result$'\n A15 | '$(freq "4")$' | '$(freq "5")$' | '$(freq "6")$' | '$(freq "7")$' |'
result=$result$'\n |   | '$(temp "0")$' | '$(temp "1")$' | '$(temp "2")$' | '$(temp "3")$' |'
result=$result$'\n +---+---------+---------+---------x---------+'
result=$result$'\n GPU | '$(temp "4")$'                               |'
result=$result$'\n +---+---------------------------------------+'


clear
echo -e "$result"

sleep .5
done

exit 0
