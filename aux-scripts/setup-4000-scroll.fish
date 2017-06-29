#!/usr/bin/env fish

# Setup scroll for microsoft 4000 keyboard
echo -e "evdev:input:b0003v045Ep00DB*
  KEYBOARD_KEY_c022d=pageup
  KEYBOARD_KEY_c022e=pagedown" | sudo tee /etc/udev/hwdb.d/70-keyboard-local.hwdb > /dev/null

sudo udevadm hwdb --update
sudo udevadm control --reload
