#!/bin/bash

echo "     _ _     _                _     "
echo " ___(_) |_  | |__   __ _  ___| | __ "
echo "/ __| | __| | '_ \ / _\` |/ __| |/ /"
echo "\__ \ | |_  | |_) | (_| | (__|   <  "
echo "|___/_|\__| |_.__/ \__,_|\___|_|\_\ "
echo "                                    "
echo "--------------------------------------"

help_and_die () {
    echo -e ">> usage: bootstrap <link|copy|packages>"
    exit
}

if [ ! $# == 1 ]; then
    help_and_die
fi

if [ $1 == "link" ]; then
    echo -e "\n>> Setting up symlinks"
    to_stow=( fish git matplotlib scripts micro mpd beets stumpwm dunst compton redshift xmodmap polybar vis offlineimap )
    for dir in ${to_stow[@]}; do
        stow -t ~/ $dir
        echo "✓ $dir"
    done
    echo ""
elif [ $1 == "copy" ]; then
    echo -e "\n>> Copying stuff needing modifications"
    to_copy=( mopidy/.config mpdas/.mpdasrc )

    for dir in ${to_copy[@]}; do
        cp -r $dir ~/
        echo "✓ $dir"
    done
    echo ""
elif [ $1 == "packages" ]; then
    cd ./packages
    bash ./setup.sh
    cd ..

    echo ">> Setting fish as default shell"
    chsh -s $(which fish)
else
    help_and_die
fi
