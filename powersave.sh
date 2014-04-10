#!/bin/bash
#
#Power OFF nvidia card
#/home/yangsheng/bin/tp420.sh off

#Enable laptop mode
echo 5 > /proc/sys/vm/laptop_mode &

#Set vm writeback to 10 secs (lose 10 secs on crash)
#echo 1500 > /proc/sys/vm/dirty_writeback_centisecs &

# Keep dirty writes in memory
echo 90 > /proc/sys/vm/dirty_ratio &
# Keep dirty writes out of cache
echo 1 > /proc/sys/vm/dirty_background_ratio &
# Writeback 60 secs
echo 6000 > /proc/sys/vm/dirty_writeback_centisecs &

# Swappiness
echo 9 > /proc/sys/vm/swappiness &

#maak bluetooth dood
rfkill block bluetooth
#/etc/init.d bluetooth stop

#set wireless power
iwconfig wlp3s0 power on

#runtime PM
for i in $(ls /sys/bus/{pci,i2c}/devices/*/power/control);do echo auto > $i;done

#powersaving /dev/sda
#hdparm -B 1 -S 12 /dev/sda
/home/yangsheng/bin/hd_powersave.sh

#set scaling_governor
#echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#echo ondemand > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#echo ondemand > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
#echo ondemand > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
#echo ondemand > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
#echo ondemand > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
#echo ondemand > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
#echo ondemand > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
#echo conservative | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
#echo 1 > /sys/devices/system/cpu/cpufreq/conservative/ignore_nice_load 
#echo -n 40 > /sys/devices/system/cpu/cpufreq/conservative/down_threshold
#echo -n 90 > /sys/devices/system/cpu/cpufreq/conservative/up_threshold
#echo -n 10 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor

echo auto >/sys/bus/pci/devices/0000:00:00.0/power/control
echo auto >/sys/bus/pci/devices/0000:00:01.0/power/control
echo auto >/sys/bus/pci/devices/0000:00:02.0/power/control
echo auto >/sys/bus/pci/devices/0000:00:16.0/power/control
echo auto >/sys/bus/pci/devices/0000:00:19.0/power/control
echo auto >/sys/bus/pci/devices/0000:00:1a.0/power/control
echo auto >/sys/bus/pci/devices/0000:00:1b.0/power/control
echo auto >/sys/bus/pci/devices/0000:00:1c.0/power/control
echo auto >/sys/bus/pci/devices/0000:00:1c.1/power/control
echo auto >/sys/bus/pci/devices/0000:00:1c.3/power/control
echo auto >/sys/bus/pci/devices/0000:00:1c.4/power/control
echo auto >/sys/bus/pci/devices/0000:00:1d.0/power/control
echo auto >/sys/bus/pci/devices/0000:00:1f.0/power/control
echo auto >/sys/bus/pci/devices/0000:00:1f.2/power/control
echo auto >/sys/bus/pci/devices/0000:00:1f.3/power/control
echo auto >/sys/bus/pci/devices/0000:01:00.0/power/control
echo auto >/sys/bus/pci/devices/0000:03:00.0/power/control
echo auto >/sys/bus/pci/devices/0000:0d:00.0/power/control

echo 'auto' > /sys/bus/usb/devices/2-1.2/power/control

ifconfig enp0s25 down

# screen powersave
#xset +dpms
#xset dpms 0 0 300
exit
