#!/bin/bash
command -v jq >/dev/null || exit 0
command -v notify-send >/dev/null || exit 0

INPUT=$(cat)
TITLE=$(printf '%s' "$INPUT" | jq -r '.title // "Claude Code"')
MESSAGE=$(printf '%s' "$INPUT" | jq -r '.message // "Needs attention"')
TYPE=$(printf '%s' "$INPUT" | jq -r '.notification_type // "unknown"')

case "$TYPE" in
  permission_prompt)
    URGENCY="critical"
    SOUND="/usr/share/sounds/freedesktop/stereo/dialog-warning.oga"
    ;;
  *)
    URGENCY="normal"
    SOUND="/usr/share/sounds/freedesktop/stereo/message.oga"
    ;;
esac

notify-send -a "Claude Code" -u "$URGENCY" "$TITLE" "$MESSAGE"
command -v pw-play >/dev/null && pw-play "$SOUND" & disown
