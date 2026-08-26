-- Keyboard, pointer, and touchpad input

hl.config({
    input = {
        -- US and Russian layouts; Caps Lock switches between them
        kb_layout = "us,ru",
        kb_options = "grp:caps_toggle",

        -- Faster keyboard repeat
        repeat_rate = 50,
        repeat_delay = 300,

        -- Pointer movement: increased sensitivity without acceleration
        sensitivity = 0.5,
        accel_profile = "flat",

        touchpad = {
            -- Physical clicks use 1/2/3 fingers for left/right/middle click
            clickfinger_behavior = true,
        },
    },
})
