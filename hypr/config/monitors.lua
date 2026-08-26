-- Monitors configuration

-- Match built-in panel by its EDID description, which is more stable
-- than connector names that may change with GPU routing
hl.monitor({
    output = "desc:California Institute of Technology MNH301CA3-1",
    mode = "2560x1440@144",
    position = "0x0",
    scale = 1,
})

-- Fallback for monitors not matched by a more specific rule
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})
