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
su -c pm disable com.miui.spock
su -c pm disable com.miui.bugreport

#This will force gpu composition to avoid flickering
while true; do SUFI=$(service list | grep -c "SurfaceFlinger"); if [ $SUFI -eq "1" ]; then sleep 12; break; else sleep 9; fi; done
# su -c service call SurfaceFlinger 1008 i32 1
su -c service call SurfaceFlinger 1008 i64 1

#Change lockscreen shortcut
su -c settings put secure sysui_keyguard_left org.thunderdog.challegram/org.thunderdog.challegram.MainActivity
su -c settings put secure sysui_keyguard_right com.snapchat.android/com.snap.mushroom.MainActivity
#Other misc settings changes
# su -c settings put global stay_on_while_plugged_in 0
su -c settings put global boot_count 8
su -c settings put global Phenotype_boot_count 8
#screen_off_timeout=120000; notification_light_pulse=1; notification_vibration_intensity=2; haptic_feedback_enabled=1; haptic_feedback_intensity=2
su -c settings put secure clock_seconds 1
su -c settings put system status_bar_show_battery_percent 1
su -c settings put secure icon_blacklist rotate

