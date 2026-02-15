function update
    if test -e ~/.config/home-manager/flake.nix
        set_color --bold green
        echo "Updating home-manager flake"
        set_color normal

        nix flake update --flake ~/.config/home-manager
        
        set_color --bold green
        echo
        echo "Switching config"
        set_color normal

        home-manager switch
    end
end