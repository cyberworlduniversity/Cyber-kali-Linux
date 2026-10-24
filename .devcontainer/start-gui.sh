#!/usr/bin/env bash
set -e

export DISPLAY=:1
export XDG_RUNTIME_DIR=/tmp/runtime-kali
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"

# Start a virtual X display for the desktop.
Xvfb "$DISPLAY" -screen 0 1280x800x24 -ac +extension GLX +render -noreset >/tmp/xvfb.log 2>&1 &

sleep 2

# Start XFCE without requiring systemd.
dbus-run-session --start -- xfce4-session >/tmp/xfce.log 2>&1 &

sleep 5

# Expose the desktop only through localhost VNC.
x11vnc -display "$DISPLAY" -localhost -nopw -forever -shared -rfbport 5901 >/tmp/x11vnc.log 2>&1 &

sleep 2

# Browser-accessible HTML5 desktop.
/usr/share/novnc/utils/novnc_proxy --listen 6080 --vnc localhost:5901 --web /usr/share/novnc >/tmp/novnc.log 2>&1 &

echo "CWU Kali GUI ready on port 6080"

# Keep the container alive.
wait
