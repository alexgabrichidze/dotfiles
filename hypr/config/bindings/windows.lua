-- Window management bindings

local variables = require("config.variables")
local main_mod = variables.main_mod

local directions = {
    H = "left",
    J = "down",
    K = "up",
    L = "right",
}

-- Vim-style focus, move, and swap bindings
for key, direction in pairs(directions) do
    -- Focus neighboring window
    hl.bind(
        main_mod .. " + " .. key,
        hl.dsp.focus({
            direction = direction,
        })
    )

    -- Move focused window
    hl.bind(
        main_mod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            direction = direction,
        })
    )

    -- Swap focused window with its neighbor
    hl.bind(
        main_mod .. " + CTRL + " .. key,
        hl.dsp.window.swap({
            direction = direction,
        })
    )
end

-- Toggle floating
hl.bind(
    main_mod .. " + Space",
    hl.dsp.window.float({
        action = "toggle",
    })
)

-- Close focused window
hl.bind(
    main_mod .. " + Q",
    hl.dsp.window.close()
)

-- Toggle fullscreen
hl.bind(
    main_mod .. " + F",
    hl.dsp.window.fullscreen()
)

-- Cycle windows
hl.bind(
    main_mod .. " + Tab",
    hl.dsp.window.cycle_next()
)

hl.bind(
    main_mod .. " + SHIFT + Tab",
    hl.dsp.window.cycle_next({
        next = false,
    })
)

-- Move or resize any window with modifier + mouse drag
hl.bind(
    main_mod .. " + mouse:272",
    hl.dsp.window.drag(),
    {
        mouse = true,
    }
)

hl.bind(
    main_mod .. " + mouse:273",
    hl.dsp.window.resize(),
    {
        mouse = true,
    }
)

-- Change the number of master windows
hl.bind(
    main_mod .. " + COMMA",
    hl.dsp.layout("addmaster")
)

hl.bind(
    main_mod .. " + PERIOD",
    hl.dsp.layout("removemaster")
)

-- Layout switching remains disabled; this setup always uses master

-- Reload Hyprland configuration manually
hl.bind(
    main_mod .. " + R",
    hl.dsp.exec_cmd("hyprctl reload")
)
