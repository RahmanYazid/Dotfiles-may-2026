#!/bin/bash

CACHE_FILE="$HOME/.cache/wal/current-wallpaper"

# Tunggu hyprpaper siap
sleep 1

# Cek apakah ada wallpaper tersimpan
if [ ! -f "$CACHE_FILE" ]; then
    echo "No saved wallpaper found."
    exit 0
fi

WALLPAPER=$(cat "$CACHE_FILE")

# Cek apakah file wallpaper masih ada
if [ ! -f "$WALLPAPER" ]; then
    echo "Wallpaper file not found: $WALLPAPER"
    exit 1
fi

# Restore pywal colorscheme
wal -R -n

awww img "$WALLPAPER" --transition-type wipe --transition-duration 1

echo "Wallpaper restored: $WALLPAPER"
