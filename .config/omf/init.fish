### THEME CONFIG ###

set -xg pure_enable_single_line_prompt true

### ALIASES ###

# Vi mode
fish_vi_key_bindings

# Dot files
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotfst='dotfiles status'
alias dotfc='dotfiles commit'
alias dotfa='dotfiles add'

# General aliases
function hx --wraps helix
    helix $argv
end

function z --wraps zellij
    zellij $argv
end

function dotf --wraps git
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

function l --wraps exa
    exa $argv
end