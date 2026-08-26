-- Permissions for sensitive compositor capabilities
-- Changes require a full Hyprland restart; reload is not enough

hl.config({
    ecosystem = {
        enforce_permissions = true,
    },
})

-- Grim powers the configured screenshot workflow, so allow direct capture
-- without prompting every time
hl.permission({
    binary = "/usr/bin/grim",
    type = "screencopy",
    mode = "allow",
})

-- Screen sharing through the desktop portal already asks which monitor or
-- window may be shared
hl.permission({
    binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",
    type = "screencopy",
    mode = "allow",
})

-- Disable all runtime plugin loading. Remove or narrow this rule before using
-- hyprpm plugins; permission changes require a full Hyprland restart
hl.permission({
    binary = ".*",
    type = "plugin",
    mode = "deny",
})
