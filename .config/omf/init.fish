# Source abbreviations
set abbrcfg $OMF_CONFIG/abbreviations.fish
source $abbrcfg

# Source functions
set fncfg $OMF_CONFIG/functions.fish
source $fncfg

# Source machine-specific config
set localconfig $OMF_CONFIG/local.fish
if not test -f $localconfig
    touch $localconfig
 end
source $localconfig

# Vi mode
fish_vi_key_bindings
set -g fish_cursor_default block blink
set -g fish_cursor_insert line blink
set -g fish_cursor_replace_one underscore blink
set -g fish_cursor_visual block

# Global variables

set -xg EDITOR helix
set -xg PAGER 'less -S' 
set -xg R_HISTFILE $HOME/.Rhistory

# Prompt 

set -U fish_greeting ""
set promptcfg $OMF_CONFIG/prompt.fish
source $promptcfg
