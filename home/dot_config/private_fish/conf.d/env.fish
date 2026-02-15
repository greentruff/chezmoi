set -gx LANG 'en_US.UTF-8'

# Prompt: hydro config
set -g hydro_color_pwd brblue
set -g hydro_color_pwd green


if type -q nvim
    set -gx EDITOR 'nvim'
else if type -q vi
    set -gx EDITOR 'vi'
end
set -gx VISUAL $EDITOR

if type -q bat
    set -gx BAT_STYLE plain
    #  Use for manpages
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

if test -d /opt/homebrew/opt/imagemagick
    set -gx MAGICK_HOME /opt/homebrew/opt/imagemagick
end