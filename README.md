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
    5. `sudo update-grub`
    6. `sudo reboot`
    7. Test if it worked.

## Install Temperature Monitoring
I have blown up two Razer Blades training models on the dGPU. Let's try to avoid that this time around!
1. `sudo apt install lm-sensors`
2. `sudo apt install psensor`
3. Launch `psensor`, set to run on start-up, configure which temp(s) to display on top-panel GUI.
4. Also use https://amanusk.github.io/s-tui/.

## Install CUDA
1. Despite having installed 20.04, TensorFlow's 18.04 [instructions](https://www.tensorflow.org/install/gpu) work. 

## Install Development Environment with CUDA Profiling Capabilities
1. `sudo apt install git`
2. `sudo apt install python3-distutils`
3. `sudo apt install python3-tk`
4. Give permission for profiling: open/create `/etc/modprobe.d/nvidia-kernel-common.conf` and add `options nvidia "NVreg_RestrictProfilingToAdminUsers=0"`.
5. Use software store to get appropriate version of PyCharm.
6. Add lipcupti to LD_LIBRARY_PATH to environment variables within PyCharm's Python run configuration.
![Screenshot](LD_LIBRARY_PATH.png)
7. Clone a TensorFlow project, make a virtual environment with PyCharm, test it out!

## Configure eGPU
1. Boot laptop unplugged from Razer Core.
2. Power on Razer Core and connect to Thunderbolt 3 port.
3. Install and follow instructions from [egpu-switcher](https://github.com/hertg/egpu-switcher)

## Install Docker with NVIDIA Support
1. Install Docker per [Ubuntu Instructions](https://docs.docker.com/engine/install/ubuntu/)
2. Complete linux post-implementation [steps](https://docs.docker.com/engine/install/linux-postinstall/)
3. Install [NVIDIA Docker support](https://github.com/NVIDIA/nvidia-docker)
