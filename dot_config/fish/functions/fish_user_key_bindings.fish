function fish_user_key_bindings
    bind --preset -M insert alt-h __fish_tldr
    bind --preset alt-h __fish_tldr
    bind --preset -M visual alt-h __fish_tldr

    bind --preset k up-line
    bind --preset j down-line
end
