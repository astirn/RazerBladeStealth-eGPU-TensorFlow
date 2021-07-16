# RazerBladeStealth-eGPU-TensorFlow

## Install Ubuntu 20.04
1. Download and install [Ubuntu 20.04](https://ubuntu.com/download/desktop/thank-you?version=20.04&architecture=amd64)
2. Open Additional Drivers and select nvidia-driver-460
3. run `sudo bash post_install.sh`   
4. Reboot
5. Make sure `nvidia-smi` works
5. Confirm nouveau is disabled: `cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf` should print:
        blacklist nouveau
        options nouveau modeset=0
6. Test suspend loop fix (put laptop into suspend via lid closure)

## Configure eGPU
Only use use eGPU if the eGPU has a monitor attached. Otherwise, the eGPU will be disabled on boot. 

1. Boot laptop unplugged from Razer Core.
2. Power on Razer Core and connect to Thunderbolt 3 port.
3. Install and follow instructions from [egpu-switcher](https://github.com/hertg/egpu-switcher)

## Install Docker with NVIDIA Support
1. Install Docker per [Ubuntu Instructions](https://docs.docker.com/engine/install/ubuntu/)
2. Complete linux post-implementation [steps](https://docs.docker.com/engine/install/linux-postinstall/)
3. Install [NVIDIA Docker support](https://github.com/NVIDIA/nvidia-docker)

## Install Razer-Drivers and CLI (optional)
Install this if want you access to gaming mode that can deliver a max of 25W to CPU instead of 15W.
This linux tool provides a CLI that mimics Razer Synapse for Windows.
Big props to @rnd-ash for adding my 2020 RBS variant to the supported laptops!
That said, I did not notice a performance boost when using TensorFlow.

1. Install driver:

        cd ~
        git clone https://github.com/rnd-ash/razer-laptop-control/
        cd ~/razer-laptop-control/driver
        cd driver
        sudo make driver_dkms
        Observe version number a.b.c (tested with 1.2.2)
        sudo dkms add -m razercontrol -v a.b.c
        sudo dkms build -m razercontrol -v a.b.c
        sudo dkms install -m razercontrol -v a.b.c
        sudo update-initramfs -u
        sudo reboot
        
2. Install CLI:

        sudo apt install cargo
        cd ~/razer-laptop-control/razer_control_gui
        ./install.sh
        
3. For 15W limit: `razer-cli write power 0`. For 25W limit `razer-cli write power 1`
