abbr -a bcf "bcftools"

set -l abbrs \
    v,"view" \
    vh,"view --no-header" \
    q,"query" \
    ql,"query --list-samples" \
    i,"index" \
    in,"index --nrecords" \
    a,"annotate" \
    c,"concat"

for abbr in $abbrs
    echo $abbr | read -d , abbr expansion
    abbr --command bcftools $abbr "$expansion"
end


