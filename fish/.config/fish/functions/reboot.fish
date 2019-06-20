function reboot -d "Confirm before reboot"
    read -l -n1 -p "set_color -o red; echo -n 'really reboot? [yn] '; set_color normal" ans
    string match -qi y -- $ans; or return 1
    command reboot $argv
end
