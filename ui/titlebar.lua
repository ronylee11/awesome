-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")

-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = {
        awful.button({ }, 1, function()
            c:activate { context = "titlebar", action = "mouse_move"  }
        end),
        awful.button({ }, 3, function()
            c:activate { context = "titlebar", action = "mouse_resize"}
        end),
    }

    awful.titlebar(c, { size = 0, position = "left" }).widget = {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            {
                { -- Title
                    halign = "center",
                    valign = "center",
                    font = "Wavy 20",
                    widget = awful.titlebar.widget.titlewidget(c)
                },
                direction = 'east',
                widget = wibox.container.rotate,
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

client.connect_signal("manage", function(c)
    -- Bling
    c.shape = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, 0)
    end

    -- Similar behavior as other window managers DWM, XMonad.
    -- Master-Slave layout new client goes to the slave, master is kept
    -- If you need new slave as master press: ctrl + super + return
    if not awesome.startup then awful.client.setslave(c) end
end)
-- }}}
