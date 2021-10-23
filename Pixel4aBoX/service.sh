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

#settings delete secure back_gesture_inset_scale_left
#settings put secure back_gesture_inset_scale_left -1
#settings delete secure back_gesture_inset_scale_right
#settings put secure back_gesture_inset_scale_right -1
#settings put global stay_on_while_plugged_in 0
settings put global boot_count 8
settings put global Phenotype_boot_count 8
settings put secure low_power_manual_activation_count 8
#settings put secure clock_seconds 1
#settings put system status_bar_show_battery_percent 1
settings put secure icon_blacklist rotate
settings put secure low_priority 1

# # # FORCE GPU COMPOSITION # # #
while true; do SUFI=$(service list | grep -c "SurfaceFlinger"); if [ $SUFI -eq "1" ]; then sleep 3; break; else sleep 6; fi; done
#service call SurfaceFlinger 1008 i32 1
service call SurfaceFlinger 1008 i64 1

