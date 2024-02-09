abbr --add b 'bat'
abbr --add c 'cargo'
abbr --add j 'just'
abbr --add z 'zellij'
abbr --add h 'helix'
abbr --add t 'tmux'
abbr --add dotf 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
abbr --add jl 'julia --banner=no --threads 4'
abbr --add md 'mkdir -p'
abbr --add pg 'less -S'
abbr --add o 'xdg-open'
abbr --add py 'python3 -q'
abbr --add R 'R --quiet --no-save'
abbr --add snk 'python3 -m snakemake -p --use-conda'
abbr --add xcp 'xclip -selection clipboard -in'

if command -v ls > /dev/null
    abbr --add l 'eza'
    abbr --add ll 'eza -l'
    abbr --add tree 'eza --tree --git-ignore'
else
    abbr --add l 'ls'
    abbr --add ll 'ls -l'
end

