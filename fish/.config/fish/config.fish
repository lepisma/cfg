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

function vterm_printf;
    if [ -n "$TMUX" ]
        # tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end
