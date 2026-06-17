#!/usr/bin/env sh

export DISPLAY="${DISPLAY:-:0}"
export XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}"

if command -v xrandr >/dev/null 2>&1; then
  monitors="$(polybar --list-monitors 2>/dev/null | cut -d: -f1)"
  [ -n "$monitors" ] || exit 0
else
  monitors=""
fi

polybar-msg cmd quit >/dev/null 2>&1

while pgrep -x polybar >/dev/null; do
  sleep 0.2
done

if [ -n "$monitors" ]; then
  for monitor in $monitors; do
    setsid -f env MONITOR="$monitor" polybar --reload main >/tmp/polybar-"$monitor".log 2>&1
  done
else
  exec polybar --reload main
fi
