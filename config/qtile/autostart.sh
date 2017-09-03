#!/bin/bash
xscreensaver -no-splash &
xmodmap ~/.Xmodmap &
nitrogen --restore &
amixer set Master 0 &
pulseaudio --start &
alsactl restore &
nm-applet &
xautolock -time 3 -locker 'xscreensaver-command -lock' &
insync start &
xbindkeys
pulseaudio --start
fcitx
xcompmgr &
