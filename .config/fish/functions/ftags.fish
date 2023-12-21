function ftags -d "Search ctags with preview"
    if test -e 'tags'
        # set -l line $(awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags | fzf --nth=1,2 --with-nth=2 --preview-window="50%" --preview="bat {3} --color=always | tail -n +\$(echo {4} | tr -d \";\\\"\")")
        set -l line $(awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags | fzf --nth=1,2 --with-nth=2 --preview-window="50%" --preview="bat {3} --color=always")
        set -l file $(echo $line | awk '{print $3}')
        $EDITOR $file
    end
end
