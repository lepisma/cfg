function bat -d "Show battery status"
  upower -i (upower -e | grep 'BAT') | grep -E 'state|to\ full|percentage' | tr -s ' ' | tr -d '\n'
end
