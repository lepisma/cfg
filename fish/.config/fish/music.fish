## Music related functions

# MPD Control
function mp
  if count $argv > /dev/null
    switch $argv[1]
      case "all"
        echo "Playing all songs on shuffle"
        mpc clear; and mpc ls | mpc add; and mpc shuffle; and mpc play
      case "up"
        mpc update --wait
      case "l"
        # Love track on last.fm
        mpc sendmessage mpdas love
      case "*"
        mpc clear; and mpc search $argv | mpc add; and mpc play
    end
  else
    # Run daemon with scrobbler
    echo "Starting mpd"
    mpd --stderr
    mpdas &
  end
end

# All music player controls
# --------------------------

function _mpd_playing
  switch (string join " " (mpc))
    case "*[playing]*"
      return 0
    case "*"
      return 1
  end
end

function _work_on_mpd
  # Check if mpd is playing
  if mpc > /dev/null 2>&1; and _mpd_playing
    return 0
  else if sp > /dev/null 2>&1
    # spotify is running
    return 1
  else
    # Spotify not running
    if mpc > /dev/null 2>&1
      # Mpd running, toggle
      return 0
    else
      return 1
    end
  end
end

function _work_on_spotify
  if sp > /dev/null 2>&1
    return 0
  else
    return 1
  end
end

function player-toggle
  if _work_on_mpd
    mpc toggle > /dev/null 2>&1
  else if _work_on_spotify
    sp play
  else
    return 1
  end
end

function player-next
  if _work_on_mpd
    mpc next > /dev/null 2>&1
  else if _work_on_spotify
    sp next
  else
    return 1
  end
end

function player-prev
  if _work_on_mpd
    mpc prev > /dev/null 2>&1
  else if _work_on_spotify
    sp prev
  else
    return 1
  end
end
