function __fish_tldr
    # Get all commandline tokens not starting with "-", up to and including the cursor's
    set -l args (string match -rv '^-|^$' -- (commandline -cpx && commandline -t))

    # If commandline is empty, exit.
    if not set -q args[1]
        printf \a
        return
    end

    # Skip leading commands and display the tldr page of following command
    while set -q args[2]
        and string match -qr -- '^(and|begin|builtin|caffeinate|command|doas|entr|env|exec|if|mosh|nice|not|or|pipenv|prime-run|setsid|sudo|systemd-nspawn|time|watch|while|xargs|.*=.*)$' $args[1]
        set -e args[1]
    end

    # Call tldr with the command and subcommand(s).
    # tldr handles subcommands like "git commit" gracefully.
    if command tldr $args &>/dev/null
        command tldr $args
    else
        printf \a
    end

    commandline -f repaint
end
