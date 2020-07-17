# RazerBladeStealth-eGPU-TensorFlow

## Install Ubuntu 20.04
1. Download and install [Ubuntu 20.04](https://ubuntu.com/download/desktop/thank-you?version=20.04&architecture=amd64)
2. Open Additional Drivers and select nvidia-driver-440
3. Disable nouveau drivers:

        sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
        sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

4. Reboot and test via terminal with `nvidia-smi`
5. Confirm nouveau is disabled: `cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf` should print:

        blacklist nouveau
        options nouveau modeset=0
        
6. Fix suspend loop (i.e. resuming after a lid-closing-induced suspend, will continually suspend 30 seconds after login)
    1. `sudo nano /etc/default/grub`
    2. Find line with `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash`
    3. Modify to `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash button.lid_init_state=open`
    4. Save and close.
    5. `sudo update grub`
    6. `sudo reboot`
    7. Test if it worked.

## Install Docker with NVIDIA Support
1. Install Docker per [Ubuntu Instructions](https://docs.docker.com/engine/install/ubuntu/)
2. Complete linux post-implementation [steps](https://docs.docker.com/engine/install/linux-postinstall/)
3. Install [NVIDIA Docker support](https://github.com/NVIDIA/nvidia-docker)
