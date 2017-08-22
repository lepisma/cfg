#!/usr/bin/env fish

sudo rmmod hid-kye
sudo rmmod hid-uclogic
sudo rmmod hid-huion

# Setup driver
# Use https://aur.archlinux.org/packages/digimend-kernel-drivers-dkms-git/

# Create entry
sudo mkdir -p /etc/X11/xorg.conf.d

echo -e "Section \"InputClass\"
Identifier \"Huion on wacom\"
MatchProduct \"HUION\"
MatchDevicePath \"/dev/input/event*\"
Driver \"wacom\"
EndSection" | sudo tee /etc/X11/xorg.conf.d/52-tablet.conf > /dev/null
