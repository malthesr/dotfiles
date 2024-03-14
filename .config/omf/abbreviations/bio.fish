function __subcmd -a cmd abbr subcmd
    string match --quiet "$cmd $abbr " -- (commandline -j); or return 1
    echo "$subcmd"
end

function __create_abbrs -a cmd_dfn subcmd_dfns
    echo $cmd_dfn | read -d = -l abbr cmd
    abbr -a $abbr $cmd
    for dfn in (string split , $subcmd_dfns)
        echo $dfn | read -d = -l abbr subcmd
        set fn __{$cmd}_{$abbr}_{$subcmd}
        function $fn -V cmd -V abbr -V subcmd
            __subcmd $cmd $abbr $subcmd
        end
        abbr -a $fn --position anywhere -r $abbr -f $fn
    end
end

__create_abbrs bcf=bcftools v=view,h=head,q=query
__create_abbrs nf=nextflow r=run 
