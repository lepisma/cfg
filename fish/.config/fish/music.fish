## Music related functions

function player-toggle
  if bbq :current > /dev/null 2>&1
    bbq :toggle
  else if sp > /dev/null 2>&1
    sp play
  else
    return 1
  end
end

function player-next
  if bbq :current > /dev/null 2>&1
    bbq :next
  else if sp > /dev/null 2>&1
    sp next
  else
    return 1
  end
end

function player-prev
  if bbq :current > /dev/null 2>&1
    bbq :prev
  else if sp > /dev/null 2>&1
    sp prev
  else
    return 1
  end
end
