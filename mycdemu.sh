
#!/bin/sh
kmdr-executor  /usr/local/bin/cdemu-gui.kmdr &
xmessage "ctrl c  to quit the watch of cdemu "
watch cdemu -s
clear
echo "-------------"
echo " Quick cdemu "
echo "-------------"
echo " "
cdemu -s
echo " Enter the cdemu number you wanna mount from 0 to 7 (ex: 0) "
read mountcdemunb
echo " Location ? (ex: /mnt/cdemu01 )"
read mountcdemulocation

mkdir -p  "$mountcdemulocation"
umount "$mountcdemulocation"

mount -t iso9660 /dev/cdemu/"$mountcdemunb"  "$mountcdemulocation"

echo " Mounted:"
mount | grep "$mountcdemulocation"

