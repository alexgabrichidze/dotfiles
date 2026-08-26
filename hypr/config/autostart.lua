-- Applications and services started once with the Hyprland session

hl.on("hyprland.start", function()
    -- Desktop
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("mako")

    -- Clipboard history
    hl.exec_cmd("wl-paste --watch cliphist store")

    -- Polkit authentication agent, supervised by systemd
    hl.exec_cmd("systemctl --user start hyprpolkitagent.service")

    -- Initialize GNOME Keyring's Secret Service for applications such as Bitwarden
    hl.exec_cmd("sleep 2; gnome-keyring-daemon --start --components=secrets")
end)
