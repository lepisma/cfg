# Abbreviations and aliases

# Apt-get
abbr -a a "sudo apt"
abbr -a up "sudo apt update; sudo apt upgrade"
abbr -a cl "sudo apt autoremove; sudo apt autoclean"
abbr -a s "sudo"
abbr -a pom "fish -c _pom &"

# Youtube-dl
abbr -a yt "youtube-dl --external-downloader=aria2c"

# Open things
abbr -a x "xdg-open"

# Android keyboard init
abbr -a ak "adb forward tcp:7777 tcp:7777; xdg-open 'http://localhost:7777'"

# VPN
abbr -a v "sudo openconnect --juniper sslvpn.umass.edu"

# Aliases
alias ls "exa"
alias sl "exa"
alias m "micro"
alias dl "aria2c"
