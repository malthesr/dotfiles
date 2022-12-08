function fish_prompt
    set -l last_status $status

    set -q $machine or set -g machine $hostname

    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showcolorhints 1

    set -g __fish_git_prompt_color_untrackedfiles yellow
    set -g __fish_git_prompt_char_untrackedfiles '?'

    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_char_invalidstate '!'

    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_char_dirtystate '*'

    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_char_stagedstate '+'

    set -g __fish_git_prompt_color_branch green
    set -g __fish_git_prompt_char_cleanstate ''

    set -g __fish_git_prompt_color_branch_dirty red
    set -g __fish_git_prompt_color_branch_staged yellow

    set_color $fish_color_cwd

    printf '%s:%s' $machine (prompt_pwd)
    set_color normal

    echo -n (fish_git_prompt)
    # echo -n (fish_mode_prompt_custom)

    if test $last_status -ne 0
        set_color red
    end

    echo -n ' > '
    set_color normal
end

function fish_mode_prompt_custom
    switch $fish_bind_mode
    case default
        set_color blue
        echo -n ' N'
    case insert
        set_color green
        echo -n ' I'
    case replace_one
        set_color magenta
        echo -n ' R'
    case visual
        set_color yellow
        echo -n ' V'
    case '*'
        set_color red
        echo -n ' ?'
    end
    set_color normal
end

# Unbind to enable moving position of mode away from start
function fish_mode_prompt
end