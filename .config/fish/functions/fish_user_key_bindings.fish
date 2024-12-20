function fish_user_key_bindings
    fish_vi_key_bindings

    for mode in default insert
        bind -M $mode \cf accept-autosuggestion
        bind -M $mode \ce edit_command_buffer
        bind -M $mode \cu history-token-search-backward
        bind -M $mode \cp __fish_paginate
        bind -M $mode \cq __fish_toggle_comment_commandline
        bind -M $mode \cr history-pager

        bind -M $mode \cl nextd-or-forward-word
        bind -M $mode \ch prevd-or-backward-word
        bind -M $mode \ck up-or-search
        bind -M $mode \cj down-or-search

        bind -M $mode \cs "fish_commandline_prepend sudo"
    end
end
