function pom -d "Run pom"
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
