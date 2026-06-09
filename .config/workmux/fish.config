if status is-interactive
    if not functions -q fisher
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
        fisher install jorgebucaran/fisher jhillyerd/plugin-git jorgebucaran/hydro
    end

    set -g hydro_color_pwd blue
    set -g hydro_color_git green
    set -g hydro_color_prompt green
    set -g hydro_color_error red
    set -g hydro_color_duration yellow

    set -g fish_prompt_pwd_dir_length 0
end
