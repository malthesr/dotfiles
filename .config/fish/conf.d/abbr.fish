abbr -a c 'cargo'
abbr -a j 'just'
abbr -a h 'hx'
abbr -a t 'tmux'
abbr -a z 'zellij'
abbr -a jl 'julia --banner=no --threads 4'
abbr -a md 'mkdir -p'
abbr -a o 'xdg-open'
abbr -a py 'python3 -q'
abbr -a r 'R --quiet --no-save'

if command -v eza > /dev/null
    abbr -a l 'eza'
    abbr -a ls 'eza'
    abbr -a ll 'eza -l'
    abbr -a tree 'eza --tree --git-ignore'
else
    abbr -a l 'ls'
    abbr -a ll 'ls -l'
end
