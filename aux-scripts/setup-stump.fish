#!/usr/bin/env fish

ros build ~/bin/stumpwm.ros
install -m 0755 ~/bin/stumpwm /usr/local/bin
echo "export KDEWM=/usr/local/bin/stumpwm" > ~/.config/plasma-workspace/env/set_window_manager.sh
rm -f ~/bin/stumpwm
git clone https://github.com/stumpwm/stumpwm-contrib ~/stumpwm/contrib
mkdir ~/stumpwm/local
git clone git@github.com/lepisma/swm-calibre ~/stumpwm/local/