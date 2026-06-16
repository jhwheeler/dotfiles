#!/bin/bash
current=$(tmux display-message -p '#S')

# SSH: peach/Catppuccin Mocha; Local: purple/Dracula
if [ -n "$SSH_CONNECTION" ]; then
  active_color="#fab387"
  inactive_color="#a6adc8"
else
  active_color="#bd93f9"
  inactive_color="#bfbfbf"
fi

tmux list-sessions -F '#S' | while read -r s; do
  if [ "$s" = "$current" ]; then
    printf "#[fg=%s,bold]%s " "$active_color" "$s"
  else
    printf "#[fg=%s,nobold]%s " "$inactive_color" "$s"
  fi
done
