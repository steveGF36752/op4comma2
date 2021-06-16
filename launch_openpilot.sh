#!/usr/bin/bash
if [ ! -f "/system/fonts/opensans_regular.ttf" ]; then

    cp /data/openpilot/installer/bootanimation.zip /system/media/
    mount -o remount,r /system
fi

if [ ! -f "/data/BOOTLOGO" ]; then
    /usr/bin/touch /data/BOOTLOGO
    dd if=/data/openpilot/installer/splash.img of=/dev/block/bootdevice/by-name/splash
    echo =================================================================
    echo Comma boot logo change complete
    
fi

export PASSIVE="0"
exec ./launch_chffrplus.sh
