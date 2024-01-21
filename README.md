
**Use these scripts to install nvidia drivers and ROS2-Foxy to ubuntu-20.04**
Clone the repo 
and add the executable permission to the shell files. 
For e.g:
Alternatively you can install nvidia drivers by: `sudo apt install nvidia-driver-5xx` 535,545 or whichever you feel

    chmod +x cuda.sh

After installing driver if you see blank screen after bootloader:
1. In grub menu select ubuntu and press e and add `nvidia-drm.modeset=1` to the line where it says cmdline_linux you can read about this [here](https://forums.linuxmint.com/viewtopic.php?t=352940) 
Tip: If you are from Indian and using JIO as your ISP, nvidia drivers and foxy installation might fail as jio has banned raw.github domain.
