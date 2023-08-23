local autostart = require("awful").spawn.with_shell
local gears = require("gears")

autostart("picom")
autostart("fcitx5")
autostart('nm-applet')
autostart('blueman-applet')
autostart('xset s off')
autostart('xset -dpms')
autostart('xset s noblank')
autostart('xset s noexpose')
autostart(gears.filesystem.get_configuration_dir() .. 'misc/checkrnnoise')
