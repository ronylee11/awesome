local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local bling = require("lib.bling")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

bling.widget.tag_preview.enable {
    show_client_content = true,  -- Whether or not to show the client content
    --x = 10,                       -- The x-coord of the popup
    --y = 10,                       -- The y-coord of the popup
    scale = 0.35,                 -- The scale of the previews compared to the screen
    honor_padding = false,        -- Honor padding when creating widget size
    honor_workarea = false,       -- Honor work area when creating widget size
    placement_fn = function(c)    -- Place the widget using awful.placement (this overrides x & y)
        awful.placement.centered(c, {
            margins = {
                bottom = dpi(600),
            }
        })
    end,
    background_widget = wibox.widget {    -- Set a background image (like a wallpaper) for the widget 
        image = beautiful.wallpaper,
        horizontal_fit_policy = "fit",
        vertical_fit_policy   = "fit",
        widget = wibox.widget.imagebox
    }
}
