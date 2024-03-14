abbr -a b 'bat'
abbr -a c 'cargo'
abbr -a j 'just'
abbr -a z 'zellij'
abbr -a h 'helix'
abbr -a t 'tmux'
abbr -a dotf 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
abbr -a jl 'julia --banner=no --threads 4'
abbr -a md 'mkdir -p'
abbr -a pg 'less -S'
abbr -a o 'xdg-open'
abbr -a py 'python3 -q'
abbr -a R 'R --quiet --no-save'
abbr -a snk 'python3 -m snakemake -p --use-conda'
abbr -a xcp 'xclip -selection clipboard -in'

if command -v ls > /dev/null
    abbr -a l 'eza'
    abbr -a ll 'eza -l'
    abbr -a tree 'eza --tree --git-ignore'
else
    abbr -a l 'ls'
    abbr -a ll 'ls -l'
end

