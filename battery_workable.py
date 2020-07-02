#!/usr/bin/env python3
# coding=UTF-8
#
# A script for showing battery power for shell prompt

# import math
import sys

def myceil(x):
    if x > int(x):
        return int(x)+1
    else:
        return int(x)

preffix = "/sys/class/power_supply/"

ac = int(open(preffix+"AC/online", "r").read())
battery_now = int(open(preffix+"BAT0/energy_now", "r").read())
battery_full = int(open(preffix+"BAT0/energy_full", "r").read())
ratio = battery_now/battery_full
if ac > 0:
    ac_out = "[AC]"
else:
    ac_out = "[BAT]"

#Output
total_slots = 10
# full_char = '▸'
# empty_char = '▹'

# start of constants
full_char = '>'
empty_char = '.'
color_green = '%{[32m%}'
color_yellow = '%{[1;33m%}'
color_red = '%{[31m%}'
color_reset = '%{[00m%}'
# end of constants

fill_num = myceil(ratio * 10)
empty_num = total_slots - fill_num
filled = fill_num * full_char
empty = empty_num * empty_char

out = ('['+filled + empty+']')#.encode('utf-8')
#print(out);


color_out = (
    color_green if len(filled) > 6
    else color_yellow if len(filled) > 4
    else color_red
)

out = color_out + out + ac_out+color_reset
sys.stdout.write(out)
