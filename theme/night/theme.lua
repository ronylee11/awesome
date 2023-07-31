local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local recolor_image = require("gears.color").recolor_image

local theme = {}

theme.confdir = os.getenv("HOME") .. "/.config/awesome/theme/night"
theme.wallpaper = theme.confdir .. "/wall/fabrizio-conti-_6LZtmrss08-unsplash.jpg"
theme.font_name = "Wavy"
theme.taglist_font = "FiraCode Nerd Font, 14"
theme.background = "#1a1b26"
theme.foreground = "#c0caf5"
theme.black = "#1C252C"
theme.red = "#f7768e"
theme.green = "#9ece6a"
theme.yellow = "#e0af68"
theme.blue = "#7aa2f7"
theme.magenta = "#BC83E3"
theme.cyan = "#67AFC1"
theme.white = "#D9D7D6"
theme.blacks = "#484E5B"
theme.reds = "#F16269"
theme.greens = "#8CD7AA"
theme.yellows = "#E9967E"
theme.blues = "#79AAEB"
theme.magentas = "#C488EC"
theme.cyans = "#7ACFE4"
theme.whites = "#E5E5E5"
theme.darker_bg = "#0A1419"
theme.lighter_bg = "#162026"
theme.transparent = "#00000000"

theme.font = "Wavy, Bold 11"
theme.font_name = "Wavy"
theme.icon_font = "Iosevka Nerd Font"
theme.icon_font2 = "Iosevka Nerd Font"

theme.bg = "#17171C"
theme.bg_normal   = "#061115"
theme.bg_subtle   = "#0a171c"
theme.bg_focus    = "#1C252C"
theme.bg_cal      = "#78B892"
theme.bg_urgent   = "#DF5B61"
theme.bg_minimize = "#484e5b"
theme.bg_systray = theme.bg_normal

theme.fg = "#f2f2e9"
theme.fg_normal   = "#D9D7D6"
theme.fg_focus    = "#D9D7D6"
theme.fg_urgent   = "#D9D7D6"
theme.fg_minimize = "#D9D7D6"

theme.useless_gap         = dpi(6)
theme.border_width        = dpi(0)
theme.border_color_normal = "#505050"
theme.border_color_active = "#00CED1"
theme.border_color_marked = "#91231c"

theme.titlebar_bg_focus = theme.bg_subtle
theme.titlebar_bg_normal = theme.bg_normal

theme.taglist_fg_focus = "#8cedff"
theme.taglist_fg_occupied = "#e4ad7b"
theme.taglist_bg_focus = "#061115"

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
    rnotification.append_rule({
        rule = { urgency = "critical" },
        properties = { bg = "#ff0000", fg = "#ffffff" },
    })
end)

--menu
theme.menu_height               = dpi(6) * 4
theme.menu_width                = dpi(6) * 10 * 3
theme.menu_border_width         = dpi(2)
theme.menu_border_color         = theme.bg_focus

-- power
theme.lock_icon         = recolor_image(theme.confdir .. "/power/lock.svg",            theme.fg_normal)
theme.logout_icon       = recolor_image(theme.confdir .. "/power/logout.svg",          theme.fg_normal)
theme.sleep_icon        = recolor_image(theme.confdir .. "/power/sleep.svg",           theme.fg_normal)
theme.restart_icon      = recolor_image(theme.confdir .. "/power/restart.svg",         theme.fg_normal)
theme.shutdown_icon     = recolor_image(theme.confdir .. "/power/shutdown.svg",        theme.fg_normal)

-- tag
theme.terminal_icon     = recolor_image(theme.confdir .. "/tag/terminal.svg",         theme.fg_normal)
theme.code_icon         = recolor_image(theme.confdir .. "/tag/code.svg",             theme.fg_normal)
theme.chrome_icon       = recolor_image(theme.confdir .. "/tag/chrome.svg",           theme.fg_normal)
theme.files_icon        = recolor_image(theme.confdir .. "/tag/files.svg",            theme.fg_normal)
theme.document_icon     = recolor_image(theme.confdir .. "/tag/document.svg",         theme.fg_normal)
theme.media_icon        = recolor_image(theme.confdir .. "/tag/media.svg",            theme.fg_normal)
theme.tools_icon        = recolor_image(theme.confdir .. "/tag/tools.svg",            theme.fg_normal)
theme.chat_icon         = recolor_image(theme.confdir .. "/tag/chat.svg",             theme.fg_normal)
theme.game_icon         = recolor_image(theme.confdir .. "/tag/game.svg",             theme.fg_normal)
theme.general_icon      = recolor_image(theme.confdir .. "/tag/general.svg",          theme.fg_normal)

