bind -M insert \cf accept-autosuggestion
bind -M insert \ce edit_command_buffer
bind -M insert \cu history-token-search-backward
bind -M insert \cp __fish_paginate
bind -M insert \cq __fish_toggle_comment_commandline
bind -M insert -k nul 'clear; commandline -f repaint'

bind -M insert \cl nextd-or-forward-word
bind -M insert \ch prevd-or-backward-word
bind -M insert \ck up-or-search
bind -M insert \cj down-or-search

bind -M insert \cs "fish_commandline_prepend sudo"
