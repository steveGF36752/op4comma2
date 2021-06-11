#!/usr/bin/bash
if [ ! -f "/system/fonts/opensans_regular.ttf" ]; then
    sleep 3
    mount -o remount,rw /system
    
cp /data/openpilot/installer/bootanimation.zip /system/media/
mount -o remount,r /system
    echo =================================================================
    echo =================================================================
    echo Reboot Now..!!
    echo =================================================================
    reboot
fi

if [ ! -f "/data/BOOTLOGO" ]; then
    /usr/bin/touch /data/BOOTLOGO
    dd if=/data/openpilot/installer/splash.img of=/dev/block/bootdevice/by-name/splash
    echo =================================================================
    echo Comma boot logo change complete
    
export PASSIVE="0"
exec ./launch_chffrplus.sh

