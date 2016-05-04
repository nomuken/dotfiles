#!/bin/bash
/usr/bin/xscreensaver -no-splash &
xmodmap ~/.Xmodmap &
nitrogen --restore &
amixer set Master 0 &
pulseaudio --start &
alsactl restore &
xss-lock -- xscreensaver-command -lock &
nm-applet &
xautolock -time 1 -locker 'xscreensaver-command -lock' &
insync start &
xbindkeys
pulseaudio --start
fcitx
