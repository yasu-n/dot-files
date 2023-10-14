function fish_prompt --description 'Write out the prompt'
    set -l normal (set_color normal)

    set -l white white --bold

    # Color the prompt differently when we're root
    set -l color_cwd 61AFEF --bold
    set -l suffix '$'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd red --bold
        end
        set suffix '#'
    end

    #echo -n -s (prompt_login) ':' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal $suffix " "
    echo -n -s (set_color $white) "$USER" "@" (prompt_hostname) (set_color $white) ':' (set_color $color_cwd) (prompt_pwd) (set_color $white) $suffix " "
end

function fish_right_prompt -d "Write out the right prompt"
    set -l color_vcs brblack --bold
    echo -n -s (set_color $color_vcs) (fish_vcs_prompt)
end
