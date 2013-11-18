function fish_prompt --description 'Write out the prompt'
    #Save the return status of the previous command
    set stat $status


    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if not set -q __fish_prompt_normal
        set -g __fish_color_normal (set_color normal)
        set -g __fish_color_blue (set_color -o blue)
        set -g __fish_color_grey (set_color white)
        set -g __fish_color_prompt (set_color --bold --underline white)
    end

    #Set the color for the status depending on the value
    set __fish_status ""
    if test $stat -gt 0
        set __fish_status (set_color red)"($stat)"
    end

    switch $USER

        case root

        if not set -q __fish_prompt_cwd
            if set -q fish_color_cwd_root
                set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
            else
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
        end

        printf '%s@%s %s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_color_normal"

        case '*'

        if not set -q __fish_prompt_cwd
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end

        printf '%s[%s] %s%s@%s %s%s %s\f\r%s>%s '  \
          $__fish_color_grey (date "+%H:%M:%S") \
          $__fish_color_blue $USER $__fish_prompt_hostname \
          $__fish_prompt_cwd  (pwd) \
          $__fish_status \
          $__fish_color_prompt $__fish_color_normal
    end
end
