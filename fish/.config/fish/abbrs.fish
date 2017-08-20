# Apt-get
abbr -a p "sudo pacman -S"
abbr -a up "sudo pacman -Syu"
abbr -a cl "sudo pacman -R (sudo pacman -Qdtq); sudo pacman -Scc"
abbr -a s "sudo"

# Youtube-dl
abbr -a yt "youtube-dl --external-downloader=aria2c"

# Open things
abbr -a x "xdg-open"
# VPN
abbr -a v "sudo openconnect --juniper sslvpn.umass.edu"

abbr -a d "nmcli device disconnect wlo1"

abbr -a w "python2 -m SimpleHTTPServer 8000"

# Aliases
alias sl "ls"
alias m "micro"
alias dl "aria2c"
alias e "emacsclient -n -a micro"
