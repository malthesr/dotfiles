# Run tmux if it exists, shell is interactive, and not already in tmux session
if type -q tmux && status --is-interactive && not string match -rq tmux $TERM
    tmux new-session
end
