local config = {}

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
    -- other
    show_album = "gthumb ".. os.getenv("HOME") .. "/Pictures",
}

return config
