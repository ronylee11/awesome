-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Declarative object management
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Import library
local volume = require "lib.volume"
local brightness = require "lib.brightness"
local naughty = require("naughty")
local mousemenu = require("ui.popup.mousemenu")
local calender = require("ui.popup.calender")
local helpers = require("helpers")

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
    awful.button({ }, 3, function () mousemenu:toggle() end),
    --awful.button({ }, 4, awful.tag.viewprev),
    --awful.button({ }, 5, awful.tag.viewnext),
})
-- }}}

-- {{{ Key bindings
-- General Awesome keys
awful.keyboard.append_global_keybindings({
    -- Defaults
    awful.key({ modkey }, "s", hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey }, "w", function () mousemenu:toggle() end,
              {description = "show main menu", group = "awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    -- Terminal
    awful.key({ modkey, "Shift" }, "Return", function() awful.spawn(terminal) end, 
              { description = "open a terminal", group = "launcher" }),
    -- Launchers
    awful.key({ modkey }, "p", function() awful.util.spawn_with_shell(gears.filesystem.get_configuration_dir() .. 'misc/rofi/launcher/launcher.sh') end,
              { description = "run prompt", group = "launcher" }),
    awful.key({ altkey }, "Return", function() awful.util.spawn("rofi -show drun") end,
              { description = "run prompt", group = "launcher" }),
    -- File Browser
    awful.key({ modkey }, "e", function() awful.util.spawn("Thunar") end, 
              { description = "run Thunar", group = "launcher" }),
    -- Audio
    awful.key({}, "XF86AudioRaiseVolume", function() volume.increase() end,
              { description = "increase volume", group = "control" }),
    awful.key({}, "XF86AudioLowerVolume", function() volume.decrease() end,
              { description = "decrease volume", group = "control" }),
    awful.key({}, "XF86AudioMute", function() volume.mute() end,
              { description = "mute volume", group = "control" }),
    awful.key({ modkey }, "Up", function() volume.increase() end,
              {description = "increase volume", group = "launcher"}),
    awful.key({ modkey }, "Down", function() volume.decrease() end,
              {description = "decrease volume", group = "launcher"}),
    awful.key({ modkey, "Ctrl" }, "v", function() awful.spawn("pavucontrol") end, 
              { description = " Audio Contol all ", group = "control" }),
    -- Brightness
	awful.key({}, "XF86MonBrightnessUp", function() brightness.increase() end,
              { description = "increase brightness", group = "control" }),
	awful.key({}, "XF86MonBrightnessDown", function() brightness.decrease() end,
              { description = "decrease brightness", group = "control" }),
    awful.key({ modkey }, "Left", function() brightness.decrease() end,
              {description = "decrease brightness", group = "control"}),
    awful.key({ modkey }, "Right", function() brightness.increase() end,
              {description = "increase brightness", group = "control"}),
    -- Screenshot
    awful.key({ modkey }, "Print", scrot_full,
              { description = "Take a screenshot of entire screen", group = "screenshot" }),
    awful.key({}, "Print", scrot_selection,
              { description = "Take a screenshot of selection", group = "screenshot" }),
    awful.key({ "Shift" }, "Print", scrot_window,
              { description = "Take a screenshot of focused window", group = "screenshot" }),
    awful.key({ "Ctrl" }, "Print", scrot_delay,
              { description = "Take a screenshot of delay", group = "screenshot" }),
    awful.key({ modkey, "Shift" }, "s", function() awful.util.spawn_with_shell("scrot -e 'xclip -selection clipboard -t image/png -i $f' -s $HOME/Pictures/Screenshots/%d-%m-%Y-%T-screenshot.jpg -f") end,
              {description = "take a screenshot", group = "launcher"}),
    -- Powermenu
    awful.key({}, "XF86PowerOff", function() awful.util.spawn_with_shell(gears.filesystem.get_configuration_dir() .. "misc/rofi/powermenu/powermenu.sh") end,
              {description = "powermenu", group = "launcher"}),
    -- Select Emoji
    awful.key({ modkey }, ".", function() awful.util.spawn_with_shell("rofi -modi emoji -show emoji") end,
              {description = "emoji", group = "launcher"}),
    -- Show Timetable
    awful.key({ altkey }, "t", function() awful.util.spawn_with_shell("feh --zoom 110 -F $HOME/timetable.jpg") end,
              {description = "timetable", group = "launcher"}),
    -- Powermenu
    awful.key({ "Ctrl", "Shift" }, "l", function() awful.util.spawn_with_shell(gears.filesystem.get_configuration_dir() .. "misc/rofi/powermenu/powermenu.sh") end,
              {description = "powermenu", group = "launcher"}),
    -- Kill
    awful.key({ altkey, "Ctrl" }, "x", function() awful.util.spawn("xkill") end,
              {description = "powermenu", group = "launcher"}),
    -- Summon Train -- F13
    awful.key({}, "XF86Tools", function() awful.util.spawn("alacritty -e \"sl\"") end,
              {description = "train", group = "launcher"}),
    -- Spawn widget
    awful.key({ altkey }, "c", function() F.action.toggle() end, 
              {description = "spawn action", group = "launcher"}),
    awful.key({ altkey }, "q", function() F.calender.toggle() end, 
              {description = "spawn calender", group = "launcher"}),
    -- Test Notification
    awful.key({ altkey, "Shift" }, "x", function() naughty.notify({ app_name = "Master Ouch", title = "Achtung!", text = helpers.filter_ampersand("You're idling You're idling & You're idling You're idling You're idling You're idling You're idling You're idling"), icon = gears.filesystem.get_configuration_dir() .. "/misc/yawn.png", timeout = 3 }) end, 
              {description = "spawn widget", group = "launcher"}),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    -- Switch to the previous tag
    awful.key({ altkey }, "Left", awful.tag.viewprev,
              { description = "view previous", group = "tag" }),
    -- Switch to the next tag
    awful.key({ altkey }, "Right", awful.tag.viewnext,
              { description = "view next", group = "tag" }),
    -- Go back to the tag
    awful.key({ modkey }, "Tab", awful.tag.history.restore,
              { description = "go back", group = "tag" }),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    -- Window Focus
    awful.key({ modkey }, "j", function() awful.client.focus.byidx(-1) end, 
              { description = "focus next by index", group = "client" }),
    awful.key({ modkey }, "k", function() awful.client.focus.byidx(1) end, 
              { description = "focus previous by index", group = "client" }),
    awful.key({ altkey }, "Tab", 
              function() 
                  awful.client.focus.history.previous()
                  if client.focus then
                      client.focus:raise()
                  end
              end,
              { description = "go back", group = "client" }),
    -- Screen Focus
    awful.key({ altkey }, "h", function() awful.screen.focus_relative(1) end, 
              { description = "focus the next screen", group = "screen" }),
    awful.key({ altkey }, "l", function() awful.screen.focus_relative(-1) end, 
              { description = "focus the previous screen", group = "screen" }),
    -- Restore Minimized Window
    awful.key({ modkey, "Control" }, "n", 
              function()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      c:activate { raise = true, context = "key.unminimize" }
                  end
              end,
              {description = "restore minimized", group = "client"}),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    -- Swap Window
    awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(-1) end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(1) end,
              {description = "swap with previous client by index", group = "client"}),
    -- Jump to urgent client
    awful.key({ modkey }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    -- Change Master Window Width
    awful.key({ modkey }, "l", function() awful.tag.incmwfact(0.05) end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey }, "h", function() awful.tag.incmwfact(-0.05) end,
              {description = "decrease master width factor", group = "layout"}),
    -- Change Number of Master Windows
    awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    -- Change Number of Columns
    awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(1, nil, true) end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(-1, nil, true) end,
              {description = "decrease the number of columns", group = "layout"}),
    -- Change Layout
    awful.key({ modkey }, "space", 
              function() 
                  awful.layout.inc(1) 
                  awful.screen.focused().mywibox.visible = true
                  awful.screen.focused().mywibar.visible = true
                  awful.screen.focused().mywibar2.visible = true
                  awful.screen.focused().mywibar3.visible = true
              end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift" }, "space", 
              function() 
                  awful.layout.inc(-1) 
                  awful.screen.focused().mywibox.visible = true
                  awful.screen.focused().mywibar.visible = true
                  awful.screen.focused().mywibar2.visible = true
                  awful.screen.focused().mywibar3.visible = true
             end,
              {description = "select previous", group = "layout"}),
})

-- Bind all 1~5, F1~F5 to tags.
for i = 1, 5 do
    awful.keyboard.append_global_keybindings({
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        awful.key({ modkey }, "F" .. i,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i + 5]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        awful.key({ modkey, "Control" }, "F" .. i,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i + 5]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        awful.key({ modkey, "Shift" }, "F" .. i,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i + 5]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"}),
        awful.key({ modkey, "Control", "Shift" }, "F" .. i,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i + 5]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
  })
end

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        -- Mouse Clicks
        awful.button({ }, 1, function (c) c:activate { context = "mouse_click" } end,
                  { description = "mouse click", group = "client" }),
        awful.button({ modkey }, 1, function (c) c:activate { context = "mouse_click", action = "mouse_move"  } end,
                  { description = "mouse move", group = "client" }),
        awful.button({ modkey }, 3, function (c) c:activate { context = "mouse_click", action = "mouse_resize"} end,
                  { description = "mouse resize", group = "client" }),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        -- Full Screen
        awful.key({ modkey }, "f",
                  function (c)
                      c.fullscreen = not c.fullscreen
                      c:raise()
                  end,
                  {description = "toggle fullscreen", group = "client"}),
        -- Hide Top Bar
        awful.key({ modkey }, "b", function(c) F.bar.toggle(c) end,
                  { description = "toggle top bar", group = "client" }),
        -- Close Window
        awful.key({ modkey, "Shift"   }, "c", function (c) c:kill() end,
                  {description = "close", group = "client"}),
        -- Floating Window
        awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
                  {description = "toggle floating", group = "client"}),
        -- Move Window to Master
        awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
                  {description = "move to master", group = "client"}),
        -- Move to Screen
        awful.key({ modkey }, "o", function (c) c:move_to_screen() end,
                  {description = "move to screen", group = "client"}),
        -- Keep on Top
        awful.key({ modkey }, "t", function (c) c.ontop = not c.ontop end,
                  {description = "toggle keep on top", group = "client"}),
        -- Minimize Window
        awful.key({ modkey }, "n", function(c) c.minimized = true end,
                  { description = "minimize", group = "client" }),
        -- Maximize Window
        awful.key({ modkey }, "m", 
                  function(c)
                      c.maximized = not c.maximized
                      c:raise()
                  end,
                  { description = "(un)maximize", group = "client" }),
        awful.key({ modkey, "Control" }, "m", 
                  function(c)
                      c.maximized_vertical = not c.maximized_vertical
                      c:raise()
                  end,
                  { description = "(un)maximize vertically", group = "client" }),
        awful.key({ modkey, "Shift" }, "m", 
                  function(c)
                      c.maximized_horizontal = not c.maximized_horizontal
                      c:raise()
                  end,
                  { description = "(un)maximize horizontally", group = "client" }),
        })
end)

-- }}}
