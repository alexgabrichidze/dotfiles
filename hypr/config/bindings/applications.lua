-- Application launch bindings

local variables = require("config.variables")
local main_mod = variables.main_mod
local apps = variables.apps

-- Terminal
hl.bind(
    main_mod .. " + Return",
    hl.dsp.exec_cmd(apps.terminal)
)

-- Application launcher
hl.bind(
    main_mod .. " + D",
    hl.dsp.exec_cmd(apps.menu)
)

-- File manager
hl.bind(
    main_mod .. " + E",
    hl.dsp.exec_cmd(apps.file_manager)
)

-- Browser
hl.bind(
    main_mod .. " + B",
    hl.dsp.exec_cmd(apps.browser)
)

-- Process viewer
hl.bind(
    main_mod .. " + Escape",
    hl.dsp.exec_cmd(apps.task_manager)
)

-- Sound mixer
hl.bind(
    main_mod .. " + M",
    hl.dsp.exec_cmd(apps.sound_mixer)
)

-- Select a region, capture it, then edit it in Swappy
hl.bind(
    "Print",
    hl.dsp.exec_cmd([[grim -g "$(slurp)" - | swappy -f -]])
)
