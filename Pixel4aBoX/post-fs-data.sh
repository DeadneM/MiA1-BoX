#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode

# # # SCHED TUNING # # #
echo "0" > /proc/sys/kernel/sched_schedstats
echo "1" > /proc/sys/kernel/sched_tunable_scaling
#general
echo "0" > /dev/stune/schedtune.boost
echo "1" > /dev/stune/schedtune.prefer_high_cap
echo "1" > /dev/stune/schedtune.prefer_idle
#background
echo "0" > /dev/stune/background/schedtune.boost
echo "1" > /dev/stune/background/schedtune.prefer_high_cap
echo "1" > /dev/stune/background/schedtune.prefer_idle
#foreground
echo "0" > /dev/stune/foreground/schedtune.boost
echo "1" > /dev/stune/foreground/schedtune.prefer_high_cap
echo "1" > /dev/stune/foreground/schedtune.prefer_idle
#top-app
echo "0" > /dev/stune/top-app/schedtune.boost
echo "1" > /dev/stune/top-app/schedtune.prefer_high_cap
echo "1" > /dev/stune/top-app/schedtune.prefer_idle
#camera-daemon
echo "0" > /dev/stune/camera-daemon/schedtune.boost
echo "1" > /dev/stune/camera-daemon/schedtune.prefer_high_cap
echo "1" > /dev/stune/camera-daemon/schedtune.prefer_idle
#nnapi-hal
echo "0" > /dev/stune/nnapi-hal/schedtune.boost
echo "1" > /dev/stune/nnapi-hal/schedtune.prefer_high_cap
echo "1" > /dev/stune/nnapi-hal/schedtune.prefer_idle
#rt
echo "0" > /dev/stune/rt/schedtune.boost
echo "1" > /dev/stune/rt/schedtune.prefer_high_cap
echo "1" > /dev/stune/rt/schedtune.prefer_idle

