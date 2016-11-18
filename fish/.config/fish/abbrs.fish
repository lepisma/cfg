# Abbreviations and aliases

# Apt-get
abbr -a g "sudo apt-get"
abbr -a c "sudo apt-cache"
abbr -a up "sudo apt-get update; sudo apt-get upgrade"

# Youtube-dl
abbr -a yt "youtube-dl --external-downloader=aria2c"

# Open things
abbr -a x "xdg-open"

# Holy tar
abbr -a t "tar xvf"

# Android keyboard init
abbr -a ak "adb forward tcp:7777 tcp:7777; xdg-open 'http://localhost:7777'"

# Set gpg2 as gpg (14.04)
alias gpg gpg2
