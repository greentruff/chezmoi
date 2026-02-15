function la --wraps='eza' --description 'Short file listing with hidden files'
    if type -q eza
        eza --all $argv
    else
        ls -a $argv
    end
end