import os, subprocess

from libqtile import layout, bar, widget, hook
from libqtile.config import Key, Group, Screen
from libqtile.command import lazy

mod = 'mod1'


# running startup script
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


keys = [
    Key(
        [mod, 'shift'], 'Return',
        lazy.spawn("termite -e /bin/tmux")
    ),
    Key(
        [mod], 'p',
        lazy.spawn(
            "rofi -show run -font \"snap 10\" -fg \"#505050\" -bg \"#000000\" -hlfg \"#ffb964\" -hlbg \"#000000\" -o 85")
    ),
    Key(
        [mod, 'shift'], 'r',
        lazy.restart()
    ),
    Key(
        [mod], "Tab",
        lazy.layout.next()
    ),
    Key(
        [mod], "space",
        lazy.next_layout()
    ),
    Key(
        [mod, 'control'], "Return",
        lazy.layout.swap_left()
    ),
    Key(
        [mod], 'w',
        lazy.window.kill()
    ),
    Key(
        [mod, "shift"], 'l',
        lazy.spawn("xscreensaver-command -lock")
    ),
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("sh -c \"pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +5%\"")
       ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("sh -c \"pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -5%\"")
   ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("pactl set-sink-mute 0 toggle")
    )
]


layouts = [
    layout.xmonad.MonadTall(),
    layout.Max(),
]


groups = [Group(n) for n in "123456789"]


for g in groups:
    keys.append(
        Key([mod], g.name, lazy.group[g.name].toscreen())
    )
    keys.append(
        Key([mod, "shift"], g.name, lazy.window.togroup(g.name))
    )

screens = [
    # Screen(),
    Screen(
        top=bar.Bar([
            widget.GroupBox(),
            widget.WindowName(),
            widget.Battery(),
            widget.CPUGraph(),
            widget.Systray(),
            widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
        ], 18)),
]


widget_defaults = dict(
    font='Koruri',
    fontsize=13,
    padding=0,
)


# javalife
wmname = "LG3D"
