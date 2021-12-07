#!/system/bin/sh
MODDIR=${0%/*}

# # # WAIT TILL BOOT IS COMPLETE # # #
while true; do BOOT=$(getprop sys.boot_completed); if [ "$BOOT" -eq "1" ]; then sleep 3; break; else sleep 9; fi; done
# # # KERNEL SCHED # # #
echo '0' > /proc/sys/kernel/sched_schedstats; chmod 0444 /proc/sys/kernel/sched_schedstats
echo '1' > /proc/sys/kernel/sched_tunable_scaling; chmod 0444 /proc/sys/kernel/sched_tunable_scaling
# # # SCHEDUTIL FREQ/LOAD # # #
echo '1248000' > /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_freq; chmod 0444 /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_freq
echo '1555200' > /sys/devices/system/cpu/cpufreq/policy6/schedutil/hispeed_freq; chmod 0444 /sys/devices/system/cpu/cpufreq/policy6/schedutil/hispeed_freq
echo '95' > /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_load; chmod 0444 /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_load
echo '95' > /sys/devices/system/cpu/cpufreq/policy6/schedutil/hispeed_load; chmod 0444 /sys/devices/system/cpu/cpufreq/policy6/schedutil/hispeed_load
echo '1' > /sys/devices/system/cpu/cpufreq/policy0/schedutil/pl; chmod 0444 /sys/devices/system/cpu/cpufreq/policy0/schedutil/pl
echo '1' > /sys/devices/system/cpu/cpufreq/policy6/schedutil/pl; chmod 0444 /sys/devices/system/cpu/cpufreq/policy6/schedutil/pl
# # # SCHEDTUNE # # #
#general
echo '0' > /dev/stune/schedtune.boost; chmod 0444 /dev/stune/schedtune.boost
echo '0' > /dev/stune/schedtune.prefer_high_cap; chmod 0444 /dev/stune/schedtune.prefer_high_cap
echo '1' > /dev/stune/schedtune.prefer_idle; chmod 0444 /dev/stune/schedtune.prefer_idle
echo '0-7' > /dev/cpuset/cpus; chmod 0444 /dev/cpuset/cpus
#background
echo '0' > /dev/stune/background/schedtune.boost; chmod 0444 /dev/stune/background/schedtune.boost
echo '0' > /dev/stune/background/schedtune.prefer_high_cap; chmod 0444 /dev/stune/background/schedtune.prefer_high_cap
echo '1' > /dev/stune/background/schedtune.prefer_idle; chmod 0444 /dev/stune/background/schedtune.prefer_idle
echo '3-5' > /dev/cpuset/background/cpus; chmod 0444 /dev/cpuset/background/cpus
#foreground
echo '0' > /dev/stune/foreground/schedtune.boost; chmod 0444 /dev/stune/foreground/schedtune.boost
echo '0' > /dev/stune/foreground/schedtune.prefer_high_cap; chmod 0444 /dev/stune/foreground/schedtune.prefer_high_cap
echo '1' > /dev/stune/foreground/schedtune.prefer_idle; chmod 0444 /dev/stune/foreground/schedtune.prefer_idle
echo '0-5' > /dev/cpuset/foreground/cpus; chmod 0444 /dev/cpuset/foreground/cpus
#top-app
echo '0' > /dev/stune/top-app/schedtune.boost; chmod 0444 /dev/stune/top-app/schedtune.boost
echo '0' > /dev/stune/top-app/schedtune.prefer_high_cap; chmod 0444 /dev/stune/top-app/schedtune.prefer_high_cap
echo '1' > /dev/stune/top-app/schedtune.prefer_idle; chmod 0444 /dev/stune/top-app/schedtune.prefer_idle
echo '0-5,7' > /dev/cpuset/top-app/cpus; chmod 0444 /dev/cpuset/top-app/cpus
#camera-daemon
echo '0' > /dev/stune/camera-daemon/schedtune.boost; chmod 0444 /dev/stune/camera-daemon/schedtune.boost
echo '0' > /dev/stune/camera-daemon/schedtune.prefer_high_cap; chmod 0444 /dev/stune/camera-daemon/schedtune.prefer_high_cap
echo '1' > /dev/stune/camera-daemon/schedtune.prefer_idle; chmod 0444 /dev/stune/camera-daemon/schedtune.prefer_idle
echo '0-7' > /dev/cpuset/camera-daemon/cpus; chmod 0444 /dev/cpuset/camera-daemon/cpus
#nnapi-hal
echo '0' > /dev/stune/nnapi-hal/schedtune.boost; chmod 0444 /dev/stune/nnapi-hal/schedtune.boost
echo '0' > /dev/stune/nnapi-hal/schedtune.prefer_high_cap; chmod 0444 /dev/stune/nnapi-hal/schedtune.prefer_high_cap
echo '1' > /dev/stune/nnapi-hal/schedtune.prefer_idle; chmod 0444 /dev/stune/nnapi-hal/schedtune.prefer_idle
#rt
echo '0' > /dev/stune/rt/schedtune.boost; chmod 0444 /dev/stune/rt/schedtune.boost
echo '0' > /dev/stune/rt/schedtune.prefer_high_cap; chmod 0444 /dev/stune/rt/schedtune.prefer_high_cap
echo '1' > /dev/stune/rt/schedtune.prefer_idle; chmod 0444 /dev/stune/rt/schedtune.prefer_idle
#restricted
echo '0-2' > /dev/cpuset/restricted/cpus; chmod 0444 /dev/cpuset/restricted/cpus
#system background
echo '0-2' > /dev/cpuset/system-background/cpus; chmod 0444 /dev/cpuset/system-background/cpus
# # # CUSTOM SYSTEM UI SETTINGS # # #
#Disable Left and Right back gestures
settings put secure back_gesture_inset_scale_left -1; settings put secure back_gesture_inset_scale_right -1
#Restore Left and Right back gestures
# settings delete secure back_gesture_inset_scale_left; settings delete secure back_gesture_inset_scale_right
#Blacklist only rotation icon
settings put secure icon_blacklist rotate
#Show low priority icons
settings put secure low_priority 1
