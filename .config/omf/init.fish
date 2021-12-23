### THEME CONFIG ###

set -xg pure_symbol_prompt 'δ'
set -xg pure_symbol_reverse_prompt 'λ'
set -xg pure_enable_single_line_prompt true
set -xg pure_color_success $pure_color_primary
set -xg pure_color_command_duration $pure_color_primary
set -xg pure_show_jobs true

### ALIASES ###

# Vi mode
fish_vi_key_bindings

# Dot files
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotfst='dotfiles status'
alias dotfc='dotfiles commit'
alias dotfa='dotfiles add'

# General aliases
function dotf --wraps git
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

function z --wraps zellij
    zellij $argv
end

function l --wraps exa
    exa $argv
end
    
function c --wraps bat
    bat $argv
end
