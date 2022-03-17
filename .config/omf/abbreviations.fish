abbr --add b 'bat'
abbr --add c 'cargo'
abbr --add dotf 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
abbr --add jl 'julia --banner=no --threads 4'
abbr --add md 'mkdir -p'
abbr --add pg 'less -S'
abbr --add o 'xdg-open'
abbr --add py 'python3 -q'
abbr --add R 'R --quiet --no-save'
abbr --add snk 'python3 -m snakemake -p'
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
