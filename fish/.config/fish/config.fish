# Fish config
set fish_greeting ""
set fish_home ~/.config/fish

# Source
source $fish_home/music.fish
source $fish_home/environments.fish
source $fish_home/abbrs.fish
source $fish_home/python.fish

# Colors for bob-the-fish
set -g theme_color_scheme user
set colorfg black
set -g __color_initial_segment_exit  black red
set -g __color_initial_segment_su    black brgreen
set -g __color_initial_segment_jobs  black cyan

set -g __color_path                  0d0d0d white
set -g __color_path_basename         0d0d0d white --bold
set -g __color_path_nowrite          magenta $colorfg
set -g __color_path_nowrite_basename magenta $colorfg --bold

set -g __color_repo                  green $colorfg
set -g __color_repo_work_tree        black $colorfg --bold
set -g __color_repo_dirty            brred $colorfg
set -g __color_repo_staged           yellow $colorfg

set -g __color_vi_mode_default       brblue $colorfg --bold
set -g __color_vi_mode_insert        brgreen $colorfg --bold
set -g __color_vi_mode_visual        bryellow $colorfg --bold

set -g __color_vagrant               brcyan $colorfg --bold
set -g __color_username              white black
set -g __color_rvm                   brmagenta $colorfg --bold
set -g __color_virtualfish           brblue $colorfg --bold

# Not bc
function :
  python -c "print($argv)"
end

# Pomodoro
function _pom
  function _pom_notify
    notify-send -u "critical" -t 10000 -a "pom" $argv
  end
  while true
    _pom_notify "Work time" "Get things done."
    sleep 1800 # 30 mins
    _pom_notify "Break time" "Take a break, drink water etc."
    sleep 300 # 5 mins
  end
end

# Conkeror
function conkeror
  firefox -app ~/tools/conkeror/application.ini $argv
end

# Install zipped fonts
function install-fonts
  for zipped in *.zip
    unzip -o $zipped "*tf" -d /var/tmp
  end

  sudo cp /var/tmp/*tf /usr/share/fonts/
  fc-cache -f -v
end

# Do the most sensible thing
function do
  if count $argv > /dev/null
    switch (echo $argv[1] | awk -F . '{if (NF>1) {print $NF}}')
      case "gz" "xz"
        tar xvf $argv[1]
      case "ace"
        unace x $argv[1]
      case "rar"
        unrar x $argv[1]
      case "7z"
        7z x $argv[1]
      case "zip"
        unzip $argv[1]
      case "deb"
        sudo dpkg -i $argv[1]
      case "py"
        python $argv[1]
      case "hy"
        hy $argv[1]
      case "js"
        node $argv[1]
      case "*"
        xdg-open $argv[1]
    end
  else
    return 1
  end
end

# Wrapper for q
function q
  python2 (which q)
end

# Tablet default keyset
function huion-set
  xsetwacom --set "HUION PenTablet Pad pad" Button 1 "key +ctrl +z -z -ctrl"
  xsetwacom --set "HUION PenTablet Pad pad" Button 2 "key e"
  xsetwacom --set "HUION PenTablet Pad pad" Button 3 "key b"
  xsetwacom --set "HUION PenTablet Pad pad" Button 8 "key +"
  xsetwacom --set "HUION PenTablet Pad pad" Button 9 "key -"
  xsetwacom --set "HUION PenTablet Pad pad" Button 10 "key ]"
  xsetwacom --set "HUION PenTablet Pad pad" Button 11 "key ["
  xsetwacom --set "HUION PenTablet Pad pad" Button 12 "key p"
end
