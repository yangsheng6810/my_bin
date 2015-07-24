#!/bin/bash
clear
echo "Update file freedesktop.org.xml...";
sed  -e "s/<mime-type type=\"application\/vnd.adobe.flash.movie\">/<mime-type type=\"application\/x-shockwave-flash\">/g"  /usr/share/mime/packages/freedesktop.org.xml >  /usr/share/mime/packages/freedesktop.org.xml.new
mv /usr/share/mime/packages/freedesktop.org.xml /usr/share/mime/packages/freedesktop.org.xml.original
mv /usr/share/mime/packages/freedesktop.org.xml.new /usr/share/mime/packages/freedesktop.org.xml
echo "File updated successfully!";
echo "Update mime database...";
update-mime-database /usr/share/mime
echo "Mime database updated successfully! ALL DONE!";
