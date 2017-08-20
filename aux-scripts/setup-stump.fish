#!/usr/bin/env fish

# Setup dependencies
sbcl --eval "(ql:quickload '(clx-truetype swank stumpwm cl-strings inferior-shell))" --quit

echo -e "#!/usr/bin/env bash
sbcl --load /home/lepisma/cfg/misc/run-stumpwm.lisp" | sudo tee /usr/local/bin/stumpwm-sbcl > /dev/null

mkdir -p ~/stumpwm/local
git clone https://github.com/stumpwm/stumpwm-contrib ~/stumpwm/contrib
git clone git@github.com:lepisma/swm-calibre ~/stumpwm/local/swm-calibre