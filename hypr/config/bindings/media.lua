-- Audio, microphone, and brightness bindings

local variables = require("config.variables")
local main_mod = variables.main_mod

-- Toggle output mute
hl.bind(
    main_mod .. " + F1",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    )
)

-- Output volume
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
    ),
    {
        repeating = true,
    }
)

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
    ),
    {
        repeating = true,
    }
)

-- Microphone volume
hl.bind(
    main_mod .. " + minus",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%-"
    ),
    {
        repeating = true,
    }
)

hl.bind(
    main_mod .. " + equal",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%+"
    ),
    {
        repeating = true,
    }
)

-- Toggle microphone mute
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    )
)

-- ASUS keyboard backlight
hl.bind(
    main_mod .. " + F2",
    hl.dsp.exec_cmd(
        "brightnessctl -d asus::kbd_backlight set 1-"
    ),
    {
        repeating = true,
    }
)

hl.bind(
    main_mod .. " + F3",
    hl.dsp.exec_cmd(
        "brightnessctl -d asus::kbd_backlight set +1"
    ),
    {
        repeating = true,
    }
)

-- Display brightness
hl.bind(
    main_mod .. " + F7",
    hl.dsp.exec_cmd(
        "brightnessctl set 10%-"
    ),
    {
        repeating = true,
    }
)

hl.bind(
    main_mod .. " + F8",
    hl.dsp.exec_cmd(
        "brightnessctl set +10%"
    ),
    {
        repeating = true,
    }
)
