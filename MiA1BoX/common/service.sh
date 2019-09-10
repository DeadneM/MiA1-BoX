#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode

#This will force gpu composition to avoid flickering
while true; do BOOT=$(getprop sys.boot_completed); if [ "$BOOT" -eq "1" ]; then sleep 9; break; else sleep 3; fi; done

while true; do SUFI=$(service list | grep -c "SurfaceFlinger"); if [ $SUFI -eq "1" ]; then sleep 9; break; else sleep 3; fi; done

su -c service call SurfaceFlinger 1008 i64 1

