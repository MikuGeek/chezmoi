#!/bin/sh

tools="fish (modern shell)
gh (github cli)
eza (modern ls)
fzf (fuzzy finder)
fd (find)
rg (grep)
zoxide (directory jumper)
dust (disk usage)
btop (system monitor)
bat (better cat)
prettyping (better ping)
yazi (file manager)
httpie (better curl)
starship (commandline prompt)
lazydocker (docker UI)
lazygit (git UI)
zellij (terminal multiplexer)"

echo "$tools" | while IFS=' ' read -r name description; do
    # Remove parentheses from description
    description=$(echo "$description" | sed 's/[()]//g')

    if command -v "$name" >/dev/null 2>/dev/null; then
        echo "✅ $name ($description) is installed"
    else
        echo "❌ $name ($description) is not installed"
    fi
done