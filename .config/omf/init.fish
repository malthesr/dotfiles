### GENERAL ###

# Source aliases
set aliasconfig $OMF_CONFIG/aliases.fish
source $aliasconfig

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
