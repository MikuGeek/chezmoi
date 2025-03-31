#!/bin/bash

# Set the themes directory
THEMES_DIR="$HOME/.config/bat/themes"

# Create themes directory if it doesn't exist
mkdir -p "$THEMES_DIR"

# Function to check if a theme exists
theme_exists() {
    [ -f "$THEMES_DIR/$1" ]
}

# Function to download a theme
download_theme() {
    local theme_name=$1
    local url="https://raw.githubusercontent.com/catppuccin/bat/main/themes/$theme_name"
    echo "Downloading $theme_name..."
    curl -s "$url" > "$THEMES_DIR/$theme_name"
}

# Check and download themes if they don't exist
if ! theme_exists "Catppuccin Latte.tmTheme"; then
    download_theme "Catppuccin%20Latte.tmTheme"
fi

if ! theme_exists "Catppuccin Frappe.tmTheme"; then
    download_theme "Catppuccin%20Frappe.tmTheme"
fi

echo "Catppuccin themes setup complete!"