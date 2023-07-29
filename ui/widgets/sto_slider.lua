local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

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
    bar_height = 6,
    bar_color = beautiful.bg_focus,
    bar_active_color = beautiful.red,
    handle_width = 0,
    value = get_disk(),
    widget = wibox.widget.slider,
})

local sto_slider = wibox.widget({
    {
        markup = helpers.colorize_text("󱂵  ", beautiful.red),
        font = beautiful.icon_font2 .. " 14",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox(),
    },
    slider,
    layout = wibox.layout.fixed.horizontal,
    spacing = 0,
})

return sto_slider
