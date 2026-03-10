function zz --description "Attach to a zellij session interactively or by name"
    if set -q argv[1]
        zellij attach $argv[1]
    else
        zellij list-sessions -s | fzf --print-query | tail -1 | read -l session
        and zellij attach $session
    end
end
