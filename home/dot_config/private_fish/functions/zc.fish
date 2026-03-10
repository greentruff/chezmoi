function zc --description "Start a zellij session with the code layout"
    zellij --session (basename $PWD) --layout code
end
