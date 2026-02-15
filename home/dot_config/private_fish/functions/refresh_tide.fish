# run on new install
function refresh_tide
    tide configure  \
        --auto  \
        --style=Lean \
        --prompt_colors='True color' \
        --show_time='24-hour format' \
        # --lean_prompt_height='One line' \
        --lean_prompt_height='Two lines' \
        --prompt_connection='Disconnected' \
        --prompt_spacing=Compact \
        --icons='Few icons' \
        --transient=No

    set -U tide_left_prompt_items context pwd git jj newline character
    set -U tide_right_prompt_items status cmd_duration jobs direnv kubectl toolbox terraform nix_shell time vi_mode
    set -U tide_git_truncation_length 50
end
