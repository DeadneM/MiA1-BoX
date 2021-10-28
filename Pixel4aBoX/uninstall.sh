#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed on uninstallation

# # # WAIT TILL BOOT IS COMPLETE # # #
while true; do BOOT=$(getprop sys.boot_completed); if [ "$BOOT" -eq "1" ]; then sleep 3; break; else sleep 6; fi; done

settings delete secure back_gesture_inset_scale_left && settings delete secure back_gesture_inset_scale_right


