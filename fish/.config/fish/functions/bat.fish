function bat -d "Show battery status"
  upower -i (upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"
end
