function __cmd_duration -S -d 'Show command duration'
  [ "$theme_display_cmd_duration" = "no" ]; and return
  [ -z "$CMD_DURATION" -o "$CMD_DURATION" -lt 100 ]; and return

  if [ "$CMD_DURATION" -lt 5000 ]
    echo -ns $CMD_DURATION 'ms'
  else if [ "$CMD_DURATION" -lt 60000 ]
    math "$CMD_DURATION/1000" | string replace -r '\\.0$' ''
    echo -n 's'
  else if [ "$CMD_DURATION" -lt 3600000 ]
    set_color $fish_color_error
    math "$CMD_DURATION/60000" | string replace -r '\\.0$' ''
    echo -n 'm'
  else
    set_color $fish_color_error
    math "$CMD_DURATION/3600000" | string replace -r '\\.0$' ''
    echo -n 'h'
  end

  set_color $fish_color_normal
end

function __prompt_virtualenv
  if [ $VIRTUAL_ENV ]
    set_color brblue -o
    echo -ns (basename "$VIRTUAL_ENV") ' '
    set_color normal
  end
end

function fish_right_prompt
  set -l cwd (basename (pwd | sed "s:^$HOME:~:"))
  set_color $fish_color_autosuggestion
  __cmd_duration
  set_color 777777
  echo -n -s ' ' $cwd ' '
  set_color normal
  __prompt_virtualenv
end
