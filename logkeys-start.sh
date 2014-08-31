#!/bin/bash
filename=`date +"%Y-%m-%d"`
logkeys --start --post-size=1000 --output "/home/yangsheng/.logs/.keylogs/${filename}.log"
