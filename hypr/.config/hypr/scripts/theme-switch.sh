#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Pilih wallpaper dengan rofi
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | \
    rofi -dmenu \
         -i \
         -p "Wallpaper" \
         -theme-str 'window {width: 50%;}' \
         -display-column-separator "/" \
         -show-icons)

# Batalkan jika tidak ada yang dipilih
[ -z "$WALLPAPER" ] && exit 0

# Set wallpaper dan generate colorscheme dengan pywal
wal -i "$WALLPAPER"

# Simpan path wallpaper terakhir
echo "$WALLPAPER" > "$HOME/.cache/wal/current-wallpaper"

# Set wallpaper via swww
awww img "$WALLPAPER" --transition-type wipe --transition-duration 1

# Reload waybar
pkill waybar
waybar &

# Reload rofi colors (pywal sudah generate ~/.config/rofi/colors.rasi)
# Pastikan config rofi import @/home/$USER/.cache/wal/colors-rofi-dark.rasi

# Reload kitty (kirim signal ke semua instance)
kitty @ --to unix:/tmp/kitty.sock set-colors --all ~/.cache/wal/colors-kitty.conf

# Reload hyprland colors jika pakai pywal-hyprland atau source colors
sleep 0.5
COLOR1=$(grep 'color1 ' ~/.cache/wal/colors-hyprland.conf | awk '{print $3}' | sed 's/rgb(\(.*\))/rgba(\1ff)/')
COLOR2=$(grep 'color2 ' ~/.cache/wal/colors-hyprland.conf | awk '{print $3}' | sed 's/rgb(\(.*\))/rgba(\1ff)/')
BG=$(grep 'background ' ~/.cache/wal/colors-hyprland.conf | awk '{print $3}' | sed 's/rgb(\(.*\))/rgba(\1ff)/')
hyprctl keyword general:col.active_border "$COLOR1 $COLOR2 45deg"
hyprctl keyword general:col.inactive_border "$BG"

echo "Theme switched to: $WALLPAPER"
