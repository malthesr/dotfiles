### GENERAL ###

# Source machine-specific config

set localconfig $OMF_CONFIG/local.fish
if not test -f $localconfig
    touch $localconfig
 end
source $localconfig

# Vi mode
fish_vi_key_bindings

# Global variables

set -xg EDITOR hx

### THEME CONFIG ###

set -xg pure_symbol_prompt 'δ'
set -xg pure_symbol_reverse_prompt 'λ'
set -xg pure_enable_single_line_prompt true
set -xg pure_color_success $pure_color_primary
set -xg pure_color_command_duration $pure_color_primary
set -xg pure_show_jobs true

### ALIASES ###

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

function md --wraps mkdir
    mkdir -p $argv
end
