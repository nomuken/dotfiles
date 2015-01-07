import XMonad
import XMonad.Util.Run
import XMonad.Hooks.SetWMName
import XMonad.Util.EZConfig

-- XMonad Setup
main = do
		xmproc <- spawnPipe "xmobar"
		xmonad $ defaultConfig{
												terminal		= terminalSetting,
												startupHook = startupSetting
												}`additionalKeysP`
												[("M1-l",spawn "xscreensaver-command -lock")]

-- default terminal app
terminalSetting = "gnome-terminal"

-- startup command
startupSetting = do
		spawn "fcitx"
		spawn "/usr/bin/xscreensaver -no-splash &"
		spawn "xmodmap ~/.Xmodmap"
		setWMName "LG3D"
