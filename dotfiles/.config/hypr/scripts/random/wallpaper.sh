#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/hypr/wallpapers" 

CURRENT_WALL=$(hyprctl hhyprpaper listloaded)

ALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

if [ -z "$WALLPAPER" ]; then
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | shuf -n 1)
fi

if [ -z "$WALLPAPER" ]; then
    echo "Error: No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

hyprctl hyprpaper reload ,"$WALLPAPER"