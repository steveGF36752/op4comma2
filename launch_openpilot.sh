#!/usr/bin/bash
if [ ! -f "/system/fonts/opensans_regular.ttf" ]; then

    echo "Installing fonts..."

    mount -o rw,remount /system

  	cp -f /data/openpilot/selfdrive/assets/fonts/opensans_* /system/fonts/
    cp -f /data/openpilot/selfdrive/assets/fonts.xml /system/etc/fonts.xml
    chmod 644 /system/etc/fonts.xml
  	chmod 644 /system/fonts/opensans_*
    
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

