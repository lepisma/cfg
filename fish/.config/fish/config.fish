# Fish config
set fish_greeting ""
set fish_home ~/.config/fish

# Source
source $fish_home/music.fish
source $fish_home/environments.fish
source $fish_home/abbrs.fish

# Colors for bob-the-fish
set -g theme_color_scheme user
set colorfg black
set -g __color_initial_segment_exit  black red
set -g __color_initial_segment_su    black brgreen
set -g __color_initial_segment_jobs  black cyan

set -g __color_path                  0d0d0d white
set -g __color_path_basename         0d0d0d white --bold
set -g __color_path_nowrite          magenta $colorfg
set -g __color_path_nowrite_basename magenta $colorfg

set -g __color_repo                  green $colorfg
set -g __color_repo_work_tree        black $colorfg --bold
set -g __color_repo_dirty            brred $colorfg
set -g __color_repo_staged           yellow $colorfg

set -g __color_username              white black
set -g __color_virtualfish           brblue $colorfg

# Emacs
if test -n "$EMACS"
  set -x TERM eterm-color
end

function fish_title
  true
end
