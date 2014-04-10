#!/bin/sh
file="12"
cuebreakpoints ${file}.cue |shntool split ${file}.ape
wav2mp3.sh
cuetag.sh ${file}.cue *.mp3
mid3iconv -e GBK *.mp3
