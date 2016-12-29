# Abbreviations and aliases

# Apt-get
abbr -a g "sudo apt"
abbr -a c "sudo apt-cache"
abbr -a up "sudo apt update; sudo apt upgrade"
abbr -a cl "sudo apt autoremove; sudo apt autoclean"

# Youtube-dl
abbr -a yt "youtube-dl --external-downloader=aria2c"

# Open things
abbr -a x "xdg-open"

# Holy tar
abbr -a t "tar xvf"

# Android keyboard init
abbr -a ak "adb forward tcp:7777 tcp:7777; xdg-open 'http://localhost:7777'"

# VPN
abbr -a v "sudo openconnect --juniper sslvpn.umass.edu"

# Better colors
alias ls "exa"
