-- Shared values used by other Hyprland configuration modules

return {
    -- Main modifier key
    main_mod = "SUPER",

    -- Default applications and launch commands
    apps = {
        terminal = "alacritty",
        browser = "firefox",
        file_manager = "alacritty -e yazi",
        menu = "rofi -show drun",
        task_manager = "alacritty -e btm",
        sound_mixer = "alacritty -e pulsemixer"
    }
}
