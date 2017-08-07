# Apt-get
abbr -a a "sudo apt"
abbr -a up "sudo apt update; sudo apt upgrade"
abbr -a cl "sudo apt autoremove; sudo apt autoclean"
abbr -a s "sudo"

# Youtube-dl
abbr -a yt "youtube-dl --external-downloader=aria2c"

# Open things
abbr -a x "xdg-open"

# Android keyboard init
abbr -a ak "adb forward tcp:7777 tcp:7777; xdg-open 'http://localhost:7777'"

# VPN
abbr -a v "sudo openconnect --juniper sslvpn.umass.edu"

abbr -a d "nmcli device disconnect wlo1"

abbr -a w "python2 -m SimpleHTTPServer 8000"

# Aliases
alias sl "ls"
alias m "micro"
alias dl "aria2c"
alias e "emacsclient -n -a micro"
