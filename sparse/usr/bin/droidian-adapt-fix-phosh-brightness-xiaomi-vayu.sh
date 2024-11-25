#!/bin/sh

# TOOT_VERSION 1.0.2
## Script service to set the screen brightnes to 50% after phosh is started
#
# Copyright (C) 2024 Berbascum <berbascum@ticv.cat>
# All rights reserved.
#
# BSD 3-Clause License


## Log
ADAPTATION_LOG="/var/log/droidian-adaptation/droidian-adaptation-xiaomi-vayu.log"
echo "$(date +'%Y-%m-%d %H:%M:%S') Fixing brightness..." | tee -a "${ADAPTATION_LOG}"

## Wait for keyboard to ensure that brightness set takes efect in the phosh session
kbd_loaded="$(pgrep -ac "wvkbd|osk")"
while [ "${kbd_loaded}" -eq "0" ]; do

    echo "Waiting for keyboard" | tee -a "${ADAPTATION_LOG}"
    sleep 3
    kbd_loaded="$(pgrep -ac "wvkbd|osk")"
done


bright_max="4095"
bright_lvl="$1"
[ -z "${bright_lvl}" ] && bright_lvl="60"
[ "${bright_lvl}" -gt "0" ] || exit 1

bright_to_set=$((bright_max * bright_lvl / 100))

echo "bright_max = ${bright_max}" | tee -a "${ADAPTATION_LOG}"
echo "bright_to_set = ${bright_to_set}" | tee -a "${ADAPTATION_LOG}"
echo "bright_lvl = ${bright_lvl}" | tee -a "${ADAPTATION_LOG}"

echo "${bright_to_set}" | tee /sys/class/backlight/backlight/brightness
echo "${bright_to_set}" | tee /sys/class/backlight/panel0-backlight/brightness

exit 0
