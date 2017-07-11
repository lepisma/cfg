function ya -d "Download audio from youtube links"
  youtube-dl -x --audio-format opus --audio-quality 0 --no-playlist $argv
end
