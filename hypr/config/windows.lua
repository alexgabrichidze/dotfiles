-- Workspace organization and application-specific window behavior

-- Development
hl.window_rule({
    match = { class = "^Alacritty$" },
    workspace = "1",
})

-- Browsing
hl.window_rule({
    match = { class = "^firefox$" },
    workspace = "2",
    focus_on_activate = true,
})

-- Chat
hl.window_rule({
    match = { class = "^org\\.telegram\\.desktop$" },
    workspace = "3",
})

-- Screenshot editor opens as a centered floating window
hl.window_rule({
    match = { class = "^swappy$" },
    float = true,
    center = true,
})

-- Keep the application launcher focused while visible
hl.window_rule({
    match = { class = "^Rofi$" },
    stay_focused = true,
})
