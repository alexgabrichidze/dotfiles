-- Environment variables inherited by Hyprland and applications launched from it

-- Cursor size for XCursor and Hyprcursor
-- No explicit theme: use system default, currently Adwaita
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Identify this session as Hyprland running on Wayland
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Disable Qt client-side window decorations
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
