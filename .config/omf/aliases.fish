function dotf --wraps git
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

function z --wraps zellij
    zellij $argv
end

function l --wraps exa
    exa $argv
end

function tree --wraps exa   
    exa --tree --git-ignore $argv
end
    
function c --wraps bat
    bat $argv
end

function md --wraps mkdir
    mkdir -p $argv
end

function take
    mkdir -p $argv[1] && cd $argv[1]
end

function pg --wraps less
    less -S $argv
end

function snk --wraps snakemake
    nice snakemake -p $argv
end

