local config = {}
local gears = require("gears")

config.apps = {
    terminal = "alacritty",
    editor = "alacritty" .. " -e " .. "nvim",
    browser = "firefox",
    music = "spotify",
    launcher = "launcher",
    run = "run",
    powermenu = "powermenu",
}

config.actions = {
    -- Power
    shutdown = "shutdown --now",
    restart = "reboot",
    sleep = "systemctl hibernate",
    logout = "awesome-client 'awesome.quit()'", 
    lock = "slock",
    -- screenshot
    screenshot = "scrot --multidisp --exec 'mv $f ".. os.getenv("HOME") .. "/Pictures/Screenshots/ && xdg-open ".. os.getenv("HOME") .. "/Pictures/Screenshots/$f'",
    screenshot_area = "scrot --select --freeze --exec 'mv $f ".. os.getenv("HOME") .. "/Pictures/Screenshots/ && xdg-open ".. os.getenv("HOME") .. "/Pictures/Screenshots/$f'",
    screenshot_window = "scrot --focused --border --exec 'mv $f ".. os.getenv("HOME") .. "/Pictures/Screenshots/ && xdg-open ".. os.getenv("HOME") .. "/Pictures/Screenshots/$f'",
    screenshot_delay = "scrot --delay 5 --exec 'mv $f ".. os.getenv("HOME") .. "/Pictures/Screenshots/ && xdg-open ".. os.getenv("HOME") .. "/Pictures/Screenshots/$f'",
    -- other
    show_album = "sxiv -t ".. os.getenv("HOME") .. "/Pictures",
    --show_album = "alacritty",
}

return config
