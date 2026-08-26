-- Workspace bindings

local variables = require("config.variables")
local main_mod = variables.main_mod

-- Super + 1-9 switches to workspaces 1-9
-- Super + 0 switches to workspace 10
for workspace = 1, 10 do
    local key = workspace % 10

    -- Switch workspace
    hl.bind(
        main_mod .. " + " .. key,
        hl.dsp.focus({
            workspace = workspace,
        })
    )

    -- Move focused window to workspace
    hl.bind(
        main_mod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = workspace,
        })
    )
end

-- Scroll through existing workspaces
hl.bind(
    main_mod .. " + mouse_up",
    hl.dsp.focus({
        workspace = "e-1",
    })
)

hl.bind(
    main_mod .. " + mouse_down",
    hl.dsp.focus({
        workspace = "e+1",
    })
)
