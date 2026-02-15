set -g fish_key_bindings fish_vi_key_bindings

# Additional readline keybinds for vi insert mode
bind --user -M insert \ca beginning-of-line
bind --user -M insert \ce end-of-line
bind --user -M insert \ch backward-delete-char
bind --user -M insert \cp up-or-search
bind --user -M insert \cn down-or-search
bind --user -M insert \cf forward-char
bind --user -M insert \cb backward-char
bind --user -M insert \ct transpose-chars
bind --user -M insert \cg cancel
bind --user -M insert \cz undo
bind --user -M insert \cZ redo
bind --user -M insert \eb prevd-or-backward-word
bind --user -M insert \ef nextd-or-forward-word
