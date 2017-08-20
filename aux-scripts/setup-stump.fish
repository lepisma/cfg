#!/usr/bin/env fish

ros build ./stumpwm.ros
install -m 0755 ./stumpwm /usr/local/bin
rm -f ./stumpwm
git clone https://github.com/stumpwm/stumpwm-contrib ~/stumpwm/contrib
mkdir ~/stumpwm/local
git clone git@github.com:lepisma/swm-calibre ~/stumpwm/local/swm-calibre
