#!/bin/sh

tools="fish (modern shell)
eza (modern ls)
fzf (fuzzy finder)
zoxide (directory jumper)
dust (disk usage)
btop (system monitor)
bat (better cat)
prettyping (better ping)
yazi (file manager)
httpie (better curl)
starship (commandline prompt)
lazydocker (docker UI)
lazygit (git UI)"

echo "----------------------------------------"
echo "Checking modern CLI tool alternatives"
echo "----------------------------------------"

echo "$tools" | while IFS=' ' read -r name description; do
    # Remove parentheses from description
    description=$(echo "$description" | sed 's/[()]//g')

    if command -v "$name" >/dev/null 2>&1; then
        echo "✅ $name ($description) is installed"
    else
        echo "❌ $name ($description) is not installed"
    fi
done

echo "----------------------------------------"
echo "Install By Homebrew"
echo "----------------------------------------"

echo "$tools" | while IFS=' ' read -r name _; do
    if ! command -v "$name" >/dev/null 2>&1; then
        echo "brew install $name"
    fi
done