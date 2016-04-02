# Housekeeping when I leave the machine

function presence
  if count $argv > /dev/null
    switch $argv[1]
      case "off"
        # Switch pidgin to offline
        dbus-send --print-reply --dest=im.pidgin.purple.PurpleService /im/pidgin/purple/PurpleObject im.pidgin.purple.PurpleInterface.PurpleSavedstatusActivate int32:369
      case "on"
        # Switch pidgin to available
        dbus-send --print-reply --dest=im.pidgin.purple.PurpleService /im/pidgin/purple/PurpleObject im.pidgin.purple.PurpleInterface.PurpleSavedstatusActivate int32:368
      case "*"
        echo "Invalid argument"
        return 1
    end
  else
    echo "Provide a status"
    return 1
  end
end
