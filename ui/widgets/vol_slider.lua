local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local naughty = require("naughty")

local function get_volume()
    local script = "pamixer --get-volume"
    local handle = io.popen(script)
    local result = handle:read("*a")
    handle:close()

    return tonumber(result:match("%d+"))
end

-- check if muted or not
local function get_muted()
    local script = "pamixer --get-mute"
    local handle = io.popen(script)
    local result = handle:read("*a")
    handle:close()

    return result:match("true")
end

--markup will mute or unmute the volume on click
local markup = function()
    if get_muted() == "true" then
        return helpers.colorize_text("  ", beautiful.red)
    else
        return helpers.colorize_text("  ", beautiful.blue)
    end
end

local slider = wibox.widget({
    bar_shape = require("helpers").rrect(9),
    bar_height = 6,
    bar_color = beautiful.bg_focus,
    bar_active_color = beautiful.blue,
    handle_shape = gears.shape.circle,
    handle_color = beautiful.blue,
    handle_width = 12,
    value = get_volume(),
    widget = wibox.widget.slider,
})

helpers.add_hover_cursor(slider, "hand1")

local vol_slider = wibox.widget({
    {
        markup = markup(),
        widget = wibox.widget.textbox,
    },
    slider,
    layout = wibox.layout.fixed.horizontal,
    spacing = 0,
})

if get_muted() == "true" then
    vol_slider.children[1].markup = helpers.colorize_text("  ", beautiful.red)
    vol_slider.children[2].bar_active_color = beautiful.red
    vol_slider.children[2].handle_color = beautiful.red
end

awful.spawn.easy_async_with_shell("pamixer --get-volume", function(stdout)
    local value = string.gsub(stdout, "^%s*(.-)%s*$", "%1")
    vol_slider.value = tonumber(value)
end)

local function updateSlider()
    awful.spawn.easy_async_with_shell("pamixer --get-volume", function(stdout)
        local value = stdout
        vol_slider.children[2].value = tonumber(value)
    end)
    awful.spawn.easy_async_with_shell("pamixer --get-mute", function(stdout)
        local value = string.gsub(stdout, "^%s*(.-)%s*$", "%1")
        if value == "true" then
            vol_slider.children[1].markup = helpers.colorize_text("  ", beautiful.red)
            vol_slider.children[2].bar_active_color = beautiful.red
            vol_slider.children[2].handle_color = beautiful.red
        else
            vol_slider.children[1].markup = helpers.colorize_text("  ", beautiful.blue)
            vol_slider.children[2].bar_active_color = beautiful.blue
            vol_slider.children[2].handle_color = beautiful.blue
        end
    end)
end

local function toggleMute()
    awful.spawn("pamixer -t", false)
    updateSlider()
end

-- detect changes in volume, mute, unmute, then update the widget
awesome.connect_signal("volume::increase", updateSlider)
awesome.connect_signal("volume::decrease", updateSlider)
awesome.connect_signal("volume::mute", updateSlider)

vol_slider.children[1]:connect_signal("button::press", function(_, _, _, button)
    if button == 1 then
        toggleMute()
    end
end)

slider:connect_signal("property::value", function(_, new_value)
    vol_slider.value = new_value
    awful.spawn("pamixer --set-volume " .. new_value, false)
end)
return vol_slider
