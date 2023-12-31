-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")

-- {{{ Wallpaper
gears.wallpaper.maximized(beautiful.wallpaper, s)
--screen.connect_signal("request::wallpaper", function(s)
    --awful.wallpaper({
        --screen = s,
        --widget = {
            --{
                --image = beautiful.wallpaper,
                --upscale = true,
                --downscale = true,
                --widget = wibox.widget.imagebox,
            --},
            --valign = "center",
            --halign = "center",
            --tiled = false,
            --widget = wibox.container.tile,
        --},
    --})
--end)
-- }}}
