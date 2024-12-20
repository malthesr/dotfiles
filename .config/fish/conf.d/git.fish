abbr -a gd "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
abbr -a g "git"

set -l abbrs \
    s,"status" \
    sh,"show" \
    st,"stash" \
    a,"add" \
    aa,"add --all" \
    au,"add --update" \
    apa,"add --patch" \
    b,"branch" \
    c,"commit -v" \
    c!,"command -v --amend" \
    co,"checkout" \
    p,"push" \
    pl,"pull" \
    rb,"rebase" \
    rba,"rebase --abort" \
    rbc,"rebase --continue" \
    rbi,"rebase --interactive" \
    rmc,"rm --cached"

for abbr in $abbrs
    echo $abbr | read -d , abbr expansion
    abbr --command git $abbr "$expansion"
end


