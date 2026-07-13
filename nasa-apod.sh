#! /bin/bash


#plasma dbus stuff

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export DISPLAY=":0"
export LC_TIME=C
export LC_NUMERIC=C


#make dir if needed, check web access then noaa site, check existance of latest and create if needed

mkdir -p ~/Pictures/NASA_APOD/history

cd ~/Pictures/NASA_APOD/

ping -c 1 -w 1 1.1.1.1

if wget -q --spider http://apod.nasa.gov; then


    if [ ! -f ~/Pictures/NASA_APOD/apod-latest.jpg ]; then
       wget -O apod-latest.jpg `curl -s https://apod.nasa.gov/apod/astropix.html | grep -o -m 1 'image/[^"]*\|[a-zA-Z0-9_\-]*\.jpg' | sed 's/^/https:\/\/apod.nasa.gov\/apod\//'`

    fi


 #move latest to history in order to set buffer wallpaper
 mv ~/Pictures/NASA_APOD/apod-latest.jpg ~/Pictures/NASA_APOD/history/apod-latest.jpg

 #set buffer wallpaper
 /usr/bin/plasma-apply-wallpaperimage -f preserveAspectFit ~/Pictures/NASA_APOD/history/apod-latest.jpg

 #get new latest and set new
 wget -O apod-latest.jpg `curl -s https://apod.nasa.gov/apod/astropix.html | grep -o -m 1 'image/[^"]*\|[a-zA-Z0-9_\-]*\.jpg' | sed 's/^/https:\/\/apod.nasa.gov\/apod\//'`


 sleep 2

 /usr/bin/plasma-apply-wallpaperimage -f preserveAspectFit ~/Pictures/NASA_APOD/apod-latest.jpg

 sleep 2

 #rename latest in history to timestamp
 mv ~/Pictures/NASA_APOD/history/apod-latest.jpg ~/Pictures/NASA_APOD/history/apod-$(date +"%Y-%m-%d_%H-%M").jpg

fi

#clean up history

copiesToKeep=31
files=( ~/Pictures/NASA_APOD/history/* )
delcnt=$(( ${#files[@]} - copiesToKeep ))
[ $delcnt -gt 0 ] &&
rm -f "${files[@]:0:delcnt}"

exit
