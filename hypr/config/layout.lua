-- Window layout and tiling behavior

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        layout = "master",
    },

    -- Master is the default layout: one primary window with supporting
    -- windows arranged beside it
    master = {
        allow_small_split = true,
        mfact = 0.5,
    },

    misc = {
        -- 0 = ignore, 1 = take over fullscreen, 2 = unfullscreen
        on_focus_under_fullscreen = 1,
    },
})
