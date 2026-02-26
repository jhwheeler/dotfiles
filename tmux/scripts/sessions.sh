#!/bin/bash
current=$(tmux display-message -p '#S')
tmux list-sessions -F '#S' | while read -r s; do
  if [ "$s" = "$current" ]; then
    printf "#[fg=#bd93f9,bold]%s " "$s"
  else
    printf "#[fg=#bfbfbf,nobold]%s " "$s"
  fi
done
