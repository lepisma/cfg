abbr -a i "yay -S"
abbr -a r "yay -Rsn"
abbr -a up "yay -Syu --devel"
abbr -a cl "yay -Rsn (yay -Qdtq); yay -Scc"
abbr -a s "sudo"

abbr -a yt "youtube-dl --external-downloader=aria2c"
abbr -a ya "youtube-dl -x --audio-format opus --audio-quality 0 --no-playlist"

abbr -a x "xdg-open"
abbr -a d "nmcli device disconnect wlp2s0"
abbr -a w "live-server"

# We should have yasnippet in shell/term-emus
abbr -a doc "sudo docker run -t -i -v (pwd):\"/that-dir\" ubuntu:trusty /bin/bash"

alias el "eless"
alias sl "ls"
alias m "mumacs"
alias dl "aria2c"
alias e "emacsclient -n -a mumacs"
alias magit "emacsclient -n -e \(magit-status\)"
