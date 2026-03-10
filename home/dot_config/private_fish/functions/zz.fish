function zz --description "Attach to a zellij session interactively or by name"
    if set -q argv[1]
        zellij attach --create $argv[1]
    else
        zellij list-sessions -s | fzf | read -l session
        and zellij attach $session
    end
end
