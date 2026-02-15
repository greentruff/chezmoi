function l --wraps='eza' --description 'Brief file listing'
    if type -q eza
        eza $argv
    else
        ls $argv
    end
end