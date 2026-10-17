# On Droidian the GPU max freq is not correct with Droidian/Salifish vendor
# It is limited to 585MHz instead of 675Mhz 
# So we change max_freq to 675MHz
# It need to wait about 120 seconds before applying the new value.
#!/system/bin/sh

echo "GPU Max script started" > /dev/kmsg

sleep 120

echo "GPU init: setting max_freq" > /dev/kmsg

echo 675000000 > /sys/devices/platform/soc/2c00000.qcom,kgsl-3d0/devfreq/2c00000.qcom,kgsl-3d0/max_freq

echo "GPU max_freq after write: $(cat /sys/devices/platform/soc/2c00000.qcom,kgsl-3d0/devfreq/2c00000.qcom,kgsl-3d0/max_freq)" > /dev/kmsg
