abbr -a c 'cargo'
abbr -a j 'just'
abbr -a h 'hx'
abbr -a t 'tmux'
abbr -a z 'zellij'
abbr -a jl 'julia --banner=no --threads 4'
abbr -a py 'python3 -q'
abbr -a r 'R --quiet --no-save'

abbr -a md 'mkdir -p'

if command -v eza > /dev/null
    abbr -a l 'eza'
    abbr -a ls 'eza'
    abbr -a ll 'eza -l'
    abbr -a tree 'eza --tree --git-ignore'
else
    abbr -a l 'ls'
    abbr -a ll 'ls -l'
end

function subabbr -d "Subcommand abbreviation" -a cmd abbr subcmd
    # Currently, subcommand abbreviations clash with command position
    # abbreviations; to work around this, use `--regex` to identify expansion
    # and assign command-specific ID to abbreviation,
    # cf. https://github.com/fish-shell/fish-shell/pull/10452
    set -l id __{$cmd}_{$abbr}
    abbr --add --command $cmd --regex $abbr $id $subcmd
end

function subabbrs -d "Multiple subcommand abbreviations"
    set -l cmd $argv[1]
    set -e argv[1]
    set -l lst $argv
    for item in $lst    
        echo $item | read -l -d "=" abbr subcmd
        subabbr $cmd $abbr $subcmd
    end
end

abbr -a g "git"
abbr -a gd "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
subabbrs git \
    "a=add" \
    "aa=add --all" \
    "apa=add --patch" \
    "au=add --update" \
    "b=branch" \
    "c=commit -v" \
    "cl=clone" \
    "cl1=clone --depth 1" \
    "co=checkout" \
    "c!=commit -v --amend" \
    "d=diff" \
    "p=push" \
    "pl=pull" \
    "rb=rebase" \
    "rba=rebase --abort" \
    "rbc=rebase --continue" \
    "rbi=rebase --interactive" \
    "rmc=rm --cached" \
    "rs=restore --staged" \
    "s=status" \
    "sh=show" \
    "st=stash"

abbr -a bcf "bcftools"
subabbrs bcftools \
    "v=view" \
    "vh=view --no-header" \
    "q=query" \
    "ql=query --list-samples" \
    "i=index" \
    "in=index --nrecords" \
    "a=annotate" \
    "c=concat"

abbr -a nf "nextflow"
subabbrs nextflow \
    "r=run" \
    "rm=run main.nf"

