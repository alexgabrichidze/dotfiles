# dotfiles

Personal Arch Linux configs for Hyprland

Some paths and hardware settings are specific to my system

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=flat&logo=archlinux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-58E1FF?style=flat&logo=hyprland&logoColor=111111)](https://hyprland.org/)
[![Wayland](https://img.shields.io/badge/Wayland-FFBC00?style=flat&logo=linux&logoColor=111111)](https://wayland.freedesktop.org/)
[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=flat&logo=neovim&logoColor=white)](https://neovim.io/)
[![Yazi](https://img.shields.io/badge/Yazi-111111?style=flat&logo=files&logoColor=white)](https://yazi-rs.github.io/)

## Screenshots

![Hyprland desktop](assets/desktop.webp)

![Rofi launcher](assets/rofi.webp)

![Neovim](assets/neovim.webp)

## Configs

- `hypr/` — modular Hyprland config using the Lua API added in version 0.55
- `waybar/` — status bar
- `nvim/` — Neovim config using lazy.nvim
- `rofi/` — application launcher
- `alacritty/` — terminal config
- `mako/` — notification daemon
- `yazi/` — terminal file manager

## Keybindings

| Binding | Action |
|---|---|
| `Super + Return` | Open Alacritty |
| `Super + D` | Open Rofi |
| `Super + E` | Open Yazi |
| `Super + B` | Open Firefox |
| `Super + H/J/K/L` | Focus windows |
| `Super + Shift + H/J/K/L` | Move windows |
| `Super + Ctrl + H/J/K/L` | Swap windows |
| `Super + 1–0` | Switch workspace |
| `Super + Shift + 1–0` | Move window to workspace |
| `Super + Q` | Close window |
| `Super + F` | Toggle fullscreen |
| `Super + Space` | Toggle floating |
| `Print` | Select and edit screenshot |

## Machine-specific settings

Values likely to need changes

- `hypr/config/monitors.lua` — monitor descriptor, resolution, refresh rate, and scale
- `hypr/config/variables.lua` — default applications
- `hypr/config/input.lua` — keyboard layouts and pointer settings
- `hypr/config/bindings/media.lua` — ASUS keyboard backlight device
- `hypr/config/windows.lua` — application workspace rules
- `hypr/hyprpaper.conf` — wallpaper path
- `waybar/config` — script path, network interface, and thermal zone
- `waybar/scripts/g502-battery` — Logitech mouse model
