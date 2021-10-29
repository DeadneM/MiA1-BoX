#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode

# # # WAIT TILL BOOT IS COMPLETE # # #
while true; do BOOT=$(getprop sys.boot_completed); if [ "$BOOT" -eq "1" ]; then sleep 3; break; else sleep 6; fi; done

#Disable Left and Right back gestures
settings put secure back_gesture_inset_scale_left -1 && settings put secure back_gesture_inset_scale_right -1
#Restore back gesture on uninstallation
# settings delete secure back_gesture_inset_scale_left && settings delete secure back_gesture_inset_scale_right
#Reset the boot count for fun
settings put global boot_count 8
settings put global Phenotype_boot_count 8
settings put secure low_power_manual_activation_count 8
#Blacklist only rotation icon
settings put secure icon_blacklist rotate
#Show low priority icons
settings put secure low_priority 1