-- player
theme.previous_icon     = recolor_image(theme.confdir .. "/player/previous.svg",       theme.fg_normal)
theme.play_icon         = recolor_image(theme.confdir .. "/player/play.svg",           theme.fg_normal)
theme.stop_icon         = recolor_image(theme.confdir .. "/player/stop.svg",           theme.fg_normal)
theme.pause_icon        = recolor_image(theme.confdir .. "/player/pause.svg",          theme.fg_normal)
theme.next_icon         = recolor_image(theme.confdir .. "/player/next.svg",           theme.fg_normal)

-- arrow
theme.arrow_down_icon   = recolor_image(theme.confdir .. "/other/arrow_down.svg",      theme.fg_normal)
theme.arrow_up_icon     = recolor_image(theme.confdir .. "/other/arrow_up.svg",        theme.fg_normal)
theme.arrow_right_icon  = recolor_image(theme.confdir .. "/other/arrow_right.svg",     theme.fg_normal)
theme.arrow_left_icon   = recolor_image(theme.confdir .. "/other/arrow_left.svg",      theme.fg_normal)

-- other icon
theme.menu_submenu_icon = recolor_image(theme.confdir .. "/other/submenu.svg",         theme.fg_normal)
theme.notification_icon = recolor_image(theme.confdir .. "/other/notification.svg",    theme.fg_normal)
theme.setting_icon      = recolor_image(theme.confdir .. "/other/setting.svg",         theme.fg_normal)
theme.refresh_icon      = recolor_image(theme.confdir .. "/other/refresh.svg",         theme.fg_normal)
theme.book_icon         = recolor_image(theme.confdir .. "/other/book.svg",            theme.fg_normal)
theme.keyboard_icon     = recolor_image(theme.confdir .. "/other/keyboard.svg",        theme.fg_normal)
theme.awesome_icon      = recolor_image(theme.confdir .. "/other/awesomewm.svg",       theme.bg_normal)
theme.os_icon           = recolor_image(theme.confdir .. "/other/archlinux.svg",       theme.fg_normal)
theme.dashboard_icon    = recolor_image(theme.confdir .. "/other/dashboard.svg",       theme.fg_normal)
theme.menu_icon         = recolor_image(theme.confdir .. "/other/menu.svg",            theme.fg_normal)
theme.bin_icon          = recolor_image(theme.confdir .. "/other/bin.svg",             theme.fg_normal)
theme.image_icon        = recolor_image(theme.confdir .. "/other/image.svg",           theme.green)
theme.camera_icon       = recolor_image(theme.confdir .. "/other/camera.svg",          theme.blue)

theme.download_icon     = recolor_image(theme.confdir .. "/other/download.svg",        theme.white)
theme.upload_icon       = recolor_image(theme.confdir .. "/other/upload.svg",          theme.white)
theme.hard_drive_icon   = recolor_image(theme.confdir .. "/other/hard_drive.svg",      theme.blue)
theme.temperature_icon  = recolor_image(theme.confdir .. "/other/temperature.svg",     theme.magenta)
theme.gpu_icon          = recolor_image(theme.confdir .. "/other/gpu.svg",             theme.green)
theme.memory_icon       = recolor_image(theme.confdir .. "/other/memory.svg",          theme.cyan)
theme.cpu_icon          = recolor_image(theme.confdir .. "/other/cpu.svg",             theme.magenta)
theme.clock_icon        = recolor_image(theme.confdir .. "/other/clock.svg",           theme.green)
theme.volume_icon       = recolor_image(theme.confdir .. "/other/volume.svg",          theme.blue)
theme.volume_mute_icon  = recolor_image(theme.confdir .. "/other/volume_mute.svg",     theme.fg_normal)
theme.mic_icon          = recolor_image(theme.confdir .. "/other/mic.svg",             theme.cyan)
theme.mic_off_icon      = recolor_image(theme.confdir .. "/other/mic_off.svg",         theme.fg_normal)

theme.add_icon          = recolor_image(theme.confdir .. "/other/add.svg",             theme.fg_normal)
theme.subtract_icon     = recolor_image(theme.confdir .. "/other/subtract.svg",        theme.fg_normal)

-- color icon
theme.package_icon      = theme.confdir .. "/other/package.svg"

-- tag preview
theme.tag_preview_widget_border_radius = 10        -- Border radius of the widget (With AA)
theme.tag_preview_client_border_radius = 10        -- Border radius of each client in the widget (With AA)
theme.tag_preview_client_opacity = 0.8            -- Opacity of each client
theme.tag_preview_client_bg = theme.background           -- The bg color of each client
theme.tag_preview_client_border_color = theme.border_color_normal -- The border color of each client
theme.tag_preview_client_border_width = 1         -- The border width of each client
theme.tag_preview_widget_bg = theme.background           -- The bg color of the widget
theme.tag_preview_widget_border_color = theme.border_color_normal -- The border color of the widget
theme.tag_preview_widget_border_width = 1         -- The border width of the widget
theme.tag_preview_widget_margin = 0               -- The margin of the widget

return theme
