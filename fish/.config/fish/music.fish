## Music related functions

function player-toggle
  if bbq :current > /dev/null 2>&1
    bbq :toggle
    polybar-msg hook mpm 1
  else
    return 1
  end
end

function player-next
  if bbq :current > /dev/null 2>&1
    bbq :next
    polybar-msg hook mpm 1
  else
    return 1
  end
end

function player-prev
  if bbq :current > /dev/null 2>&1
    bbq :prev
    polybar-msg hook mpm 1
  else
    return 1
  end
end
