sudo apt update

# enable firefox to view streaming videos
sudo apt install ffmpeg

# disable/blacklist nouveau drivers:
echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf
echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf
cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf

# fix suspend loop (i.e. resuming after a lid-closing-induced suspend, will continually suspend 30 seconds after login)
sudo nano /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*/& button.lid_init_state=open/' file
sudo update-grub

# install temperature monitoring
sudo apt install lm-sensors
sudo apt install psensor

# install snap applications
sudo snap install pycharm-professional slack

# reboot
sudo reboot