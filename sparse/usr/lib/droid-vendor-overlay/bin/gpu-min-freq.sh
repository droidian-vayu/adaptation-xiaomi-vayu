# On Droidian the the scheduler is not scaling the GPU frequency correctly 
# The GPU Frequency stay to min_freq (275MHz) but it works correctly with Waydroid.
# So we force the min_freq with the max_freq (675MHz) to force GPU to max frequency.
# Another scheduler maybe for energy save, always decrease GPU frequency 
# when we don't need lot of GPU power. So it force the current frequency to 
# the real original min_freq (275MHz). So when we don't need GPU, the frequency stay at 
# 257Mhz, as before.
# This is a provisional fix, it should be ameliorate, but works correctly.
# It need to wait about 130 seconds before applying the new value, and after after 
# the application of the new max_freq so it need exec_background.

#!/system/bin/sh

echo "GPU script started" > /dev/kmsg

sleep 130

echo "GPU init: setting min_freq" > /dev/kmsg

echo 675000000 > /sys/devices/platform/soc/2c00000.qcom,kgsl-3d0/devfreq/2c00000.qcom,kgsl-3d0/min_freq

echo "GPU min_freq after write: $(cat /sys/devices/platform/soc/2c00000.qcom,kgsl-3d0/devfreq/2c00000.qcom,kgsl-3d0/min_freq)" > /dev/kmsg
