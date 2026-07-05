#!/usr/bin/env sh
set -eu

dir="${XDG_PICTURES_DIR:-$HOME/pictures}/screenshots"
mkdir -p "$dir"

name="screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"
file="$dir/$name"

case "${1:-area}" in
  area|Area)
    maim --select --hidecursor "$file"
    ;;
  full|Full)
    maim --hidecursor "$file"
    ;;
  *)
    exit 2
    ;;
esac

xclip -selection clipboard -t image/png -i "$file"

notify-send -i camera-photo "Screenshot saved" "$file"
