function ll --wraps='eza' --description 'Long file listing'
    if command -sq eza
        eza -l --git --group-directories-first $argv
    else
        ls -lh $argv
    end
end