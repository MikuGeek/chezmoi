#!/bin/bash

# Set the themes directory
THEMES_DIR="$HOME/.config/btop/themes"

# Create themes directory if it doesn't exist
mkdir -p "$THEMES_DIR"

# Function to check if a theme exists
theme_exists() {
    [ -f "$THEMES_DIR/$1" ]
}

# Function to download a theme
download_theme() {
    local theme_name=$1
    local url="https://raw.githubusercontent.com/catppuccin/btop/main/themes/$theme_name"
    echo "Downloading $theme_name..."
    curl -s "$url" > "$THEMES_DIR/$theme_name"
}

# Check and download themes if they don't exist
if ! theme_exists "catppuccin_latte.theme"; then
    download_theme "catppuccin_latte.theme"
fi

if ! theme_exists "catppuccin_frappe.theme"; then
    download_theme "catppuccin_frappe.theme"
fi

echo "Catppuccin themes setup complete!"
