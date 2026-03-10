function zc --description "Start a zellij session with the code layout"
    zellij --layout code attach --create (basename $PWD)
end
