function fish_greeting -d
  set_color $fish_color_autosuggestion
  uname -nmsr
  uptime
  set_color normal
end
