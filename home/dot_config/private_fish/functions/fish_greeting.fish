function fish_greeting
    for tool in $recommended_tools
        if not type -q $tool
            echo -n "Missing tool "
            set_color red
            echo $tool
            set_color normal
        end
    end
end
