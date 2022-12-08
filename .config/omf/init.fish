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

# Global variables

set -xg EDITOR hx

# Prompt 

set promptcfg $OMF_CONFIG/prompt.fish
source $promptcfg
