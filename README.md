# RazerBladeStealth-eGPU-TensorFlow

## Install Ubuntu 20.04
  1. Download and install [Ubuntu 20.04](https://ubuntu.com/download/desktop/thank-you?version=20.04&architecture=amd64).
  2. Open Additional Drivers and select nvidia-driver-440
  3. Disable nouveau drivers:
  
    * `sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"`
    * `sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"`
    
  4. Reboot and test via terminal with `nvidia-smi`.
