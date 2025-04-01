if status is-interactive
    # Commands to run in interactive sessions can go here
    # Default Editor
    set -x EDITOR nvim
    # fzf Customization
    set -Ux FZF_DEFAULT_OPTS "\
      --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
      --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
      --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
      --color=selected-bg:#51576d \
      --color=border:#414559,label:#c6d0f5 \
      --layout=reverse --height=60%"
    set -Ux FZF_DEFAULT_COMMAND "fd --exclude=/
      {.git,.idea,.vscode,.sass-cache,node_modules,build,.DS_Store} --type f"
    # fzf Integration, set the keybindings.
    fzf --fish | source
    # zoxide Integration
    zoxide init fish | source
    # Startship Integration
    starship init fish | source
    # Common Aliases
    alias n="nvim"
    alias lg0="lazygit"
    alias ld0="lazydocker"
    alias pp0="prettyping"

    alias e="eza -alh"
    alias e0a="eza -a"
    alias e0t="eza -T"
    # Tailscale Integration
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
end
