local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local which_disk = "/dev/nvme0n1p5"

local function get_disk()
    local script = [[ df -kH -B 1MB ]]..which_disk..[[ | tail -1 | awk '{printf $5}' ]]
    local handle = io.popen(script)
    local result = handle:read("*a")
    handle:close()

    return tonumber(result:match("%d+"))
end

local slider = wibox.widget({
    bar_shape = require("helpers").rrect(9),
    shape = require("helpers").rrect(9),
    background_color = beautiful.bg_focus,
    color = beautiful.red,
    value = get_disk(),
    margins = { top = dpi(10), bottom = dpi(10) },
    forced_width = dpi(400),
    forced_height = dpi(6),
    max_value = 100,
    widget = wibox.widget.progressbar,
})

local sto_slider = wibox.widget({
    {
        markup = helpers.colorize_text("󱂵  ", beautiful.red),
        font = beautiful.icon_font2 .. " 14",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox(),
    },
    {
        slider,
        {
            markup  = helpers.colorize_text(get_disk() .. "%", beautiful.fg_minimize),
            widget = wibox.widget.textbox,
            align = "center",
            font = beautiful.font_name .. " Bold 10",
        },
        layout = wibox.layout.stack,
    },
    layout = wibox.layout.fixed.horizontal,
    spacing = 0,
})

return sto_slider
