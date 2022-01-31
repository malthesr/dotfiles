abbr --add b 'bat'
abbr --add c 'cargo'
abbr --add dotf 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
abbr --add md 'mkdir -p'
abbr --add pg 'less -S'
abbr --add o 'xdg-open'
abbr --add snk 'snakemake -p'
abbr --add xcp 'xclip -selection clipboard -in'

if command -v exa > /dev/null
    abbr --add l 'exa'
    abbr --add ls 'exa'
    abbr --add ll 'exa -l'
    abbr --add tree 'exa --tree --git-ignore'
else
    abbr --add l 'ls'
    abbr --add ll 'ls -l'
end
