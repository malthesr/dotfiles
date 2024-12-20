function fish_prompt
    set -l last_status $status

    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showcolorhints 1

    set -g __fish_git_prompt_color_untrackedfiles $fish_color_status
    set -g __fish_git_prompt_char_untrackedfiles '?'

    set -g __fish_git_prompt_color_invalidstate $fish_color_error
    set -g __fish_git_prompt_char_invalidstate '!'

    set -g __fish_git_prompt_color_dirtystate $fish_color_status
    set -g __fish_git_prompt_char_dirtystate '*'

    set -g __fish_git_prompt_color_stagedstate $fish_color_status
    set -g __fish_git_prompt_char_stagedstate '+'

    set -g __fish_git_prompt_color_branch $fish_color_normal
    set -g __fish_git_prompt_char_cleanstate ''

    set -g __fish_git_prompt_color_branch_dirty $fish_color_status
    set -g __fish_git_prompt_color_branch_staged $fish_color_status

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    echo -n (fish_git_prompt)

    if test $last_status -ne 0
        set_color $fish_color_error
    end
    echo -n ' > '
    set_color normal
end
