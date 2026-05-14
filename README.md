# Dotfiles

My personal Hyprland dotfiles managed with GNU Stow.

## System

| Component | Tool |
|-----------|------|
| WM | [Hyprland](https://hyprland.org/) |
| Bar | [Waybar](https://github.com/Alexays/Waybar) |
| Terminal | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| Shell | [Fish](https://fishshell.com/) |
| Launcher | [Rofi](https://github.com/davatorium/rofi) |
| Wallpaper | [awww](https://github.com/LGFae/swww) |
| Theming | [pywal](https://github.com/dylanaraps/pywal) |
| Notifications | [Dunst](https://dunst-project.org/) |
| File Manager | [Yazi](https://github.com/sxyazi/yazi) |

## Structure

```
dotfiles/
├── dunst/       # Dunst notification config
├── fish/        # Fish shell config
├── hypr/        # Hyprland + hyprpaper config + scripts
├── kitty/       # Kitty terminal config
├── rofi/        # Rofi launcher config
├── wal/         # pywal templates
├── waybar/      # Waybar config and scripts
└── yazi/        # Yazi file manager config
```

## Installation

### Prerequisites

```bash
# Arch Linux
yay -S hyprland waybar kitty fish rofi-wayland awww-git python-pywal dunst yazi stow
```

### Setup

```bash
# Clone the repo
git clone git@github.com:RahmanYazid/Dotfiles-may-2026.git ~/dotfiles

# Stow all packages
cd ~/dotfiles
stow hypr waybar kitty fish rofi wal dunst yazi
```

## Theme Switching

Themes are generated automatically from wallpapers using pywal. To switch theme:

Press `Super + W` to open the wallpaper picker via Rofi. The colorscheme will be applied to all components automatically.

To restore the last wallpaper on login, the following is set in `hyprland.conf`:

```
exec-once = bash ~/.config/hypr/scripts/restore-wallpaper.sh
```

## Keybinds

| Keybind | Action |
|---------|--------|
| `Super + Return` | Open terminal |
| `Super + W` | Theme switcher |
| `Super + Shift + W` | Set default wallpaper |
| `Super + E` | File manager (Yazi) |
