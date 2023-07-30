-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")
-- Widget and layout library
local wibox = require("wibox")
-- Xresources DPI
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- helper functions
local helpers = require("helpers")

-- {{{ Wibar

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Text Clock
local time = wibox.widget({
    widget = wibox.container.background,
    bg = beautiful.bg_normal,
    buttons = {
        awful.button({}, 1, function()
            require("ui.popup.calender")()
        end),
    },
    {
        widget = wibox.container.margin,
        margins = 10,
        {
            widget = wibox.widget.textclock("%l:%M %p"),
            font = beautiful.font_name .. " Bold 11",
            align = "center",
        },
    },
})

helpers.add_hover_cursor(time, "hand1")

local action_icon = require("ui.gooey").make_button({
    icon = "bell2",
    width = 34,
    margins = 6.9,
    hover = true,
    exec = function()
        F.action.toggle()
    end,
})

-- Battery
battery = require("config.battery")

battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")
battery_closure = battery.closure()

function battery_update()
    battery_widget:set_text(" " .. battery_closure() .. " ")
end

battery_update()
battery_timer = timer({ timeout = 10 })
battery_timer:connect_signal("timeout", battery_update)
battery_timer:start()
--

helpers.add_hover_cursor(action_icon, "hand1")

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ " ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", " ﭮ ", "  " }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        }
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        }
    }

    local new_shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, beautiful.border_radius)
    end

    --{{{ Remove wibox on full screen
    local function remove_wibox(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibox.visible = false
            c.screen.mywibox2.visible = false
            c.screen.mywibox4.visible = false
        else
            c.screen.mywibox.visible = true
            c.screen.mywibox2.visible = true
            c.screen.mywibox4.visible = true
        end
    end

    client.connect_signal("property::fullscreen", remove_wibox)
    ---}}}
    -- Create rounded rectangle shape (in one line)
    local function rrect(radius)
        return function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, radius)
        end
    end

    local wibar_border_radius = 20

    -- Create the wibox
    -- Left wibox
    s.mywibox = awful.wibar {
        type = "dock",
        ontop = true,
        stretch = false,
        margins = {top = dpi(4)},
        visible = true,
        height = dpi(38),
        width    = dpi(110),
        shape = rrect(wibar_border_radius),
        screen   = s,
    }

    -- Middle wibox
    s.mywibox2 = awful.wibar {
        type = "dock",
        ontop = true,
        stretch = false,
        margins = {top = dpi(4)},
        top = dpi(4),
        visible = true,
        height = dpi(38),
        width    = dpi(462),
        --width = s.geometry.width - dpi(30),
        shape = rrect(wibar_border_radius),
        screen = s,
    }

    --s.mywibox3 = awful.wibar {
        --type = "dock",
        --ontop = true,
        --stretch = false,
        --margins = dpi(4),
        --visible = true,
        --height = dpi(38),
        --width    = 80,
        --shape = rrect(0),
        --screen   = s,
    --}

    -- Right wibox
    s.mywibox4 = awful.wibar {
        type = "dock",
        ontop = true,
        stretch = false,
        margins = {top = dpi(4)},
        top = dpi(4),
        visible = true,
        height = dpi(38),
        width    = dpi(265),
        shape = rrect(wibar_border_radius),
        screen = s,
    }

    s.mywibox.x = s.geometry.x + dpi(15)
    s.mywibox4.x = s.geometry.x + s.geometry.width - s.mywibox4.width - dpi(15)

    s.mywibox:setup({
        {
            {
                layout = wibox.layout.align.horizontal,
                time,
            },
            left = dpi(15),
            right = dpi(15),
            widget = wibox.container.margin,
        },
        shape = rrect(beautiful.border_radius),
        widget = wibox.container.background,
    })

    s.mywibox2:setup({
        {
            {
                layout = wibox.layout.align.horizontal,
                { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                    {
                        s.mytaglist,
                        margins = dpi(2),
                        widget = wibox.container.margin,
                    },
                },
            },
            left = dpi(15),
            right = dpi(15),
            widget = wibox.container.margin,
        },
        shape = rrect(beautiful.border_radius),
        widget = wibox.container.background,
    })

    s.mywibox4:setup({
        {
            {
                layout = wibox.layout.align.horizontal,
                { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                mytextclock,
                battery_widget,
                action_icon,
                },
            },
            left = dpi(15),
            right = dpi(15),
            widget = wibox.container.margin,
        },
        shape = rrect(beautiful.border_radius),
        widget = wibox.container.background,
    })

end)

-- }}}
