# dotfiles

Personal configuration files for Arch Linux with Hyprland.

These configs contain hardware- and machine-specific settings. Review monitor descriptors, device names, paths, and package names before using them.

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=flat&logo=archlinux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-58E1FF?style=flat&logo=hyprland&logoColor=111111)](https://hyprland.org/)
[![Wayland](https://img.shields.io/badge/Wayland-FFBC00?style=flat&logo=linux&logoColor=111111)](https://wayland.freedesktop.org/)
[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=flat&logo=neovim&logoColor=white)](https://neovim.io/)
[![tmux](https://img.shields.io/badge/tmux-1BB91F?style=flat&logo=tmux&logoColor=white)](https://github.com/tmux/tmux)
[![Yazi](https://img.shields.io/badge/Yazi-111111?style=flat&logo=files&logoColor=white)](https://yazi-rs.github.io/)

## Screenshots

![Hyprland desktop](assets/desktop.webp)

![Rofi launcher](assets/rofi.webp)

![Neovim editing Hyprland config](assets/neovim.webp)

## Contents

- `hypr/` — modular Hyprland Lua configuration and Hyprpaper configuration.
- `waybar/` — status bar for audio, workspaces, keyboard layout, network, system information, and battery levels.
- `nvim/` — Lazy.nvim-based configuration with language tooling, completion, navigation, Git integration, and UI plugins.
- `tmux/` — `Ctrl-a` prefix, vi copy mode, Wayland clipboard integration, Vim-style pane navigation, and TPM plugins.
- `yazi/` — terminal file manager with hidden files, PDF text previews, and file-opening rules.
- `rofi/` — compact application launcher using `drun` mode.
- `alacritty/` — terminal configuration with live reload, OSC52 clipboard support, and a Bash login shell.
- `mako/` — top-right notification daemon configuration.

## Hyprland

The Hyprland configuration uses the Lua configuration API introduced in Hyprland 0.55.

The main entrypoint is:

```text
hypr/hyprland.lua
```

Configuration is split into modules under `hypr/config/`. Keybindings are grouped further under `hypr/config/bindings/`.

Hyprpaper still uses its own configuration format:

```text
hypr/hyprpaper.conf
```

## Installation

There is no installation script. Link or copy each configuration manually.

Expected locations:

```text
~/.config/hypr
~/.config/waybar
~/.config/nvim
~/.config/rofi
~/.config/alacritty
~/.config/mako
~/.config/yazi
~/.tmux.conf
```

Example symlinks from the repository root:

```bash
ln -s "$PWD/hypr" ~/.config/hypr
ln -s "$PWD/waybar" ~/.config/waybar
ln -s "$PWD/nvim" ~/.config/nvim
ln -s "$PWD/rofi" ~/.config/rofi
ln -s "$PWD/alacritty" ~/.config/alacritty
ln -s "$PWD/mako" ~/.config/mako
ln -s "$PWD/yazi" ~/.config/yazi
ln -s "$PWD/tmux/tmux.conf" ~/.tmux.conf
```

## Machine-specific settings

Review these files before linking:

- `hypr/config/monitors.lua`
- `hypr/config/variables.lua`
- `hypr/config/bindings/media.lua`
- `hypr/config/windows.lua`
- `hypr/hyprpaper.conf`
- `waybar/config`

## Required packages

Desktop packages:

```text
hyprland hyprpaper hyprpolkitagent waybar rofi alacritty mako tmux yazi firefox
wl-clipboard cliphist grim slurp swappy brightnessctl wireplumber pulsemixer
bottom zathura sxiv file-roller
```

Neovim and development tooling:

```text
neovim git make ripgrep fd nodejs npm python python-pip jdk-openjdk
black isort flake8 clang clang-tools-extra google-java-format stylua shfmt shellcheck
```

Package names may differ outside Arch Linux.

## Not included

- Secrets or tokens
- SSH configuration
- Browser profiles
- Wallpaper files
- Full-system package manifest
- Machine bootstrap script
