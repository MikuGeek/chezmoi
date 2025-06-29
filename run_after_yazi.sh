#!/bin/sh

# Remove plugins directory
if [ -d "$HOME/.config/yazi/plugins" ]; then
  rm -rf "$HOME/.config/yazi/plugins"
  echo "Removed plugins directory"
fi

# Remove flavors directory
if [ -d "$HOME/.config/yazi/flavors" ]; then
  rm -rf "$HOME/.config/yazi/flavors"
  echo "Removed flavors directory"
fi

# Update Yazi packages
ya pack -u
