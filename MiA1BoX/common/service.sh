#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode

#WAIT TILL BOOT IS COMPLETE
while true; do BOOT=$(getprop sys.boot_completed); if [ "$BOOT" -eq "1" ]; then sleep 3; break; else sleep 6; fi; done

#Disable Commentary and spock app for MiA1
pm disable com.miui.spock
pm disable com.miui.bugreport

#Change lockscreen shortcut
settings put secure sysui_keyguard_left null
settings put secure sysui_keyguard_right null
# settings put secure sysui_keyguard_left org.thunderdog.challegram/org.thunderdog.challegram.MainActivity
# settings put secure sysui_keyguard_right com.snapchat.android/com.snap.mushroom.MainActivity


#Other misc settings changes
# settings put global stay_on_while_plugged_in 0
settings put global boot_count 8
settings put global Phenotype_boot_count 8
#screen_off_timeout=120000; notification_light_pulse=1; notification_vibration_intensity=2; haptic_feedback_enabled=1; haptic_feedback_intensity=2
settings put secure clock_seconds 1
settings put system status_bar_show_battery_percent 1
settings put secure icon_blacklist rotate

#This will force gpu composition to avoid flickering
while true; do SUFI=$(service list | grep -c "SurfaceFlinger"); if [ $SUFI -eq "1" ]; then sleep 3; break; else sleep 3; fi; done
# service call SurfaceFlinger 1008 i32 1
service call SurfaceFlinger 1008 i64 1

