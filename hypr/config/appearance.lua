-- Window and desktop appearance

hl.config({
    general = {
        -- Explicitly keep thin borders
        border_size = 1,

        col = {
            active_border = "rgba(213,214,212,0.9)",
            inactive_border = "rgba(213,214,212,0.5)",
        },
    },

    decoration = {
        shadow = {
            enabled = true,

            -- Smaller and sharper shadow than Hyprland defaults
            range = 1,
            render_power = 4,
            color = "rgba(0,0,0,0.5)",
        },

        -- Square, fully opaque windows
        rounding = 0,
        active_opacity = 1,
        inactive_opacity = 1,
    },

    -- Hyprpaper provides the background, so hide Hyprland's own
    -- wallpaper/logo/splash elements
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },

    -- Disable Hyprland donation popups
    ecosystem = {
        no_donation_nag = true,
    },
})
