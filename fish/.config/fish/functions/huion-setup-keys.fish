function huion-setup-keys -d "Huion tablet setup"
  xsetwacom --set "HUION PenTablet Pad pad" Button 1 "key +ctrl +z -z -ctrl"
  xsetwacom --set "HUION PenTablet Pad pad" Button 2 "key e"
  xsetwacom --set "HUION PenTablet Pad pad" Button 3 "key b"
  xsetwacom --set "HUION PenTablet Pad pad" Button 8 "key +"
  xsetwacom --set "HUION PenTablet Pad pad" Button 9 "key -"
  xsetwacom --set "HUION PenTablet Pad pad" Button 10 "key ]"
  xsetwacom --set "HUION PenTablet Pad pad" Button 11 "key ["
  xsetwacom --set "HUION PenTablet Pad pad" Button 12 "key p"

  # https://askubuntu.com/questions/839161/limit-a-graphics-tablet-to-one-monitor
  # Get monitor via xrandr
  set -l monitor "HDMI1"
  xinput map-to-output (xinput | grep "Pen stylus" | cut -f 2 | cut -c 4-5) $monitor
end
