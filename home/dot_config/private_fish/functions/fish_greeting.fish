function fish_greeting
    for tool in $recommended_tools
        if not type -q $tool
            echo -n "Missing tool "
            set_color red
            echo $tool
            set_color normal
        end
    end

    set hm_lock "$HOME/.config/home-manager/flake.lock"
    if type -q home-manager && test -e $hm_lock 
        set lock_epoch (stat -c %Y $hm_lock)
        set now (date +%s)
        set age_days (math "($now - $lock_epoch) / 86400")

        if test $age_days -ge 7
            echo "home-manager last updated $age_days days ago — run $(set_color --bold brwhite)update"
            set_color normal
        end
    end
end