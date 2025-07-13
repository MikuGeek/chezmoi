function homebrew_mirror_set
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
    export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
    # Tap USTC mirrors for cask and services
    # brew tap --custom-remote --force homebrew/cask https://mirrors.ustc.edu.cn/homebrew-cask.git
    # brew tap --custom-remote --force homebrew/services https://github.com/Homebrew/homebrew-services
end
