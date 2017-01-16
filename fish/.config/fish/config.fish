# Fish config
set fish_greeting ""
set fish_home ~/.config/fish

# Source
source $fish_home/environments.fish
source $fish_home/abbrs.fish

# Python version changer
function py
  if count $argv > /dev/null
    switch $argv[1]
      case "2"
        echo "Switching to python2"
        bass source activate python2
      case "3"
        echo "Switching to python3"
        bass source deactivate
      case "*"
        echo "Invalid environment"
        return 1
    end
  else
    echo "Provide python environment name"
    return 1
  end
end

# MPD stuff
function mu
  if count $argv > /dev/null
    switch $argv[1]
      case "p"
        echo "Playing all songs on shuffle"
        mpc ls | mpc add; and mpc shuffle; and mpc play
      case "up"
        mpc update --wait
      case "l"
        # Love track on last.fm
        mpc sendmessage mpdas love
      case "*"
        echo "Invalid argument"
        return 1
    end
  else
    # Run daemon with scrobbler
    echo "Starting mpd"
    mpd --stderr
    mpdas &
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

# Pip shorthands
function p
  if count $argv > /dev/null
    switch $argv[1]
      case "i"
        pip install $argv[2..-1]
      case "r"
        pip uninstall $argv[2..-1]
      case "g"
        pipreqs --force ./
    end
  else
    return 1
  end
end

# Do the most sensible thing
function do
  if count $argv > /dev/null
    switch (echo $argv[1] | hiss "(.split \".\") (last) (.lower)")
      case "gz"
        tar xvf $argv[1]
      case "xz"
        tar xvf $argv[1]
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
