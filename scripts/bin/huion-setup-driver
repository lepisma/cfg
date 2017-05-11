#!/usr/bin/env fish

sudo rmmod hid-kye
sudo rmmod hid-uclogic
sudo rmmod hid-huion

# Download driver
rm -rf /tmp/digimend
git clone "https://github.com/DIGImend/digimend-kernel-drivers" /tmp/digimend
cd /tmp/digimend
make
sudo make install

# Create entry
sudo mkdir -p /etc/X11/xorg.conf.d
cd /etc/X11/xorg.conf.d

sudo echo -e "Section \"InputClass\"
Identifier \"Huion on wacom\"
MatchProduct \"HUION\"
MatchDevicePath \"/dev/input/event*\"
Driver \"wacom\"
EndSection" > 52-tablet.conf
