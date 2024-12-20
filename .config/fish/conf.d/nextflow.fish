abbr -a nf "nextflow"

set -l abbrs \
    r,"run" \
    rm,"run main.nf"

for abbr in $abbrs
    echo $abbr | read -d , abbr expansion
    abbr --command nextflow $abbr "$expansion"
end




