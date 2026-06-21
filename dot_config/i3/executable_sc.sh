#!/usr/bin/env sh
set -eu

dir="${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"
mkdir -p "$dir"

name="screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"
file="$dir/$name"

mode="${1:-}"
if [ -z "$mode" ]; then
  mode="$(printf 'Area\nWindow\nFull\n' | rofi -dmenu -i -p screenshot)"
  sleep 0.2
fi

case "$mode" in
  Area|area)
    maim --select --hidecursor --quiet "$file"
    ;;
  Window|window)
    window_id="$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')"
    case "$window_id" in
      ""|0x0|0)
        exit 1
        ;;
    esac
    maim --window "$window_id" --hidecursor --quiet "$file"
    ;;
  Full|full)
    maim --hidecursor --quiet "$file"
    ;;
  *)
    exit 0
    ;;
esac

xclip -selection clipboard -t image/png -i "$file"
notify-send -a screenshot -i "$file" "Screenshot" "$name copied"
