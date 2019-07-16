# Fish config
set fish_greeting ""
set fish_home ~/.config/fish

# Source
source $fish_home/environment.fish
source $fish_home/abbrs.fish

# Emacs
if test -n "$EMACS"
  set -x TERM eterm-color
end

function fish_title
  true
end

eval (dircolors -c ~/cfg/misc/dircolors)
direnv hook fish | source
